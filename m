Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F097C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:49:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD0420768
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxi3T4Bh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD0420768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CrwdO/bh2j8rfRU4ju6v/s39tEWC/jrTGyquWimCe5s=; b=bxi3T4BhJPnw9MclOwSpmwDKM
	K4YRrGMo2hvQN0zPdCt5PltOL1jUIRROLumNhXd5S1ua7dVTi+vmlYjbDvWhUDnOByDhX72agfHiw
	xUHjyyhi4A3nsyyYLtPpc7V5TaRhJXh6dCkQRrYFY3EMxbMXE45XjI7THCICg7BIsO81FukRjynHC
	NI27/YMe7xqqG5rdWvKFX8rJUXUgIc+zGPvKkOxLaegay+qd6wKAy52C7tNIEDjGnDwlw+AhPM+7F
	q+vgY+Z6b+jldUxj8wUEFysWqkeHiAM7qD14gpVQsg9UofOzL3tlU+0dUu74RY54zSGUe3RC0Q8+s
	yXdTkeniA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA2XN-0006rm-K3; Mon, 24 Aug 2020 02:48:45 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA2XK-0006qc-Cb; Mon, 24 Aug 2020 02:48:43 +0000
IronPort-SDR: St6O32A2289fhU9t55qc7H7JQ0f9VEdTnnz8gHvmH2iYK4SpQoWwyJAjhOV+ejvGoldFNBIbKE
 3zcT5J66oF3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153241950"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="153241950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2020 19:48:40 -0700
IronPort-SDR: QvQrd05CTCm6a18WSN5g52+fKEeZzJw+BZjybGfSwfSIY/837bNnl3ts3+SG+3Z8aXPqt68Nxs
 6o9jE1mGy/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="402124727"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2020 19:48:38 -0700
Subject: Re: [RESEND PATCH 4/5] iommu: intel: Drop kerneldoc marker from
 regular comment
To: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20200819175345.20833-1-krzk@kernel.org>
 <20200819175345.20833-4-krzk@kernel.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <93184b50-d55c-b84a-7563-ffd28de3179e@linux.intel.com>
Date: Mon, 24 Aug 2020 10:43:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819175345.20833-4-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_224842_818470_FF1FFD8D 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 8/20/20 1:53 AM, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>      drivers/iommu/intel/dmar.c:389: warning: Function parameter or member 'header' not described in 'dmar_parse_one_drhd'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Adjust the commit title to "iommu/vt-d: Drop kerneldoc marker from
regular comment",

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel/dmar.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 93e6345f3414..ba47edf03941 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -380,7 +380,7 @@ dmar_find_dmaru(struct acpi_dmar_hardware_unit *drhd)
>   	return NULL;
>   }
>   
> -/**
> +/*
>    * dmar_parse_one_drhd - parses exactly one DMA remapping hardware definition
>    * structure which uniquely represent one DMA remapping hardware unit
>    * present in the platform
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
