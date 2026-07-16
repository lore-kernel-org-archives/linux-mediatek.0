Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D38AC44511
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=; b=mU1Vkdukt+GHoaYzGoeXjs5P07
	pxZdujVHmcd8PHhnPmuIAcd17DVPg60ZPGKruDX1QqN5S1cNn5HWyqjX7CgAYMfxQCKOo29qBzIHx
	vHX8cL3EGkPRjso929Xf0zYJCwcBUTlmDI3NS3fSHmWulBsFR+bN4SKO4cKBL2tOZJqKjx8N3Qt3o
	XrbTMV1h9+MnCVNATHav3IicxePkt3friRkDpdYj33L2qKYH1eTPrw5QTlKfwVrKpsS+sVNLRPFsG
	Vb0gpbHTvUOojXuh27PaSBvcL+57r1I52TA3Kxcl10W46zCCmGOTzJbQKURfIoUWeDz3pcA2sm0b8
	z+Ri30Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOos-000000008Na-33CY;
	Thu, 16 Jul 2026 16:20:18 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOod-0000000089C-0dNv
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:20:04 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8487b7b4066so7052106b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218802; x=1784823602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=aO8DUcxwyn6Ctbjd/G+8VTMtPmwut+8nsxlXRp1AM99gR6TKkLv0hCxQNZ0KVyJTuh
         4AP/9ev7xlAz1O/EqochA3Gnw7OILRMkXdhHqWGCNOF2ux5Sr99yDQBEIKNy3dUU3x/F
         FKVUkrOF4CxO5BwukFXq1Fu2Ibs5clrl4kXwwNTJCX3Zox0LDM1W6Umb3PdOPqcElf0r
         2jN05Ji5ooILpV+heJ0IRDQJ6UGX6wB/j6KyJOnxPfy0J7qWexkHhgL3cem8ebjJLQD/
         39peZQvbF2MomHh8VXcg6eNvwJPLMkxFinduwkd2tfCnIvpNY5+Tuwqeqk4HfGwplPby
         qFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218802; x=1784823602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=V7j4pi+I+GIga+TRFNhCkqv/BrEnKR/Q5qNehdMIkMz0BULOdaUC+hmutHYVZnJuFy
         iuSUhm2zlnvc1AS2Vjc+CIIp44ZLaxNtnCi76Yk87vgEbrig8wHu9gYZCKD40LTF7UkE
         L0SyyPsbhvWDDSqA59vMrJaSf94E00W3kMDN6FX7xONifqBjzf350XUHVIc5TuTTxK5Q
         noYkSMQEsyl050LdfNy7VHHCWHtV9jE7+0/kEJJqFGNiicC3zefq1b6ueCFvYuteQjmv
         wqninqIybil5EIKAvCYw4cXwXS3cQPvPP2KGUmu+aUskbiM/NB3G6ln+uSGZwm5kmTW9
         +gNw==
X-Forwarded-Encrypted: i=1; AHgh+RqK3cdx1Xxe7b2/FFNfg+Alm2e1XA2l5dp9wn5mhnupAIyLcM9hftCemnJ8nR2tabzETYhlb90BYhZssm8R7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcqtE7HIK67mcftWtvvfJaLyO9ejNB9ySGkaOecOQywkV8daE+
	Ux+f+fqDHYzIN4bEBV7RabB9FdoSnEOY5CgC4gZG8SBcAk35IHVm/DR4
X-Gm-Gg: AfdE7clLcQEOmPZxxsjzfsEFuqSCZt4OKUiVqnsHZDumgEGXR+0yp6lyi3t1ZfFQTuR
	6ifiLN4TvByKLyYHdxa+wbDBapSOAeYj+LnHiBzRraaeu0hQHpayXQpNd5BtfZI2O3Ke1PWu3ZQ
	kv1bDHXJK3SkyjMTAMctv2ujg5hPKb+SRjDrDiZFrEdZFfNa/lQkfAXccB9U8i2up9OyNtgDnTN
	EOiIS7FJINPSpnAKUqWL4RUktgA7t+ifrL+M9pYb8UBIAtgZcmK1l79N2iUZ/r02Y1xqa51byK8
	pBeNW+vxt6EWPcbp7rYEeJV182ek9IeFJyoW/cC+EIeDVpXeFoQKXtgvuKbP/u5iE18eDe3PzWz
	InVtpbVsEGn/aZzNvQCwaE3RppNH/TWLz0qy8lvQS67x8bBEftVVRO6xkgZ+KhDRRqY9xmeDWY9
	mZ3tXJP/TxyOvYIu3VJ4nE3+RFTfbIc/odpw==
X-Received: by 2002:a05:6a00:c83:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84a671da754mr7414224b3a.13.1784218802301;
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 7/7] arm: dts: mediatek: mt6589: add reset support for wdt
Date: Fri, 17 Jul 2026 01:19:23 +0900
Message-ID: <20260716161923.266315-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092003_191679_9895399B 
X-CRM114-Status: UNSURE (   9.10  )
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

Now the MediaTek watchdog driver supports MT6589 TOPRGU resets.
Add #reset-cells = <1>; to enable it.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.54.0


