Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA59AC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C1320659
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n9fA/z9V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gdjLbdpO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C1320659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J3J8JURlHyTfVfGZEuIIW9jBlxujYg/J5s4RpU7qDBU=; b=n9fA/z9VIPQkuktrSdqndY8czk
	hQ71VKwzjiuwo90MUh6ymvBbHETG7Et+chAI3E4irXH1wO03NNrXiW/W4jxD99OBCoEJVaqU7VjRZ
	pUeBTNjfq6/4S//b6kb3b/rffA2RWYVRcNRKQJiKCV3j594lr418EwieZ9tExCyH7u4UyW3hFh4Rq
	VQOjW6I5LTkG6iMV2y4xiS9wCCoD0Na+7c9AJk4EXuF2oDi0JI5HJnLQ0uvJx3S/L5XMKIpZYl1pF
	AgT9ZgAt0YQn8biaM4hY7TCiTqyWE8SHcIVWsEwPWWZxSvZEMsD9hoD5Wrgfw1yO+uT3TdAg9gmEJ
	3pIc0UGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFESg-0006Hg-CY; Mon, 07 Sep 2020 10:33:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFESd-0006Fq-Vj
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:33:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id b79so13690448wmb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDegqVmimS9dIJwNDMtty6LSuyVmgMvA+oa1ZvHmVIY=;
 b=gdjLbdpOV3gN6yZT5yR6EraPQlcFbNhhBhstzpB/HgTvOuSG9WyZjmNruLe4HpYA9e
 edlT0TL47uetSEnv9IJ154SPP1ssMzk3ow7nILL3yxn7K5loUHfAm6umGcLDOnseHI5M
 fH1Qlt3eKv19wdRfn6a9BgfVUj69P/VgMkW718b9aWdPkevXrl2ZHZxKfCWZFGd1t4fr
 hQg86QKqz6nQ0DdoYmuT3PEBzw1kthhlKrWGc/fzAZehYPMJF0/EDWdX1QlqAMVIKsHR
 yGBN93/uJuBddwRyC5Hj76ehMUXFzYCRX+HuFc3fqu1/vZSl235e7nOdyY2if9Tock/h
 Qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDegqVmimS9dIJwNDMtty6LSuyVmgMvA+oa1ZvHmVIY=;
 b=mOdvajN8AWvZhl0jwBAzltUaP01xujyBx5uyvZxFCt3+5fzJAWQTHI8bRQ3SDL925S
 zmlOtGfWHwl6kMmkoIZDmwNhycxFaEMHiPNGbKVcOpeOxJ/G7O0KzFr/2gmX8xtEvTcY
 ZZ54BJBE5mgCZ5ClOlQWGF/2tULlQzUVgqSac8BhkAtYKTQ5e3HwbcqjvadSyWrRzjuQ
 fIDJT0Sx+lBpGxDYZ7mbkCiFsKW07zCoHr5t3XP07xXYYFMSYwmakA3DDhybg3Q3hU6r
 fimEm4xWyxFqY61TZM64Ox0hk72i0iRb67iFIUsXix6ol+GgCjMVRCB6x8JGQjRDHEWG
 R89Q==
X-Gm-Message-State: AOAM531HlIVz6kd8dyChOsXrq2FOWlwdyHpBiStaAu6vTN5lu+jH9ZKw
 loBx/AyQfz0LW+B5RyipcERdv5AYhPVgkw==
X-Google-Smtp-Source: ABdhPJwmKB1R49xT+gzxzJMk8hfpF7xfzlN8Z3JZRv87J9pj6lSBqqi2dBpFwiLaZ9qbxtlErOlEOg==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr21202627wmi.105.1599474798946; 
 Mon, 07 Sep 2020 03:33:18 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net.
 [93.23.105.122])
 by smtp.gmail.com with ESMTPSA id i1sm32395936wrc.49.2020.09.07.03.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 03:33:18 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Mon,  7 Sep 2020 12:33:09 +0200
Message-Id: <20200907103311.1601907-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_063320_041096_D987ACC2 
X-CRM114-Status: GOOD (  11.41  )
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
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
---

V5:
	* Rebased, removed regulator documentation because it will be send later
	on in another patch series

V4:
	* No change

V3:
	* No change

V2:
	* New patch

---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a3825..f051a951ba72 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6392" for PMIC MT6392
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -52,7 +53,10 @@ Optional subnodes:
 
 - keys
 	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+		- compatible:
+			- "mediatek,mt6323-keys"
+			- "mediatek,mt6392-keys", "mediatek,mt6397-keys"
+			- "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
