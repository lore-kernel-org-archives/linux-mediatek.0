Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1200C6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAk5JGh0yFQ3BW2wn0p539lnCrXAF2Mh3NObLjMtwmo=; b=nDWwjFftn8/7bnkXKrbXEb48Vw
	4lESLpq4utm5xV+7C9+vYAS1OtDO93pVkpKTPphTmP+c8pyu6UTDm0LVwUDMOoh6lxPRpAozg7CHb
	AJpmuqUk8rigY/oAoli+VGUIx2uTLPxxsydDaxpoifEYVyxw2a11lGb6quMpjjnVPfMz/LDnq3yOU
	fVWFBiKtt15DhhH0lS2uPGcqNbcWFCS+hrLUWBzxgFiVWUWloM9LdBWq+Jg4i+3zeTOhuvftTY/Mc
	m9DjLnisaXqE0Q1bfYGh+ypYtSRMLzUtmzZMxAJ4ZqxRk9V4nRtQ18apg39yA6QnxoggA/Q7LqqNj
	XLfppWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oconY-005I1H-OX; Mon, 26 Sep 2022 14:09:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oconA-005Ho5-Oi; Mon, 26 Sep 2022 14:09:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 35017B80AB3;
	Mon, 26 Sep 2022 14:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1049FC43150;
	Mon, 26 Sep 2022 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664201342;
	bh=rqkp6bJXgU7Uu/k1ZisPoN8JNAGp0zmSPs5x+aM9Irs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvAZDPSk/ijQh8WSq5yeRncXQBYeASs3IoqT6uEwHeA3LHD8MOj27K+Jt4sXD4Hsh
	 TJ9ygtRTbdGmqnGVPqBWY3tNCy0tx4qExVdDpetDLYGKXT8vT6697RYuqHDNCIPdzR
	 L+8iQZYEQ1CQaWn6tXCQw+2wL9UBVtGvJcE+xHfIwX/lkiQaP5xP94Spmu/ED/GN+0
	 8pBKDTuoEpmxPHr9RRnS8dmY95bUUu4+rnQsgVRJoqiSYu98AOrKE94jE0ddKjHnv+
	 3sOg5TU2FjKDP2Re0X+kIzTX3E3vBAEU+xs2h0zsBu0+TC32N4JF3meZTQ/Or86Po1
	 Lc4OR56MHPGdg==
Date: Mon, 26 Sep 2022 19:38:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Asutosh Das <quic_asutoshd@quicinc.com>
Cc: quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
	quic_cang@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, quic_richardp@quicinc.com,
	stanley.chu@mediatek.com, adrian.hunter@intel.com,
	bvanassche@acm.org, avri.altman@wdc.com, beanhuo@micron.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jinyoung Choi <j-young.choi@samsung.com>,
	Kiwoong Kim <kwmad.kim@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 01/16] ufs: core: Probe for ext_iid support
Message-ID: <20220926140853.GC101994@thinkpad>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <ff7cdcdef82f6c9d709e2b6ed5d91e255327b780.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff7cdcdef82f6c9d709e2b6ed5d91e255327b780.1663894792.git.quic_asutoshd@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_070905_112731_6721AA65 
X-CRM114-Status: GOOD (  30.35  )
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

On Thu, Sep 22, 2022 at 06:05:08PM -0700, Asutosh Das wrote:
> Task Tag is limited to 8 bits and this restricts the number
> of active IOs to 255.
> In Multi-circular queue mode, this may not be enough.
> The specification provides EXT_IID which can be used to increase
> the number of IOs if the UFS device and UFSHC support it.
> This patch adds support to probe for ext_iid support in
> ufs device and UFSHC.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
> ---
>  drivers/ufs/core/ufshcd.c | 32 ++++++++++++++++++++++++++++++++
>  include/ufs/ufs.h         |  4 ++++
>  include/ufs/ufshcd.h      |  4 ++++
>  include/ufs/ufshci.h      |  7 +++++++
>  4 files changed, 47 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index f4f8ded..4b9ae83 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -88,6 +88,7 @@
>  /* Polling time to wait for fDeviceInit */
>  #define FDEVICEINIT_COMPL_TIMEOUT 1500 /* millisecs */
>  
> +#define EXT_IID_CAP_SHIFT 10
>  #define ufshcd_toggle_vreg(_dev, _vreg, _on)				\
>  	({                                                              \
>  		int _ret;                                               \
> @@ -2239,6 +2240,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
>  	if (err)
>  		dev_err(hba->dev, "crypto setup failed\n");
>  
> +	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
> +	hba->ext_iid_sup = (hba->mcq_capabilities & MASK_EXT_IID_SUPPORT) >>
> +		EXT_IID_CAP_SHIFT;
> +

Can you use FIELD_* macros for the field manipulations throughout the series?
This will avoid the use of additional _SHIFT macros.

>  	return err;
>  }
>  
> @@ -7664,6 +7669,30 @@ static void ufshcd_temp_notif_probe(struct ufs_hba *hba, const u8 *desc_buf)
>  	}
>  }
>  
> +static void ufshcd_ext_iid_probe(struct ufs_hba *hba, u8 *desc_buf)

