Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AA6F428FF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 06:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMpa/5xxp138fPxjbFyjYcT5P5na7d3pV8ey5lFxG28=; b=O3lCpRxbE358IGu0+hn5sVuPsC
	iccRTN3xX2I6o82DBAzIrd7DZ9tDlR9dX57GynM/YL4rKKE1Kyp1mP1mKCmmYDdt04EaKC/AsIcnz
	F5UgicJh/CHAAvJep3Qp2V3/jLmWk5aQRMxbYaDbC/qy1y2Tr8vXYO1eIOPuM3VqzNfqlyhaCctdk
	l9uD8Qx51dRA6faTR9/b3x63RiiJtpXVABj8fz+TZqfhgnyyHsobFBTTqFVHPByRsJ83vzcpkDGSb
	wR7ZBjWC9qCdzOXsm8pi3E06EfSUlVzVXzktPq5TAuFEfYpVHsh4f5EBPuK5plsezc0F5Xp36O4G6
	qsbmmGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGAU-0000000231b-18KD;
	Thu, 16 Apr 2026 06:25:38 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGAQ-00000002312-26PA
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Apr 2026 06:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776320735; x=1807856735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8CsymCZaGad+OZGIqws32VF9Ro8L7v206gqJodd0NSw=;
  b=S+9jED989n8dOLk9ltiJwf7bJe3mG/M8gJDJOPVDaFfexSicNdxzWAyH
   raF2AkayMeNslNX2EUcxU8vR3QUNEbsREEPQAoOg7/z9pwoLIBJ69uWKw
   jPdniDyl+PyPKIcNbuEDqtDQFWgC1UNN/pG2rPnUiUQyI3l0vRWCxfSkS
   nVePyxFpaAGqOUYS11iSvsV0Pv0ot1oK/nlqC4afjOyM3YfbLadUUNKhx
   7vRFotVwGItqWK2sDApgCDGyIuWaIbRgOTXUlo8POqgaqcHjqtbmqZKah
   wFasKqRvyZud9Wj1PDfjZu17gio9AYkT3jVwwOhftkPhQxQ27fAvq03bs
   g==;
X-CSE-ConnectionGUID: IBVJspo9T/6d3Iv/6M2tRA==
X-CSE-MsgGUID: /K5KUU7LSp+8g8MXecA3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77217577"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77217577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 23:25:34 -0700
X-CSE-ConnectionGUID: G9Cpx52SQIeV1G6+7pq+9g==
X-CSE-MsgGUID: eyY9TVweRgiXQ7pyfSSrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="227978469"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2026 23:25:31 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDGAJ-000000001Li-3r8D;
	Thu, 16 Apr 2026 06:25:27 +0000
Date: Thu, 16 Apr 2026 14:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v3] Bluetooth: btmtk: add event filter to filter specific
 event
Message-ID: <202604161458.dT9HKalR-lkp@intel.com>
References: <20260412090242.1129701-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412090242.1129701-1-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_232534_621334_B9983E92 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v7.0 next-20260415]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btmtk-add-event-filter-to-filter-specific-event/20260415-122458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260412090242.1129701-1-chris.lu%40mediatek.com
patch subject: [PATCH v3] Bluetooth: btmtk: add event filter to filter specific event
config: i386-randconfig-051-20260416 (https://download.01.org/0day-ci/archive/20260416/202604161458.dT9HKalR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161458.dT9HKalR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161458.dT9HKalR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "btmtk_recv_event" [drivers/bluetooth/btusb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

