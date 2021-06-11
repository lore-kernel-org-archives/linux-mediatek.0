Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87657C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D806611C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D806611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9vMjBmzNXC7MubMPjH+9aDULu1omixcZ6ENrJIT+gag=; b=FMzwoK+0b51eDn
	DMm6ts6+OxueVz4iSi+hKW5GoymPbUJCznMYWJNKHKVA9Iujte8OWfOl7hotOwQ4mQZo0oHnZ+2D6
	vMqmHdNcOcVe7bK/xeL8Oime97dvGUAdHpGCRCFjtV8t/2g6Udgf9xLY5/C2ifW7pFdDYiPWQpWug
	fib3LMjKO4lH1oPrupK8Bm8UExaRghM2ngMobuxS4M/ZLHlfCbceE6y7Cv2mbcNfmyPG4uOYe1HCB
	kvbKDr0tUzbVEiWMUgRln8bIzhC8Y4K69q3chc9HPmxFoTqlne6ngBcKvQmjwXTjO0OESpPfYGLCC
	oPCZOf8e7ysVrua6TEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrf4L-004w1J-OU; Fri, 11 Jun 2021 11:11:21 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrey1-004tpf-HY; Fri, 11 Jun 2021 11:04:51 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so5150962wms.3; 
 Fri, 11 Jun 2021 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1PP6pTt87xNCC8xSBbNZ3OmYpZ0rFEwxWleyUjKg5eA=;
 b=dMiORa6kflrGKYa1vAEpTCyPpBFKSLUN04fnFjlKlFvlX14GbgiUzu3a86UeicRnuO
 Jy6G2UxwtYJQsJvTT5xwWKzrAGzqLxNB+Q/ebUrGpaLHGNs63NQzsZgI6HM1BfRexl3l
 +CgMV9eHPfvtPHhSw5zrPXW1M0VVQZtXPPqAiBwUIOFdhbHsNkWdu0Gt775JKf6GE6Ix
 Jki8Uv61R44qmEl+puIvZdikyMzRDx5ZuS6vmd2WVejG5PTEZCb6wUb0lVGMCAR0jrtL
 XnY8TESN3fIoXNcIaPc+zjs5wxipxTh/0PMCz/qzOaAwbj29uZUEhQzie0GW2a4Iywu8
 IJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=1PP6pTt87xNCC8xSBbNZ3OmYpZ0rFEwxWleyUjKg5eA=;
 b=dEAG+ksQk0Zdu89k111JgtlTZd2BDUh1LXVZyhSBuUyFjagQenxbyIv7u5PMy32Rvk
 tQnQlpfZFOx4S0qDwydPGUFUWT2jL5DJQK/+9zfH/XABRyH93ZujCPXPlPZxZJWHEre6
 81XCZDiItjxqNX24La4kMiQzYrBDEKfvwUuOVsNtnfhES2wzElOJOSvn96NfXPpPNcVt
 s60pxjqh23dBw7Ps8Kv3llHAJTzhWlHr5v/tRj2VktbSmiJ0W+aePuTaKPlLdmtsAACi
 SL8REukAdCmaEY+f0pY6v5q/cEUS4WfsW7mQ+CcldA0mbPUed209cuYVDuQr9GH8WtUP
 FHcA==
X-Gm-Message-State: AOAM530mmpHRWO4Pb5zdR316vOlu+fHfnc2RUrYrEeVW5NBR6/TeBf7Y
 Qyq7Ndf4boWS77GfsP26XV4=
X-Google-Smtp-Source: ABdhPJwg/WVdQNUy+OYO0ohwbX0HYwAcrdwAwpPcVkqkXHfnL4NIRhqvqlvrvtDD21LNTGALjWQzEA==
X-Received: by 2002:a1c:6004:: with SMTP id u4mr19774275wmb.110.1623409427447; 
 Fri, 11 Jun 2021 04:03:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c12sm7651854wrr.90.2021.06.11.04.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:03:47 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Michael Kao <michael.kao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: DTS updates for v5.14
Message-ID: <117d5eb5-bc99-70bb-a1a9-d7141fe96527@gmail.com>
Date: Fri, 11 Jun 2021 13:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_040449_649957_5CC1BB9B 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,



Please have a look at the DTS patches for v5.14
.
Especially note all the new Chromebooks based on MT8183 that get started to get
supported.


Regards,

Matthias



---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-dts64

for you to fetch changes up to a8168cebf1bca1b5269e8a7eb2626fb76814d6e2:

  arm64: dts: mt8183: Add node for the Mali GPU (2021-06-09 15:42:39 +0200)

----------------------------------------------------------------
mt8173:
- split hardware encoder block into two devices.

mt8167:
- add pm domains, multi-media system (mmsys), SMI, local arbiter
  (larb) and IOMMU nodes.

mt8183:
- Add new chromebooks: HP Chromebook 11a, Acer Chromebook 311, HP
  Chromebook x360 11MK G3 EE, Lenovo IdeaPad Flex 3.
- add power domain to SMI common node.
- add power supplies for EEPROM node.

----------------------------------------------------------------
Fabien Parent (5):
      arm64: dts: mediatek: mt8167: add power domains
      arm64: dts: mediatek: mt8167: add mmsys node
      arm64: dts: mediatek: mt8167: add smi_common node
      arm64: dts: mediatek: mt8167: add larb nodes
      arm64: dts: mediatek: mt8167: add iommu node

Hsin-Yi Wang (12):
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kappa
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-willow
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-burnet
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kenzo
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-fennel
      arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
      arm64: dts: mt8183: Add kukui-jacuzzi-willow board
      arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
      arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
      arm64: dts: mt8183: Add kukui-jacuzzi-fennel board
      arm64: dts: mt8183: remove syscon from smi_common node
      arm64: dts: mt8183: add supply name for eeprom

Ikjoon Jang (1):
      arm64: dts: mt8183: add cbas node under cros_ec

Irui Wang (1):
      arm64: dts: mt8173: Separating mtk-vcodec-enc device node

Michael Kao (1):
      arm64: dts: mt8183-kukui: Add tboard thermal zones

Nicolas Boichat (1):
      arm64: dts: mt8183: Add node for the Mali GPU

 .../devicetree/bindings/arm/mediatek.yaml          |  29 ++++-
 arch/arm64/boot/dts/mediatek/Makefile              |   8 ++
 arch/arm64/boot/dts/mediatek/mt8167.dtsi           | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  60 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   5 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts   |  30 +++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |  44 ++++++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts  |  32 ++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |  27 +++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts |  16 +++
 .../dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts    |  16 +++
 .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |  12 ++
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts  |  13 +++
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts  |  12 ++
 .../dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi  |  26 +++++
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   8 ++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |   4 +
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |   4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |   4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  23 ++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 110 ++++++++++++++++++-
 22 files changed, 576 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
