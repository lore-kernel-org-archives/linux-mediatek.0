Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18879C32771
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 10:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D1F206ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 10:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTYriZ71";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IY5Q0Bgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D1F206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uO/JQH+KvduqErrlKrWXdPfumNXqG+aCAgc7AKCpS/w=; b=WTYriZ71wuzsT7
	eFuapwAUFKVm0dnA0SbfTjeN9CsXlFMqwSwexVz++gvh+NArNDnZkHfoEvxD9MZAYpZh4dSS4wCAj
	vldQKpgqFornRjK89vHH8NUk2JMUYmBdGDQ4Q1pC0Dc0fFW5THHGB1phxzecTe0HWJEj+brCm2Qtp
	lR99VRxD9C1Ntphz36boXC5i5fMesvtwMOgFTzw3mQl1cQ/b26LxPMOsq5iYl0IHemzHsJZeY3eXH
	iPxdvfSCBro7W+cg7WbmeAMJFCohryStQuL1xuY4sp4ksELGn/CDBXH4sAbtA1jFvnqjgKzs5hHQ1
	VgS6j5HIzoOGrbowSoDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipUmO-0005Xh-6G; Thu, 09 Jan 2020 10:11:04 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipUmF-0005Mz-Fy
 for linux-mediatek@lists.infradead.org; Thu, 09 Jan 2020 10:10:57 +0000
Received: by mail-pj1-x1043.google.com with SMTP id m13so968188pjb.2
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2020 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbC21RRgSudcfzr5QWN03HN4co90yPnzp9bvtIPiw6Q=;
 b=IY5Q0BgmHLcQVi+Nd8CTG6T7x9dxAKRluJCeIn5hxSAAv6TjP61drY8WQRs424L3kH
 zmI1kurtlILQd+/5VKR+/k+MIeGWmMHnVqyyu7sHjxu/5fk29/84J7HOtFkRwydI1an5
 kOz5T9+B9Ujzd8FfG72TTneb3qAYzHsoxTauA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbC21RRgSudcfzr5QWN03HN4co90yPnzp9bvtIPiw6Q=;
 b=VXgXaU8d0dhq0IUcg2gy9CTL5doGKSY+meOAO44dV0A7hK5x2VplglAsz6qgNjdQGf
 vmBm6/5gHKoyRqIFgxdDWZb4Agv7kdK+OmYckQPT4y67GbGzG781WCFxTSdmkfV9DwUH
 03xv7nXdG26XDclBhEgrD1F8LGlZkiDp9MJuJeGdUu0aFpYpvcK3Tw0WR17ogJ5nHP+a
 e7lZ+x38dYzb8whkyu5FaTdRqT9HcQ6nrxaC5LCkdSsY1+q/CeyKwIidmtDhJcDpgptR
 EB6oSvSi6DZPKhUbsfb0QXEnk2Id3ju9w/D32TxlXEtXOaRWOUOxpeS1sUXyYc+ndhEd
 uBYg==
X-Gm-Message-State: APjAAAUk5RhoR5kHMQjte6xjJd4fTTItK3ln5LTsbB+C9QVeCwO6HBa3
 ojzid8Iuuw37W4CVzup7/Ih+MQ==
X-Google-Smtp-Source: APXvYqxuqSBYL6QU134n5GYda6RQAwk6cDgFPhQEWnVc9y4WnlfO7L8zj5BmXQnZhoNaDp7P+SdRYQ==
X-Received: by 2002:a17:90a:3742:: with SMTP id
 u60mr4446045pjb.29.1578564655024; 
 Thu, 09 Jan 2020 02:10:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id s11sm6518713pgp.1.2020.01.09.02.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 02:10:54 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
Date: Thu,  9 Jan 2020 18:10:41 +0800
Message-Id: <20200109101042.201500-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200109101042.201500-1-hsinyi@chromium.org>
References: <20200109101042.201500-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_021055_527571_44B87D97 
X-CRM114-Status: UNSURE (   7.56  )
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
 Rob Herring <robh+dt@kernel.org>, Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4043c5046441..a27b22f264a2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -86,6 +86,24 @@ properties:
           - const: mediatek,mt8135
       - items:
           - enum:
+              - google,elm
+              - google,elm-rev1
+              - google,elm-rev2
+              - google,elm-rev3
+              - google,elm-rev4
+              - google,elm-rev5
+              - google,elm-rev6
+              - google,elm-rev7
+              - google,elm-rev8
+              - google,hana
+              - google,hana-rev0
+              - google,hana-rev1
+              - google,hana-rev2
+              - google,hana-rev3
+              - google,hana-rev4
+              - google,hana-rev5
+              - google,hana-rev6
+              - google,hana-rev7
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - items:
-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
