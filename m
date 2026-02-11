Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74982ECD6E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=; b=ikX3ny0joXYzvHtJemjL99aTh4
	ndx+9ZFUIaUVy4Zh5vBhuSs+VcJLScVcz+8kU9bLPQ1YVzz6W3fuw6QvCEEwVRBCr0RTR90bQlpBL
	Y90LU5mOQuGrn4JbQIwV+A2B6cY7yy6MqIL9sEIqd+5SjA8AXN/hR6mHHN4h/Db/q0TDtgq9a1ef4
	Cc5ZJo/QCgSFe2yqlFAgTR1BWTYzKyJSyKItqiELPYJGHhlMdLvO4e+BXmjVG8OS6ci4/sacPaa7k
	mCfr/9q5/CcDxJwF88aE3XAU287CKgY+QQpBiBUnDGwV4Y9+l7vYT+l6yg1ff9Y7nt122d8w7n+wD
	u4x014Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXe-00000000xQC-0qrd;
	Wed, 11 Feb 2026 19:06:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXc-00000000xP8-0L5b
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso62278155e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836782; x=1771441582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=IXoQ04hzC2DnzkqitvSA9drJCsvCXr7iXO5ZhvlIrJFiuKJYR25VkKc2K9sBdGCSbw
         1SCaQF4mfxlID20RTAGXgiW4wt6tINobBRt62aF5K9PdFfLDwrSjSc0qdnrasF7XaI0A
         l0IZoawpjZU41t8UinQ9u6EKNA95ouWhA795+719+jj+ZL/rPNmAe26mA+vIVnbnIFh/
         Dmn+2WR76chvOuUXBJPexUggDk0+SWrqjia48Q8roX6HqaZ7nQbahLQr0NN8T8k8MHfw
         BvhVTJ7cuZtOurCG6xW6GnbG9YraQMB0Y7UmeQ4RR5+1UQiUq8yT9ddoeL71q3jJRReX
         HkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836782; x=1771441582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=fCPrRVJWfOp+zHJbWSZVYjeIrQWqf21TCUDBvjf4Y1aeN9BmhiiqpXq6aL3JhKI+KX
         epT1ie+6+u+BBy3FF4woav1zex7g6DU9qYl2aPTymkVSGh+OFHRgGLy0mGGW9Z7Av2LP
         f91EdyTRo/pmArpD1iHYG/0bYB1RrMNvvUnAEicFZgexpHleDW0aAb9K35w61OVkATCl
         RlEFPBiMy/Czkrntokzvt/7DbQnbcnYNsmbEDgBihmTjQ5KuXHUQRZiHBDJ9BOefJNPF
         rrm/s27ACm7HkcF8k0pDKYukrt/kbGiFxjuuiG8E6aCq6IA26wHf5T1L+a0KNPd20d8/
         h3IA==
X-Gm-Message-State: AOJu0YypU2q1t5jXPFvYTGFknu7adJyi4csxYwSRKmWQ0p+ZFepIuT5s
	/72cJyJG3wQnOS4UbHjv9jloE1VOB6z4VXSv9EyhhJX7/6r8h0ojCV33UmJw2gsy
X-Gm-Gg: AZuq6aLy7e+lmPDGU8+OQg2OFVlixDF5BKhldcZfqeDNIBc/S5/qdxRgMEj7HSyQVJd
	URlY2HKt/Q2ajgWsJgEjmpazvyz90KtTa2Y8zSe4sDb0G7nJcCwIgr3G75z1xkvdg6UCmwt9iey
	f9s8fXb3ZsQ/RYuVqnxhF07IauV78pPaQCApkJ0EEz0W1XAVSpesUcgD/AMazGhWCN092dgeTx7
	o1hmCdr6mvaDMmkIzNMrtewt17A7ph21llOFaxyW9Ow2XkvzlFO+nsh4bL2dU3I5gfdRqgqix+I
	K1jpGsQXsvoCVTE2sG2YEEIVk2LS4ao2uJmWaQjt51/OhfTrImP2867yx6a9sI1ODXAF2sBzM+x
	ryFLCKd0Ub0VOZS4pU2tUaqIKFJBn00dL74JZ+L7OfB/nJWELNAQ2IsiRv2UPadeVVE0LIvmL5H
	pCZNsroNQaPCWlZZV31ps=
X-Received: by 2002:a05:600c:138b:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-48365723e48mr2761705e9.36.1770836781584;
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Wed, 11 Feb 2026 19:03:22 +0000
Message-ID: <0ab331c556d76ddfc7f287d6288c4f60f4ef90c8.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110624_126048_70B956A6 
X-CRM114-Status: GOOD (  10.51  )
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..2d20b21fb0ea 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -18,6 +18,9 @@
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
 #define MT8167_DSI0_SEL_IN_MASK				0x3
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..03cbc393f978 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,8 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


