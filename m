Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A554CC3F2D7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F04D208CD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4YGjp4B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FtRQUH5O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F04D208CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13tiHiJtfeI22nVNL5tLEupujzxlnP/kkmPnamsZRag=; b=P4YGjp4BCZNgGK
	CAVNZQOFe67SLxFZSnfdUo/byAm339qNYKhTb1t6w4FVP29C0bwFEpAIFZo6iM8moUWofHJceWx9U
	v8TOFMxqRAdO7nq7ZYIL/KgDTwknejoHSdpR6fSss5Z6drvg5jAnYjJ1QoKVzEDWe8voGv+R4YevY
	TPm4jIWbcKIZUE2VcM3kYi9L8zVg2jMmtcuYvi1zgGHXIuUCU/2YazpNW1CtjJ7sjRdKsgCRT/1UQ
	LLPgMy0gbdBNIu9+NYmKZWeb0QB7rsfF2ns7mXoLxYH79r9+cdl1GmF99HYP++Q/MKn16fxXkj6wT
	xKaeJjFRcerodaUbnfIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA4OW-0007MG-Ed; Fri, 06 Mar 2020 04:15:28 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA4NF-000567-Fy
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 04:14:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id z12so464845pgl.4
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 20:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HBQjB4ox8U6+jb9VTlZJwNfTVSaeefy9+hgMvIEjQ6A=;
 b=FtRQUH5OUYVpJqGJFw4pf9BDWO86UmyPSwW6T6ArUmvKy+L8NZMKS69Zd8g6fgHCW6
 0mPP31u/78DXkPHUWk58NTxqvEUigQ2ZUzi57fYwL3Tw0W46bVVBAmEoPQdIec+ubGsw
 uDgYe71S/MAZJ9YwsWGuUpRN4MnSZ34NbGypE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBQjB4ox8U6+jb9VTlZJwNfTVSaeefy9+hgMvIEjQ6A=;
 b=NTfcpMIFsL0LVHyG3dZlvE/3xE5bPSy/93ZpNPNK74AOLacDJLQSPp0biybEij1M3y
 WxK0RDFIemuGr9LjXkqpdhwiPw1Ccz+gVDgjzapmV8IBpEdcUqH9PIC7WAy7VYjMcj9t
 GjNPh3YX1noM+PyZPqxk3WgVQgVobpBWMEKKKrgM12ytIwAAOy3S2i2conJXXTgv1aOL
 9hPaoPCrHkv4OC6+QNSFoXdIFRx1EAZG8raRH4svcmXX4xSGWy/nhcYycz1zqcVBED1r
 BgdiTvbjotLIHbiq2+wAuF3kx6wpjKX+FaP2Hyqdc+XltmMpIw4mMIwFRG5oaCoCPump
 /Igg==
X-Gm-Message-State: ANhLgQ0lzJRmEgyk8o+vgED14/q6wtIC227q0093ye8IUO5Gtdl5siAk
 rR/U3LbOoTflubyVqNDkk8Z4cw==
X-Google-Smtp-Source: ADFU+vsHo4JJ0N0WFqJ3nS6YhRMnj4RG/U8gRhcWvtDaY/ZipOvv4uxKm2K74UZgakBp4IYhT3R3Uw==
X-Received: by 2002:a63:d0b:: with SMTP id c11mr1383026pgl.296.1583468048577; 
 Thu, 05 Mar 2020 20:14:08 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:14:07 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 4/4] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
Date: Fri,  6 Mar 2020 12:13:45 +0800
Message-Id: <20200306041345.259332-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_201409_560249_826B5EE7 
X-CRM114-Status: GOOD (  13.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
devfreq, and provides OPP table with 2 sets of voltages.

TODO: This is incomplete as we'll need add support for setting
a pair of voltages as well. I also realized that the out-of-tree
driver has complex logic to ensure voltage delta between the
regulators stays within a specific range, so we'd need to port
that as well.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbfccb..9c0987a3d71c597 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -79,6 +79,21 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
+	/* If we have 2 regulator, we need an OPP table with 2 voltages. */
+	if (pfdev->comp->num_supplies > 1) {
+		pfdev->devfreq.dev_opp_table =
+			dev_pm_opp_set_regulators(dev,
+					pfdev->comp->supply_names,
+					pfdev->comp->num_supplies);
+		if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
+			ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
+			pfdev->devfreq.dev_opp_table = NULL;
+			dev_err(dev,
+				"Failed to init devfreq opp table: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret == -ENODEV) /* Optional, continue without devfreq */
 		return 0;
@@ -119,6 +134,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.dev_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index c30c719a805940a..5009a8b7c853ea1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -110,6 +110,7 @@ struct panfrost_device {
 	struct {
 		struct devfreq *devfreq;
 		struct thermal_cooling_device *cooling;
+		struct opp_table *dev_opp_table;
 		ktime_t busy_time;
 		ktime_t idle_time;
 		ktime_t time_last_update;
-- 
2.25.1.481.gfbce0eb801-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
