Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05953C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:20:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B9961356
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B9961356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SvjDux3546ntr+AwRJh16/vivAclTAlHIozP3N8fU8s=; b=O29pGpT2dei4jw3oErNrEwxXnE
	VYcVv2HpPjwfsGt1VMeAx/tjiameIhH1Ukni+fjP8r8E55M1vIF25vw5+TGFBFfb2hwHjNjYt69yQ
	Nk9JMa5dpe+Sld3qnZvUSe/6rPdFvsH8OOovhYDODXF8PBmhoRK4KA2KuErB7lqv/i2dfmqh8YIxf
	H16nMO92637wX2mBC15C66lGsrJ7WprQP4iX1eh/K4fhC8O87u2FWbJ9gcJXjZTyL3YSwVmJ0Skoy
	4V5RhT86nCMeAIBMksyMZ5IOse/2HjNyAh9QsnaSgvabg5SQAY4S9fXWPERrZzcAbz/bjBsCBtmm9
	j/A7qJlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRyAx-009ooH-QL; Thu, 01 Apr 2021 14:19:59 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRyAm-009olj-DO; Thu, 01 Apr 2021 14:19:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id u5so3136202ejn.8;
 Thu, 01 Apr 2021 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=mn+zAEfgfvZOPxyZ5lSaKbrrkB5QqVeA9D0gp624xhM=;
 b=oKPwlmnXhSKou2CFeMozxerGBzoLUUiHzspIx48KKx01gSQzGdnABjqfq2auaIWnV9
 b3h0Um/jk92NuC7yPu0lWT+GdmQVT5oxXy8xuLKAg1eWdHYt4R+56DWwijfMwvA0TEli
 ObEdx4Ig4A3SzjE7Wu3gEy4IQuaitPQr077A01JiGz5a0xuh/nXXIA0bUX90S9aKFd17
 qBtdCbJlQD2bkECQe2whOM/QitsNTBDffeUDAeIHHTiTFsZT+4oVMp2G48h7Itqqsljz
 rAqpLUr8DBW364D7KKzlO5Hv42zThrPa5phGytJ2NsmcZ+Pmbri8YCp4iHdgiEapjztL
 lj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=mn+zAEfgfvZOPxyZ5lSaKbrrkB5QqVeA9D0gp624xhM=;
 b=PaOZKAb24V7E4AF5LlgpfXmQzkcnXaUjeX24imfT7mh4X7NwOoB6n/Qz8KVC7YJfYq
 cOuwB8c2xEuGZaP/MVgE8Hmhl0xxie+8Zmr7z2Mmt4gkYMtnEWZ/v8PkQdyL6RZT2WzY
 BWwbLJqzkxwto+kdkZSyydu92PDkImUJ99hqszusdw5YcTQb5NQquxdGAMbw92vyUkYc
 pBaNRhLWJ9u/NFge562cNyTBnMEU4ROHY4g3cLp68Z/Hd698JcD/0mABTY5c3OoSqkS8
 54ui401HHts8kj5H4nPzWE8oFxKfyvJMgUdtyJdoddW5QABMazOVUCoevTKGFpqUg235
 AJQQ==
X-Gm-Message-State: AOAM533sIqSCF1Sym+peQOBdYpFgnrLkrikZ0v+W9q9PKY1dxMPiDv7A
 JlYcIMSD6bPCDVuj57plX+8=
X-Google-Smtp-Source: ABdhPJzq7fC7fowvOWX05Xwy8o65MMSUt9l/0HJoJywwksfcE1zr8cu5t1bWELd63DqCqS5y+MXolw==
X-Received: by 2002:a17:907:94cc:: with SMTP id
 dn12mr9422447ejc.177.1617286787716; 
 Thu, 01 Apr 2021 07:19:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id i10sm2826660ejv.106.2021.04.01.07.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 07:19:47 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, CK HU <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.13
Message-ID: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
Date: Thu, 1 Apr 2021 16:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_151948_708953_9D6D386D 
X-CRM114-Status: GOOD (  18.99  )
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

Below you can find the changes for the SoC drivers. After we fixed in the last
round the power management domain driver. This time it is the MMSYS driver. Up
to now it held one big table with routing information for all SoCs. But that's
not practical over time, so that was splitten up to add only per SoC structures.
That should make it easier in the future to add support for new SoCs. At least
one series didn't hit mainline this time, but should be ready for the next round.

Please take the patches into account for your pull request.

Regards,
Matthias

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-soc

for you to fetch changes up to 60d93f64a851d276b23b7ef68ddc638258485d32:

  soc: mediatek: pm-domains: Add a power domain names for mt8167 (2021-04-01
11:36:04 +0200)

----------------------------------------------------------------
- add MT8183 support to mutex driver

MMSYS:
- use per SoC array to describe the possible routing
- add support for MT8183

Power management domains:
- fix the case of a domain fails to get added
- add names for each power domain to make debugging easier

PMIC wrapper:
- add support for PMIC wrapper with integrated arbiter
- add support for MT8192/MT6873

----------------------------------------------------------------
CK Hu (2):
      soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
      soc: mediatek: mmsys: Use an array for setting the routing registers

Enric Balletbo i Serra (5):
      soc: mediatek: pm-domains: Fix missing error code in scpsys_add_subdomain()
      soc: mediatek: pm-domains: Add a meaningful power domain name
      soc: mediatek: pm-domains: Add a power domain names for mt8183
      soc: mediatek: pm-domains: Add a power domain names for mt8192
      soc: mediatek: pm-domains: Add a power domain names for mt8167

Hsin-Hsiung Wang (4):
      soc: mediatek: pwrap: use BIT() macro
      soc: mediatek: pwrap: add arbiter capability
      dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
      soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs

Hsin-Yi Wang (1):
      soc: mediatek: mmsys: Add mt8183 mmsys routing table

Wei Yongjun (1):
      soc: mediatek: Make symbol 'mtk_mutex_driver' static

Yongqiang Niu (1):
      soc: mediatek: add mtk mutex support for MT8183

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mt8167-pm-domains.h           |   7 +
 drivers/soc/mediatek/mt8173-pm-domains.h           |  10 +
 drivers/soc/mediatek/mt8183-mmsys.h                |  54 ++++
 drivers/soc/mediatek/mt8183-pm-domains.h           |  15 +
 drivers/soc/mediatek/mt8192-pm-domains.h           |  21 ++
 drivers/soc/mediatek/mtk-mmsys.c                   | 303 +++------------------
 drivers/soc/mediatek/mtk-mmsys.h                   | 215 +++++++++++++++
 drivers/soc/mediatek/mtk-mutex.c                   |  52 +++-
 drivers/soc/mediatek/mtk-pm-domains.c              |  11 +-
 drivers/soc/mediatek/mtk-pm-domains.h              |   2 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               |  97 ++++++-
 12 files changed, 511 insertions(+), 277 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
