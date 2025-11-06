Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B672CCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=; b=QEddlAR6FqVsNy/Wws3hcsrv92
	sKjlwnyNGjatHZtENwQyHz0ZqffyfUWP+h55zg5Jhes8Q33BsKdzciPU8dbQUvJ8R5fi8mz2rbqHr
	7KoMmO1fHPtkEA7ctJlTDrDbqSOF34LbKDkZcPtyxOJXlqwEAuizPJjqb6ptui0RKYRvdYb74/qsz
	ZXIu8QCm5E1vtleS4bXpjXJOXe45dIuLeCOTqjA49UO1bkmVZI67C9aA2begRGg9cnIwAVesInaVv
	erIrU116yng+8v6ULfBYnci5kYRgSKiRSY3RmO16/U7gs0CNUzkodDqQmJ50SHF+/3mK38D4y9D1F
	xsfWPZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9r2-0000000GQ7N-1NdX;
	Thu, 06 Nov 2025 23:57:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9qz-0000000GQ5v-2xnd
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:57:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so756565e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473439; x=1763078239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=W/fivJq6BTP0FIZLIVKPGzNFTAt2muFddhZ/SxiSv9KaBztT4JkmxMe01hnsKfsTl9
         VcSg0Pu05Sf9LexO1XzRDEPeburvmx3HSnj9jp22PbeFq6/3kyFBb7qqIW4V5t+VexaA
         DFeMy7idvXgpglUAdDgRalY8ZgasgyS7SZ3R5v6QQh8JxafGf3OhpmW8kaf6PLahyKdG
         Vqn+dw2eQYeXvwUZG+B1+OC/+nmZOfTIYb8Z1XRXQh71A9nBhYYlX1ZtId5kRA+5cRSB
         L/Q1HwLTnVjZeTLT3kXn9YnrVzAVfJtkVTKykxKRtuFfBhAk+wf2dDBTm3FISS4hCJ/K
         qK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473439; x=1763078239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=B/Zue0jPAfPxh2dA4jF4mQKnScDHkHu2bG2Jhw/gP/GzAia9tFI6NfRp5A+WghmVUy
         95ukba4HznjXLR5JiBOLAlfoHEyFdh2r/AVLFQ0q4VgGnv/20dkt1kLzZohx19kSH+2H
         Zre8grcLUAFLd3NBXauXWK6z4fSGdtPVtznabwSZKIFPbszCSohZXLnARKg70nPQVLwx
         IcD0MN2rC65oPgYGP6vn/Y/KjxkqlT0/H9YO1ywILw+i+MGDr/0h0mO6zVIeAYdEx1SQ
         mqzOhl9ZWwyW2zgYHCaV/gqHc8GQU+xDYy8ZnVv6wnt5MfeIxeZwqayhuF1X7EvClsOR
         9NBA==
X-Forwarded-Encrypted: i=1; AJvYcCWdm/GXkVYCCqBx0Ow3kGY0BxzQXa6bXU0sT7/4pGlftnpm7h0cM68uwllAguuk8BRxoTQFjxNEl/1kFSTVag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWpYulodmr/TeXYg3HVYSbU5E+NaoFaA4dgQHsFAS0tRDOKA2O
	sCWpa6X/RBTFz8+Y5KEaY3AyLCSbmzGoLakcmDE5He/0IPgKB+HMxeAVy3nX5Q==
X-Gm-Gg: ASbGncvchrPA5lwnGd208dCNO5vyqKNS2Zt2NX9ReadgqjfZF2MGOLNESaaIkIf6AmQ
	bEb7nHOwaxQg8KUVPODhqE5zncj8iLLrQOGY3OTNUo+bUA8XLihH5y+G8fjLQh0MQP1ZR8G6nuI
	m+8G+RAPYjVvwe4e4TyXIC2HVHUTiR9JebQ+BbJIA1Se3RL7fY+v+SwISUrVI2kHD7IvO1zpeni
	kPpo1RzvLgLIXjQ8yM5bSe0s0wCt3aS1080p8tCDw0gvRp7fht7XP4I7Tiqcj1cvI/tCDCpQbuo
	T2Yzx4K9fH+JVcRjmbmoyPwQONRGo5LU04yoqRTbsB7Cw2VWEL9da+hgSHj9fvuOTsRh325ZpxZ
	66COS90FXU1r1V22vDHo7CMmeePaFfUG2E5w2LvIA3MiyRlcqHT+NklL3qBj6reuiPe8+4cUT0d
	xUrM/QT3Cg2v5mJP5f6ZGZMiv+PJ/bng==
X-Google-Smtp-Source: AGHT+IEkxef+2RXJnVv1MDtMP+PBPYplJlT6jEtLbLvDmINhz/OHYKIorQbjuGU7uu0HwrhH5KQd7w==
X-Received: by 2002:a05:600c:1381:b0:475:dd9d:297b with SMTP id 5b1f17b1804b1-4776bcd2cd2mr7382915e9.33.1762473439445;
        Thu, 06 Nov 2025 15:57:19 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:18 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
Date: Fri,  7 Nov 2025 00:57:03 +0100
Message-ID: <20251106235713.1794668-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_155721_742262_8C164976 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

This small series introduce support for Airoha AN7583 pinctrl
support.

Most of the changes are generalization and cleanup of the Airoha
pinctrl driver. These are needed as all the array in the inner
function were hardcoded to EN7581 and didn't reference stuff
from the priv groups.

Everything is changed to match_data and priv struct so
adding AN7583 is just a matter of adding the structs.

Also the schema is generalized where needed to address
for the small difference between AN7583 and EN7581.

Christian Marangi (5):
  pinctrl: airoha: generalize pins/group/function/confs handling
  pinctrl: airoha: convert PHY LED GPIO to macro
  pinctrl: airoha: convert PWM GPIO to macro
  dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
  pinctrl: airoha: add support for Airoha AN7583 PINs

 .../pinctrl/airoha,an7583-pinctrl.yaml        |  402 +++
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2523 +++++++++--------
 2 files changed, 1706 insertions(+), 1219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

-- 
2.51.0


