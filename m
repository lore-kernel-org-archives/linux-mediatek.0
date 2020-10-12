Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1CAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:39:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFDDD206E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTAo1Giv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0qmWSBxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFDDD206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zDoM1Y1J9M/DcBJ5EHGwx/8BPUxqvp2XQxj/dom10g=; b=PTAo1GivNuyp0fyJXjnJkFUBC
	q4LXlJ+VHlpe9uVhnOv2muHzfZpwkP61IArTEv1+RTFeRVgIbun04zV8vRskAwD4AWnx9IWJBsHvG
	65ibysjVkrXTaL02HvLtjCUO692BarjYh0R3f2hVHYVII96bjp4UQdkXIKinSHRpcg+YhQCauF/AT
	I+cQchM4POLk7IHEOLAWi9i52+Fzqrv5piQ0fsfaxsR/6sFhc4GgMgbVUomF/o+ZCA5rq8ONWAA57
	uBhhQID+NkrlDnlHNIVJe7fVD04KDqN527LEiyjrUJZmut3ki8OYN5KczUCpUWPtTQpRx3+5y23Iu
	0KqAg3Gtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRwAP-00011v-O7; Mon, 12 Oct 2020 11:39:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRwAL-0000zi-KH
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 11:38:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id a72so6301633wme.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
 b=0qmWSBxEbq35KurZTOsOhck3qTnnnOHUBmvQCN3yCNiwPxRpua2FZOxJKkZtJr8Tdl
 s+jM0s3YJE8/WServiwBPovX2q/PyHCKWFjRpcNF5DvBBNEEhUkUaxZ2J98D2l+VFjXw
 wm9iszb90LKGBzEyPGMWA+jOcptEtN8rj2Z0b43VAlif4tmF9bGPNtSBUnQkr17QpU8D
 WiqKPpohjr1wRnc/KxN105r8k/0GbhTPQvGnqPMv9qgDxDewvykK8UDF/UyPYYA7hrtC
 ca9JqBx3wIGuxtRxq5bIu3NJ9RI2Xd6awIXk3+5isloa933zApn/57ZrRdqO2wIjyPd0
 pXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
 b=AzzlxCror+RmmrSVAdqnUAnkCJwykv5E1WY1TZ2pXUNgvU1fLA6eeujvgqa8P6YxE1
 vS9IdjB4UMwoTvS0WFiEXel8nFiThc+YAVCo49HnqERY1ecZnVEStkcaU5kM05iGuB+O
 j18Wqhf16PsGYNVkauglLUsBU7xWrbBNha8x5jOivn6+b7grMNizW6+Sn/ijUoF9NrTw
 wz3kNcX6v6H9CiPueeqM15r8ql6zHxXsD3waLN+hVM5bslcc/jdS6J/+0lSohSDBlU3f
 Oso8Bagz2ThBYVQJI+YWpAC4Rdp5iTlRsvfa7yjaaH1ZhSCvntljnpo/yFZTrYQ38K4R
 FlSA==
X-Gm-Message-State: AOAM533N8dHm1s95sc/UpL4y1PDHCwARKRHxYpW/h52zQ2YEbHHUJvNV
 GPi/1EJYm8QCroijUMBsmyXJlw==
X-Google-Smtp-Source: ABdhPJzylMLeTRhmQpLakNIW7gsPR+5BowgUIi+DkXjP1HpgG9IEx5b2JG9z5tyO9ughYMPkuJqBxQ==
X-Received: by 2002:a1c:bb06:: with SMTP id l6mr10907219wmf.40.1602502736377; 
 Mon, 12 Oct 2020 04:38:56 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net.
 [81.185.175.170])
 by smtp.gmail.com with ESMTPSA id o194sm22378065wme.24.2020.10.12.04.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 04:38:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, matthias.bgg@gmail.com
Subject: [PATCH v6 2/3] dt-bindings: input: mtk-pmic-keys: add MT6392 binding
 definition
Date: Mon, 12 Oct 2020 13:38:39 +0200
Message-Id: <20201012113840.396358-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012113840.396358-1-fparent@baylibre.com>
References: <20201012113840.396358-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_073858_216583_6E82DF27 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org, lee.jones@linaro.org,
 hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v6:
	* No changes

v5:
	* rebased
	* Rename MT6397/MT6392/MT6323 into MT63XX to make it more readable when
	the list of support PMIC increase
	* Removed Reviewed-by from Rob Herring because of the new extra changes
	made to this patch
	* change the compatible for MT6392 to also contains MT6397 since MT6392 PMIC
	key driver is compatible with mt6397.

v4:
	* Patch was previously sent separately but merge to this patch series
	since there is a hard dependency on the MFD patch.

 .../devicetree/bindings/input/mtk-pmic-keys.txt     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..71c82687ab92 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT63xx PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT63xx PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
+node provided by MT63xx PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT63xx MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6323-keys" for MT6323 PMIC
+	- "mediatek,mt6392-keys", "mediatek,mt6397-keys" for MT6392 PMIC
+	- "mediatek,mt6397-keys" for MT6397 PMIC
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
