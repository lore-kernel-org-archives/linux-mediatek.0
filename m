Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A67C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CZ0mR94UcNRwzJdy6hZjjG35nbIA/4JhGrEA4EFuTvY=; b=AdvE5ux//YCMeqpOxvqVZF+c/g
	MO2jc7RzGq0iKl4XyNj5HiNtzPrWREk7gWmGFutKHM5w+O7AcZu0p/S7JVFD00r9zrTqe8weSgiDH
	A/99MZLV7u+5QRNY8iAB7ToDBiBGhdUWfwkO0uf0fT7npXkDXrUMOLESHcWeKRvpp/OfySiklPuOS
	+wCcrw8D+QyMYNaWfjgEWl/1ceAC4e126r2uuDEiSYEz4K7TUAY/IDUOeANNwfFWdfu2RDCyckONd
	Ls02vKHPCeK0XE63BQDPigKw4lgalcHLTmiJyJvE/7zcxgWEg1vtpxaDKA/MEpIJANJTcekCwTUls
	d35vetcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEQU-00BPqr-1U; Mon, 19 Sep 2022 10:54:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEQB-00BPjk-N1; Mon, 19 Sep 2022 10:54:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id k9so46936241wri.0;
        Mon, 19 Sep 2022 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=CZ0mR94UcNRwzJdy6hZjjG35nbIA/4JhGrEA4EFuTvY=;
        b=DLCjWrOxPK2f0H+PbIL9nC2iE3mBY22Iiel1lj9cZnn1YoEQm+GUYgb23lrrFzLc34
         6S7agCUYOOeBPwINyQEiCtqbA/wvlSTE83H3tWV8svQgcoEc97hHl4TawHPlg9tV1qt4
         ZzNDmcTy5yP6Rc6/SnkxvX8WuHD+dYs8OsiC3WeivEVoTW+M28ZfdP7ErucQBcSXjKxe
         o/H8IF96QnvlAgc4fylaRtVOiyBNDvvOAyeqYLx62YBmCHuB0duIpHc0FpfnmkuIXZn1
         2Xh8xZlTSb+GRsqN1Aye5FmpBliaWQXf88eBcICfgCN+7e383GhnoiIn3usiyfHGoykE
         NpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=CZ0mR94UcNRwzJdy6hZjjG35nbIA/4JhGrEA4EFuTvY=;
        b=nJXGYzUpbbv/Dkwb/QVHA4f+sjQgWlG97/Pqb3UpA3jBH0zgwk+x1ZKj7wuPRo2j9b
         H0Jbeci9CoRAOLCI6RcNzynco2+AQsmOxhnq0M37Umxi88Wt1WjbSjvbWTKPHUJvVDpW
         NTB56oTdZjxaRJw1E1G5RTYHtk+mcLaXrtYX/epIswaVhmnjNKIDX3KGlZgu0GyVKXGz
         YRQtn9qMHqUlKJsjvyyhvR0obGHdX2mo6NadDTQbuiEpuXNs8jVtzRRqTlu5Dh1hJ2q8
         wnqWMXPA+bsh+EN2H0/hZr513cYTTveJ4gvMRi76r/AjgeP1R9U8pHrLJUmkZ5raJEYa
         RTTA==
X-Gm-Message-State: ACrzQf3WikzBRLG4ZZ5OBj4CKwdb/5wt2VnKIisfDwmx7lSJEh1rFYPs
	3YpNm/4EkrHodp2pPsVWwtg=
X-Google-Smtp-Source: AMsMyM5WuGQb/dpvWM/Fp5nw736lQDHyZXjbWoCTvKziJ9HtGOMU/N7SWgQ9nPxpblcVQHg1Zwn72g==
X-Received: by 2002:a05:6000:1788:b0:22b:2ce:c6ae with SMTP id e8-20020a056000178800b0022b02cec6aemr1630868wrg.236.1663584875960;
        Mon, 19 Sep 2022 03:54:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b003a845fa1edfsm21646289wms.3.2022.09.19.03.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:54:34 -0700 (PDT)
