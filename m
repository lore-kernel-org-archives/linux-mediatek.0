Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC15C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1UUHHVos0jFdKJsKW0xAE0VcVvyJV9rSGyn+nYfI04=; b=zTUKhNbse6r2dWt2y/5Yh6WiDT
	NSk0+W5f6NYdM5/iPUIGtY0JOC5lqgwAKXU/tdjvZqxQOQNCqNTCidakaX0IyYgE+Bi27Th1fmJB9
	ChN0fwyJCv2U0E9nU8ZYvQvR8zsnti2Y7pu9vUDGIWNI6sCu1NhIm3BuhGii26qVAXL4aX4uiQ23T
	wS1pBRP6t7ECbQldFCJCs5yRe0DNmLVdsn87L8nfOpuGGphN7Tt+QQtnMkRJtkivlxQfQDCqnOi51
	eWmeSoj7F5KBVf9DGFNp/s28x1cD59g3oIRB9gcD3Rhw0BXC8DQfe1DhMUsgp5BP4NRYUyTLO2Cg9
	Hjsc95LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsPw-0000000B6wA-1xNL;
	Thu, 27 Jun 2024 16:56:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsPt-0000000B6vo-25aw
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 16:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719507374; x=1751043374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXnUP+Q4ipMZHMdFaly9rDmGwdmTVd9/H6CA/PJ6e9g=;
  b=mrSchKrshCwg0tvfnXSiLQrW+w0X5whGQDwyswMKSkfp2QD8RmQ7UqbB
   86AHxZyrh9UKFipL/Z3je6Hy7X/XZSz4quKAq13o/iqcPZFg2S6+ORLrP
   fRyURy5VH6IjMyEWR9du06xMb7Shl5bE9mmyLP5MBz4lRam4osMPXFLU2
   L40ZHYvB0INs3mx7WNg2dqtxgb1V9vLtNrwXgOJ9szHSodK1n1TGiztqL
   +fMEs1lDPLtnn/BAdXBdmwHrs4IoPdRb615nA428Lot6ZhR3I4nQc9Cb5
   zJdmMsujT0TYpOW4Iq4azXu5sBN0pLolJWulNU4V0U2OOqDRiKTPls5Pj
   g==;
X-CSE-ConnectionGUID: 19OVVV6nSHykWvFf+SWeRw==
X-CSE-MsgGUID: Ta2bPLP3SGWCySeHgJHKTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12286786"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="12286786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 09:56:13 -0700
X-CSE-ConnectionGUID: bsmEuNJtTamAJkDBSbSqeA==
X-CSE-MsgGUID: dLAGV4qcSZK0xnMWNIgGbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="45202273"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 09:56:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMsPn-000GMk-1E;
	Thu, 27 Jun 2024 16:56:07 +0000
Date: Fri, 28 Jun 2024 00:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Wang <sean.wang@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v5 8/8] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <202406280003.brf5D1qt-lkp@intel.com>
References: <20240626025329.26424-9-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626025329.26424-9-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_095613_573705_FA4414BF 
X-CRM114-Status: GOOD (  11.06  )
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
[also build test ERROR on next-20240626]
[cannot apply to bluetooth/master linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btusb-mediatek-remove-the-unnecessary-goto-tag/20240626-114003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240626025329.26424-9-chris.lu%40mediatek.com
patch subject: [PATCH v5 8/8] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: i386-buildonly-randconfig-003-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280003.brf5D1qt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280003.brf5D1qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280003.brf5D1qt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:274:17: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
     274 |         return PTR_ERR(-EOPNOTSUPP);
         |                        ^~~~~~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
      49 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                             ^
   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:274:9: error: incompatible integer to pointer conversion returning 'long' from a function with result type 'struct urb *' [-Wint-conversion]
     274 |         return PTR_ERR(-EOPNOTSUPP);
         |                ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +274 drivers/bluetooth/btmtk.h

   270	
   271	static struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
   272					      usb_complete_t tx_complete)
   273	{
 > 274		return PTR_ERR(-EOPNOTSUPP);
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

