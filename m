Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2EFC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgigVUawr1P5kR1/UVqx7P6TCAQBcUYYnlVpR1Ive7U=; b=awSrdcSdwOitQijXwBaFMB87aG
	Y3dAMVWEF7riwNTPYSBhgt0wI0L50T5irxGUoTEBLRyJELj42uPR+p/5W9dnG5VygfxtQA0gi8YCQ
	kS6Cxq2hK/2+nxYxdC2L+r2PUuv8phQikfM6iar9Mf5mlom8vFnq2TxRarzal5PYpe98copitEE0+
	XNbJCPDx0yI3ATm6QBnvajFkeaorHYX5VO9vCcq1heK8iMLkrhLftZzwTWtnEadLydVQ7XvM7Swiz
	G4KYmfxnvj/qsnhkRiTTnPcxs9mexbM8j7IGY60D4aiqDJoJsDYAw0WRIa5mvqeqgiwhHbsJp85p3
	4LNyyvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgSK-001YHa-D4; Thu, 03 Nov 2022 20:04:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgKI-001Uso-LS; Thu, 03 Nov 2022 19:56:36 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BB04660295F;
	Thu,  3 Nov 2022 19:56:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667505392;
	bh=r3uuCl1jdRH8Jqbm5SAIzC2TzpgfqC792VBUHdoQyC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQTtf5uJmlOWcu/21JkiG0/r25aw1II4w2ymWeVMxecEC4zy0Bseq+gy+6fVrynGd
	 v8PwkAw9mmcTRW54E3NbWG2xEvcHCS1Y5BEkVFR8zJvn1rZtPvnxvCHOBPeTPTHR6R
	 KEsVzi/wOp2AMtcryLhaXQqgMdfJ8StE7Igb/woBN59VuF4IW5h82reDr5JM5L1Wno
	 msNJhnXfm1I+UgERuRT0v0svOYIVM5agqVEbE4SPXr+wd1+bSTdbJBqnm7TXIlT/md
	 +FcWVpNTdIpCR5k56g1clyIkQAFxBaI00K0dyMNCcj3+uoieGuWwTyVtx8wC3cfv21
	 scb7+zoXgamRg==
Date: Thu, 3 Nov 2022 15:56:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Message-ID: <20221103195625.azajpe3vf5kxccar@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_125634_879970_8850BCBB 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Nov 03, 2022 at 11:25:07AM +0800, Nancy.Lin wrote:
> Add four mmsys config APIs. The config APIs are used for config
> mmsys reg. Some mmsys regs need to be set according to the
> HW engine binding to the mmsys simultaneously.
> 
> 1. mtk_mmsys_merge_async_config: config merge async width/height.
>    async is used for cross-clock domain synchronization.
> 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
[..]
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
[..]
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)

confing -> config

Need to update the following commit as well.

Thanks,
Nícolas

> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> +			      be_height << 16 | be_width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
[..]
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
[..]

