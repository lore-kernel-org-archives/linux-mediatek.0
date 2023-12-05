Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6838C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kgVN6nJ5Ncn9mQ1aGfgPgSNjK6UwJy0NnWl05SM/J4=; b=HTGHso4bOS+8ZGzeRCy8/BrFRZ
	ynbSdkTRdamnFbAHuo870Lx2mFLt8DPfWQMf1dgAGV3DERwQRw+LKbWSKxmLsS9ClQ4PWlP+QF0vA
	PtOCbw5E2g0Ww6v7WVgASRWwgBtngmTygmw4N+84+yThYAeY0neecpBRtLN8emrHP1BIhfRsKuGnT
	hd4m8a51JKzpCPlCJ9Q5JIdCjPI+LUSumeDNLLU8RduqVaX6Q8EpH+e9xbw1trVka8xJC07E3AqPh
	0O/JCjql2+GIfgExs7NQGAC75iY/DDrQyvZlwh3tSJWtWK6Sbhzi92ti6V0fXChMfKcQ5bFmMEfPP
	E/sQisAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZh6-0085Ok-1b;
	Tue, 05 Dec 2023 17:58:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZh2-0085O5-25;
	Tue, 05 Dec 2023 17:58:50 +0000
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DFF5660715D;
	Tue,  5 Dec 2023 17:58:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799123;
	bh=4K1nG0XcLJCaqmXjT00pOtA2M+BKj18KQH6LnXZWdi4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kNeoQvdoOS3DwcND2QZyfuEIZsgZyU5iZ15cm4yY/NVzUTn+Vl3WFhBEyfMrRP+ll
	 E/TlLTyM7BcYLGTRiNX/sN/0nh1S3MT0Ph/7eVCl96LVANv9h4wDH4qNcellEzTLsd
	 LL2OTdZcCh3Lmz90qR8qOZBYlOJ2pdSwmi7czM69qCblgHSzrA6IHwcrHdGXi4buYM
	 RD2ICfN+PGZbpeL0LnkmTMuwyZnS4ZA+a7ZLAQVroahHgUDxPecy7cLs8r5C/5PmcC
	 RmwHlTNtC+b8kBViwPC25X9IstWWgGdHQceVBM5FBqn1K6c+SeMI6G7Gc0qcyE+NQw
	 2fcz4jmWaOTHA==
Message-ID: <136041c8-bbc8-49b6-a3ff-7236e79afa5c@collabora.com>
Date: Tue, 5 Dec 2023 14:58:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for
 mt8173
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-7-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-7-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_095848_833238_CD61A2FE 
X-CRM114-Status: GOOD (  15.57  )
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

Hi,

Thanks for your patch.

On 29/11/2023 09:18, Vignesh Raman wrote:
> Expected driver for mt8173 is "mediatek" and for mt8183
> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
> the expected driver for mt8173.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v5:
>    - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
> 
> v6:
>    - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173
> 
> ---
>   drivers/gpu/drm/ci/igt_runner.sh | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index c6cf963592c5..70a0f84021a1 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -30,6 +30,10 @@ case "$DRIVER_NAME" in
>           ;;
>   esac
>   
> +if [ "$GPU_VERSION" = "mt8173" ]; then
> +    export IGT_FORCE_DRIVER=${DRIVER_NAME}
> +fi

Just a nit, could you add this in the first case statement? Just to 
avoid confusing about double assignment? -> but feel free to ignore this 
comment.

With or without this:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> +
>   if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
>       IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
>   fi

