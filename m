Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA9DC44533
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=; b=f4QYvscCy1vzuXf5pFSZfTuws/
	tfU0CMEWo1jyDqhBN1GL5LQrVxiTSVUotiawmNmrzvtnihJQUYPrvem2yv9B2NQXvbPdG2XtKnDMS
	wLuKeaIq/VN06Y20SZxEauOGmk9NYw3LXwg+HVBJMyFYND1cdW70umvdjJQZ63diw0MDxVlYPHskx
	0nrcGbBrEKywYIDeYa2das52/3Kswg9EG2srCNIkW6hqIDu+9QJEnJ7PWPUVI/ZtrBok45YBZgGxN
	X5qRo1KLLg+JBPV2IPc22BN4tR4eM6n2NyLeDS2bukrsxon8hl3VZ2XIGuneo6hzk4snTrvs4fWdC
	iciEdZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008iBc-2qcR;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JA-00000008i71-3V85
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso126392295ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620472; x=1785225272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=NACoio7V34uTvR/OmksJdFdA7effoApaSq2kUz2ULfxKKVEFi9j5/LZE/KG2yqpDUU
         iuSzsFWwCN62c7jxLuOTpiSAkNwLJDG1sQBxUDJaB+dVFxdMMROGx2AlHVBL54LGZ2oE
         ZIXOQIAxazO2cV1PA7yBdMFmOeRN7E9XRmNAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620472; x=1785225272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=e5JzqdP5bduJfx2slQKI6x9vVw2iKIiltgT/qH/zt7TbVfuwokDP7crjPpszvz/0ZR
         aiuRbix2PyQ7rNZ8TIzCO0RD0eh8T9Wh49q41VImYdKrBQWU1RVoxOVNy8/lpMu0ci55
         49JWJBV4ANET924WlJEewPCAWWSEzXmsTt4Ez76vMZEBDbeb3FyhJOXzKw2C6FqqHg8I
         kkRvWpcO6mAFBBA/JCba+W9aRGZEiQVReexIQ69JRDasin7bWwsYwtGpbd9rKZhNMsHp
         SeUd9CMVimpwMcfcJq72O8p4FS4fu+Wy3dXPjopU+Iz7Xpxgp6edPYt9X7qQIOUGPi/Y
         sLdg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/+CA8xqPe4Kysu5TA21XkdSt7Zw2EYLcqcWGeBbqjYZUXssNbR4G7Md1ERhUFve803L188uV61/PL3SwoYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO4vMEi8//kHoqr3jsdiFI5vyTRxhogUXCpwGIWqIm21NBx3ux
	EiV1F5yEgTGgkS8636ILzys7gVXGyKA0v3zaqbs6X+Yv46QI3/NZf+pFA8E67I+klA==
X-Gm-Gg: AR+sD10jrt1GA4vPa6tfhigWonWZTGifxUIxpae/TW4eWFSgrRC8pxg0wqyl+v79hkC
	7JNuaQ7/TA7FnwQljy80zjnu4D8525TMmZqMR3jt13WiB+tXp8e7Zrj/fQogUNK/znaGqK7y6fm
	dZhn+cw57tjp1J1lO1YAjRsrwnq2j5pAD0Mfx542nh34QKvbcuZMdvngEwG3wDImpJeT7wNOD7j
	4xrActzP6oSh0HhZlasweK4ptjaCdvcfzit6O3ooMWYIhKN9ViqmLgzJVV3m2GlTi9Wm7M0pEPP
	rmRQ5EGKL8SVXYW39VK3gzOPXOTMIYHXFyznOrRT2dTZXLoBdUs+C03qp21jAED8/Q67ukAVvoV
	/vAw/2iex0ScIpg3w87vcL5Wl7kZpt6dX6hbaur6/KTsDvZiARkdrYj5SqNBF4OQre0L9mNY8Y4
	PdLUihrdvgLBIa/L2JawQc6T6KZ4yUHXAYBC/64pAdqopza8LOhH0xSiynbB3vyzNi+Q14gw==
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr15956285ad.26.1784620472296;
        Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 21 Jul 2026 15:52:23 +0800
Message-ID: <20260721075226.2347933-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005432_892713_90AA1F1D 
X-CRM114-Status: GOOD (  13.70  )
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.229.g6434b31f56-goog


