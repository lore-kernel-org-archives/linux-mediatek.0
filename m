Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE59CCA471
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 20:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh+sUFlOv59lp/vCBeSkjajmcNvaT/3Hx34rZwnuFVM=; b=QJUsPbXqcswwnehcl3MS1ov88s
	jFiizQ27rn7JPOcVVVoy111XQ/sQ5VTzH1kb1J/7sYg0rjCsUN4HlfoVcOtFlFh1pjXTJtgWvIcG6
	n6BEakjUVp8CtehSzjfW7rAy4hs7oCJIqWByZ16OTEq8w+wm6OJRI1BIR9660g88hg1r7BWulw0yv
	bIXzWly5VIIKonfTj+AM7kS8hc3oXWxDIWOcQhWQLFqr4x55S+wLH3yHtDGFk6+ni9opT9QD04cb9
	ET4jl2dIizb7eMLCAdL9ERkBm+S7Xz0jWKWnG+J0PBnsN140kFSs5b/AG/3jcpijrFv4h+HNqfH4o
	FKojXXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mCi-0000000D3xY-48Da;
	Fri, 03 Oct 2025 20:16:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mCe-0000000D3qy-1dWi;
	Fri, 03 Oct 2025 20:16:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759522567; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BewWrUSbHUV6Ma4sSIKIjzhzShF9pbcqjQpsgSi5VV8ZJ/0PmN4/WLJETBA1hanA/WBas9KsEHM37phCMHzTIixuSR/xsOJgWwY38Hh8x5SGZW7T3bxsUftfukcPXtJjeFYAt+CwLD1+Td9erCEGBOkKsT37JPL4EKbfDxxLGJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759522567; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eh+sUFlOv59lp/vCBeSkjajmcNvaT/3Hx34rZwnuFVM=; 
	b=KeG9a0qWHgpbzJNclaKV90zJf/KQGjakHcqovcgNsmWovU0Omm6LEt0NnWk+S31QiOAsEZjdqemA+xM1ipZdgxS4mzhkzjzjgYx/H4KenRnfvSKNR36eDbUn/vO4+RJRr+Ehb0+uWe0Pf3Ic4AoYtMq65bOoSCPgO4C9icNqmIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759522567;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=eh+sUFlOv59lp/vCBeSkjajmcNvaT/3Hx34rZwnuFVM=;
	b=kL+vIulPBmx9LaDeQ+jTQGDxoNjGGFN9cKpWi+SW/s1aPWa9bqkKr14EShgQIYzN
	r6I6eh0yOjI6Os39ivfO7tQfRi02ryAHDpiJqmUak0tWitZ5EEb9UlVVZrztQt6n+tU
	d1dOPktsNqULDMd0LaBjspASvqPMlAzfpIWNqIT0=
Received: by mx.zohomail.com with SMTPS id 1759522565601633.8413941370096;
	Fri, 3 Oct 2025 13:16:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 03 Oct 2025 22:15:08 +0200
Subject: [PATCH v6 6/7] drm/panthor: Use existing OPP table if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
In-Reply-To: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_131632_497643_FABA14F1 
X-CRM114-Status: GOOD (  11.91  )
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

On SoCs where the GPU's power-domain is in charge of setting performance
levels, the OPP table of the GPU node will have already been populated
during said power-domain's attach_dev operation.

To avoid initialising an OPP table twice, only set the OPP regulator and
the OPPs from DT if there's no OPP table present.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 978f193a2aee561fadd9a976e9b1417118260889..6beb6170d6eea3dd65880dfe64a61abbdd5f08da 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
+	struct opp_table *t;
 	unsigned long freq = ULONG_MAX;
 	int ret;
 
@@ -152,18 +153,23 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-
-		return ret;
+	t = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR_OR_NULL(t)) {
+		ret = devm_pm_opp_set_regulators(dev, reg_names);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+
+			return ret;
+		}
+
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_pm_opp_put_opp_table(t);
 	}
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&pdevfreq->lock);
 
 	panthor_devfreq_reset(pdevfreq);

-- 
2.51.0


