Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92AECD6E57
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMP7dhLG63YBTQ1UaOyl1cqwmpjKAPuAFmh+nq7GWGQ=; b=XpXMTIyMzV95eafmOzJdG40HQP
	o/dL4WgIH9RFz/C/7qdkaF2anr30tbsKMX1sZx6m/7cNtL+8lNlYwOR7AsR3IVkAK6Ou4vxaB8yII
	MV/4olebJJsM/GWxBVU9GbFQadcMYqwpInN7TssTtX9DgFfRK3djV7T7ZCC3sVZ+W7RfVOzeQw65B
	7dM+m4rMEKYonQTr2oA5dKb7X/9lQ+Wqyz8pUQDduSGCFI2S75TUWErlBnuq4XXg4XdKEQR2P/U5D
	GPkb/69biEwyPfcu446YXT1NxJppeS6+v5makGo03y40g9/5VHVVGGC3BF++ly4+5wSSeLoyVYcLh
	uaqd7JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsBx-0000000Fnq4-0uQO;
	Wed, 03 Jun 2026 20:27:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsBu-0000000FnpW-0X8X
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 20:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780518474; x=1812054474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwTGPsjBah6GvaY4EYLSGeDs8Fkv/GZQKN8WfKQMncQ=;
  b=SZ4a/vS5VtivlrsXVLGa+vK6Q0LZ3+CrLwnnudRAJs3GQIWD4QNc9vwx
   k7c+oe4+RohIKCD1rtglLSehSyKC3rgbyUu5+HILmZ/AkIZ+ptqn1VG8K
   LFn86/D/NVyanLdskgzEg4O4+wI8hHToxrFyE+jsoS0j7qdMtR3EmJ1bh
   xfYktFGX9ac5l7bys+QDdv5RdFhVrjUw9/67P3nMqFg9gbkDSmS0D8ucQ
   /6P7HXJQDG/+JeWs8vGPVxtwG47b32bx1Um/x/d9wnq8NHhcaf7Lyk/dT
   JYcSwoy6gusLASoyfl8nNbjYDgIgoOJfIk5lAufQy3SVSrt13+C8ZIAy4
   w==;
X-CSE-ConnectionGUID: zpcDO1VPQjyf07wVN0Z2bA==
X-CSE-MsgGUID: 7t1JS6XXSQKYjPnoRKN7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="106789444"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="106789444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 13:27:52 -0700
X-CSE-ConnectionGUID: 6vV8yUgjQ4iGVwtO1bkXVg==
X-CSE-MsgGUID: xi91RExKRIWPluvF9+SKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="249263061"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jun 2026 13:27:48 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUsBl-0000000029B-3dO4;
	Wed, 03 Jun 2026 20:27:45 +0000
Date: Wed, 3 Jun 2026 22:27:39 +0200
From: kernel test robot <lkp@intel.com>
To: JB Tsai <jb.tsai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Deren.Wu@mediatek.com, Sean.Wang@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Leon.Yen@mediatek.com, litien.chang@mediatek.com,
	Charlie-cy.Wu@mediatek.com, jb.tsai@mediatek.com
Subject: Re: [PATCH] wifi: mt76: mt7925: add regulatory wiphy self manager
 support
Message-ID: <202606032205.iaSDVq2Z-lkp@intel.com>
References: <20260603075331.1234691-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603075331.1234691-1-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_132754_185160_0B32D192 
X-CRM114-Status: GOOD (  12.82  )
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

Hi JB,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.1-rc6 next-20260602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JB-Tsai/wifi-mt76-mt7925-add-regulatory-wiphy-self-manager-support/20260603-155908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260603075331.1234691-1-jb.tsai%40mediatek.com
patch subject: [PATCH] wifi: mt76: mt7925: add regulatory wiphy self manager support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260603/202606032205.iaSDVq2Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606032205.iaSDVq2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032205.iaSDVq2Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/regd.c:361:43: error: passing 'const struct ieee80211_regdomain *' to parameter of type 'struct ieee80211_regdomain *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     361 |                 return regulatory_set_wiphy_regd(wiphy, &mt7925_regd_ww);
         |                                                         ^~~~~~~~~~~~~~~
   include/net/cfg80211.h:8082:38: note: passing argument to parameter 'rd' here
    8082 |                               struct ieee80211_regdomain *rd);
         |                                                           ^
   1 error generated.


