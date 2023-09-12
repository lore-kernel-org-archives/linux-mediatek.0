Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675EACA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/E9g36mfxlQrh/zLEYJemBB+UDXouQWppD/yp9EXVU=; b=YcoPB6HOCoMGSGQurxY8e/MOQt
	Qe1q0e4ziq8V6Wu1x7xYmRX/GKM2f1y33D8l7YOvn7Oe0xmTudLXt+DbDcR3p+qDgeo9WqEo/lmEV
	mf9X68oc8IDQyjEEBmpDNIF7r9O9a+3ZZLFTeV/5MrfgzQRwZ9stPAi1P2tDMUyvRW8M/rLa9xsuh
	F/xlS5WlySqWYtpGOUxoM6DRlItqGpBSJhooaGhJjUuWHDU1K7QSUlsJjuj/aKTnk6KEJVF+n5bj1
	dqQQT5pIFDD/IbCW4DJF/Q0ZSzV7CRg7r2fdKyE+1yEepvD64GvNwLfibtK2tBf5OhsHbSLX3eyR+
	2po/0LKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6al-003rrS-37;
	Tue, 12 Sep 2023 16:50:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6aj-003rqO-0P
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 16:50:22 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61A08660716C;
	Tue, 12 Sep 2023 17:50:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694537415;
	bh=b3Pjb5sxufyfJz4YTfjIpaTwu6GqQK/gK7r+UI5k7ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IC9XweikCd8wdErjDdbQJM9Njzz31wFTIAhGgOAzdnnoYQbU1AUs+Pa5veanwx2A0
	 gLLM2cy4TlTjTQk7gPqHVr6yclTb2wKyv/uos04WCaDGVZDGRIkGwx5wseNTvXb5ta
	 bvOUi9N3zM8Pn0T66BaMTWLsVvPk3gqqS5hoRlbWBnRoIJ4B4UHtVFQ2S8TUqo5NWC
	 3gwc4F9mg1yp5NZ1QSLgG0WpgL7XqH0+4f2AWkODos/y7qgBvM/L51HdqtIydeqjP7
	 r8Y/i0H2Ups3oRZm3knp/sGrKMJEf/RoyLdD4Ct38HA6vceS+yqCVNzuerEg0an/Db
	 Dz8ha0wHIjCjg==
Message-ID: <113c0ae6-d7f1-b4d5-dc1a-2264cc815644@collabora.com>
Date: Tue, 12 Sep 2023 13:50:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/9] drm: ci: igt_runner: Remove todo
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
 <20230908152225.432139-2-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-2-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_095021_311104_4D8B788C 
X-CRM114-Status: GOOD (  14.23  )
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
> /sys/kernel/debug/dri/*/state exist for every atomic KMS driver.
> We do not test non-atomic drivers, so remove the todo.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
>    
> ---
>   drivers/gpu/drm/ci/igt_runner.sh | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 2bb759165063..5bf130ac57c9 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -15,7 +15,6 @@ cat /sys/kernel/debug/device_component/*
>   '
>   
>   # Dump drm state to confirm that kernel was able to find a connected display:
> -# TODO this path might not exist for all drivers.. maybe run modetest instead?
>   set +e
>   cat /sys/kernel/debug/dri/*/state
>   set -e

