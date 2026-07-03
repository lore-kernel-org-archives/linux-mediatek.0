Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5950AC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=; b=NQoeQZA21668pd7nn3qvfYT/Q+
	NZMgKPMePJb97RTFB7zV3VKN7OZSI2tH+I4dvKVaGUiT39uN/Gdx3BOX/dlh4sQCpRB4xIxGCH5bI
	BE0L94NHvzZLioKDtgl4KenoSmrhXZZR78VKVN7BvOgyoWnv+Dnr5lNENMnTEPtt0c+R9qq7VaUOA
	5RcN/93a3pizvWh5nTIt7CULi0pEsaiz67K1F5h6MX3YCxsYyVrlNvwsHx5XrvVLdsb7VYtaPH4qS
	7AUn7jGM3dO5ymIL89n2f7/QCiULSMteFqrY32QzqHgkg8pJB/M58EwsGh71gQD/TbGEJXp+/p7ac
	+4uQvQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVD-00000006rd3-0Uyn;
	Fri, 03 Jul 2026 11:56:15 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVA-00000006rbw-0RUT
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:13 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso370106a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079771; x=1783684571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=EU77Ym/NCah38zQMk6OqUe3TbPVU+fXwjxp36whYyYPGL33y7e9suj3yxaYUmldvwr
         6aVRMIjRb9EiyqJLsh8gENVlBk2r+lkdaMl8lJ7zHZS4EemUsIRwwc2EQdz505/01SbN
         ox4BAXnJ6ZERanEKoCFpPubqA5ZbiPsPf7WRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079771; x=1783684571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=jQl2bCLlvOVtMuQzbChrLK+JKdUcMlVzb79GUTlTr3qH5eQXOw9Jq1XMWYxQqV50Kz
         CbYZ9xAkhWvbmDo1yNTmYLYRCRlC/FkbRSYeVjclj2UDdwmlKoz14QvGFdbFTCYijofm
         4QE9ZD0ACSswji8s6yuvX0gVvfDejYxIjnyBMa2Tp+WV1GnR40Q3IA5nJ2undEhf5j9t
         KxB4Wvl7fpKJYS4nWij0Hvz6B+YdCveJJ216g+JUKSV+ojcagHYU/NdY/1H7TanT5vCc
         DQoS4FCJ/+hP05IDIoQZmCGBH6IonM0WbKUd+ofKjwkbVXy9lL3hMTQUhAmycI3tgayx
         RJOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GWOoPc92Ne+RvQep8N2zWA5n0WR/IfWkxqQm9sieFR0YN4TRqSDjrpmrSHbwXX72SW9ABLxmSX8N1NVZdYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Qk80ii/CVnq6qiYUC+kCSBCJuyptOERSuz2A9NVOlv/inlT8
	mhvc2eTA/o6VfR+Z0hziFcXRMd09p4lhoVtQua9UEVIProYpzuC1RtmtaAFlF4S/5g==
X-Gm-Gg: AfdE7clmmTwNN1NiyvScvRGI+li8iNmhIsCe8pRPE8FeE8xGhhSdvEnd612fOWQwja2
	IqSOFh6q53lzmGO3EuLmv0YDOZxrxi/2cuuKOpYCXI93HyLJKoeclhoRHWz1zLxjm4mDdP2KPha
	SI49wsZvh9zy56BSt3drnwchaDZfMT4l5OWUmvM7TcQ/cL5HY8TnFXa1MBgs4829E/io8C2TpYi
	9jJ2dSbN+lTmLYaGRPR14EiI5kRxmP2cX13KPSzaI6ZQIV7iMqkatSHATo6zHYXUQHsr5TIBV/N
	B7+/ixSiGvxzbGoEsseMWtkrKvqRt0w8Tr83ji/tkQckG2Q4fhZdeDF88dUahPCQrtTXOzU5YHJ
	Dj8E0JkDUrcJfsroUT1tc8nahkEJ8WLnrfPggbUJWzTO21WAd0A0kmvb+K3q0go6EBroGvRsA0g
	eKGyXF7ht+VJaseprYe9eggsoWlV1whNAASMdWtcf42KtdM/YflkWihfinQX7OVf7eBakhgQ==
X-Received: by 2002:a05:6a20:1602:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3bfed505340mr13580575637.42.1783079771207;
        Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Fri,  3 Jul 2026 19:55:53 +0800
Message-ID: <20260703115601.1323491-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045612_176278_C5A80AF0 
X-CRM114-Status: GOOD (  20.45  )
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

Hi everyone,

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. Compared to v1, the delay is now
skipped if the regulator was already enabled to avoid impacting boot
time or time before the trackpad is operational.

Patch 2 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 3 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 4 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 5 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. There are no build time dependencies between any
of the patches, but the DT changes must go in after all the driver
changes land, especially the first one adding delays to the Elan
trackpad driver. Otherwise one could potentially end up with a
non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if already powered on
  i2c: of-prober: skip post-power-on delay if already powered on
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of.c              |  8 ++++-
 drivers/i2c/i2c-core-of-prober.c              | 29 +++++++++++++++----
 drivers/input/mouse/elan_i2c_core.c           | 13 +++++++++
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +--
 7 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


