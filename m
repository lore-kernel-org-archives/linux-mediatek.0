Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B471C25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m+HwIKa8QAruaHjDaMWv2MKCcdgE6o0aq2ewD+8PT4s=; b=DwfflW4Vbvf1fr
	HFs3vFJIW8TUH+jInOUNu4B/ohigiSn+u9WsGgvS85s8Us/0ndajgCwr3Hc1Sc0ADMdBT5mfYF/Tz
	/i37NWoloFglz6GrgTDiAjwW6ZmxAn/tJ8VKF3SFtqW/Xw6A/tF50Mm67mUazbjM1k6rbjlvsKVql
	OjvgsN1DW+4zkJT+Xkzq/7wFURX3d2Eqd3nmyjQ/ld0LWRQ1kDKtxT1fJtM4ULWGAPANiBmNFZkSy
	2r/YdfNGswM5q8w/COZ/y7k/ZBy/gyG/G24k6QFNQpkRs1FvS9ZSIY0yf8KK+HI4Tr5KBzgCC8NNz
	qNwvf9ZL1tVZMRUpBXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUX-0000000CWIj-2csO;
	Sun, 19 May 2024 18:42:41 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUU-0000000CWGN-0so4
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso6902549a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144155; x=1716748955; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+HwIKa8QAruaHjDaMWv2MKCcdgE6o0aq2ewD+8PT4s=;
        b=AHYN+pDQrzQpFvCvqvb7PDu+dHAi53suQSPqpaG9/YLPt647L/D+7BY73zQ1evtEvf
         qGlitD9dztVktTbCTT7V8hFEoDVenO5NIT3v2XJpcfdhLdiFI+crVveytiCApDphdQrk
         Xnr7OCFb/5A2aJMQPLprX6K4SYrkMI+LHi7uJ1zCXAc+boTVMB77Dx+bbrA9BV8YrUgu
         8tu+hCZZcknb6vv6lObJ3H41d7shS+u3vjMOVCF2YanFyjerINHxdnA9Y9DQnsQn12N6
         gxRXUo8Sd/v/qZzWwEyhLxh6eQdjhKaurVOLcQHsUFFFqEFJrJlYaaJ/nVEq3jRhm/VY
         1LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144155; x=1716748955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+HwIKa8QAruaHjDaMWv2MKCcdgE6o0aq2ewD+8PT4s=;
        b=qun6uJEgp4gOKyZeHEgt1XlKY8Zyl7VFD/Fpya6YQTe3dRYAWXbwTF9PoGHPLR3xok
         IxT/UaVbxTuOAAnDq2UyPpR41ied0dyTT4pvjy9yZz4h6JVsi8HrfG7zVjOa/9vWS3WD
         gmXFHpvQTxoAnzlJy1MoepfTYATNLeZoUYHB1VIt9VpERMDRgPLc9sJA79w3tatqKfjm
         5w86Ri6sDJMRhJ8en2bZjwP8hUNlkZPW+yDtrqt9GALFdlaLIB1dRGyTuR+9a12VevMS
         WaZJbGZFBPWY3NoR1B/PIaMbemZeXYFno38AIWKTenBKD62P4f1v6C+uj3eNx3QlL7BA
         lpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Hr6tTkq/2Rw/IS7AxeHbFowmEkGbLm5tCTnHRUrFaEPH8n2oj0hK0XCbCxc/Ag41G8ZV56dIAB2OFi5eRBo++vJ11ASQM+ZhbrImafFzqS+7
X-Gm-Message-State: AOJu0YwXjJjZ+S9ijGAAvpMyO8CGXmH9McqdLOLQJXil9czoFuxFqhfV
	p9IpuN4mYKLslYM6HFkgWXrNPXTPUc9wjATFIfQH3nGLDiDPDaad0ru0HDdpHvM=
X-Google-Smtp-Source: AGHT+IGBFpqWhK0RMasalcUHn9CfY/XMaOeYt+zsp5+d2c3FSkiM5Pd4rESufwvDhyyTXCO7bUSzGg==
X-Received: by 2002:a50:8a8d:0:b0:574:ecec:187c with SMTP id 4fb4d7f45d1cf-574ecec19b2mr8805646a12.36.1716144154985;
        Sun, 19 May 2024 11:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/8] dt-bindings: mfd: syscon: Document more compatibles
 and require simpe-mfd description
