Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE705E92719
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4IVppd8V344Ar3bkirus6eoGxAK9KbfRicLBKUpP9U=; b=GsY3tIL4PjMe1ZogHA3R9wndmO
	+d2eCl+V6xO+q24jFml5f8Xhhe/my6SrbcjE0a8moqFvEDd7adMAgsJlhyZqFl41jrmgffl4L7Y1c
	gtqUL1x9TRr6DvSJiTIY3GLZtHIfAT9FH6zC0yYJ3Qp1eunRaIw0LBUiaqXI/hcVo7lWefYNvh0rq
	R7FcUTxufOZfvaA09E3y8yjqALWPG43DWCvz/+fYhSrJcmxN6SbC+zIoqBNcVSI1o9SXke9nfAuMc
	e2oSb3c6uZSuovXbd8dRWvR2mPzHc/+RUeG+9jvuhxCjlW8Zu2GWbqMZIzLxdNYQAJpm2h8/YSvSx
	2+veUEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoS6p-004CnC-17;
	Thu, 05 Oct 2023 17:25:59 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoS6l-004Cmg-2z
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 17:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696526755; x=1728062755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cf2NOjzwTBeg5I94XYkoXsC1Vz7rqBm+HNjecdWhHZA=;
  b=eNj1x69ELrUTu5vBgO67n3d4r2dWh25uW3kR2sn0st5aBAV/t078bTrX
   rsFo5i+1Z4HgR/8q0qI+IFM/+hJz7ol+orm5/5eczHGIP4pdnPFWeZR1X
   GBaOthbuDTP4cQSpnNLnSzsoOWG4eHuhDgovhuBdZwByilsFjNs7GvuX3
   OZYEmiHanRgPSn4z6vioE2WFIDhT7i7wMyFSWOkheZMF92FgDQafOk/RK
   Ww2OuWQIJ3I10SO1W71RCwJGIyENm/2BGTRgRwIaKzt0T1Ue8XSkPXiJy
   jEqPpFmS4SzzXSf201VjVyYg10ZKE2OG8ERQZlpx3GjhhPUmLIohNJQ6D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450058726"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="450058726"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 10:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781325899"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="781325899"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Oct 2023 10:25:42 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoS6W-000LiU-27;
	Thu, 05 Oct 2023 17:25:40 +0000
Date: Fri, 6 Oct 2023 01:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: Re: [PATCH v4] wifi: mac80211: add exported tpt_led_trig function
 for softmac driver
Message-ID: <202310060127.50JAGHMk-lkp@intel.com>
References: <ce30818cd336b64ded17f410b594e9c9c1f5f4ee.1696376062.git.yi-chia.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce30818cd336b64ded17f410b594e9c9c1f5f4ee.1696376062.git.yi-chia.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_102556_064550_EFE274A1 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Yi-Chia,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Chia-Hsieh/wifi-mac80211-add-exported-tpt_led_trig-function-for-softmac-driver/20231005-045011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/ce30818cd336b64ded17f410b594e9c9c1f5f4ee.1696376062.git.yi-chia.hsieh%40mediatek.com
patch subject: [PATCH v4] wifi: mac80211: add exported tpt_led_trig function for softmac driver
config: x86_64-randconfig-005-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060127.50JAGHMk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060127.50JAGHMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060127.50JAGHMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/mac80211/rx.o: in function `ieee80211_rx_list':
>> net/mac80211/rx.c:5386: undefined reference to `ieee80211_tpt_led_trig_trx'
   ld: net/mac80211/tx.o: in function `__ieee80211_subif_start_xmit':
>> net/mac80211/tx.c:4337: undefined reference to `ieee80211_tpt_led_trig_trx'
   ld: net/mac80211/tx.o: in function `ieee80211_8023_xmit':
   net/mac80211/tx.c:4668: undefined reference to `ieee80211_tpt_led_trig_trx'


