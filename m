Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E14C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:49:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A582312F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A582312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zAe774PeHKD5sVEfvY6yDSxPMqyPuIg4JoQsNIC1k8o=; b=3Xu1r4Hacvwu3ZEjX1/Rd30RP
	wfjI+qURGewvpQ5fdYlv0chQaR0ky873qbbJA+Jav4i+2+yzPImpyJoM2k4JN3UOUsaI9I80GPXr1
	UgrK35tyHumMKZxThF7LyTpvzgrZgX/Kbm5vLO1rZ5LaUMcIGyHyFT9woc1Y9jlgQoFFNcpxGUgCn
	XMYaqImONiVtdWhOKAo7CLxN18A8jAy3t6Nr1wGJb1MbQ5TrIiUNtkzMPAjsp4GmjXCelOCjxSMRs
	rpHGs4+sKCSfLnBkXEV+AqzoDk7dWCZwuc/uH93iVhGBxiFJq6CNClBsjgKQAfOvxE+oPd5utpxWq
	KEgf8p09g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSrK-0005Zp-NF; Thu, 07 Jan 2021 10:49:38 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSrF-0005WO-It
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 10:49:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id c132so4583334pga.3
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 02:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGJRNiBLbvw7xCPqy2AchkT9eub4MYo4xJlh03INrks=;
 b=DvMLePqIJi9OiOcjbgCxz374NfGoUM+kkmvnmFJ6dm5AugVTHAeNvWJnpakax7L4Ys
 pAUGwtiHnv8dmt/jxPTeNS1SxsS6bo0HoDfZqa1RLbl25dofDVzak/M2MPo2W2Y1OcU1
 YY3BRoWIODySaDmt95gWgW07brIDUUebP31MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGJRNiBLbvw7xCPqy2AchkT9eub4MYo4xJlh03INrks=;
 b=edLTHbGsNta6dtMdNmBfPe2TliBw2+h89B8O5PRQBtZC1GD1bgaVhkP5gfnJSfbxAZ
 BmKGGOR9+jXC0zWpZPdMmuURRxJ/miPmMUFcYB8PYGt0VMoBqS92qIqOTcnA3gG8vvLG
 C9D5caxvId6DoylVxHNA4hYBUjhT3jUovclBCMmYZXgJWdHahw+s8r/HdAhMArEBvYO5
 wY+HHszUOeLoFxt7SAw3b2VrDrnVehBGXiRzT/j8nKh/vsN0myXwinvHIoB0GJmfasiO
 HHKM1OQDrBi1EZtuw4mkitylBJ7z6fXXitjRjkHk26X7w7294QDKcha/GToA8vPZP/hP
 eRjw==
X-Gm-Message-State: AOAM530KSsb2RM3gpv1F+2/EixrJl1/PiKc86NBCTJev2NSf9R3Zdv9Z
 T8a/i7dG+zkfrQD+J6SBYBrApQ==
X-Google-Smtp-Source: ABdhPJwBSsyXdxgTohL/cng8/yb125s3RKKNUvYQP0am/LN/TsdLSbnjo0eQpDSzU42HyaxOFT6+Nw==
X-Received: by 2002:a05:6a00:8c7:b029:19d:afa5:34e5 with SMTP id
 s7-20020a056a0008c7b029019dafa534e5mr8491932pfu.30.1610016571251; 
 Thu, 07 Jan 2021 02:49:31 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id n10sm5381974pfu.176.2021.01.07.02.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:49:30 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: power: Add domain regulator supply
Date: Thu,  7 Jan 2021 18:49:14 +0800
Message-Id: <20210107104915.2888408-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107104915.2888408-1-hsinyi@chromium.org>
References: <20210107104915.2888408-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_054933_697276_354A8E68 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg) needs to turn on power supply before power
on.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/power/mediatek,power-controller.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index d14cb9bac8497..e529586af5a12 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -82,6 +82,9 @@ patternProperties:
           be specified by order, adding first the BASIC clocks followed by the
           SUSBSYS clocks.
 
+      domain-supply:
+        description: domain regulator supply.
+
       mediatek,infracfg:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
@@ -130,6 +133,9 @@ patternProperties:
               be specified by order, adding first the BASIC clocks followed by the
               SUSBSYS clocks.
 
+          domain-supply:
+            description: domain regulator supply.
+
           mediatek,infracfg:
             $ref: /schemas/types.yaml#/definitions/phandle
             description: phandle to the device containing the INFRACFG register range.
@@ -178,6 +184,9 @@ patternProperties:
                   be specified by order, adding first the BASIC clocks followed by the
                   SUSBSYS clocks.
 
+              domain-supply:
+                description: domain regulator supply.
+
               mediatek,infracfg:
                 $ref: /schemas/types.yaml#/definitions/phandle
                 description: phandle to the device containing the INFRACFG register range.
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
