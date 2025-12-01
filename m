Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807CD116F8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=; b=otb/2MhcNk/XtR6zlc+Ennowds
	mKZ4N5wZmSpA/tu3xOAhYPPacCBeJue6ims5QJ3Kajx98boPxrp9t02zCC1M0kcfKkiSKDIXPTXf7
	IHQxWeAsQo7TvjBgJ4vTcaWYbzOK1lerP/hMrTjxfgJJm6c6eIjpg4CJSygWIOvLQmVw9Mqzhe9zp
	JOwVLJuo/zsHwBMWldDazISDqWmDkeBWr/BdnCjkfJzDSYgjTSqRMdUM76lpSvrmaLFUERkujK2fn
	Ednu1C3iChburiIEN7cMUB1LjgH1gdUx/MV9DnszF+nVHi57odsrVp+ZmjSl7FBSH4JTs/uNAcj7T
	MUDUlnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTz-000000038ED-22wY;
	Mon, 01 Dec 2025 08:42:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000385A-2R8z
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47118259fd8so35684065e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578507; x=1765183307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=;
        b=XntfitJP4D6FnEgoHwDnWMPoIQKVRs8B1dV+gjbocnONj7tZzSzdi4qDEFp3BWtfKe
         338deEXNYGVvajpw7Lx2YYtSa2/TB3Vxc3Kqwc2FNt/8D+4wQtJzFVMEsPjEAGpIBXHz
         LyvaIB/HcXzXu4P80EWALz37IdVargMP+V9QnDUZQ5Vn2myvUE7WsRsWsUlHW2UJBfBV
         7hwf0rstPcGLILArA6N3GKMRbRfm8fbgtYCDrloQRR7FML+D8sOdObSmuyExX05sVesb
         Wwoojbw8osHSsvB7JSxGfionjwv9xNN/tAk0mRsXLVnUwhkjRo4ocf3SEyq+J40ApjzF
         l2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578507; x=1765183307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFWvZEEhiAwGjjJdNwTTNPizb/BR3jr6ZQBEE1XeAik=;
        b=jlu8B+oY4cyM7BlRR7nhIgTbH1MFReNb8uaDgFuL9zw7IRNjgZqlm3aIk9LBzFuWDR
         A6jNSYnXzg2GVoBg+qniiu/53/Gu6sV3M0Q9hsSMe/bU9Dd95jQF9mYP2cx5HKO8UTVD
         EbKyi36no1SSv+yQKYEoodGnoXvj1Kr0Mnjls1LmNTVb3bLWQ9UX4QeQ/NS3GQyATcqC
         786lQsfa3ySVpHs+VojvIJwatbIzKS2X0XD2QdjuwfQmy8KsLeKB+pbvCg9TdLn7zDzh
         fDcEjw5dCJaYTbrdItT4yRqyQiFnQqvUfwtQeDzGk25b6qIdsho5OqzRda+MV6pPDpJv
         J6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9d70DHbfM78YeiGsQkjplYhct7AKx1q5f34JawS9FOhvPYFz2wkob9+jA29SRpnW/8s0MMCPwqmBJm5MgvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9nvrJIfLXYez/ealDhXmwjmKteKvVMxq0xxPHr3jGbJAIUdDu
	JcvSccd8mWayQItlCwkn8xej3aZpnHT7dIR9NDLWjZIebgFut5PjcrTG
X-Gm-Gg: ASbGncuSOru/chKQkO/bivEVjZDKJ4tTz6ADj3/95q2sWG+AzPbSIZ2SuXSqPNkzZyy
	yXeY3a/DWYMrYRkiJUVyQVr0oVpO9huiQcqiGFM6AqNijWbFXW7qCkgUsefgZ7vHkRsRbu2ymBl
	YD2oPD5BklDw6vDei6HAxtpz0I0Ql0k4DxCTpYuedCNa08gOx/iybyy9E0ne2eaITBJDyZHG/98
	adV9LLdkcKPPFuN1qjpHHGtN3c3hFbNymYMztKFjkcbbxYVcQVSQLHHPVXjWvwMm+pYsqegM3/M
	g2D1biKwHJLj8Hk54BtW2wevmLVPfTkgMrF+YIgfxLRTiDkX3Qmvrq66gNFu5b+VFC9j5ZXsfJW
	DPDlb16El7SswzNoiGIyh/oZf/dLIHRTVuRQjFAPS10avdcDm+e/R2XInIsJu8AAbNZBLnZ7OHk
	mTnHYttPlcksxHwQi2Ues=
X-Google-Smtp-Source: AGHT+IGhs6p/Px4HSRx+ii7ASQl1YviEAStwSJLBm22f5Y1vrBH6D+UflFBC3i3z+pJ6RqSaeOB46Q==
X-Received: by 2002:a5d:588c:0:b0:429:f14a:9807 with SMTP id ffacd0b85a97d-42e0f34fadbmr26557716f8f.40.1764578506601;
        Mon, 01 Dec 2025 00:41:46 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:46 -0800 (PST)
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
Subject: [PATCH 3/5] dt-bindings: arm: mediatek: Add ezurio,mt8390-tungsten-smarc
Date: Mon,  1 Dec 2025 09:41:38 +0100
Message-ID: <20251201084140.376058-4-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_774184_DEC9C68C 
X-CRM114-Status: UNSURE (   8.07  )
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

Add device tree bindings support for the Ezurio Tungsten 700 (MT8390)
SMARC SOM [1] + Universal SMARC carrier board [2].

[1] https://www.ezurio.com/product/tungsten700-smarc
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
index 301f9a1e041c..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -438,6 +438,7 @@ properties:
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390
-- 
2.43.0


