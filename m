Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD48C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0822082F
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pzwq8fzZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQcwVJDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D0822082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Zws8cddFOqoTycLJS9l7gUqdWPK9c/SCsGwsvNu8QA=; b=Pzwq8fzZmIsGyH
	QYY+uvADbNrWJe8IXIcCbmeuMNjSo4vA1PkRvAsOUU+Qf8jsrfKJV0qpORIxLV0MGQ5MO+1tRQFCq
	HUqzz0yQGXNla9Dq6OnBqY27iSyceXYaigiaOhNCbbX4YMaV+lZodvqEOjaEAi3wDvKH7l7BhTIkP
	KGaFUcXh9jCmc7/2p3m1zQM8kEx+Dj3uZbq7QpBFasAhaYEimbETqIJlGrwn9yFou0FRrAW5APDbB
	6FnE0uVHIQX3SflchYePae55gufM7S1GpYE4iOwga1jmzHeA/nPz6pKx5UduYqmdYcfGckDeqJeVJ
	NKclwM8xnuItLNH86Bsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isISe-0002xf-6M; Fri, 17 Jan 2020 03:38:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isISQ-0002kd-BD
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 03:38:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id i6so11275365pfc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2020 19:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5t137Hgr25MSwppHZChMACb9jtzyL71KI0BNnXvPh60=;
 b=mQcwVJDGKnK0SDcsFxBlyFqk09ppdxI6h15y14y03P7PF6+y+/nFuzCxPPv2xamAmg
 9f1SnyEVfzmq+WI0syd1uuGa2xLJMeO6oxwvTiT4p1daaPWbfSkxNT8xQhoedU2BQ1IW
 aD+OCRq5eDLs7bjHcyv/zf+xeYagRhcADZW/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5t137Hgr25MSwppHZChMACb9jtzyL71KI0BNnXvPh60=;
 b=WcG/wdzQsIAX4iXJNI89tKIk+GeQWJd8rOv4fmPCcgYQ8JDpyABIA7SOBa3ouUHaTg
 kWYrBWhSYib4amMKxTJ0hiOc+JMUi+5MmMUYAr1dTZYV9eoYVnkkdHIA1zhfqdC30ycZ
 9VBsiOjOfoQtykTVV4bKH6oXclQ6yZOIjZPVygS0FHs4gMRJ8ijHYrIbakjvKuG/HPEZ
 4gkMhpQh0oC43EPsDIczYl24+ALF0gq+oM3FDWUF7Rs65/ACJJ2S1O1ejno5YINIMgwT
 zXD87DNyFlK3weoijQfRTkk1PuYUIDgcW3b/nvbjTr4fVXdG35fyqvPD51MbNwl+EIPt
 JSLg==
X-Gm-Message-State: APjAAAUznFQVqoz1dq5dSyxDhFBbhA1S1Hslpbewfy5nhMO4yxO5BfHL
 UThDudoiLHy9O6xiNa3rBzsdKg==
X-Google-Smtp-Source: APXvYqzy6hYrjE6QOAX5NisMiTl8d4lSUiT1Kk+Lfm0HFpcrBOX/uFVsjFLKOkfbYFQtI0ZIUMMm+Q==
X-Received: by 2002:a62:2cc1:: with SMTP id s184mr911908pfs.111.1579232281428; 
 Thu, 16 Jan 2020 19:38:01 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id j38sm25940259pgj.27.2020.01.16.19.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 19:38:01 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: arm64: dts: mediatek: Add mt8173 elm and
 hana
Date: Fri, 17 Jan 2020 11:37:47 +0800
Message-Id: <20200117033749.137420-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200117033749.137420-1-hsinyi@chromium.org>
References: <20200117033749.137420-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_193802_498950_6CA0FB5C 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4043c5046441..abc544dde692 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -84,6 +84,28 @@ properties:
           - enum:
               - mediatek,mt8135-evbp1
           - const: mediatek,mt8135
+      - description: Google Elm (Acer Chromebook R13)
+        items:
+          - const: google,elm-rev8
+          - const: google,elm-rev7
+          - const: google,elm-rev6
+          - const: google,elm-rev5
+          - const: google,elm-rev4
+          - const: google,elm-rev3
+          - const: google,elm
+          - const: mediatek,mt8173
+      - description: Google Hana (Lenovo Chromebook N23 Yoga, C330, 300e,...)
+        items:
+          - const: google,hana-rev6
+          - const: google,hana-rev5
+          - const: google,hana-rev4
+          - const: google,hana-rev3
+          - const: google,hana
+          - const: mediatek,mt8173
+      - description: Google Hana rev7 (Poin2 Chromebook 11C)
+        items:
+          - const: google,hana-rev7
+          - const: mediatek,mt8173
       - items:
           - enum:
               - mediatek,mt8173-evb
-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