vim +5386 net/mac80211/rx.c

  5263	
  5264	/*
  5265	 * This is the receive path handler. It is called by a low level driver when an
  5266	 * 802.11 MPDU is received from the hardware.
  5267	 */
  5268	void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
  5269			       struct sk_buff *skb, struct list_head *list)
  5270	{
  5271		struct ieee80211_local *local = hw_to_local(hw);
  5272		struct ieee80211_rate *rate = NULL;
  5273		struct ieee80211_supported_band *sband;
  5274		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
  5275		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
  5276	
  5277		WARN_ON_ONCE(softirq_count() == 0);
  5278	
  5279		if (WARN_ON(status->band >= NUM_NL80211_BANDS))
  5280			goto drop;
  5281	
  5282		sband = local->hw.wiphy->bands[status->band];
  5283		if (WARN_ON(!sband))
  5284			goto drop;
  5285	
  5286		/*
  5287		 * If we're suspending, it is possible although not too likely
  5288		 * that we'd be receiving frames after having already partially
  5289		 * quiesced the stack. We can't process such frames then since
  5290		 * that might, for example, cause stations to be added or other
  5291		 * driver callbacks be invoked.
  5292		 */
  5293		if (unlikely(local->quiescing || local->suspended))
  5294			goto drop;
  5295	
  5296		/* We might be during a HW reconfig, prevent Rx for the same reason */
  5297		if (unlikely(local->in_reconfig))
  5298			goto drop;
  5299	
  5300		/*
  5301		 * The same happens when we're not even started,
  5302		 * but that's worth a warning.
  5303		 */
  5304		if (WARN_ON(!local->started))
  5305			goto drop;
  5306	
  5307		if (likely(!(status->flag & RX_FLAG_FAILED_PLCP_CRC))) {
  5308			/*
  5309			 * Validate the rate, unless a PLCP error means that
  5310			 * we probably can't have a valid rate here anyway.
  5311			 */
  5312	
  5313			switch (status->encoding) {
  5314			case RX_ENC_HT:
  5315				/*
  5316				 * rate_idx is MCS index, which can be [0-76]
  5317				 * as documented on:
  5318				 *
  5319				 * https://wireless.wiki.kernel.org/en/developers/Documentation/ieee80211/802.11n
  5320				 *
  5321				 * Anything else would be some sort of driver or
  5322				 * hardware error. The driver should catch hardware
  5323				 * errors.
  5324				 */
  5325				if (WARN(status->rate_idx > 76,
  5326					 "Rate marked as an HT rate but passed "
  5327					 "status->rate_idx is not "
  5328					 "an MCS index [0-76]: %d (0x%02x)\n",
  5329					 status->rate_idx,
  5330					 status->rate_idx))
  5331					goto drop;
  5332				break;
  5333			case RX_ENC_VHT:
  5334				if (WARN_ONCE(status->rate_idx > 11 ||
  5335					      !status->nss ||
  5336					      status->nss > 8,
  5337					      "Rate marked as a VHT rate but data is invalid: MCS: %d, NSS: %d\n",
  5338					      status->rate_idx, status->nss))
  5339					goto drop;
  5340				break;
  5341			case RX_ENC_HE:
  5342				if (WARN_ONCE(status->rate_idx > 11 ||
  5343					      !status->nss ||
  5344					      status->nss > 8,
  5345					      "Rate marked as an HE rate but data is invalid: MCS: %d, NSS: %d\n",
  5346					      status->rate_idx, status->nss))
  5347					goto drop;
  5348				break;
  5349			case RX_ENC_EHT:
  5350				if (WARN_ONCE(status->rate_idx > 15 ||
  5351					      !status->nss ||
  5352					      status->nss > 8 ||
  5353					      status->eht.gi > NL80211_RATE_INFO_EHT_GI_3_2,
  5354					      "Rate marked as an EHT rate but data is invalid: MCS:%d, NSS:%d, GI:%d\n",
  5355					      status->rate_idx, status->nss, status->eht.gi))
  5356					goto drop;
  5357				break;
  5358			default:
  5359				WARN_ON_ONCE(1);
  5360				fallthrough;
  5361			case RX_ENC_LEGACY:
  5362				if (WARN_ON(status->rate_idx >= sband->n_bitrates))
  5363					goto drop;
  5364				rate = &sband->bitrates[status->rate_idx];
  5365			}
  5366		}
  5367	
  5368		if (WARN_ON_ONCE(status->link_id >= IEEE80211_LINK_UNSPECIFIED))
  5369			goto drop;
  5370	
  5371		status->rx_flags = 0;
  5372	
  5373		kcov_remote_start_common(skb_get_kcov_handle(skb));
  5374	
  5375		/*
  5376		 * Frames with failed FCS/PLCP checksum are not returned,
  5377		 * all other frames are returned without radiotap header
  5378		 * if it was previously present.
  5379		 * Also, frames with less than 16 bytes are dropped.
  5380		 */
  5381		if (!(status->flag & RX_FLAG_8023))
  5382			skb = ieee80211_rx_monitor(local, skb, rate);
  5383		if (skb) {
  5384			if ((status->flag & RX_FLAG_8023) ||
  5385				ieee80211_is_data_present(hdr->frame_control))
> 5386				ieee80211_tpt_led_trig_trx(&local->hw, 0, skb->len);
  5387	
  5388			if (status->flag & RX_FLAG_8023)
  5389				__ieee80211_rx_handle_8023(hw, pubsta, skb, list);
  5390			else
  5391				__ieee80211_rx_handle_packet(hw, pubsta, skb, list);
  5392		}
  5393	
  5394		kcov_remote_stop();
  5395		return;
  5396	 drop:
  5397		kfree_skb(skb);
  5398	}
  5399	EXPORT_SYMBOL(ieee80211_rx_list);
  5400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

