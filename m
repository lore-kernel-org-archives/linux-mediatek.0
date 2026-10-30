Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0660A6F4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jhIu/f6K;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eaOMq/qs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=; b=jhIu/f6KOMpAuP
	H55Dll67RGu9qMEcCZdww9XVeoaR+CiBdn8jHR1InKmfoUzqW5XTXF6HzlJTvHoP+BE2ggkgRRYq4
	qCx4gZxreRxcsfR2ZF5BfkvkhCUCIyrKSMWV+O1X4hpjmAJjuuG9st85On6hKOSsVy3fdHVLYCubR
	X2zjm2zxLKbvKf9hnGWIvm9A9Js90Ddsu+2WnaIboVFTEZ4TSS9JiJqtoVxdSP/8YbVA42dwl3neF
	x9EPiaWIXAlCdCK3LNZBIrk5Q7VKyUjhn/dOVcxpgPk6BhxjrMf2bf6/RmSmcbLiYj1n+o6f/VWrA
	LmQ6oMpFYIqGc16Yqhvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwS-0000000BPXj-2lip;
	Fri, 30 Oct 2026 10:34:36 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwM-0000000BPT6-2x3U
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:31 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso766218eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356469; x=1793961269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=eaOMq/qs32qAPr6XDDrGegIY0f12pTJ7koFX1xSDouLUloR/r+E7I+uiGwJAyyIUvb
         9Xpc4reeAjeVzyQbPqzh2Z4AYan/qR2/zveEPAcvoM+PZFHmCBnXcwpCtx7DyOFQpjuC
         ItIJfL01LyI+ykk8kNSHS37cofx9I4FMWNOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356469; x=1793961269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=nZOSlO7C0LrD5fbKj4O7vOhlem/zCcufSU7GZXikZU9wXuNVetNWcVDcizABlKGCK4
         Yrz9epF0bMUUTpK/TZHxUEDjU3oEbGZaevXr6CO6H4EKovxyvWODHZkGlMwU/klWtz8I
         S8SS510R4J6vBFFo7q3bcctPR9H+0WmzRcs7IcpDnVaJEFKwmgUIHhZ6gfpz/S9lzXbh
         eB+BkiTiZ2E9c2lzdHFryOLz+sqebtEM7wP8A1+ZBv+6dtJi6iwWy8iJlJONQvyNtuJY
         B/QMLW02urJx0DO529rski4YQVu3dOjP72KzWRcxqzqtYXrbBUS+FAWj1wEBM3Ypc2P3
         oZgA==
X-Forwarded-Encrypted: i=1; AKwUvBw+6ipYnymUHF5aGoV6Ii3RdnIZJkINKI7M1SMmzusnFP7leh37nDaVFvtb+NBt8qggBRfHrwB1hS4rGduVKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIqMBzygUFvnfJTtdgbR8eNjM38qN57N5lBihhrx0IettQbUexQ
	LGmBQzsM2wAbylLa7+H1/SyC3c/MpDjzDYqF1rtKBJx6r4RGDH7cGtJlCYG6ODBqyw==
X-Gm-Gg: AYBFou0fZNB+JC7lHPsRLkulgvbqeGFe++s9ufvwJYxqK20c53IMWx8yfKPVaUox7sN
	swPNwfzZcw2K+4liiDb34IBSoiXVWHMAEaAeKO0pdQn073VDIKgqNUAFbInDzL16iSshYQnssP4
	XfaDGaC+hQSAT+tMw3cdE4TqNpZn7J1ux4WfxQI3iUO3uKeu1KZtoDdfz2TfeQaIqFp8PJHqDgt
	1JgCAtVLsey2JBcMw+SxTZFctQpRvMfm6yLSC1IwqbJo8cIpnebCkQQ2qQhCx6G/SxymH/vYgmg
	OgNdTNUQb2uGHyZONBR4Yr0KNdmoB6J+YmZ7jpBItDlrUDP2+OP0EF4+Sn0PUZH984MwBuUtWli
	NSIddQRvfcEkTCBpqzosBYYpJoAei3BJOnrHAaUm4gV4J2Zwc/0oUq44Zi4vxmAPX6FwPCTQI9B
	iENNxWunGYRYyqRhRAJM2YCMUcALKs+CwUVxFInj4JKSiq4NGWhqJRXjgfBcqZW24gs8CElm6WO
	XZxxVJb12Ur6oauhiUcGrvM6oxMjcCQY4ADoXVJ/TkEJpNWtWKeKCL0jp2ju0AK3GrhZBFiPHJw
	IcjtnQn6K3G0z9RfmVf265wzZjwDdY8PUPfhI/9AyYqEv6TEgREulsQaG4hQnKBETM9swanUiPm
	iYxpqQF+qBNFY
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr3100348eec.34.1793356469205;
        Fri, 30 Oct 2026 03:34:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
Date: Fri, 30 Oct 2026 18:34:17 +0800
Message-ID: <20261030103418.2355854-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033430_744711_C57CD30A 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Voltorb and Squirtle, the MT6319 buck1 regulator supplying the big
CPU cluster is missing the regulator-ramp-delay property. Without the
slew rate specified, voltage increases may not have settled before
switching the big CPU cluster to higher operating points, risking
undervoltage crashes.

Firmware configures the MT6319 slew rate on these designs to 6250 uV/us,
with the value provided by MediaTek. Add regulator-ramp-delay = <6250>
to mt6319_buck1.

Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index 0250b4eeadd4..2ec343f49da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -84,6 +84,7 @@ mt6319_buck1: vbuck1 {
 					regulator-min-microvolt = <600000>;
 					regulator-max-microvolt = <1193750>;
 					regulator-enable-ramp-delay = <256>;
+					regulator-ramp-delay = <6250>;
 					regulator-allowed-modes = <0 1 2>;
 					regulator-always-on;
 			};
-- 
2.56.0.317.g454f8302e1-goog


