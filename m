Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C569C46CCD
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAHcF4pe/wqMJxy5RKhSssCNe8WlXWgytfHyT/2Z3Yo=; b=Y+4XZoj03N4bIIwQPVkCVgTazv
	1pJKiEVP1w1AJ/vjr3cge8th3qSk0RbOC/Ijg/oZnSBam2cjUlmMNRojyM10fJAN3r3qMIuD2Lni8
	PczLOBuvViKmO+xH2o1ijLCqj3ozWJXEyvXIq9QTkzy2738YMnWGp3NIKwH1VnJhiCrYBIAtK6pBP
	Mtml9JAE8SAACmMKyOfy+e2T+DgavOBQmttQ9pH9/emqyBPaHOap9hXWcM4VbpHsNfMgsrNCaUw5i
	ZKQvFNCoeNXMGxmysMQxiycR3pUYdnuYIZPo/Pj/XiucRlsG5XtJgqV8l6WzRreRxs8l6mmW5s2jd
	KEN6HejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRF-009y9u-18;
	Mon, 18 Dec 2023 11:05:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRB-009y89-1p;
	Mon, 18 Dec 2023 11:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702897526;
	bh=xwDmKS7uJEVRbmf2Y+FVkHsZ8nVWAj7tspkmAezbR+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvDJnTcZyYhbPnxOoJ887HRdx+BQ4k5hq2tP3JkfEvQv32sY4xNEojnFhRBjF7B2X
	 c6pdC1DTADv939XtEZm6JjZVT9sHVOKbCRty0aIjmYkG3mF6SK7gOS48F14rddcalg
	 QBc8n7YVdLXbFY4iccIwt3j0Ue7yLXY9W64FP9P8JUiVxBHyeNuorusxj7mv0utRF9
	 kbgFQ8rM43tQSBMODYyDbGy/QsXGUeEiqlFP5sPoKrFMvbE2e/Anlr5Kt/zAnVDKVX
	 LHeSL6Z3HZIkQ7D/5df8PpU9pm59rAiwy3j+9RlSJFZF7R8qG+mB4ifHXiBb/pB9H9
	 OQ4U1eOkF6GWQ==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E94B37813F7;
	Mon, 18 Dec 2023 11:05:26 +0000 (UTC)
Message-ID: <0ff37f8a-5531-46cc-b078-60843bb753a2@collabora.com>
Date: Mon, 18 Dec 2023 12:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: mtk-cmdq: Sort cmdq platform data by
 compatible name
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
 <20231215070026.2507-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231215070026.2507-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030529_753181_E726A108 
X-CRM114-Status: UNSURE (   5.26  )
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

Il 15/12/23 08:00, Jason-JH.Lin ha scritto:
> Sort cmdq platform data according to the number sequence of
> compatible names.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



