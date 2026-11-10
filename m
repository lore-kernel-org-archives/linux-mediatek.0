Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445A606A338
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xs3AjJlV;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YcndLWZQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FkEnySU1GDLF2VUiw91mJ6AFRwT7hgrNJUSJL3fFwu4=; b=xs3AjJlVvBbABtvG6gRFFTLPyx
	wgh3i6NWwQ4rT6iQB9wAAvIT8uZRIvnbB95tJ7b/tdhOKPF8ymy7gpyFETDrDtBxAPCF8ffkvYWUW
	z2cuTLnh0UX7AVlZTJdr9MMHK9eot73CeDyEsmJH66q6xEgz89slDekUnB+Euc0yk6f4dpnLiJL5l
	9Ahpsz3iz+S82fhfmIQ01OQQ1zCOTty7mlkn15F4G0bT43lW/qYXemg/6DbwUvxm0exTcVw8vTWx5
	Gwr/k7FA4G4dUHjNlKT7kwkHEdsAhTMS95UCXP4dXjmqjvuaG6uXHA0Pk3EcpQwJieEkoZW6LJ76a
	anardqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn0h-00000004EfC-1080;
	Tue, 10 Nov 2026 14:39:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn0d-00000004EeD-41YD;
	Tue, 10 Nov 2026 14:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321580; x=1825857580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ot1QM6EDzvkgegBaqjLJg+T6pk0P7EVN8USsv3osalw=;
  b=YcndLWZQhy0VURAwlS/OHv8SvOZrH7+D1MF4E8QOdX2uZjhzbP5T7kTV
   fJV5kV7eSVywVcFzVQ9N/uRIrX3heK+iwGxkcruVvy/ivKlwtQY12ky83
   7VStVEkJpjTTbMtg3exuwBA27WfMnLLTBlSdJzwdV8JHKN296JNxyDGsD
   HUcihoZUz7Ct3G8QJtwSpc58S7VvtNw1Z+YaVMbK6qFqgSJGuweG1z3du
   437KWK1BZbSlPJSzzHplcYWoVu8kS7CQttfY+cmeanJaQ8ewoo0z9lQWq
   yHXm+7MNFUTSASZVKiAs84mz+hFdRBPeedcksGWwreIUI6P2Nf4SRyP8C
   A==;
X-CSE-ConnectionGUID: iSM1u6tVSRGI0GH989VMgg==
X-CSE-MsgGUID: LxQzTltkRreS4ctzC8Il6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2938977"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2938977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:39:38 -0800
X-CSE-ConnectionGUID: 6bdY2a/HS+u9RtvpN64X+w==
X-CSE-MsgGUID: uW/XdyleQiyAJOLGavE2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8459367"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2026 06:39:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C606F99; Tue, 10 Nov 2026 15:39:33 +0100 (CET)
Date: Tue, 10 Nov 2026 15:39:33 +0100
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
Subject: Re: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Message-ID: <20261110143933.GD259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-6-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_063940_504642_E9598609 
X-CRM114-Status: GOOD (  23.55  )
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

On Tue, Nov 10, 2026 at 07:48:53PM +0800, Chunfeng Yun wrote:
> when plug into a USB3 device into USB4 hub's downstream facing port
> to trigger usb4 driver wakeup, encounter the lane link up timeout

USB4

> issue, then cause usb3 hub disconnect:

USB3

Everywhere.

> 
> usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...

What's usb4_hi?

> usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
> usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
> usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
> ...
> thunderbolt 0-1: device disconnected
> usb 2-1: USB disconnect, device number 10
> 
> Completes link training at ~1.48s (with two retimer) and transitions
> to TB_PORT_UP after change the timeout to 2s;
> 
> In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
> 1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
> (tCmdResponse = 50 ms), the physical link is allowed by spec to take
> 1200 ms to 1500 ms+ to complete initialization.

Okay that makes sense.

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change timeout from 2.5s to 2s
> ---
>  drivers/thunderbolt/switch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 7ff3da79da76..7daee83c7ed8 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
>   * @port: Port to wait
>   * @wait_if_unplugged: Wait also when port is unplugged
>   *
> - * Wait up to 1 second for a port to reach state TB_PORT_UP. If
> + * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
>   * switch resume). Otherwise we only wait if a device is registered but the link
> @@ -500,7 +500,7 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries = 10;
> +	int retries = 20;
>  	int state;
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
> -- 
> 2.45.2

