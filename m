Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB45D2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=; b=2sEzbXiNkBUVibjlNsSDOyouk7
	efPIHfuwxHJTkXivG30GuLqG9+KdyjGW5Cu5xHKr1D0cIHXWNXgnsAOIgE/K+9ZXIVZAJc+7iuDsP
	hVf8zyWOO4MePPHzfezz4UI0IanwgMhtVBJKfaMM+PSFbCM9ZfrGLIflu/KlCrCy4oNd9aUaB60Ti
	kisj9YwHic/kzT/eEPOqVBEc1UXlsxDSkcL6nYpM++LBOlqPMBc1KquNcko4vVRbUi3r6pbKO+sS1
	JHMfXb3P8iP8Rr5WPw3zw3TC7CSEmPjVlQVYkVOuhFP7yCr5wD4QgPQDKYNgccICeqYG/ilXiFNGg
	+YRSHIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA3V-00000003j5L-3uU8;
	Tue, 20 Jan 2026 11:37:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA3S-00000003j3m-2U0y
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 11:37:52 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-81f3c14027cso2902060b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909069; x=1769513869; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
        b=muw2rRJYhIl3qQQocTngi8n0TThojt5VvKHJHOOqikIw2RNEeNnKrMLBOYhMpUjI6T
         t1uWz+LbzfnQtq/WwSvw0vVTPqKxCCu6khr1kAAxhId8Ch2AkZBaE/tQAwpcKQ7z2/b/
         cfI6nIOF2GMgvakjCWwdj5e9Uczkg58r3aDtCaLBVbpgiBKVgesID/pBlfXAv60Fi2v/
         mjFBU+nM9q6c7cj1aRPwTlGZgAUI6WOU1rQGBMUVi+Kr3edRrVk5I5INsaOwFjD10RXM
         r8bpWeFn9MBWjXh4tnKRIdJytN2GLpNHDl3/i5fYukkvP6cZNSaB2Ioi1hyHvNM+Bb7g
         qNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909069; x=1769513869;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
        b=C/eCIXZrKa35rCRfJ0bt2rLDp4ddMp9dBw86wAoHMMp7gYe2JhkpuGA7slrTfgQwCf
         SN3aqed0c+LHm1duR9K4RIPUE8NM3inDCtzwPiPUSZfswlbaJ5Qqq69oJTfbZoggeY9R
         O24BkMfm2Av31YvR8fkH8iENUyq5PiKMpwnuULmo5uRW2nUzNtBQK3UjjqwjnFijcfFL
         ra8Nte5/gwrXAiNZ4tUZZb4K+xFO0ZN1htIOAFPoyhomZwBzbB5bupjOPFaYvzLi0/HJ
         o9galT/f0uaSTmIAgw6JycQi9LoDegDEP5eJffAqEex3o4yvyS57KxBeQmpEABXxtCeE
         V6ng==
X-Forwarded-Encrypted: i=1; AJvYcCUVbxKIsTaWUaF9hytpfbarJvuTYJGBDqqLX+aTGXtchiWneQjGz403dBYXBeMZL/Op2WE17lfs7Yf38WLXyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ds1zAHioLwuXYFJ2DcAUNMzKmsyFQlgpihQ+UjJ7bhe7p/au
	5xMjUMyY4UB1TMtJk89/90Ah9w0bcPeKkiIx1ce0P6erT9yrfHMnZ1fn
X-Gm-Gg: AY/fxX57i6zhoSLGmKbrE617AB86eRNr1FNU1WtDC2tkuotDsgfZcGVEgvVCnbMuoSy
	C8AvxN1E77lWuvfPo+M2nKLh6IetjJTP07566e0Ohp8qfxG726jjlqEjbHtCwvB8yFRm6ZNrg46
	I667eTU11LqRuQ8D8Diil2rC8lRQazG1r5YnVLRs26hj1C6WVmyh5twpTDJIgflVCUIOkgJ2LvV
	iFzS4H6FinSO86zhWW9O3YpEoTwXiA64YOytYLzkoOdTA70ruqmIIBne5v3jCYp2ABrzkk6Ptg7
	BwMW3ZrAg2v+K5bhK6cvdU0sDhwTZh6lmcLohF47ideBfluEiMv4GiFRxFVp1VuknVJSxpU6+eY
	p/ep8rC8XNlWJntbB9az1ErP1I8KLhSThWQoX25ObBA8NkTRVPALFxGaR+f73C1g2WIElVftJGn
	Rx72gDlS3cyjZ0ylB7O5Q+WNeWKQ==
