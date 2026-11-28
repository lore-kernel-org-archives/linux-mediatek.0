Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB09606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3eJWTnjV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNrEqCEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=; b=3eJWTnjVECA0Ih
	qDZvCff1xiYLhWrMCb9763USGm0WmYuOxZrTjdp8u+45MA2r/XEvo+rwhECF4w0J+tg8GI14gm13X
	0zEjdy4mmfjmzbmRkK0LeqN+Bq+gWt5huSGIVCBkNCZupJakg51tyi0JPKeaGaL8SfW6FqUwHG5AS
	zOa1jgacd7ZUyyOl/ZJ/gy/wGhmMNTxu3YsxJ3UDEAzBvsEcbh5iFbZkC28TNMm0b+khQhiwOnOIb
	8GIv6+sIj2o04tnZAqTnem8Oy+AkRTSRzNVkhkjLkWlM+zKU/FYbQODSdtLCgR5FDqgCLzZfz/MQJ
	iy8ew+gmFF2MmI35G3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCp-00000000p4V-3SdA;
	Sat, 28 Nov 2026 14:15:11 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCk-00000000p2w-3CKR
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:09 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-386bd881d39so145313eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875306; x=1796480106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=LNrEqCEB02LmDiyZtVwhrVkr7/ruCW6LNne7njMLyMw6TXr87LfU+9bVav3atmJiXo
         NcM7bWRVPtuIw28l2bevrSTjr27na8Dygx8ozwJgOwMlPiEv8EmTkM5LMCn7srhuX17O
         2/B2UzGn0EYcyAEps5MpPed/nUE3YJvg2bEOVhFUZM7Zfo2+XR7Ofl8ouEDe73Q1tS0E
         lRRQaJcjvwOug5lrW75r0UcJzgrZgu2Kk33RHtMLUPJ77y8Ief+zSG8Nlz9glJo6smVB
         EEcDUFPYtNLh3qRD7jfgMG399tTzT6pGNny07P8rrDtg032mXALC1qBW4zBLB5ksFVav
         jeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875306; x=1796480106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=dlm01nl3NINDad+rvhIEEgyY8rwltMRX8sbxnxUX5yJFhYqfuzjsgUHKX9sTcLp1NU
         yu4oowS44ENjh4BIo/5tI2Lo0RV5PnpzMKG6445XCJEhMWy1cHYm11mOo2eP1P9a9AHE
         AvkmCvo1KWyNOaLxm64IuoUqawcKvvkhFvfRT05k6jHxe+L/Qr/XBpv01EVVSxNaj1dA
         mngKDYpkNsjxp2SMDWDyS2oSx7EBWiYOTPaI3hr9dfj4npHsrvfBomGHs8M9ZuAW0U0W
         oTXrywQKvkg49ZoOvllOGwzN4YCHlnPkPHSvLfdkUm2ApXcu5z+Thuwg/5/p6hQsLtfX
         EMBw==
X-Forwarded-Encrypted: i=1; AL+hErFPWvF/BWyvxU7/WNZhZmw23DMv5/jnUuLv7OyiIKdM8Nv3j2kp7gN6e7roUpnkKJdu4vxNgrqJHXjKgix7Ag==@lists.infradead.org
X-Gm-Message-State: APuU4Z8E4sJCBoY1aVwkmO6rffHR6K+bXyYRgzelVnTsgHe4w+HonZMN
	nZTY2Fw2b4bO4geR2OVXNtH8IG2aYMDc6Xw5AS3HAtzJjuyNzqfBKIVp
X-Gm-Gg: AZFdTZfntMTB229v96PybCVo8B+DgSyCmKKEF3csKX7zgz0L8UmRA6zevQfEr/wQ/y/
	psoysgsPNJCQ3hDFzDiMXBgoFSs+3VxFgVMCs5ukGDUqWX23XopmxV6rCq8lQlvQvsJzLFHgzou
	zFLeKjEPTUPm5AgVHa4x5XNSDAuQDcYKjRHQx1iZenTFc3IPGUv7Z7+0tSfyrtXfqkyluehINeH
	pslTMnifoMPbPVDCbKSUUlCnYWDWIExb5grAZ5iszQtukiNTXbf4337rAJQxaAKPcTIP84BXGLX
	DAZnMREUd5Ucw9wckHbgZDvcmvbbB8k3t/tvjdWZ9KLc7EYIL7bfqRz3ra3BcHDXcKPaESEKudz
	iLPyDhuGTzSB97OOWd1wBQXdIUJJkEwawxafHrvnpk8Y8WaDbum8wG79JI9R2LhExRb5cT24sKD
	CEy2fTroretSkCm/dQJ/zMdLdMiie+9i67UrH3S6hFErG0VJe9Kdq2OOA2LK/FcS359pJ8UMG10
	E+TVEgahBkV/2EvvG3ChpVVZphWdS39Td/9vD+jqznPZ2/xPTN+/IPtkbtcMib1RUf/rCGcweR/
	gZ51M7PtRXbB/m0yrN5tP8NG4kZPYMpQo5H/a7gvl2Jx7ExFwFtp0Z6OpamF2045Cr/BRYFn+Q2
	FjrlORBpd4WkuS8GTEV12LMFAgRc/
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr24469794eec.7.1795875305781;
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 1/6] dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 19:44:25 +0530
Message-ID: <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061507_471746_6032B3B5 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SPI controllers on MT8189 use the same IPM design as MT6991, so add
the MT8189 compatible with mediatek,mt6991-spi as the fallback, the same
way MT8196 does.

The vendor driver's MT8189 data differs from MT6991 only in not setting
must_tx. That makes no difference here, the driver then just supplies a
dummy TX buffer for RX-only transfers.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:
-- 
2.46.0


