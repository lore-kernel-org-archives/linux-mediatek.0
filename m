Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD62C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:49:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42EB2417E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHqMoefN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQA07SSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B42EB2417E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPzKAZwgjO3UcVolmX5D1tCmZHYm+x+IcuXnN6pj3oY=; b=jHqMoefNb1whi7zFQPEtsMwgz1
	cDHLwOfIrRTF0JHbtMYz1f9ExU5vCcKIwmd5ovHufE2lOAgSzFoxyoYXr+Avy+OxzsL7JqYXjDGdx
	ja2c6tzWC7cmT/eQypNPmr4tGZKDA7x+zlXCNiGOOI8d+lvgx5PYb61syFwfpC0PQwjjNtOR5HEyV
	Ubn7fSALfjAwiNHk/exJotOzm4ceadsx4A+4UtFmK8tBp0a+vz1PrjUMrXdS8o0fhpOZJQk/fh2P/
	0lww4a95eU6VUhEU/r49XZRFoY4yAk3EICLhIfIUE4duh/M53n6yl4CGLurRzr9FPGBeYBWffDIfu
	8ca9iYZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfL1A-0005Z6-1e; Wed, 18 Nov 2020 10:48:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfL0v-0005Rn-Nt; Wed, 18 Nov 2020 10:48:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id t8so1167125pfg.8;
 Wed, 18 Nov 2020 02:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zjOvnLAOQsy57cB5qoAB9X0bM5DNCU/FW9wn1RhcsQI=;
 b=cQA07SSqMsNkm9+jgdfKQRHxG1dJ00n/CPBZkWn58B2UztcDBbwJjyqHXGy3WyabKA
 QsAnvdm312LurfVNA6kQFUDwp6lbGW/XB3Ijm2CMoFpKFcAh8kwJhT2mJWgZXG+f6b5V
 /u0hJm50DrM6rtDhiNe6fkM6ZDi+ZlPYg1hTaCkuVEZ+F8D+24p0mRveCrxvJz5QFPB0
 d1VL3NJR2JmYH0Q0gw2vE38JnLqceR+IlWf/7t20lg9BFlJP42QMSyQomQL5JjKhMGcJ
 /qHgGO9SqX7PrgOR+vaq3mCjFmOs+ttNDSWq89Lr9ayPYx6In6L1UeqCrSTrWgbvTgm1
 tdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zjOvnLAOQsy57cB5qoAB9X0bM5DNCU/FW9wn1RhcsQI=;
 b=p300e6/7nKZgXNnUJaB4ye0abUl16X5CX49lcZMVtT686GY7i3s4ZyIX9K5uUTcc88
 BbbhNC8IKuE8DUtlLjQlY80JCch2R6BJ+4xtvvKRtd7zPoUR9Nv6jaQqUusWCkd6p26K
 6eaGRGzSthWC2i4LVZb9fggAGNRhtyBuDxhDNGefxYKpy8U9lzV8Sn7Vviu3+aL0lRcB
 hTnwgmbEv9N4kenWZiGmw9TCThBguHQ21Mn5lbvfgBJTEzBRPGI4UDK569eVckZJYjdN
 RShIoVujEfjlNhP8/9zoWQnAUfwJyaIQdiIwI0/GgC9xeMLGcrUwAoYfohO/usyG8e44
 1vjQ==
X-Gm-Message-State: AOAM533X4TCfJ0r3TZC0iC7K2sd4NPPUaggcNZL2GZ5aMsquy5/BePlS
 tHXhyI4dxdbBkSJQ/qOC0Jo=
X-Google-Smtp-Source: ABdhPJwUz/rq6SqpfdNRkMp1aE4THDFn5FSLHfJ5d3S4kzuk11j4GVcZWYerOaT8nTA+a3y17rlyaw==
X-Received: by 2002:a63:c944:: with SMTP id y4mr7482403pgg.435.1605696513712; 
 Wed, 18 Nov 2020 02:48:33 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
 by smtp.gmail.com with ESMTPSA id
 a3sm25345154pfd.58.2020.11.18.02.48.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:48:33 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v7 3/5] dt-bindings: leds: common: Increase LED_COLOR_ID_*
 maximum size
Date: Wed, 18 Nov 2020 18:47:40 +0800
Message-Id: <1605696462-391-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_054837_917491_1DD1837C 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Increase LED_COLOR_ID_* maximum size

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541b..f356b61 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 10
 
   function-enumerator:
     description:
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
