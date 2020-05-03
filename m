Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8682C28CBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:16:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A80B20752
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fml42tSF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tiYAj+gy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A80B20752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcoAZOAXnM0yzZNhmwIgnNsjvHZdaVAx8Tn+eW0YNwQ=; b=fml42tSF+D2TYj
	iCCHZ6m2gdpeMpEs5Jk3ffLF+mmybmqigMiSvBckLSL4YkedWSU5XmsLi3tEwyR5v/yo/9t9hZbGS
	yxtsw4SvNyY70yMXuqTlFoTjveb/Bf3/AIDONP8rDsRJ8N3fTn8rEx+bLftogy/qUjPeUEsS//Zv7
	BH6VELNc3MHHSZkwripodAAfnekGkUuVUkBbO0V3LV1oiYpeL1KDdFQEzKERACq8TypTQaa36y9Kx
	XrLF/JLlVhg+VSVC3M9QxSSJ7okRw2CJ6zLZcvj050fohWCHGfRz4ZgXHyaUr2y5kG3zDEFtugVUu
	CvoM3P8u/QhtaYFJvSvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jV7vl-0006ag-51; Sun, 03 May 2020 06:16:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jV7vK-00064k-JF; Sun, 03 May 2020 06:16:24 +0000
X-UUID: 38fef07c298342d0917903f5b2a3f581-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WxlCRNEd3K/12hGIoH5QpJli1A1K5IiKT1/saoJU2XE=; 
 b=tiYAj+gyvHuwMN6XeJ4cFi0Iw/NDVukQug5t3UkgYaZnrkjjngYxq83IAivwCOaDLkzo8LcF2U+qNYmR5kPz4A/GJw1v8b/KIIGXAUQXzeTs5ZjBq7d6J6xAEyfszXKLVz+yN1sBMRNA6lRGN4c4SuhhwuatdHPD42Gm+xflrsw=;
X-UUID: 38fef07c298342d0917903f5b2a3f581-20200502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1951770861; Sat, 02 May 2020 22:16:21 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 23:13:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 14:13:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 14:13:26 +0800
Message-ID: <1588486406.3197.13.camel@mtkswgap22>
Subject: Re: [PATCH v3 1/5] scsi: ufs: enable WriteBooster on some pre-3.1
 UFS devices
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Sun, 3 May 2020 14:13:26 +0800
In-Reply-To: <1d471d07084d7323f0ef021e2c1b9d4e@codeaurora.org>
References: <20200501143835.26032-1-stanley.chu@mediatek.com>
 <20200501143835.26032-2-stanley.chu@mediatek.com>
 <1d471d07084d7323f0ef021e2c1b9d4e@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C3A9AF1BAE99385AD8A90B9EA8391ECD9F3FF53468BCA1C1D23609DCEDBDBD612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_231622_645576_039101C6 
