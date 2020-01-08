Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF55C00523
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C34620705
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAJQPdEp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S3tVQZXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C34620705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akLa0yYaHedU9z6dKJGnWt7iFieJBu9vhMbB0iyRPxE=; b=RAJQPdEpbpTf7k
	eaRGaNedHHFLYUB4ady/KwO8foYefqrEuB7JiT4KVbzV9mFwTTnF9I6KqsjtlWPgr+zQ1iNAg21XJ
	gD75OtDHjT+Sgx17NGXk7RwcZm2yZtk+gWFnczmk5xm40nCwtS4PtdC85XxYlyyg+EVc4EzV967ZY
	YiLQkgEZX43cu2dQHOd75/Zw3GKrO395yCGLyr3WLq12uu1nyZUDb7IxlFWrNLLoVE1FrWT105w68
	Oe3KVP5TTszQN+Gp12DRWQQTKDyIKZgYy9j7WRKnsOS8/vDPDHkOWt9dyASbx7MQGaKC8L7/hrUXj
	yY+j8P65Rj/X5fNJCnIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip3r3-0007wj-Qj; Wed, 08 Jan 2020 05:26:05 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip3pI-00050b-PB
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 05:24:19 +0000
Received: by mail-pg1-x543.google.com with SMTP id b137so975434pga.6
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2020 21:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLPzDvqsyKjpMgl6ZY+ZEjymtgHHsFzBQXHTW4eiM1M=;
 b=S3tVQZXgAvZAvGKT4jucRDlF/M0TWOh+3V7E9ZFoKg0xoIXSRxIr5TYGLCUnvTfS9N
 f+oKg6lg9u0QxJzV+FId6ptqevsKmNbYDMNZJ9DJAVLRY/8KFELoCSNhdge1SKfgY0Xy
 AuK7NrZkfWLHM89vkHp0eJTBqDJW+EynagsuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLPzDvqsyKjpMgl6ZY+ZEjymtgHHsFzBQXHTW4eiM1M=;
 b=HuDnEmx6tf/IfN77DuXBzo0i6TaWZVYM6KRbgA7Sqqf8MJ7kwsSu9DsExPcNbyDGsL
 OcJYrJO9sl9x55OIlWhZCPdZr77MJ6/UsH1DSKYDV7hvxHka7OdWTt7Mlpfuc1Sifw96
 kQGgw1cASThB2UC5zoE6qE+17SF546jet6v0jQjECDRaNV5GyY8q/5K/UFR9rW9PXBz4
 IaEcQOUcx/m0CavoSxu0BYUc8SGZLgwucaUmyevBTmICxR9PH3dVKj0PkezFiHHWPdzx
 fLUrim4p5qG+BCpegpK+B96prD1hDYTBdlzgOSnT451npWKvyO/FFDeMWOII931cppUm
 uaNg==
X-Gm-Message-State: APjAAAXVqbMoUY6l5S+M73HxB1pKiQoVgX/O2XeBKhkEYPCw1LmFXHmk
 3fhm8ieevXMNN12dGHu/rraKog==
X-Google-Smtp-Source: APXvYqzoefkOYFH4FXTTMbYJDxtsQiuVsYfMMaYxsSll0XpoVzmSh/ccdl9HE7eeGAdfYbzMduo/6Q==
X-Received: by 2002:a63:ed56:: with SMTP id m22mr3334545pgk.261.1578461055680; 
 Tue, 07 Jan 2020 21:24:15 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:15 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/7,
 RFC]: drm/panfrost: devfreq: Add support for 2 regulators
Date: Wed,  8 Jan 2020 13:23:37 +0800
Message-Id: <20200108052337.65916-8-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_212416_832593_63318C5F 
X-CRM114-Status: GOOD (  11.73  )
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
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 18 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbfccb..5eb0effded7eb09 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -79,6 +79,22 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
+	/* If we have 2 regulator, we need an OPP table with 2 voltages. */
+	if (pfdev->regulator_sram) {
+		const char * const reg_names[] = { "mali", "sram" };
+
+		pfdev->devfreq.dev_opp_table =
+			dev_pm_opp_set_regulators(dev,
+					reg_names, ARRAY_SIZE(reg_names));
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
@@ -119,6 +135,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.dev_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 92d471676fc7823..581da3fe5df8b17 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -91,10 +91,12 @@ struct panfrost_device {
 	struct {
 		struct devfreq *devfreq;
 		struct thermal_cooling_device *cooling;
+		struct opp_table *dev_opp_table;
 		ktime_t busy_time;
 		ktime_t idle_time;
 		ktime_t time_last_update;
 		atomic_t busy_count;
+		struct panfrost_devfreq_slot slot[NUM_JOB_SLOTS];
 	} devfreq;
 };
 
-- 
2.24.1.735.g03f4e72817-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
