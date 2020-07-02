Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B18C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3B52083E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqe8bKp6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="uV0TTUHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3B52083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t6p2O4cJCEVAvbz8ZcBiJiXI1JTQvcqmaNyVrY9q/J4=; b=fqe8bKp6iNbSGwlaxSi66CxvB
	Gn7gEQ4oEysSLjOfwLzuP7ZCb/ewvkQj0cZWU4cJ/fQMgP6jxYJuAifXwa/aj14nrYPyybp7z2HtY
	gyUg7JxQx+YbDuC+DiHaybHcERG5XiYiamu19MSkEpQXUfvtjmbgeZG+TA76dAphYKO3EPdb0J/iY
	0SYf9kSkW+yYmlGDnjZIms/PQyALOaqFwzWvoT3A1FmfdNYoKOdS2ZKwfvlPUxGEbd8heakSBg5Xi
	qkNX6IFVCwlnYXvsk2TM2j001oObKHCTKeiIJs8mVNmjrHTj0V4qDbtI1ovhgAxl/iueuKzPlv2vk
	BFSdm4GtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqphi-0004D5-9C; Thu, 02 Jul 2020 03:16:02 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqphg-0004CD-Pj
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 03:16:01 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id s90so28255640ybi.6
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 20:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hedYhqgmZAAsOutDncDPqnlpzuuMhTLpZziU+qMbGLE=;
 b=uV0TTUHu2THKmzy3RXnp/AEnYr4oDDtg/sPYvbr0Mqh710YOZDJZJvQFr9QVgDZcMX
 5d2lYdM9u72E1QkKFHRTft+huUGXfsPJtjU19DdtLEZ9p3lkKGzmkDFogpyS4cxl3itc
 zBo16RWvh2qGIr3SDS7LktRGo0khmTd0f7Gir7RnZOnV4XMjncDB/+dXYKUQxnOf8vTR
 uNY8igeGfbTSBBsJFHMdEtHEhFmz0x190+iCOG5qrJSv3pIMQtpEiaoKcbIenNrCEGan
 MWEtkvnoN+/JK2Hr5MgRFGho2FlVxlbChr/mUrzkKg126pb1zy+kaFVurr7TPevdg/Qg
 uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hedYhqgmZAAsOutDncDPqnlpzuuMhTLpZziU+qMbGLE=;
 b=CkVInZNEsj5ApGRTTiXq7x7uKofXjN2zOUHxTadsRjzfQuRIB88LYWd+c+QA5bPc40
 oJw7udDhWoH+eHsDR3nWFA71oWo3bVKjTwZinCti6NeOLlS10xlEvMNVB8hpJvdzJJyq
 nTCulUlLJ/71/wfEDgwwe4HDPCMe8QgjmB1VEDUz0PPXDBnMaao00QEb/D7pH77BcfGs
 blQPWu4uVJlJfiMIMELtDgKypcWzmAQoTJmzBmuoZrAzHiMrH//WFzTqj2ITN1nF6mBd
 XbWPME6GbzVdlkqhkqYsbS6qRQJDov/SZ9FLiItvcjGxZZf0u/7ie7CkLm/Aj+mQS90i
 Vbpg==
X-Gm-Message-State: AOAM531Xn8t+iw2NsUEV7R4g3DD5MWb3Rg0y6WWU6ONqvZmLdv0rr1uS
 mjIruJd9G/2j5Yno+sQXdzxu9Qe81BxQRj2MkH9UXhGJjEJasNYdJ3X0YfKPGC4sbHTZzWUE45N
 TzXroHEEXETpbyEJ5gORcMKDdvmfyZGAyUPZL8PMhQ+k5MKGGF0KkSDW0PmyIbLNWu8+SfozYJl
 v3SooI
X-Google-Smtp-Source: ABdhPJwZln/zT2wOn6bCAOC1AOi/fjwfd1XSbq4ltHsJPQtQIDKtLkofPngdXzPKphvtsTpivVQnLM0TkHhw
X-Received: by 2002:a25:2882:: with SMTP id o124mr741616ybo.10.1593659758255; 
 Wed, 01 Jul 2020 20:15:58 -0700 (PDT)
Date: Thu,  2 Jul 2020 13:15:23 +1000
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
Message-Id: <20200702131350.2.I6131e251d13f60d8c5347bb4faa9dc2364c87848@changeid>
Mime-Version: 1.0
References: <20200702031525.2662441-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 2/4] dt-bindings: regulator: da9211: Document allowed modes
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_231600_876318_E6B1C259 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, hsinyi@chromium.org,
 Support Opensource <support.opensource@diasemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds a description of how operating modes may be specified.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 Documentation/devicetree/bindings/regulator/da9211.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
index 27717e816e71..eb871447d508 100644
--- a/Documentation/devicetree/bindings/regulator/da9211.txt
+++ b/Documentation/devicetree/bindings/regulator/da9211.txt
@@ -15,6 +15,8 @@ Required properties:
 Optional properties:
 - enable-gpios: platform gpio for control of BUCKA/BUCKB.
 - Any optional property defined in regulator.txt
+  - regulator-initial-mode and regulator-allowed-modes may be specified using
+    mode values from dt-bindings/regulator/dlg,da9211-regulator.h
 
 Example 1) DA9211
 	pmic: da9211@68 {
@@ -30,6 +32,8 @@ Example 1) DA9211
 				regulator-min-microamp 	= <2000000>;
 				regulator-max-microamp 	= <5000000>;
 				enable-gpios = <&gpio 27 0>;
+				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
+							   DA9211_BUCK_MODE_AUTO>;
 			};
 		};
 	};
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
