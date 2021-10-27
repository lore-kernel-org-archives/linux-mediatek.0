Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 07:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3969C60F22
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 07:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3969C60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMOWhupngAjiarotWqDgzLwdFGmYFX3BEwgvODiv0mM=; b=CEyoYzajnSAB4aqh7/radrL86A
	TtlVRA22B5+r68dWCMzIc1NBlsha9Pxp7ttSESBSIZEVBJJAONzJG/SA983Q4VaBwq1TRjrVaPYup
	I40d0X1X2Rb1UNmkmP9yCl+aTMuvwrBZMrZMXvndrTCjFi3BfDCzyy1pRWVDFoIG3Np19z/x+ba0f
	yk2QYFKfLM4o5s7WG5Dd2rJvmN9sM23xvzVpSrbiHsbay0zAF52j/ogEITEnL8XGj1sjZukn7hfig
	1/b308ZdVcIwsfuygH9E+qOhUGCakNs9kHO/GWEXbP1mQIaF1wIgAHDlJ7CJsnLqOqNrWA1JBbqy+
	1s48gLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdof-004ES7-20; Wed, 27 Oct 2021 07:57:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdoS-004EOi-Lh; Wed, 27 Oct 2021 07:57:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 023C21F43ACA
Subject: Re: [PATCH v12 16/16] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, hsinyi@chromium.org,
 fshao@chromium.org, moudy.ho@mediatek.com, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0ea1781f-f650-2157-f384-99afd434b546@collabora.com>
Date: Wed, 27 Oct 2021 09:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026155911.17651-17-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_005732_892974_CC5E394C 
X-CRM114-Status: GOOD (  11.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/10/21 17:59, jason-jh.lin ha scritto:
> Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> rebase on series [1]
> 
> [1] drm/mediatek: add support for mediatek SOC MT8192
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 28 ++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
