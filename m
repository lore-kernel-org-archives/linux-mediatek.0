Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B8FC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:In-Reply-To:
	References:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPjrLq9D2NGXVQL2kIu0v3AaBsn7YPrZkOXYspxigx0=; b=JBItK0TnSSEo/OjVUBniUeWDIn
	G7sE5ZNNrZj/wIS0U4v4ZMRiLtTLyrQ6Gk3Qnb7R7Rf0gM7CaKlcVm1tVhdqvJAAy0+Gvk8NZuIgz
	sZ1l3R1rHKrD+T//mAGiNEPo2KgUkWJT5XocuR0rcaTl2vyYSkXtmmAFaAQlqHMfpZyNx+CMp7w2P
	o4lAnOn21dZZIlmb7UGq0G+2arwI/dGPf5rIOxFsH9mHyXgkPNInmeKmCqDzf75K6PGCizfLYuIBx
	3q/CFRgMNVLxnAXbTxztPhX7NAeh7z28P1FXhWegioMKwb/rIRcRiJLc8tMJtJ6WXmQ6FSgRIiGla
	1BtsR3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8En-005ZP5-0m;
	Wed, 19 Apr 2023 13:52:45 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8Ei-005ZMS-0K
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 13:52:43 +0000
Received: by mail-qv1-xf30.google.com with SMTP id o7so29055709qvs.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681912357; x=1684504357;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPjrLq9D2NGXVQL2kIu0v3AaBsn7YPrZkOXYspxigx0=;
        b=fi3j63QI2hRJJqEPPrC0RFh2ARuCl2lLAooXulavHnWokQVzUGIWqjFHEYBPcJ1OTi
         wfnbfYwrLToEwwC8cMmIyPQgnCSgawqdR/wo/xo8Ri63rtB9WB0skau7BMYm9igb40+n
         Il7yCzWrJKYa9+FtJBykUsfYCDg5ZR23Whx46r41NGYKp8oxRFAYU7cP1ppCNEARQ6p0
         TSj9l0FZ34cztLvvNcJNGXUMoO/6AOIg+slZn7ytIodY+WO68mV1JVeu8/ppb0MBIsNN
         v86q1naPa6AtheeVYvy1i51MaYf5miOUx4TBrB5k9I0K0mowEiEcUygWDp1RyQZt/4xv
         YlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681912357; x=1684504357;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPjrLq9D2NGXVQL2kIu0v3AaBsn7YPrZkOXYspxigx0=;
        b=dnxvS7b8x5/jKuEwzWqVXDM/Cand6Ep8OfRSRJM/PREZnsO8aown/LVY77Hixw8EsF
         5QjhL1eUXz1+jbwbGWU1kx6tMRu7aU4QgS9elr7kTFxv0qEEw0raVy0bIb+cvLoqjmTf
         /Z1nya8DoVnHsLOaiFdvD59hdmyWnGObjr6HtzlLfw3F/RmYdfCwq2W+2KB8WmgM/6Ja
         3BLHGZu2kdw6Kx1TLX2ibLXv4dcQmt0UL/dxxeqEEdWDtj9sZ0g3oJi0SsRwTK83hx8+
         SJCkPS+N2udv1c4WbOuwH8no4uTN1kRNY2Ee9hbBLV9ngk0f/YTE/VhowdTGplABrDB8
         CKlA==
X-Gm-Message-State: AAQBX9fGc3BwXoFrzhP/zPBFZjb0y9NcShB8VJAC2Mw1t4jcPVgLTeUQ
	+4mIBrE3W7RW5tp8hui1NnA1s5NiNtzSjIou3ZMkCQ==
