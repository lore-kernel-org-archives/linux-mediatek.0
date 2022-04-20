Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xbmtgl2X1Uv9SAT3gaekT1v7ETLgIwWqpozLP7KYGLA=; b=EYFpVwJBinQZl9
	xcl2VAsfT+vycS/i7q/eIixSuGOZ4ZYuhziGaZb1vIz+lLB7E7nH0F9nUkAlHQt9IuSQcvbgz9LaR
	HouhRc/YrZQ7NiF8Lhz2xMo7q5D6b8DGWlH9FH3TsT/VBKM04CcKVl0E3fBgMW5WBQL7hyjp8dEbw
	mClStiPz47FKc8VDWo+6wRZB0Uq9W9+Ur8GHxcvjIyWyUf6gfFpmQa7N9L9o2xp7xjfU/E6ZxDCkr
	rwBhLAJqxP1DhRu4tVeeIFE504zFEXRIqRWm3ouutuoPSe77YjJ4Vfv8TPO/DN7/n23dZEZkZfrEa
	DeD5LwtqDgKAxCT0LMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhCjr-009cTu-6M; Wed, 20 Apr 2022 15:59:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhCjo-009cTE-B8
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 15:59:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F5C7B81F97
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 15:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7987C385A1
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650470364;
 bh=jBfkbPt+WqgrPbEPmDx39QoUW/YAD8qvmYlg9t4Mkzc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mBQ78bcB6jv/eAbe97JJ8+XTsUUv+Fv5eapfmKoPLosoW1/bBsGuUTm+jOMTjqO3Q
 w+7eagVbzzcLB019NsyReCqk3xJTYToZAmHOPSRAHZYwl42QpuisUDVqf6sDZHmV7k
 XGU7KbGQycQ64H92sJMIxZvR6eWjeSsOyIFFGmHOe4ob0U1yRF9hU/y0QMDBWa3EuV
 Jmw38jHt7/c4N6rooAP9Lf4Wn7Qos7KWrEiTrRGPlFaL9/a/XSqYT+ZTc403mzWwN/
 rA3YkxV7gMLeeI/dtXGw4wD4HjhBPcmD+DGJaczdqjoEk2laSBvuhI8NeuvjEMYP0r
 qubCCfPI2bvnA==
Received: by mail-pg1-f175.google.com with SMTP id t4so2007856pgc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 08:59:24 -0700 (PDT)
X-Gm-Message-State: AOAM532wZ/LA4V+c8cfH6grbZTjMkvnYHnOjg/lc/QXDsaD1JUbKsen/
 IF9r0zCN8kpfj+v/pDf+rKjKZ00MNFGAsU+YdEg=
X-Google-Smtp-Source: ABdhPJwonKJxRDyNfYcRX41UD6pJGFn6O6+MW6Tc4OsxbMvkwf4L2igEDcKtGR2bmUF/TGdgM5vT2NCjIxr35hYd7mU=
X-Received: by 2002:a05:6a00:181b:b0:50a:46c6:aa74 with SMTP id
 y27-20020a056a00181b00b0050a46c6aa74mr23988768pfa.15.1650470364221; Wed, 20
 Apr 2022 08:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420090433.20003-1-bo.jiao@mediatek.com>
In-Reply-To: <20220420090433.20003-1-bo.jiao@mediatek.com>
From: Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 20 Apr 2022 08:59:12 -0700
X-Gmail-Original-Message-ID: <CA+SzRW5ZU+riTg3939O10+8Xtoms-i_oGRMFTF_8WBtawV0H_g@mail.gmail.com>
Message-ID: <CA+SzRW5ZU+riTg3939O10+8Xtoms-i_oGRMFTF_8WBtawV0H_g@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7915: dump SER stats through debugfs
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, 
 "lian . chen" <lian.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_085928_720141_8B458642 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, Apr 20, 2022 at 2:05 AM Bo Jiao <bo.jiao@mediatek.com> wrote:
