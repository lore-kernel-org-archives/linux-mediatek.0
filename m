Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD50BCCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=; b=eK69jHEhXSTkg4Ct2prSsa3fUV
	bbDhMTdcnFM7fa6Z56S38vBG0moG+R9Ai0kehxDj06l24QkR9R6cQ0p5sEYQKake6fxjYfytexk9W
	Zp+2iHWC/DqSvCtCDpjrubs405jkuDMl6VANG09wVcqu22kSqMvv8GF97DaQEqAWLhJDFudyO0CQS
	Yj1k1hCuhXMSNL6p0IjjSpb1wJIaLXqt7usVUIPgtuIXe0c5h7CsCx6u9UvczsAH9OPqDEIcPOUdy
	nPhrhvQFy5SBSbM2wxOz8QVDYdMK7tCRBtMGxrsdXPytbXymiPyG57pU+MuTAuibrDacst1P/AuUa
	2eXvyRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NU-0000000GN4W-3Gm0;
	Thu, 06 Nov 2025 23:26:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NS-0000000GN11-1fhy
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
	b=YKtMBEe8v/2UGAuxlyi+l1w7adiDv7c3g5tBzp1vWim2m4BXs1gKTeAtj/50fOr8HChUBO
	QOIW4tl1cZleEtSMl86UldYWNWKyNjmn1lWjNVkO6uDksOYuGdpuGyE9cpwv/S4vfCxLFd
	hPBqwT7Q78562VI2ztvh7slAHWg5wWU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-7phznbE9P-Gme1a4K0wwLQ-1; Thu, 06 Nov 2025 18:26:46 -0500
X-MC-Unique: 7phznbE9P-Gme1a4K0wwLQ-1
X-Mimecast-MFC-AGG-ID: 7phznbE9P-Gme1a4K0wwLQ_1762471606
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8803b5dc9b8so8610856d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471606; x=1763076406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
        b=iBlrkWWC7xDd45l4MrKFL67nBM/YBjrHP9ipyc0DBvbeLwuGsNVPzMrK0aOq/pYP6X
         Yvmp/gHLlXPWWq8yGHIbVH5aLWTeh9wqfcDRO6Il9WvTCJU+bhdxTHmj96e29+V0SJl0
         feg3asLDgmAjNYxaQNwEZh5pYMmuyCSzBcKS7RLlvPjxaz3c81fbIt/Q6Cq3RUJHUez9
         Ui9qryCqmEjWjmlrCkY4u1hmO1VRDUn3jY2QEHw7AGYNRTkud9JsHPP/OhrpTlXeBZwf
         ORPBRicMIycAG+5OSrs/h3N9PVd4Mqy2MXuiBHfwCtBC54EUwZ6/ry5grLPf2v3LHsCo
         vOdw==
X-Forwarded-Encrypted: i=1; AJvYcCVP7k2NHYXeGN685af20m7102fmQiaUetBT/wqkawx6TfuQhQZksdDpNKHL+2YPUHQaWsldfbVkQxK5xAgsvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4DCJ18CMeRInh78wgDB1VRBGtsUISuiWGIfT/X63yStTDRoq
	dIXTLU3ArNnnOVNFMUnwCy/PDoF2VLJEaawo96pyVyFypEbgAOoGeET22h8uSKR7/ShpkMPpQUA
	2rtFr+7e1NwoAOSbGGkb3QPmQSY9NhOrPXHRgn9LDL6KFrbVOhmPPwgSd2sg+ivP6m9DdDpC1hg
	==
X-Gm-Gg: ASbGncu9mzgCEr0KnJ8oC7S4570ouhGDPd/RQwyBIGxxExHed7W4sQqdcbZ0oKocAth
	4wcisYX6fLku4kYVWdtZ2B2ShOnYt9H8/tuPK5G+Ip10SOQW7Du9Ze9vngGtvhr0fWC/dG3qq6F
	sX8ETQwJcsPrg+SbQSOOe16hRWwKqkB3NVpQkeGUxu328WfGpcOlI8zZtKWbm6OsD84nR1E8M+2
	eNA+WO+PVdPnhPbAeq9FuNG69w89rC/uCy47KVe5/mKTlmChmLF8DQvI7IoDmqQ9r97WCG2RHZm
	IexIMkcm3g3gAT1q/wWbGeKhYK/0IO/XXFwXxDqmCPfb90ME2/YFX8QOuIny05f04GISp/9+R10
	Nfhct3H0b39zFql6R6lNzWLWQd5LaVBnEbEzi5pUDlw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19316056d6.43.1762471606045;
        Thu, 06 Nov 2025 15:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHwlRC8CZ2UFXaZBcGupUhAP3gsyq39my6h5pJeWpOeH+fDN/RFDAKGIUl3UBkcMQENq+LCg==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19315736d6.43.1762471605711;
        Thu, 06 Nov 2025 15:26:45 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:49 -0500
Subject: [PATCH v2 RESEND 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-3-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=N8o/S8JYpE+P94OMt6ofvyUqz51LnCLNCgONjtOPtQk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RY8/PBwxpQIzmk34ntPmseIsDDNz1O4qinfnm5ye
 e/uLa+0OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgI/3lGhl3u+fZzhdU+/Dze
 fFh16+5wt2rZRwu4T3yXfO8lq/V7uinD//wHB3T5l/r0mnFP1Vf89iOU+XbonQtZOUZNP5rz76e
 cZgAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QPzO6hTgDQuNQxQl7SsdjfroyWz0k4iD7i4Xy2oVSTo_1762471606
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152650_509351_5F123FDA 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0


