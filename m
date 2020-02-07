Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CF8C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6720422464
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/4v1nnD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="leq9iVWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6720422464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vT1BJqTH+JV8CRqGy4fMIelx0nmiQWbNBxvCZj27/3I=; b=q/4v1nnDmWjQCp
	MHNLmoisTaWegHcRGCKxz4IbYiY6ibh8GOomHicT2XMKcwKoWjwcCyFiABH9vNyK6P0xQiC4FTD48
	QCxsG5HRmrSaiYedNl4V/JOobxzQlpXW9hf4n501HBkESeijqMC5fMjEZCxhJ73SzLD34S2ZaUVsk
	EbqsXZiiMOy+P/GCk/7FTx9g/1V2yC9t9CWcR5cZyS0U5OuOwHP8ecSlquRocHTWicD+K0jgLgg1f
	zgFkJey5gUb/nVTsmHHoEXRsWlxqnLdctic0OGPmOxz/9fhI6abdCm6zXN9WtVBmeI7k292HcqSjb
	sKnM0mqlPihdYqCc7jLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izwC1-0000Sw-Qe; Fri, 07 Feb 2020 05:28:41 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izwAY-0007H8-8O
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 05:27:12 +0000
Received: by mail-pj1-x1042.google.com with SMTP id j17so431187pjz.3
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 21:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1OPawnjFjdppk48OdmcnT2/7I2TyhqjSstM3nsHqEyQ=;
 b=leq9iVWFFwWc9SzvLj2OAYbrGFc+oehb6yV09Pzq1ffNBybAnHS5RyCURmnyFsX0im
 YaWhNs+Nl6tLggbvcAWNUCDzNlX5w06vGsu5yjYtf3DlLPTZoJsvQlAbq2Zxlqv3EFxL
 1QJBK5hAfU+PS0NW8uNLYDPFvg60Kt9nVRxiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1OPawnjFjdppk48OdmcnT2/7I2TyhqjSstM3nsHqEyQ=;
 b=UVVA8WQrh7ydK2IQMY3j2AEavkHvfhK2lEw8vnbgbPEuCDzbc532PgQJCtmRAdONB/
 OQptZHG+r1h3/kyaqxkUfNKj8T3j8ejo+dsKzbI61elcIqXUioCqJpa1FUmpzpheSkW7
 I1CmWBqn0LzOFWQT0fc7sPGqTwvCIA/ZJWeDKxOHW2bBXj0MLuDZwRJBTjoZWqXV7h1l
 HstcDslGS10vKLC+HEPZnuxv1kqb2QCf+BzXR3pJ1IdTKnO2Kkj195JJFgMsvQQGoK92
 4cJ+Obt7rssPzaucjOzvTG27BXOmSHZkrS6a/2sNc+YnA/1AAiUeXBCKCAew0EyzziCY
 kZEA==
X-Gm-Message-State: APjAAAVryHBz4Isfh84PRxW/mXgfgUfa8Dvz3vvZcsn13+3j/R2ZCBqh
 YTV1Lxaa+MmdJsfnBkuSZuSn7A==
X-Google-Smtp-Source: APXvYqxjKyDt1CleJdBxolsoRem+PmuvkMQG1Lq12fr6aeZNGLxW0nPVgS7A8TQfu34JJoOQ5pUshQ==
X-Received: by 2002:a17:90a:36af:: with SMTP id
 t44mr1758975pjb.25.1581053229151; 
 Thu, 06 Feb 2020 21:27:09 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:27:08 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 6/7] RFC: drm/panfrost: Add mt8183-mali compatible string
Date: Fri,  7 Feb 2020 13:26:26 +0800
Message-Id: <20200207052627.130118-7-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_212710_351707_007F7347 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

v4:
 - Add power domain names.
v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a6e162236d67fdf..497c375932ad589 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -667,6 +667,15 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "2d" };
+static const struct panfrost_compatible mediatek_mt8183_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+	.supply_names = mediatek_mt8183_supplies,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
@@ -677,6 +686,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "mediatek,mt8183-mali",
+		.data = &mediatek_mt8183_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
