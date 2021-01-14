Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D83C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 17:51:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B2C23B40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 17:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B2C23B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npVeqYZKDUMUZ7qL5xt7BWK5VpGcrypx+Xv+oaOwIZE=; b=b49XtpeyeYHPjAhksH/AHXI4e
	/4Nu3YcM5lb9SNpRycL/htLHCIc1EBBzLEwAhz2vf6W6zrREuSEk5OLkGEg4AM6o4SLjfUxo3AZT0
	fn3dZTWAqhTw8xvtE601g+vRgZyrg6AlHJX0Yx0q3fmDROQkzVle34oMsLapMwy3Pl1424vwyxKik
	hKzaiCjp2rI4M2+Yl8bZI7iqqAI60IygBK95PZ1C+G4I2rMfiGs0F/hSGTh2X1Yy0Z2iy7lurszh9
	pICKH34hkVeNhhR+a6ybUDJ7QjshLsIW7z22N1lan1G/pwH7JcSRwVRTatVy7FpFBhT7kjN1pzxNV
	tyc+rU4dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l06mX-0005Ot-E5; Thu, 14 Jan 2021 17:51:37 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l06mV-0005NR-0k; Thu, 14 Jan 2021 17:51:36 +0000
IronPort-SDR: UR+0mGgWPfhl2yWkm58RNvbOENDEaPW4XNjAf1L5uarkcXbqhlH6HMtBShVCgSOIGTL15Z/H9N
 g/iqYDnHTUlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="157592348"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="157592348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:51:26 -0800
IronPort-SDR: JM5SP6LQgZOKNVZyJyEsY3kK018w/FBeXlWQuvkST0gCcuopex4amYMV/RhoPX9ogKdhjh8COL
 KYN6kuMW0KYQ==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="425019005"
Received: from silpixa00400314.ir.intel.com (HELO silpixa00400314)
 ([10.237.222.51])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:51:16 -0800
Date: Thu, 14 Jan 2021 17:51:09 +0000
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH v3 14/19] crypto: qat: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20210114175109.GA8629@silpixa00400314>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
 <20210112014650.10887-15-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112014650.10887-15-allen.lkml@gmail.com>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_125135_223349_BE932C47 
X-CRM114-Status: GOOD (  23.53  )
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
Cc: alexandre.belloni@bootlin.com, aymen.sghaier@nxp.com, heiko@sntech.de,
 qat-linux@intel.com, jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, herbert@gondor.apana.org.au,
 horia.geanta@nxp.com, k.konieczny@samsung.com, schalla@marvell.com,
 krzk@kernel.org, linux-rockchip@lists.infradead.org,
 ludovic.desroches@microchip.com, thomas.lendacky@amd.com, arno@natisbad.org,
 vz@mleia.com, gilad@benyossef.com, gcherian@marvell.com,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>,
 john.allen@amd.com, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

On Tue, Jan 12, 2021 at 07:16:45AM +0530, Allen Pais wrote:
> From: Allen Pais <apais@linux.microsoft.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.

I have two minor comments:
  * Patches to the qat driver have the following headline
        crypto: qat -
  * Checkpatch reports two alignment checks when it is run with --strict:
        CHECK: Alignment should match open parenthesis
        #33: FILE: drivers/crypto/qat/qat_common/adf_isr.c:248:
        +               tasklet_setup(&priv_data->banks[i].resp_handler,
        +                            adf_response_handler);

        CHECK: Alignment should match open parenthesis
        #62: FILE: drivers/crypto/qat/qat_common/adf_sriov.c:57:
        +               tasklet_setup(&vf_info->vf2pf_bh_tasklet,
        +                            adf_vf2pf_bh_handler);

        total: 0 errors, 0 warnings, 2 checks, 83 lines checked

If you prefer I can resubmit this patch with these two changes.

Regards,

-- 
Giovanni

> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/crypto/qat/qat_common/adf_isr.c               |  5 ++---
>  drivers/crypto/qat/qat_common/adf_sriov.c             | 10 +++++-----
>  drivers/crypto/qat/qat_common/adf_transport.c         |  4 ++--
>  .../crypto/qat/qat_common/adf_transport_internal.h    |  2 +-
>  drivers/crypto/qat/qat_common/adf_vf_isr.c            | 11 +++++------
>  5 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/crypto/qat/qat_common/adf_isr.c b/drivers/crypto/qat/qat_common/adf_isr.c
> index c45853463530..bb5251d587eb 100644
> --- a/drivers/crypto/qat/qat_common/adf_isr.c
> +++ b/drivers/crypto/qat/qat_common/adf_isr.c
> @@ -244,9 +244,8 @@ static int adf_setup_bh(struct adf_accel_dev *accel_dev)
>  	int i;
>  
>  	for (i = 0; i < hw_data->num_banks; i++)
> -		tasklet_init(&priv_data->banks[i].resp_handler,
> -			     adf_response_handler,
> -			     (unsigned long)&priv_data->banks[i]);
> +		tasklet_setup(&priv_data->banks[i].resp_handler,
> +			     adf_response_handler);
>  	return 0;
>  }
>  
> diff --git a/drivers/crypto/qat/qat_common/adf_sriov.c b/drivers/crypto/qat/qat_common/adf_sriov.c
> index 8c822c2861c2..591537399edb 100644
> --- a/drivers/crypto/qat/qat_common/adf_sriov.c
> +++ b/drivers/crypto/qat/qat_common/adf_sriov.c
> @@ -24,9 +24,10 @@ static void adf_iov_send_resp(struct work_struct *work)
>  	kfree(pf2vf_resp);
>  }
>  
> -static void adf_vf2pf_bh_handler(void *data)
> +static void adf_vf2pf_bh_handler(struct tasklet_struct *t)
>  {
> -	struct adf_accel_vf_info *vf_info = (struct adf_accel_vf_info *)data;
> +	struct adf_accel_vf_info *vf_info =
> +				from_tasklet(vf_info, t, vf2pf_bh_tasklet);
>  	struct adf_pf2vf_resp *pf2vf_resp;
>  
>  	pf2vf_resp = kzalloc(sizeof(*pf2vf_resp), GFP_ATOMIC);
> @@ -52,9 +53,8 @@ static int adf_enable_sriov(struct adf_accel_dev *accel_dev)
>  		vf_info->accel_dev = accel_dev;
>  		vf_info->vf_nr = i;
>  
> -		tasklet_init(&vf_info->vf2pf_bh_tasklet,
> -			     (void *)adf_vf2pf_bh_handler,
> -			     (unsigned long)vf_info);
> +		tasklet_setup(&vf_info->vf2pf_bh_tasklet,
> +			     adf_vf2pf_bh_handler);
>  		mutex_init(&vf_info->pf2vf_lock);
>  		ratelimit_state_init(&vf_info->vf2pf_ratelimit,
>  				     DEFAULT_RATELIMIT_INTERVAL,
> diff --git a/drivers/crypto/qat/qat_common/adf_transport.c b/drivers/crypto/qat/qat_common/adf_transport.c
> index 5a7030acdc33..03dcbeac25d7 100644
> --- a/drivers/crypto/qat/qat_common/adf_transport.c
> +++ b/drivers/crypto/qat/qat_common/adf_transport.c
> @@ -324,9 +324,9 @@ static void adf_ring_response_handler(struct adf_etr_bank_data *bank)
>  		adf_handle_response(&bank->rings[i]);
>  }
>  
> -void adf_response_handler(uintptr_t bank_addr)
> +void adf_response_handler(struct tasklet_struct *t)
>  {
> -	struct adf_etr_bank_data *bank = (void *)bank_addr;
> +	struct adf_etr_bank_data *bank = from_tasklet(bank, t, resp_handler);
>  	struct adf_hw_csr_ops *csr_ops = GET_CSR_OPS(bank->accel_dev);
>  
>  	/* Handle all the responses and reenable IRQs */
> diff --git a/drivers/crypto/qat/qat_common/adf_transport_internal.h b/drivers/crypto/qat/qat_common/adf_transport_internal.h
> index 501bcf0f1809..aaec7b2bc220 100644
> --- a/drivers/crypto/qat/qat_common/adf_transport_internal.h
> +++ b/drivers/crypto/qat/qat_common/adf_transport_internal.h
> @@ -46,7 +46,7 @@ struct adf_etr_data {
>  	struct dentry *debug;
>  };
>  
> -void adf_response_handler(uintptr_t bank_addr);
> +void adf_response_handler(struct tasklet_struct *t);
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>  int adf_bank_debugfs_add(struct adf_etr_bank_data *bank);
> diff --git a/drivers/crypto/qat/qat_common/adf_vf_isr.c b/drivers/crypto/qat/qat_common/adf_vf_isr.c
> index 38d316a42ba6..1d0ff58fd9b5 100644
> --- a/drivers/crypto/qat/qat_common/adf_vf_isr.c
> +++ b/drivers/crypto/qat/qat_common/adf_vf_isr.c
> @@ -68,9 +68,10 @@ static void adf_dev_stop_async(struct work_struct *work)
>  	kfree(stop_data);
>  }
>  
> -static void adf_pf2vf_bh_handler(void *data)
> +static void adf_pf2vf_bh_handler(struct tasklet_struct *t)
>  {
> -	struct adf_accel_dev *accel_dev = data;
> +	struct adf_accel_dev *accel_dev = from_tasklet(accel_dev, t,
> +						       vf.pf2vf_bh_tasklet);
>  	struct adf_hw_device_data *hw_data = accel_dev->hw_device;
>  	struct adf_bar *pmisc =
>  			&GET_BARS(accel_dev)[hw_data->get_misc_bar_id(hw_data)];
> @@ -138,8 +139,7 @@ static void adf_pf2vf_bh_handler(void *data)
>  
>  static int adf_setup_pf2vf_bh(struct adf_accel_dev *accel_dev)
>  {
> -	tasklet_init(&accel_dev->vf.pf2vf_bh_tasklet,
> -		     (void *)adf_pf2vf_bh_handler, (unsigned long)accel_dev);
> +	tasklet_setup(&accel_dev->vf.pf2vf_bh_tasklet, adf_pf2vf_bh_handler);
>  
>  	mutex_init(&accel_dev->vf.vf2pf_lock);
>  	return 0;
> @@ -216,8 +216,7 @@ static int adf_setup_bh(struct adf_accel_dev *accel_dev)
>  {
>  	struct adf_etr_data *priv_data = accel_dev->transport;
>  
> -	tasklet_init(&priv_data->banks[0].resp_handler, adf_response_handler,
> -		     (unsigned long)priv_data->banks);
> +	tasklet_setup(&priv_data->banks[0].resp_handler, adf_response_handler);
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
