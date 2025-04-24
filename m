Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A008BC369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=; b=qo5dpv4c7gR+F2X//w2N9ghrfN
	uJBHlnReloIbboZeCIjp4bByJivUMTQmiJw1JIPfjJekXJXu13NSUxWdAJKNm9IyDMM36ws/zrFJX
	vFKaBxK57OYdWPl7uLUaHV7Hql3JzxHL0ih6ZbvXDC3PXwjOdQ5kv/LtG7dX1aadWijfzloUiL4Xw
	6WMFTjBIZgKrJuCQPLLEfdhrASk3wbxTCYl9FDuind2lbYTf3wwnD6PIAjB+5h2xG4zwtoMuDwopy
	onhUfavnd+6+cFM61r+mv2VCt3/fdaX3AK3V+vGzgSCRCwGal9aEhCDl6+7RX9BsG3DWvLVecmu8X
	6jzUSq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uog-0000000Droy-2UNx;
	Thu, 24 Apr 2025 11:32:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlt-0000000DfS2-2BxV
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=; b=Jj0jAm+WULslT3FNJQ3n8K7RhG
	FKVucKVVnITdurpZN3crJNoofs/hWV95e0fKzlgoP3RF3j5YnEr/ZcKkrOjGVRs98L0c9vvTQJnF+
	0VYhuRZdMaaAcwFPYE1MtJHjOpHRQuNDwXSAwPUicip2zV2M73tIuv0fvFcII/gxZy0Pe+bmyEGqo
	HyeLa0DIFNW0Ml6ku4PO2ZcpGtHmSN7tnTKiopR4Af706qyVJJBaTQVlUeF3TdBt2v//yY/6jr4VY
	3Wc5pCAAPE7NtyR1bTTrnWLQ1YSEkV3qBKFYSv3iAUidB3cZnZ+UfN8v7ldW2OrbC4Z3qhmo8w1ih
	wHTWtNrA==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlq-0000000BjUm-02nv
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227cf12df27so7735155ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490326; x=1746095126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=EcTdTVvIGuBBfQBX02UU1JkMbdxpOZPWABIaoUcGs5Ars85ySJ89UL/+/csYot8C6+
         e7MlN7uJxVpNlWoEJ2vFa7tB2hy0SNh0JOxWRxipf4b0Qj2vAuCDde6s5ANJ2209f8Hb
         9nhXeydHtp4WF4crhqghyTiXctBknrBs3LUvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490326; x=1746095126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=UC+WOzLkWj6KHdgYgGjzk/bc9APum7fhX73y5oQJZZ6TGi75CMOlzVMCsOAP8POjgY
         kwxc59lFAwz7ACxh8geBK/MKABvXk/W0o0jBf0yn4tecstgC/RoV+gjhXWHT/G3eednn
         F5eLQXSA/RmT3Wgke05TbPvNgua+xJ2J1I1I3Ss9kEFXMjubyOjAu+rPQ73hP5bFuF0w
         hbGbPPKN2B+8BC0kY5YkkwsIpWb01cW/1tTRfqED++YGReSO8/9R30flYhjbcH14aqFx
         Jy3yBZFeWKqI2Ov/lfHVgV3zPh7LstTLxuipxOoJRKQOfI8hbgHYIutdORmDLi1ztWje
         mGlw==
X-Forwarded-Encrypted: i=1; AJvYcCX2MKEjsRRA6tdYxwPLn2RtM6gzah6FJZUr3i29pPuZAfPK9ng9g8/uT5Oc18QMukwCXbW2k3gWplKbPmQkOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMxQSoFVV99CD44pMkCjcxjN18PToD2K4LVPJDegJ9Ik5+nLK3
	Faw3yXcTNlKMLrJvq9jB9jkYplCmW8+IKSKBYgb0HNYuY7taEatMXGF92m1rug==
X-Gm-Gg: ASbGncu9nxADH3ztdEWJMChl4lLJ9yVjKww7KAYu67EJHkOotJUKWWA79B2Gh9XevVH
	8ACIDPfviS62rYkfdOmU6acnPq7+3N3x8HpUjaK+ZH/7GBczb+2RELdyt3wlK8FGIcwA2YHJn4H
	x6wqLFUzFP4WP5OVuqx3JgCHLA3NldRLqu48thHduILyThr7KCte3GBX2MTX7tz7DQ1pSwAxGRt
	66VCdbdij91wSGBeqdKP1gKo/mOa73hqmNBEXWrU49hVjDdQZmDAAJtlUYSxKkkGpq5DKIl2Tpt
	NYj9rL4AT8SNe7S1L3ZlcuuyDtcHAsPxh5I+PTFiU4cseEzeRr+5iMpNKg==
X-Google-Smtp-Source: AGHT+IFNflA0jQPNmROa9h8mKkta9N2LCXUl+MkxIZxkk1EuSqHoA4OT4/Txgj+BWOug6XhvWUVquw==
X-Received: by 2002:a17:902:ec84:b0:220:e91f:4408 with SMTP id d9443c01a7336-22db499755emr24690085ad.22.1745490326648;
        Thu, 24 Apr 2025 03:25:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 24 Apr 2025 18:24:56 +0800
Message-ID: <20250424102509.1083185-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112530_099016_3E44146D 
X-CRM114-Status: UNSURE (   9.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.49.0.805.g082f7c87e0-goog