>
> From: Ryder Lee <ryder.lee@mediatek.com>
>
> Grab status of system recovery from firmware.
>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/debugfs.c   | 48 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 +-
>  .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 ++
>  .../net/wireless/mediatek/mt76/mt7915/regs.h  | 18 ++++++-
>  4 files changed, 64 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> index dece0a6..76a6570 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> @@ -45,7 +45,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
>                          mt7915_implicit_txbf_set, "%lld\n");
>
>  /* test knob of system layer 1/2 error recovery */
> -static int mt7915_ser_trigger_set(void *data, u64 val)
> +static int mt7915_fw_ser_set(void *data, u64 val)
>  {
>         enum {
>                 SER_SET_RECOVER_L1 = 1,
> @@ -71,8 +71,47 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
>         return ret;
>  }
>
> -DEFINE_DEBUGFS_ATTRIBUTE(fops_ser_trigger, NULL,
> -                        mt7915_ser_trigger_set, "%lld\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_ser, NULL,
> +                        mt7915_fw_ser_set, "%lld\n");
> +
> +static int
> +mt7915_fw_ser_stats_show(struct seq_file *s, void *data)
> +{
> +       struct mt7915_dev *dev = s->private;
> +       int ret;
> +
> +       /* grab firmware SER stats */
> +       ret = mt7915_mcu_set_ser(dev, 0, 0, 0);
> +       if (ret)
> +               return ret;
> +
> +       msleep(100);
> +
> +       seq_printf(s, "::E  R , SER_STATUS        = 0x%08x\n",
> +                  MT_SWDEF_SER_STATS);
> +       seq_printf(s, "::E  R , SER_PLE_ERR       = 0x%08x\n",
> +                  MT_SWDEF_PLE_STATS);
> +       seq_printf(s, "::E  R , SER_PLE_ERR_1     = 0x%08x\n",
> +                  MT_SWDEF_PLE1_STATS);
> +       seq_printf(s, "::E  R , SER_PLE_ERR_AMSDU = 0x%08x\n",
> +                  MT_SWDEF_PLE_AMSDU_STATS);
> +       seq_printf(s, "::E  R , SER_PSE_ERR       = 0x%08x\n",
> +                  MT_SWDEF_PSE_STATS);
> +       seq_printf(s, "::E  R , SER_PSE_ERR_1     = 0x%08x\n",
> +                  MT_SWDEF_PSE1_STATS);
> +       seq_printf(s, "::E  R , SER_LMAC_WISR6_B0 = 0x%08x\n",
> +                  MT_SWDEF_LAMC_WISR6_BN0_STATS);
> +       seq_printf(s, "::E  R , SER_LMAC_WISR6_B1 = 0x%08x\n",
> +                  MT_SWDEF_LAMC_WISR6_BN1_STATS);
> +       seq_printf(s, "::E  R , SER_LMAC_WISR7_B0 = 0x%08x\n",
> +                  MT_SWDEF_LAMC_WISR7_BN0_STATS);
> +       seq_printf(s, "::E  R , SER_LMAC_WISR7_B1 = 0x%08x\n",
> +                  MT_SWDEF_LAMC_WISR7_BN1_STATS);
> +
> +       return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(mt7915_fw_ser_stats);

I'm thinking we can merge this knob fw_ser_stats into fw_ser to make
it more convenient for use.

>  static int
>  mt7915_radar_trigger(void *data, u64 val)
> @@ -884,6 +923,8 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
>         debugfs_create_file("xmit-queues", 0400, dir, phy,
>                             &mt7915_xmit_queues_fops);
>         debugfs_create_file("tx_stats", 0400, dir, phy, &mt7915_tx_stats_fops);
> +       debugfs_create_file("fw_ser", 0200, dir, dev, &fops_fw_ser);
> +       debugfs_create_file("fw_ser_stats", 0400, dir, dev, &mt7915_fw_ser_stats_fops);
>         debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
>         debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
>         debugfs_create_file("fw_debug_bin", 0600, dir, dev, &fops_fw_debug_bin);
> @@ -897,7 +938,6 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
>                             &mt7915_rate_txpower_fops);
>         debugfs_create_devm_seqfile(dev->mt76.dev, "twt_stats", dir,
>                                     mt7915_twt_stats);
> -       debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
>         if (!dev->dbdc_support || phy->band_idx) {
>                 debugfs_create_u32("dfs_hw_pattern", 0400, dir,
>                                    &dev->hw_pattern);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
