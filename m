Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D06AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:32:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A485161164
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A485161164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SVdYxIyAm7KxbbKqHtAKxLws7PM1b0ZhuDJlE+m642s=; b=LJkBc+f8dI4OxE8XPUHEbESA2
	24V79fyPn8blanmH0mri4+TlxbLPU8SRhX4JuIrxXlK53t3CyPzFrHOUvhRLKyvrjdjp5diUN3I05
	P3FLmi09cl0wWhvVmuksIW1wPX3Y6LZ/alLUQRqc/hKlnN8L6t//zPvnYKdYlCX96aUG7Ids0AbOX
	faavsLo4qE1BIl0wF1cDFysHGGE2Bcql5eDfcalAOx1lEO/e5OSOxcLKc7Gcm4X+Cec4RyhR2yoIe
	kSOZCCK9uN4GouG0nnA6qR7gOUxb/Yg1/Y9Ww03fcxIf785VQzKfPtra5CjKJQEY3LzZNOsXiQusI
	JdkB5XTuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjMy-00DH5x-D1; Wed, 14 Apr 2021 17:32:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKi-00DGSc-96
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=70dSAhdvNf9rW7naVyB8FacZo/tKpmgYTIzZpzN71Cs=; b=ytwyHyPrUWfnOmxzSCuYUYsr1I
 0qUAlDQH0jToA1NiIc8etpQb/cAfIwE0qUfKMts6BEMe+H28WVqv4fcHPq5QRhNZeZ6wQs+lgUi6b
 oT3I/ig4A4UG5bWi3HM+PQxhJjVQqIDC3G8Sk57+RyMSP38gpbbgCRmtQ1MOW8SRIIyO51rp6+yrC
 fs6zwRBGRKlo8lRGXEy9AbqaueauDRe5RcYydWaOeQyOANAgbWdDXMlI7iz9aE0MxL2F+onjZptkM
 8pdKbFUGvrX5TIw2hSrfF1GuJliU0/NW2RiTDj79fUWJt2+7wrxYZexPWyi8LYf4ckYRI/gfOgVX4
 lRiSbtmw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKe-007ydm-Oh
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:43 +0000
Received: by mail-pj1-x1036.google.com with SMTP id lt13so1776564pjb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70dSAhdvNf9rW7naVyB8FacZo/tKpmgYTIzZpzN71Cs=;
 b=LsiMLszNVSqTMFSOmT7Vt7BL2HWjYpQnn9/Ah8Ahmt14VXi38iwnxuRRnAMd7nV+F4
 L8OiYKIW4vYpw8N0fUeTwgUCiDMq5+HbPF+3sOym2H36ZFwtvq4PnCKSeplaTzdczwh+
 M1/M+ijlrnFtXNjeEsgG7aN63y8Ce7LLt8uSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70dSAhdvNf9rW7naVyB8FacZo/tKpmgYTIzZpzN71Cs=;
 b=e71etT5A9JoJaN3W2kKc4eStW8XO6auVsIAzQA6QVCRJOKe62EVyKDTLcOmxe8Pd7F
 4YKK4hgSQ1S+l1V6x8W5PE5QfUaxpECVs/TO+wdxuqfbIZ4LRPnbssJHyL3xzDYMuE+e
 timjJ/ncx2DjF2sWThOmWmrk9nEMc57lzgncpBiMOKhRHHDiQOiW5XNsi6LSb1PBFdkj
 86ZLAWbk2Xr9zD9DL2avGRrvAEOBlQQrr+2Vt6DQWyHrVIiLxH6bCHnW+jqFc4+7Uufw
 +mXh6lmR+kFNKtxHZ+xBmJ/3M6KHUd/d8lVKQfhdHZJgZ9rTcis3ZAvL5Fg0sZNdIfgn
 hykQ==
X-Gm-Message-State: AOAM530S7o2tskl/kWKXTUjEd0gKhJrwL8B0RXUAaZPQZZ7Mh05w6+VF
 TzHS6vNJt61QXQv+/G6oG/QQ7A==
X-Google-Smtp-Source: ABdhPJwqy6xfsxSkXZwh4yhPlR+yx5Kxrr/lleQqawAAaqaYA9AZc2k7rgE80MSaJDQAOD1ejSDS8w==
X-Received: by 2002:a17:90a:ca83:: with SMTP id
 y3mr4896192pjt.191.1618421380273; 
 Wed, 14 Apr 2021 10:29:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:39 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 6/6] drm/i915/selftests: Rename functions names
Date: Thu, 15 Apr 2021 01:29:16 +0800
Message-Id: <20210414172916.2689361-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102940_808664_05F0947A 
X-CRM114-Status: GOOD (  13.35  )
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

pm_resume and pm_suspend might be conflict with the ones defined in
include/linux/suspend.h. Rename pm_resume{suspend} to
i915_pm_resume{suspend} since they are only used here.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index dc394fb7ccfa..525afda9d31f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -94,7 +94,7 @@ static int pm_prepare(struct drm_i915_private *i915)
 	return 0;
 }
 
-static void pm_suspend(struct drm_i915_private *i915)
+static void i915_pm_suspend(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
@@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
 	}
 }
 
-static void pm_resume(struct drm_i915_private *i915)
+static void i915_pm_resume(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
@@ -152,12 +152,12 @@ static int igt_gem_suspend(void *arg)
 	if (err)
 		goto out;
 
-	pm_suspend(i915);
+	i915_pm_suspend(i915);
 
 	/* Here be dragons! Note that with S3RST any S3 may become S4! */
 	simulate_hibernate(i915);
 
-	pm_resume(i915);
+	i915_pm_resume(i915);
 
 	err = switch_to_context(ctx);
 out:
@@ -192,7 +192,7 @@ static int igt_gem_hibernate(void *arg)
 	/* Here be dragons! */
 	simulate_hibernate(i915);
 
-	pm_resume(i915);
+	i915_pm_resume(i915);
 
 	err = switch_to_context(ctx);
 out:
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