Message-ID: <498fe3e5-a237-121a-d500-fbb0994906cb@gmail.com>
Date: Mon, 19 Sep 2022 12:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sen Chu <sen.chu@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 xinlei.lee@mediatek.com
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: soc: MediaTek related SoC diver updates for v6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_035439_973957_09D19AF7 
X-CRM114-Status: GOOD (  11.69  )
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

Hopefully not too late, see below the MediaTek updates for v6.1.

The most important updates are support for the PMIC wrapper on MT8183. MT6795 
got support for the display mutex part and MT8186 for the MDP3 mutex.

Best regards,
Matthias

---

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.0-next-soc

for you to fetch changes up to b404cb45990bf24d41c29fe856aafb0746a7b81f:

   soc: mediatek: Add mmsys func to adapt to dpi output for MT8186 (2022-09-15 
23:50:28 +0200)

----------------------------------------------------------------
pmic-wrapper:
- add support for mt8188

SVS:
- several driver cleanups

power-domain:
- several cleanups of the dt-bindings and driver

mutex:
- add support to mt6795 disp mutex
- add support for mt8186 mdp3 mutex

----------------------------------------------------------------
Allen-KH Cheng (2):
       dt-bindings: soc: mediatek: Add mdp3 mutex support for mt8186
       soc: mediatek: mutex: Add mt8186 mutex mod settings for mdp3

AngeloGioacchino Del Regno (8):
       soc: mediatek: mtk-svs: Switch to platform_get_irq()
       soc: mediatek: mtk-svs: Remove hardcoded irqflags
       soc: mediatek: mtk-svs: Drop of_match_ptr() for of_match_table
       soc: mediatek: mtk-svs: Use devm variant for dev_pm_opp_of_add_table()
       soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
       soc: mediatek: mtk-svs: Use bitfield access macros where possible
       dt-bindings: soc: mediatek: Add display mutex support for MT6795
       soc: mediatek: mutex: Add support for MT6795 Helio X10 display mutex

Christophe JAILLET (1):
       soc: mediatek: pm-domains: Simplify some error message

Jean Delvare (1):
       soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF

Nícolas F. R. A. Prado (1):
       soc: mediatek: mtk-svs: Explicitly include bitfield header

Sen Chu (1):
       dt-bindings: soc: mediatek: pwrap: add compatible for mt8188

Tinghan Shen (3):
       dt-bindings: power: mediatek: Refine multiple level power domain nodes
       dt-bindings: power: mediatek: Support naming power controller node with 
unit address
       dt-bindings: power: mediatek: Update maintainer list

Xinlei Lee (1):
       soc: mediatek: Add mmsys func to adapt to dpi output for MT8186

  .../bindings/power/mediatek,power-controller.yaml  | 135 ++--------
  .../bindings/soc/mediatek/mediatek,mutex.yaml      |   2 +
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
  drivers/soc/mediatek/Kconfig                       |   2 +
  drivers/soc/mediatek/mt8186-mmsys.h                |   6 +
  drivers/soc/mediatek/mtk-mmsys.c                   |  20 ++
  drivers/soc/mediatek/mtk-mutex.c                   |  44 ++++
  drivers/soc/mediatek/mtk-pm-domains.c              |   6 +-
  drivers/soc/mediatek/mtk-pmic-wrap.c               |   2 +-
  drivers/soc/mediatek/mtk-scpsys.c                  |   2 +-
  drivers/soc/mediatek/mtk-svs.c                     | 284 +++++++++++++--------
  include/linux/soc/mediatek/mtk-mmsys.h             |   2 +
  include/linux/soc/mediatek/mtk-mutex.h             |   2 +
  13 files changed, 274 insertions(+), 234 deletions(-)

