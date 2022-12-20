Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFE6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPkQI4RHiLJQdvrPBkPSSbprU/R5JYkzXbf5C97LiHs=; b=dGnd8Gr282a9LYBOx1YM6oWDac
	iyjwALxKjWuuDyL2XsTUm4+UFu61GYE8RGRbh2X+KPLHMu5sdHwAcCTsPExPUX6MmPuRv5QrZ+Fth
	4DiCb7gtjwYvEliVFuL6rRwFGk5wj59C/pYQL9uG4yh4LD85SeQUMKQSlAoberP3sh5h24RPDohUc
	W8jeGgqHcTM7OXyP37x5XlmQiJ6MQPdgqZYb/FNbrNa5mpCVeye1klBOBmHNzZbDPcmH5fw4bbFMk
	PXmIrt/crd7w8XN027gTr3KAbBtqoG4pL3459mlNb+VSuYnN7n95BVnhrkKzi+4itI+1+AzN/Z/dY
	P1/JoybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZBi-00D0at-6y; Tue, 20 Dec 2022 09:45:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yzi-00Ctsa-MI; Tue, 20 Dec 2022 09:33:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25D6D6602C51;
	Tue, 20 Dec 2022 09:33:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671528782;
	bh=YS2viIDnDvMhgbQ5uguPkcplI2ttQaOGwYVyJrHzsl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NLbQf878uirRW7vi/Xi4bL9+wJE7nFdV494eQQySnKzfu1AUL+V+wGaekQl/Z6W0F
	 2EsKaoHDOiSiuHnR4PcO3fFwzEbbTqizPUfsiGCl5B+vnBBpzHKVupqLUcbW+GPuyB
	 xk4dlmoQiI710hhEqsGgoOKsxcVEW5LKB6LLQ53S+QXvHtnLDiCtdaI7rtWbl/KWY8
	 9+JuZ/cmZJpVHaHyhPq8uIeGc0IV64j7/Hi+QMwEyKzpuqjL8Xy0g9ijOTDUMPyDEs
	 BElif6t4TShKqTpxr8YvSnmWKXN9edfOpBkw6T4lzydaDy/oji9fCw2tg0VYQel4Ad
	 qPNGkQ23SzZtw==
Message-ID: <74530fb2-d7c0-c9dc-7ccc-2f1483b57f92@collabora.com>
Date: Tue, 20 Dec 2022 10:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2,7/7] media: mediatek: vcodec: change lat thread decode
 error condition
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
 <20221219064332.2124-8-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221219064332.2124-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_013307_019728_C492E065 
X-CRM114-Status: UNSURE (   8.44  )
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

Il 19/12/22 07:43, Yunfei Dong ha scritto:
> If lat thread can't get lat buffer, it should be that current instance
> don't be schedulded, the driver can't free the src buffer directly.
> 
> Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



