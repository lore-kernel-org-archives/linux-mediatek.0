Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714EDC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CBZjxhldsg3e/rUv5W9EGoVPxYq7pJz0Cui5thpzTkk=; b=IpIHplLi6lZ7q2E2Vqvo+Rs54O
	SE5Ggryth+0/Yiix91vX62igiu9t8iQP/X06lCjx4VGXC+jA2TiKrguB1ZI564s6MN2s0eSwJK1co
	bUOj55ytXnilbggfTMxkZTmgvE2KG09cPwLcLyJp8GGcV/a4GTKQdO0PZxeSFruUUTt0BjQygLCaM
	XdmhgBinW7HIg/tg7BJBicaIxiucqeGV/dLurQw/OY2HJT6z4R9FuFsLFjc03ydkBxwEXKVnoZrFN
	tZ312NVeDTrIPSN9OebOXJBQmBmgbO/XS+RuMEab6vj4Q71hbo1Mwn2Nu+k0Q0eEGfTlcNZ+WUb39
	IlUt3HBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMlw-00AB3o-1Q;
	Fri, 14 Apr 2023 16:59:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMlt-00AB2t-35;
	Fri, 14 Apr 2023 16:59:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j15so4471506wrb.11;
        Fri, 14 Apr 2023 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491576; x=1684083576;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBZjxhldsg3e/rUv5W9EGoVPxYq7pJz0Cui5thpzTkk=;
        b=RXJ9RVm20sgSeCC/ZIfwFLiK+socgeRbvuHRZ6ZGFJFQvgdGL9rOt53jWp+0zg66kF
         IetC0pDMdQqFUjq1vUQ0yF95SiXHCXr+V97sPnLjLPlEhg7Dver6N6LdIettIpPTXDVd
         nTUHZPgBbJELXqXM5Ez5xiNgGPYcajMFPSMc3fFJxUppnHw1rDNfaSXkauNX0KyFck8L
         TVbG0ycqR0H9wlMQJUsYoJipss+zKdRGob8ISTdDsxzOluarp+deFRch4IqV9Z0xf2I1
         +1v0+pYZs9o0Bp1fUj/wcUHrtx5EnqqyM8/7IkTUJAlsunlttfcMKqSm9FmGlVkn+JDd
         ej0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491576; x=1684083576;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBZjxhldsg3e/rUv5W9EGoVPxYq7pJz0Cui5thpzTkk=;
        b=SqJ+aAPiihKrKkJPHghcRuRJF6J/0AcXdWhFd7LtU3r7fTmNqoynUmOxo3tNwJp1M/
         7y+Gtx394EjywH/bk4rKLaJaNEUriMj5mbDo/an2VeLAWtTzzNLK7frNmco8MDpQ6XmR
         ySRqKrCB6xFQhIq5vy/FxyWkOusUd8GrFJhYoYqPdvlNaSt94z2qLHeYx3XzsDhA/0hp
         XsHnHQbAzaMokXkk5UTpkYOng+imGk5jWHdRkFS1W2Wk1WC20iYgWtEDarDETdjul+4C
         vPAJkOMEbcNOtUlCajw3t+fpZJk7F6DAi4bsOotaEmEhSBUPKHRlhIxHzI45T2mf2dfv
         CF6w==
X-Gm-Message-State: AAQBX9dXchVf6VktwDtN4SFn1DDx4RA1w5ta3XuDOPS0BKt7XAOxPaTN
	nRtTs/cZghtsa+VGdAirN4zXKYexPE8Ueg==
X-Google-Smtp-Source: AKy350YiVv4lb19iJ4ALg0PejO8rvzEV+6Ntrgb6KT6qLozfiV5jxmWD+j30wWG+8GJ3OFrBWOGN5w==
X-Received: by 2002:a5d:4091:0:b0:2ef:af48:7b0e with SMTP id o17-20020a5d4091000000b002efaf487b0emr4413246wrp.69.1681491575693;
        Fri, 14 Apr 2023 09:59:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g2-20020adffc82000000b002cff0e213ddsm3955666wrr.14.2023.04.14.09.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:59:34 -0700 (PDT)
