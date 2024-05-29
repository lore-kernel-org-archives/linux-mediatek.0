Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60118C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGo3kLpyoja+O/QvLntG20I+eUuZ/taNVHkIs8KpTZg=; b=1cmYxH0e8EgGCLUN4wB7ocW86t
	TbcEBom47gNlCyWuzef52xlOIIvL8BTRrtY6at6PoXbS100UD38iDnLjgwaEdY9Oi75TGIhjvmOB/
	JKLgvKnwkTST2Cq3jlLKB0lGeWOEkOgXuadyb0sCZ0OLJ3UCJy6WeXhM9GxSvl60SgrSGNzFRBLz0
	7qMzanO0G/B2iwwRSZvlVu2dfrNHzYn7XM8F4uBCDFNL4w4LpgeJnsXXFF1Fk984JSqM3IsIUtIBw
	845ut2Tw9xwK+DOzRMWFHEyDYelLkKrxuGEWjo0W6s6maUeDGxbZjdI/hAcQVRjlxZcpV8tZjQC2f
	NkplNE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCSRB-00000005mqE-446L;
	Wed, 29 May 2024 23:10:29 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCSR8-00000005mpL-2J74
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 23:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717024228; x=1748560228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzWcn7Aw091UVdTPFhmX1lM4t/jWNKg7Zc+z6URoDl4=;
  b=LNvfc+tiv4I/FPJcoRBhZ1vIKr+4sHzXDgIIAb4L52ZDTZ9a2X1bkpU1
   zKs+R9Xt8n3grL8ly1lIgc7THcnrUdUVWi2fsz29LZC2MPhHEauPpLRwa
   7b579IU5k2UuSqakK2jGDNeKSjaDSQziA/pqSa2zOBdH40nnmOkaL2MoT
   tuVVwRH7WsuggJGDSN+NRD6GfDyCHMQd/pqMLMxEY1DSVbSFXRmc6gz4B
   R+R9emLOtZkfjtoo/oW4eij3YO0ZP+0iKUcqQ1pe32hjVtYgwN/jzR5dR
   OKOgbcQkeAnjwN5EfzLhlQaIZHvrNi6hqmMwEM79ECbhXQTT61IfU+If0
   Q==;
X-CSE-ConnectionGUID: LDyuM+smRgeV3PeYyM5r3Q==
X-CSE-MsgGUID: oUNrL7YlR6CS6T5oynypRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="11763897"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="11763897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 16:10:26 -0700
X-CSE-ConnectionGUID: FT9yY/amRni9wzGldubA2g==
X-CSE-MsgGUID: dsspOyF2TfK9+7eXjWqogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35663200"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2024 16:10:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCSR1-000EJ3-0U;
	Wed, 29 May 2024 23:10:19 +0000
Date: Thu, 30 May 2024 07:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek ISO data
 transmission function
Message-ID: <202405300602.AUh9Yu96-lkp@intel.com>
References: <20240529062946.5655-4-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529062946.5655-4-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_161026_729246_E8C5666F 
X-CRM114-Status: GOOD (  11.05  )
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

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20240529]
[cannot apply to bluetooth/master linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-net-add-hci_iso_hdr-function-for-iso-data/20240529-143216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240529062946.5655-4-chris.lu%40mediatek.com
patch subject: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek ISO data transmission function
config: i386-randconfig-014-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300602.AUh9Yu96-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300602.AUh9Yu96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300602.AUh9Yu96-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: btmtk_isopkt_pad
   >>> referenced by btusb.c:2267 (drivers/bluetooth/btusb.c:2267)
   >>>               drivers/bluetooth/btusb.o:(btusb_send_frame) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

