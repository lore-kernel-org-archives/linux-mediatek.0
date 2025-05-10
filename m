Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA4C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 May 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbvKgmDIzYfhjDWFyvpaVKaUsWJ4QUYaau0DfhlfnJc=; b=ceIhv+D4l1b4rDAbMqaZ89Ad9I
	8namDAoRqslJO003Z+8VhJ4Vy23uFZ5HYORFJrWqPjNTsCCXQRlczcVzeJPFs9+DAMfTBvMDeYCCe
	AL4g+GlOWVMSpIQKJnmM3YBjPjuHbx8z8H7QCzJ7t3W8OOOhN9wtUGlEgM5p7A/EUJRwFUbD3HrHM
	VWVPAuhLL52/b+HIHR45ivlsesPDktjb1rIrImYKlSpkD4mNfSTUT7XN/4V+8mBuFE5Kbz9bm7QIT
	RaLsclN23WtD2jP6ivoItj3hBsWhV4B4oDmIvWEuGYEP6M7/tr4/b8kjBahl2zl3uOzXCQRGON2wo
	6rZxIl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkPP-00000005ytc-06al;
	Sat, 10 May 2025 13:38:31 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkPM-00000005ytD-2qQJ
	for linux-mediatek@lists.infradead.org;
	Sat, 10 May 2025 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746884308; x=1778420308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5m2C8fR9ZknTZ3A7QvMU08+G+c0tdzcFjr6VMADeJM=;
  b=DihuKHfBj2bu7/ZP78QPm/dXoXN0YGxMG6raPaktoIlXUfwofapOKBVZ
   tenamIfTYLg8LWuRJ705hi+XS3dkvLrxHQUhyGp/tfOqxUOST9Cw5Kzer
   WIFO1KtBnVZBBwpoN3sl02yvrJdh9nkqZ7Va7xTxUQFF+j4UEk/K4jcqu
   /Zk4MYOXIkzPLompCAEjPyZMD3l3W/wwe1JGJ3+Soqx3+fSwq3GU8YILx
   YI/5eSG9Dwpyonz9Ct+8v4joRYC68z7ueum9bWwZYMm1TfjzgVARS/nrV
   Kek1xmKIGX8gkysUedYvh/81Z0jC1LHi+wjnfTtdSaefm4p2iAoAj7Ksj
   A==;
X-CSE-ConnectionGUID: oX+rmxf7SGuc/79tNHtaHg==
X-CSE-MsgGUID: hyle6J0mQtOUeN67XGVyAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48862855"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48862855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 06:38:21 -0700
X-CSE-ConnectionGUID: xkKtXl9kTkONJvPSU+8ARA==
X-CSE-MsgGUID: 2epkTEa2RyifNRsgD4J+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136585522"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2025 06:38:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDkPA-000D6x-1T;
	Sat, 10 May 2025 13:38:16 +0000
Date: Sat, 10 May 2025 21:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, sean.wang@mediatek.com,
	deren.wu@mediatek.com, mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Michael Lo <michael.lo@mediatek.com>
Subject: Re: [PATCH 2/2] wifi: mt76: mt7925: add test mode support
Message-ID: <202505102153.oOZ0YXsZ-lkp@intel.com>
References: <20250505233618.1951021-2-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505233618.1951021-2-sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_063828_770286_351983C8 
X-CRM114-Status: GOOD (  11.03  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.15-rc5 next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-kernel-org/wifi-mt76-mt7925-add-test-mode-support/20250506-115641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250505233618.1951021-2-sean.wang%40kernel.org
patch subject: [PATCH 2/2] wifi: mt76: mt7925: add test mode support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250510/202505102153.oOZ0YXsZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505102153.oOZ0YXsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505102153.oOZ0YXsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/testmode.c: In function 'mt7925_tm_query':
>> drivers/net/wireless/mediatek/mt76/mt7925/testmode.c:92:38: warning: variable 'evt' set but not used [-Wunused-but-set-variable]
      92 |         struct uni_cmd_testmode_evt *evt;
         |                                      ^~~


vim +/evt +92 drivers/net/wireless/mediatek/mt76/mt7925/testmode.c

    85	
    86	static int
    87	mt7925_tm_query(struct mt792x_dev *dev, struct mt7925_tm_cmd *req,
    88			char *evt_resp)
    89	{
    90		struct mt7925_rftest_cmd cmd;
    91		char *pcmd = (char *)&cmd;
  > 92		struct uni_cmd_testmode_evt *evt;
    93		struct sk_buff *skb = NULL;
    94		int ret = 1;
    95	
    96		memset(pcmd, 0, sizeof(*pcmd));
    97		memcpy(pcmd + 4, (char *)&req->c, sizeof(struct uni_cmd_testmode_ctrl));
    98	
    99		if (*((uint16_t *)req->padding) == MCU_UNI_CMD_TESTMODE_CTRL)
   100			ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_QUERY(TESTMODE_CTRL),
   101							&cmd, sizeof(cmd), true, &skb);
   102		else if (*((uint16_t *)req->padding) == MCU_UNI_CMD_TESTMODE_RX_STAT)
   103			ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_QUERY(TESTMODE_RX_STAT),
   104							&cmd, sizeof(cmd), true, &skb);
   105	
   106		if (ret)
   107			goto out;
   108	
   109		evt = (struct uni_cmd_testmode_evt *)skb->data;
   110	
   111		memcpy((char *)evt_resp, (char *)skb->data + 8, MT7925_EVT_RSP_LEN);
   112	
   113	out:
   114		dev_kfree_skb(skb);
   115	
   116		return ret;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