ufshcd_device_ext_iid_probe?

> +{
> +	struct ufs_dev_info *dev_info = &hba->dev_info;
> +	u32 ext_ufs_feature;
> +	u32 ext_iid_en = 0;
> +	int err;
> +
> +	if (dev_info->wspecversion < 0x400)
> +		goto out;
> +
> +	ext_ufs_feature = get_unaligned_be32(desc_buf + DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
> +

No need of a newline

Thanks,
Mani

> +	if (!(ext_ufs_feature & UFS_DEV_EXT_IID_SUP))
> +		goto out;
> +
> +	err = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
> +				      QUERY_ATTR_IDN_EXT_IID_EN, 0, 0, &ext_iid_en);
> +	if (err)
> +		dev_err(hba->dev, "failed reading bEXTIIDEn. err = %d\n", err);
> +
> +out:
> +	dev_info->b_ext_iid_en = !!ext_iid_en;
> +}
> +
>  void ufshcd_fixup_dev_quirks(struct ufs_hba *hba,
>  			     const struct ufs_dev_quirk *fixups)
>  {
> @@ -7762,6 +7791,9 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
>  
>  	ufshcd_temp_notif_probe(hba, desc_buf);
>  
> +	if (hba->ext_iid_sup)
> +		ufshcd_ext_iid_probe(hba, desc_buf);
> +
>  	/*
>  	 * ufshcd_read_string_desc returns size of the string
>  	 * reset the error value
> diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
> index 1bba3fe..ba2a1d8 100644
> --- a/include/ufs/ufs.h
> +++ b/include/ufs/ufs.h
> @@ -165,6 +165,7 @@ enum attr_idn {
>  	QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
>  	QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
>  	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
> +	QUERY_ATTR_IDN_EXT_IID_EN		= 0x2A,
>  };
>  
>  /* Descriptor idn for Query requests */
> @@ -352,6 +353,7 @@ enum {
>  	UFS_DEV_EXT_TEMP_NOTIF		= BIT(6),
>  	UFS_DEV_HPB_SUPPORT		= BIT(7),
>  	UFS_DEV_WRITE_BOOSTER_SUP	= BIT(8),
> +	UFS_DEV_EXT_IID_SUP		= BIT(16),
>  };
>  #define UFS_DEV_HPB_SUPPORT_VERSION		0x310
>  
> @@ -601,6 +603,8 @@ struct ufs_dev_info {
>  
>  	bool	b_rpm_dev_flush_capable;
>  	u8	b_presrv_uspc_en;
> +	/* UFS EXT_IID Enable */
> +	bool	b_ext_iid_en;
>  };
>  
>  /*
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 7fe1a92..da1eb8a 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -737,6 +737,7 @@ struct ufs_hba_monitor {
>   * @outstanding_lock: Protects @outstanding_reqs.
>   * @outstanding_reqs: Bits representing outstanding transfer requests
>   * @capabilities: UFS Controller Capabilities
> + * @mcq_capabilities: UFS Multi Command Queue capabilities
>   * @nutrs: Transfer Request Queue depth supported by controller
>   * @nutmrs: Task Management Queue depth supported by controller
>   * @reserved_slot: Used to submit device commands. Protected by @dev_cmd.lock.
> @@ -818,6 +819,7 @@ struct ufs_hba_monitor {
>   *	device
>   * @complete_put: whether or not to call ufshcd_rpm_put() from inside
>   *	ufshcd_resume_complete()
> + * @ext_iid_sup: is EXT_IID is supported by UFSHC
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> @@ -859,6 +861,7 @@ struct ufs_hba {
>  
>  	u32 capabilities;
>  	int nutrs;
> +	u32 mcq_capabilities;
>  	int nutmrs;
>  	u32 reserved_slot;
>  	u32 ufs_version;
> @@ -965,6 +968,7 @@ struct ufs_hba {
>  #endif
>  	u32 luns_avail;
>  	bool complete_put;
> +	bool ext_iid_sup;
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
> index f81aa95..ef5c3a8 100644
> --- a/include/ufs/ufshci.h
> +++ b/include/ufs/ufshci.h
> @@ -22,6 +22,7 @@ enum {
>  /* UFSHCI Registers */
>  enum {
>  	REG_CONTROLLER_CAPABILITIES		= 0x00,
> +	REG_MCQCAP				= 0x04,
>  	REG_UFS_VERSION				= 0x08,
>  	REG_CONTROLLER_DEV_ID			= 0x10,
>  	REG_CONTROLLER_PROD_ID			= 0x14,
> @@ -68,6 +69,12 @@ enum {
>  	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
>  	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
>  	MASK_CRYPTO_SUPPORT			= 0x10000000,
> +	MASK_MCQ_SUPPORT			= 0x40000000,
> +};
> +
> +/* MCQ capability mask */
> +enum {
> +	MASK_EXT_IID_SUPPORT = 0x00000400,
>  };
>  
>  #define UFS_MASK(mask, offset)		((mask) << (offset))
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

