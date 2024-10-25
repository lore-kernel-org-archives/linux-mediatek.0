Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF287D0C601
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JA1BaJSXIbyRxZAZxbUrwFqIYodfb+rWTCae1lhe5eI=; b=B026IKv3yvxM95
	kbgUxPcTs9EYAU8KJpfVzkZv/gQ2mCgWnot+4y8NR231gu323kJk+vJ6eOAr05YtqyrInZJmwpt8k
	UCNvj4tZ0rM1LTrWiyyZAtG2/Q0UbWm1SU762RL82dMXA50RQEVDOJV/Owohtm1fepLviJZbl4JZc
	ezSLo9gWBb4yTKHNDsjOPsLJ7zZFWGL6IT5d3vWbSdJGH/8I5iF4RtxBrZqhXO7yJgAOOol2ND53v
	5Sv1qlgpK2UGM0Z3e2oLkCYflPqYs90OkVJUqwe42btu0sb98Fg0tD1Zzdqm9zCMJSjDpr8+aE1ne
	w8l3zsu61oLpw0U4kjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IHQ-00000003TP8-1Ztc;
	Fri, 25 Oct 2024 11:14:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I4u-00000003Rms-3Tn7
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 11:02:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20e576dbc42so18283785ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729854120; x=1730458920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA1BaJSXIbyRxZAZxbUrwFqIYodfb+rWTCae1lhe5eI=;
        b=B3wPlPcs45VNjnpmkAL2G1Apw1Y+nm+m6rXDNxBSKHx2P3xhHGOD1UU2ITsMA4fUH2
         sJMINTCmuLk0mHtgScCe5v2Oo7nYpQmVmSRuV218P0aDN9djq1FKnah7T+s9K4vEPTfu
         FaS1Vr7WHS+d+lnoea5P6T6SUEZ7VVffe4Hfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854120; x=1730458920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA1BaJSXIbyRxZAZxbUrwFqIYodfb+rWTCae1lhe5eI=;
        b=pDEsE3RGTYJjGCviBAeAwL/FHdtd3d2wPKUWA1IYda2V01BPDRdtuFpXBjWbP1ft4D
         XBdkcTHwrU54Nq7TEEDvNnsBKmABX0imWhzaFhxN0CuHES/OF3ZZ7F3DOnswVM6mpi9w
         18REnI4bU3N3O1VFakPoMTXbxO++cxPO3YgyjayCp56aL0R3Y7RLM8yhh93KO4ly4n8Q
         m0o1i4LMHGEv/nbIZWI3CoIHlrPBcgX0TlNm97OvMHYOkMSjBcVLQGBBnjDTI3HsZDWv
         5gGDZpd8wbrCRi+2hniMkaD0h4cZ2TqNHW0yJ/+AYr/y6/UKQUUX/DTdzsZPljTgaO5V
         BWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLsPo+yl+MrWY/ZsWeYKkGFLEq0w9/aS8EeJHql80VjN9hwnVArnV2K0m8EUpIJ/FK+H6pbcNN+n1E2uwxkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuKcgUybaP4EbZyefOfzGsTIi7yudAZ3ZRGjKYUr5hUFtMX5Nt
	mnuiNKuqlr6yP/pLMs4MhPBcMUKdwgue3QL5iMwVNwWeMLMBEqjDJmzqLVvIsA==
X-Google-Smtp-Source: AGHT+IFDbxd3tKIOspjDBLvAwaHXKqYcW5r6RFjmnpA/8c1Tgdp9G1tMOfUfj7tEG8JXbcnHkoILhQ==
X-Received: by 2002:a17:902:e74d:b0:20c:e005:2c27 with SMTP id d9443c01a7336-20fa9e9fd45mr131792775ad.42.1729854120044;
        Fri, 25 Oct 2024 04:02:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4472dsm7588595ad.13.2024.10.25.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:01:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/2] Add device tree for MT8188-based Chromebook "Ciri"
Date: Fri, 25 Oct 2024 18:59:34 +0800
Message-ID: <20241025110111.1321704-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040200_922799_2ED327C7 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi maintainers,

This series introduces the device trees for Ciri, a MT8188-based
Chromebook, commercially known as the Lenovo Chromebook Duet (11", 9).

Ciri is a detachable device based on the ChromeOS Geralt reference
design, where Geralt is the codename for the MT8188 platform. Ciri has 8
SKUs to accommodate the combinations of second-source components,
including audio codecs, speaker amplifiers, and MIPI-DSI panels.

The Geralt design is not used in any actual products, so its device tree
is not included.

The device trees are taken from the ChromeOS downstream v6.1 kernel,
ported to the mainline kernel and with cleanups. This series aims to
provide a basic device tree with the enabled components and features.
Additional support will be added in the future after validation with
the mainline kernel.

This series has been tested on top of the next-20241018 branch.

Patch 1 adds entries for Ciri in the MediaTek DT binding.
Patch 2 adds the dtsi files for Geralt and Ciri, followed by 8 dts files
for all the available Ciri SKUs at this moment.

Note that there are some known dtbs_check warnings, depending on binding
fix or driver support:
- sound: Unevaluated 'xxx-dai-link' properties: sent patch[1]
- amplifier '#sound-dai-cells' and other errors: sent patch[1]
- dp-tx '#sound-dai-cells' error: sent patch[2]
- failed to match 'himax,hx83102j': depend on HX83102J support[3]

[1]:
https://lore.kernel.org/all/20241025104548.1220076-1-fshao@chromium.org/
[2]:
https://lore.kernel.org/all/20241025104310.1210946-1-fshao@chromium.org/
[3]:
https://lore.kernel.org/all/TY0PR06MB561105A3386E9D76F429110D9E0F2@TY0PR06MB5611.apcprd06.prod.outlook.com/

Regards,
Fei


Fei Shao (2):
  dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
  arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri

 .../devicetree/bindings/arm/mediatek.yaml     |   13 +
 arch/arm64/boot/dts/mediatek/Makefile         |    8 +
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   63 +
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   54 +
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   20 +
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   76 +
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   67 +
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   52 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  413 +++++
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1497 +++++++++++++++++
 12 files changed, 2317 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

-- 
2.47.0.163.g1226f6d8fa-goog


