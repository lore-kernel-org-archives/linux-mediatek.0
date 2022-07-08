Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B110C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXsjNG5XBims48yiNdb9A0TSzV5YoXoRdjlmkiJO4uo=; b=HXOHiJvVgVTX+gwFK93Gdw+QH6
	j6tbKeRTOk8SQhn5E1aIC55bntBJg9WrN3TOZejs+dtMkbPGolhoqN+9UnV5U+sHebLdTR7Z795eA
	azwhF3+h/z4u8fRnlXXKGYSv+x2tm7GfPwuUWqcQ+7Rte4nMqdFJ45eYHTvi7lY+eTTh05hN0dmuL
	+Cx5981FnBaBf0yvrPClq4S5A1cT8Qocxvg+sKHxYR0zg7TOLFVRhmzY+HTGou4VkuU+K3GqmLf7v
	fdJEdTh5DYTTiRnKlW3O3FA8Bi1k086sO/sfM+O5hHn+OxhfaPx3nY+P3jOp+6cpYu02AaHHYjAh9
	l8u0Y3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9s4L-005ACZ-4R; Fri, 08 Jul 2022 17:47:09 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9s4A-005A9E-HN; Fri, 08 Jul 2022 17:47:00 +0000
Received: by mail-io1-xd30.google.com with SMTP id l24so20339212ion.13;
        Fri, 08 Jul 2022 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=NXsjNG5XBims48yiNdb9A0TSzV5YoXoRdjlmkiJO4uo=;
        b=O0t/cQKZuUiPW5OSe1KUiade9TXERfZSoN2IJSiN9fd4YsY4hgcoDapUkDpJW2C7+U
         Qtmf/6a75p30mEXTCIca0uUoTDZet1qgehbNHOAzYfmTdDpee9GI+EM3spSccfRtpfpt
         Cdd9Tgitemew4LzVViKshxYNyY1sewIPTYjk9rUFkVtJ51qn5o5I9YcymCnWoP1g4OPz
         pC/kiXH26bXyAxlv5vbJCPW6PHbNMROAdXM3uPFFMQSQtc6AECEqAC4qFYPbed8N8DNk
         tPLdSKt3zOTIVqqpHNHPJYS+kj/MqtzjXNE4BAcILObSD9LFUXDrrbVrHEMIIldkIUt/
         BMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=NXsjNG5XBims48yiNdb9A0TSzV5YoXoRdjlmkiJO4uo=;
        b=HaSl8GO8e9cWk6/iIxx15m3N7U71V243TKo3J959gmrTQ+bdK3xej/B/6KoVPZhSJK
         oAO1RqN3ovqTQG8AVWYzVX+7tk68ccik+sGNjmG4H5X4CkP08X39qa51kkAgLtnQnbyF
         9/ggswHsw9c9GDX23XEZSJ09nktxRhYtU5CA0VXEdMrv+Vy/+8qznU4o7xu8KDM8y1/i
         iA1mt8mRlkG8V2rIhskLld802r1NCZhu6VY72uJlogAxImQqi+GWQf+OOzcwVYvLC0ri
         tz/dpaBHn6pQIphZGf0EFPmwsXCW98SCUa0HtN9hMhono13pjTms4yoiNpBN8c47RzKr
         Pm2Q==
X-Gm-Message-State: AJIora8Ac0JwSGVGc+TWmZa6MC1WRl6fSGH6pz8nfgJove9W5Qm3xgKg
	vUtnbuNGDKlaXT7Hy+jz06z0kzi4cOchng==
X-Google-Smtp-Source: AGRyM1sVdML9CVcTBE2Z0v84MwtVRG1QeFId8/vtM6XlSwlJ2iOnAuAX9smz0LnGldPv1IXmAUYF7Q==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id m13-20020a0566022e8d00b0064fb683c70dmr2516244iow.62.1657302413384;
        Fri, 08 Jul 2022 10:46:53 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x5-20020a026f05000000b0033eb2f2ccfasm8309510jab.43.2022.07.08.10.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 10:46:52 -0700 (PDT)
Message-ID: <b733bd82-6d99-23ef-0541-98e98eb8d3bc@gmail.com>
Date: Fri, 8 Jul 2022 19:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: soc: MediaTek related SoC driver updates for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_104658_609570_D6061BFD 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Arnd and Olof,

Please have a look for the updates of the SoC drivers. The most important update 
is the addition of the Smart Voltage Scaling (SVS) device support, which 
supports right now two devices but more are in the pipeline.

Regards,
Matthias

---
The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.19-next-soc

