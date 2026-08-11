Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F4C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=; b=EDhQbhMliV0NuQHW+HSE0/oj82
	RKsavcFEvy5nbeZ+Z6rcJl2n2zWcniETt8Wm81kWf66Na+gTxOesmp1UYs6czjLv9z7suK5KRXMla
	X7uv69zVOGVTt5gCE4FM4G/n4slz5kOsN48gIq9nuPYgO3N92sAd6ve8xAloHiOhBGUj6TcvuwuFH
	p6ETnCM1dRKWkcI8QmQeSbvb6C8rkfj6VsQyob1XHhvMXxEJq/1eD/ioOlkV2wJAzZkQBLzzIQSZM
	VgZqaeuuLrYUe+F/2RQScwcKtKjAYFb2h0Gi2Itgl2MthDo0+5PyexBSfswy1taLmanqS2xllqIBp
	U/75E+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlUG-0000000E0l5-37vx;
	Tue, 11 Aug 2026 12:21:44 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTp-0000000E0Sd-1NT8
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2544224a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450876; x=1787055676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=RGRMrm8IYsZfJQmLDvl0lFa8c+Vo19dVwjOd0KA6fVNiGzGcvFu7aLfukwVkFzLTar
         t+St1pIOWVjdVAY/XY8/DZZQp/tG+lX1lY6oqXC/rPNAcwZNaqxL0SxeJuXzAtSCMYWb
         Zv4XGOlWulVUYdbB9f+sG2E3QBjB3HOiuTG6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450876; x=1787055676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=pUflJuz1eI/GOqKRJI+i0+K0B6AjuV5h/MitTaE5KS1hzfqwgJUaf/GeJ0tm49JrAG
         FSEaVD0ZB+ulMXsfYG6Tboc80hvBsLjxA4kUREX5r1bz7DuUS4K8NbCI7MRDbhcePyP8
         CivRQw9aDeGPUdZew21glrsqUfJd27ttT+iB9cmATEjfR6AgoX4qZsIzZp3nlwy7RhFC
         VHHg71qyz0l4GKbYZpRNO+ExdRLHr1WKk7wGISViZ6FlMyzG3YlX+SrT4lWI+T4OOZSU
         vYD71BlH4Mua3L4TGxrYSLV0FXjSUsSkCNMPAXYVQJU8tRnVMghyr8VxiQleUouq14UL
         UncQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7I5FcercmjhRyxZ33pRZjW5zNu5EC2FNUpCnYNdcWwLGBOYgIVp1WT2CtFewVht+VHwLMQgnNQ8r0WumYvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuXDNW6+06/Mrb+sZ4+2nD7i/DaF42CD01B6YTc/zlY7CJ0KQW
	Gud4uyDD5OmS4D2RKF8GYcAvaIp00VgE/kjVpd9+of8ybMHBWv9MUmwbTiOdTYzgTA==
X-Gm-Gg: AR+sD10fjfZuwvFU0FsOFREw15cw33mj42bjvHV9t3RRixPmbmXXIoUh3d1eVmA4RUO
	jDBqwnm4SygZJVzupghQE4or3puQ745GmpM5m0OdVD6Fr58x5COff21d3Y3x1taSXHxlLeNitfg
	7eSXWrK3XwHFZj7k7N+qkELuRGbx4/FDCK0uo2nG7NjLhZVYgyoHR75Jx9suKUDrCFXU6iPePSK
	mnQ9SoImWHyfsg1sbnc3/3shSRd0gIz3qEK3BRBib8KTM2GwFTOJ45fNO9oJW0a19RaDwKAx6o6
	zM9sk6GOwE8XEa6zpt6+nzXl1MnPHcdf2Crh1F0XD4iXHXs6jzCnuULEoqYP3mHrgwjzjpQItZs
	FeCzj9kTZ89uJoVNtcg1E5W1mh8EDndQrdv/uAFxWtVgIwZwrxD/XgLyJ3WoTDrQNsuZcRDqbJc
	soRpe+yJOAbQS5Tdzsl+dLelOBKtrU3LV1Ge+RgQRV+AkbxKrBSWhF3vcxkvqOxMXAbRbxf2k+0
	7bpkrvnR8utAK1/neReD5ZueKbU+hqWeDTXcqdslJmeug==
X-Received: by 2002:a05:6a00:234a:b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84fa8889f0amr2532844b3a.37.1786450876479;
        Tue, 11 Aug 2026 05:21:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 11 Aug 2026 20:20:09 +0800
Message-ID: <20260811122011.3539250-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052119_457097_CBBB993E 
X-CRM114-Status: GOOD (  13.79  )
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
2.55.0.679.g6767b8d81c-goog


