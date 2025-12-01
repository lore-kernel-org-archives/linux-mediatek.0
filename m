Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27F8D116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=; b=t2sK98X8eH3oGsH+LOAEICQk82
	LQ3RB3Udn6PVupwSLgRoliGtVNjpRP6qU+g1DEasTsaDB+BdqEMqp9NekzdzpuEFfxTdF4fhxSMDz
	JS4hB8zKXtr2BCEZHoIDMoVFQbOH8bfYoB4PxNgyn82FyO2x8DVGEIDAJoGZIPv6sGutUYxMPubQz
	kla049afcQu7FbAhvfjNFBDW+k7bz8I72QKfLjslQDYlAnANc/CX3JMtnIF27qOx/cx4xIJzjd5qh
	TnErhzkjst1VKGp9WRWyjXAXrKefndeCE2hjF+y3OkH/UFnbSnc143WC7+qoG56S8ctklNMtdAK8U
	Fd+9L9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTy-000000038DH-3ZvM;
	Mon, 01 Dec 2025 08:42:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000384v-2R3C
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477aa218f20so24654565e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578506; x=1765183306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=;
        b=ZM1x9r+EdTlpyXOnhqjbgcV8/udA3umQUOkNAoo/rzwBZFom5sCQxDdIXQyk2zZD5Y
         xaqJCr9cgr24v2DSoMtYmbFobe6rOW7kwdapKMqpzdPgc091f5IA29jzzTrLkBmi4xHi
         IcJgiXgmCXI48+up52Hh7lCSp69gc1mL/TIHRbhgQQGkZE2Rlk4ahr+Td5WxYkeKDk9h
         gJQK5cfjI/sRokk9Nx31/8tuWDAcJFsDkdI8X/yXXhtcQESF3lxOmJZx8BuEK1yZo0cB
         KHWy8qEX2MeMNBIB2+KHBH+Q+pcRciy+NNrpUZObdAoyohtVTsMd8Sy8Eqz8A+AH5CJv
         HVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578506; x=1765183306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=;
        b=dGz719Sm2sQj36vuiP2a9wYjR3FI4gUA6HjFARlPKm3p7fe11usFCy1YqRho4HaHBa
         hZZ47ksV1lu9UPgwNs4lpuHGZagGtOuxv/sajIt52+dXo6xe/YXDrjvQpw+dNfv/aAOY
         y/q/ejQqY56q44gD0RBotFAklLdwgCZ88gERb3SE5XR8Iy/L9rfaH868DCnDOvPb/EgB
         f9MrovYHwcXUS34EpExcLQQV3ERMxt7fkDIu/3oXNdONaIOgYF2ygMaW1DluPaqWGme0
         cPyHSHjDsZwW5oUic8EVu90sUU3Z1OtlNrH17vPUIgUDUD322x1fj0p2QWZoTjfJRTDV
         Lcug==
X-Forwarded-Encrypted: i=1; AJvYcCXElEuBq3b1/34vTOJxReiGUvHdxHQuJv1cK01gARHwKULRI0JJiliVOgpqzytdXIpmGpcOGMeeAUk99itMpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7NIZPocvQ+k38/bKGEJPtOgzMBjE7LkjGi2GfoXB9PO04o0vX
	UKMj7ryJmKsM3w9OLlVJteL/3QecxQTSXPYoUe9HniNRjYgDbVomo0/+d4z1vA==
X-Gm-Gg: ASbGnctGB2eLq4GZEcrhqUIXgWF3ZI2NVyVJkUKAdiFbJqz/luFNTduqaaoxgi+6feL
	QTDulAsfmqneAs2E09SqaeUbCsyu0NlVg8XlgRH7aDINEDU5TNNU5mshcpf3Bc7srlN9iLastcb
	iSbUSKlupFaBtG46ZwNkcQcBmpfkKP1+mKC0QjkeDxL7vBcLZwFd1Z/uGIw1ksVuMS1/6aDz/xX
	X8OV+V8ItJ3z545Bfaro1IAE1iasmP4Lm+zZrczFEUgel1i6WOFWgPJQVrxM5pkyfoB1z9bbhxq
	SPqEBrFD7f2pjyTzhnSITpPLBwQZcN0dZNd5C8wq9O2KYQWVxB18/OAe5a+vepGc7Y47Wv0yxGh
	Sr4I2ZY7uuziY/giephgVhX/5SM0YJKemDmproBGQnU4J3kUkYDCuhcpmmmfwdA7moL/GKv59T2
	1FpmNzFZdDFSmFWILkXSr+bGoVzNcaog==
X-Google-Smtp-Source: AGHT+IEYuCTv935vGmlcGX3etHdHZbqBXh/TzCfPUEc0jsmHA4A4/uxPZ70+glSBPUk5gb6AjXKx3Q==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr380794285e9.2.1764578505868;
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH 2/5] dt-bindings: arm: mediatek: Add ezurio,mt8370-tungsten-smarc
Date: Mon,  1 Dec 2025 09:41:37 +0100
Message-ID: <20251201084140.376058-3-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_764505_69E16EC9 
X-CRM114-Status: UNSURE (   7.97  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC SOM [1] + Universal SMARC carrier board [2].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2]
https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
Cc: conor+dt@kernel.org
Cc: matthias.bgg@gmail.com
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..301f9a1e041c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,6 +431,7 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
-- 
2.43.0


