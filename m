Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CAFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3DE56117A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3DE56117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhylHYt+mei+4yVgS7ghvAk7kG07meN/71cT5PpQ+A4=; b=yKbfalDEMVsDxL
	CqV32TJZM/0iEQyjKYotbXZ73lISK7rc8YfCx9i+fnINTW+0oCgSCBR2tVHxoj9GWuos43IptjOmx
	J+/wMvt+bOa9fqr09UATk2eC0ZbGBSW44J1P2FCt8IrwA4IxbrUtfddQLxmAyx67T0mpW0AgrLbqN
	dzWzXxke3eY4GDkmzYKEK17vCVG6R5tXLvDlWpdxfDxlIzdI5MBsbkPo00XFz/AFbA2wAMZRH6E8P
	PwegiusTSuiepeLtVO5hL6JcF5a3gtyfA6SKujGVDSN7bWFIeArbeSglTNk2bteV7SBnMXWdgLunX
	wlEtdKc2vC6dzQE97U3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkhB3-004af2-2y; Wed, 10 Nov 2021 06:33:45 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkh8v-004ZVV-3n
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:31:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso780282pjb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uru6ZygcT/BbjahRjsIfXyLnWlA4uaMxI78WnRQl3Hk=;
 b=PKU43lp4Q6vbJSHJQicfiZO4YFUOVOvUmroGqlb74zJNoNWP7IE9ok9XryJyncP4M1
 LRJTIFYarPh2gqHkSAPg18lHHjGaBphYHUyD3PQEalhcLDw7HMFYdwe5eqbnoOFcYY0H
 CA2RbltRJn2HTvK3hSGEKj+VZNx+jIBDb9yo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uru6ZygcT/BbjahRjsIfXyLnWlA4uaMxI78WnRQl3Hk=;
 b=Ly61m8yBEQB0kMs//02ws0POSKvSZMN8PF/6Y3A0g3GtqgysjfnnhGyl9gVkbBPesS
 SuU6gkBy7LIcicYI59eFPjQTHEcgvApSaxpRqby0XLb0NXJ2HFyG+rNLseiyeGwtlB5o
 7ziY+c5Snx12qLDzL0xeavPw0yAk/nADnpSLYR95m0rfipXj/GjEhM+j7s+NdohZb3/7
 MhLWkbJm6srmNJq01+ZQn9x4RjeW/kKXBEbH0RSSuC5fef4QC0VAO7uwsWrCFWwruj+g
 DtHSWg31y78d4uZ6KDoYKwMquM5MVRFpte23SfDJYL9UZsiiHhrqyESM3FUMM3de3XQ9
 0sEg==
X-Gm-Message-State: AOAM530YVhEEcGIHlpnvrudjKn3eqkHGUlwTW7ni2KPbedMq1ejzckgk
 jCnTn/BlD7qaRCfnpwW9MnDUKg==
X-Google-Smtp-Source: ABdhPJx/mEB0Pl0YuO1j10sru+roHbXo7nzWSImhJUgLBlVUiZdIA1PHSaQkUMOqCv0Z3U9TSxTOlQ==
X-Received: by 2002:a17:90a:df83:: with SMTP id
 p3mr14327202pjv.145.1636525891951; 
 Tue, 09 Nov 2021 22:31:31 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6886:f712:1a79:e3d9])
 by smtp.gmail.com with ESMTPSA id w1sm15623959pgb.50.2021.11.09.22.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:31:31 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
Date: Wed, 10 Nov 2021 14:31:18 +0800
Message-Id: <20211110063118.3412564-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211110063118.3412564-1-hsinyi@chromium.org>
References: <20211110063118.3412564-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_223133_220263_B5B7A9C2 
X-CRM114-Status: UNSURE (   9.43  )
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

Add sku22 which uses different audio codec than previous kakadu board.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v3: Split sku22 to another oneOf items since it also has 2 revs.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 99e7f8e294cd03..723810cffce2e7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -165,6 +165,12 @@ properties:
           - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
+      - description: Google Kakadu (ASUS Chromebook Detachable CM3)
+        items:
+          - const: google,kakadu-rev3-sku22
+          - const: google,kakadu-rev2-sku22
+          - const: google,kakadu
+          - const: mediatek,mt8183
       - description: Google Kappa (HP Chromebook 11a)
         items:
           - const: google,kappa
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
