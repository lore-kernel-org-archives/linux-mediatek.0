Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D314260A2602
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ppptPRN;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cgpj7mAj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QEilx6ClIxukouIYpCxZMMGhxt3BPIVjJ/jaO2GXxUs=; b=3ppptPRN7FXoEBuGYQzMKk59rc
	9U09b+o5j+/uYu/BmfJnMTPfKYneuYrWz8pZU7gkSgAGRHfUYCa/tLamz74s/uYqo4q4bU+7P8cbb
	rDX9H43WOrupzZrbfYSrc0Dq/xYn9yK+4ydSYYm5YqpRFlVVFMIhu4t0SMhquWN6GK21bMZof3t4o
	/ZmPu19TIZd+hzY+weSxk0tBlO7sbhkpSvUbc25EpuGepmSejC2yvZTRuAvYC9Cn2Fq65McgV24VS
	73hAKZhTQAYMdNT4mev/mitUacKeQ5KHu8thp3YH3BkL4hnxngBdoZWYDOLBeNEd3EIrqwq8mMRre
	cCvXTfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn1z-00000004Eus-2M8K;
	Tue, 10 Nov 2026 14:41:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn1w-00000004Eu0-3CHM;
	Tue, 10 Nov 2026 14:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321661; x=1825857661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3beWCTD/ZW0ya5XumXXSuW4w/qLCbXbTicr7vKWt6Is=;
  b=cgpj7mAj1Uw1ipgiBBXVmCV7IFN3mb8IbfunPyEHMsyNJc+QaF1JBYyP
   AT/gaDdb5+Jwfxum6AsCP8RRmE6PVVhwdYYbFB+2xb7r58HVn/avy9qsK
   zwyTR2B+4yf90yE0K2CD7Dn4xItJiKxkNpe3dot0aLCBhq6jMfmWOv/r9
   2Ra/5DakPiwxgDLDQ4wQtTzEQJFmckx5/8m067JMG2qYhc5CzztLcDxTM
   z+Y3lBLYNUtl7B4ZO3qxDGNq6k3I11lCfYsN8XzjrF15/e1T3Ki0cZqFL
   Mz3EDWtVit9gfbwXyPI4CkrVY9zwv9btFQXdJz23pgSHaRD4rtqlXAsYz
   w==;
X-CSE-ConnectionGUID: k2vXH+KrQE6jrgTnvAd9sA==
X-CSE-MsgGUID: igd1wFdHSPyI1lJmVFmteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2957103"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2957103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:41:00 -0800
X-CSE-ConnectionGUID: gpo7fP8uTBCwKYwmCtWJlw==
X-CSE-MsgGUID: FJkc3b9eTUeNUMqsYlZm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8500198"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2026 06:40:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 095A699; Tue, 10 Nov 2026 15:40:56 +0100 (CET)
Date: Tue, 10 Nov 2026 15:40:56 +0100
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
Subject: Re: [PATCH v2 6/7] thunderbolt: decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261110144056.GE259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-7-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064100_866639_48265301 
X-CRM114-Status: GOOD (  25.36  )
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

On Tue, Nov 10, 2026 at 07:48:54PM +0800, Chunfeng Yun wrote:
> When usb4 is woke up by device disconnect, no need wait for 2s,
> usually the phase2~4 takes at most about 200ms, and enters to
> TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
> treat it as disconnected.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> new changes
> ---
>  drivers/thunderbolt/switch.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 7daee83c7ed8..e12546bfb869 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
>   * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
> - * switch resume). Otherwise we only wait if a device is registered but the link
> - * has not yet been established.
> + * switch resume, Wait at most 400 ms for link to start connecting,

router

> + * if timeout, means the device is disconnected). Otherwise we only wait
> + * if a device is registered but the link has not yet been established.
>   *
>   * Return:
>   * * %0 - If the port is not connected or failed to reach
> @@ -501,6 +502,7 @@ int tb_port_state(struct tb_port *port)
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
>  	int retries = 20;
> +	int unplugged_retries = 4;

Reverse-christmas tree

>  	int state;
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
> @@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  			return 0;
>  
>  		case TB_PORT_UNPLUGGED:
> -			if (wait_if_unplugged) {
> +			if (wait_if_unplugged && unplugged_retries--) {
>  				/* used during resume */
>  				tb_port_dbg(port,
>  					    "is unplugged (state: 7), retrying...\n");
> -- 
> 2.45.2

