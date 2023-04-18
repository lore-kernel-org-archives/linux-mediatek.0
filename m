Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339DFC77B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4OHoFWLVHVOU1gGJFIZyvFQwj4I/n5rmO4u4kQqp5s=; b=kSw7kfv+TTvjrf
	cD/tfT0v+Y5C0qKTQ6boe268nUctQaBm5P8UqM93E/lS3SyUH9Ycv+l7tngpQHZqyy0VY3ngiB7z0
	pAImpGepNfjTxp+abkd65QVa/akPd4Z2q8KPqV3zuPaXRkfQ1XBMinEVQmJS9VyMCt93cXZWYfoOg
	ueUMbubLq4KvE1beP3iCGSs+lLE8SOZ+158nn7jTG6OxAt9MTw0QmvpaS0iTgiCeK6dAR2aWv9x/D
	cx9aIywLV5rpE4GR2JWGiYW+hNDqOcusxJCdO2XUV3JRVPY4hOc5MgCLE1aP8mOdoOxSHe3MA2nxj
	2ZNa/Dd5w8IPsX4o8tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poknR-002BN8-09;
	Tue, 18 Apr 2023 12:50:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poknO-002BLv-19
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 12:50:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b57c49c4cso1781615b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681822252; x=1684414252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4OHoFWLVHVOU1gGJFIZyvFQwj4I/n5rmO4u4kQqp5s=;
        b=NaZDAMGrk+xiKbfMXkfc+hiiltFD0LlTuSqiIbDBkpzWQgLVSgj/O48zJ7VMGlzp68
         pCDOEKpcmGwFU7dSgwQqjWorn5Z13vwzcfdi34+M2L5EwoQEbckdcNX1V9iuSn4j74qB
         2IMNQfjqpLvm8WWUqmBcV11cHsW5gXqch7xqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822252; x=1684414252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4OHoFWLVHVOU1gGJFIZyvFQwj4I/n5rmO4u4kQqp5s=;
        b=dYQCfWCiJWZZK8n0iSNwfsogpTWW9bqr7O1H7CyUJgzlOfW8fAZ8iMTBOZ1Q1J0eTm
         HgMOTGIrz30HCWgN+510Y1VLRosENk52yUGyEc5Ip1ak84M46MWT7QcnG5Ld1JWyEYpd
         DXH23SVxKW9j6G/J+f7EV527HkAyYjAOFYm5aiue+MU/JWAwraK3UuwXTwq1qOYflnSz
         Zi51gbRd+bAaEeatQAsvFKooYKgRzjLpdEzmc2r0WMToOwH0c1O86zX/RMtdCAVa8T/k
         bSbvpsrbUvRjjxfquMrJn01Q4BKFAjM+sY8PDpY6tGYcGgJIgXRmRnOgFKaMAK+zz+F5
         9Maw==
X-Gm-Message-State: AAQBX9f1dRWqCkS2WGDpfmqSwSpqn5L1pmrz3hWKyrmPjKkR9yyeN55F
	sWbV3QT6MBq4KCLMqt2m2RtIVw==
X-Google-Smtp-Source: AKy350YD/mHUZFPaUut90TfJLzOLDCDlzOufYyFO14OjgVg1t2eEm+ULWpBI96mTSUIsyi0jY51ohg==
X-Received: by 2002:a05:6a00:1483:b0:638:f0b1:4df1 with SMTP id v3-20020a056a00148300b00638f0b14df1mr25744364pfu.24.1681822252585;
        Tue, 18 Apr 2023 05:50:52 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:2fb7:301d:6083:752b])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b0063afb08afeesm9323733pfm.67.2023.04.18.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:50:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
Date: Tue, 18 Apr 2023 20:49:51 +0800
Message-ID: <20230418124953.3170028-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230418124953.3170028-1-fshao@chromium.org>
References: <20230418124953.3170028-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_055054_393324_45646D3E 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We observed that on Chromebook device Steelix, if Goodix GT7375P
touchscreen is powered in suspend (because, for example, it connects to
an always-on regulator) and with the reset GPIO asserted, it will
introduce about 14mW power leakage.

This property is used to indicate that the touchscreen is powered in
suspend. If it's set, the driver will stop asserting the reset GPIO in
power-down, and it will do it in power-up instead to ensure that the
state is always reset after resuming.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..942acb286d77 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -43,6 +43,12 @@ properties:
       itself as long as it allows the main board to make signals compatible
       with what the touchscreen is expecting for its IO rails.
 
+  powered-in-suspend:
+    description:
+      This indicates that the touchscreen is powered in suspend, so the driver
+      will not assert the reset GPIO in power-down to prevent power leakage.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.40.0.634.g4ca3ef3211-goog