X-CRM114-Status: GOOD (  28.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Sat, 2020-05-02 at 15:47 +0800, Can Guo wrote:
> Hi Stanley,
> On 2020-05-01 22:38, Stanley Chu wrote:
> > WriteBooster feature can be supported by some pre-3.1 UFS devices
> > by upgrading firmware.
> > 
> > To enable WriteBooster feature in such devices, introduce a device
> > quirk to relax the entrance condition of ufshcd_wb_probe() to allow
> > host driver to check those devices' WriteBooster capability.
> > 
> > WriteBooster feature can be available if below all conditions are
> > satisfied,
> > 
> > 1. Host enables WriteBooster capability
> > 2. UFS 3.1 device or UFS pre-3.1 device with quirk
> >    UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
> > 3. Device descriptor has dExtendedUFSFeaturesSupport field
> > 4. WriteBooster support is specified in above field
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs_quirks.h |  7 ++++
> >  drivers/scsi/ufs/ufshcd.c     | 66 ++++++++++++++++++++++-------------
> >  2 files changed, 48 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs_quirks.h 
> > b/drivers/scsi/ufs/ufs_quirks.h
> > index df7a1e6805a3..e3175a63c676 100644
> > --- a/drivers/scsi/ufs/ufs_quirks.h
> > +++ b/drivers/scsi/ufs/ufs_quirks.h
> > @@ -101,4 +101,11 @@ struct ufs_dev_fix {
> >   */
> >  #define UFS_DEVICE_QUIRK_HOST_VS_DEBUGSAVECONFIGTIME	(1 << 9)
> > 
> > +/*
> > + * Some pre-3.1 UFS devices can support extended features by upgrading
> > + * the firmware. Enable this quirk to make UFS core driver probe and 
> > enable
> > + * supported features on such devices.
> > + */
> > +#define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
> > +
> >  #endif /* UFS_QUIRKS_H_ */
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index 915e963398c4..c6668799d956 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -229,6 +229,8 @@ static struct ufs_dev_fix ufs_fixups[] = {
> >  		UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME),
> >  	UFS_FIX(UFS_VENDOR_SKHYNIX, "hB8aL1" /*H28U62301AMR*/,
> >  		UFS_DEVICE_QUIRK_HOST_VS_DEBUGSAVECONFIGTIME),
> > +	UFS_FIX(UFS_VENDOR_SKHYNIX, "H9HQ21AFAMZDAR",
> > +		UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES),
> > 
> >  	END_FIX
> >  };
> > @@ -6800,9 +6802,19 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba 
> > *hba)
> > 
> >  static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
> >  {
> > +	if (!ufshcd_is_wb_allowed(hba))
> > +		return;
> > +
> > +	if (hba->desc_size.dev_desc <= DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP)
> > +		goto wb_disabled;
> > +
> >  	hba->dev_info.d_ext_ufs_feature_sup =
> >  		get_unaligned_be32(desc_buf +
> >  				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
> > +
> > +	if (!(hba->dev_info.d_ext_ufs_feature_sup & 
> > UFS_DEV_WRITE_BOOSTER_SUP))
> > +		goto wb_disabled;
> > +
> >  	/*
> >  	 * WB may be supported but not configured while provisioning.
> >  	 * The spec says, in dedicated wb buffer mode,
> > @@ -6818,11 +6830,29 @@ static void ufshcd_wb_probe(struct ufs_hba
> > *hba, u8 *desc_buf)
> >  	hba->dev_info.b_presrv_uspc_en =
> >  		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
> > 
> > -	if (!((hba->dev_info.d_ext_ufs_feature_sup &
> > -		 UFS_DEV_WRITE_BOOSTER_SUP) &&
> > -		hba->dev_info.b_wb_buffer_type &&
> > +	if (!(hba->dev_info.b_wb_buffer_type &&
> >  	      hba->dev_info.d_wb_alloc_units))
> > -		hba->caps &= ~UFSHCD_CAP_WB_EN;
> > +		goto wb_disabled;
> > +
> > +	return;
> > +
> > +wb_disabled:
> > +	hba->caps &= ~UFSHCD_CAP_WB_EN;
> > +}
> > +
> > +static void ufs_fixup_device_setup(struct ufs_hba *hba)
> > +{
> > +	struct ufs_dev_fix *f;
> > +	struct ufs_dev_info *dev_info = &hba->dev_info;
> > +
> > +	for (f = ufs_fixups; f->quirk; f++) {
> > +		if ((f->wmanufacturerid == dev_info->wmanufacturerid ||
> > +		     f->wmanufacturerid == UFS_ANY_VENDOR) &&
> > +		     ((dev_info->model &&
> > +		       STR_PRFX_EQUAL(f->model, dev_info->model)) ||
> > +		      !strcmp(f->model, UFS_ANY_MODEL)))
> > +			hba->dev_quirks |= f->quirk;
> > +	}
> >  }
> > 
> >  static int ufs_get_device_desc(struct ufs_hba *hba)
> > @@ -6862,10 +6892,6 @@ static int ufs_get_device_desc(struct ufs_hba 
> > *hba)
> > 
> >  	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
> > 
> > -	/* Enable WB only for UFS-3.1 */
> > -	if (dev_info->wspecversion >= 0x310)
> > -		ufshcd_wb_probe(hba, desc_buf);
> > -
> >  	err = ufshcd_read_string_desc(hba, model_index,
> >  				      &dev_info->model, SD_ASCII_STD);
> >  	if (err < 0) {
> > @@ -6874,6 +6900,13 @@ static int ufs_get_device_desc(struct ufs_hba 
> > *hba)
> >  		goto out;
> >  	}
> > 
> > +	ufs_fixup_device_setup(hba);
> > +
> > +	/* Enable WB only for UFS-3.1 */
> 
> Also update this comment to reflect your change?
> 
> > +	if (dev_info->wspecversion >= 0x310 ||
> > +	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
> > +		ufshcd_wb_probe(hba, desc_buf);
> > +
> 
> Can we somehow move this after ufshcd_tune_unipro_params() or come up 
> with
> a better way to leverage ufshcd_vops_apply_dev_quirks()? I am asking 
> this
> because if we only rely on adding quirks to ufs_fixups in ufshcd.c, the
> table will keep growing and I am sure it will - as flash vendors are 
> trying
> to make their UFS2.1 products to be capable of WB (different densities 
> and
> different NAND processes from different vendors, the combos can be quite 
> a
> few). Meanwhile, some models are specifically made for some customers to
> support WB, meaning having them in the table may not help in a 
> generalized
> way, and it is not like some hot fixes that we have to take, it is just 
> for
> a non-standard feature. If we can leverage 
> ufshcd_vops_apply_dev_quirks(),
> SoC vendors can freely add the quirk without touching ufs_fixups table,
> which means you don't need to update ufs_fixups every time just for 
> adding
> a new model (GKI rules), you can have your own WB white list in vendor
> driver. What do you think?
> 
> Thanks,
> 
> Can Guo.

Very appreciate your useful and constructive comments : )

Please take a look at v4. In v4, I introduce a "fixup_dev_quirks" vop to
allow vendors to "fix" device quirks which can be a general solution not
only for newly introduced UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES but
also for other quirks.

Thanks,
Stanley Chu

> 
> >  	/*
> >  	 * ufshcd_read_string_desc returns size of the string
> >  	 * reset the error value
> > @@ -6893,21 +6926,6 @@ static void ufs_put_device_desc(struct ufs_hba 
> > *hba)
> >  	dev_info->model = NULL;
> >  }
> > 
> > -static void ufs_fixup_device_setup(struct ufs_hba *hba)
> > -{
> > -	struct ufs_dev_fix *f;
> > -	struct ufs_dev_info *dev_info = &hba->dev_info;
> > -
> > -	for (f = ufs_fixups; f->quirk; f++) {
> > -		if ((f->wmanufacturerid == dev_info->wmanufacturerid ||
> > -		     f->wmanufacturerid == UFS_ANY_VENDOR) &&
> > -		     ((dev_info->model &&
> > -		       STR_PRFX_EQUAL(f->model, dev_info->model)) ||
> > -		      !strcmp(f->model, UFS_ANY_MODEL)))
> > -			hba->dev_quirks |= f->quirk;
> > -	}
> > -}
> > -
> >  /**
> >   * ufshcd_tune_pa_tactivate - Tunes PA_TActivate of local UniPro
> >   * @hba: per-adapter instance
> > @@ -7244,8 +7262,6 @@ static int ufshcd_device_params_init(struct 
> > ufs_hba *hba)
> > 
> >  	ufshcd_get_ref_clk_gating_wait(hba);
> > 
> > -	ufs_fixup_device_setup(hba);
> > -
> >  	if (!ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_READ_FLAG,
> >  			QUERY_FLAG_IDN_PWR_ON_WPE, &flag))
> >  		hba->dev_info.f_power_on_wp_en = flag;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
