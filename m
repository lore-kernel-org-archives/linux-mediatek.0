Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C293AD1CA18
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 03:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=; b=Hlf4odL2fygLwm
	v1AF2y5+9VZgfYdTsKRqrF/dvnP+wDOBsaBo93ThoJdRuU5jfTQ3zbOnQDUHE0uLyGVuNLC4pkuL1
	R3zFRi8HjKyNM7KdFA8m+HHmUuh3XEgBANCJ0k7ejZrVIWbAZ/+BsPfoFdwlegSqEVEgTmu300Mm8
	d80R5n6NKy9wuMwBz9uK+AHNI9OeonfSo1jRHAkpTVYUGDQUqed1FbFtVb414VxjljRK5jJe4kpiU
	kXv/Hlkeq/kGrVggD1x1PoNM8J4UIgDR3DJGtDAOLcsdCHtc3YjhBfkP3Q5aQAZW2oLljEefH8+82
	upb1MdfPpJf4AxOlCRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89xH-0000000FjHt-3Pop;
	Tue, 05 Nov 2024 03:10:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vW-0000000FioR-00IO
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20e6981ca77so51647295ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 19:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776096; x=1731380896; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=fIZ27thvUUt5JtpArtOOEs3aG45aYI9gE8qND56nM70WbxDlLHhrZdxak9aC62PyS5
         bIAmYG5dKGxjgyTdmFzlFmx6f6xyKeypk8j7sQ4Txs813hcQ6VSJ08vBxi5STGzUgq0J
         RS98Zt+mT8kbuGlcZ9qvNdwHtarOPcHIDaaps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776096; x=1731380896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=IpFSSUdC2UEzx8aYXIbLxt+GYNr5q1hjFbBJqcIJei16uEA9vXqqNX/n1EcjH17nuG
         yGhBbnejZzfcbclqrQvseJEdGucCPh9RMH/SQPG5+y8kkq+IjO9M9aoT87p2V3RIiS5a
         wvrmeVLzn3t46ZQ54vwdeP2fpzsr2VzRXTFVPI8eQTLzy7kNAA0me4YeVOck5GUTHnY+
         k+/sLG315DsJhk43Z9ePRExKuEtP6YoMtqBhhibjbDBzHJCzQq17WFiig3OOE7X4m3mJ
         BXDVufCnUL27Wokw4vMsmKqqEZM9vmzMdV9/+7gVLclRZjXW/GF+j0CR14D70LBoxGqj
         UySQ==
X-Forwarded-Encrypted: i=1; AJvYcCXswa+HJhwaJ/brR3xAcQ6zpJUHvvZx30dedZuEznfviKkKNu8uPjhURUaG+41Y6jRPCZ4bhpfstqM0z+hEEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywDal2NIabKVfgsCROHeA3Pr/bVmo39tj0TA6DB3zJbSr9WIwa
	04FmQV2X4Ot4Ac7emFowMVRiHvYs86Wb804NqHz2K8f2NFbiO2+ewWMvK9RNmA==
X-Google-Smtp-Source: AGHT+IF6jS3xzGt+Zxr6gzcjbNP+fJbgJb8X0AuhlKcyg9Co9aLJH6t+hhtXNPcGCoVxjkWAw9u6CQ==
X-Received: by 2002:a17:902:cf12:b0:20b:6d47:a3b0 with SMTP id d9443c01a7336-21103acdc86mr237288275ad.21.1730776096189;
        Mon, 04 Nov 2024 19:08:16 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:15 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH RESEND v2 0/4] Using i2c-hid-of-elan driver instead of
 i2c-hid-of driver
Date: Tue, 05 Nov 2024 03:08:10 +0000
Message-Id: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190818_114080_57B7841D 
X-CRM114-Status: GOOD (  11.23  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.

Also workaround the race condition of pinctrl used by touchscreen and
trackpad in this series to avoid merge conflict.

Adding other second source touchscreen used by some mt8183 devices in
this series since this should be based on the workaround of pinctrl
issue.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org

---
Hsin-Te Yuan (4):
      arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
 12 files changed, 12 insertions(+), 63 deletions(-)
---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


