Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE57C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 13:20:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2922520782
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 13:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="stI2S047";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D680aaEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2922520782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p5HSZ7BMPacDpI2IxJEsjQSOuG6z7uOE7ml35rDWK2o=; b=stI2S047y2cQ5JQep7jaqDqai
	XXLELoAYHuMSLsG+guYKivw+TtB54S0vhhnSqv3OQmI+nxnpZ5V4QcQ9gm5E69ngtzS5C43rSUzvH
	21uTrg09W0yNCYn8bd7SVJT25mNbvQaBIXyMijbkRCvsYFgfO7sW6fMLsJbMis+sDZ0Cs8aIKYmvS
	k270sHaE7vkBU3KFeimc8scLSxt0ahak9sKMW95RzpxbmH4OvCAjWL71JrMLYi8S2Z/5pIdVvnx+q
	NezUayR6VTgsEYVCGCsyqsTHg7VrpypPbaAes1gFBXXbxoJWGSJmIJD6cvjUVD/ERcKu3ERuI4i+H
	DHbLMdWWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCjjV-0001TN-SB; Mon, 31 Aug 2020 13:20:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjjF-0001Jk-Mw; Mon, 31 Aug 2020 13:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=o8M6PYIvEE959GXAP6/tF386/mTp2XQdpp3nAPwlb3I=; b=D680aaElZtX5uXFxeRY6KZORVh
 Qfmsd1u9a7VJeAvHyKOdjDo0/3JPvmhhlfy71oIJ9j9mZ8CWDZOhR/YGWbIGC1f4qp6NReYiimS71
 RTMgqOfyY4sJy4RfJQVQ8riDr+xqvmcLEM3E5F8cd28jjZyJDjUCcSNVf4Q1XH707MkRmHhY6zE0Q
 70kOL9iBQaIA7bTMU+kQcIXgsz09jac5mvQ2wjk1Rwbcw6AmRleyBv9YcKgkBtnbwRYjEHi3nQi9t
 appO85vICzdYFpaahugM4PnQX7wF0Y6zmWZI6Eyu6qREFWaI2rXhiBO76qxAT+j7ivurv/muD0qlb
 V/UQpi8Q==;
Received: from mga07.intel.com ([134.134.136.100])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjZ9-0007i2-2C; Mon, 31 Aug 2020 13:09:45 +0000
IronPort-SDR: S9UHuJvb2rJW8KcWRDF0Ycy3A6mqUOzauJQhqUL3NE0evMYaBXZoTXnsN7WCZzoOkASB6juOxF
 sX+wZPN0FP7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="221198864"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="221198864"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 06:08:34 -0700
IronPort-SDR: EohOby+7M8jiGk+t8vzztTtibrfD4QbKSTQq1hGxL18iqul7w31+Wm23G0lKBK+P+i0d3SJVq3
 VWCHzD9m0qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="501331763"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73])
 ([10.237.72.73])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2020 06:08:20 -0700
Subject: Re: [PATCH v1 1/2] mmc: cqhci: add new cqhci_host_ops pre_enable()
 and post_disable()
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
 <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9c0dd5b4-5d9e-e559-81f5-fbf6024b67bb@intel.com>
Date: Mon, 31 Aug 2020 16:07:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_140943_543657_85CEBBA4 
X-CRM114-Status: GOOD (  22.69  )
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
> Add pre_enable() and post_disable() for cqhci_host_ops.
> Add hook functions before cqhci enable and
> after cqhci disable for platforms need them.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/cqhci.c |    6 ++++++
>  drivers/mmc/host/cqhci.h |    2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index cfa87df..697fe40 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -376,6 +376,9 @@ static void cqhci_off(struct mmc_host *mmc)
>  	else
>  		pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
>  
> +	if (cq_host->ops->post_disable)
> +		cq_host->ops->post_disable(mmc);
> +
>  	mmc->cqe_on = false;
>  }
>  
> @@ -580,6 +583,9 @@ static int cqhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  		__cqhci_enable(cq_host);
>  
>  	if (!mmc->cqe_on) {
> +		if (cq_host->ops->pre_enable)
> +			cq_host->ops->pre_enable(mmc);
> +
>  		cqhci_writel(cq_host, 0, CQHCI_CTL);
>  		mmc->cqe_on = true;
>  		pr_debug("%s: cqhci: CQE on\n", mmc_hostname(mmc));
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 4377001..89bf6ad 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -206,6 +206,8 @@ struct cqhci_host_ops {
>  	void (*disable)(struct mmc_host *mmc, bool recovery);
>  	void (*update_dcmd_desc)(struct mmc_host *mmc, struct mmc_request *mrq,
>  				 u64 *data);
> +	void (*pre_enable)(struct mmc_host *mmc);
> +	void (*post_disable)(struct mmc_host *mmc);
>  };
>  
>  static inline void cqhci_writel(struct cqhci_host *host, u32 val, int reg)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
