Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A256CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=; b=dKSruveml3BBk5r118f9REEtOv
	WgN4zFIlxdIqRC7/1Jg9h3ufXnaA+fbxzCFQ20eQsvAdxr5p/pEdtxpYwsapQxl2hc6V3XiKTWcx7
	3njVu7IvjjPmkQ+YIsrBZvnXp7Yy10i5re67JJOgdcjEBAOnCWYE0FxazoGCD7AuBWhGzYJLoUeIA
	JaTXsi/ysfi2Zv3FbakRVBx8R7Q7icJhPR5Q/zjwJKEsj6tnNCx5J4HMHCrW3HWABJ6oe3k+mPOCe
	o+GwBTQxsoV6Ih/QqKCBBjsfk95m9hgD65Z1rInWYJsmmMYF3youzxlEs2Rh0YvcVX+vtD+/m9Lz7
	tJNNMpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNk-00000002OXY-1AfF;
	Mon, 29 Sep 2025 11:49:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNh-00000002OWm-3ezE
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e542196c7so3933275e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146564; x=1759751364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=;
        b=Kk7MFgu8k2StpCyOusIzV0DFOWL1uNK+3X1uKZH8HX/ob++gjrnet+fLCETxt/r4Yf
         YJ4v8vQyn47wuUDaR1GotW9OvhXF1sV+kXm0UenJIz+dOpejLRrEdtZuqn7adYOUS/St
         7w6oMAaawU2Uh2ucQb2RXa0cJU+jtJriUBC/j8Pi5Bf5TGilub16tC7mhXVu8Cc6+s8G
         psfJkxjlbyvotx6NAZ0+LUQRLJJUpdhF01cm+Kwj/YPZTR8MBhdclFlDDOdp5ubTf09t
         OKpi6v33nUU6NXyNANcIawXzKu+MfTCKUl7Nue3Fd7RSbtbY3m3xQPkUwznplPXnuCLS
         qNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146564; x=1759751364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=;
        b=jAsFo6GyCYZ1ClHssu9xWxIrrFuZmbODkNdYkbnayPKbBglNcZofy9fIZJP2QrLdc8
         /ODguF3Evmw1HQWMxl+OEHF1ov9GOnV/fOGBruA6AZjSzu6E1a/xKgNnHjihXVzSy99s
         dgsn+J/DXCiJ2/KxY03owK7lTKzO1LTKVjugWiaNyJG85RsBKqEpqg97AFKMV1YkpbfT
         WmnEDCxVdf2gDmwe2kb+aU7BpjP1Y8m7FGlb6eaAyur0oKNYIl3JWIVzttc/F3wmZXlk
         pE7/zBiLhid/J/FOys+3uqzbrT//zOqGc4flu2Jdrjd7jpXIucDxSv36bOu7Pcs+p0A4
         Dy8g==
X-Forwarded-Encrypted: i=1; AJvYcCVcteEQgTYb5bpMkg8olI6N+ZVW8LwVzcskw2vnhHVVQZ9hY3G3nwrfFbC69+HayXymeUdsrM2JKAdLqx+wvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9LAzFwnL/LM/9z+r7/j4D2DZitpwDnU+JiL/Kyd3iINZwjt2D
	SQdGttmLmEXlp+lmIPnXr2N4oOQOIaUfomoIrx6wWzipOR7IDsYOwXpB
X-Gm-Gg: ASbGncukGjFFu9qbEtM0DpB3F894O7I4gHQLYNMpIECQpB18zExEkxQZjK5r4kAK8oj
	TjxUUkBJXCdzaldo0QxCPqd705aJplRBZeEJITcLl3/uQGIR1u9wI5H8/90KaMe8F3IxJf+cMQ5
	6cM7v7g063r6Kc6DXTMbluuPl+8Icy4+HBDBzqLajbVTzYmhoAm5xUYNMyHuloICKeKuGe/Ya+G
	b9Cvf/4OrtRj73d8q4SOsg9dPbM+Pn7CJNY5navSjEfauM5+AKTMPTdsFsX2Y6iAE8ZvjAzC8wN
	ZQ/zjfWQpcW+8+J99TItPal2cZVCkM7nfhvOacKeHWHELyk/hfU57TDhK+Q1H49M9FCXUa3r2Ap
	SbnaKVtitE6Ng2JjmixnfB6K3qxYfbB18EqR7ocrLvHIjBwupJBScWP+76nP31LdCprjhKrQ=
X-Google-Smtp-Source: AGHT+IHWIIGjN6nhJ28ac9trCVEFZnQxU7WiTxI9XitTonZzPwwSA3UglkJvouFg2U2iPv1aIzbnYw==
X-Received: by 2002:a05:600c:4e46:b0:45d:dbf0:4831 with SMTP id 5b1f17b1804b1-46e58a02073mr3602305e9.0.1759146563815;
        Mon, 29 Sep 2025 04:49:23 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/4] arm64: Add AN7583 DTSI
Date: Mon, 29 Sep 2025 13:49:11 +0200
Message-ID: <20250929114917.5501-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044925_923578_154C51DF 
X-CRM114-Status: GOOD (  10.99  )
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

Simple series to add initial AN7583 DTSI. More node will be
included as they will be supported.

Changes v4:
- Add review tag
- Fix alphabetical order in Makefile
- Move PSCI node after CPU node
Changes v3:
- Fix typo EN7583 -> AN7583
- Add specific compatible for watchdog and crypto engine
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

Christian Marangi (4):
  dt-bindings: crypto: Add support for Airoha AN7583 SoC
  dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
  dt-bindings: arm64: dts: airoha: Add AN7583 compatible
  arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
 .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
 6 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

-- 
2.51.0


