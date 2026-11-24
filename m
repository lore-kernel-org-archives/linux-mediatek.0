Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D7606A327
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLaP2tSc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bnzVPn5y;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUnoJ/YX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qi4Yj6pbHk09P0l9D1zx/PEYjia67PzFjcJgaaMSSPg=; b=rLaP2tScodp+AD/GAEm608uW4f
	ctvcG7/CFdTT6XASc3Pe3l0x2K4isyCD1RrA1Sk5NFxUxI3KnwkGH8hTzKIaGoXY6Y8vyxQVd+BnX
	gurPlIIlzQOzlI0ZjOjTOmhcjT4G7T5v3+RN+JPYb5pzcTJiEeWa2RhP1PdczolgVMGYLyIVEp9MZ
	5P8TFoomCk+l+QiWhiGG9hISGGKr/nlUYExrT/UQIEoGC3SeDTSqXDZXWYCkuCO1dNq512PulTxEj
	ZfL/5yCdyHIPLTYkmkpcX5cwxCjZIbM6T3U+OC3M7e3lW5CGlGlmdG39ASM+3addDEl/ghHlPm9bx
	C5tXqXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt5j-000000073rg-0xDy;
	Tue, 24 Nov 2026 16:09:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt5h-000000073qz-072t;
	Tue, 24 Nov 2026 16:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qi4Yj6pbHk09P0l9D1zx/PEYjia67PzFjcJgaaMSSPg=; b=bnzVPn5yhDT/Z0e2OYFTtUORIm
	amMQJBaUY7vhGcyubTehrEap4CvrQHAMINjh4WlHAb8Zn/Xfem41uteFxjtxFGR77rFenCO5pRPHg
	c7Q9Ao+jqLeGeZAaSvLPFM+ROPmHneBEqfvFl9OeLu6C9p4QXmICkf6wpeo1Lx+NwUIg+5c1R1ByS
	S2HLwKckrXQt36dmjNU7HQS+VpJID7qUmOxDRkkZtJT6LwhkpGGo6o6on9GN/hi0jzRmi6IrXXCxp
	ied8rt1Fj8Dki7BOWL6uc3JObCANg/Cw0ojII8aSzatQ08r9v1KkprGB59C5Mu7t2d2gPzq31yvgX
	hDAgBqkg==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt5d-00000004Jxa-33LS;
	Tue, 24 Nov 2026 16:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795536593; x=1827072593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gayD7OSdqafDU/mqu/hlADeyIK427sH2qeIvaFiiZ0s=;
  b=OUnoJ/YXCraTzxbSpuFwx952diEf8JjPaSt8WJ2cBbMtH8blYhXudSdW
   6Uh/Xq/CEirt1VnMYiYdGBnvn8anwGYvpkkWit5ajSIf4oaes/SU54oA3
   NGVAC8k4xaQb17XQxsc2cvhxQGgcXQ6GTlC5BtIroWl2YVfm2w0teSAI8
   ZYBSzycLPjN9cYAMepnnub8xpGDYxqenfmbiF8Z3Wt20W+VagsvEsAB52
   ENb7YJDjSh3/B2EQUtmlypoKjYnOdjJeAIMA8aej7MS7G6lB5GT9Bd28p
   FdXt6v6ApgopgQC9d5oJfp9ovONEn6wTYucODgoAJwFWxkOP9dgbJsf/d
   g==;
X-CSE-ConnectionGUID: 5QhGv/Y5S3S4dQ0Jf9mxRQ==
X-CSE-MsgGUID: CljCMIhNTxOJwBUwgKZmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4437692"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4437692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:01:16 -0800
X-CSE-ConnectionGUID: WBpAHBCHS06bR/JrcUcn8g==
X-CSE-MsgGUID: H+vAR1eYT2WfIrk1s1p53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12188596"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2026 08:00:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9A6E194; Tue, 24 Nov 2026 17:00:38 +0100 (CET)
Date: Tue, 24 Nov 2026 17:00:38 +0100
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
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261124160038.GR229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160954_105048_9A691EEA 
X-CRM114-Status: GOOD (  27.34  )
X-Spam-Score: -2.3 (--)
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

On Mon, Nov 23, 2026 at 07:36:54PM +0800, Chunfeng Yun wrote:
> When USB4 is woke up by device disconnect, no need wait for 2s,
> usually the phase2~4 takes at most about 200ms, and enters to

usually phases 2-4 take at most..

The 200ms is not from the spec though? It's empirical right on your
hardhware?

> TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
> treat it as disconnected.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: fix code style
> ---
>  drivers/thunderbolt/switch.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 97e3fd8cdc0c..0da5b7ee4c29 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
>   * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
> - * switch resume). Otherwise we only wait if a device is registered but the link
> - * has not yet been established.
> + * router resume, Wait at most 400 ms for link to start connecting,
> + * if timeout, means the device is disconnected). Otherwise we only wait
> + * if a device is registered but the link has not yet been established.
>   *
>   * Return:
>   * * %0 - If the port is not connected or failed to reach
> @@ -500,6 +501,7 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> +	int unplugged_retries = 4;
>  	int retries = 20;
>  	int state;
>  	if (!port->cap_phy) {
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

