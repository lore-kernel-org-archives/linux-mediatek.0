Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DCFECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9iChXnOlLAzZFdNLnY5kfU9Doj3uGfj35dzgStEZMU=; b=vGSPWgcdLTRokfK8UqG5a3eBpd
	pAzI7m7KBFZpFnI7JL/prTSDBoznHFsI6h8GVipTffaOxbSfYyV2ZaxNF4YHxMC6+j4YaOhk9RoJY
	YbJUNmMBHfJ3MEiqRNiHAIwG0HkMbIpk5Zyl45JqrnEutloLLGm0Kv9LiBR5ZSx0C+IVQ4ZkjqPv0
	0zj/xlgSZrqdHZgqVVjXqfW5F3xJgXMrPsj7AfzJxIvDccly1MinkFp1OnJ4FkmubcOQL7YDTvxAW
	ge4lKhOi2vHdZhsX61oK8pRf9Yfpcrbv0ahIX4RAbNXn/4zPMd4yAS7ZapzCZkAR0wAv1edmnBsBy
	Vj/3WLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNgQ-00DXoH-GW; Wed, 14 Sep 2022 08:23:46 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNgD-00DXR8-6G; Wed, 14 Sep 2022 08:23:34 +0000
Received: by mail-pg1-x529.google.com with SMTP id s206so13675871pgs.3;
        Wed, 14 Sep 2022 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=P9iChXnOlLAzZFdNLnY5kfU9Doj3uGfj35dzgStEZMU=;
        b=pE75bF9llgDlVL1tONbpIXNBJPLRnBJ9hkVccGmGOVuo021D3xEEvmTbepvrp8RVQr
         ksUoC0NRWRrNZLspcVVn15dc6H2MMgAUGlezFBxb336KBr2ISMC+Dob4DjGk0FXlLOdr
         WkFcg065fEqebST0Ysnz2LT/kpx/5VLtckcfp7gjjoudRS21JgjoxZbTi+2H4DxA0bVn
         IzKXx6LwUO4kUp22kqP9tM6yPZmYTN1qotSSkGMZmYpLiXRsvbsxLl+Ffm+JeCgEc6kX
         Ux3dTYooLnUEPTySDAWTWdTXIlOqiLvClX3trv6ZUD6Nz3p9d6P+c2/KkvUMvOIaNd7c
         buaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=P9iChXnOlLAzZFdNLnY5kfU9Doj3uGfj35dzgStEZMU=;
        b=73mmGscTITCalciGcIDl2vfI4tNp+X9uTaycJRCHXtdZMC1ccOhTrDzFeVq05HN62a
         5xjEC82a0Vj38a2dprHQucmKCQ1BJzB21q/a4N8WiDQITCi12WeXi09V5NUZ81e475Hi
         PH19DHlS9ZYnBQzIpjUfwXwAsPkGYTQG9Xx13PpoC9xxbxj6yuBNUpJwf2SzE+7byLEh
         t/GQ1pVL/WnOLNR3FG5/eNhUEXxuNpX+ZUD+O5dcPbfpHb3np5uSHSD1pFXqcO5G3cMq
         jH8KRiPMcFNCl5EtI8zm3D9Te+3dRRYRFl0+wZilHduMazw0HHr+qL7qssqfw4QoWkhy
         jrHw==
X-Gm-Message-State: ACgBeo2d6YHmWP/dBXO0soJz2GU3hZjM95Kd1LPTl2dxHmxCYga9ptqQ
	rqqzFVjUUWVOdnP2xhFlOH4=
X-Google-Smtp-Source: AA6agR6dE7decz+Ly0pUJByGQRsEwzFqUinIHdNRUA3Q963/UJZSsOEZOG0jYDqSaqN70/rX5SouIQ==
X-Received: by 2002:a63:81c8:0:b0:438:919e:8256 with SMTP id t191-20020a6381c8000000b00438919e8256mr20790669pgd.39.1663143811878;
        Wed, 14 Sep 2022 01:23:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:486:362c:d94f:b1bb:6842:3424])
        by smtp.gmail.com with ESMTPSA id f8-20020aa79d88000000b0053e468a78a8sm9381986pfq.158.2022.09.14.01.23.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Sep 2022 01:23:30 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com,
	chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: mt6370: fix the indentation in the example
Date: Wed, 14 Sep 2022 16:23:23 +0800
Message-Id: <1663143803-28660-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_012333_260010_42039679 
X-CRM114-Status: GOOD (  11.20  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Fix the indentation in the binding example. There're two redudant space
charactors need to be removed.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 410e2d4..250484d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -119,7 +119,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-        pmic@34 {
+      pmic@34 {
         compatible = "mediatek,mt6370";
         reg = <0x34>;
         wakeup-source;
-- 
2.7.4


