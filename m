Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAE9C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:58:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7066100C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A7066100C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6agSDfMrDvNw/LIGx5aHvXBn2jp6qC2Jltvh/lunjzQ=; b=kqIqdMGcP1FrYmIhODk+cryty
	DXBXvsfu2p91rGkJUwmakJ5oSlA1HTyj5AmQlYAKygJGnDFVO+Nl16J0o+KTvqUXAdb8zbdX/UySv
	9at9fU6kyvxkK95krdfZ8n3q5Yb9jWnwbMGS+X4lFhNY0gx0GJe23GrT6/yfAwNj8oA+JWS0LVo80
	VEAFbqmU4ydH/4Yn22NfyUcBczZdwkqRa9dLSmI8yV9fA7aZO426mARa5mDSoBzoQ+8QbJrjxSL1F
	5llynRlI392pmMRyJckBTV4nTpvn8X942pYd7NkETJpLPzMscnTxGYxc8TFnluQSyGgjEqFLc7GPP
	A9K7LcvQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1AY-0017Zn-Sq; Tue, 18 May 2021 14:58:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1A1-0017RO-1f
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/D0C6tEXN/UZQW5bW2HTmCtLgx9o77WgGBJs9UOzZPU=; b=EST/XIhSd8lR96Fl8LsdmKPJpb
 Epcp8DwFddgen+XMNtTGBMR2QTess6f+wKU3l2qsTVc1JNYrMGXDElmHO6ndKVVC/nU8SX+YnGXhU
 +R0VjcvTVdmw/RlGMB1I4vDSxusXd82nrYTEG7wbJ5fTYb7TB4DppZoaT8am1wQLzT82WExnvfLGj
 wVWY3p+pmTDLXaCthP2w7CjajZUw1/K25QkpivG8dG53pfAXHjsZXH6jdh6iYalrMnnGdfDf04lG1
 8S5+PYXrNoWibMqC7g7hmXr5tnS+di55z7jSyBxlpJBN4OAVq+lSI7DGy+os5sqQ97q6AY7ObrcH0
 D6Nxm7xQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj19w-00EkSe-EW
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:57:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id n2so10654760wrm.0
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/D0C6tEXN/UZQW5bW2HTmCtLgx9o77WgGBJs9UOzZPU=;
 b=VAlse7UHliYrr2QpSXkTgQ56o3em7xamY/ka4A1njfjrXl42CZMzMrueeAbfqF4x42
 Vmhpm1632T+d+TPDK7hedy2SRx9QGlD35XqN+a69C6NKTS2mqHCRc3jmm4FQSuhVRtLD
 PZkG5sN5RhzROrjB+7XkDGk8WyZ0a4YWUMulaGE8+/SRQGs3oTVdQY/xqin0FYwA04gp
 GLrpVq1qu+ln2PbHnRfWgCwyukMz6qCfgKwEQsuMcCvW9KcJn6BsQ6++KIAYzOO96cIv
 hHEmxibD2tatUwbMCVbBl/1b2SjYJrwRllMzsdndewBUbET79k1VLKBD0wKhnvDztjsZ
 xxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/D0C6tEXN/UZQW5bW2HTmCtLgx9o77WgGBJs9UOzZPU=;
 b=HcXCcO9iav2czeOS9gdn/yjgxMaGLYBvRuNvNrrvMvsL11E5H+ckAxcLctpsInfdUf
 mE4jaGN9LbEzoJYoCHAB2Z2KUsyjplfSP/NqWKqIdopK7tic5zI9Iqcs2kLp53RryO8S
 AVw0WIgD1ba1RO3KbxEEx01sqqdHnAgXwL/psnetKqtvKAvGEOxSCoCHU33Ye/AMecvH
 tRtJDY+ZILANTTEwptDlhQMj/cQWPKgGI5PrapV5G/SQrJwS1ypazNQYHVA0prq4ctbd
 t37tIzVgz/bHnoyzfyIdYAcn0CsNbjw4MjogMfA8+i77lveocSVJpEbh8yxk4lbV9HUm
 Sm0g==
X-Gm-Message-State: AOAM5338p3kdfFVZnlPZuUOkbqvFMzZCTuVAa9CQ7BcXuIW5Fj9XwrAv
 LERN0+LWBk1D/wQaqZUWAX/m9Q==
X-Google-Smtp-Source: ABdhPJwpMJWsGQ+2piFN+d8uOfC4WF5Q6hmay5w6ZlBLGrB2is0Suo5wmQEaFXpTdmckDEth6WsKpA==
X-Received: by 2002:a05:6000:4d:: with SMTP id
 k13mr7762317wrx.98.1621349842761; 
 Tue, 18 May 2021 07:57:22 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a18sm2928386wmb.13.2021.05.18.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:57:22 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date: Tue, 18 May 2021 16:55:21 +0200
Message-Id: <20210518145522.2420135-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518145522.2420135-1-fparent@baylibre.com>
References: <20210518145522.2420135-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_075724_494295_6815CA77 
X-CRM114-Status: GOOD (  10.29  )
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

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 0f445d2ab727..ddeda6d7348a 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8173-i2c
           - mediatek,mt8183-i2c
           - mediatek,mt8192-i2c
+          - mediatek,mt8365-i2c
       - items:
           - const: mediatek,mt2701-i2c
           - const: mediatek,mt6577-i2c
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
