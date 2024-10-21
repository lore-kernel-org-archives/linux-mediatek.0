Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564ED3C92F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=; b=0HeFFNnuSgflObGgvndz2P4rtf
	/L7KnXG5PFWaVw5aKPGv2iL5vAT4fUahiiwoBZKYijVsJl2Zw02fSGOSijL3wYbefMbJFxx4dAs3i
	HRIPNQL82RRfijKE8dy22cWgyfmsRinVKsAMy+UAuDWgN+wSCGVY4Ab9v+zeiqRaxI4Z0XUsvnCxg
	9C5WRlrRlr8VIA67n/F8VdWkArUDWUe1x6OBgKd6kogXfKF9zZTX4T+mgOUE5v3eoKVh/RKnMgUjK
	5hqi2MMWic6XE1Kdh5kOPRYW5MNsBj4IT6cnIIKUg5VfFmZKomwcobibvPuEqI2liHenYLQqiyV6F
	4sgd9L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2igM-00000005uwB-0INq;
	Mon, 21 Oct 2024 03:02:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ie7-00000005ucr-3Ajg
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 02:59:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2da8529e1so599574a91.1
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 19:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729479590; x=1730084390; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=;
        b=TAdCEpvO2/cI9ZCJwTN/0mDKQfAd1ZcyWwf8lH+8uchqrfWwnHY+QDmXmaQFXNuiH6
         vubE8Eo6qGKO5sC2rgKr+MED8JVOQglhQfU0qcaFQsAa2AF9twGvDXTpRaYPxc0ulUlp
         P1z4aBO2jNWdpcmoL/y/EbKStPoVNcGBIMW6Qrtotv8ijQGi8s5GYkbcMIN4YGNE2c7Y
         9HYWIk0KtzKTCDQ/4QXy7AeS5drsTXJGjR2eGnI2yrq90x1PzKPTCKXrsQ5XvdPbmZlz
         ujiddxL/m/9Av36lNaT/pCIHCFFP2KSJEm+hABkYhuD9PZL45B/2z7jfTz+kHChdeUZq
         0O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479590; x=1730084390;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RuLV+gJE30OXtNyG+M95n2ScV6KSGMzKjcPSGYqH7I=;
        b=g2boGVlPTKlg3bWwAWJOn/nQ5C2XiUVO/NSipK+B6SnDL+hw+NZjn6M6TI4A+JbtnO
         9w6SOC2Hv4I3rS+D9y8CApl0WFPn/xfNg6kqJHcNGLEAB7KBi7KN3AoAJcaQUtvUMKHZ
         Xz9a2vo3i6O2m/KfDcR50/vLVOL4lClvMqlElXISeSbj0n3FOAeCBEY5vJajUuc5vz9p
         P22wqe0wqk/T5SnvIDh0XskN2/DLYtlFh7bC9trPD9KSOivIrsb5mqTKhN3pNbASCZza
         wn6kFLJsV6dpGvALco6XkN9PN1IgAvuxeaJzeIJw64+OcvRiKwoMECqzrcKWAznDJdS2
         FT4A==
X-Forwarded-Encrypted: i=1; AJvYcCX+rb5+Uc6sqTGpp455nJ9DrMUVVszgDsOMDp9DNWTqwR9i/2JDq7y4228qKommHaSm0P3FlkrIARnfNq+TSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcL1nIQ3WiwGN6PZ9m5KixyVg11rLnk/4JbwX7avKNXA8SsCdi
	rlTgjd1meJZm2nzMyCKiTxOKP6jMTk/5lwr5M/w3XZBl+p83XovC1KBN+t8H3zM=
X-Google-Smtp-Source: AGHT+IEeMhO6fUKVIbKTf4VnCOrvoZB22wDG7bl6QGgOlpgFEmq4KFG93SWLtdJkWZFjghfjiEZPNg==
X-Received: by 2002:a05:6a21:33aa:b0:1cf:2be2:668c with SMTP id adf61e73a8af0-1d92c58dc9amr6387836637.12.1729479590211;
        Sun, 20 Oct 2024 19:59:50 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313fb5sm1815601b3a.7.2024.10.20.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:59:50 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Mon, 21 Oct 2024 10:59:34 +0800
Message-Id: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_195951_916171_D041DBB1 
X-CRM114-Status: GOOD (  11.30  )
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

This is v3 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v3:
- Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-codec
- Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/

Zhengqiao Xia (4):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add exton node for DP bridge
  arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
 7 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


