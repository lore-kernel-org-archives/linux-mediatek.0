Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BCDCD4F35
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=; b=n+9JXIlsTeyoaOCk1HgjHv8gXr
	5XeQJCvMhW7gm7L3QIzBdtONtWIfW7uaVNLG2HVZ8+TYZnGEW+uTq3tV4r0eNYSVQzn+X6kyhd+QH
	NlmWsUn47+giPtk3fTooOw1Mu82SowRENgN3qB1lCW6IcJVM5zaE3vhcSSqjWLmavrKFNSkg+B/M6
	JEEg8yIyDZzfJMCOmynZeiloDk6JWmBvuMi4nRcvk6puQcyBLGrqktIqBIpoPh3ciH14EeijM4Yz4
	IdyeYjv+uHa58weCRll7KeMXYYvU+kwxjTjsiGPW90v+tqjjTt3hxKqox1OGgSgfCGXNHoLMKHnhS
	1snb8dNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisj-0000000G9CI-0gUz;
	Tue, 12 May 2026 08:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMish-0000000G9A3-38Ne
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 May 2026 08:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=; b=HFjgHQsn+hog/uI5JEyJGmOkf+
	QQuW7BRt0KYXzoBoiMxevpZoIp/xEctKRy9A5MBsbpGlPlwTt721cfHW+ghzO2cQCc8ddrknk56Ce
	dfOon0tuTCqF0THRdU3G/j90SL24H5fY7CTm29qNmuMu4M8HcISdR05DmOfLYzs6oqUkFUVP5yGmN
	FmIrO8xNo2ZxlNRdsUJ7IwvziFafdbM6wQGj6mzNAXM3c49Hg0PRbe0TjwzDT7DTGq6q5QHeqaxG0
	rEyijnT+egftdBsm0cK3B4lQYZ17HOu97hy9JHFqgjgx3XF6AKr6nFpwK8tZ9+tatv5xxv3I9D6ak
	mRUMYx9w==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisd-0000000E9zi-28dB
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 08:54:22 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so2162965a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576057; x=1779180857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=EJ/viv9skhk3bkocVfwgSHMuQiPxTuUabCTdxGWxLF1wqhhnnVquOay5rngUzI7bHg
         t0QioiXfBk0fuVXJ41J6SPk6dYCUvJRIfRLEx8DgAZJuPMq1a6e9x/2vFqNXn/XDP9Xw
         vtzVDtiZDFhf0pxpsiAvJNRYtWPTo05z+3Oog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576057; x=1779180857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=ls3Oah9W2F9froCk6brBzQKzpFOflddzdwrfeIzL3MRrkMTk1DpN9vEEq1oDKLvvU1
         /v7zqHBoYESSkZ09Pls05KjRUttPgrSDJt8zlTJCVnBpzGk95Um8HxfUmPwT+7CnUeDI
         46RM/Y4yUYOgkwxBX6kaKFa1+jMxv/BdjiQ+TxZKrwtapsvjfVcHEn4XQ+1p20NaGcSu
         moikezmWlLvfmP1YKKPo49ocJ9shK5hVLkas+HpYd3f6Akk1dsqmzN/XLY95mx8GwpCN
         NsgD32Lfx0zD8uO2N6mmpaKFM9oH18P+HZpI2impaYfVqtwePvCIh8S3C8D4rVj6Qg0x
         dnFA==
X-Forwarded-Encrypted: i=1; AFNElJ9LRU7Yo2ePTfvW1k3mU4zncaLOix7M9NVqYJrJRZtRdsXa6iVcirB+i3KEkH7u/BAoSsG4VrtCZNRIbI8h/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40h3OXY8d7ufoHPYJ6NGV6irKsRhb+UZezgWQt+kSkIkEBDPE
	yTtkt2bja1GtrR+l0hfQpiKO0FhRfYNTSl809oDCqwcJFpTCm65YArdL2iLeCH3d1Q==
X-Gm-Gg: Acq92OFZHOQDb85y6t4v/8UccN4hKgQp9sEZ5RTMRDQB4iOMqkpYyUY9OvpnEmH10w5
	q0u7gWxTZ5+oVTUJVtorR6w03Vli/6svkArv00N8wEghb7TfMABfzFydtKn61hqkwDDnIsAcZcT
	IA900psqHqShEieDl4K6wss+aBnkShYGANbvBqsmyr58DUfHYX62VBc0qmbi+u4AE9GACfWfEAv
	R9fjQA+bF7edaXzWYGepVDXHePgqlCVL6LgGmWZZEM3hNBiTROMq38CpFpwXBolb7SNBWWWaiTJ
	hRlgasG/ptLHBkt/3s0/lFHUVqbnj3BQjbJRcBKB4aZxTfYXdEOyQWO67C24ojsHBWIVBQtOQVy
	pcc2t9xwd8OdotS7ssk0GM9fa8uuK5BajPOSB4/5jYuFTOiKwI4CczluKctiFc1PdQughnhh43Z
	UjCT7S8LE3t0HPoEBw+l0985kzyMeINTFeeOMCbb3QoOfr/tiv1w61QWefPmlNrwk0dfwbgTB45
	iGkmB5G
X-Received: by 2002:a05:6a20:7fa9:b0:39c:787:f196 with SMTP id adf61e73a8af0-3aa5a99f496mr29462031637.16.1778576057122;
        Tue, 12 May 2026 01:54:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] regulator: mt6359: cleanup and add supplies
Date: Tue, 12 May 2026 16:53:48 +0800
Message-ID: <20260512085358.1693208-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_095420_202906_24A41EE6 
X-CRM114-Status: GOOD (  20.24  )
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

This is v3 of my "MT6359 PMIC cleanup and add supplies" series.

Changes since v2:
- Fixed vsys-smps-supply property name (from "vspms-supply")
- Collected reviewed-by on patch 3
- Included Lee in recipients (sorry about that)
- Link to v2:
  https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver
- Link to v1:
  https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 3 deprecates the vcn33_[12]_(bt|wifi) regulators, and adds new
proper vcn33_[12] regulators. The two *real* VCN33 regulator outputs
each have two enable bits that are OR-ed together to control the
output. This allowed WiFi and BT stacks to separately control power
output without coordination.

Patch 4 constifies the data structures used throughout the regulator
driver. While not directly related, it touches the same context and
it is easier to include it in the series.

Patch 5 adds the supply names from the DT binding change in patch 2
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

Patch 6 implements the changes of the DT binding change in patch 3.


One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  mfd: dt-bindings: mt6397: Add regulator supplies
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split
    regulators
  regulator: mt6359: const-ify regulator descriptions
  regulator: mt6359: Add regulator supply names
  regulator: mt6359: Add proper ldo_vcn33_[12] regulators

 .../bindings/mfd/mediatek,mt6397.yaml         |  50 +++
 .../bindings/regulator/mt6359-regulator.yaml  |  52 +--
 drivers/regulator/mt6359-regulator.c          | 400 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 339 insertions(+), 173 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


