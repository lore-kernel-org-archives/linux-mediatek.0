Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BE7C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s55gQJz+ulH++gu4or2o5m6X+U0vwPZA+Fq2bRR+zno=; b=JQUsKTmhllSkcduv/B2b904BEU
	cwHcHtY/Cpx2H+VZQ9O3xevlM/F7OhTn17SnFed7RVymu8evwpL/u3TJpoumuZGqvWNZ9LGTuM1oZ
	I5kphIQNw5fRhBoi2nXjV26ExNs4cYWCMneOdIMLhiBnABObGZ9SgjbpoHSVyUCPsxnFi92QPgTJY
	CRlYAy7//a+iAX70HnDD0ONSEV3WkLdB1jZPZuGNq5mx50Sn4MIWson5NgrjBZCcEGqz3H5WZF5t3
	4mEoyiRdnXGzTJRL8suBtFTm6JYgkrRzgh7vRJT4W2GZiFYZHckMBdl59VGiKmraGH5cjkicp/sHA
	xTXRAtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImLA-00BLKv-DA; Tue, 02 Aug 2022 07:29:20 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImKq-00BLC5-H0; Tue, 02 Aug 2022 07:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659425340; x=1690961340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MY1UeVCmTorLiElTkcmSLQfpDa7PBuZ+KvAyO3eFpnw=;
  b=VSAu0t88OCbErZe8KwLf0dJVsDg8a9eKk/EkGbZ0nTKMKcepnnId+SyH
   m/7xh0KM7x4C5MaKZHw3XO8DV+xK/qwRHvT6Qlf4QEqCuazNqHEnL610C
   BJPgM5qMkjLVzl6KWOAKoR7QpIatvSQ5fvn8Oa/m61j2zQ204MzEveEYT
   k0Tfr9I90bX2MZx7jPP+/w6tnPJ8LVxU1L0vlGhZjlYjcuAsrQAyZsjv7
   iaO3ndxUfHhsRfZ9aV0giZLGK9/enDnGZXJx2gwBr+Oi4T17jcD1Q26pA
   olp/6e0znAyvzufyVAz8er1I7NI92TjLPtSGjIcRHPWSm1fL41g28y0Rp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286904670"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="286904670"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 00:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="744573684"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2022 00:28:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Aug 2022 10:28:52 +0300
Date: Tue, 2 Aug 2022 10:28:52 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: altmodes/displayport: correct pin assignment
 for UFP receptacles
Message-ID: <YujSNEGm2ikg3j8a@kuha.fi.intel.com>
References: <20220727110503.5260-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727110503.5260-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_002900_636264_A12A75FA 
X-CRM114-Status: GOOD (  28.76  )
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

Hi guys,

On Wed, Jul 27, 2022 at 07:05:03PM +0800, Macpaul Lin wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> From: Pablo Sun <pablo.sun@mediatek.com>

Looks like there's something wrong with the formating of the patch
here?

> Fix incorrect pin assignment values when connecting to a monitor with
> Type-C receptacle instead of a plug.
> 
> According to specification, an UFP_D receptacle's pin assignment
> should came from the UFP_D pin assignments field (bit 23:16), while
> an UFP_D plug's assignments are described in the DFP_D pin assignments
> (bit 15:8) during Mode Discovery.
> 
> For example the LG 27 UL850-W is a monitor with Type-C receptacle.
> The monitor responds to MODE DISCOVERY command with following
> DisplayPort Capability flag:
> 
>         dp->alt->vdo=0x140045
> 
> The existing logic only take cares of UPF_D plug case,
> and would take the bit 15:8 for this 0x140045 case.
> 
> This results in an non-existing pin assignment 0x0 in
> dp_altmode_configure.
> 
> To fix this problem a new set of macros are introduced
> to take plug/receptacle differences into consideration.
> 
> Co-developed-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Co-developed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
> Cc: stable@vger.kernel.org

If this is a fix, then you need to have the "Fixes" tag that tells
which commit the patch is fixing.

> ---
>  drivers/usb/typec/altmodes/displayport.c | 4 ++--
>  include/linux/usb/typec_dp.h             | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 9360ca177c7d..8dd0e505ef99 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -98,8 +98,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>  	case DP_STATUS_CON_UFP_D:
>  	case DP_STATUS_CON_BOTH: /* NOTE: First acting as DP source */
>  		conf |= DP_CONF_UFP_U_AS_UFP_D;
> -		pin_assign = DP_CAP_DFP_D_PIN_ASSIGN(dp->alt->vdo) &
> -			     DP_CAP_UFP_D_PIN_ASSIGN(dp->port->vdo);
> +		pin_assign = DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
> +				 DP_CAP_PIN_ASSIGN_DFP_D(dp->port->vdo);
>  		break;
>  	default:
>  		break;
> diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
> index cfb916cccd31..8d09c2f0a9b8 100644
> --- a/include/linux/usb/typec_dp.h
> +++ b/include/linux/usb/typec_dp.h
> @@ -73,6 +73,11 @@ enum {
>  #define DP_CAP_USB			BIT(7)
>  #define DP_CAP_DFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(15, 8)) >> 8)
>  #define DP_CAP_UFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(23, 16)) >> 16)
> +/* Get pin assignment taking plug & receptacle into consideration */
> +#define DP_CAP_PIN_ASSIGN_UFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
> +			DP_CAP_UFP_D_PIN_ASSIGN(_cap_) : DP_CAP_DFP_D_PIN_ASSIGN(_cap_))
> +#define DP_CAP_PIN_ASSIGN_DFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
> +			DP_CAP_DFP_D_PIN_ASSIGN(_cap_) : DP_CAP_UFP_D_PIN_ASSIGN(_cap_))
>  
>  /* DisplayPort Status Update VDO bits */
>  #define DP_STATUS_CONNECTION(_status_)	((_status_) & 3)
> -- 
> 2.18.0

thanks,

-- 
heikki

