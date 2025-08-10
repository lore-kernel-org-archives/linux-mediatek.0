Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76652C87FDA
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnGrlNLU39XteVbV9vgE2Sk+xvdwKQpHrkhTkr/Vktc=; b=gXPFJpIlJ77jSiuWFP6VdZjHAL
	/ippdwp4EBLH9s/zAZrOTgaok1FAhJ8UGch2vwxfgkSo3ZmW8xhQlOQ5p8pEEwy+RF3ALI92Qgthu
	d9zg6vtV6ObDAao8MRn7E+GV09OVaA6o8pVJ27LcPoRoRYNbjZi/a/Np6fCJKc4YxaTQFDH/ogk5q
	tElfbPqsjjFrfcHuXujRNDVdHaSvts1AByfwsRjVGYkIFDR1k3ukGZqQBY8JpwzHLXOBo7DvzKzxK
	oF4GDDiPKLXTjiQflLblt0s8ujUw84Ch1I2wR5VzF/lNwcSjnAU71dwFA8GVW90BaQkDFTWeUFo3Z
	yLwWAJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEqF-000000068VB-1haD;
	Sun, 10 Aug 2025 22:48:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEnl-000000067zh-1UtJ
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnGrlNLU39XteVbV9vgE2Sk+xvdwKQpHrkhTkr/Vktc=;
	b=YLCOyhnNu8Lo2cheCKTiEY7w5DLJoJtVg5qqFckzh1v7FkwX/feV69fZiqP4KBKJKkqRNr
	DDak+J/bfcW4LysrGrSfhVHoHehzGaShW0X3cvmExmxn4UpIGXkcGUfpTzH42vHca2zgPX
	i4mqEQ7d7KZ/Igpmgc3EofTSNUGuPTI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-YyK7d3BlNuSz2qp21jmjUA-1; Sun, 10 Aug 2025 18:46:02 -0400
X-MC-Unique: YyK7d3BlNuSz2qp21jmjUA-1
X-Mimecast-MFC-AGG-ID: YyK7d3BlNuSz2qp21jmjUA_1754865962
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06d08d61bso118148081cf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865962; x=1755470762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnGrlNLU39XteVbV9vgE2Sk+xvdwKQpHrkhTkr/Vktc=;
        b=euiRnrxherF4vYiV5bcl0nYAIAcs2s7mW74WN3tQoY8Wq6gi+7ZwF1173zSi1S+56F
         WgqmTO3HyPFGES1COz4ccDP2s8WV44tEXRsEX/ib1slaAp607Tz0bFZNGSVqxllkrHX8
         8bGKco5KHZ0z0VvekqyYJ0rSF99yY+0MFUpiXOFpdLaB3FqJja9AwE4Xrh32M397oJsT
         5JaEkZe3bGO/R7gFTntx3n3Yt0TTWI7lKLm6l/+GdfgqTRqIlUClNlCpHtOKiiZypq29
         yMIVvDw1gih7fnTD+UU3IF1bBwf+cSRbYlGnjv3xI3dBkjaUZC3X6nVMgk5dUc6oZLsE
         0vdA==
X-Forwarded-Encrypted: i=1; AJvYcCUuiu60vOmF9HPC/9LgUA42sh143G5O5mT1aeaQUzDxcaqeGc4k/iWvhmN7KjIUSbl+d7D+fUy6892ln/B92Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNn434mKffcKEDrfviDQ0aPa/EWBS8Te1gmc6mxfesBaq8QZT
	VCxIuBRlMVq6Nb4sMaDlVKLklE20wAVcJ+Qz8ca6SiY+ZhCUQEWYbI9jE59W4CorB9haQBAtNGk
	cLitTgTQUpfKARhXbohgEKLbsiF3ff4/SynxzM+hrr+v6G4nsAUMT5ruGObRzb7Eq4jqlVLxOkw
	==
X-Gm-Gg: ASbGncuEYQbYI8FgazPSAWYqDzEOo9pB/fZK6fBRr5JOMhJu97wQwurd/RgZA+h6Gpf
	NczBisYUnGUoaPmQ1K+PyNEYfsjODFGODtMPVzmUKUySdShJUrhyZeMTt/NxDzRby0PfdE29OJP
	k91rgOkNMv82fOBt8/EKPd59PB0oXdCCTJb9uBGjvTjBctiBe3Mb9rYVr7S0AcmnWZksqNas7Bp
	5wS+8yS850HkZt7i8453baRkrKHfzTB1RjDJOGVVjj+Hrx/pkva7t6/eINCCNKXE7oquq0DRQQS
	NWd2IwFzXd4+J0nLOjkmGnHyCKxS8bjVnPZBbFg1qW/gKGbnM7lm8xxbxXd96JZ5EGxC+IxRpKJ
	TjG3KVA==
X-Received: by 2002:a05:622a:1910:b0:4b0:77ae:17bb with SMTP id d75a77b69052e-4b0aed3134dmr164413191cf.14.1754865962211;
        Sun, 10 Aug 2025 15:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUie+6kdU1EHKp7zY7Gli2dqcxw3eGLN8zRdb828DF1xFrgrp8MAMR0KX4wPSSD6n4ZYgkPA==
X-Received: by 2002:a05:622a:1910:b0:4b0:77ae:17bb with SMTP id d75a77b69052e-4b0aed3134dmr164412901cf.14.1754865961731;
        Sun, 10 Aug 2025 15:46:01 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:29 -0400
Subject: [PATCH v2 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-1-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1978;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=a0rSL2H1S/HUaruR4lcZ7Ks+0rkYUs1GnZzD7mNCe3M=;
 b=/U1k55v3iKOX6MHHG4y2eGAMFrca8JkeVtSpJcoc1Z54FeYml6kJU2G+QOt1KduqEhi06mYeN
 FwMvRbQ0c3QASmeUiY3XU6Pm6Wwj0gFLroBs3uKkqqGAWHVZhKteVKw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mHAjUQn62QPDsE35EjbygIoI_oTzKCiLoxCeLAtGrzU_1754865962
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154605_472120_15A7B922 
X-CRM114-Status: GOOD (  12.46  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.50.1


