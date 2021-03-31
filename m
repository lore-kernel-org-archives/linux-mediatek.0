Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41709C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:31:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE75A6196C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE75A6196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mF0VgH3LOh8EOaG5RepJeAf+2G2wSxUtQ6TNUkCWJpM=; b=aL6PB3FKd7Q6WYLzk5OAs9AbA
	1fL2BiZzYprjIG1gNW6iauybY0MzsTtrHZX7yzIcMwsnP7i38AmcRcXx/FQi6nKnegaaYSfEWRa4q
	9Q8NgSOUAp/ZFUmgPZklZY9TTquJLgLqUKDRj1wfsms7jbtZtpat8RnmlN4QUp28ZnjO9D44dgmfH
	ZeDr2bcQ7LxfsLVNmwQM6Yy5jefne7pc9zvnQdsc2Wa3XMZVEMG+EvbN7oUX+2RKsRqYSMp03dQIO
	CIa+tlCAWvj3LxLcSo0xR3kgHffcC0hfDuLg8prVne0Aa3cvdWwTepfubiq1HbHOvAURji11CNqb0
	B8l+xaIQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWGK-005xoo-0C; Wed, 31 Mar 2021 08:31:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWFl-005xZg-S6; Wed, 31 Mar 2021 08:31:09 +0000
X-UUID: c9b2d47a6ebe4c0da510040e5703312e-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W3q5DAk4wjiboZB+4xm4r+D77u+vIj/xKBGT22s32q4=; 
 b=P3tlUBa1Wl0b+SOqp9657Xsv25LXjXJL8x5LVHWExBGTQi1DM5TDydDf2yaZTopcyjecIfaGlivcxMxlbX311BW40n8+SMFhTMETys7fCHHwKrkhakzwd/7rC5EYEyzzCAYVRyUw3/ig/un6k8VEnAUETDqz2DgNqXtyXSCauu4=;
X-UUID: c9b2d47a6ebe4c0da510040e5703312e-20210331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 386193767; Wed, 31 Mar 2021 01:31:01 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 01:31:00 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 31 Mar 2021 16:30:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 16:30:55 +0800
Message-ID: <1617179455.2752.1.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>
CC: <linux-usb@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 31 Mar 2021 16:30:55 +0800
In-Reply-To: <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC6F4D0A80AC4B87C9CE430B543EEBEF87DF16C0DE213A0549C1FAF1B0B002352000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_093106_622682_31C0CC2B 
X-CRM114-Status: GOOD (  20.02  )
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

cc Yaqii Wu <Yaqii.Wu@mediatek.com>

I'll test it , thanks

On Tue, 2021-03-30 at 16:06 +0800, Ikjoon Jang wrote:
> Remove unnecessary variables in check_sch_bw().
> No functional changes, just for better readability.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
>  drivers/usb/host/xhci-mtk-sch.c | 52 +++++++++++++--------------------
>  1 file changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index a59d1f6d4744..0cb41007ec65 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -479,6 +479,9 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  	u32 start_cs, last_cs;
>  	int i;
>  
> +	if (!sch_ep->sch_tt)
> +		return 0;
> +
>  	start_ss = offset % 8;
>  
>  	if (sch_ep->ep_type == ISOC_OUT_EP) {
> @@ -606,54 +609,41 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
>  static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
>  			struct mu3h_sch_ep_info *sch_ep)
>  {
> -	u32 offset;
> -	u32 min_bw;
> -	u32 min_index;
> -	u32 worst_bw;
> -	u32 bw_boundary;
> -	u32 esit_boundary;
> -	u32 min_num_budget;
> -	u32 min_cs_count;
> -	int ret = 0;
> +	int i, found = -1;
> +	const u32 esit_boundary = get_esit_boundary(sch_ep);
> +	const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
> +	u32 min_bw = ~0;
>  
>  	/*
>  	 * Search through all possible schedule microframes.
>  	 * and find a microframe where its worst bandwidth is minimum.
>  	 */
> -	min_bw = ~0;
> -	min_index = 0;
> -	min_cs_count = sch_ep->cs_count;
> -	min_num_budget = sch_ep->num_budget_microframes;
> -	esit_boundary = get_esit_boundary(sch_ep);
> -	for (offset = 0; offset < sch_ep->esit; offset++) {
> -		if (sch_ep->sch_tt) {
> -			ret = check_sch_tt(sch_ep, offset);
> -			if (ret)
> -				continue;
> -		}
> +	for (i = 0; i < sch_ep->esit; i++) {
> +		u32 worst_bw;
>  
> -		if ((offset + sch_ep->num_budget_microframes) > esit_boundary)
> +		if ((i + sch_ep->num_budget_microframes) > esit_boundary)
>  			break;
>  
> -		worst_bw = get_max_bw(sch_bw, sch_ep, offset);
> +		if (check_sch_tt(sch_ep, i))
> +			continue;
> +
> +		worst_bw = get_max_bw(sch_bw, sch_ep, i);
> +		if (worst_bw > bw_boundary)
> +			continue;
> +
>  		if (min_bw > worst_bw) {
>  			min_bw = worst_bw;
> -			min_index = offset;
> -			min_cs_count = sch_ep->cs_count;
> -			min_num_budget = sch_ep->num_budget_microframes;
> +			found = i;
>  		}
>  		if (min_bw == 0)
>  			break;
>  	}
>  
> -	bw_boundary = get_bw_boundary(sch_ep->speed);
>  	/* check bandwidth */
> -	if (min_bw > bw_boundary)
> -		return ret ? ret : -ESCH_BW_OVERFLOW;
> +	if (found < 0)
> +		return -ESCH_BW_OVERFLOW;
>  
> -	sch_ep->offset = min_index;
> -	sch_ep->cs_count = min_cs_count;
> -	sch_ep->num_budget_microframes = min_num_budget;
> +	sch_ep->offset = found;
>  
>  	return load_ep_bw(sch_bw, sch_ep, true);
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
