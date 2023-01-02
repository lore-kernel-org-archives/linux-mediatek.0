Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF957C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KweryTtq8+uHIP3/pHRBLapsXhTjMTF4J95i0YtAp5A=; b=E99r5pov9aq9EYf5SnI9jeDXml
	ioTU/H1sc0k+DP5Estyna9MP7OzUj0AcBJdNYcGqa4XYkB1e0/1HxwNKhN0nzJrC/qpBvXRqvoLy4
	Z61PwzBPegmfkOWhlrmuXbD05lJ6MLn5zpIrg4tDNMb5XWDxrNf76qDQMT54bEUUg9Bf2ue2U9OJL
	YDplSKB4X4P6R3Sos+ezkc6TfW/L3/q91nbeZ8MSCuPB0tUp447egq1SZxp+UOt7zqx8Aa78n2yuo
	DQnK6MRS9xHB0iyP8vKxwFuzOqZVHGReApll3yreQ43nla1n0MQ5Dkf8balZl1GiUx/8R7X+yq0XJ
	IBP38ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCM4X-00BqlT-64; Mon, 02 Jan 2023 14:45:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCM3o-00BqX3-HV; Mon, 02 Jan 2023 14:45:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C790660036F;
	Mon,  2 Jan 2023 14:45:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672670707;
	bh=hZzDubDOfjY5Ga3zYLkOcQaI4beRQ2l9iv6BFoR5yw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kAj7YMTnwdQw//QfGF2QYf/1/L2CTdOv/9gJz2dXmNs3ucmD9ykQIhSxxzOmhkFEi
	 sq55BBELOnhpMgsTUSU0UGK2Q/qwli/K+d3GTBfZocThk8cUPqm5lkttmpoxCLJN9w
	 0KT9ru4pYvs/obHc6yTyBgzwUH2Hrbmfc7FCO20EthasGIkFop7QiFSTpG/MwWJQvZ
	 9WtenLD3e6vBsHhZgbc1TmO+go009JN3VscX0F9bZshFvZxnrL3JzAmNxGCCGHzW2s
	 Q+v7iwSrmepaQue7ELRk/iGBIQdcURp7CDyQl7UiSjLjYlcUQMjEeXfEsVqoDboUwj
	 p53UyBAbj0wdw==
Message-ID: <fb003af2-ada4-6608-0f66-4bc929a23c69@collabora.com>
Date: Mon, 2 Jan 2023 15:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [V3] media: jpeg: Fixes multi-hw judgement
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com
References: <20221228070006.11111-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221228070006.11111-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_064508_828640_CD8188E9 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/12/22 08:00, Irui Wang ha scritto:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> some chips have multi-hw, but others have only one,
> modify the condition of multi-hw judgement
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>

Please clarify the commit title, as "media: jpeg:" is generic, but you're
touching a driver for MediaTek's JPEG HW dec/encoder.

Change it to "media: mtk-jpeg: Fix jpeghw multi-core judgement", after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

