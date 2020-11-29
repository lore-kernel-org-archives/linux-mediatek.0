Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6485C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 21:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378142078D
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 21:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCn7ivM3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKr1UKx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378142078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQPlZpXZTLaeNplAZ0mRljBxpJjagu5m5Go1VtILlHU=; b=mCn7ivM3PpovhvDFUKAuNrxsm1
	2cqttPESAjHD6y1aj6AvYApfPgnK3I8G21aae5jnRZkg3IMnx/QPk+8rvTs3YQKyhPfUWIpEjkvZr
	GuX83oMik9LlkW24p7j51qSQJp+gd5vm+VtnfzLde7ra5zIYqn2Qd4oAGBNVob85Nja4xAadAiC3z
	WB3dZa715II12IUvnwyCN7KaWgC6vfvDkF0YrpyWdsIbpGKXdzSN9ie3BZWeGoZaVgPe4ru15/TVi
	6NN8d0vAyEBZv0uiCB9nliBwoYbTfq8qioA7hAoovFl4iM8BHuZu7crssgHosXDyl5fOwxgVEMxLV
	jD37D+eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjU9L-0007CR-8a; Sun, 29 Nov 2020 21:22:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjU9J-0007By-6B; Sun, 29 Nov 2020 21:22:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id 7so17180995ejm.0;
 Sun, 29 Nov 2020 13:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8zPXm1FBDR9qfVumeaUOjP3wuQsBIpEAySwImCtGpPc=;
 b=hKr1UKx0pDGx7PEAKapmxdpIOuF2VjB1mXd8MGEMMRIiGtzYAE6nFsiF1BfySdyhEC
 Ur2OuyrAghYdfNvDuTAkcz5yfvgVdYob8+pgIO/nVjWpiC8KY0xUYf8gcNE5fVBhxu36
 yN6szorqQHIgYCA2qV1Cbc01Nqm+I8F6AFSmcoUFARbiXdY7oIrHXzA811OHViAoUYLf
 ys+ysh4t42DKS9ebj1xYv5tWZjf4k8bokJXamj9TlfmYrTRBPBOctAOLMSog57IuXj2W
 Fz34D9ewvbEKTslczDOaWo82Ut1RJDBf70a4jd23jlMAqnnTeWR+5gTcS6kVVogFob/b
 wbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8zPXm1FBDR9qfVumeaUOjP3wuQsBIpEAySwImCtGpPc=;
 b=eRli6Zn7YYOZrimRXHvVw4jIWq6dDqu1Q/JwLrqLHbrZQTdMw+FT8gGBdhOaUDh3ga
 JpMlrMS7hwW8uGFfc/cxCH8Elv1uuw/feKVItMhdqomuD9sqaCPhobI89VT3wiRxLpCM
 AeTUU1TuNFZarnLuXeraAoaA4ftblu2zkFf4jtmukn0YSwmzIlPQacmqo+YOjbecXfMk
 XGVFeWoZAbte4FCaPN7hpdlLW/IcIZxqzE1YNB1j0Wn7UreHcX9uV9rjvyinZjfQ/BI1
 XpUEY9Y0bZVXIs/3X0k4bpQZsKfr+itGbmndgnGvEroLnLzY4w+7vmeId0ycBoICnS7X
 OBCA==
X-Gm-Message-State: AOAM530GePoG2RT4ZkFRPVrVwZHZzweKVYfCcZv/eTPjkHSavF0beduw
 L4sfTwEfNVJVAMOc6+omfA4=
X-Google-Smtp-Source: ABdhPJzevcx/WzHeFiw1cNVO5mrWErqDpdFenCCaJuFtBmfR2FpmE6dpM9+NTHxiR3b2EerILyZfaw==
X-Received: by 2002:a17:906:3899:: with SMTP id
 q25mr2796412ejd.173.1606684943998; 
 Sun, 29 Nov 2020 13:22:23 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z29sm8169733edi.1.2020.11.29.13.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 13:22:23 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.11
