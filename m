Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECAAC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D0123772
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D0123772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3ckBe2r0lgEF3yf8YkmZzc7F86GNzF8+TMKdUphVzU=; b=OCRZnapAeFnKlKi3vxfSeYRCs+
	JdHxukmOsQ1r20oTrGjJqHyrUP+2QqEKupgvni08LC4p/zzpMLezS+UGNmbb8hPcTG/uhnwm5ZrKe
	Fj44GunCi5vWriRDUEFKrYbvWX+oC5VC1SI6qCFVkwCM+cxiTUrw+1bYpKxLSG9NKbLiAiL3HsLhM
	VLDqaKsLXiT/Do3xjb+7hWBlLpOEuDImYPUgNkefaGt2LxaPRBOGdvKpv6gtC4maIPAsVE6Qp7Vvj
	2ZCMMM0+fDoXPIs6eZCFljafpkpXfSiqe7/5a6p781/Q5LyK2dIkZ2tk2C72cxD5H3LvRhpcbfhH/
	LaSRqDpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0PrJ-0005M6-Og; Fri, 15 Jan 2021 14:13:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PrC-0005Jr-IF; Fri, 15 Jan 2021 14:13:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id be12so4768227plb.4;
 Fri, 15 Jan 2021 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pEukWvtuwh82TDEPEZ3woLLJLq853GtFGRDGVW376W0=;
 b=d56nTDt327VgF/XuYROfVX7Ku4gbnv881jVJBzfwSdhMsqCb8W3xDas4Ii4WP+3rym
 y1jbl0OHSy2yL2Qfm6Xatbk4PvpjuiIjVbeLpGibFMYI2unQT2LA3qpK4ZrfXMTdSeo7
 d9WQ8asbVfBdxxwbrSVMxgt+VI4r3jLDbyYjFsxx6bzqZ4j/cUnSHlklmYfQOGE2BwF/
 cugv4B7yy40HyQWJFkunnBqNZL9l40c0l3U+YEtmducQgtcrKQpgMh/4dhD/Ipf6pxgj
 vJTdIrhLFXNTYs1G13vxi7AOZEB6fG7h1X1n9cCowKokdjfDRXDuERCE5kO1o0CFLHW3
 6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pEukWvtuwh82TDEPEZ3woLLJLq853GtFGRDGVW376W0=;
 b=kUDxgp3AKwb6g+NPIZSFyGLohRMc1fX3WXACuP7s+lv7gJwHf5PyqABI4mQUtmbX2V
 SPLfjNmcUQcl1HYF+dLx+JFx8j9pfhRN+FkfVKUlyoqnQuIY2IQU1Jcy9gwVcWxKpZVg
 lY1LQhuvc85P4nNSPyw/AJxAJ9uv+D5aWE1vgrxUUMmCGWU2TQCpwu/wO3/7xixNdsfH
 47ArOQ+o2hYHnPJAoaVnm93QjIpzxV2QVw4gJzYta/S69Zs06YDvO2yg97gfMCZedl2w
 CFOSRJ/cx/wnWHrhsdKn+WgAEVr8AQC1T1vntrYn12K/DqTtP6wbA+ws17Gs+txU6l/M
 qhvQ==
X-Gm-Message-State: AOAM530vcZWUmwY8+1y5gXANEhnAwPkxLWxT23sr5NqXJSI7GOF6e+VT
 vF08EJpz2Mk5sOsv1TSUw2Q=
X-Google-Smtp-Source: ABdhPJwLvlOK7S6tSYllr+OMNyZgyloJTKWhIZLiNjcdhjGKjeEWhTc0QmEW8fZcY9NCzKk9a2u6Jg==
X-Received: by 2002:a17:902:9896:b029:dc:3306:8aa7 with SMTP id
 s22-20020a1709029896b02900dc33068aa7mr12972171plp.6.1610720019995; 
 Fri, 15 Jan 2021 06:13:39 -0800 (PST)
Received: from localhost.localdomain (1-171-15-80.dynamic-ip.hinet.net.
 [1.171.15.80])
 by smtp.gmail.com with ESMTPSA id h5sm8898408pgl.86.2021.01.15.06.13.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 06:13:39 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: [PATCH 2/2] usb typec: tcpci: mt6360: Add vbus supply into dt-binding
 description
Date: Fri, 15 Jan 2021 22:13:21 +0800
Message-Id: <1610720001-15300-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_091342_657754_04828476 
X-CRM114-Status: GOOD (  10.64  )
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
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add external vbus source into dt-binding description.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 1e8e1c2..b8d842b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -26,6 +26,11 @@ properties:
     items:
       - const: PD_IRQB
 
+  vbus-supply:
+    description:
+      Vbus source supply regulator.
+    maxItems: 1
+
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
@@ -38,6 +43,7 @@ required:
   - compatible
   - interrupts
   - interrupt-names
+  - vbus-supply
 
 examples:
   - |
@@ -54,6 +60,7 @@ examples:
           compatible = "mediatek,mt6360-tcpc";
           interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
           interrupt-names = "PD_IRQB";
+          vbus-supply = <&otg_vbus>;
 
           connector {
             compatible = "usb-c-connector";
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
