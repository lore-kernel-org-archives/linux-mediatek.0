Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC6FCA0EF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AglBmOiWnP5rw38ELObOvSe/t6G8PuHkpmazY9f1D94=; b=qmv48m0dppKfSdrt+P2XPmNnQV
	j160PYQv45ZVD8q0wFAidOVMPIhvOjXoAm3dX0p4QhQO2ffIb1zI/bAxI4aeinXBep7iuK5TRHKtW
	pMvsG4h2bHciTNnDwXq2wxbVHDmufbLaUd4coo9O3tEaLBjhA8UMD4bz8QrxZ3X37kRlv/MXazYIt
	iTn0TuypbefM/HxV/ilPVcuvsUFpMyzJZaa43Qiw9nAtrUPzcY4O7AnJdiQhMGLqAC/ZzmfCFkAHm
	g7RmIJGOX4drKcmJq0hUpO2s9xrZcgidajQ+7cnZKSu4qS4krTmCqXSNKec7fe8pUmZALsm1PaLZf
	V6FcTNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6lf-003sbI-04;
	Tue, 12 Sep 2023 17:01:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6lc-003sad-1b
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 17:01:37 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E81EF66072B4;
	Tue, 12 Sep 2023 18:01:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694538094;
	bh=XGlNAhRdPXO/CVxaBfaU+R1lxP9eWdQQ0iJwXNREACQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fd17yMXHTH20mN4mXh8JVEEB4d069PZL3cUp7KY2Rk1OCWI4cpH+3h6udTtvxjnCB
	 RDKHlLk5tB5KshHXuffH2Ek5PMIDnkI013k5HJmVVkiDm13gFwkrMwoZD+VuW49O7G
	 2XMLqu5RzCBPkW7puEW1CfDvp5KbsUPsy+D0uCmNv6O407oE4JpimvR5Ca1mrrsxgg
	 4ZVl8lcOMeCVQMzba/hdCxkHWdqMf27r86V8VHKMkxs4UfMdLMI0V9GDmxii4kfgdc
	 TjcL8hijrQZqbiEDpCZ55a580BupKPEQw8iCyoxfAfwgWwk8DYf6BpPmKua6B5BMGU
	 MOK1oJuWVpSzA==
Message-ID: <9d8a92ef-3442-2317-ada7-71d5e76573be@collabora.com>
Date: Tue, 12 Sep 2023 14:01:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 8/9] drm: ci: Enable new jobs
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, angelogioacchino.delregno@collabora.com,
 emma@anholt.net, robclark@freedesktop.org, robdclark@google.com,
 anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-9-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-9-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_100136_682302_D5B4631F 
X-CRM114-Status: GOOD (  15.15  )
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
> Enable the following jobs, as the issues noted in the
> TODO comments have been resolved. This will ensure that these jobs
> are now included and executed as part of the CI/CD pipeline.
> 
> msm:apq8016:
> TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
> 
> mediatek:mt8173:
> TODO: current issue: device is hanging. Fix and remove this rule.
> 
> virtio_gpu:none:
> TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - Reworded the commit message
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index d85add39f425..1771af21e2d9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -108,9 +108,6 @@ msm:apq8016:
>       RUNNER_TAG: google-freedreno-db410c
>     script:
>       - ./install/bare-metal/fastboot.sh
> -  rules:
> -    # TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
> -    - when: never
>   
>   msm:apq8096:
>     extends:
> @@ -273,9 +270,6 @@ mediatek:mt8173:
>       DEVICE_TYPE: mt8173-elm-hana
>       GPU_VERSION: mt8173
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
> -  rules:
> -    # TODO: current issue: device is hanging. Fix and remove this rule.
> -    - when: never
>   
>   mediatek:mt8183:
>     extends:
> @@ -333,6 +327,3 @@ virtio_gpu:none:
>       - debian/x86_64_test-gl
>       - testing:x86_64
>       - igt:x86_64
> -  rules:
> -    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
> -    - when: never
> \ No newline at end of file

