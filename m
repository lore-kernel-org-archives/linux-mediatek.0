Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF4FCEACC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O9vtkxs+ZPBAMCh5e5Bft1cypt+rr2snnilS0YqVbQ=; b=Mhz13zolHEX/Qt/Vte9oZiUa7X
	OjtDhOjrVUiEnLYLbhP5y0Z5lCM75Mx/KYnNBzatD+XSggZrzYzdeG+/iu6hyHdpU3a5sTt2PuxYV
	ftuYUW56S04Weh7Pr102lC6rYhhmL2flVb0ntmbOUR0cLjre2G8/EYZX1GSWCWvd8j9OARdrBOaYb
	9v8FtO6uwLMJUIxUGwUSOw5VE/xw1DNxVuj1FtPyQtx30dcCxhpHfA/qFsMdxbEnFo7+888z7qT/Z
	Shllp7ynLXznQtqaO3oqOuVpugGaklhGNj9aom4ZIzPubacwTR8G9h70JRhiVoMGCflToCtnr12LJ
	lRuQlafA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svdH7-000000030MO-3jDl;
	Tue, 01 Oct 2024 13:50:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svdH4-000000030KS-1iRk;
	Tue, 01 Oct 2024 13:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727790644;
	bh=Wrdy0e1dz6T5uwCE6i2Zj6+AsBKQNypB0lnUzsj5xCI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=YKqD4Ys/oGurqoWIOyx7Wn0hRTWDfyPPhsxJBv4liLaL79RWNITs6yYigoa9t0bYR
	 apYOKXRQwcu6+xBYSMhtRzZYX8riNbY3jwGgx54B/mqtnC6ECCMjvF74G/KjKZbgVO
	 RJzRdFANc0GPw4iUWTjgPb0VclImiN7kwj4rnOBg0+pqJjlWEITVsXj59SE2r7LUoj
	 5BPDH1RBCLKq/QZ/2cqqNz0kemyYFg31AZl1ypfI77sHEXKV+OTQMPdPXhzsDquLmV
	 MCPct2nkHj5eYZYOGgoLbN+JW1S3vLWHHoQv7M/X9CrsLunLU6HnxNWpHM5ZiXsYda
	 Riy6fn3Jf9ZCg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F28B17E0FC0;
	Tue,  1 Oct 2024 15:50:39 +0200 (CEST)
Message-ID: <87fea8ea-fe9d-4114-b03c-7ec50a4be874@collabora.com>
Date: Tue, 1 Oct 2024 19:20:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/gpu: ci: update flake tests requirements
From: Vignesh Raman <vignesh.raman@collabora.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 quic_abhinavk@quicinc.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_065046_685107_7822C6F7 
X-CRM114-Status: GOOD (  18.07  )
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

Hi amdgpu Maintainers,

On 30/09/24 15:22, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for amdgpu, i915, msm and xe driver.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> v3:
> - Update docs to specify we use email reporting or GitLab issues for flake entries.
> 
> v4:
> - Add gitlab issue link for xe driver.
> 
> ---
>   Documentation/gpu/automated_testing.rst | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..6d7c6086034d 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
>   Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +bug to the author of the affected driver or the relevant GitLab issue. The entry
> +must also include the board name or Device Tree name, the first kernel version
> +affected, the IGT version used for tests, and an approximation of the failure rate.
>   
>   They should be provided under the following format::
>   
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>     # Board Name: broken-board.dtb
>     # Linux Version: 6.6-rc1
>     # IGT Version: 1.28-gd2af13d9f
>     # Failure Rate: 100
>     flaky-test
>   
> +Use the appropriate link below to create a GitLab issue:
> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues

Please could you ack this patch. Thanks.

> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
> +xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
> +
>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>   -----------------------------------------------------------
>   

Regards,
Vignesh

