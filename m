Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B74D116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=; b=0aFjGne/IDEWGe
	s2jvIUNqEHvpOcV3APH66wEdheF7Dlwe7D0melwjP9JJKaxI6lWYgtyGApcjkvs8hp0tl9XB4eLrk
	YDRqKVwsb4fa1+K2hYHo0+YwTnmNqMG+1cXYBtLQkjW2wlGXRaE7oUe3pFGxOsBhTSBYQCKTY9AqT
	7HCP7C1S1I8RmxEiglrM3SBp9ku0m75kqlU8HbRdeyfRKR67Iyoq+3BN/J7cA/Au6kY/Uo4D+hOdc
	gpUOmuPhBGjVQUaJDkR33hG4bWmbWnXN5EpZIXISTeWdbd4dTnN/PhOkEbYagqTY2vIic+l1FezMD
	UBNVxU3TLmzeZzTKZSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pj-00000003MIT-2UNA;
	Mon, 01 Dec 2025 10:45:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pf-00000003MFX-0ofm
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42e2ddb8a13so448819f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585945; x=1765190745; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=;
        b=FgOQ48Fv4ntRGXiuxdoB+JgFxA+d1z+JDa7+LCRYufC/xqqxjKy41HzsOQ3Vygl1p3
         qrMZXXd13MJnpIERzoO/abxgXhrKnWluxU8pOsYdPnsOqxQPtk9k5NuztKvgmw4LkY5M
         Oa7v5grRQXkR3gAMScdzDWWEYWlEUZWRXnU6BhjOtHqRCj0d2ZVyVqS/KJkfKMcHd6Cc
         ZuZiKTnn/fwCt1rCNz3MAWOhaqwYv6oV2sLElNZQlSQUgi1fC2pcBOr/icF0aB1i6Bi3
         h5Z35GYt+omkYGTnH81bJsHaQuZB2TiO1ZlBwjlkWMVy8axsprC7PgCy+JcE+zroZwaK
         dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585945; x=1765190745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCF0FSqyYlnyWEBaqmzmHC6kRsLUVYOKh7WHQQM9qF0=;
        b=bdYVV1Vt1et8MZg3rlR/4h4KH546PFXb51hbqWHujAkBbd66k7bVJR83WRYFSICccZ
         ZSnCI7Zg+v18MNXM86j3bc+C9F25ZhrxsyNIRR3HZOgFKG04mvOkXad4JT+sRDNRqQ6z
         z/o51WebEWY2IdCVqiCquOpKzASfVfemtm92rw1pAiWiPF7+n7p9UCZbEIEF4FX0jdRU
         ZpJfXJ6/jgddJjuOPjM+mEfeUEJzq+OpsKfto4jh1G9c2TPZJfydBU1FiH+Q6yKgo5Jb
         WtyD0uJpK1XEWqAV/DFMEN9GkMTwS0EumXsKWZeQEQ+nfrExgUARH8uIoS8S4FKIXTSa
         39eA==
X-Forwarded-Encrypted: i=1; AJvYcCWRJe8WuvR8rMQF0rA8iUvLDZs2sQn9NXHbRUIKw6dAdK1FDhGeCQ1QBVLMWQxvnvUPxkSpgK7qlSjfVDO4BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcioaiRUR/rsq50JyHgDNQrnexmuqe0nac18YkQ7TxaVcGb5TP
	Mwl5K99cX9DZLy3ke6pcI4mgfCtbyyveFLFi40kfE3ZmIUvR1MI55NkctVB6rdj7
X-Gm-Gg: ASbGncu2LU/qtB1uyR9G1oEf4XOJ3rvI4VDOZkt0uqbS1KQMQjbGjdmHa3fg6OQlw9D
	dYaXlm8o6Mo1zFI9bubxXFMlcwn8xT077RVLvg0rGp3no5WnE1xrYEK8n/C3eu3fVr6o6QRJUHh
	DXNUVqZwFbNCuTzU/KjBSbtXNa7T3RedoTfHLEfgGhBh7vAlLoyNNOwYIFafWxDZiva9L4Cijbc
	cdX9JdWbIf6z2O8HTcJR4w1qJK7ev9G4qSWJDE6ePlzY4awHWslXS85Qu7oFQT16epPLseSi0EY
	LlccsKQPmsqo++NVKJhFstmJ3F9fQwZP3b3AoPUg6GiPLlYoxz6+J5Lh4VK9ILOcfJ2V10C2EsX
	BL72FBZf1N/BKsPgHlqPK9/n170JQ1DlUinR65DPWZHniFVOPcTsBYiq8xn2Xivv0GnYKJHlelm
	pS79ibVaBqKJSrhqIxISUjXDnBsQ==
X-Google-Smtp-Source: AGHT+IF+saINz1aMfFQPoF21DyIcobxATSuvnAhtrL28gk23j/ZdYr9KXTQtKbBxA0p/NCWRqd312g==
X-Received: by 2002:a05:6000:1f03:b0:42b:3867:b39c with SMTP id ffacd0b85a97d-42cc1cf452amr32151633f8f.34.1764585945022;
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:44 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v3 0/4] Add support for Ezurio MediaTek platforms
Date: Mon, 01 Dec 2025 11:45:16 +0100
Message-Id: <20251201-review-v3-0-07f9af7341fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxxLWkC/2WOwQ6CMBAFf4X0bMm2tBY8+R+GQy0LbCLUtAQlh
 H+3cNJ4nGTe5K0sYiCM7JKtLOBMkfyYoDhlzPV27JBTk5hJkFpIEHyX8MWNBjBSm6qqBEvyM2B
 L7yN0qxO3wQ986gPanzmUSijIC3MGXXLB7xSjH/POhuXaDZYeufPD3uspTj4sx69Z7tW/C7Pkw
 Bsnm1YpRGfwq1Bv2/YBEYIT0dwAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=2679;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=jNo2dVX46ep7yogASVgnWC6hbGoR5SWan4ITaGGLyNc=;
 b=ZPpeBmyjbzBJZ6wFdMpdSHQvmIZGec77e91q9/e8Xner55jTqegx9NWGkO0rZ51b4arn7x5pL
 jf2BEC53e2wAz/tAvu1Zx3ADXWriypUbET+29EYWFmcjB+CuoiJGAoy
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024547_259710_76736758 
X-CRM114-Status: GOOD (  11.87  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Changes in v2:
- Use b4 to cc all maintainers properly
- Squashed patches 2/3 together
- Updated dts node names to be generic

Changes in v3:
- Added per-commit changelog
- Added missing Acked-by on 1st patch
- Link to v2: https://lore.kernel.org/r/20251201-review-v2-0-dc2df44eec7e@gmail.com

Regards,

Gary Bisson (4):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

--
2.43.0

---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Gary Bisson (4):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 ++++++++++++++++++++
 6 files changed, 1523 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


