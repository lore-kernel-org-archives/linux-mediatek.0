Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C04C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5D361244
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C5D361244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/QFosfdFUEoeRtTu8T3uCxM9Q9c2pVxzWXOJoRgMamQ=; b=UOc/qAogVha7wKArXp0welQgs
	gUeI36UBD9GiO14C6lCEt2sqCnY+Cp3aK1NPu3CaahUufaJ7hVQWPQTpjukDxn7/8gxSwDG4SjmX9
	2Rw3V2zeOOVTAwXSAINRXRBeDeQm3rdjC8mQfx/ZfD0DdeN8S8vtIIMuht3MHCYfMlvhkSuF+OFTh
	53JuY6XTHl2F6ua4qw2Y03OBLo/7LrUCN74xHM5kMdc44RlxPcBRY2MknOiQ6OLxml4WsZCO3QdIk
	Lwj3MLaMlE4DbZ0kdZczCgm1nTxrduFFtzKcQ+TfnXbtpXMszlJbx+AtB6u3sU73yB1d9aJUvli2H
	s/SPD3EaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOur-004Uke-Eu; Wed, 19 May 2021 16:19:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuP-004Uf3-W4
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 16:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IK1c2c887ldeHFDtRUuiF3rS58kRAch51Vir1cevvPg=; b=RWCapoYComHhVrh6JwUXsvokFO
 +OGf9+q8qFPHX1rt6PGTl/YYL9lnp5gYNn5r7epWbHWIT9DEqV0riAj8PgGnUks3UVpkp5EUBcDFP
 xFy5DOsT0jCt1i48VkeNXF8mw5jxFKN3omPVWK0TQqGlmkoGXOaoQpj1rZPfYGoNp1pVryFxOyekD
 Hvoy9/enmLJB618iEUdp/YOnG75ecIiR/PaGB1TL3jU/n+FN0PaeQllbYpuaPXCbzTFfPw9QSSVBC
 lrTMw/FYnDNr+Bb2BRF1bZejU9V4Ar4rhsSKjORcvGOx8YT9j8oIku824bZdpPFlbBxsTCliS2dYZ
 /DN6PczQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuM-00FcWr-0t
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 16:18:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id h4so14609445wrt.12
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IK1c2c887ldeHFDtRUuiF3rS58kRAch51Vir1cevvPg=;
 b=K6MirXc9/5vCvyi9STHJmzXDt9RpokogkyAfdnSgHs3AAJAzvHmZE7QZ8j8QxVyboH
 S/tMTUceHg3f/UXIY96B8GEV6s2mKGqJK9mEM55xS1k6QBRI79c9KD5Jltx73rFn0EBe
 0OIa3f+eqhmcx3uc09oSBD0nx9TwBWgPsUCmMV6I5g4aTkwdqxfYPkCdhrzxb5elLnZB
 uU5ETdguVMaxxwrtJTyf32yfAL7ch2NWgDDatUtPBTurFNufFoPIvykqCsulhgS8tU/A
 jNo+3PdmvyI6y2W37zitaXu7RuwJ4+2VETSnqsL9chlDob9/14B3S4e4/hjA8EU7OIGi
 xLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IK1c2c887ldeHFDtRUuiF3rS58kRAch51Vir1cevvPg=;
 b=WCkGDKSAn7/Ol7KkeCjIg+S/ExEgoXR+of2kuD9krFfoM0QeyNA7DzMhD8RjvKbakm
 lZ2G/Lc7hsb0Uwd1SZvItGXf/sARVdBMZHSn59+TdQMDDaQq69fYOvyCkNh9pxsYePXv
 mFTXOpB0UIj010YPs404kAIBnqXEjyOgPw1zCetkvAJ247TTWpj1s2aUJEWZ3er/ahj2
 sVNMc297jfYvCQuOMo/dHSAim6YRt4LrQc3D6Rjy1vUvXQ8cw3BOzynJH7LaBgiCxLjQ
 BFOpclf6CU3EdNKvkZvJKgOn9P1oXCD79kDISQKiXYHi6q7o79XWVrUh6X2CWK73In94
 DhDQ==
X-Gm-Message-State: AOAM533VeGdtd+aHYU8CtIvZqK7sFzE6hxCErCtiBOFJMUrg40esaWfa
 7JbBZyjT7WYww7oYzq/CJcpI3w==
X-Google-Smtp-Source: ABdhPJy4iXKMJIhEbcGAigZSDUzS3P3TsrklSNmpMykJhQ0xtLB1Ke5727ARrMPIKqi47rGUH6fe+A==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr11005109wrj.119.1621441131973; 
 Wed, 19 May 2021 09:18:51 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id m9sm5638547wmq.40.2021.05.19.09.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:18:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
Date: Wed, 19 May 2021 18:18:45 +0200
Message-Id: <20210519161847.3747352-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519161847.3747352-1-fparent@baylibre.com>
References: <20210519161847.3747352-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_091854_078111_5574C871 
X-CRM114-Status: GOOD (  10.19  )
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

Add the MMSYS binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index a419da33e10b..2d4ff0ce387b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8167-mmsys
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
+              - mediatek,mt8365-mmsys
           - const: syscon
       - items:
           - const: mediatek,mt7623-mmsys
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