for you to fetch changes up to 4d3ddc9bce4b2bfc167d8c2880f34de29b4587c6:

   soc: mediatek: mutex: Simplify with devm_platform_get_and_ioremap_resource() 
(2022-07-08 10:29:17 +0200)

----------------------------------------------------------------
pmic wrapper:
- code style improvements

devapc:
- add support for MT8186

Smart Voltage Scaling (SVS)
- add support for MT8183 and MT8192

MMSYS:
- Add more display paths for MT8365

Mutex:
- Add common interface for MOD and SOF table
- Add support for MDP on MT8183
- Move binding to soc folder
- Add support to use CMDQ to enable the mutex, needed by MDP3

Power domains:
- Add support for MT6795

----------------------------------------------------------------
AngeloGioacchino Del Regno (10):
       soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom function
       soc: mediatek: pwrap: Switch to devm_platform_ioremap_resource_byname()
       soc: mediatek: pwrap: Check return value of platform_get_irq()
       soc: mediatek: pwrap: Move IO pointers to new structure
       soc: mediatek: pwrap: Compress of_device_id entries to one line
       soc: mediatek: mutex: Use DDP_COMPONENT_DITHER0 mod index for MT8365
       soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs
       dt-bindings: power: Add MediaTek Helio X10 MT6795 power domains
       soc: mediatek: pm-domains: Add support for Helio X10 MT6795
       soc: mediatek: mutex: Simplify with devm_platform_get_and_ioremap_resource()

Chunfeng Yun (1):
       soc: mediatek: pm-domains: Add support always on flag

Fabien Parent (2):
       soc: mediatek: mutex: add MT8365 support
       soc: mediatek: mt8365-mmsys: add DPI/HDMI display path

Moudy Ho (5):
       soc: mediatek: mutex: add common interface for modules setting
       soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
       dt-bindings: soc: mediatek: move out common module from display folder
       dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
       soc: mediatek: mutex: add functions that operate registers by CMDQ

Nathan Chancellor (1):
       soc: mediatek: SVS: Use DEFINE_SIMPLE_DEV_PM_OPS for svs_pm_ops

Peng Wu (1):
       soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()

Rex-BC Chen (3):
       dt-bindings: soc: mediatek: devapc: Add bindings for MT8186
       soc: mediatek: devapc: Separate register offsets from mtk_devapc_data
       soc: mediatek: devapc: Add support for MT8186

Roger Lu (6):
       dt-bindings: soc: mediatek: add mtk svs dt-bindings
       soc: mediatek: SVS: introduce MTK SVS engine
       soc: mediatek: SVS: add monitor mode
       soc: mediatek: SVS: add debug commands
       dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
       soc: mediatek: SVS: add mt8192 SVS GPU driver

  .../bindings/power/mediatek,power-controller.yaml  |    2 +
  .../devicetree/bindings/soc/mediatek/devapc.yaml   |    1 +
  .../{display => soc}/mediatek/mediatek,mutex.yaml  |   14 +-
  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml  |   91 +
  drivers/soc/mediatek/Kconfig                       |   10 +
  drivers/soc/mediatek/Makefile                      |    1 +
  drivers/soc/mediatek/mt6795-pm-domains.h           |  112 +
  drivers/soc/mediatek/mt8183-pm-domains.h           |    1 +
  drivers/soc/mediatek/mt8186-pm-domains.h           |    2 +-
  drivers/soc/mediatek/mt8192-pm-domains.h           |    2 +
  drivers/soc/mediatek/mt8195-pm-domains.h           |    4 +-
  drivers/soc/mediatek/mt8365-mmsys.h                |   22 +
  drivers/soc/mediatek/mtk-devapc.c                  |   45 +-
  drivers/soc/mediatek/mtk-mutex.c                   |  155 +-
  drivers/soc/mediatek/mtk-pm-domains.c              |    8 +
  drivers/soc/mediatek/mtk-pm-domains.h              |    2 +
  drivers/soc/mediatek/mtk-pmic-wrap.c               |  225 +-
  drivers/soc/mediatek/mtk-svs.c                     | 2403 ++++++++++++++++++++
  include/dt-bindings/power/mt6795-power.h           |   16 +
  include/linux/soc/mediatek/mtk-mutex.h             |   27 +
  20 files changed, 2994 insertions(+), 149 deletions(-)
  rename Documentation/devicetree/bindings/{display => 
soc}/mediatek/mediatek,mutex.yaml (81%)
  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
  create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mtk-svs.c
  create mode 100644 include/dt-bindings/power/mt6795-power.h

