Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3EBC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 07:34:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FE5613BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 07:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17FE5613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TtDKg4mu20gfYS/qP2xGIdDI6joX/99TGBRGzoKUTqQ=; b=QLEbEzghv0vNtmsgzCB/Q9qrk
	7saw8IkIxmraSioXFvPB/cnmCH5RLWowsKua5R6eTRs/ttE10oYs/UdAj2IYhVB1qNJTPwsTFuKnX
	p6Ke15zcfermOnUu7cstN4mq7zTQbVMc495cm6x8guwrI81rIHZkUr8Cmvxzhw1aevgIiPmDup+Zp
	9635tE9oRkYJLQbtenQf6I3BtPJzemHqcQnNgoLLaPPy0u4B2GL080LSSzVRiayHwJI2AXQMHjkpX
	j20nKCZ/dWvkzNdT0OQ9Drx+FEW/u6yH/N7NAlGogUrSEyKvvvKDP17WdMntWxVITA8EfxztBfvtb
	Ydeqy0ecg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTgEN-001o2B-St; Tue, 06 Apr 2021 07:34:36 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTgEJ-001o1T-MP
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 07:34:33 +0000
Received: by mail-il1-x133.google.com with SMTP id 6so2586821ilt.9
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1rz64W3qpTMmQiYeFsZQrw5A/71EhMPvbEVoO9GiM8=;
 b=rHnELZY2vTf8uQe6TrlBh1XmoULlKNq81R3ss4YyC+X5JYsXcJwk061jBAWhzWmX80
 TO4cJMaaifaFRL0T2FnIo43ktg9aHkNquZ3ax7LPkd/+kzMHyJ8UK+UjMXvSb5dX+92G
 CJxhQSf4uogc2WsjKIty2WQ2Yc1InBgc9QnlHdxOkacS8720Y9H0Z0+zGSUh88stSrbs
 LnX2gAL/nk3mE9vOaYmSFVuxGomBn8l4HvAWnq+EbY87ibaOkD/kHtweQtb6kTOy2bpI
 kd43+V648onFnBuqXwPaBNfDaqQcoD6D4LkOtULZo3dyIt4C7B9ABPOQ2ofvna7J5CTd
 VdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1rz64W3qpTMmQiYeFsZQrw5A/71EhMPvbEVoO9GiM8=;
 b=tlSOuLllikGvbuuXXCNeNMUTqM3QLZteG9JQS2dhuGjtxEsHFYy4Babu7Aj9qzhma+
 8gFig7WEto58FhOlaOTEW5V9ZzijYx2A+mF54hQsy0j7P71eYHG2Hi9lmcv8Df2qre7o
 PO0ge/zKxzgMg/rOPRBKzbdtlOY3B8lWjDCBoGWff4fvkAtbm29KAVg5TR5uaYrEEpPi
 nKwuy/SHVuWCS1rJkpiQTbjT706WObxemkPYZ4RHqaUs8KtGfFzoCfXWz1zwLdWkOzNx
 6OJbsUdKqlAnp145QMtMdpr/JjIpE0SRyV3ZeIPQAnt/G2CDRsCdwz4+U1MeDZn34ig7
 ++hQ==
X-Gm-Message-State: AOAM531MpPt12kxc35B+gGMK5DWrD74tGSHz38Em4ZXjOsaDdb4M/By5
 h5s0x5UC6LP8tk2PQ12GiaxKAttRn41PQa2ujD5hGg==
X-Google-Smtp-Source: ABdhPJxdpJWc/bqgEpDdB3OhLaSF+VgJma/urmc9afLm5l0TFhPdPsKtb0+1JsfjRBxHm3u0ejmnMoHJFQnXnkQjo74=
X-Received: by 2002:a05:6e02:1b85:: with SMTP id
 h5mr22800336ili.134.1617694470261; 
 Tue, 06 Apr 2021 00:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210405200821.2203458-2-fparent@baylibre.com>
 <202104060814.berYSn6V-lkp@intel.com>
In-Reply-To: <202104060814.berYSn6V-lkp@intel.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 6 Apr 2021 09:34:19 +0200
Message-ID: <CAOwMV_xn2pv1vVoqz5qb+jNsssCKwVtNGG=yEtcA324adau6Rg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: mt8167: add smi_common node
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 kbuild-all@lists.01.org, clang-built-linux@googlegroups.com, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_083431_814120_FF931F2D 
X-CRM114-Status: GOOD (  18.86  )
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

Hi,

I forgot to mention it, but this series depends on
https://patchwork.kernel.org/project/linux-mediatek/patch/20210405172836.2038526-1-fparent@baylibre.com/

On Tue, Apr 6, 2021 at 2:25 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Fabien,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on arm/for-next keystone/next soc/for-next rockchip/for-next arm64/for-next/core shawnguo/for-next clk/clk-next v5.12-rc6 next-20210401]
> [cannot apply to xlnx/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Fabien-Parent/arm64-dts-mediatek-mt8167-add-mmsys-node/20210406-041016
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm64-randconfig-r011-20210406 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 2760a808b9916a2839513b7fd7314a464f52481e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/bbbf216a8432b5af475e4e709bf481475c1af58f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Fabien-Parent/arm64-dts-mediatek-mt8167-add-mmsys-node/20210406-041016
>         git checkout bbbf216a8432b5af475e4e709bf481475c1af58f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> Error: arch/arm64/boot/dts/mediatek/mt8167.dtsi:73.26-27 syntax error
>    FATAL ERROR: Unable to parse input tree
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
