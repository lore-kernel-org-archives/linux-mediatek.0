Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 10:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7402360FBF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 10:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7402360FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WcLVtw4q76E5ti6CttK8iSvdAusS8szMMXkPz+jNmE0=; b=bFYS5y1N6CgY29wpmtXx7nPUhX
	1iXk5X3z/Qi2gCqY7lT5fQUXwwYRJyZ/8/m6F7Zqnm9wvqvqjyvwENDQ5i4hnaq28dy8qRBSycrFR
	ksoJ9So0kybeatMASbr8XSe2gh5x/QzxFR0OnMfKO0/EFboBTel3HoPL/CAC5/FoEJbAqQMUugOux
	l0Yx/6BEHUGAx/PdnzW5jJZvG+6ra6XunSFBOKm9jGXtvcfBASJG6V2VWpJol1Vdes6hryHpPnore
	GwkFOF/cWe/oH/KdQqa22EbBppXGPuln5C3g2dhVkocv3ZDaf2ZkvdUl/ODuUvxeHHDDtjGFnd9sQ
	HRLdnU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfK8Q-001Ysk-Ow; Tue, 26 Oct 2021 10:56:50 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfK89-001YnF-1c; Tue, 26 Oct 2021 10:56:34 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="229736791"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="229736791"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 03:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="724084101"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76])
 ([10.237.72.76])
 by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2021 03:56:15 -0700
Subject: Re: [PATCH] mmc: cqhci: clear HALT state after CQE enable
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <riteshh@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 stable@vger.kernel.org
References: <20211026070812.9359-1-wenbin.mei@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <8d096ff5-4266-815f-d050-1f3f0cddeba8@intel.com>
Date: Tue, 26 Oct 2021 13:56:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026070812.9359-1-wenbin.mei@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_035633_184704_D85C0A94 
X-CRM114-Status: GOOD (  18.17  )
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

On 26/10/2021 10:08, Wenbin Mei wrote:
> While mmc0 enter suspend state, we need halt CQE to send legacy cmd(flush
> cache) and disable cqe, for resume back, we enable CQE and not clear HALT
> state.
> In this case MediaTek mmc host controller will keep the value for HALT
> state after CQE disable/enable flow, so the next CQE transfer after resume
> will be timeout due to CQE is in HALT state, the log as below:
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: timeout for tag 2
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Config:    0x00001103 | Control:  0x00000001
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000006
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Int sig:   0x00000006 | Int Coal: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: TDL base:  0xfd05f000 | TDL up32: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Doorbell:  0x8000203c | TCN:      0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: SSC2:      0x00000001 | DCMD rsp: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQP:     0x00000000 | CRNQDUN:  0x00000000
> <4>.(4)[318:kworker/4:1H]mmc0: cqhci: CRNQIS:    0x00000000 | CRNQIE:   0x00000000
> 
> This change check HALT state after CQE enable, if CQE is in HALT state, we
> will clear it.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Cc: stable@vger.kernel.org

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/cqhci-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
> index ca8329d55f43..b0d30c35c390 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -282,6 +282,9 @@ static void __cqhci_enable(struct cqhci_host *cq_host)
>  
>  	cqhci_writel(cq_host, cqcfg, CQHCI_CFG);
>  
> +	if (cqhci_readl(cq_host, CQHCI_CTL) & CQHCI_HALT)
> +		cqhci_writel(cq_host, 0, CQHCI_CTL);
> +
>  	mmc->cqe_on = true;
>  
>  	if (cq_host->ops->enable)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
