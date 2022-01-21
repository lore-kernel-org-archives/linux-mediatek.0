Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19306C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFWYaFt9ok/NC+ppvyBgr7R7IgImMQicr4+lQ4lLZyk=; b=axgWbWNNjZP71R
	swDusjTBkDElQ6znXPecG1rYxTgyqB21yKzK5l84SdeZ+JqufqT3sArOgqdjbUssC+f5Wb3JI+LIP
	IBzlRXb9BaBCWjrp3wiP8J/Xups2hJkR1S8a41Cs6410rAgLRbWol/5egLqFNhExSx7BCqkMhmMPb
	NGwCTIpVSLvCkLUfOgCekaV9ZBBV7nHo3NhwQ6fmOfXbW9QBkDPJk9ImCZDhW5fO4B64DXoszj5xS
	jTR6WwvMTwg5amBBEG51bSMBv6kIhRaPYymD0eIT0lATnKun3fpUz+4apZ8L4/Png144Gw+hHfmC0
	WXhMtyW4/hcuDhzZedtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuWO-00FHti-Ag; Fri, 21 Jan 2022 14:04:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVm-00FHfY-FL
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 14:03:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso14751290wmh.4
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b9Qbow8A0YPWPn3/lM+2GnA7PMQAnbZ2M1lFPHFZxvI=;
 b=iLBvT1rCA9fzZwk3qDs+fOqABHEY57jiB8s6aoCN2xtmXNgFBPi8cTSJ6M+sjOxfKD
 ML5LjOJJmQaxWaMgHGMOkqXx9FAKKH0RSJ1gxob9voRk1h+hqcb65A5NZPYuLrnO8+oQ
 +fUCJzkLi8vOoZ+YUkDI9ZNFiaoLd8UJ8E1xmD2qhNdmzv6lIUii/8wLPBslyy5gyxy5
 ieiVr8m+9jjE5ZKvDwjg0mCUp/wjjSs4n0VXMOsRmZ14yBIGPZqIcBMt8uqGi9S+jzvd
 3qZTi3PzWk/oNQMoTRkjYQ/Rk35xR1gJyFyjXMa4cWfPOUwATdabAQivzxwD6yRZ0NBF
 b4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9Qbow8A0YPWPn3/lM+2GnA7PMQAnbZ2M1lFPHFZxvI=;
 b=k5SHhtctHfXo0IxLT8IxMXwtjEDZx7sd0TrCnVFfVgoZAS/42mONvcV0QxmRzqXreR
 EGpnfAbtyntkO7m/9/e97qKdJCn+i9xcMabEwnfTy1SZCDjdnjg6luv4DQnTVExYmIIe
 aJZCRfq1LMY31HzhCRHNQt8JMUAKFeo/VaR4s3fDDDKpYZwsaanMNnrmaY/y43/0BMeK
 ht3qnTuwLRozB23TQOKxbXEMnawSJ3/3/xE+uR9s0ZVK28UDHyZsafnqfcn0qRGuPtgs
 g/xuyQBTCtRgkGpdJ9xKWKUEKHsaECTN40mWxcWI1fZXAUpm0ojn08HnvdHdbh6IPbD2
 +44g==
X-Gm-Message-State: AOAM5328exEyG16A5EcIuMCqwdE2M4BIU3IISfeZzmGHe6Pac3nAYQvE
 raLEYW7IVqRrX5c/1Gc7+AccKg==
X-Google-Smtp-Source: ABdhPJze8JkZPt8YeJNz4+qQXr+QI1NypQGJpv1iLMTMx8IGenCg7ujdHDkOBgABZTcC58knzAWJHg==
X-Received: by 2002:a1c:1d45:: with SMTP id d66mr899724wmd.24.1642773809302;
 Fri, 21 Jan 2022 06:03:29 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr.
 [86.201.52.205])
 by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:03:29 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358 binding
 definition
Date: Fri, 21 Jan 2022 15:03:21 +0100
Message-Id: <20220121140323.4080640-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060330_559871_BFD1AC3D 
X-CRM114-Status: GOOD (  11.08  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
