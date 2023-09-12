Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A3CA0EF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXeuto9r5yAX3c2XpmG8NYTqGdZyijs8f1WvKfj+30c=; b=CLHOTK36KV+xE2wn+0YgpajshW
	XZRk4beCk8LY6edqPfKnx4FXH8gRUFmp9zrQC7zS1OrwbflgQLPoUKygEqN/Yt4tJMUNcA3gk5KZD
	zW0XZJHwvvZcl0jcxu/Kxbcu4wqORTVB7ghe/NYXAvfPE7D8K3p/3pNJO3ulsgehivIhaL1aX85F+
	cz5byUGh5RvtW2xK2nU8P4YmVkoRLSpd8EDMZlquD24wiCB5/QBQo1rFlp+gWKSlTyVEqUegB4JOa
	a4xj6mRkHIJNRp8NDgcQ2UalB/mnb5X9EGJ5Bv3mI95ZGhMPk5hRi41Vnvl0facBwtmBzdZilmmkF
	U1DGIraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6do-003sAI-1x;
	Tue, 12 Sep 2023 16:53:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6dl-003s9d-2P
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 16:53:31 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A4E6366071C9;
	Tue, 12 Sep 2023 17:53:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694537608;
	bh=6lCw98iaIKfYLWDPpsaLngfvT7UkpYXBkxsUlQltt4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HYfJFGquoDoVsDxe6BGBe0qelSuhXeWbnnGgmDdlnr0VEJcGlFU1NRGDlWWa1BHPk
	 3rvq9wH/ct+khzCMCSLfwGZAtFUyhxc44G3pfnwq7En5GmyzxiPqGuRe0bZa1KqZhR
	 udwBfkv5gJ4ZyVZMqmN4Dwo0t109kVqn69E0xSXAak5zH7ZiR6ujn8EgXSb3TxoaTx
	 WGxtHRMLrTdzpv8PEzvTKYGXhXJzsdJ7g0pT3jEduTOIzt+j2WCMIggAlv7ZSOsM8s
	 BKneObztNcl1r+TdzXbUMFdTSmNhOALKKbF8tOVPqV+niknSEws4uu56RIlenGRfpx
	 9pIcWiuVQhvwg==
Message-ID: <b15fe4b9-9907-72e9-c1a0-35b065aa4732@collabora.com>
Date: Tue, 12 Sep 2023 13:53:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 5/9] drm: ci: Enable regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, daniels@collabora.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org, dmitry.baryshkov@linaro.org,
 guilherme.gallo@collabora.com
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-6-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-6-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_095329_934069_D7BC98BA 
X-CRM114-Status: GOOD (  13.03  )
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



On 08/09/2023 12:22, Vignesh Raman wrote:
> Enable CONFIG_REGULATOR_DA9211=y to fix mt8173 boot issue.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig
> 
> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 817e18ddfd4f..ca95e141a7ae 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -184,6 +184,7 @@ CONFIG_HW_RANDOM_MTK=y
>   CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
> +CONFIG_REGULATOR_DA9211=y
>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y

