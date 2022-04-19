Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6EDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3I3CKU+FGBcFanOOZ/PJmX7mEY1QLWCQy4jjVX0c0kM=; b=1laxMrRlzkHrZi
	ftyo0zlLqHsoFqwmvVxPSrtHEsSDC/z2DDEAWfpkBBq5nV9bgQsE9p/SZAHQLiMos0tyi7QJ+z2ep
	CABDnleV1ANuHkaVEQsuanIUyxjEqTkiggZv6yhDVsLDTdRb7M1EYKbTpzDjpypBXGpzJQaRAWL8r
	qmL8sFj+uXGhht1uj3EvZ7P9ImFKTOK6BQ5vmpFv3d/G/EvrG2bmXOLiiDRnVtWuEJ2yVfP6ZPywt
	+oG/+b9ue9WFYl0UzzQJplp9KvRxxY9NaXQRATnDn/mHHmxxYcz/QY9w/NLQLFVLDOcCLHeBDaK7z
	7guljSPNcxrj8jg7nPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiza-002DtI-33; Tue, 19 Apr 2022 08:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngizD-002Dl2-O1
 for linux-mediatek@bombadil.infradead.org; Tue, 19 Apr 2022 08:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ymcXL9mZkOXE1tvy2X8sRlDYOjiY7V/45QxE3N+k/bg=; b=ZBad2QtZ5u3AiVt4zP3RGZXlKH
 ZLHXa50Xh1v0lrEFOTfy0WOAphc66K+MCAnQL4yRwMIBgziDItFLs+gW152vu+bOIEh/rooikuBpj
 mbGSo1P8o3OT3GPNZ/9APLEz9PbAWW8wFwjg0BI87/o4OSSaEL4tKAKR2q7kYq6EIzrx5V42gw3h8
 LD1FzMSwgqPid1U5QXMPM2OyMzxJ3nYdZvghmdRlXnNeP6JNTr0ePr+tSLb4hwN6uZpLG6BLTMu2c
 sI+Od1kdDtu5hu0G2Ks+KRIpehR90UDJ2sFI9t/HEKmSCsFai6fIkCbi8C63E4Z3VqIMTmU5KpUQ7
 6bnim7QA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz9-006l8q-Cr
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 08:13:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id s17so3851809plg.9
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymcXL9mZkOXE1tvy2X8sRlDYOjiY7V/45QxE3N+k/bg=;
 b=d2lwlqxOipd23SNVAohwHf+gxo5amqNUclnUkRETxFfTTn1ZTq3HvQws+brlFkt85c
 Hfof9ZusLxWdVXKJ3l1Gg3TZenarfIXBwbKaK3la2n/LByuTNRdooFo/cte6FrHY39Eq
 9ncMqc58sVmkJwKE9Skxnh51bHyEICko8Uspo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymcXL9mZkOXE1tvy2X8sRlDYOjiY7V/45QxE3N+k/bg=;
 b=0kir3e6/4YRJJ4YilZ/HZCZ425EwohPPq7SUOD6PsoBcIG1PwQ5GleYqc9D4Bbc+ji
 hMdB8hZy++VHJphXQrCLh/ox9qgzJg/VQmBkMyBs5+HnVfBHHmOcy1kfzNH85QAM86X6
 eoB+Q4x9kLXJ9nscKhOYvOG7EpfxnFZX7Rp4kTHa3ouMVa8G66ImeTiJOe7lyHd0IBKY
 pbH3xAeg/dIQ3udJjtfZBolXYmv+KDeyjPssKv0HL6Miu47jnPfb52NTutVf3AJMfR07
 ZSmMY2i6emS5UYGNPj5+ub+LbvojZiCHftueq8BFdDaXMB1WsrxQLbCC6cek0oCUGkLn
 6mug==
X-Gm-Message-State: AOAM532jGV+zFTUPDp92SAwiFZIES8WeHO5k+sq3c5wy7qG36jGMZ60f
 kXLIhHsQL0mn/pUqh6sHkEbU+g==
X-Google-Smtp-Source: ABdhPJyPJGvPpTMNIeDwzlbJl89ma0IN1rYEVyRw7X+rYVNTUlAWEMm81vh00KrOJ1Q0dNCJ5surTw==
X-Received: by 2002:a17:902:eb8c:b0:158:4cc9:6998 with SMTP id
 q12-20020a170902eb8c00b001584cc96998mr14826627plg.35.1650355995603; 
 Tue, 19 Apr 2022 01:13:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:13:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/7] clk: mediatek: mt8173: Switch to clk_hw provider APIs
Date: Tue, 19 Apr 2022 16:12:46 +0800
Message-Id: <20220419081246.2546159-8-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_091319_826209_7324D76A 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The MT8173 clk driver has one clk that is registered directly with the
clk provider APIs, instead of going through the MediaTek clk library.

Switch this instance to use the clk_hw provider API.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 68d3a9749316..d34b248c42ca 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -994,7 +994,6 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *clk;
 	int r, i;
 
 	base = of_iomap(node, 0);
@@ -1023,10 +1022,10 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 		clk_data->hws[cku->id] = hw;
 	}
 
-	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-				   base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
-				   NULL);
-	clk_data->hws[CLK_APMIXED_HDMI_REF] = __clk_get_hw(clk);
+	hw = clk_hw_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
+				     base + 0x40, 16, 3, CLK_DIVIDER_POWER_OF_TWO,
+				     NULL);
+	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
