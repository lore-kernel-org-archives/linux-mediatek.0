Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89256C87FCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 22:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=; b=a0Bmm251qnDrBoD7G/q8DJLTW0
	h5FsxYCHtG1zpnqQsnlNbQsMBOTZ/OW9M1rgz/SF2QaPfXRc/n1C94KcuFL6w0Z6PFfjU32E4HKtp
	4HjUyPzBr/t0rUW6227wUoRnb9/nKU249HLvF+9QH4INBwa+IPIeRIRzv6n5NZPMGqlpGU2LTWhq3
	rrRn1xtzGxUlQ4z7zTWW9PYiog/KfQJJ0Dem07nN3pcgsAFMis2BfS/YTSU/crI99ZNcdIcB323A5
	edrjYOjmVIDIGO5z4tO6QqrFHorUOQXl/cX2MoqdXutG5H/dvYVNUsGlpch3OQKBm+cC1gCp9rY74
	wSV+mEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEvK-000000068qV-2UxI;
	Sun, 10 Aug 2025 22:53:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEo0-00000006843-0Dky
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
	b=Iy58V6RBGZiiCVIntGmv0oNMbs9BskuJb37wGIhNqB9MYZoT5IkIzVHKq8eq+DFW4WIdnQ
	s+5//FDhOm7JyGtL+t5SvMYoYn4Xini3DtNkPDl/YRFHdxoHY2971/bkoOZBoqskYQiMxI
	mnx/UGBw9hzgSEFBsRB9Vdv6wF8Snsw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-trWrPuwxNKyoQy3AvPGLfA-1; Sun, 10 Aug 2025 18:46:18 -0400
X-MC-Unique: trWrPuwxNKyoQy3AvPGLfA-1
X-Mimecast-MFC-AGG-ID: trWrPuwxNKyoQy3AvPGLfA_1754865977
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e665a0cddcso911314685a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865977; x=1755470777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
        b=vLrV1ySENEZRG0mvo9hTzQH7m0SxgM+sRGAoecBiJffL2s03jcjSpbqRxohSOxN5T1
         NTuTEelkTmcz6sI9tMVsm52ZkMtOA9Q9PcuWaUghTc3x1Q1DgZ607JfpegixfnnHlzM1
         ZyqspXkebRWA5Iodt8KtK6xO7xRt41eNv1DWhesnKV7hnEk2obJPDvzEFIx2izMTyxmC
         Q13LIoqkeG2NS/O7k3zoWIumR+EAIWyj+VGHJhUUJ8+VZpV/Ra7Z1OiK1zxfazmUOjKg
         LsUU7aJmlAQtVwGhZZRpAEjkfdATH/Sf3Hvbc/wVdRf52HAq9hi26LA52lDNECCsCNnW
         2aYA==
X-Forwarded-Encrypted: i=1; AJvYcCWs5VnYobFWIE60uOmryWhKsnUFOT8+W9G5fulL+mG4Jd8H4K54SNofeC+4ZuiUvLJZxDcOBX3tWa/QdZdcsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV31skZy4as7sWYOvlerkFVQtKHhwXjpV4/3cSlIN7zUcoOa5Y
	P/rQ+AeA6jCLMTVsGu8zsx/wB8RxDo2ngSf+fHSUrbu1DPtRAXgqKWDJyFVS7C8jksFNn7Tm71n
	1nmjW9WhLNrAA7VpYHqqTEqlsqtGW+cNsizu8WkHosabhCyanoINeRQY3KJNxQQWfd08fpE6gxw
	==
X-Gm-Gg: ASbGncuq2dD1abJ4PTfbDFB0WaAaWxqwZJSgBa3E9PcJLXmv22om88T+CoAm8MoI23S
	IHUa0MhkyeJzOpE/YuUDRZZWVzaPfPMtCfgZHPVzMzUm5fMvj7kc+235apuFH379DbaAwD7ySEC
	bHw9VSMy7wywbo/NuceGdyNfa/l1VLwlcTe9EaFqU+HufaClHmXVLVYrOj4kORDOjabUBBgbZ6D
	W3fh9m3KuipXNtGdSpnoRncz/7CxAaF2gasMRIDykC7iOJWplycukXw+A3/TVU9aqb1oxuocqg1
	RD88h1luEvla+lZQvL+x7NUEtrb3EjGtjl9LboSZ3lzJy/ltzoExv3PmbbHrL3g5OxvN2k9HA1Y
	a63Ha+w==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id d75a77b69052e-4b0aed93038mr151727391cf.58.1754865977524;
        Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExCDCgOrUi7VTan6/AGqAAE3FbTWvD0DlZHmaitVHPb5PTrx90u14A2hmRLrvSxJ8XKrUUiA==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id d75a77b69052e-4b0aed93038mr151727231cf.58.1754865977145;
        Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:31 -0400
Subject: [PATCH v2 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-3-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+ttqLK3CCvX22rG8r1u2aky/pyqBIfYJ3wcP4wTqxkI=;
 b=3obEgP8yrDCMdOaBGI+w4Tat/8TZLPDL5bV/fvqowKe5RG+J17OP5TtRquid0xdyZAAnUyd/x
 LCD0oPAU7awC9owBT91elCcJ0kc+tWZOGloj7ttnD+fpn6ULYnrgJiH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VDFbsOGnvs5w4z52QiuvlHFvUg5Zt8UYAQJEAJQRdyM_1754865977
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154620_167882_70932409 
X-CRM114-Status: GOOD (  11.83  )
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
2.50.1


