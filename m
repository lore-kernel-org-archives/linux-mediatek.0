Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C393CC4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 08:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B29F61181
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 08:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B29F61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/96TMda8E4ojEU6UOSu/v2sqNXZWWc6LZbIIxA0Cdzk=; b=0V9dHWOK7RtbGZbbYyZ/RVa9UP
	n7qFtl3C6POxnkrmS1Bxi2z+qOISf8RmC/yl5U9UErVTgAlmJd2JQRC2BDET87GaXCNs/nW/chaOZ
	ZEB9FYKP1E/4jqzjB6O9TxFbAfX+LuzcyVyvD26TIOhYxE0k+Vo3maS4P5XFynZSzbiUdOX8lTAEY
	B5DtMwddoWFGBsGYtheygU4PQfM84+rygI+hytAzCzLIvdsx5UVUJXMYAT7CN9tD+86L46kKdj5nn
	S0CitSB4VJVBlPEJVDh2yqUsVh+hmuZJ/byjmhOUWYykHXajY48aUuZLRFjsc2j1qlmheaBycmkad
	Jgvr3VrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBMB-003rUW-J3; Thu, 27 May 2021 08:27:07 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBIX-003ppa-RP; Thu, 27 May 2021 08:23:23 +0000
IronPort-SDR: JDkgsevVHe7/JVweeCasee0rqv8E0ymOjnBoMKKrk7zTR6INzWsoccXRWOnk/Z988Yl36lMNJ0
 WqqRgINg7JLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="263884106"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="263884106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:23:19 -0700
IronPort-SDR: 6Dbe1S41vi/PfqU5I9/mmPBexyuLn5xnamuBsUggtOZavmdxnAcz9zbcSQ8VReaaTGOg41WoPD
 zrfDMfkirZjg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477387908"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:23:17 -0700
Subject: Re: [kbuild-all] Re: [PATCH v8 4/4] arm64: dts: mt8192: add spmi node
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 kernel test robot <lkp@intel.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kbuild-all@lists.01.org,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1622025344-31888-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <202105270021.c336cIqx-lkp@intel.com> <1622081330.22138.0.camel@mtksdaap41>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <d9a87eca-ae28-8da4-d78e-ae2602201648@intel.com>
Date: Thu, 27 May 2021 16:22:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1622081330.22138.0.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_012321_988887_2D30564A 
X-CRM114-Status: GOOD (  24.53  )
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

Hi Hsin-Hsiung,

Thanks for the clarification, the bot can't parse the previous patchset 
from a link,
but can get the base from '--base' option in 
https://git-scm.com/docs/git-format-patch.

Best Regards,
Rong Chen

On 5/27/21 10:08 AM, Hsin-hsiung Wang wrote:
> Hi, Sirs
> Thanks for the review.
> This series is based on Chun-Jie's patches[1].
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=488239
>
> On Thu, 2021-05-27 at 00:46 +0800, kernel test robot wrote:
>> Hi Hsin-Hsiung,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on robh/for-next]
>> [also build test ERROR on mediatek/for-next linus/master v5.13-rc3 next-20210526]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Hsin-Hsiung-Wang/Add-SPMI-support-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
>> config: arm64-randconfig-r016-20210526 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 99155e913e9bad5f7f8a247f8bb3a3ff3da74af1)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/423b4a1660f5157dbac566f9c498c61927f09022
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Hsin-Hsiung-Wang/Add-SPMI-support-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
>>          git checkout 423b4a1660f5157dbac566f9c498c61927f09022
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:299.24-25 syntax error
>>     FATAL ERROR: Unable to parse input tree
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
