Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A769C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62tBrpadPIfavF2o+ZqVMS/LXNWXr1AnVTC6InKiXEU=; b=Zp3irRWpHRn6Q27FeSilNAHyeD
	h+a/+05jzfCySFINeYdbhSNeiaK5YfbamcTQEFa/Ctql3KAnqnWYWyIZSQDxY+fptZnH2GFzNwydt
	k8lYr4dShqRk4Y1IdJKBQPkihrhIWlsVQVXFSafc755moxD/CqqoWxWwTNTbu1qnz+7dxC/RptX9R
	tJYTf/8g7aG5MG63nGV//0em5kl1KvJi1+JPB7FdOQ8aOAOoczK3C7Ijy2nwhNiIdF6z1IxxDh76A
	3UHXDq2LqtS98eQmvDOxvheitNOXmdj5Zry72iGBsJUo5IpRfD/9Adssy7HHzJpdOsMS41foa76PH
	7VvmIX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyyM-00FsKz-QU; Tue, 01 Mar 2022 09:39:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyy9-00FsG8-VO; Tue, 01 Mar 2022 09:38:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id d3so19515640wrf.1;
 Tue, 01 Mar 2022 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=Vsa3xP3k40cLCu4K30DmA7ryUsS2fZhxr5VMEaV7OyQ=;
 b=PiRPvmSh1PgNyPuA2nKq9TDyRD0oWh+8yt1oH8ecTtPmfUkVXXdZTCfjXzb3VQMYY0
 uXEkzlog/2BZe5EelgBrZTbkKSRyiOm6PX15K0AmeTF7azikC3W681DDwUyY3i9yXCm9
 JmCeFJ8RxrwWXSxVa5UT+i993Dc9fnfgfEDH5CpuNRju8dNG/xyi2qjZuvQ4Dir2JhLH
 /UTJ4tktgmNa/LBEN40Em18E6iuJQcvuwel+dxs/rFna7Tab7Mnl1CkkkGecTSoLqqCs
 9LssGw8VU5IlvV34kNlmsccm2xCpAlgca8nywvXcTchxeJWpAwrqrEBu2FZOVMPXGTvo
 MjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=Vsa3xP3k40cLCu4K30DmA7ryUsS2fZhxr5VMEaV7OyQ=;
 b=wYmFcV2j8epKwxGsUfst3ryJsc4B/fQVXB7l26uOoMFysCpnr2I3CzFzdecxtBsPWd
 0PGnUP4LF3rP1f3PJBEP62vDLOlcLYyOzFsjX6t55dSiFNMjI1T1H3WA0J2EtbTv+A02
 lUEZOvCCb9Wp42W1NQvVd7N7aNYgvmmzmj66iMThICYITHgha3SZvhoKM5bbORaXY+RB
 hzT+tVqWoSQxPk1YDa+8C/lFvOxqzVBy6msP7VOzMEA0SlhfmbZ14uSSXI7944cKS1Ho
 4jB+I7AHa2BxvkijTj38Wq5pzNH7dlfM+A+4P3FI12n5zbrcpxmXiYPW5cd6R+U8q0OT
 nWPw==
X-Gm-Message-State: AOAM532qarm8Cx7+rsUJoLCYs6jSpxSb+koPenF5nx1e/lgZqOxn33k6
 PrQSnwRKLTN4lIorPkeGlX0=
X-Google-Smtp-Source: ABdhPJzcW/SB22M9Lytgt8lLsAvdd51gsvLOg6OJOIOjYQWdTsWdu2w9sz4jM1luNb9H7V/xAHEeQw==
X-Received: by 2002:a5d:584f:0:b0:1e8:5697:e979 with SMTP id
 i15-20020a5d584f000000b001e85697e979mr19158083wrf.167.1646127536707; 
 Tue, 01 Mar 2022 01:38:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m11-20020adff38b000000b001ef879a5930sm9661521wro.61.2022.03.01.01.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:38:56 -0800 (PST)
Message-ID: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
Date: Tue, 1 Mar 2022 10:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v5.18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_013858_052423_5E6DADF5 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Olof and Arnd,

Please have a look on the SoC driver updates for v5.18.
As you can see, we get quite some support for SoC devices based on mt8186.

Regards,
Matthias

---
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-soc

for you to fetch changes up to eb1b02bef52ae545d5eb24116d5c099f738d39d5:

   dt-bindings: arm: mediatek: mmsys: add support for MT8186 (2022-03-01 
09:26:56 +0100)

----------------------------------------------------------------
- add power domains support for mt8195
- disable ACP on mt8192

mt8186:
- add support for power domains
- add mmsys and mutex support needed for DRM
- add reset control based on mmsys subsystem
- add pmic wrapper

----------------------------------------------------------------
Alyssa Rosenzweig (1):
       soc: mediatek: mtk-infracfg: Disable ACP on MT8192

Chun-Jie Chen (7):
       dt-bindings: power: Add MT8195 power domains
       soc: mediatek: pm-domains: Add wakeup capacity support in power domain
       soc: mediatek: pm-domains: Remove unused macro
       soc: mediatek: pm-domains: Move power status offset to power domain data
       soc: mediatek: pm-domains: Add support for mt8195
       dt-bindings: power: Add MT8186 power domains
       soc: mediatek: pm-domains: Add support for mt8186

Johnson Wang (2):
       soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
       dt-bindings: mediatek: add compatible for MT8186 pwrap

Rex-BC Chen (2):
       soc: mediatek: mmsys: add mmsys reset control for MT8186
       dt-bindings: arm: mediatek: mmsys: add support for MT8186

Yongqiang Niu (2):
       soc: mediatek: mmsys: add mt8186 mmsys routing table
       soc: mediatek: add MTK mutex support for MT8186

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   1 +
  .../bindings/power/mediatek,power-controller.yaml  |   3 +
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
  drivers/soc/mediatek/mt8167-pm-domains.h           |  16 +-
  drivers/soc/mediatek/mt8173-pm-domains.h           |  22 +-
  drivers/soc/mediatek/mt8183-pm-domains.h           |  32 +-
  drivers/soc/mediatek/mt8186-mmsys.h                | 115 ++++
  drivers/soc/mediatek/mt8186-pm-domains.h           | 344 ++++++++++++
  drivers/soc/mediatek/mt8192-pm-domains.h           |  44 +-
  drivers/soc/mediatek/mt8195-pm-domains.h           | 613 +++++++++++++++++++++
  drivers/soc/mediatek/mtk-infracfg.c                |  19 +
  drivers/soc/mediatek/mtk-mmsys.c                   |  12 +
  drivers/soc/mediatek/mtk-mutex.c                   |  45 ++
  drivers/soc/mediatek/mtk-pm-domains.c              |  17 +-
  drivers/soc/mediatek/mtk-pm-domains.h              |   8 +-
  drivers/soc/mediatek/mtk-pmic-wrap.c               |  71 +++
  include/dt-bindings/power/mt8186-power.h           |  32 ++
  include/dt-bindings/power/mt8195-power.h           |  46 ++
  include/linux/soc/mediatek/infracfg.h              | 133 +++++
  19 files changed, 1559 insertions(+), 15 deletions(-)
  create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
  create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
  create mode 100644 include/dt-bindings/power/mt8186-power.h
  create mode 100644 include/dt-bindings/power/mt8195-power.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
