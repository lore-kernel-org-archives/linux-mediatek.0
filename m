Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC22C48BF8
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Feb 2024 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzAI/Z1Hzj+rdsyWO+hJuSqFzMCf2shnDllCY7LQVqw=; b=Yo9Jgd3hbf9UECtBV5w3Ro2lGY
	7IC/0/ar8H2j/I3EUdm8GK+UhhoqxFf7AV5dCEYVEaPzvJVRRkLqtumIFM/KP11pbR7Zpj6tYZ+Bi
	LkZHWg/FQsnnfRRvcz8N89NW/JJ3F5op10VwbFN2Tlidhc6iB8Q3uu24jZe0UqVIusP74NcSMU9fU
	2Ke0izIkVHtFgpKkuygjI4HA3JcdbB/+Yk8fhsgHekYUX/gmzfREa+42uBzmYVbItYB3psiYDWgBp
	ZFqsgO6dafK/r3Rol2/cAgIsXMpD2F6th/etGHzs1DatH2VXRs3wQNVrK14PECKOHCienRtoy3nRA
	+ojGQIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbdW7-00000007POT-1lF3;
	Sun, 18 Feb 2024 09:31:23 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbdW4-00000007PNn-2kqX;
	Sun, 18 Feb 2024 09:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708248681; x=1739784681;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H/OSay05+csAHwBP0A3xim8Jfufbq4gn0ZbQ5TgLGOo=;
  b=ZwLqtAdQf3L1uAgmUZsC0so3KlsOrxEErmePCRBwIcT6VfgU71u43txs
   vfA7+DPKywGzFT8+aqZJHxXy20+D2sNmiMyr3wA5fSb8lCsT4ImRaXbdh
   Kue3+PDZYXjkvzGITZ0sFAcmTpw31CYR6ThrBNqLl+R8KUHknbYB+twTX
   v9dZ7DjvFRzcj+5QR8/JFdbIjvIdjrmVTCnmXjaSYLL0W85RG8llFo+tP
   v9hKb4PqRRJHompML8im2vQvouPsKMJ186b69tl0N9ZIK7hiFr7kJu6YT
   S1BcXMdbvuWw5T1J2enarz0FkdhFU3LB4gFQkg1/mw7kVVPLSQJ+LnAtl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2200309"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2200309"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 01:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="912682691"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="912682691"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.209.212]) ([10.254.209.212])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 01:31:09 -0800
Message-ID: <7b18a339-d0e3-4347-a20b-8fca9bbc7eb4@linux.intel.com>
Date: Sun, 18 Feb 2024 17:31:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com
Subject: Re: [PATCH 1/4] iommu: constify pointer to bus_type
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@gmail.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_013120_820685_2C3FB937 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

On 2024/2/16 22:40, Krzysztof Kozlowski wrote:
> Make pointer to bus_type a pointer to const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
> ---
>   drivers/iommu/iommu-priv.h | 5 +++--
>   drivers/iommu/iommu.c      | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