Message-ID: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
Date: Sun, 29 Nov 2020 22:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_162225_324537_679B8409 
X-CRM114-Status: GOOD (  24.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please find below the commit for the MediaTek SoC drivers. The most important 
changes are the inclusion of two new drivers. Devapc is an TrustZone interface 
found on the mobile phone chips to identify malicious accesses from bus 
controllers. Apart from that you can find a new power domain driver. We have the 
old scpsys driver for quite some time around, But it has some limitations, that 
we could only overcome with a brand new driver with a new binding. Right now 
these new driver supports mt8192 and mt8183 but the plan is, to move all SoCs to 
the new driver model and later on retire the old driver.

Please beware that I had to create a stable branch to share some include files 
for the driver between the dts64 and this branch.

Regards,
Matthias

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.10-next-soc

for you to fetch changes up to cc6576029aedc79ce87b9fcb22cbd396d47f2852:

   soc: mediatek: mmsys: Use devm_platform_ioremap_resource() (2020-11-28 
00:37:12 +0100)

----------------------------------------------------------------
power-domains:
- add support for new power domain driver.
- add support for mt8183 and mt8192

devapc:
- add support for the devapc device found on mt6779 to identify of
   malicious bus accesses from a controller to a device

mmsys:
- move DDP routing IDs into the driver

cmdq:
- drop timeout handler support as not usefull

scpsys:
- print warning on theoretical error

----------------------------------------------------------------
Chun-Kuang Hu (1):
       soc / drm: mediatek: cmdq: Remove timeout handler in helper function

Enric Balletbo i Serra (5):
       mfd: syscon: Add syscon_regmap_lookup_by_phandle_optional() function.
       dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains 
controller
       dt-bindings: power: Add MT8183 power domains
       soc: mediatek: Add MediaTek SCPSYS power domains
       soc: mediatek: mmsys: Use devm_platform_ioremap_resource()

Matthias Brugger (10):
       MAINTAINERS: change mediatek wiki page
       Merge tag 'ib-mfd-mediatek-v5.11' into HEAD
       Merge tag 'v5.10-next-pm-domains-stable' into HEAD
       soc: mediatek: pm-domains: Add bus protection protocol
       soc: mediatek: pm_domains: Make bus protection generic
       soc: mediatek: pm-domains: Add SMI block as bus protection block
       soc: mediatek: pm-domains: Add extra sram control
       soc: mediatek: pm-domains: Add subsystem clocks
       soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
       soc: mediatek: pm-domains: Add support for mt8183

Neal Liu (2):
       dt-bindings: devapc: add bindings for mtk-devapc
       soc: mediatek: add mt6779 devapc driver

Nicolas Boichat (1):
       soc: mediatek: Check if power domains can be powered on at boot time

Weiyi Lu (3):
       dt-bindings: power: Add MT8192 power domains
       soc: mediatek: pm-domains: Add default power off flag
       soc: mediatek: pm-domains: Add support for mt8192

Yongqiang Niu (1):
       soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h

  .../bindings/power/mediatek,power-controller.yaml  | 293 ++++++++++
  .../devicetree/bindings/soc/mediatek/devapc.yaml   |  58 ++
  MAINTAINERS                                        |   2 +-
  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   3 +-
  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +-
  drivers/mfd/syscon.c                               |  18 +
  drivers/soc/mediatek/Kconfig                       |  21 +
  drivers/soc/mediatek/Makefile                      |   2 +
  drivers/soc/mediatek/mt8173-pm-domains.h           |  94 ++++
  drivers/soc/mediatek/mt8183-pm-domains.h           | 221 ++++++++
  drivers/soc/mediatek/mt8192-pm-domains.h           | 292 ++++++++++
  drivers/soc/mediatek/mtk-cmdq-helper.c             |  41 +-
  drivers/soc/mediatek/mtk-devapc.c                  | 308 +++++++++++
  drivers/soc/mediatek/mtk-infracfg.c                |   5 -
  drivers/soc/mediatek/mtk-mmsys.c                   |  11 +-
  drivers/soc/mediatek/mtk-pm-domains.c              | 614 +++++++++++++++++++++
  drivers/soc/mediatek/mtk-pm-domains.h              | 102 ++++
  drivers/soc/mediatek/mtk-scpsys.c                  |   5 +-
  include/dt-bindings/power/mt8183-power.h           |  26 +
  include/dt-bindings/power/mt8192-power.h           |  32 ++
  include/linux/mfd/syscon.h                         |  11 +
  include/linux/soc/mediatek/infracfg.h              | 107 ++++
  include/linux/soc/mediatek/mtk-cmdq.h              |  10 +-
  include/linux/soc/mediatek/mtk-mmsys.h             |  33 ++
  24 files changed, 2243 insertions(+), 100 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
  create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8183-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
  create mode 100644 include/dt-bindings/power/mt8183-power.h
  create mode 100644 include/dt-bindings/power/mt8192-power.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