X-Received: by 2002:a05:6a00:929c:b0:81e:4a9e:f809 with SMTP id d2e1a72fcca58-81f8efbbe25mr13964911b3a.2.1768909069116;
        Tue, 20 Jan 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:9fa0:1400:5c26:1419])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf264b9csm11462134a12.15.2026.01.20.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:37:48 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 20 Jan 2026 12:36:59 +0100
Subject: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
X-B4-Tracking: v=1; b=H4sIANpob2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3dyS7JTiTF0jy1STZAuTVPMkYwsloOKCotS0zAqwQdGxtbUAlxA
 E9VgAAAA=
X-Change-ID: 20260120-mtkdsi-29e4c84e7b38
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909063; l=2852;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=ETsLcSZWKB9eq3Cr6keAewRWPWzheGP6F9hf6pabzj8=;
 b=vFf5Qdlbwe4FiGiI83Db84ydmZAaWLQ3TMiZXuLTGwCAwsOUAzY4UJTj0cTS0qPmPPd3VjN5F
 RL5WhoIxZDkAMo+KcW2ej0+SI1Sze9wVe2bNPa23aYLM49ontoyVwcq
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_033750_623903_E8603A8C 
X-CRM114-Status: GOOD (  13.37  )
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

Some bridges, such as the TI SN65DSI83, require the HS clock to be
running in order to lock its PLL during its own pre-enable function.

Without this change, the bridge gives the following error:
sn65dsi83 14-002c: failed to lock PLL, ret=-110
sn65dsi83 14-002c: Unexpected link status 0x01
sn65dsi83 14-002c: reset the pipe

Move the necessary functions from enable to pre-enable.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.

Left mtk_dsi_set_mode() as part of the enable function to mimic what is
done in the Samsung DSIM driver which is known to be working the TI
bridge.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0e2bcd5f67b7..b560245d1be9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
 	}
 }
 
+static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
+{
+	if (!dsi->lanes_ready) {
+		dsi->lanes_ready = true;
+		mtk_dsi_rxtx_control(dsi);
+		usleep_range(30, 100);
+		mtk_dsi_reset_dphy(dsi);
+		mtk_dsi_clk_ulp_mode_leave(dsi);
+		mtk_dsi_lane0_ulp_mode_leave(dsi);
+		mtk_dsi_clk_hs_mode(dsi, 0);
+		usleep_range(1000, 3000);
+		/* The reaction time after pulling up the mipi signal for dsi_rx */
+	}
+}
+
 static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 {
 	struct device *dev = dsi->host.dev;
@@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_set_vm_cmd(dsi);
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
+	mtk_dsi_lane_ready(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	return 0;
 err_disable_engine_clk:
@@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	dsi->lanes_ready = false;
 }
 
-static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
-{
-	if (!dsi->lanes_ready) {
-		dsi->lanes_ready = true;
-		mtk_dsi_rxtx_control(dsi);
-		usleep_range(30, 100);
-		mtk_dsi_reset_dphy(dsi);
-		mtk_dsi_clk_ulp_mode_leave(dsi);
-		mtk_dsi_lane0_ulp_mode_leave(dsi);
-		mtk_dsi_clk_hs_mode(dsi, 0);
-		usleep_range(1000, 3000);
-		/* The reaction time after pulling up the mipi signal for dsi_rx */
-	}
-}
-
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
 	if (dsi->enabled)
 		return;
 
-	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 1);
-
 	mtk_dsi_start(dsi);
 
 	dsi->enabled = true;

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260120-mtkdsi-29e4c84e7b38

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


