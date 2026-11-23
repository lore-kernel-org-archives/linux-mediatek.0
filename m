Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F1606A682
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=00x7kGBk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNBNIjjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=; b=00x7kGBkMZLzHM
	eTw4+uniAakV76BFpyO1R/xSN5Tk/R6aAqjE3t6kxkzE3sihzQqO6VQEJKiTIKK6SFu/JpUFanHSg
	aLkgj+YE+2QQDju9tFFWWCMnNHySrgWvaBzKGEHbaVoQ5LoaIFIOdrwT6Hi/vBegZhaXtqyz5K2H1
	bGlJyVFT2H/+MpIr6JMKPHHhQJ11XrXOcz/uvJdY+fBt9Qipoz617isi8rmgVkI4wcGS9naqSzt2K
	0pRByqE7exsLxzTJg7EymddaHLmLO15jVvx8i8+ERNFeLijC6OY0fQcOTFb0HaxhnIBwy59DfxaaN
	Cli9sBAMHm0PA4V2ZUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4r-000000036tg-1KhB;
	Mon, 23 Nov 2026 11:19:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4f-000000036fZ-3FHD
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c515369b627so266676666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432744; x=1796037544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=hNBNIjjHDf1h9uz7FssokQkBwIb0cYfapK9y7DE9WWqVMyNX/UfHRFp0fG4/hgValf
         o6NL7H3oVCQCnDrshtCfnd+0Pfp6gp8V6ueMXFrea8ygNUDcKxfrLBhz2KlupWEmuAGL
         FyY79TGGGpZZG7Po+4N6yV324hp9M6rv+epdOQkeyKNgtFEtKFKJTOzGLCh5H5qChxN2
         2uU8j9IriPuxIEuqMi3C70mRd3kwYpjWxbY/j8BZkwfE2L+p6+GiWtt5dBPW8TLkxoM8
         UxKFi6F6f0aDzSBog1yW1SRrD6jckc74XmAh6s3RtFDbNGcKobsl5N6d2eesliAwf/y6
         FinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=dC8T6lzRPY+XKAbiouR74Z7h4zShn3MOda7oDieyrnZaToTwxHc9i6ubTZKoG7ViQ2
         tBZdX7GiJsFNJRF6ynm6h7q5wMNJFIAWwcKZmqxyqymhEaTnqcP9Eyg5jXF089oIWJ5v
         USzhZr0YSCqq6mr4MVyLlberAWcKi91BubkIHb/d5kSX81CPtXeS/n9livHlainAehLW
         v3hLvLv7iS8dzdQmbod/b1cn/Pm9nROLWt/DUBcvHMSsmsIWlZE0se5dwAEUHwnVItqr
         pvRzn92J83kurvaiqHMkjr63jBU2rjowAdbdW/z8d8cvIelHQvzGBe0fzHri3RgvhGxx
         +6NA==
X-Forwarded-Encrypted: i=1; AL+hErFidy57SHS6xm3tOspiIjLGKEI2UEqRtgZ2US23Y/6rCLvrY7Nr2tdP1Ka1FZVDe77qRcjvPwPAi4CF+JvQgQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+XP2lD3OgK5F0GGfdU2UVI09JunFNGyiN3ADmWTT/BnpGWRxad
	/p1Rgirihw0MZcG0CbEKwdGdcHUjC8q+64DXfCU4tm4cwXUWXYsOeQzz
X-Gm-Gg: AZFdTZfKRPjiF1mLzFAXSctmCzRNxOTESqatpm+l0+gja4o5M93LPtlBqpigGErIk0d
	ktsQ9eef69/k5lSRb5FrUXqlN0ysgfBIBTpA7wL/4ZkKekWOuYnRtJ4GHtO3SvCPOhHBgs8G91s
	3a63S0u0GXN/dCq6aLaywvA/Wje6LxBd+U8BYBPA0ORNGfEP397l/ozFSqjTj1LTu2Upzbw5xvg
	7+rU5KHVzSZfifD2of4sRUlD7OqDtTxb0kjhlQ4JlbvrN0+zJnJeir55s2MMlRMlwgv9coLFt7p
	sQ2mZJXkXUUIacuFiYk5FBn7K3BX5obIJPU97QngyV3M+xhMJ5HoNyzvfGgmTH+zfg4rk9P/XQq
	Lvshon+flClv0za7EoACk1OgAFnFjEGXk8JiFaOLVyZp2ninQ+jCjP3G+mHNPzwF5MGYXripgrA
	ErRZXxNCO15m6epc7YgY+YreiIpwvhT5ZQoqXMVa+jskn9v9cZiKIc3gH38c2ecuH3t/SMVBErx
	qBOU3MxtksZUMZbXEiNl/cSRxlJiP8V2GYwrMBECO/mpoDH8tM10oqUgSVZifaY1wk/E+/gn4yi
	mMc0R9Q3Xej9NNgQkBXQso9PGELiERCRcgLwZYIHQMUklQfce29wSoo6duErpfn0ZA==
X-Received: by 2002:a17:907:948e:b0:c51:3b09:f7f8 with SMTP id a640c23a62f3a-c513b09f8eamr826376566b.25.1795432744060;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:35 +0300
Subject: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031905_907326_27E9A17A 
X-CRM114-Status: UNSURE (   9.60  )
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

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0


