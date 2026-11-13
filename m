Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B887606A8A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xGO/fRsD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLWqasWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=; b=xGO/fRsDxPzM0C
	FW+fcH7dWbGnUAOxPu+y5CwnE19Nz4DTUGz6HpE/kZ4mKrRbd0QyQofCwkO7gdK5a425RWtApU8r5
	/3j5srOZNxN3763oLjjat+fyPpK7dGY+IwH+5nSzhj65zgJzDdcWcccyYa/BVkigcY0w9673yla1H
	YztVfFxx+SGCl+t31PcdkokfPrjYFxOvibNJYkXQudRVV6tHFXaRXcia9PrOobE5uI18JZjGCA47O
	G/I5jPURl1GYjAVrm6zZQeqgZvMSfFjHXousekukWjbddYpqMmjwQhsnGyhv1PWsmWPCVz6fRNSvt
	evm4lRQL6GRcmvwthmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwct-0000000E5fp-19D5;
	Fri, 13 Nov 2026 19:07:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcn-0000000E5Y6-15D2
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c4d58c50743so237587766b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596868; x=1795201668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=DLWqasWoQ43GzpzqjujzLLCBibhO1BPE60kZbFVB/Omw+3AGt1xnU9Lz1TCKHfJl76
         +PpyeFwnPiu64n/O5stW8Hj9HjEYDciUWneE55Lbl5CFGtOLyuJx2wi8rsIt8y3q3deI
         G5KWhIb89mo/ZeH0388+uMnyngePSonCefqkqQPMPAQuwadjfKqpsM5jcW2H5/WkX7AI
         Oti7Mvu79Cm3H3YgcvsZBwE75LBFxiPTFbeHmgyDPUz0blEPfuViIPHrgOOE6l8rGcgZ
         PBJT/tFkW+fWl5p/o6x1WrDrfIjTdkXroVlBSPRvnnoxakv1ruGkhlGKGsZN2c1W8oxW
         VU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596868; x=1795201668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=oB4YOKBs7+iQ8DniBpw/gJaTo9135BZF6lVFm1snsvnDDLkAG8NWdDND+L+wsE7l8j
         lNRRGihgwgDQRr2O+ewnpD43IsavSecSUmdiAiC8ArAzFwOurRER68RpzXctTsmZR03P
         qcTbqR4d8odMXP3r3lipLO/KoxhLPFymYc61Jjqwc1NA0KMIO2cHgfVJhM4jWpTfc7QN
         AGN32lqGS9qe1BsQhy69L8Y5PnOIaURE0HHJkiwRxrrSqq3vRndgCdK31BRmhNblfDS7
         whi5wnbhHo5wM0AZy2jYxfLTThwQev31Er1t61MLmDBcSGy6W8mwrWv4VrciqldecQOv
         N/hg==
X-Forwarded-Encrypted: i=1; AL+hErFfePLhs27qO4xbUql/DlX7jhIrCY8vmO2ICrEDaZTBHWke/l8vVn5oL38cn2A9fRwOjXVo1G3B3HwIPUcGsA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/8mpMmbsyVnIRQvN99o22L64/vj07k1WB029I5jO2MP3zBVRif
	dlE4qJ7gTZe32hO6MKKs8MSMOdk4xBPg4sIZcx8WdmvA4k+yqcUKPopG
X-Gm-Gg: AYBFou3ad1MaID8DyNacCVuXWJe8Ge1eCZJdtz1LAZgh+46ap6uQtiL8lWAO208WpLC
	TOx0vBDnJFaKQcIDa7b/amEXI51wygDGTZcU8RrYx3PYf1E9bupBLUxsdSPL5koPovc2TbFOXB7
	ilPt4PdV4iqPCk1+7esPnOoLnUlU8mE081XCCfvjW8SzOPBIl2vqjimxY22KGM+3TLJITobm7y2
	03Bo3vmdlAAPnHhy6uU73GnPawmwPCGxs8YbuA7kPxlS+bluhZ/qLdG0jnk2WdE7BSHgDqEB6yG
	4yut73euBiSUjybrj8XIob65tSfbOCKTjhfy2k0Wdnfh9ASPnGsp2PLU0l89idssNIY8XouRNxE
	wNJ5SksUTY0w+wYvomvJr6KhlqilmNplgm9MgtoLD+DtOYndD70Ly2ubgog2LBNndl1G5rc2Fm/
	ulYicRY6nSYkJoOjt6k2vsLYHgbxJiyGvNMBhbuBoITus1klaMN0hySYvy1GesfM/t8WeN8Ijy8
	2tsU+EcllRJlo4634HS39wNzztLRQcMGxYZQ29KXq+KlJM1iMX7FN4lNClF33iRJOClMaoX+gaV
	z/R3EtosUQ+5G+LZOVlfuvy9C4/AbNcJLEaQV1Ytg7lN48Uad9H5K/i67DRLEDp3
X-Received: by 2002:a17:907:2d8a:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c509683f389mr411823466b.44.1794596867571;
        Fri, 13 Nov 2026 11:07:47 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:58 +0300
Subject: [PATCH v2 2/9] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-2-4ab0aa9fa391@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110749_325857_A0415CC6 
X-CRM114-Status: UNSURE (   9.75  )
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


