Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB0A606A336
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TjAMkiU3;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CIWH1gDE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fq7yBG2EXssub3S97JK0z+L/pcM8GEbETAN8w1h7jq8=; b=TjAMkiU3NwfH2YM+SKCFhb+rdp
	fYGi87fzfpKT+K6lJmXJphZRVKqbP1/mCi15I7mNhEu1+Ylt9tW1xzyMe2DeoI8zx5U10XzP0sZO/
	FdhptRb+Y0DMMOuSmnSffIa0gj970BD9Biojhsd3Dff4yENUdid8TKOiRhtHFRoArAroMI+Fj75Ty
	3xItGFNrKiGJHio2BCVx2Log5GQ8j+IVcb5REbCsma6Kn267PUttdN/5Mt9W8h6ccaIjH5VD8lRAG
	4Bc5G1eB1CaU9aZy0Sd/2RFWj/6vLxQ+vxmA9QrmRI0o9YIa/5YCwmMK6DZv5iFuQ7/KTp4pej3ro
	R/UzQbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmle-00000004Bda-1VtA;
	Tue, 10 Nov 2026 14:24:10 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmlc-00000004Bbl-1JMk;
	Tue, 10 Nov 2026 14:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794320649; x=1825856649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dz6xB3nsXb84v6j5VtTKjJDy0mJj1gdNzuH6mAq71Ss=;
  b=CIWH1gDEOVBTWAgtV9hWb+r3MD5xT6JM/HJYMIqZMwNmTcOuBeShchLx
   kTGFMSzdKdLDeRX0OYoXRn2eW/9NXh3Uj4doetBG3Nm6wvuMXwdAqOlnh
   IRPeC13GHQjbd+dvqXsFUNq4ECEtDFuyflQf6jj9LhvljilXAqnbLlMiD
   pe0XoLes6SzjjF6M/KSjY44/fLSaq/H3h30qRl0bxRMVM4aBoDo2pKFYt
   rBxwwnhfm843BuToxf2kIrbfEQc30pbWKi6G0XRCVOtxSS3dyqMcRfelt
   DZ4pbGcx3Y1UHOIdRdHeVEw7D05rGvdL4hZGhqVU/WPWzebcQI1o2u2hq
   A==;
X-CSE-ConnectionGUID: Q/ycgDIBQ/u7v4MgEb9fzA==
X-CSE-MsgGUID: UsRcdw5IQ02QkvzyRrhnKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065734"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3065734"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:24:08 -0800
X-CSE-ConnectionGUID: 1yUDu6o1R2Co+TQB5tXA8g==
X-CSE-MsgGUID: HgVuWmi6QhWzn+a9bSH62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8467520"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 06:24:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7D26C99; Tue, 10 Nov 2026 15:24:03 +0100 (CET)
Date: Tue, 10 Nov 2026 15:24:03 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c
 and internalize interrupt work
