Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1F606A886
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTYvuu7G;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BmGGsHMf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=; b=QTYvuu7GXqveZR
	bvolXWY511Of9ud1gqIBdrQqY6244KgqN/9xuEm0q5ThTsDkiTNH77l0TC2/WaozZPreOGPKxF7jz
	dpt3NTa/JCLUoWbp+XQzo4rOiBe9otPwmkhFZ8p6lXGn/FWK2dS0XLP2hpr2WInUjbT6I50H8i8Im
	o25nGnfKm2Jpy6n0PHWKrOgXCejpx0njgcvvzADCF8WFrfY3SoCga8hoZrdVXPZ9g2coYOXkjqYSh
	ev8I4rGhGFH1IwlzJkDsC8EjhImlBwA+9JUss2epyhLYxJwMXH1IeCx4yFpw6C9W+GsLrzTR8vF/M
	JxDvdvlGvJ38apvNLzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf6-00000006pzr-3a7f;
	Tue, 17 Nov 2026 19:16:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf3-00000006pw5-3LPq
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1564055e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942968; x=1795547768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=BmGGsHMfOMgXixDsVDXAE9VO7IBDcI3itMU9aMOyc+5GvB4VpKJ1enyGORjCH6Ayny
         2cTj9fguScsBKYsG5Gz5Xsi8qX7i2mhebfgCIVevyI753VsS5/fvpeGjomc6tPJYYI5A
         xpBHIUHLsUxmqEWOLa1hxao5dHrVdWjpfE9rg0JhFPIoG0qjDKHyMsfiqlfugF1/EQJ7
         gxaKVKiaBsSCgn2S5FDJM1pUrOSnnkwOIHM1tUe6eRQ1cXwK2ATwtFjMplmZZ7Xsao3M
         x04pg2SMD8etueQR//uHUBKM6ql4xDbCeN0m4gWzcXzkzLqGkK0p00CXykdrtFyh+5md
         9PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942968; x=1795547768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=U8CTguEO0UnUWTnoaRBKIEwL4xGfThuPBEqFYjJp3ynnjWIvSaaf5ExTRU3XL1wnm0
         T+KG5L/Qxvq5yL080g2ysiZHu4BgX3rw/yx9IONPkOxzS0pPhdeAx1y2lCDGS54aPWSt
         ALEqmKO+23x6aH+zZeJRaqKAovvWNA4dht7EmFHliM3aL0gVPI1EW57I1X+HfadrUtYp
         O6gqISJSOXnaa5EPt7oBzsy1NzN9zjvZgTMNWWnMSnVJ+z5WwxZcqEM3SabCsECE5E2c
         Wgslx1Zl5GQas7Nf8LIyb1OCj080bTsYXQ+4pg9uj1l5jhjIUvQynJGoPVdjANuu6QsO
         ZGzA==
X-Forwarded-Encrypted: i=1; AL+hErFnxRaxNf8zfrrgaXvjGaDJ7eXjTOtmrtbMA5aqMxvWYVrlGWXquzg+HjF49jp+RfLnO0Hea+Qt7kzPIo0PsQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9G+paSarVaDx7PXpMLae5VAJJbNwJKEd0BtcKXrtdVVFzgiXLz
	avoqLmHkvChpxp1kIgpeY6RuXevg+y23Fn64oDdb5T+9ZbwVUoXZTsyO0wDrmhqv6OY=
X-Gm-Gg: AYBFou1n/gINPCQxXk42Woq17GAfi1AflrChCLGTalMl5ZH5ep5hXfFyvKtuYiK75ps
	MsmCcLs69gXT1olPSfPsafqJIHeL1eFXEMKq+Ke1h+o6RO8p1F6DUqpUeo2xIW942eEarm3O1c1
	9KzgiNT/eya4uFMoPjaYZ2X+qffFBOSYn6yu53YU6p8x1CA4TzQCJ0MjXhZnREMWGgSGLv5GSRk
	8uuNOHzIdOfqM724d1GU94MbjDs6FlRuINUbLu9NDv2G54sczDwW01VT2dklh9cOKPIzkUde0HV
	mDsar1ngb2TDcAtp4hMGRQ4uv/39EWPdBBDGcCEzlub+9BYZnOQTvoyandShOpb/JbZOnDzdIGO
	6PQfGFNHUpoT/3ew6Hnc+PiKuNglVrSuHn5J1kKGJ9dWZyZut/4zFw3/nE95qgadUhsrvq17eE2
	elKKvR1WLLsIeCN80m7ymRL1b9hfd5/9SvdDJiatZlfCgS4G5aOtk/p/6pS5GRRmhN8/QE1Z8hZ
	rTKNSsk5w9BhHSblTFTqT2EjtDkFzQQylBohVQgPey41UPp5O7blpsACE8SSxYeyyzzY30pqUN+
	G8xtagL50HCqYk7VoLNzdDapWc2NkU3YqNShZlKcogWQ2ps6O4v26rjnJmNWtnNRsxSpeUNMw98
	qzA==
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr3616445e9.4.1794942968020;
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:02 +0000
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111609_857508_F8312FE5 
X-CRM114-Status: GOOD (  10.35  )
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

From: Chris Chen <chris-qj.chen@mediatek.com>

Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
clock driver can register them and devicetrees can select a PWM clock
source with assigned-clock-parents.

Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mediatek,mt8196-clock.h b/include/dt-bindings/clock/mediatek,mt8196-clock.h
index ae0946ab7621..a8008fbf1713 100644
--- a/include/dt-bindings/clock/mediatek,mt8196-clock.h
+++ b/include/dt-bindings/clock/mediatek,mt8196-clock.h
@@ -290,6 +290,11 @@
 #define CLK_PERI_AO_FLASHIF_DRAM			31
 #define CLK_PERI_AO_FLASHIF_AXI				32
 #define CLK_PERI_AO_FLASHIF_BCLK			33
+#define CLK_PERI_AO_PWM_X16W_BCLK_SEL			34
+#define CLK_PERI_AO_PWM_PWM_BCLK0_SEL			35
+#define CLK_PERI_AO_PWM_PWM_BCLK1_SEL			36
+#define CLK_PERI_AO_PWM_PWM_BCLK2_SEL			37
+#define CLK_PERI_AO_PWM_PWM_BCLK3_SEL			38
 
 /* UFSCFG_AO */
 #define CLK_UFSAO_UNIPRO_TX_SYM				0

-- 
2.43.0


