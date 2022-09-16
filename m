Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218C1C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dYL9wlLd/USNcoZdGQTOq8OEjfqINlLA5t7kFKr1hLU=; b=slTrj3GN+ODb3f0GB5FRmJTeW2
	DBLZ8f+wc3N7OrDBSd4n/GXUF8QYvDIiThILNLmyu8LxX1CUoVw0h8uHyvWrzA78Q9LM4d7I5eagL
	DRxhH0bErWeIAVDVW9isYsiN8PBD27KbB+mjRC3H3Dh/uBD/tFszYWOXBzeDKSJ6ucp4kjemP+6ar
	76PKeRCwO/eAB7Z17ZK7wAbNk+1ufW8wAAbf03+ehJm/UUiEDueI/1BfDJZerJsmmtjKeeDLtwiR8
	iufbYXg6K0IfsMcp992wPJfm2mCXPlJJbyTvJLn/UpvQ385MAud/u+wgkMCZAWAosW1OB7AL54JnO
	0LSIKJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1G1-005kJ0-HF; Fri, 16 Sep 2022 02:39:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1Fq-005k1n-2J; Fri, 16 Sep 2022 02:38:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id t3so20151267ply.2;
        Thu, 15 Sep 2022 19:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dYL9wlLd/USNcoZdGQTOq8OEjfqINlLA5t7kFKr1hLU=;
        b=QOs9nlCwzQ4O0onMGYNUHEonyh2ChOvardFTCdDwwZarJZT5Pk3dwm0nItbHKIchel
         cYYMsG59a4UYPrYgbMjERQcbWu+WcwGIMPufaiRK9ImjIIBnXwM7tbXmqu+U+GWYbYrx
         HVkBOYhLZAFLf4o+kMlkBKuDSnvpWuuvtixIWCG3OgPLjpEd6Rz0ZcNVAq65T/95tAph
         sNcvKfTCumFIs+sQrkvmBuSwaN/YIlpRP1wkqWGOasIFzqcCCn46rUvzDqPgoen70m2Y
         wB3wCIgc+4NIVLAzI3x0yPPEh+GrF2Nk3m/hQZbZvzienBNNuqZtMgcS/LDlmqTWLsta
         B4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dYL9wlLd/USNcoZdGQTOq8OEjfqINlLA5t7kFKr1hLU=;
        b=EQofVBeVrFYzxLUBaH4dEFobSqTcsYPzY8Kny3/vbtzswoRNr9dl9LhDAzk3x+bdRt
         CPbTjtpL7Va5KZvGTguDqYzFNVdEZy4TjVaJjh9sbRqOa+z2hDiKmkg9Wq2L9BL5nlFP
         LwYCAU66R9IpMmEPguMm2ghMRGPQY4iPx6UtIa5hfs3dcyy1n+w5/8f97DpGkATynwN8
         EFWVbxFhWMvS5qxqL/dlqEXCdqVO/TyU5h5vFZeqK1DJ5x6glxDYWBVkQA23pRBQ+L/4
         BgKAlliD7w5aVy0OI1i7j6SjPGFVJz5ebpMFLe6ZRQwOJaragRqhAWpkd3N6w4u6BLY5
         Ihfw==
X-Gm-Message-State: ACrzQf0Q45Zn06R3uODbIlvngfD76JERmUo1ZUp+1FJtpqEcfYF7jvgn
	yk88ktYUZSNfbEOeDf4J11A=
X-Google-Smtp-Source: AMsMyM7HH6nMrLQACZzZgcWn63QuPoiW0OKgwq8iD+IzfoinHYdc086atcyZrpUprByl58WLqVHMag==
X-Received: by 2002:a17:902:d54e:b0:178:2da7:1bea with SMTP id z14-20020a170902d54e00b001782da71beamr2539423plf.161.1663295936126;
        Thu, 15 Sep 2022 19:38:56 -0700 (PDT)
Received: from RD-1129-20047.rt.l ([2402:7500:578:40c5:44cb:7b1e:21e9:77e5])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902d40900b0016bedcced2fsm13551480ple.35.2022.09.15.19.38.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Sep 2022 19:38:55 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: mfd: mt6370: fix the indentation in the example
Date: Fri, 16 Sep 2022 10:38:49 +0800
Message-Id: <1663295929-9024-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_193858_130941_06E4326F 
X-CRM114-Status: GOOD (  12.92  )
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

Acked-by: Rob Herring <robh@kernel.org>
Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
'Acked-by' must be added in v2. But I seen the reply after I sent patch v2.

Sorry to add 'Acked-by' only in v3 change.

Since v3:
- Add 'Acked-by' tag.

Since v2:
- Add Fixes tag in commit message

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


