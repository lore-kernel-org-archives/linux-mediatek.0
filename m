Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E5BE77173
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 04:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvxmD0iXaSPWys01ocb7BVRzhhB/Vj0kuCf5DD39k4k=; b=GQ3nCmjk8inP3m4IaR+0t6rDlb
	WvQKIcsNmSAXidG7gG/Ygf5autm9W0xwPH+BTpyNiHEkj3gBBbFnZ5PaI6sDixa1eS/VPK2OY+O9w
	67PBLMgfsi6sZMDDpvYp2G6Pm7wsUkCM0+y3S+kApbdtFFu2Ssee1wbzYugRTKw2xvi9AWOHYpYl0
	k97YYi7qWtDQmza0PILeTliD37sbqJN02TpAeF1O/43kPyFlvvj8nLu1aLK5DFzNAxCCqtFVIKyPG
	ratrOIxXKJaViUEg+Oo0SWXd4p/37GECr/5OUFTyL9AhFkDk+r8Wl6QjkHVfg3Z7k9btj0j5e7aTP
	VP2AFcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKV76-00000006Nnz-2NdA;
	Mon, 09 Dec 2024 04:11:16 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKV73-00000006NnR-0wDU
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Dec 2024 04:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717473; x=1765253473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3q6mGylu6FW+f0kFijxV5nWrm1Nnck+Lvc/vZ5ppUT4=;
  b=eMdiyGnKOC5ANtK/BD0SJZvevhVA2yOrpklrI7EPRt0YJiYs8ZJ+btDN
   sBa5KYQrL4w4noEud9XqDRwfv2XrGYKJGEDSfUoWzx0rrDrD2r4IPZRTg
   JS0SqGepoEjNXonqbS+cID2kecUm3Jc6PbnNrv6NyKVrawtuqyQm7g/kU
   pwzuiIhxaPxrZlHMoneyZthC6pje48JGkin18PW6bEl4TsiaBzyXSjhOf
   +8e5O3o9+3oXQTOfbnm1nanlpIobdAuNVrcftIHnok3wiFnqrMaqyNMNs
   9YrkG4y7RqHaZrbEKe0vPpuXcTzJckyCeZpnS/qo67knVMjEVOgBuxZpL
   g==;
X-CSE-ConnectionGUID: FopGKNzVS3uVZDqWjNZm2w==
X-CSE-MsgGUID: gWewzluzSbKEMAWsI9WwNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33330657"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33330657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:11:12 -0800
X-CSE-ConnectionGUID: 7067EjQeRFSAwrOZR6V2Kg==
X-CSE-MsgGUID: K7jptP4CRROTw0m+f7TTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100003655"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:11:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV6v-0003nl-0f;
	Mon, 09 Dec 2024 04:11:05 +0000
Date: Mon, 9 Dec 2024 12:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Allan Wang <allan.wang@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com, Sean.Wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Michael.Lo@mediatek.com, Eric-SY.Chang@mediatek.com,
	km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
	posh.sun@mediatek.com, Quan.Zhou@mediatek.com,
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Allan Wang <allan.wang@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: add rfkill_poll for hardware rfkill
Message-ID: <202412071431.tF1EfPaT-lkp@intel.com>
References: <20241206014355.32426-1-allan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206014355.32426-1-allan.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_201113_427433_7CFAB7D9 
X-CRM114-Status: UNSURE (   9.85  )
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

Hi Allan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allan-Wang/wifi-mt76-mt7921-add-rfkill_poll-for-hardware-rfkill/20241206-094523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241206014355.32426-1-allan.wang%40mediatek.com
patch subject: [PATCH] wifi: mt76: mt7921: add rfkill_poll for hardware rfkill
config: powerpc-randconfig-r113-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071431.tF1EfPaT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412071431.tF1EfPaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071431.tF1EfPaT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:69:28: sparse: sparse: cast to restricted __le32

vim +69 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

    17	
    18	int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
    19				      struct sk_buff *skb, int seq)
    20	{
    21		int mcu_cmd = FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
    22		struct mt76_connac2_mcu_rxd *rxd;
    23		int ret = 0;
    24	
    25		if (!skb) {
    26			dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
    27				cmd, seq);
    28			mt792x_reset(mdev);
    29	
    30			return -ETIMEDOUT;
    31		}
    32	
    33		rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
    34		if (seq != rxd->seq)
    35			return -EAGAIN;
    36	
    37		if (cmd == MCU_CMD(PATCH_SEM_CONTROL) ||
    38		    cmd == MCU_CMD(PATCH_FINISH_REQ)) {
    39			skb_pull(skb, sizeof(*rxd) - 4);
    40			ret = *skb->data;
    41		} else if (cmd == MCU_EXT_CMD(THERMAL_CTRL)) {
    42			skb_pull(skb, sizeof(*rxd) + 4);
    43			ret = le32_to_cpu(*(__le32 *)skb->data);
    44		} else if (cmd == MCU_UNI_CMD(DEV_INFO_UPDATE) ||
    45			   cmd == MCU_UNI_CMD(BSS_INFO_UPDATE) ||
    46			   cmd == MCU_UNI_CMD(STA_REC_UPDATE) ||
    47			   cmd == MCU_UNI_CMD(HIF_CTRL) ||
    48			   cmd == MCU_UNI_CMD(OFFLOAD) ||
    49			   cmd == MCU_UNI_CMD(SUSPEND)) {
    50			struct mt76_connac_mcu_uni_event *event;
    51	
    52			skb_pull(skb, sizeof(*rxd));
    53			event = (struct mt76_connac_mcu_uni_event *)skb->data;
    54			ret = le32_to_cpu(event->status);
    55			/* skip invalid event */
    56			if (mcu_cmd != event->cid)
    57				ret = -EAGAIN;
    58		} else if (cmd == MCU_CE_QUERY(REG_READ)) {
    59			struct mt76_connac_mcu_reg_event *event;
    60	
    61			skb_pull(skb, sizeof(*rxd));
    62			event = (struct mt76_connac_mcu_reg_event *)skb->data;
    63			ret = (int)le32_to_cpu(event->val);
    64		} else if (cmd == MCU_EXT_CMD(WF_RF_PIN_CTRL)) {
    65			struct mt7921_wf_rf_pin_ctrl_event *event;
    66	
    67			skb_pull(skb, sizeof(*rxd));
    68			event = (struct mt7921_wf_rf_pin_ctrl_event *)skb->data;
  > 69			ret = (int)le32_to_cpu(event->result);
    70		} else {
    71			skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
    72		}
    73	
    74		return ret;
    75	}
    76	EXPORT_SYMBOL_GPL(mt7921_mcu_parse_response);
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

