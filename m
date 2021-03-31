Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9926AC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:42:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EDF6195C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EDF6195C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xq2x60c8+qkCcNa89BZHgCkWLprsbeeqVEvG1sIX9K8=; b=CELdovO+Lsi8fpMJtujDf9Eyy
	1H2muznhyb4XB4I/cry+/UhBQ6RQ129bpDUY6HYics72twT/VDPHmZuuq5FYbKgowWRKghxHRLMq2
	Xm+jZqBNrb5sxAKgyzJSGyQYc7m8xw5ecZLHTV7Yxz5w6apl0OkXvpdd1d075RjbSRqd7oZ1+OlkC
	TsqY4dBGWkem7hgB/5Ew9zPOKsGwNMIaCRYKE64bXxvDggQGu6aBL5TtgE2AMVOGWT8vY9F/9NDjS
	WWOCa/Hc+ihYinDxUScT379A+bttOd0le1uX/vdLygogfirnji42ClOOLYVm1DwQNwV2oE/A7CxT6
	+5am5fiNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWQq-0060hC-BE; Wed, 31 Mar 2021 08:42:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWQS-0060Xt-3S; Wed, 31 Mar 2021 08:42:10 +0000
X-UUID: 7868b271ceb2437abdd2268976c6f973-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z8cKO/WcF7PLYhFwwPNdw2kPZV45yctXzOoScFXE6PY=; 
 b=jZnG5EefVonyfdNq4bjrH6Vnc7mZgliJcBlBSDIvtTXLAo4CeFRwgMvGrMOyymF2AdQcCUKwyIZSOs0UG3XZ2A5ulkuNqFurqzTCryngh2eylisLPXdW+7sKA6TK2bPWZws1nlTikaKWelDIbqqBuyK2sNAC6088rfoZWvclcY8=;
X-UUID: 7868b271ceb2437abdd2268976c6f973-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1747222393; Wed, 31 Mar 2021 01:42:02 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 01:31:59 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 31 Mar 2021 16:31:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 16:31:52 +0800
Message-ID: <1617179512.2752.2.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] usb: xhci-mtk: relax periodic TT bandwidth checking
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>
CC: <linux-usb@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 31 Mar 2021 16:31:52 +0800
In-Reply-To: <20210330160508.2.I75d28cfec05010524ccef5132c8e39adb1bf6651@changeid>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.2.I75d28cfec05010524ccef5132c8e39adb1bf6651@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 87C59DA44ED50161B151CDE95BC281B41E769E971899507DEA0DC20294A75A162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_094208_813648_45577240 
X-CRM114-Status: GOOD (  32.25  )
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

On Tue, 2021-03-30 at 16:06 +0800, Ikjoon Jang wrote:
> Software bandwidth checking logics used by xhci-mtk puts
> a quite heavy constraints to TT periodic endpoint allocations.
> 
> This patch provides a relaxed bandwidth calculation by
> - Allowing multiple periodic transactions in a same microframe
>   for a device with multiple interrupt endpoints.
> - Using best case budget instead of maximum number of
>   complete-split when calculating byte budgets on lower speed bus
> 
> Without this patch, a typical full speed audio headset with
> 3 periodic endpoints (audio isoc-in/out, input int-in) cannot be
> configured with xhci-mtk.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
cc Yaqii Wu <Yaqii.Wu@mediatek.com>

I'll test it, thanks

