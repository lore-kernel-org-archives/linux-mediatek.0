Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE0DC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBVtIjzgSdM7j9vfNKuudokyDuXNQpoH5us+QUAZFLc=; b=ITxCsfd9TUY7FXLOsUkbOSwXm6
	PaabP0Ig4YTzshSl/o7B1p1LRzKmFEI+Fi08VA/9us1SHJg3GwuNxEWCsjH8bNRNWHrVQ89oeJofe
	g6O0dYioItqRm1y0OjzfL0Wm6VENMHxC7H1tvibvVrtIaIxmApPSABATH1o4DRRQ6LPgueHbPUfsj
	wFQ1G+crAlPcrKYoldVHyVtccfJJWWsq+HNNR3rKCCpCESLy2waiEfi8Nw5I2792MBDGNOz6trKO1
	G3Em12fK4OfNwUH4PFtw+nfMwy1fb/k5EKzFJVMGari4E7HLUekLpGTk2qJzTnfvPSE1R5C4k/Bdt
	vHWx09Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvvk-0000000Cgy9-1I8F;
	Thu, 10 Jul 2025 18:23:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtok-0000000CME2-0zHs
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBVtIjzgSdM7j9vfNKuudokyDuXNQpoH5us+QUAZFLc=;
	b=da+pZsT5Up90WvRye4v/8XdZShLSui2ICXFMSLLzS5MUtm1/75x2dROtlEzQjg9XgVsMsm
	2y8XON5arzXYfhU7OShp/UIykkEKRWpipcg4tDSBRtXJWM476MKQZEZidEQbvMMwNKBySG
	DNjlzNtI99f7CzvzHp9cnfHTq/ezjd8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-aTkgxfeHOcq5vr2LdMhEEA-1; Thu, 10 Jul 2025 12:08:12 -0400
X-MC-Unique: aTkgxfeHOcq5vr2LdMhEEA-1
X-Mimecast-MFC-AGG-ID: aTkgxfeHOcq5vr2LdMhEEA_1752163691
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso24849826d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163691; x=1752768491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBVtIjzgSdM7j9vfNKuudokyDuXNQpoH5us+QUAZFLc=;
        b=qG9XCQiFUF5Zi289f69EsBL6dgznHZ5S/B+JmQf93k7890CKj5IcQgBrgFskQyUbl0
         OXpbFIkqwDSh5wKl2plVeGdjHxcJpTT1dbfvTE9IbcgcT7+nQ+Kr1He+8X6VcRfmVaKF
         IgxlCzTzMkkbmC7GgWepcOHe/MSbqOlZzjxZ0mLzpDRXkgxmhc/smu9dlF5pArl85DJF
         fvsqr9ibvtPJ+YrW3+aBK4nE8GjyXsogtA/m0Aojit+8CvLG7XgcpcpCiBjkoaGk3+ZH
         l1hVnsLNhZ8G7c5H2hSWhCcIaU32sVun4HSJNCrO+peQgpYufxcl8DEsvRe/o39XdZnM
         PyFw==
X-Forwarded-Encrypted: i=1; AJvYcCX13o954vTjbiq85Ymh0s3cA4+Tog/QGBfOLmPmcRpPtad4XUCBmg132VMJ09cZi3ZTVSQI5JQDgx/SnXvkDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykEv8fYBJC0U3fKf+YmZS+IOX+pQTeO8Ksny0fJSTHm0toOFq+
	Sjck+z38I/6PfINDrl/8VC8mdW7EXnHUSxu2q7XUP23F82MMS1FrwBfkCIz6ZEQHqtmY0CESH2f
	o665eoQMT6RqqYhUPLvks9u5xXZFikQrUpV8ofMs54j41yNNQVLtV4Rb2OTkCxn/xasld1ARIzw
	==
X-Gm-Gg: ASbGncvtL79/JfMrBkuVqT3sbWh8ro1k06U4/yigWX99bv7IksLIMYS/u3ndxfZVJe4
	omT3hNHYJ8CyukTPhgHDehuEl9w8fNF8g+M4Okctu2sNYedd1iGTXhto1v/v7dQVTLG2f1QVBgV
	9Pq1TnvLPmuIQPCO3XbLIFqNkgi9rBa/7mLemL4b3obZSXKx4ziYHaojdv6XvpWtQjx4ljFdy1a
	yOiykyQT3XF3BRf1eigE+Y22ZwJnVm1uiIFQPZ8AJ5JCUDi2NJdJcoQqNbJzm/prQd4XNDfQ4rZ
	yRyrHVWi0Bj1H7gnkB4F1Y2l0uaqGxRZyT7lUIrWgpsW5sa+d/IL1ZSqOFSH
X-Received: by 2002:a05:6214:29ee:b0:702:d7e2:88b7 with SMTP id 6a1803df08f44-70494e7190bmr52729236d6.6.1752163691392;
        Thu, 10 Jul 2025 09:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6DKE/B6Jz/oJiRJgLwGjr9+CDT2KUQYMq69PGQL2Cpo9Zo4B0GowYF0QAn7rhBvA9uVWDKQ==
X-Received: by 2002:a05:6214:29ee:b0:702:d7e2:88b7 with SMTP id 6a1803df08f44-70494e7190bmr52728706d6.6.1752163690776;
        Thu, 10 Jul 2025 09:08:10 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:11 -0400
Subject: [PATCH 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-1-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1978;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fKrbnjnqlbXKGKlsruK+qB8Kg9daZJZ+BBb5bsrBbyI=;
 b=KjDWEK+2W/Nntn7kgVA1LXI5UW998Hy2QzJ7T12w24jbptJPTQ20Hu1na1UrDrlq2m/ybtKHR
 1nSX6rsyHP1DjtYMF4VJcw2r9wmw7SB7c7PmH5QSepXY2pM+05ltjYv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bKpoBvdbnjTJybpsqt4rVsuHwN632Di8FK9JUA1KTps_1752163691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090814_362697_3D5B4A79 
X-CRM114-Status: GOOD (  12.88  )
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
2.50.0


