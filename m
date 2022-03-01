Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZBe2NgzeyQQQWAyyLEEJbc/xJ8mXVSjb417MS+6pUEM=; b=adrxbv5zoz4FoLTOz1rBuaWqNF
	YSx5m19Kn41bk9ESnSosDW2DufEJveARwYQNDYc3ZvJ3QaqJy6iimnq9XfdrNyS/2sqwfXEV2g/ZV
	IXPsvdLYUiaIbvMso7vOCwuzhOGOrzJBsztb0Fzua4Vd1f4GlYySkUFGFdR7hf4bowblcJZ4yzZ1j
	Fl/YfbBRAwpnw8iTzhEhngSCdzDNCFxfcDrqnkx0Zt1zYMh9EwsrQOSd089BHYwgtmIYci+k8urDj
	0auWQ1utClGXh61AkQtAwS9HZt6+sbCWMQo2WjDqBtdTtM1OnO4m1nH315JjLEQ3wNiSHbgImUcXB
	B0IR43BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOz8I-00Fuk2-CF; Tue, 01 Mar 2022 09:49:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOz86-00Fuhk-16; Tue, 01 Mar 2022 09:49:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 10-20020a05600c26ca00b003814df019c2so897660wmv.3; 
 Tue, 01 Mar 2022 01:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=XTS3EpBDg5VY3R0htkf6KQEMfJWoIPJ9vhVWfejFxvE=;
 b=BxzavaxjRBRloe2d5MQO5DOj/nAFzWlrqNkZ7XQ+ByHHjcApxKCIsR9DAR45ppm2Jt
 aqtKCxHE5sjnO2BtAjwcelWXlO/ZkGWVLCcdMRpnCFD0hZAGy3rS5ovpsQe6wzeT16Sd
 +KHuN9BubY8sd310O3aXN1UGYLuyZRveAMoopClZX2g+2vySsii0T0IUfkxLU4+ZuXvy
 UAxv73qS17rq+kAZGvOqSfapZv875dlixy8EQ609B5fcxw/AsRSxwbOeatT7ilhC9yzw
 k5JsJdMhgrTY4r1v1uP7drmEdooxvhCITAWG33yNkndovReYqC8cg90WBJMu+Fwk0EMI
 iZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=XTS3EpBDg5VY3R0htkf6KQEMfJWoIPJ9vhVWfejFxvE=;
 b=YkmfdIRnc5pWWn5MvfTWPRP5VU7lCdMlJKxvn5dDxjcFUaSdkLH2x2rwh7JgfKME7o
 T3/g2/FzUrHNV/OuVB8p/kJbCyqbL6oODFIZG54QhG7XovthOWb3FoAr+6SRR7mo83EC
 SqKt9A3dfjiPpwBFPxJXaVgmpZRReKjiuG71LY7mlvHwWwl4AGmS3Idshm5s1zmhCaH2
 YiM7fLxcnuvF/JgJIx1CMar8CXrdVT1ijtTy8j1WAmdiNc3vQI1Sc5pM0oUIt+AN/ZOS
 mo3KaEyFbjXoduwKNiURrK4tIdkR8YJ8MG9lQ8dJ0k404pFSxBKSWhK6KZOHQavqtXTM
 uRbA==
X-Gm-Message-State: AOAM531KbMB9pMaatFBjh92FXgmr0fJGhJ26BEXMPkj7HVD/+HJwm70Z
 gIPUX8dL7AdRNIweHziNm/AYWTR6EMdeXw==
X-Google-Smtp-Source: ABdhPJztsOOZpcRNoaNQpNserjsaev2Fsqlp3ahujpsMqK6tvVf4wOsOXdrawGkNoFvg0e2DjiQm8w==
X-Received: by 2002:a1c:5404:0:b0:381:6599:4620 with SMTP id
 i4-20020a1c5404000000b0038165994620mr7598376wmb.56.1646128152449; 
 Tue, 01 Mar 2022 01:49:12 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d4ec3000000b001ea95eba44dsm12950152wrv.109.2022.03.01.01.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:49:12 -0800 (PST)
Message-ID: <3974dc7e-4185-4d88-ab5b-031a7d24214d@gmail.com>
Date: Tue, 1 Mar 2022 10:49:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: mediatek updates on dts32 for v5.18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_014914_124146_283726BF 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please find below the updates for the 32 bit based SoC from Mediatek.
We got very initial support for mt6582 and a tablet based on the SoC. Hopefully 
we will get more support for the components of this rather old SoC.
On the other hand we get some support for the Airoha EN7523. Unfortunately I 
didn't got any response for the clock and PCIe driver, so I decided to not wait 
any longer and go forward to add the parts that are ready. We'll have to work 
with the maintainer to unblock the situation on the two left drivers.

Regards,
Matthias

---

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-dts32

for you to fetch changes up to ecd2a1c1d541a80a2197fd5cac274c65b3ec30c8:

   ARM: dts: add GPIO support for Airoha EN7523 (2022-03-01 09:04:45 +0100)

----------------------------------------------------------------
- add initial support for mt6582 and Prestigio PMT5008 3G tablet
- add basic support for Airoha EN7523

----------------------------------------------------------------
John Crispin (4):
       dt-bindings: Add vendor prefix for Airoha
       dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
       ARM: Add basic support for Airoha EN7523 SoC
       ARM: dts: add GPIO support for Airoha EN7523

Maxim Kutnij (3):
       ARM: dts: Add initial support for Mediatek mt6582
       ARM: dts: Add initial support for Prestigio PMT5008 3G tablet
       dt-bindings: mediatek: Adds a DT binding documentation for the MT6582 SoC

  Documentation/devicetree/bindings/arm/airoha.yaml  |  28 +++++
  .../devicetree/bindings/arm/mediatek.yaml          |   4 +
  .../bindings/timer/mediatek,mtk-timer.txt          |   1 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  .../devicetree/bindings/watchdog/mtk-wdt.txt       |   1 +
  arch/arm/Kconfig                                   |  12 ++
  arch/arm/Makefile                                  |   1 +
  arch/arm/boot/dts/Makefile                         |   2 +
  arch/arm/boot/dts/en7523-evb.dts                   |  35 ++++++
  arch/arm/boot/dts/en7523.dtsi                      | 138 +++++++++++++++++++++
  arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts  |  43 +++++++
  arch/arm/boot/dts/mt6582.dtsi                      | 128 +++++++++++++++++++
  arch/arm/mach-airoha/Makefile                      |   2 +
  arch/arm/mach-airoha/airoha.c                      |  16 +++
  14 files changed, 413 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
  create mode 100644 arch/arm/boot/dts/en7523.dtsi
  create mode 100644 arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts
  create mode 100644 arch/arm/boot/dts/mt6582.dtsi
  create mode 100644 arch/arm/mach-airoha/Makefile
  create mode 100644 arch/arm/mach-airoha/airoha.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
