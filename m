Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801460A3830
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZfL0eum;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQysNWT0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=; b=EZfL0eum88lFNi
	+zBkFs36TrwPrwvnQv5or6qUKMqpsHFMHiuQSCOzzEB1QLOdzM4CJntt3qlJ4E6tD0xQv3czE4t4z
	Xvkv+MK++DV9UgqRDE4WJXMSUYcPG7JhGDyi1llrpw8h3Qg5nIKVwAnBY42RwK1h98GMq3/v44D9u
	+hWlJsGv/LclPBNsqx0E1JimZgNUat/EwSouwkR3svRMxst8Ma7sRyxL1bDXRL6WigzBCcXnG4qRQ
	vKaBmH1mfoxhiXfhcH9wXJjB+r/e+BPOya+jv1gonyz1Aj8e1KCh+2dojuowz7X9Iu0FJFfDcTNFz
	sSAG0snCbVm4JxCH3Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd3-0000000E5sG-0WH7;
	Fri, 13 Nov 2026 19:08:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcy-0000000E5jR-0t4G
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c45551fa84eso342008966b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596878; x=1795201678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=YQysNWT0xUbUYoQrgF+w/5j8kPP2dLBOLEJSE7xHIryjLPOLBy7BX23aXXxBj2JEM0
         0upjRUiH1WvxvI1HiB2mxTtsAq9CAoMZ9ToMN7C6FyNxRDzXaCjX873Mw9074jZapCzG
         hQTkZ6rFOiMK4yaqW1scu1ZgiyeZVVFSPVBmBiXalO8BpHK9iK++3BSlJUsJ7WdwcmeC
         O27uc2d+jD6j3V6oNUsbUPhdR/pYSwgnv5s32tT28REvvJvVpjwOO3TnhrkgHTjDC8SJ
         lwg0eY73y+eY2PvB5cvCNsDH4W1AvhbyqKsIc3+2lLbudwBjThDxjOXXOLZFdDTOupwc
         c4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596878; x=1795201678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=rFJtdtSdwbz5A7itSa/7u6Wxo35uVtooXJhAbEtj4wQAMp+VnIIvb7K4cfNsM5lSwS
         c/nTLqn2zoCXV9RJuyPCPhtN/qj2/M/6DrKuM+5hpCYPcOD+OO0mOCF+UjcUA8l2IyyW
         N5XnyWfYWH/EcM1VhA8nG/zsva+rTMiyyUTz/GRVjBl0PIVDw2iSNl8jpdqIdqVA+3iX
         ebENP4LP74tNkwN7tvIlFo3qvErFDDsLIWFj9spaklEFCcgI79IByA3jsZqm2DwxDIqx
         SMWBZUwghT85yt7RZPaqeuhY0/XfrjudLNLvn2LPBho2sl8kt9dodAbwe4ZnJVdavt9j
         Va0g==
X-Forwarded-Encrypted: i=1; AL+hErEc8ES69b5iq5Tm8qJmnpDZFHErrXOHfa3WovTqSAHrH7S6S+3G4whQccAmPpYY2lDUO06yy7V+Km3GiCytAQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+SPTpQh/OLwCH4f1kd0+sNsDVeLbegukYrsdeg6Vn+i1OZ/d7r
	WqS6029gHE/10P2mHyl43KD3XvTmzpJuE1MuO/SK7suDGqvM7uZEMYmM
X-Gm-Gg: AYBFou0SXCtPGWjjzSlrMiG97hmIFthtudoYX0hOoCxBHS/JkS3uXbIp5XDcDbsnSQJ
	TNYE3wn8eo8O6rjacVYidGCfWr/q2ETqIL2OSc0d51jYTeys4mVNGjL3zSwKFy0Vr0aipstbnJQ
	LBrIVjYFRDDVW0jx1iNuDG/pzErvp19HrQAevhyD1HLFr51hwDsgX/wJfP5GhVV0VS5SWVKPvRB
	KTsvkykbFWTF/majL195CX+L4KhxiRrnqo4fprSzSw9NaP8l/b7OBOpzNu9Tyw8hTraoXjHuB69
	oCI0fVBvEfcssVe3KDZEr1jbQKZOv4HwID8r5t6+tZ5ItuYcsHpRW1vee3EJ7qZOx2PdppBoc/d
	qjCi+W8QijOMiqkduez8xvPF+PVrkqD83Ba55Af9Qn3O6FtdGmcudhlAQKrJVxcuy002NQF/Q5O
	3AS4pg8zij09WDuMqFeUD2RVrlLh3BvRFInc3qSb72eT+OXrRqAzpHVyABC+5N1TGDqxfDbJkRW
	VhyuIyO20PEj6C13A1VORJEqw1eOPaphIcV0WB9Y6nLydbnXqJtkc7RHaaWdZNMPUAPt6P+xfEb
	jO4nQna58AHEG0ZHMz71PahpxnY4/ZzFn5CxxoFZgNoY5NO6+Ex7U+RcZo/fpviH
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id a640c23a62f3a-c5096398047mr303416966b.11.1794596878270;
        Fri, 13 Nov 2026 11:07:58 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:02 +0300
Subject: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_110801_054330_DAA9BCFB 
X-CRM114-Status: GOOD (  10.21  )
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

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0


