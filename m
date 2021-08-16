Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB79C4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A747660EFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A747660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDmmyIRX/vuL7ZU5bErBRnmjSAfNTdMMUDjP6eOXteQ=; b=chh43tKSfilNpR
	Dvy+D74rVOfkfx6QIQSc6B6J6xXGWaLqzxXw3YPXgSfNUJBLOe9uZEcDl47zcLH21aeMg0oY2k4yO
	hR/UFvdEY/qeSd3dpZmK/Vo6F66LD1PCAhruUaYMvSjs1XgMULrVcvge7Li82pC6NteU4DSI3JnSb
	T+DxArVWuNR8Q3+7xMI/beGpqiI9m5z0GirNpN6w9+I+9bECWjgyjKxY8FVpKEWkhevs+ue84xF9T
	BAcyVMdR9MQy/D9pLmaEVCjH6D+dcDTNukVxTNPO9wRRqAPdhhSQ0BUcu5rgR096xItowLsaf3S1I
	yGhhzwYY/pUIjJ+lIKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFfge-00HRVb-A4; Mon, 16 Aug 2021 16:42:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFfgL-00HROT-Nt
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 16:41:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id h13so24598896wrp.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxcnjHPA5B0j7qX5chL1ZJXQsXksmgMefqmaOOvck6g=;
 b=gh2l0B5f6EJ7VXrb+GYCYmriYpOHMNPGU+nz2lisk3yiUpFuUBbr7Tmf1rybpLntdb
 hdpRJ/659TUr0FD1rANpNv/MxCvfr/etPOeFIrH5iuFKbzHh3Wg5gPMP0FxtJYdyG/Sn
 +rvl+qFCJhXyjJeAPjdCxc0/HEbb1U+6mAgWQD/4EedobPEVDBIK4V6Cru7Cu1b+pkOx
 hjEAfM3awnc2wpXxrBZXNT7nNy/xb+LBP1kv/HQJmSZDm8E8B8s3TyfMoEdUlGX95Ar3
 hQbuKj9KYNazwHZdUkPr1axAssNcx9D5NC9LBJ7PhLJg9ACo/PgzOY/Ay61t0PcRmaIe
 imDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxcnjHPA5B0j7qX5chL1ZJXQsXksmgMefqmaOOvck6g=;
 b=gZqnXPY5UgYoo5vvxd3JU4EbPi724PzCXKU0RF/yMTM3VOmr1NlQRZnFxiIbeh3+e3
 un4+w7dts7PiKFzACKQD01Mki8BB930gAOjNMjhUdeumx/coyRAcHa2YCdg2NjP0vbo1
 Trywp7cM5//ud2lskOcpgcLtKxhWA12nAOS+kzD0ii0whBenI5xk/ruwYd2aonNGoGVl
 vKt4LsED7qzyb5PWWlMj6yoHw70rQ/Rxzu+qsraQiCkg4bmbSrupNe3p+661Lb7ywqWe
 7tYbXtUTOwuWYBvFvUQMKxLPY/2ZY5GVGdsbuoXWZdHjdVGAx/PNFxSOuUlJJ/NBgYrE
 +YBw==
X-Gm-Message-State: AOAM533pMdT4gDysY9NhZsZXAOABAHIHK9mcZqyCZwCI+mTWDTM4cgjB
 Uz3hg7zq8OVD0GJmK8695H7tMA==
X-Google-Smtp-Source: ABdhPJz88fBErB0TXJjcCkHN84Q0xoZWg8NEBr1BSB0Iw+EaQ1/y6x2qK2vtpblHlClHO8Q5N0gAHQ==
X-Received: by 2002:adf:f292:: with SMTP id k18mr19621618wro.249.1629132107978; 
 Mon, 16 Aug 2021 09:41:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a81:3690:b885:8dcf:f8c6:7841])
 by smtp.gmail.com with ESMTPSA id m10sm15211730wro.63.2021.08.16.09.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 09:41:47 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: ben.tseng@mediatek.com, michael.kao@mediatek.com, ethan.chang@mediatek.com,
 fparent@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: thermal: Add binding document for mt8195
 thermal controller
Date: Mon, 16 Aug 2021 18:43:05 +0200
Message-Id: <20210816164307.557315-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816164307.557315-1-abailon@baylibre.com>
References: <20210816164307.557315-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_094149_889756_B00BF882 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

This patch adds binding document for mt8195 thermal controller.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../devicetree/bindings/thermal/mediatek-thermal-lvts.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
index 69ffe7b14c212..2e1ae00d4fd18 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt6873-lvts
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt6873-lvts
+              - mediatek,mt8195-lvts
 
   reg:
     maxItems: 1
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