X-Google-Smtp-Source: AKy350bqSRMHi7mtCynvIyCs4PEfhJSxOVP7yhnmkrSs9ps3OwCrZt5hBXC3DVgKOCg654JGHtMmNafIr7aQqM2fbKs=
X-Received: by 2002:a05:6214:1c8a:b0:5ef:4ae4:4da6 with SMTP id
 ib10-20020a0562141c8a00b005ef4ae44da6mr22429745qvb.31.1681912357324; Wed, 19
 Apr 2023 06:52:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Apr 2023 06:52:36 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20230419122131.2167122-1-thierry.reding@gmail.com>
In-Reply-To: <20230419122131.2167122-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Date: Wed, 19 Apr 2023 06:52:36 -0700
Message-ID: <CABnWg9v_1PuQ5w7+=mAWL-T8j=taF8L63Q0Xa268PvjK1yW_Eg@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: Avoid floating point constants
To: Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_065240_150555_5A07899F 
X-CRM114-Status: GOOD (  10.50  )
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

On Wed, 19 Apr 2023 14:21, Thierry Reding <thierry.reding@gmail.com> wrote:
>From: Thierry Reding <treding@nvidia.com>
>
>When building with old versions of GCC (6.3 in this case), the compiler
>stumbles over the floating point constants in this driver:
>
>	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function =E2=80=98mtk_hdmi=
_pll_prepare=E2=80=99:
>	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: =E2=80=98-mgene=
ral-regs-only=E2=80=99 is incompatible with floating-point code
>	  } else if (pixel_clk >=3D 74.175 * MEGA && pixel_clk <=3D 300 * MEGA) {
>
>	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: =E2=80=98-mgene=
ral-regs-only=E2=80=99 is incompatible with floating-point code
>	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
>		    ^~~~~~~~~~~~~~~~~~~~
>	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: =E2=80=98-mgene=
ral-regs-only=E2=80=99 is incompatible with floating-point code
>
>Fix this by switching to the KILO macro instead and multiplying the
>constants by 1000 to get rid of the floating point.
>
>Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>Signed-off-by: Thierry Reding <treding@nvidia.com>
>---
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/medi=
atek/phy-mtk-hdmi-mt8195.c
>index abfc077fb0a8..b10af26cad2f 100644
>--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>@@ -239,9 +239,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi=
_phy, struct clk_hw *hw,
> 		txposdiv =3D 8;
> 	else if (tmds_clk >=3D 54 * MEGA && tmds_clk < 148.35 * MEGA)
> 		txposdiv =3D 4;
>-	else if (tmds_clk >=3D 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
>+	else if (tmds_clk >=3D 148350 * KILO && tmds_clk < 296700 * KILO)
> 		txposdiv =3D 2;
>-	else if (tmds_clk >=3D 296.7 * MEGA && tmds_clk <=3D 594 * MEGA)
>+	else if (tmds_clk >=3D 296700 * KILO && tmds_clk <=3D 594 * MEGA)
> 		txposdiv =3D 1;
> 	else
> 		return -EINVAL;
>@@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *h=
w)
> 		clk_channel_bias =3D 0x34; /* 20mA */
> 		impedance_en =3D 0xf;
> 		impedance =3D 0x36; /* 100ohm */
>-	} else if (pixel_clk >=3D 74.175 * MEGA && pixel_clk <=3D 300 * MEGA) {
>+	} else if (pixel_clk >=3D 74175 * KILO && pixel_clk <=3D 300 * MEGA) {
> 		data_channel_bias =3D 0x34; /* 20mA */
> 		clk_channel_bias =3D 0x2c; /* 16mA */
> 		impedance_en =3D 0xf;
> 		impedance =3D 0x36; /* 100ohm */
>-	} else if (pixel_clk >=3D 27 * MEGA && pixel_clk < 74.175 * MEGA) {
>+	} else if (pixel_clk >=3D 27 * MEGA && pixel_clk < 74175 * KILO) {
> 		data_channel_bias =3D 0x14; /* 10mA */
> 		clk_channel_bias =3D 0x14; /* 10mA */
> 		impedance_en =3D 0x0;
>--
>2.40.0
>

Thx for the fix!

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

