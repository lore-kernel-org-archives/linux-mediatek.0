Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36BC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QyPVEosZOT9SRw8683CVFBluZOEj+iHFopqFxbf8ZA=; b=eADNCaeh40vbiQf8z2JZMEudyf
	Qg81kB/wIPTx6ywI3PltOa+lYgvSwtC+ynvF7MtpITKdr52vfmYc1S5w4+YyZoBdt1t7ITCzxG3Fi
	HOpXfCqm/9VlkTA6ciAox1rWG/ikwaplSUgwIUGiDOp0zkvXNkxwz/iDz7x3L7XRsr0jUjAVNMk0M
	TwMsM8S4PljJS3IF4NGHrrpb1W1+0Fkrac5qU7fn4BeTsfePXtsHuBMsS/rLAa3+fBDiIDcelUA9o
	4/fEtw8/fwFMLWxYjAvud8msiDa4+K/ATE4N+iwOnZWZVII4xflAtCpa9omMCWW55WHxInp8aQpeN
	YN3jkJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum8l-006zjR-C2; Tue, 15 Nov 2022 02:57:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5x-006yJB-Rs
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:43 +0000
Received: by mail-ej1-x633.google.com with SMTP id n12so32846906eja.11
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QyPVEosZOT9SRw8683CVFBluZOEj+iHFopqFxbf8ZA=;
        b=dFDH/NDClXf2CSD1KW7F9L8zDnLLNLnTxtGpa2IKbuc3la4b1QOC6sozbzE34T1Eoe
         sS6GY0hhKr8TQY22al0Gt3O+jvxOPKrD/FrcGK2r62uyG0MHgtqhgI4PJYqv1jA0/hec
         qWga7qGIP6Id7Ma1QGgRNC+ZKma/BmmoBeMpdoi/Jl5DSzRNriKj/QV1CdmDSvRj5n5A
         nyCso0nlV37112Lnud5HVFC/grPoF97n6otTuqL9pxaNxi5sxVVnoK22Z0O9VwvCb+eZ
         pcHvNEDkLNHKHGwD2odkF9Z5fTiyzo3zIqgqSXp9VpnBBU0hMARJp9VlNivj1XC5SKJM
         Ncig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QyPVEosZOT9SRw8683CVFBluZOEj+iHFopqFxbf8ZA=;
        b=iQ9EBBatIrIxsVG8Ftqn161YzF6xP0xePl2KiJIkRSyDdq1poZZ0APnNCNzsAp+3bt
         7k0XJHjVI1rZ5SVayB55tJudrq+nCFtMPJbR/ZygYNRcAZc8l4rYgNlChsGdw1YMz4xf
         TzzbClPFz6hh1B0UCdbgCB5cRWK6IBIKI9z6dEAIs4nMql89haypqHzBqIW62JnGM/Rl
         9AEJmx9YUarlCCekE108Rk4vdqjwuEy7uH5R1bnV4j2Tylx3k+XrDLhiJszTFRFdwhwq
         6Orsd6y5urCM5C4T6WLjLC89B7zonImoF2I0qX3P2R5RbzUN1Ptl7RRwLpbE2a31Yaxg
         8ihA==
X-Gm-Message-State: ANoB5plSJq3jKDdfvbsZ8t33E4lWQShO4xQw86AEMjgdIJWZbPrSpE9T
	+hZXwbutDqbB/VclQGjDHqRuxM5Xlrnxaqkc
X-Google-Smtp-Source: AA0mqf7CDWJLqJW4pahh1xcfZ1GfdwJmgRCtm/3IYxaNGTgYbs4RnFwtJoamf2O2tqJFNYKrqqu4Rw==
X-Received: by 2002:a17:906:32d5:b0:79d:f5f2:6f55 with SMTP id k21-20020a17090632d500b0079df5f26f55mr11497106ejk.531.1668480881181;
        Mon, 14 Nov 2022 18:54:41 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:40 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 15/15] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Tue, 15 Nov 2022 03:54:21 +0100
Message-Id: <20221115025421.59847-16-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185441_937735_CBF52D7E 
X-CRM114-Status: UNSURE (   8.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for the Mediatek mt8365-evk board.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d76ce4c3819db..6781fcdb9fe69 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -246,6 +246,10 @@ properties:
           - enum:
               - mediatek,mt8516-pumpkin
           - const: mediatek,mt8516
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek, mt8365
 
 additionalProperties: true
 
-- 
2.38.1


