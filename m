Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97EAC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:55:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13066611BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13066611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wzJDyuWjJ7ckZ3p/uZk9j69Pz+kwHC7R1WbFDTgwwTQ=; b=MBPAzGtWJm0fAijjJ40ILDGkd
	PjqlwYV78DHIfOo96oy61i6dlDaD7SJ/g4sf0BQ8Eewp0CIvRtVKWNVtCcK95p0P31HLI7ComsLbp
	iz9OnnPa8HT39wFTUHeLy4ut70Ttc+Lhbq6C9yK7XWWY3jFPM9BypFvg32d7+KVJZHchL2sNG2D0y
	6q0XdGZqiE7Z8mQDtEIa+yJwomEkgh+ALUCtiKlMgi+1znCRwrU/XLWKf/jYmo1oHXMP9EPLW28+x
	kSI7FZkPVJpj+XrZo9hADfUUV0bQUB8ySsYO30/eMptpzJRqHVK3ephjB5d4Emhz3oz1lxzJRxTzA
	q3QsgWILA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj3vu-001XbT-Ud; Tue, 18 May 2021 17:55:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vL-001XVh-LW
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 17:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oTjBUDtJCB1J9ynhq80z5EUfzEOQqX8trIBK7k8vqMA=; b=oy14EGz9YvcoO4Ew4Te/sCMJXa
 zsSdVjotfpWL9QmnHLoLx/Fee3TP86v+Ghdi7f6OIX1Hfot484mO3imIoB4d0szmp/Nv0zd60XSOP
 zbhzdQcyD+WKS5XEOuRi1ZJAGbuIMRrcCoPMRIpYfmKoRnNHRwIwyMrLFfimsLBk609XODxQ8MDJ8
 QoeTzYqWHpdFaL+lIIZh9Isjq9Tjn6tjcyoSlIGWTZHZyAmnoJos+4sVQA/FD5HU7fvgBWyQpS1bC
 65hU5KBiW9bc+IoXiaFHTj6LMkjEWqotU7I4FoC9rcpLuEqo50bSxosmHr9ZUVB5isDYmaRgtpOtb
 sWBLUPNA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vJ-00Er0f-5b
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 17:54:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id a4so11229992wrr.2
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTjBUDtJCB1J9ynhq80z5EUfzEOQqX8trIBK7k8vqMA=;
 b=K4IpbOBeRCDOgQiM6FDeJT3mk1uhIKsw0dzbEbSPM1skpiUAk+nb9km8r3h/745grb
 /HLeM3mmZwtutSsG50RHiRis51y6YQei9vpzPt8Lz9jAJqcfh5T27atB3JxEUtZjZyIb
 xMIILo0/85wryKnJD9jmv10XAaEHukZ9NYvIoHRzrz42g50p/R5atl2iYlftxJ1zxyoz
 M2Rk93DnSuW1Ijfh2DKwFhi0Fd1VGPcgdrSTH9Pyqp5Ndn7ec4NMbKncBdhIR0ydireS
 Pz3rXpQ4XtkJya2vrNQ8kN0ETSPtXT2znaP1BFE7odo+p+DhnDd2CyGdUumOQ3vp1C8S
 UX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oTjBUDtJCB1J9ynhq80z5EUfzEOQqX8trIBK7k8vqMA=;
 b=cn9QJifasV0gFaoyP0mYBf+OWb43b9DH+C6CTpi5Rl04lne7SNh7lyztTKSRh9siHp
 53/RebMzTJyBfbQfvAGl5fgPBuWcW7SrsY8LkBdztUNgy+9sumdImD1U9xuyuvKprIFD
 zbgpvAmmFXJIuczx/niCwGEc14GvbWZvuMSqrUwelCzh6SSsZ7t5rFcVi/ZGmoNZzFeP
 ImtRXOab2SrMlNy6npvNvC8UAD1SExPq/v+dGihY572kDT8O4Awt/SR5gDpO3l+WPtcS
 k94UNI8AJaqpm3+jOj6XWVe5QmmCKL3gYB4hH1UqoJagDdPrdWrUwxSkBS3UzOaLC9yi
 UH/Q==
X-Gm-Message-State: AOAM532Vw0lz9VjbGxqHfanc1R69O+alXMr5p43ODWyCMHgwDcxqFY7N
 BXcJtTK0PR8ounB1xan459dPsg==
X-Google-Smtp-Source: ABdhPJw8Tr0azrXxw/3cA5XoNuS3GO362ZVgSmK+kMj5HqdWeyqVqXBzGMEbV+QpbfMIDmo1+rvA8A==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr8631720wrr.304.1621360467692; 
 Tue, 18 May 2021 10:54:27 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a17sm14458963wrt.53.2021.05.18.10.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 10:54:27 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: pwm: pwm-mtk-disp: add binding for MT8365 SoC
Date: Tue, 18 May 2021 19:54:21 +0200
Message-Id: <20210518175422.2678665-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518175422.2678665-1-fparent@baylibre.com>
References: <20210518175422.2678665-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_105429_238310_C46830FD 
X-CRM114-Status: GOOD (  11.21  )
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

Add binding documentation to the pwm-mtk-disp driver for the MT8365
SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
index 85bca1c59f95..548ec7e06028 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
@@ -22,6 +22,9 @@ properties:
       - items:
           - const: mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
+      - items:
+          - const: mediatek,mt8365-disp-pwm
+          - const: mediatek,mt8183-disp-pwm
 
   reg:
     maxItems: 1
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
