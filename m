Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E6CC352A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E83A822464
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7Ti+R0v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mP91Qror"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E83A822464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGEb8VGVhJEHJkR8cyZ9QXkE9MfEimXfVAXztIqDWX4=; b=p7Ti+R0v3LSENv
	vMJXp0YPFtAV+5keRESIh7oztYk+CcaFAeUAhw1EHSRsVRgxMaUH0WmPuMttpbVOKnAjwyBjvrgbo
	BVMrU4B+ZGEU9aQOtqyMuAYF3UWgyjryjR8dim8wpW6gcCmSM2lfgD6LRwLjYE0Pn4Vj5YK+RSrG0
	PEanEdUnORORmUYuHu+GrBTfcRNLtW/JbEnEFKU0P/9wMKuoNK/iQfYlxGyJLotCF/JToAfwIon4/
	5G0rxp0s+j5OyMsT3U8GkKXM089IsrLE9EHPqwwKxnHY/1DndsUsYPoGuSoJlIOpJXJCdgCK49ZpX
	hSZqzRAAmlf0+c6YfIRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izwC4-0000Wg-Ot; Fri, 07 Feb 2020 05:28:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izwAb-0007Ks-4X
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 05:27:14 +0000
Received: by mail-pf1-x442.google.com with SMTP id p14so680629pfn.4
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 21:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xiAuePiYUDaMhCwdUVnLN02q98KdUMo0qYM9SWCYvk=;
 b=mP91QrorHLWCX9Rh9X47DtclzQQKLoeO9iO3IvXmxidLSUWEYCmZG3ZEgKr0pSJKnb
 TWUxVRkDGv77ATkUUhec/xYpUXI0QkVwwC+ITTb2N+nslPjJNvFbiuP+FOKJww+18Phh
 gk+CCiFxNbG3t97x3izZOi0kxZeRlTzW3NCIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xiAuePiYUDaMhCwdUVnLN02q98KdUMo0qYM9SWCYvk=;
 b=TS4C7AC2GiI4uc0TWnLxi469qystzRDKwSTD+c+aNtLsbWugLMbFKtNpSDnpHwDYMw
 n3ug0XBYRPTogQXo32xNKmLZCVsbBCFI2SUi0uIkE6/8TPTR01Tq7poZAktqULrXHwqF
 TsWVkPqBqz1o0rwGwl/ZY3DZrvBo/9lYVNycSixgGWxMTPWqklXbJX+V88izIL6qhy2h
 UtvQj9o4Kb8LSSTahT9W1ToNXku+KZGnwhiy2PifpQ3KkQiwB2C68IocMJFvu7hvitsc
 QLpMSbGOmlcvz0vfVbCqqX/piiol1UxqXkbFAOt9RQ17YskoAmJFwKHITvetENLgxfoy
 gIug==
X-Gm-Message-State: APjAAAWqKRj6vgdloQwwN+ROOhefTP4OBkM9ey6aLN0oRCYTV+V4v4Pv
 nd+Qj6Wm74F/xji7LU1JVlHhzw==
X-Google-Smtp-Source: APXvYqzDh18JECBJPN5an/ZENhGDbzmt0zN9l3Znxmk+TvBwf8M3GApG6PLEhVwrfyAvj4N2hDOdew==
X-Received: by 2002:a63:2266:: with SMTP id t38mr7950990pgm.145.1581053232225; 
 Thu, 06 Feb 2020 21:27:12 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:27:11 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
Date: Fri,  7 Feb 2020 13:26:27 +0800
Message-Id: <20200207052627.130118-8-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_212713_341153_16E05225 
X-CRM114-Status: GOOD (  12.00  )
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
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
devfreq, and provides OPP table with 2 sets of voltages.

TODO: This is incomplete as we'll need add support for setting
a pair of voltages as well.

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
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
