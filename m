Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E68606A8B8
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jsNYp7TF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcwWN+wM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=; b=jsNYp7TFWpfrFS
	Pe4+xOSxIt+q8PCClVfoHJxphfMRhAMj/Cw1SgEIE1iv88FjXryefwPn858zU1P71iagWJsfuRYsG
	iEqjly5zTLDZjD178IHhGDThDt8b6tEvXvP79iOVlXPJYfCvVS3VYY7bbI+BOVI3SDnMtdIxGSuSF
	/KGlRARKdVWxGH5efpjcYiAjPctWAULwyV4/Am0rNzHk9vxb0qnlL/NJ/TzVCweZ5PqmVO71mqWZR
	n/GRzYc93Iqx5vJzjuCxb4TSTicBwT0SUlqdjmjpa4vyx5HwlyrkxqPhdSSGYEKFiH2I1ko/wSbFP
	RYaLV4jVPseBEooE4PPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd1-0000000E5og-1Uf4;
	Fri, 13 Nov 2026 19:08:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwct-0000000E5dX-0RmE
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c50aaad19fbso62960066b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596873; x=1795201673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=GcwWN+wMJ+4olOq7CX7RZpp2Gp1dsUE1iR1sJlKzo/oTf8MG1lizdAlvjat7eDhYre
         kTLcTFgyYJ4XqrZrnw+WX7vouyvrFXNXszMCc0M9hI53jclittz3K5mDxVK9Ws7n5ggO
         HqwhR06TWahdXEBTd6QD7BQZ+TCAIH9DVB1nfoKpYspFebbESJCuwVJwjLoqIn+gDQCb
         SrV+SBiS+ybGPPqp5+r+kJE86RhaX+Ukt5R8c6GtvutGblp6LcuYmZsDs1h2homw8ToL
         VR+uCv6pa2k2FgkjeuYzBjFDZmfrnZNvlk+yTXdbPQ5SBeK2I6blYloNGqNpz8ODjeHa
         bV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596873; x=1795201673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=qo8Ax5lDXx5LLeNb/oL/WNyeFV5EQv2pAaF0oege/vZYQFCqOONeOWAvMHQZAd0k7t
         UDxe1AScgUjQamtZh+zmUFAtj6Pqf/kvT34ZtVpgB24ZlR+Dwf2Nyw0pvqHqqwKU0fvk
         1Qp4qp3jSRSA8Cu3d/V0uctC6OpbDo3yyoaFf8m6ohlkoUzPSMvQeP5cLd+Yef0n3fc1
         Olsl/zeWQHJdDkyUR1G8jWmLTB5vsvCPOFsQMMs++2xvlW4/Pi8UKgLJWC/WAASDhuyk
         szgeItfvaUeTlwwzHzaWLF3TuTbwQYBUVNY5XlTCvgdgEQN8VW6zzg0scilCFfc089B/
         9owg==
X-Forwarded-Encrypted: i=1; AL+hErGeY+njOkZ+8yDv5h/ABAKMxptQfdgl7rwzsyMqC2uiJRfREPbebupb0NjvT5EJwM31Dyd/JKG+pC0nETK5XQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z94O9cNLkp2ed/ykj/XD/i6qlmFID0cPCG9svlJUqEOqg5+UL/L
	EMMvh6tzzbGcC9Rbk4u35p5avpyajEg5jgVtL+SVBF2ogMhtARvxF6CQ
X-Gm-Gg: AYBFou2xY0gBeKGfaBm9lR/S7n5+V3yjwpHAD0CQNCNenfUSZUqGxVUTSsAhDr9d0rr
	81g4xY+8inaim4ZO+PKLObCRjbtqvmvu2MyErlsGbETtS8U+pMRahiUcUok0QxDwsZ3GInAOf62
	i2ZdnNiM5RBR6BO2/YDsK7VR9ISZ/1tZ41fEwzv0+jC8CF8r6LSF2WNdjCTVFYZ/3vUOmqBREp9
	S0s/kJdgsSTNwLhSYRO6PoRm2hwBg+XrZ52Z82uGeIClNKfFtnIGCxnl2P9knZu2g8XnfR7wHU0
	WMJYdA7ZwdmGGiJNfC071yjU7585McJ8OE5oBBVOae7vIgqQ/NnVI1UejvB4ipOKYe9Hq00bcZI
	n3E1CQPGGvliW35AyYpa8t2OTBMws8EphZj1PN4J+fq4tAgp23/5HS4VSuXbLF4C/GGfQvgLJBT
	ydj3fzNHwsr+HUtojXe2IIq3EkNm/nQgIu881x4ajR80EnX97AhRqKlC10HRgSa9bJRjwvUZVBm
	ZzHmSlwkiaqUIUXpOh1ffF48p1jFuQQdpV0zF2NK3RRWSoiNpEXZYiIPORHzJADfFsGKwAQsVBG
	/OsytsqkYmEP4T5H3X1gh9zkfbTvZ/VY0lAZYJ1GU+d8pJr5nUEtboOS+dTpwm3EEA==
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr297220766b.11.1794596872956;
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:00 +0300
Subject: [PATCH v2 4/9] watchdog: mediatek: Add support for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110755_203468_61A50EE1 
X-CRM114-Status: GOOD (  12.37  )
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

Add the compatible for the watchdog of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its watchdog registers are the same as on the other
supported SoCs.

The TOPRGU reset layout of MT6895 is not known yet, so the entry has no
match data and no reset controller is registered.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a210fe1569e4..d8755979021b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -607,6 +607,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6895-wdt" },
 	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },

-- 
2.56.0


