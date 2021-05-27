Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D6BC47082
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 02:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5EC610A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 02:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5EC610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Tp5ZgM7gDGuIlF+7SrRKZiSw+//6CVEp4ltoRN3Bic=; b=NWHlTt+eGWJnNG
	2Ict2y4EwRenFx2Og933yePNgzPiFYZpDIxwlyi1Z0a1jpvp6XROT4+fG27+ujaD6b+utKfSmEEG4
	n9jj9zW/d51vw9cesbV9tDPKqUyhpjNfX+ZYgPGhH4GKBoUaHgRuA2QB6AnVR/077WW/hozz6ujx1
	VdWBpBByQ5KSbnVoS4q6Tmg2Oq+6n5KJpgsmBIBKsSRFtQzDTAv2GwM5wYOyaF3eVOBYtq+9OQDrK
	Q7WyOggZuXrwoZCbn5A8nto1jeWfL/+3+kple1Bo82xhy78Uqo056iGPSTFvHCJfmDE1nHGioKqT/
	uXwWR3scddJxLGUkmcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lm5SW-001gcG-1Q; Thu, 27 May 2021 02:09:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lm5SF-001gVv-KP; Thu, 27 May 2021 02:09:04 +0000
X-UUID: 47eb40e618244474abc82ca745324dd5-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y1NwRKA/u3VyZk5yDpibM8d4jcADHSOdUWDHaiYEFYk=; 
 b=irhwIYjPuRg56l69G4TTPm0KQngtkI4HKyewE63x9Rdo1FRr5ix/Zdt7KD2mDIFn1ys75PqWNpQUEWEFs1xng5nWcC4CBN1VmgKjDCYxW6woOki4hInldDpPBsjDAF0T/koUw9fP9Zfojq/P4OWfFxXxtVc9wen5zWptLGqaiKk=;
X-UUID: 47eb40e618244474abc82ca745324dd5-20210526
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 238885367; Wed, 26 May 2021 19:08:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 19:08:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 10:08:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 10:08:49 +0800
Message-ID: <1622081330.22138.0.camel@mtksdaap41>
Subject: Re: [PATCH v8 4/4] arm64: dts: mt8192: add spmi node
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: kernel test robot <lkp@intel.com>
CC: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <kbuild-all@lists.01.org>,
 <clang-built-linux@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 27 May 2021 10:08:50 +0800
In-Reply-To: <202105270021.c336cIqx-lkp@intel.com>
References: <1622025344-31888-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <202105270021.c336cIqx-lkp@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_190902_769138_CE3EFE92 
X-CRM114-Status: GOOD (  18.32  )
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

Hi, Sirs
Thanks for the review.
This series is based on Chun-Jie's patches[1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=488239

On Thu, 2021-05-27 at 00:46 +0800, kernel test robot wrote:
> Hi Hsin-Hsiung,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on mediatek/for-next linus/master v5.13-rc3 next-20210526]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Hsin-Hsiung-Wang/Add-SPMI-support-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm64-randconfig-r016-20210526 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 99155e913e9bad5f7f8a247f8bb3a3ff3da74af1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/423b4a1660f5157dbac566f9c498c61927f09022
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hsin-Hsiung-Wang/Add-SPMI-support-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
>         git checkout 423b4a1660f5157dbac566f9c498c61927f09022
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:299.24-25 syntax error
>    FATAL ERROR: Unable to parse input tree
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
