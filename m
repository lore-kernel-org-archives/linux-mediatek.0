Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C620C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJpaEqwiXu8n0iRhVUYHISy3kanp6iueHyZ03+C4AyY=; b=u6SwJi4XFHuL01
	vHVcjvqxfradVxHrHwKGAh2zl/1USYUl14tW1RXWIusEZxnirSWuCyF8hfFAcKvQLDzicwVogk/Vc
	UrXREtRMFseCGPM5wAEqrne2Gm0XwpHi0a5X0xY+NWIKbjLL9uWDoDWDt8jgxoIJyqff1vnR5kZ1S
	xfDcRY1CRwwrEdnj+Gyn2rzA/8eH938sOdO8gIER06irTg9XqUajhccgtdDrkYoMb4hsnSq75/n3s
	IpzJjdTd8xNrSKVcx/8E5i9nKR66SjyHhjBhgEL78YaRuCqS87IDpGizkAsFOKL9FxkTfuhh3dzIL
	3wTVc4f1+sBV6W2p7xBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nilhk-007Wys-KA; Sun, 24 Apr 2022 23:31:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nilhB-007WwL-LF; Sun, 24 Apr 2022 23:31:16 +0000
X-UUID: 987afddb421647619a5ef3ce6148eb84-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:66e98fcc-1e04-4a35-bd1f-a1cc7895891f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:fe19efef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 987afddb421647619a5ef3ce6148eb84-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764802031; Sun, 24 Apr 2022 16:31:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 16:28:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Apr 2022 07:28:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 07:28:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <lkp@intel.com>
CC: <angelogioacchino.delregno@collabora.com>, <hverkuil@xs4all.nl>,
 <iommu@lists.linux-foundation.org>, <joro@8bytes.org>,
 <kbuild-all@lists.01.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
 <matthias.bgg@gmail.com>, <mchehab@kernel.org>, <miles.chen@mediatek.com>,
 <will@kernel.org>, <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu/mediatek: fix NULL pointer dereference when
 printing dev_name
Date: Mon, 25 Apr 2022 07:28:45 +0800
Message-ID: <20220424232845.25277-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202204231446.IYKdZ674-lkp@intel.com>
References: <202204231446.IYKdZ674-lkp@intel.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_163113_727717_900881A8 
X-CRM114-Status: GOOD (  11.36  )
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

>Hi Miles,
>
>Thank you for the patch! Perhaps something to improve:
>
>[auto build test WARNING on joro-iommu/next]
>[also build test WARNING on v5.18-rc3 next-20220422]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Miles-Chen/iommu-mediatek-fix-NULL-pointer-dereference-when-printing-dev_name/20220423-070605
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
>config: hexagon-randconfig-r041-20220422 (https://download.01.org/0day-ci/archive/20220423/202204231446.IYKdZ674-lkp@intel.com/config)
>compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
>reproduce (this is a W=1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://github.com/intel-lab-lkp/linux/commit/85771767e503ca60069fe4e6ec2ddb80c7f9bafa
>        git remote add linux-review https://github.com/intel-lab-lkp/linux
>        git fetch --no-tags linux-review Miles-Chen/iommu-mediatek-fix-NULL-pointer-dereference-when-printing-dev_name/20220423-070605
>        git checkout 85771767e503ca60069fe4e6ec2ddb80c7f9bafa
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iommu/
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kernel test robot <lkp@intel.com>
>
>All warnings (new ones prefixed by >>):
>
>>> drivers/iommu/mtk_iommu.c:605:6: warning: variable 'larbdev' is uninitialized when used here [-Wuninitialized]
>           if (larbdev) {
>               ^~~~~~~
>   drivers/iommu/mtk_iommu.c:597:24: note: initialize the variable 'larbdev' to silence this warning
>           struct device *larbdev;
>                                 ^
>                                  = NULL
>   1 warning generated.

Thanks for catching this, I will fix this in next version.

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
