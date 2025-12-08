Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884EAD3B7DE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=; b=qeOyLKvt7RD721ZwVgGsjm2H8o
	FDdVv4z+gVUECWRIOlvo4coIPBSyHpF/M3KmN4adyHlGr/5hMu1qC91uunnJCvU9Ed5+I3XdrYjwJ
	UMh9In0jnpowdNLoaf4/iZU0xqpz5nFDuxo3l7sWZi3i16sbaeIL8YSa//KLrjo7v8aBzIcJ1YvZl
	Zjkg9pmUIbFtVmt0QJJec1k5BNlHPT3XMcsXv+rQURkOW9x7KTtt2v1wGHsf9sl0WV1Cmx43/ugMM
	NjHbZ8KO6e3rToCqywxw/BUbgiDZts/I4TnLoqHOL2eaJ2nSf8GXO1tckUSBLS3UcJu99cZ7ASDEf
	QqgYjeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkN-0000000ClTG-24KT;
	Mon, 08 Dec 2025 07:33:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkJ-0000000ClQy-4ANY
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7ba92341f83so5652635b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Dec 2025 23:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179203; x=1765784003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=;
        b=OBRjKnUXfCrwzn0WdAX1hUHETMiZQM9zTRB7W923NWn+SLOv6lSZXmrDGARtjGSmCZ
         B9QJlF9Rb88WVvL+4Eclt/fQnj4Nly9neID3GKFJEqxTIQw/pP0a3ebgf3nlLD44eFBt
         9g9VfxBp69nm/8I5h1nQsVxBxp8A4oJBNbt6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179203; x=1765784003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86b9GUNfdvttDCRCuxugZUht31CVbPRSKA3vMkwcp9w=;
        b=XX0y8sDzEDsjFVoY9wlf5tNrT60YQOnfSasAtR8e21D/5XhZODLInInXptDJjDHNnf
         YOvibrN4nfWCoHko5nQQIqVQJFEdoWG5gGiLstHqeV8kLgaDepRxVO8ut4YTnnCh7448
         36M6GrIe9JvyLtAfHLLPg8jW465VCN9V4ugzW3/zDXxr5ECicZlSu/7zcymZOzG2eXnx
         p4ldIx/Xx9P4qMT0ENgIGvPC++4tMVKbqTpfctIpNx7lL0LIXYgmH8y1CMTn3yEfrSZH
         jVIVxo1gXS160Zt79FqjpzSLPEE0y+G+XvR7WtCpjJ2mqsa2mrc9EW1FgNngai5/SPhg
         BSJg==
X-Forwarded-Encrypted: i=1; AJvYcCUXK7o0S44sgRXL/d8yovlPOnbV0SsoawSrlcMOrxY6AnQDnqEgIOwRx7dP8dgo4ofaYmqOg9SU04eRrrJ2Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Hk89QLUAGEmug8sX1U/gMB617pFGnbBOZ8eYVQDadevrSYgT
	oLsq7YsPTeDh5NH0kkwZrQxtY51AqK895hAi5dplK3KFriGcKFPXUfuFFTT7BrTKuw==
X-Gm-Gg: ASbGncsZKqePwtinqM355I4wQqGN+t9AOAL9bQZfFDbiAETnb/nsHdAfxWYN1RW5Y/9
	NSSEsomn5XlC+Hd42V+N5Ght5I/q6pRzEfO5vlI1Gz4GOspDk/L7eqsCnh6Q9ltEdkfKs6rNI6N
	SZTjHboFHwoG8PEn0VSGxsm7UULvvx6/euaNDw5RKJW0pUUK5H+WHY/ENtyPw2+nu+mS7wXpgvg
	cOmKREUri7IqAwbA5LHNlfyJrMWoqhaNpJLgIxmiCbO7YhA/IdhtaywZqCNa6GnFoKJggbQGcuY
	M+WT3suOrvUynfqEe966O9d+CgyVGn7tCb6cLn/6l9MvW2+Zaqk40W/kmq2CW+DhTVG3vH4uZD5
	eb0QJrkmAmbg5ackAgbfd/1EPzjgSxcOI18LYpd5N6I6T6wBnSf4+SSMrOz6FVOViIvk7wTHRGD
	Sj4SX6JGT33qpAn8KjbUKFMal/v8xw0uhUtbFDflU16M0+UZlvoj/Dpz7vLtp8re3fqwzc
X-Google-Smtp-Source: AGHT+IG+bsvH7N1bapcW1PPpLCcGsoW9Tvo9GMseHgeyoI6qRL9+qatTD69qLryiAHY5E8s1TajC4g==
X-Received: by 2002:a05:6a00:852:b0:7e8:450c:61aa with SMTP id d2e1a72fcca58-7e8c960087cmr4519854b3a.65.1765179203211;
        Sun, 07 Dec 2025 23:33:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: arm: mediatek: Add generic Ciri "base" board
Date: Mon,  8 Dec 2025 15:33:02 +0800
Message-ID: <20251208073306.75279-2-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208073306.75279-1-wenst@chromium.org>
References: <20251208073306.75279-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233324_025392_B045CB12 
X-CRM114-Status: UNSURE (   9.76  )
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

To reorganize all the Ciri SKUs into device tree overlays, there needs
to be a base device tree with its own compatible string.

Add a new entry for the generic Ciri "base" with just the fallback
generic "google,ciri" compatible string.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 718d732174b9..9cff861c6e38 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -372,6 +372,10 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - const: google,ciri
+          - const: mediatek,mt8188
       - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
         items:
           - enum:
-- 
2.52.0.223.gf5cc29aaa4-goog


