Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA05AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:22:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4964D613AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4964D613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GLtiFgdy4WnLvXqlExnXpc8bJqvClejENkQD23O36M=; b=G+mQ/e/9FEqo+ry11bKopB7sm5
	NppD++2UigGHGnJr35d+RM0WpXnBScXsTYTY9ZXNLaO1qrP3uiFuXfaDu7YF4CoP29zMfXX2gQMOC
	hrLZ2FNv/0jEsdi8zhQf5mvbxdFsiARmlVdwgzDtKFqyPqf+jhibv76b+6vmkBHsXflB6+ZIMYTgh
	V3GAHvahaUj2xO5fAqTAL+mxy2tIGAnnmtDWyPEKHYCVdze5E4KuMRb6f+lh8cBwOeWAcWPBoDKoQ
	2iKhddfpM1tvOroPwLMWSlPx1zG2vOgq2o75+P2apNvIEyxe3YIvJk27VFjSQIKA92Kr+GNIRT8nQ
	A5Rt9viQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgkU-000QQE-4G; Thu, 20 May 2021 11:21:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgjr-000QBJ-D0
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SYtTHed5+bcflT7W1MwJxVtTplHwdof5DPlJCzKg/GU=; b=PSQW+qA2Nm1RpGAwx7wYaeo0L1
 Hg3Pwau29l9Wt8mb/erpwUfVJouGAT2aB9nG0SgsFoG3o/z70zH2PTwQoRj93MirMeZquKx0OF70N
 5Qa68esRcQ7ncU93VwEPQP3GR4V702FDVmwb47YPCXDCJu+E4aKOJjLhx9qTM++PPj+LNC7uFR4eS
 gr/mUlACOQlylVXHnqpoLT03pmhFZUMuF1d7HLpgJRP8iy1BLtm/da7yTZebdc4c7FIcKraLRmR6o
 PA7hfdLNcla/nqbOYr5GIZp6WF3qO0g3rF/RoEE++vRXco53URrOdO9ED0/puOy8cSz9rwqPLLb7Y
 YendqCpw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgjo-00GEjz-RA
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:21:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so5204417wmk.0
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYtTHed5+bcflT7W1MwJxVtTplHwdof5DPlJCzKg/GU=;
 b=wHzSjTiwKXBcRbEJoWYfBbHsBACdQyin173EJ35ibk/Le84pDQz22+ydLN+s2rjISy
 I+JQrHpSULjWpslolZhZ5oNzuFn6Jm4Xfez874QzyEF3o1vjZLDKl5RfL6iEpjDpTU6E
 GsWAE200CVFWmzZB0jBnSHQiysNZqmuHA4QBYeUZNk7kY6BB8Z9W7JH+a6/3a+lWNf1q
 aiDoJJPNe7khmZ6EHXZO1bhn6GXd4F7Hp/o3NyaiFDPEhbKCcue5aqXjPfe0cBmp8TKB
 DNHKneadShb9fVu0FQOnKh4P481VVKGXrk6C+/s6sN3zz62tMKeeqha/+VCFc2gHYup/
 yVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYtTHed5+bcflT7W1MwJxVtTplHwdof5DPlJCzKg/GU=;
 b=ascdHJMk8SdEptmxfqtkX/4rSBSOf0qLzCXdKu/LHDgh2K483JZAO3bd/SD5b+U8li
 VoLdTLz7lgixE7lnxBIsaTs99OVK1ZvKguOynd6v8cI4eaPEmQhI9ckXdz17BkSCc99c
 g/70shuf3+edsQDx9tDo/0oYdXMc6te29Lu30f5jHlciPJw1arj8boiaxCJCq4bJwiGb
 qLcn9T9Xae0HyPLO2dfli2xvslu0XTegMg7HnxyDkWLv60/dkaa4KWdpoz4lV9g4COIz
 KkbwMTkPoi4NuysgqMiKYrofKK4QLHZV4DlNJWdcbVDsjwi8ixddlCt2FlV10VZvq551
 mZWg==
X-Gm-Message-State: AOAM531wTn7MgFWx1/x5Ms3zE0lFn8Sz/jygwWfTVkrd+aAMgXL6dN5l
 4I4UXNxwvEtJLaj7HNE6J1GRiA==
X-Google-Smtp-Source: ABdhPJwvuM5ZR01Iie6YuQBaMHLb3duG28paxLrXOheP+cO3HgcEo+2Qn9ejUUvRZNq2JhTAWP7/DQ==
X-Received: by 2002:a05:600c:5c1:: with SMTP id
 p1mr1599688wmd.10.1621509671651; 
 Thu, 20 May 2021 04:21:11 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:21:11 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] i2c: i2c-mt65xx: add MT8365 SoC support
Date: Thu, 20 May 2021 13:21:04 +0200
Message-Id: <20210520112106.77190-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_042112_897754_7B135E8B 
X-CRM114-Status: GOOD (  10.41  )
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

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: No change

 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..0e6ad84e0e47 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -404,6 +404,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -412,6 +425,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
