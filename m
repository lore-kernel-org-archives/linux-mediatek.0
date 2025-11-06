Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A85CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=; b=TZoT+8+9FBmgpRItlPWgrjp4Ni
	C0qSslj92HMzpOiWUrSm6f0ZZl8MTIbfjOPhoUS07M3jysqbGRl67MBU8D91RKJrD76WRPnycOwEU
	8uD+vUklPVwkdrgCycGZtnsU6yWHNUSTWGoqTDMVVyQtCe1+1nHHuePZm8eBFh2MUtghepX3JFwPJ
	aB/YW5d8SgrBleqCYHbaeSdPQkKMKdjbAunvoGDXEylVLt3gNseTjk7qphvf4dD63hxqdqGV4gGo8
	UCDXMW/TGDv5mT9j9hvt0lPEyj1R6mSXreWWH/UsifHFROKWuE3t7InVQjyXssfholaNTczVJceZZ
	CGDEPWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NM-0000000GMuY-1APe;
	Thu, 06 Nov 2025 23:26:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NI-0000000GMpp-41TB
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
	b=B2nakg1GtKDI8ncOoUiiceBgc3jBoGQsi+GKZnheipnKFd7Hn9IPZ3RUJ+ujQ9k3/UngfQ
	G1qLi1djh7nFtlv/1gFpd9IN2UFQeqv7AZi3pJtBvzKzmL4jhPbHobqLfRkv/C3G6xYCdO
	SooQpiRPCGZJ5sxBx7TNjXmBcD3TT5k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-RhVJ1UnNMxq64g1CoQBfeA-1; Thu, 06 Nov 2025 18:26:36 -0500
X-MC-Unique: RhVJ1UnNMxq64g1CoQBfeA-1
X-Mimecast-MFC-AGG-ID: RhVJ1UnNMxq64g1CoQBfeA_1762471596
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-880281dc4d9so5418996d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471596; x=1763076396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
        b=iefrwif0yeeeWwdR17fWnZU4bSJBBkSTb00cMkIvwkCa+CpyxUc8N1wJCujwprGtVv
         DNmbx2XlXjoQ3phBtn4vhJBDMNV11NZhWfFXiBB1SEJ9G0nIXWKgMRjpZRGDLsk04EcP
         I0RGzfY4InbFUh3RQW1EJijnPmhERyibwzXSb6Y1QbtxFrgjTRrj8TeJr2A+fPdkw6qb
         soc6E+5iklLQUSvElCAO5FyyYl23RcqefqCoOMTbMoF1B+dWB/rGKQOtrGXyTxcGNOKp
         rnwIGNLcZS5OSSF17P4lga64vXJN0QzmzgLBgau9bHwDt+DLw0GqI9Z4q/1GwiIVGsFx
         e0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPDo6vld1me2fYyx/Kng+/vi6X288P6RIbWHMTmx1LEcVr2we5lP0tQ+hg+w9xKf34ebvJnzpxSGjyKo9+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGWjm3dD97OCzfrqN/Qv6o8q3msOCTg1+NJnSUi81aGy0CTXNL
	VBZ8g+l2hzpMnNQTJuaVz/MyVic+WZNSzYHDqZHTqLPt+Gtt7hl1DS/T++gb/czLjX4Zlrunqg+
	Ge9BhmG+1WWDAoOgZlxNomn3tM7OfNunuXbH6nCGZQBSZkBS3yo8hc1SQlNvasRDlWz2bU4N1Bg
	==
X-Gm-Gg: ASbGncuT7qDpAzPLJjxVno3qQfYfcpSyHmo4H3cH0bxV+BXW8qS4ooE6Ac7Z0VsXnAY
	t8Nxg+iDZP1NEG8j+oQBTdfbUGC4q2iilDzspPJrcRj5/QzbiL26+IKAyWd1UXE0qGKwUh0uuhi
	F4StyHYeMFB0e/2pzTl1j/NjSyJFWoR1GfhrY8rz2MjjZutbfXgxPmYY48yd3hNRxSvRnDe85Vo
	w2b7O4TLEqn06vAOwXW7cFj8ol9llRw1yoneUMbk9PhqLCuPZxQdwYH0Ls/neo+Flfik8SBoY5v
	U4RmOciU00PqEojrmssuQUIWodvkOSIx+44AWtLcV9v8jPcL/wS9BceSQh1gKB62NQhaOUxg6zO
	/LXWXD/jdgpEcBaGleGEMq0jQ7gEXY3INk9amXR8pOw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732336d6.27.1762471596129;
        Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwsDTQJb9qqBYb9v62fMP1IlTO5wvFmMfSLsEpd/QskmRbsWz9CRa2AbIiAewvIcXXmKGXjw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732096d6.27.1762471595757;
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:47 -0500
Subject: [PATCH v2 RESEND 1/9] phy: freescale: phy-fsl-samsung-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-1-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tPB5NIPC9Tahtwhg+nx3O+ru7wuSB+giCQQ8ld+ZnPc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZ8qZ1y68Ds1+V38qKsPZ31ou/Hv9tT5Oq986XlN
 sMCmfTQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZir8XI8K3jqEHi251Sx7c/
 Yjraoi5f92KzyTYZ7+2Xkg/s6jMsmcHwP/jWullLg5MdIhTUAyNY/z+5IpspNzcipfx2v2sub7g
 DAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2TS6ToncWqww_0vubwJsGYX2UqXBBnWhlPDj53XFqFk_1762471596
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152641_080861_4F473E67 
X-CRM114-Status: GOOD (  13.68  )
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
2.51.0


