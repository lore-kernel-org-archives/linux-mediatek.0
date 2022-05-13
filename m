Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=190erTR3ZI3UlUWIz1iMhDHVZhRCCzYvUaRfgOsxv/4=; b=TBt7XT4+L7VkritVrEQC2+DYHH
	VAkmt4nFa3/xcY/OEc3YLGNzTneQc/natn59dRfxbOPYDH4NmetAbdA1go+zBXeC9fSk2kLlYi10m
	SybGu+kG7dWrOHPl+RdmpN8qd4sBCpzKgmvNKLnpA28r3EmLvH3GVYusAPfLIu1zrKLM7j89+zRgN
	ec0ko/QFvtE43ltU96GGRCDeZnAYSYZ0fBiPkTVQL/hWrwAenUhitQmf3kRViUv4ldvMAOB99aY2I
	zXhRhUFgF6ZgWwUQyIQ2ciQZdILOiViF53qBuQ5LnthbjcFi9fpBQRb2H5oaadVgisb8NdQZeqqan
	WXDX0zIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTjM-00FpnY-Oc; Fri, 13 May 2022 11:45:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTjA-00FpjC-QH; Fri, 13 May 2022 11:45:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m62so4640459wme.5;
 Fri, 13 May 2022 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=X5VInsnTlUTFXM4a+ZiHNfR7V1Xk1EraPGvAG2jFB7k=;
 b=e21VeYHXRXJcA15h0Ue5ysMUIj3/H6k/LTP7OB1IGYRjaGpghk4XE0XnT9NCHLJVjB
 Eo0vdYGYHOf5vEDFSDpX/b7taHhiTNNyxcre1E1cwVnWtkx8tSJbufABQ1bpqFGvmikE
 ZFE4+OrKFu3XnV8AFGaTU5sb3AB+FgSIvJdo25hmhmR4lyTp4zVTY6Xg5Oxh3OOIfYut
 oA8SDmW4tnQwQauxQyuyLX8tqIRqVtyrmbcrvufNWO9VSEz7wRkW+wib64Q6RRZENRWH
 M/GTgrNeMNYx77XknoPKRXgvOsQnUm5hzrdHxRJYfHSb3KFl9viTfji8AnNUxy/dUxKJ
 X39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=X5VInsnTlUTFXM4a+ZiHNfR7V1Xk1EraPGvAG2jFB7k=;
 b=YWjxBuU7M6qAAARZo1ypVAmAbm6DR4XRTf28HCeTOAkleJppA4TI8O2XkG8GR5Ids5
 jwgkIp/rD82wljNVouxHDNJRm9KU3LR8rMnobmaDqyWRIbwQpdJQ06Z6LQ/+uJdxSan3
 HPTtMjyS8z6trLSrGGU6a0J/+ZTu5WU3qhHN254/1xbVhUArB6KTkvC8Dn/ahwzmBpIk
 haoo0FsYpW6iisj85DoNU6B+P6yebYEHsE4go42J7ZhO7hILHhBTndQ4Rap7oPUAchZ1
 Av3ElRXgyi4p7FDDEW89mvlyGKZuiFiplFuuEpX0muS6lMvChlUwq8I2r7JF//C3THpr
 tLKg==
X-Gm-Message-State: AOAM530S2rgIgKfX2Oy9eV84jIZqahxy4/4y+YSayGLBJyk6EDU9tNbx
 1OgHHeEpzp+cU7cQOERAjvs=
X-Google-Smtp-Source: ABdhPJz2tKjwkrTa0NPsAS5bP/EIdFegjgq/+MzbdDJ7sHEfFyfsW6YyNfpY3niPS2gU7dOsyUUIMg==
X-Received: by 2002:a7b:cd97:0:b0:38f:f785:ff8 with SMTP id
 y23-20020a7bcd97000000b0038ff7850ff8mr14445008wmj.44.1652442299333; 
 Fri, 13 May 2022 04:44:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfa385000000b0020ce015ed48sm1914945wrb.103.2022.05.13.04.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 04:44:58 -0700 (PDT)
Message-ID: <6412eecf-a4c3-cf06-55ff-9df8b0656d21@gmail.com>
Date: Fri, 13 May 2022 13:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: driver changes for v5.19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_044500_916513_7044E2B9 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Olof,
Hi Arnd,

Please have a look at the driver changes for the MediaTek SoCs. Most important 
change is that we got support for the display mutex and vdosys0 of MT8195. We 
still need to figure out which is the best way to add support for vdosys1. That 
will hopefully ready for the next round. Fingers crossed.

Best regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-soc

for you to fetch changes up to 537f8ffbdf4b9e47e2e21eb8548cdf9cc254c936:

   soc: mediatek: mutex: remove mt8195 MOD0 and SOF0 definition (2022-04-25 
12:46:13 +0200)

----------------------------------------------------------------
mmsys:
- add SW reset to MT8192
- add support for MT8195

pmic wrapper:
- update binding description needed for future MT8195 support

mutex:
- add support for MT8195

cmdq helper:
- remove legacy callback

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       soc: mediatek: mmsys: Add sw0_rst_offset for MT8192

Chun-Kuang Hu (1):
       soc: mediatek: cmdq: Use mailbox rx_callback instead of cmdq_task_cb

Jason-JH.Lin (1):
       soc: mediatek: mutex: remove mt8195 MOD0 and SOF0 definition

Matthias Brugger (1):
       Merge tag 'v5.18-next-vdso0-stable-tag' into v5.18-next/soc

Zhiyong.Tao (1):
       dt-bindings: pwrap: mediatek: Update pwrap document for mt8195

jason-jh.lin (5):
       dt-bindings: arm: mediatek: mmsys: add power and gce properties
       dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
       soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
       soc: mediatek: add mtk-mutex support for mt8195 vdosys0
       soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |  32 ++
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |  10 +-
  drivers/soc/mediatek/mt8167-mmsys.h                |   2 +-
  drivers/soc/mediatek/mt8183-mmsys.h                |   2 +-
  drivers/soc/mediatek/mt8186-mmsys.h                |   4 +-
  drivers/soc/mediatek/mt8192-mmsys.h                |   4 +-
  drivers/soc/mediatek/mt8195-mmsys.h                | 370 +++++++++++++++++++++
  drivers/soc/mediatek/mt8365-mmsys.h                |   4 +-
  drivers/soc/mediatek/mtk-cmdq-helper.c             |  25 +-
  drivers/soc/mediatek/mtk-mmsys.c                   | 153 ++++++++-
  drivers/soc/mediatek/mtk-mmsys.h                   |   6 +
  drivers/soc/mediatek/mtk-mutex.c                   |  92 ++++-
  include/linux/soc/mediatek/mtk-cmdq.h              |   5 +-
  include/linux/soc/mediatek/mtk-mmsys.h             |  12 +
  14 files changed, 662 insertions(+), 59 deletions(-)
  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