> 
>  drivers/usb/host/xhci-mtk-sch.c | 68 ++++++++++-----------------------
>  drivers/usb/host/xhci-mtk.h     |  2 -
>  2 files changed, 20 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 0cb41007ec65..76827e48049a 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -388,13 +388,17 @@ static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
>  		} else { /* INT_IN_EP or ISOC_IN_EP */
>  			bwb_table[0] = 0; /* start split */
>  			bwb_table[1] = 0; /* idle */
> +
> +			sch_ep->num_budget_microframes += 2;
> +			if (sch_ep->num_budget_microframes > sch_ep->esit)
> +				sch_ep->num_budget_microframes = sch_ep->esit;
>  			/*
>  			 * due to cs_count will be updated according to cs
>  			 * position, assign all remainder budget array
>  			 * elements as @bw_cost_per_microframe, but only first
>  			 * @num_budget_microframes elements will be used later
>  			 */
> -			for (i = 2; i < TT_MICROFRAMES_MAX; i++)
> +			for (i = 2; i < sch_ep->num_budget_microframes; i++)
>  				bwb_table[i] =	sch_ep->bw_cost_per_microframe;
>  		}
>  	}
> @@ -449,20 +453,17 @@ static void update_bus_bw(struct mu3h_sch_bw_info *sch_bw,
>  static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>  {
>  	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> -	u32 num_esit, tmp;
> -	int base;
>  	int i, j;
> +	const int nr_lower_uframes =
> +		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>  
> -	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> -	for (i = 0; i < num_esit; i++) {
> -		base = offset + i * sch_ep->esit;
> -
> +	for (i = offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
>  		/*
>  		 * Compared with hs bus, no matter what ep type,
>  		 * the hub will always delay one uframe to send data
>  		 */
> -		for (j = 0; j < sch_ep->cs_count; j++) {
> -			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> +		for (j = 0; j < nr_lower_uframes; j++) {
> +			u32 tmp = tt->fs_bus_bw[i + j + 1] + sch_ep->bw_cost_per_microframe;
>  			if (tmp > FS_PAYLOAD_MAX)
>  				return -ESCH_BW_OVERFLOW;
>  		}
> @@ -473,11 +474,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>  
>  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  {
> -	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>  	u32 extra_cs_count;
>  	u32 start_ss, last_ss;
>  	u32 start_cs, last_cs;
> -	int i;
>  
>  	if (!sch_ep->sch_tt)
>  		return 0;
> @@ -494,10 +493,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  		if (!(start_ss == 7 || last_ss < 6))
>  			return -ESCH_SS_Y6;
>  
> -		for (i = 0; i < sch_ep->cs_count; i++)
> -			if (test_bit(offset + i, tt->ss_bit_map))
> -				return -ESCH_SS_OVERLAP;
> -
>  	} else {
>  		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>  
> @@ -524,19 +519,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  		if (cs_count > 7)
>  			cs_count = 7; /* HW limit */
>  
> -		if (test_bit(offset, tt->ss_bit_map))
> -			return -ESCH_SS_OVERLAP;
> -
>  		sch_ep->cs_count = cs_count;
> -		/* one for ss, the other for idle */
> -		sch_ep->num_budget_microframes = cs_count + 2;
> -
> -		/*
> -		 * if interval=1, maxp >752, num_budge_micoframe is larger
> -		 * than sch_ep->esit, will overstep boundary
> -		 */
> -		if (sch_ep->num_budget_microframes > sch_ep->esit)
> -			sch_ep->num_budget_microframes = sch_ep->esit;
>  	}
>  
>  	return check_fs_bus_bw(sch_ep, offset);
> @@ -545,31 +528,18 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>  {
>  	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> -	u32 base, num_esit;
> -	int bw_updated;
> -	int bits;
> -	int i, j;
> -
> -	num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> -	bits = (sch_ep->ep_type == ISOC_OUT_EP) ? sch_ep->cs_count : 1;
> +	int i, j, bw_updated;
> +	const int nr_lower_uframes =
> +		DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>  
>  	if (used)
>  		bw_updated = sch_ep->bw_cost_per_microframe;
>  	else
>  		bw_updated = -sch_ep->bw_cost_per_microframe;
>  
> -	for (i = 0; i < num_esit; i++) {
> -		base = sch_ep->offset + i * sch_ep->esit;
> -
> -		for (j = 0; j < bits; j++) {
> -			if (used)
> -				set_bit(base + j, tt->ss_bit_map);
> -			else
> -				clear_bit(base + j, tt->ss_bit_map);
> -		}
> -
> -		for (j = 0; j < sch_ep->cs_count; j++)
> -			tt->fs_bus_bw[base + j] += bw_updated;
> +	for (i = sch_ep->offset; i < XHCI_MTK_MAX_ESIT; i += sch_ep->esit) {
> +		for (j = 0; j < nr_lower_uframes; j++)
> +			tt->fs_bus_bw[i+ j + 1] += bw_updated;
>  	}
>  
>  	if (used)
> @@ -634,9 +604,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
>  		if (min_bw > worst_bw) {
>  			min_bw = worst_bw;
>  			found = i;
> +			/* fastpath: bandwidth contributions to host is low
> +			 * when it's fs/ls */
> +			if (sch_ep->sch_tt || min_bw == 0)
> +				break;
>  		}
> -		if (min_bw == 0)
> -			break;
>  	}
>  
>  	/* check bandwidth */
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index 621ec1a85009..8a879f99ae1c 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -20,12 +20,10 @@
>  #define XHCI_MTK_MAX_ESIT	64
>  
>  /**
> - * @ss_bit_map: used to avoid start split microframes overlay
>   * @fs_bus_bw: array to keep track of bandwidth already used for FS
>   * @ep_list: Endpoints using this TT
>   */
>  struct mu3h_sch_tt {
> -	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
>  	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
>  	struct list_head ep_list;
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
