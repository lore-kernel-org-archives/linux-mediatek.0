Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FAFC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:38:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC3764DFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC3764DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZjxyrXHj2V7Y+q6LIcCd4flZF/WIOP20/61jxX4CzCo=; b=RBBRrObZOn7pW6tdywws1Q9Z2
	J/Yrq8gMLeY+CMCMR+jmFsJZC86zklxivrb6/nsz9XSIQwXjJCXPIGyUuy3iiA1RE6oeBizfhqhpG
	6eIq8MigOwneKtR+7QR5AWBRCuuH/U7rfnYZBrTGaFF6ZEnq7rGfiurynJ+sHI/s8JLQUT+3dqWyF
	X9Ee+7N4EeJY4dnA/RYiPPQe2GORHfnaqU26zy8bjzHbTcq6qjuVoD1VdnXq37JXh9bO+Lw7+BUGH
	1Bd23Qc1eEP+fCaAZQQRaqOfaeIkav0raI/F2gM9jtyrTzPPt2WvnIg/JXfgewCNLyMo1seXrptPK
	cXw3Ogd/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QEV-0008Qp-7F; Fri, 29 Jan 2021 09:38:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QEQ-0008PA-9F; Fri, 29 Jan 2021 09:38:23 +0000
X-UUID: cd58ee22fea64e999162e5dadd54724a-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uEyVz4Nnmd3N61mbIGXzPVnThfBm4duQYWOdDCgTu4A=; 
 b=oeKDKuSosoMKbf8T/ZpUK5vhYyP/OY4pLOQLHKVGhnkYSwGhVRhM7uMC2pvODQIDg4zTlV0lbVVN6swv1L3liQEDZA4FvfddDZHy1qmahBzHYOOgJWnmu2Z0mo/EN9Q1oDlnS1jnX9+w9oZZOY28ZFdH/qvtF2Ip+erO92aLQjk=;
X-UUID: cd58ee22fea64e999162e5dadd54724a-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 329445776; Fri, 29 Jan 2021 01:23:37 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 01:18:28 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 17:18:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 17:18:23 +0800
Message-ID: <1611911903.3905.25.camel@mhfsdcap03>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 29 Jan 2021 17:18:23 +0800
In-Reply-To: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C429D02E50FF036A596C1B63B125D8F2A25663FD33ABE7CF18A136EDA156BC7D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_043822_516751_1A512AAF 
X-CRM114-Status: GOOD (  24.23  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ikjoon,

On Wed, 2021-01-13 at 18:05 +0800, Ikjoon Jang wrote:
> xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> drop_endpoint() to handle its own sw bandwidth management.
> 
> It stores bandwidth data into an internal table every time
> add_endpoint() is called, and drops those in drop_endpoint().
> But when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch moves bandwidth management codes to check_bandwidth() and
> reset_bandwidth() path. To do so, this patch also adds those functions
> to xhci_driver_overrides and lets mtk-xhci to release all failed
> endpoints in reset_bandwidth() path.
> 
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 
> ---
> 
> Changes in v6:
> - use xhci overrides instead of quirk functions for
>   {check|reset}_bandwidth().
> 
> Changes in v5:
> - Fix a wrong commit id in Fixes tag
> 
> Changes in v4:
> - bugfix in v3, check_bandwidth() return uninitialized value
>   when no new endpoints were added.
> - change Fixes tag to keep dependency
> 
> Changes in v3:
> - drop unrelated code cleanups
> - change Fixes tag to keep dependency
> 
> Changes in v2:
> - fix a 0-day warning from unused variable
> - split one big patch into three patches
> - fix wrong offset in mediatek hw flags
> 
>  drivers/usb/host/xhci-mtk-sch.c | 123 ++++++++++++++++++++++----------
>  drivers/usb/host/xhci-mtk.c     |   2 +
>  drivers/usb/host/xhci-mtk.h     |  13 ++++
>  drivers/usb/host/xhci.c         |   8 ++-
>  drivers/usb/host/xhci.h         |   4 ++
>  5 files changed, 111 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 45c54d56ecbd..a313e75ff1c6 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -200,6 +200,7 @@ static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
>  [...]
> +
> +int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> +{
> +	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	struct xhci_virt_device *virt_dev = xhci->devs[udev->slot_id];
> +	struct mu3h_sch_bw_info *sch_bw;
> +	struct mu3h_sch_ep_info *sch_ep, *tmp;
> +	int bw_index, ret;
> +
> +	dev_dbg(&udev->dev, "%s\n", __func__);
> +
> +	list_for_each_entry(sch_ep, &mtk->bw_ep_list_new, endpoint) {
> +		bw_index = get_bw_index(xhci, udev, sch_ep->ep);
> +		sch_bw = &mtk->sch_array[bw_index];
> +
> +		ret = check_sch_bw(udev, sch_bw, sch_ep);
> +		if (ret) {
> +			xhci_err(xhci, "Not enough bandwidth!\n");
> +			return -ENOSPC;
> +		}
> +	}
> +
> +	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> +		struct xhci_ep_ctx *ep_ctx;
> +		struct usb_host_endpoint *ep = sch_ep->ep;
> +		unsigned int ep_index = xhci_get_endpoint_index(&ep->desc);
> +
> +		bw_index = get_bw_index(xhci, udev, ep);
> +		sch_bw = &mtk->sch_array[bw_index];
> +
> +		list_move_tail(&sch_ep->endpoint, &sch_bw->bw_ep_list);
> +
> +		ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
> +		ep_ctx->reserved[0] |= cpu_to_le32(EP_BPKTS(sch_ep->pkts)
> +			| EP_BCSCOUNT(sch_ep->cs_count)
> +			| EP_BBM(sch_ep->burst_mode));
> +		ep_ctx->reserved[1] |= cpu_to_le32(EP_BOFFSET(sch_ep->offset)
> +			| EP_BREPEAT(sch_ep->repeat));
> +
> +		xhci_dbg(xhci, " PKTS:%x, CSCOUNT:%x, BM:%x, OFFSET:%x, REPEAT:%x\n",
> +			sch_ep->pkts, sch_ep->cs_count, sch_ep->burst_mode,
> +			sch_ep->offset, sch_ep->repeat);
> +	}
> +
> +	return xhci_check_bandwidth(hcd, udev);
> +}
> +EXPORT_SYMBOL_GPL(xhci_mtk_check_bandwidth);
> +
> +void xhci_mtk_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> +{
> +	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
> +	struct mu3h_sch_ep_info *sch_ep, *tmp;
> +
> +	dev_dbg(&udev->dev, "%s\n", __func__);
> +
> +	list_for_each_entry_safe(sch_ep, tmp, &mtk->bw_ep_list_new, endpoint) {
> +		xhci_mtk_drop_ep(mtk, udev, sch_ep);
This need skip endpoint not allocated bandwidth; e.g.
If add 3 eps, the second on is checked fail, only need drop first ep,
and skip second & third ones.
I'll send out a v7 patch, thanks

> +	}
> +
> +	xhci_reset_bandwidth(hcd, udev);
> +}
> +EXPORT_SYMBOL_GPL(xhci_mtk_reset_bandwidth);
[...]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