Message-ID: <20261110142403.GB259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-3-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062408_368484_ADF1BF82 
X-CRM114-Status: GOOD (  32.80  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:48:50PM +0800, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI and ICM support as a separate
> driver, clean up internal helper functions so that they do not need to
> be exported:
> 
> nhi_mailbox_cmd() and nhi_mailbox_mode() are only used by the Intel
> firmware Connection Manager (icm.c) to exchange mailbox commands with
> firmware running on Intel PCIe NHIs. The Thunderbolt core framework,
> software connection manager, and non-PCIe platform controllers do
> not use this mailbox interface. Move both functions into icm.c and
> mark them static.
> 
> nhi_interrupt_work was previously initialized in pci.c within
> nhi_pci_init_msi(), requiring it to be visible across files. Move
> INIT_WORK(&nhi->interrupt_work, ...) into tb_nhi_probe() so that
> the workqueue item is initialized by the NHI core and
> nhi_interrupt_work() can be marked static in nhi.c.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> new patch
> ---
>  drivers/thunderbolt/icm.c | 59 ++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi.c | 64 ++-------------------------------------
>  drivers/thunderbolt/nhi.h |  3 --
>  drivers/thunderbolt/pci.c |  2 --
>  4 files changed, 62 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index a295a5e6cc9c..736f551cd567 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -45,6 +45,7 @@
>  #define ICM_RETRIES			3
>  #define ICM_APPROVE_TIMEOUT		10000	/* ms */
>  #define ICM_MAX_LINK			4
> +#define ICM_MAILBOX_TIMEOUT		500 /* ms */
>  
>  static bool start_icm;
>  module_param(start_icm, bool, 0444);
> @@ -269,6 +270,64 @@ static int pcie2cio_write(struct icm *icm, enum tb_cfg_space cs,
>  	return pci2cio_wait_completion(icm, 5000);
>  }
>  
> +/**
> + * nhi_mailbox_cmd() - Send a command through NHI mailbox
> + * @nhi: Pointer to the NHI structure
> + * @cmd: Command to send
> + * @data: Data to be send with the command
> + *
> + * Sends mailbox command to the firmware running on NHI.
> + *
> + * Return: %0 on success, negative errno otherwise.
> + */
> +static int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
> +{
> +	ktime_t timeout;
> +	u32 val;
> +
> +	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
> +
> +	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> +	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
> +	val |= REG_INMAIL_OP_REQUEST | cmd;
> +	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
> +
> +	timeout = ktime_add_ms(ktime_get(), ICM_MAILBOX_TIMEOUT);
> +	do {
> +		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> +		if (!(val & REG_INMAIL_OP_REQUEST))
> +			break;
> +		usleep_range(10, 20);
> +	} while (ktime_before(ktime_get(), timeout));
> +
> +	if (val & REG_INMAIL_OP_REQUEST)
> +		return -ETIMEDOUT;
> +	if (val & REG_INMAIL_ERROR)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * nhi_mailbox_mode() - Return current firmware operation mode
> + * @nhi: Pointer to the NHI structure
> + *
> + * The function reads current firmware operation mode using NHI mailbox
> + * registers and returns it to the caller.
> + *
> + * Return: &enum nhi_fw_mode.
> + */
> +static enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
> +{
> +	u32 val;
> +
> +	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
> +	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
> +	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
> +
> +	return (enum nhi_fw_mode)val;
> +}
> +
>  static bool icm_match(const struct tb_cfg_request *req,
>  		      const struct ctl_pkg *pkg)
>  {
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index c574c336f25b..1e3a58636d3d 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -35,8 +35,6 @@
>   */
>  #define RING_E2E_RESERVED_HOPID	RING_FIRST_USABLE_HOPID
>  
> -#define NHI_MAILBOX_TIMEOUT	500 /* ms */
> -
>  static bool host_reset = true;
>  module_param(host_reset, bool, 0444);
>  MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
> @@ -964,65 +962,7 @@ int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec)
>  }
>  EXPORT_SYMBOL_GPL(tb_ring_throttling);
>  
> -/**
> - * nhi_mailbox_cmd() - Send a command through NHI mailbox
> - * @nhi: Pointer to the NHI structure
> - * @cmd: Command to send
> - * @data: Data to be send with the command
> - *
> - * Sends mailbox command to the firmware running on NHI.
> - *
> - * Return: %0 on success, negative errno otherwise.
> - */
> -int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
> -{
> -	ktime_t timeout;
> -	u32 val;
> -
> -	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
> -
> -	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> -	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
> -	val |= REG_INMAIL_OP_REQUEST | cmd;
> -	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
> -
> -	timeout = ktime_add_ms(ktime_get(), NHI_MAILBOX_TIMEOUT);
> -	do {
> -		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> -		if (!(val & REG_INMAIL_OP_REQUEST))
> -			break;
> -		usleep_range(10, 20);
> -	} while (ktime_before(ktime_get(), timeout));
> -
> -	if (val & REG_INMAIL_OP_REQUEST)
> -		return -ETIMEDOUT;
> -	if (val & REG_INMAIL_ERROR)
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -/**
> - * nhi_mailbox_mode() - Return current firmware operation mode
> - * @nhi: Pointer to the NHI structure
> - *
> - * The function reads current firmware operation mode using NHI mailbox
> - * registers and returns it to the caller.
> - *
> - * Return: &enum nhi_fw_mode.
> - */
> -enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
> -{
> -	u32 val;
> -
> -	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
> -	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
> -	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
> -
> -	return (enum nhi_fw_mode)val;
> -}
> -
> -void nhi_interrupt_work(struct work_struct *work)
> +static void nhi_interrupt_work(struct work_struct *work)
>  {
>  	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
>  	int value = 0; /* Suppress uninitialized usage warning. */
> @@ -1331,6 +1271,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
>  	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
>  		return -ENOMEM;
>  
> +    INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +

This has weird indent.

>  	nhi_reset(nhi);
>  
>  	/* In case someone left them on. */
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index a36c62c49a5c..3dd6ace6150d 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -27,11 +27,8 @@ enum nhi_mailbox_cmd {
>  	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
>  };
>  
> -int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
> -enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
>  void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
> -void nhi_interrupt_work(struct work_struct *work);
>  irqreturn_t tb_nhi_isr(int irq, void *data);
>  irqreturn_t tb_ring_msix(int irq, void *data);
>  int tb_nhi_probe(struct tb_nhi *nhi);
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 2f0abf4d27a3..275389903090 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -206,8 +206,6 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
>  		if (nvec < 0)
>  			return nvec;
>  
> -		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> -
>  		irq = pci_irq_vector(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> -- 
> 2.45.2

