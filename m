Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3673C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9alcK7r3LRGbBbynWJVNVjV7+oLSYlMvkY8RpXQxqg=; b=iZ7xVG5S6NxZezOMrzUEZIHL7T
	HIWzjkOW1bC5hAX+anc3XZCw59LF+YFjhYPLZkjd6PK5OhAoA8Zc9aWQbkhHwTuI1P01pDo7lvC4S
	iH30J/nrD+cEIDo6qCdTIj6ZjpSZ8iYgWj2/mj5k/9JsARqtftF4qwcL4+7474ZEg6myxXkFzQzRq
	26HPHxWdFcjVDlPbuVy8jyc/VnQRtCfEAcavIioOUhAfPyLRHh4uyuqU24+wVT64f6DxYBussPnvc
	SFTTc2dhBBVrLyr653IfEw57ENbQuPVvmGEun69lfxRUeaPY9RDjcDdFfcXOvNwyKoRF3uPjOmgYb
	8U5eUEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum7n-006zB5-Lp; Tue, 15 Nov 2022 02:56:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5t-006yJ4-R5
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id m22so32851079eji.10
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9alcK7r3LRGbBbynWJVNVjV7+oLSYlMvkY8RpXQxqg=;
        b=AeRSmX7lhIaontjUHPn4JbetLS7qS7t8sLO0isFCkk3keEMZXIyquJ+imX5LA0z8Bo
         k3Klyxo0yZyEtm2tOfIeFxXnE3GYFGT+7TrQU+pR+3sSR5V5BbRnZ+cnyIfYZk/kZeX0
         PcICYdGS9UtMMTSeI0xrRzNDHNb/XWLqcftSi8DL82oyes/KPQcUdLkrMHw4GNgl3vda
         tpNf072BglaX2v7yC2LQ4hReg90Ja9ivGBTvvSDYNvhv0yt5gJ74dMs34jBQJM7WSkVk
         xu2JUwIWyMvyGvkjB+Sxew4jGeauFk6q/T6u8el/s2OZziDzlsTbft0w/5tW9VkeDTHp
         bUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9alcK7r3LRGbBbynWJVNVjV7+oLSYlMvkY8RpXQxqg=;
        b=bTyxZa5HuXHy3f8eCxhUZIHm2pqSn8L0KApCeioR8GZMVqFvikXiJceEhWvGFd+4bE
         rGL3jR4A39Z/O003vxZvw3JdtrCUWnwJNvhe8WwNnpZRM7Struc1UQwha5mbatAYmqG3
         s0uGqTUW3SCQNQxJKSdfPmx6hmgKNhDG98ECcdbescBX0JqKbhoMFDsspH3GvX9JfrSx
         SuUtlDFw7BXutarzEwlfRMPyVxvNJMar3UycQ3l7B8whuMFbojJTGd8Ge80Z089tVDEU
         5ZJBNRI535YOFDJseY32D2363X8wE1xKBmUiXLfqb+RAZ6NZpH4MpSrgHkpTrz42V2xy
         W7Ww==
X-Gm-Message-State: ANoB5pmx43J5a4tarmQhL7MU2Te6DlXNSYJ3R8YdMXIl4bxLGyiorWaT
	JMar0Rm9YCfleoihfCValWCKrmnEMvjGJlje
X-Google-Smtp-Source: AA0mqf4wY0ggW4eD7zSQVKy7LwsAsjZgEXrVPUJBY43VMe4uCQdmo3KTeiMg+cwLesBG/auDuQ6ZYw==
X-Received: by 2002:a17:906:7ac7:b0:7a5:7e25:5b11 with SMTP id k7-20020a1709067ac700b007a57e255b11mr11870840ejo.254.1668480877138;
        Mon, 14 Nov 2022 18:54:37 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:36 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 10/15] dt-bindings: timer: Add compatible for Mediatek MT8365
Date: Tue, 15 Nov 2022 03:54:16 +0100
Message-Id: <20221115025421.59847-11-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185437_913224_7C72D92A 
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

Add dt-binding documentation of timer for Mediatek MT8365 SoC
platform.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 8bbb6e94508b2..c1f40aca2d48c 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -20,6 +20,7 @@ Required properties:
 	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
 	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
 	* "mediatek,mt8516-timer" for MT8516 compatible timers (GPT)
+	* "mediatek,mt8365-timer" for MT8365 compatible timers (GPT)
 	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
 
 	For those SoCs that use SYST
-- 
2.38.1