Message-ID: <bc9f7a74-ce12-b323-021c-ff2c0473e979@gmail.com>
Date: Fri, 14 Apr 2023 18:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Roger Lu <roger.lu@mediatek.com>, "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>,
 ye xingchen <ye.xingchen@zte.com.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek SoC driver updates for 6.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_095937_995028_12E414CA 
X-CRM114-Status: GOOD (  14.76  )
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

Please take into account the SoC driver patches for v6.4
In the last round Arnd had some comments, unfortunately not all of the are 
addressed, but I track them and hopefully all of them will be done in the next 
merge window.

Most important changes here is the support of MT6795 for the MMSYS driver. As 
well as mutex support for mt8365 display and mt8195 VPP.

Regards,
Matthias

---
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.3-next-soc

for you to fetch changes up to 5ce5e0d08e340ab13169a5f33ed5f98000891a61:

   soc: mediatek: Kconfig: Add MTK_CMDQ dependency to MTK_MMSYS (2023-04-11 
17:15:10 +0200)

----------------------------------------------------------------
mtk-svs:
smaller coding style changes

mtk-mutex:
- add support for mt8365 display and mt8195 VPP mutex
- add support for more then 32 mods
- use module_platform_driver instead of open coding

mtk-mmsys:
- add support for mt8195 RSZ switching
- add remove function
- use module_platform_driver instead of open coding
- split out mt8173 routing table from the legacy table
- bump up resets in mt8173 to 64
- add support for mt6795 (Helio X10)
- clean-up IS_REACHABLE code for cmdq

----------------------------------------------------------------
Alexandre Mergnat (2):
       dt-bindings: soc: mediatek: specify which compatible requires clocks property
       dt-bindings: soc: mediatek: add display mutex for MT8365 SoC

AngeloGioacchino Del Regno (13):
       soc: mediatek: mtk-mmsys: Add .remove() callback
       soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
       soc: mediatek: mtk-mmsys: Compress of_device_id array entries
       soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
       soc: mediatek: mtk-mutex: Compress of_device_id array entries
       soc: mediatek: mtk-mutex: Replace max handles number with definition
       soc: mediatek: mtk-mutex: Use module_platform_driver() macro
       soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
       soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
       soc: mediatek: mtk-mmsys: Split out MT8173 mmsys DDP routing table
       soc: mediatek: mtk-mmsys: Change MT8173 num_resets to 64
       soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
       soc: mediatek: Kconfig: Add MTK_CMDQ dependency to MTK_MMSYS

Matthias Brugger (1):
       soc: mediatek: mtk-svs: delete node name check

Roger Lu (4):
       soc: mediatek: mtk-svs: use svs get efuse common function
       soc: mediatek: mtk-svs: use common function to disable restore voltages
       soc: mediatek: mtk-svs: fix passing zero to 'PTR_ERR'
       soc: mediatek: mtk-svs: add thermal voltage compensation if needed

Roy-CW.Yeh (4):
       dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
       soc: mediatek: mmsys: add config api for RSZ switching and DCM
       soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
       soc: mediatek: mutex: support MT8195 VPPSYS

Ye Xingchen (1):
       soc: mediatek: mutex: Use dev_err_probe()

  .../bindings/soc/mediatek/mediatek,mutex.yaml      |  22 ++-
  drivers/soc/mediatek/Kconfig                       |   1 +
  drivers/soc/mediatek/mt8173-mmsys.h                |  95 +++++++++
  drivers/soc/mediatek/mt8195-mmsys.h                |  13 ++
  drivers/soc/mediatek/mtk-mmsys.c                   | 195 +++++++++---------
  drivers/soc/mediatek/mtk-mmsys.h                   |   2 +-
  drivers/soc/mediatek/mtk-mutex.c                   | 218 ++++++++++++++-------
  drivers/soc/mediatek/mtk-svs.c                     | 149 ++++++--------
  include/linux/soc/mediatek/mtk-cmdq.h              | 114 +++++++++++
  include/linux/soc/mediatek/mtk-mmsys.h             |   6 +
  include/linux/soc/mediatek/mtk-mutex.h             |  35 ++++
  11 files changed, 596 insertions(+), 254 deletions(-)
  create mode 100644 drivers/soc/mediatek/mt8173-mmsys.h

