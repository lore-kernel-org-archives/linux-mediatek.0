Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5859CC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:21:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80D5613AC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80D5613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu5kptlvnT5kO2lcGQlk2nZbZnwRTALy20GzVxiu7GE=; b=Xhg+FpRfXfgY6GEcNhEMwVSe6X
	2qy9fEI8fnj1OTLwC6RGhqgdj5w7w/ZXtnM1EaJcKdzv9sT1273KEa626sQb3dbzxa6AoyBBb3mIk
	vVOZKfqsPHjpLJvRzxyz0TmHNW2YJbSoq1Lj1vJtxSruzrtW/Q54e++Mb7v2/ODdUeQrn4ROAW3EP
	ZntrAQCAzxwNKfJ7ggz2TVrqq0CNLdDF6Bf++RaJZyIbf92q4RWfasanbgjuJKQ8vz5wcjNXW2vpF
	8mmTLhrS+KhHLZuidPSw5vIcWPG8GBlZcccDcGkypkP/iFsjPnsKebdrjA+e34jaSy3Yhn7U2dmWx
	GQ8iUQEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgkI-000QHb-6S; Thu, 20 May 2021 11:21:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgjq-000QBC-Pm
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=higKOj1p3ok/7nI+zj6z0ZvfY1Ko1k+VC4e6gD2otWI=; b=LSipkKaLjSozQaeI3IRIuu11ov
 hbv4I3fkSnG5d2wCSjEkC13yKsgYsWFjHxspKCXzpx0qqUq81g7meNCte+2jvzeQQVv+quyxEQkcv
 q5cgypEUYeT/0SxfdEhmerpYu2sMDo/GEuVO2zmww1HkvEgna80Hp3q/2vV1w028AM+EB8KbC3FON
 /FU91jTkYYDt05Jr+h7dqcbwNxoCNl11YlZUtldqOR/Z8Qs+hrPh+7HBPg6zxIhU4g+tVweCTzGWy
 WCGdiEcxtMi1G4kFwv3nXijpaXlxZScCirf4tyQGjtCBn3bBDO+KJTamYIvXW+YU81YV/lhsSl3qr
 OxHzhR3g==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgjo-00GEjQ-8G
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:21:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5175040wmh.4
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=higKOj1p3ok/7nI+zj6z0ZvfY1Ko1k+VC4e6gD2otWI=;
 b=g9Gf1u+Jbh6DYBX9q1rzo3cTRkf5wxluU18iBxD2nboZn34JD7rYfLeuZoHtyfYMzh
 qmvDsnXmCTLcXkhlwtqpztHAaQCf2lFm9PimRUibqmVi5VMJzEZYmu/Qo6dfE49VCGs7
 W1cpAhTo7DBJs4uGujD87YIezUZ6ONMo1DJGshzIs9/RIfi3iAoFBkMNL80jdTLWwNwp
 4Oi8pnkc8qQlkFicJH5U0hHMJATrgl94UKJ7oKAdy3kx1AU9NZElD+zzl4ZlSkBai3gq
 ykXgJ52Detsa640Mx2ru4rjRDvBFB7PWYFQOeqB8O5KzwjWyECGnzc3/byDIUkDLV70E
 36XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=higKOj1p3ok/7nI+zj6z0ZvfY1Ko1k+VC4e6gD2otWI=;
 b=Zo1VltUHUqhH3Mz3C86w2gTouI5LDfW7xem/I05yZ4aS6onhGhyyI/EXTIj+tOdLPA
 DTrGqjGUfvzlo9F4V+gd7ZYB9Fr/6v7Jkrk2ERpAJ5u6JiADFKyrpxMlw00k6ify94Kt
 B1cZSvNFHtQ1rCuYtwsqefEFKvBRatp7wxyzxSbj2cvM1BY+zIQTyfrZt+jzTnzYqrCJ
 89TbPXFP/jb1ZDCT7pN6HJ0VGMiBxya1jbI8JeQ4IiG2bCGwBf9+F2aczVUBDpjRxIqC
 k6DxN1GIl1NHEQZ5z7D5pxhitetOxQGkSMF0PYb3fUUKryDGFlKha42s/DtxxzuuOcff
 fo2Q==
X-Gm-Message-State: AOAM530zFvyyk4WNf7+btY7scUFEeCmHZMw30XGclqJ8dDWe3TdoUELg
 KBvgPEZBHv7TLfoXgvdZqH7NZQ==
X-Google-Smtp-Source: ABdhPJxVIvEDcoDggTJiB4vSdqTDuOsOwbvvKHhNoweVKBATxb0UMt/Jt655qWVNCHb7uHZpTP29TQ==
X-Received: by 2002:a1c:b646:: with SMTP id g67mr3075568wmf.117.1621509670493; 
 Thu, 20 May 2021 04:21:10 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:21:10 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365
 SoC
Date: Thu, 20 May 2021 13:21:03 +0200
Message-Id: <20210520112106.77190-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_042112_305499_218DD058 
X-CRM114-Status: UNSURE (   9.78  )
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

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v2: No change

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 41cedb4930de..2c437368532e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8173-i2c
           - mediatek,mt8183-i2c
           - mediatek,mt8192-i2c
+          - mediatek,mt8365-i2c
       - items:
           - enum:
               - mediatek,mt2701-i2c
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
