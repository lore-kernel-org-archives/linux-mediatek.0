Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBE1C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 13:20:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687152073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 13:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vpuHd0gD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VASgcetk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687152073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpW0IBBbf8uRufoHqt11glP0JSjomr2PCd5qPkQ/N0M=; b=vpuHd0gD6Rgw8bOCly6Ogl8jq
	XN0pCxp0qzkkFDUy5XjQYohI76O6/ySLLMCPB0SWOp7/2ePQKREanf3Y/GbQHb3pcHoMpbSkFTN+v
	UDFIU7CZw6GP2/RdrorUqkhN6uP5B+8s+HN0OUohBMDnSKjwX6g+1fEyv2esRH2qljkUjl62YD5iS
	cHmITkjYZYuX1t0b7JX8+loFz8QRC7V9yPHbViYcFzuaQwiADmsi8ARLqMLKan6ly06oDqAQ/g9XA
	rkON7zOpo2+pTXppxHKHSALiovs5nBpsHc3DIhBGVB1FIAKwT+wpHgvLVWJiibzY7NA1eZGObQFhc
	razBIjZYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCjjF-0001Oj-HW; Mon, 31 Aug 2020 13:20:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjj8-0001Jk-VK; Mon, 31 Aug 2020 13:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=U59L2EFPeoChnHCkrJabjqJVTRYYIDfb1ebFj5yyn0g=; b=VASgcetkKhyQOiWiSqoudRmpA5
 kXM+nBLJGWexvQp/CCgJZpq79ZANHk82gYPfGxQ++oxU7yup+7e/oWUhYacomaRvvHY55uXa5K9Ca
 /sEl/zt2dz/xnGk2qLINeTghuqtlfoaLGceYeMHI2r/uYucHxSB/F4JjfjeZOQeXzaHTWDDhbGAha
 Q4OIyyK1v4X6F/e8skvcaDcafty78szpLD2pGvcMp7qld0zk9lnyV2aoOxpjpPblp96ry/H6zHu/W
 nOG6nV40uBal9noIrR2lyZ+FXj3Lbh5lGNXEGo0zpEFTkdD6IgaH8K/8uPYBr8F2izzNy4Qb6Saf4
 NQrYcZXA==;
Received: from mga17.intel.com ([192.55.52.151])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjaV-0007xe-CX; Mon, 31 Aug 2020 13:11:13 +0000
IronPort-SDR: d40ANCmZ2JLOuGky6OkRH6v4nlY6d1f+Bs8U6od5/QxaXCwAc6xlPLlWkhj6HYYIEE2Q68DmqX
 8gUPeiEPC37A==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="137015821"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="137015821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 06:10:00 -0700
IronPort-SDR: qm9FbLBXaIcybQOvam8eKnyKCl+WY/QLxKdVBWNIhQREYbX7phv9e3DVpQHTdb/nA8aLocV435
 qeYEwmqJtKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="501332255"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73])
 ([10.237.72.73])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2020 06:09:45 -0700
Subject: Re: [PATCH v1 2/2] mmc: mediatek: add pre_enable() and post_disable()
 hook function
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
 Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Mao Yong
 <yong.mao@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pan Bian <bianpan2016@163.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Mathieu Malaterre <malat@debian.org>,
 Asutosh Das <asutoshd@codeaurora.org>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
 <1598520783-25250-3-git-send-email-chun-hung.wu@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <29d14e57-a016-af60-374d-70a6c267833e@intel.com>
Date: Mon, 31 Aug 2020 16:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598520783-25250-3-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_141108_079378_179D68AD 
X-CRM114-Status: GOOD (  23.67  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/08/20 12:33 pm, Chun-Hung Wu wrote:
> CQHCI_ENABLE bit in CQHCI_CFG should be disabled
> after msdc_cqe_disable(), and should be enabled before
> msdc_ceq_enable() for MTK platform.
> Add hook functions for cqhci_host_ops->pre_enable() and
> cqhci_host_ops->post_disable().
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/mtk-sd.c |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4e2583f..f53e11b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2282,6 +2282,26 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  	}
>  }
>  
> +static void msdc_cqe_pre_enable(struct mmc_host *mmc)
> +{
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 reg;
> +
> +	reg = cqhci_readl(cq_host, CQHCI_CFG);
> +	reg |= CQHCI_ENABLE;
> +	cqhci_writel(cq_host, reg, CQHCI_CFG);
> +}
> +
> +static void msdc_cqe_post_disable(struct mmc_host *mmc)
> +{
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 reg;
> +
> +	reg = cqhci_readl(cq_host, CQHCI_CFG);
> +	reg &= ~CQHCI_ENABLE;
> +	cqhci_writel(cq_host, reg, CQHCI_CFG);
> +}
> +
>  static const struct mmc_host_ops mt_msdc_ops = {
>  	.post_req = msdc_post_req,
>  	.pre_req = msdc_pre_req,
> @@ -2301,6 +2321,8 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  static const struct cqhci_host_ops msdc_cmdq_ops = {
>  	.enable         = msdc_cqe_enable,
>  	.disable        = msdc_cqe_disable,
> +	.pre_enable = msdc_cqe_pre_enable,
> +	.post_disable = msdc_cqe_post_disable,
>  };
>  
>  static void msdc_of_property_parse(struct platform_device *pdev,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