vim +361 drivers/net/wireless/mediatek/mt76/mt7925/regd.c

   286	
   287	int mt7925_regd_update(struct mt792x_phy *phy, char *alpha2)
   288	{
   289		struct wiphy *wiphy = phy->mt76->hw->wiphy;
   290		struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
   291		struct mt792x_dev *dev = mt792x_hw_dev(hw);
   292		struct mt7925_regd_rule *mt7925_rule;
   293		struct mt76_dev *mdev = &dev->mt76;
   294		struct ieee80211_regdomain *regd;
   295		struct ieee80211_reg_rule *rule;
   296		struct mt7925_regd_rule_ev *ev;
   297		int i, num_of_rules = 0;
   298		struct sk_buff *skb;
   299		int ret = 0;
   300	
   301		if (dev->hw_full_reset)
   302			return 0;
   303	
   304		if (!MT7925_REGD_SUPPORTED(phy))
   305			return -EOPNOTSUPP;
   306	
   307		mt792x_mutex_acquire(dev);
   308		skb = mt7925_regd_query_regdb(phy, alpha2);
   309		mt792x_mutex_release(dev);
   310	
   311		if (!skb)
   312			return -EINVAL;
   313	
   314		ev = (struct mt7925_regd_rule_ev *)(skb->data + 4);
   315		num_of_rules = le32_to_cpu(ev->n_reg_rules);
   316	
   317		if (!num_of_rules ||
   318			WARN_ON_ONCE(num_of_rules > NL80211_MAX_SUPP_REG_RULES)) {
   319			ret = -EINVAL;
   320			goto err;
   321		}
   322	
   323		regd = kzalloc(struct_size(regd, reg_rules, num_of_rules), GFP_KERNEL);
   324		if (!regd) {
   325			ret = -ENOMEM;
   326			goto err;
   327		}
   328	
   329		for (i = 0; i < num_of_rules; i++) {
   330			mt7925_rule = &ev->reg_rule[i];
   331			rule = &regd->reg_rules[i];
   332	
   333			rule->freq_range.start_freq_khz =
   334						MHZ_TO_KHZ(mt7925_rule->start_freq);
   335			rule->freq_range.end_freq_khz =
   336						MHZ_TO_KHZ(mt7925_rule->end_freq);
   337			rule->freq_range.max_bandwidth_khz =
   338						MHZ_TO_KHZ(mt7925_rule->max_bw);
   339			/* not used by fw */
   340			rule->power_rule.max_antenna_gain = DBI_TO_MBI(6);
   341			rule->power_rule.max_eirp = DBM_TO_MBM(22);
   342			rule->flags = mt7925_rule->flags;
   343		}
   344	
   345		regd->n_reg_rules = num_of_rules;
   346		regd->dfs_region = ev->dfs_region;
   347	
   348		memcpy(regd->alpha2, alpha2, 2);
   349		memcpy(mdev->alpha2, alpha2, 2);
   350	
   351		dev->regd_change = true;
   352		mt7925_mcu_regd_update(dev, alpha2, ENVIRON_ANY);
   353	
   354		ret = regulatory_set_wiphy_regd(wiphy, regd);
   355	
   356		kfree(regd);
   357	err:
   358		dev_kfree_skb(skb);
   359	
   360		if (ret < 0)
 > 361			return regulatory_set_wiphy_regd(wiphy, &mt7925_regd_ww);
   362	
   363		return ret;
   364	}
   365	EXPORT_SYMBOL_GPL(mt7925_regd_update);
   366	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