Date: Sun, 19 May 2024 20:42:15 +0200
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdISmYC/x3MwQ5EQAwA0F+RnjVhZhF+RRyWFk0omYqsiH/fi
 eO7vBuMg7BBk9wQ+BSTTSPyNIFh/urEKBQNLnOfrMgrpAN7URKdDNeR0C4bNkXbFznQV+x8XZe
 F8wSx2AOP8nv7tnueP2KjNbluAAAA
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=74vF+IoSfFoLMUH7RudSQwr4gdZA+l9TqbQpYx1aLQY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgNECgP7nhUrDjjCAV6sziyTN/z6FdpJw6+n
 O76OPg36LaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIDQAKCRDBN2bmhouD
 1wFnD/910Xe1MkF3fmCQCzKEKdW2xCOK0f8FSyuRvHro+0QKHjH5momKKqzOXtAPRZm7nzXmgQq
 ZSQR5V8q3OALE6XefzeXf8jyfJrDGyl2f9ebjTlIIRlRIld2cVpKK9DCKlScVNriDLnT5Udfngm
 QEC39hCSZu9JbNAFCAmzpP2AF8mP1UOz1UrRJ6fBhYEB4aihn8T23agzrIq+IVgA3NqEGEIk9sc
 RlJG8G5a9nA68PTX/Y75Z3eUtkDD84BlC8JPJN751MHUB7XtjSMjouLU/k923WS8B5ebTeCZKkw
 XpA0tvfxHb+SgXtN8rDXelwPXtLoweDbrdmZVOKFyF/6M58KCGHj692p2Scb9yDCUp8834nuQ/2
 N8HP0VDobIbw+lHKzLcGtFngxkmULJ2Oy84z+fV+hjzgXSZeJEW0VAaFz43YZt6thBUdcQPZrjr
 DEw09N21D/07IUSBUmgolRfzqVPdddyxMxreyQ2wMewXE7OtjIw1S9LBQCU3dNWYn5uZi6AWHOm
 KlB21MfTO8Invpc1xGovfDtW0VNt3zyXWORgKqJSf5fd7E8GJE0m9NOEQbf9ldNwidy1b06AvFX
 3/HsjPHeEGndsEGtwdhneLPP4GAKxA/erNnfhHEdfy8/Zqh/GgwnJL5G0RZtpt2K+HWFCngv2U4
 OKMbB87TmI3MJqA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114238_327501_9977A97F 
X-CRM114-Status: GOOD (  10.92  )
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

Hi,

Dependency
==========
Depends on https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
because it touches the same lines.

Merging
=======
1. Bindings: preferrably everything via MFD tree (file/context dependencies).
2. DTS: via subarch maintainers (no dependencies).

Description/problem
===================
Simple syscon nodes can be documented in common syscon.yaml, however
devices with simple-mfd compatible, thus some children, should have
their own schema listing these children.  Such listing makes the binding
specific, allows better validation (so the incorrect child would not
appear in the simple-mfd node) and actually enforces repeated rule for
simple-mfd devices:

  "simple-mfd" is only for simple devices, where the children do not
  depend on the parent.

Currently the syscon+simple-mfd binding is quite broad and allows
any child or property, thus above rule cannot be enforced.

Solution
========
1. Split the syscon.yaml binding into common syscon properties, used
   potentially by many bindings, and only simple syscon devices (NO
   simple-mfd!).
2. Move some known simple-mfd bindings from syscon.yaml to dedicated
   files.

This patchset might introduce new dtbs_check warnings for devices having
simple-mfd and being part of syscon.yaml previously. I fixed some of
them, but probably not all.

Best regards,
Krzysztof

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Lars Povlsen <lars.povlsen@microchip.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
To: UNGLinuxDriver@microchip.com
To: Nishanth Menon <nm@ti.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Krzysztof Kozlowski (8):
      dt-bindings: mfd: syscon: Drop hwlocks
      dt-bindings: soc: sprd: sc9863a-glbregs: Document SC9863A syscon
      dt-bindings: soc: intel: lgm-syscon: Move to dedicated schema
      dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
      dt-bindings: soc: ti: am654-serdes-ctrl: Move to dedicated schema
      dt-bindings: mfd: syscon: Split and enforce documenting MFD children
      dt-bindings: mfd: syscon: Add APM poweroff mailbox
      arm64: dts: apm: Add dedicated syscon poweroff compatibles

 .../devicetree/bindings/mfd/syscon-common.yaml     |  72 +++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 222 +++++++++------------
 .../bindings/soc/intel/intel,lgm-syscon.yaml       |  53 +++++
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 +++++
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 +++++
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 ++++
 arch/arm64/boot/dts/apm/apm-merlin.dts             |   2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts            |   2 +-
 8 files changed, 365 insertions(+), 132 deletions(-)
---
base-commit: ca42fd4fd365cbaf798f17f655aee3d8192829f3
change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


