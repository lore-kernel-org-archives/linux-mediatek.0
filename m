Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50857C4829C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neGvo50n5teVETzIsM2wrXXJXepatflRSnG5ankZPp8=; b=1yijmuU6xFPP2yrUSpahn0Cw24
	62Zw0GcDhWzg9Dp5hrsqeZKxe3ELX6O7i3xLic5frYHlrO3qzNXabCib80CrIzVCNOnKYj1tRBu79
	pOq+yWWMlQWR+S2ASeNIGfyinTLVZzQoHF2sdkO3roWeVcfThBkdOZzTDSikeSN8krdAf6cacE1sK
	wR4uSLSUVCIWnGaS1kgtFfmCC7tPygRCLjSrWNsWWTVKGpsg39T3V8jGRV3mgJpp9fqGjQF/9Mg4a
	SfrDW9GSI3u+Ut9JwqWDAt8kiPgJeBZPosha0Pp7haYs3smxPOEVl/AiEAtGL3QwPbnNFDFa9dxQd
	3fbOgoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVVb-00000000Ek1-01BB;
	Fri, 09 Feb 2024 18:21:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVVX-00000000Ehk-2Aj3;
	Fri, 09 Feb 2024 18:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707502910;
	bh=F+klo6fdojqlg+YAs2CadokLdG0bO4HyDw1qUizxtOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4j8DTV+GTNxYkGLZ5B+b9Y6izmx8bzBAqjMWKWheDJvMXwfF2rQcY4RqUcrWnH0ja
	 bMlR1gtPDoGA6eiM9bjD8yFS2QpA/i687MXj6w4L+xEvJht2lwoBvq4Pkc1xVygWKq
	 TeMAG/2lIdNoR6tXVIQt3yX1nSvSvzxj+rxVXUjFAlwniLs1qlfsjDiy2CCddlUiFr
	 K3N+WigVtKqeoXnXNPSe6waK4R9a0TgqLmQVs/wCay5f4pxgKzcvaIdPSUcnkhiAFG
	 n6k3PGfBQBP3J+AkTKoPR606UbG3g/P0wnUMHQirdDFAx8+YR5Ww0pL16OJI31h57o
	 F+wf7e1Wlv6dg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE55A37813FD;
	Fri,  9 Feb 2024 18:21:45 +0000 (UTC)
Message-ID: <d0cd95eb-4f16-4b48-97a4-cc74ba9f1345@collabora.com>
Date: Fri, 9 Feb 2024 15:21:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/ci: arm64.config: Enable
 CONFIG_DRM_ANALOGIX_ANX7625
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-2-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240130150340.687871-2-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_102151_759372_833E2F56 
X-CRM114-Status: GOOD (  13.94  )
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



On 30/01/2024 12:03, Vignesh Raman wrote:
> Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
> display driver probed on the mt8183-kukui-jacuzzi-juniper machine.
> 
> arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
> but drm-ci don't have initrd with modules, so add
> CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Couldn't you load the module as it is done on
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/ci/igt_runner.sh#n35 
?

This is not a blocker, in any case

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 8dbce9919a57..37d23fd7a367 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
>   CONFIG_REGULATOR_DA9211=y
> +CONFIG_DRM_ANALOGIX_ANX7625=y
>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y

