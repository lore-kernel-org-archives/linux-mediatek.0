Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A71BC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKt8t94OiNjvPhSysPrF1wHlcGTGRbFvaSlLqJwd4cA=; b=HCGOScbKjXA5i4
	+7Y/VVx/guL/42EtknAfPFrYD52DbqLMKqovQQ/BKGf7uZT/I6ShhzBiV15sEB9hBsZnUF95B3SC8
	x41I5Xqc+YD3h2rVWorRypnnLjRve3rxsxUSdrPW2Nk/WFdOZ6P8v+n2t2grgCThdlovCf00TA+RS
	ud/iyJtbFlJXSqdf0JhJwmRAGwZVjJaKCbxeW9kxr+rAt1sijN/5ikdtc3Qs+j4gMkzR9YofDJW+3
	c65cG+QHY3wFMdeWOt3HKPCYelX4DA92TTrhTC4m4dUxvr8Ydo+U7VhHaPFUGa9Gn0LpWckDPCOHy
	GnCnRr6PBwgx0Xoxa9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KY-00ArBH-0m; Tue, 31 May 2022 12:50:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KG-00Ar2A-BD
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 12:50:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q21so7352760wra.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2o8rrRm/rSsYSXsi2pnvW4ZzfymkwbyFEWUK4Ia2ho=;
        b=mmybuscfa6Ot10NSXfgRNyJEo6QmiYe16/7mTMCQ4IfVJWm3g7EGt/bYQb8nzEUqti
         fdhvuCvcwURHCsxHPuq5RG3n1v396Nw8/PEiKKM2PdzHY1jjMcpf55i/VxKgCRxzQ/ok
         YjRBxW+pcBFayrVibnBNK29pmegCFP9i1kcIgP1duq46kPJFaw/qpxhT2VT9N+zzF0dh
         HAmoE9EL5oC/lszYQPF1VZymU+WiPtilgcZx+DcjP183TX78bCYig8yUma0eEiUWWNSA
         zcRw2ZRmOS79kQVLk2gKgBJAr5jn4m/opji5Ahe471OVPf4ZO9Vuno+pWUUqf0R9s+yS
         iywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2o8rrRm/rSsYSXsi2pnvW4ZzfymkwbyFEWUK4Ia2ho=;
        b=l1bfoCvClkqq0KHkbwYJ2XuuLYtGNtSRg93QdYNGsiTpIhgmHd6bbKSvbg3DQYf5o0
         K/yC9IGO/QlHSHlpM5Ecezi0WvQ9/XPczOp2DtG4gptfpedvMKZYHfJrrbjEoM3KJhDM
         VNp43kFF4P8IoplgFsgdyDfHiyEOhlytnHqeNrsmJhs4M9r9HQ2Ugcxfs89TGsGZ98fI
         pvxF7ZqtnbxP9wVAEN5xlrbkV6sJaLiC2CgRWNhOUmTVIl85k/FYhIY8IfE1Rgg8HRWB
         01rtP6XB1g16dV5CojU8PRDBdpRfHIJw1vyAGO2xKZgy6h+/DF1hVLc0i/mEcLAR2H1u
         ustA==
X-Gm-Message-State: AOAM533PFFPMk/OaAmI8NU/M5vcgdI4FakuJbFkXsQrZwaVHB2ykco4U
	8W3AHmbrFd1GPYl2hicmZlgG3g==
X-Google-Smtp-Source: ABdhPJxFrBY6CrE1EfSvbOblSOMd54KwCAB1UviagiC4WZn0SyFrkBQviZ7o1RhhD0SrbR5KG4VhEQ==
X-Received: by 2002:a05:6000:2aa:b0:20f:c5da:d4e3 with SMTP id l10-20020a05600002aa00b0020fc5dad4e3mr41519505wry.510.1654001416707;
        Tue, 31 May 2022 05:50:16 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:16 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: mfd: mt6397: add binding for MT6357
Date: Tue, 31 May 2022 14:49:53 +0200
Message-Id: <20220531124959.202787-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_055020_417599_A2A1115C 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Add binding documentation for the MT6357 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 293db2a71ef2..31f2c6d253ca 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -20,6 +20,7 @@ This document describes the binding for MFD device and its sub module.
 Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
+	"mediatek,mt6357" for PMIC MT6357
 	"mediatek,mt6358" for PMIC MT6358 and MT6366
 	"mediatek,mt6359" for PMIC MT6359
 	"mediatek,mt6397" for PMIC MT6397
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
