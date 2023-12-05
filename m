Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A857C10DCE
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPkFqbAZOMxvZ7zHXTmYXxsEz0Q27vav1/IJtOH9x70=; b=bCtzpPQZrgDnGzj02kdJrVXUst
	n/lRk1C1sq28ajDNn5IXpxXxSO8qy7hAVPFuEbP3hglfSZHuJYcvIcW0OYexV3r4BgMjN1gt7rfhK
	esoqHZyM/C847abTpBTkpc7PoMapEM0CaBrj9T/p6cbGCPs4Og5cd3AsfIVHAopQVx9l/ryF8DUhr
	F/uXP8tR6BsqPa3RBDppAvqp8UWHK6jlXx1Yg8KYm5kel5zuLz3GAp0o8G4Dps3KClHyW53a4fyag
	zc+Hy1Gl44JN+WtGqS0rW+gOoyrkdc6tm8hOLxy72At3Ixo6SI9ljgEKTf5AInR5fpiwM3wBciQ69
	zxUBSDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZjA-0085fY-0Q;
	Tue, 05 Dec 2023 18:01:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZj7-0085eY-1f;
	Tue, 05 Dec 2023 18:00:59 +0000
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F433660715D;
	Tue,  5 Dec 2023 18:00:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799256;
	bh=RgkVHjxMEsdXllUes00vbSqVmLybs60goWYS6kaWos8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FksvE4Ga17Z+a4BzWvMY/16U6sbJxavWMiB1tuCqhvG2l/iOMPypzK0mWMcq0yjTQ
	 bhX/HsWwRYZHkW8QgV14rI4VOvDjYtTH01HaqZR0rqOwr3B35KNPl4Tgq0UaWn2/hQ
	 agqC7hEHzp7ekxcJX6CbAb0xtepUiCUkaUTm3zM7CaR1aF3teuzGmGtzaJV7eUUzB1
	 oAgJuZlvXBgdK3hIsLxIEjBFaWjsOg+GLAyutPNqQvZS29FMf6a/1DmN6etZfVfxlS
	 4RIsFTFctyCuX+dBSDMNrU4wTwAfIm1MbdFFv+209MYurr+5GIbWWHgpGKW/nq0low
	 DnpSecXjQGzTQ==
Message-ID: <03724cf8-e7c1-462a-80a4-587f5df202ef@collabora.com>
Date: Tue, 5 Dec 2023 15:00:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm: ci: uprev IGT
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
 <20231129121841.253223-9-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-9-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_100057_685647_62A276FE 
X-CRM114-Status: GOOD (  13.93  )
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



On 29/11/2023 09:18, Vignesh Raman wrote:
> virtio-gpu kernel driver reports 16 for count_crtcs
> which exceeds IGT_MAX_PIPES set to 8 in igt-gpu-tools.
> This results in below memory corruption,
> 
>   malloc(): corrupted top size
>   Received signal SIGABRT.
>   Stack trace:
>    #0 [fatal_sig_handler+0x17b]
>    #1 [__sigaction+0x40]
>    #2 [pthread_key_delete+0x14c]
>    #3 [gsignal+0x12]
>    #4 [abort+0xd3]
>    #5 [__fsetlocking+0x290]
>    #6 [timer_settime+0x37a]
>    #7 [__default_morecore+0x1f1b]
>    #8 [__libc_calloc+0x161]
>    #9 [drmModeGetPlaneResources+0x44]
>    #10 [igt_display_require+0x194]
>    #11 [__igt_unique____real_main1356+0x93c]
>    #12 [main+0x3f]
>    #13 [__libc_init_first+0x8a]
>    #14 [__libc_start_main+0x85]
>    #15 [_start+0x21]
>   
> This is fixed in igt-gpu-tools by increasing IGT_MAX_PIPES to 16.
> https://patchwork.freedesktop.org/series/126327/
>   
> Uprev IGT to include the patches which fixes this issue.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v6:
>    - Added a new patch in the series to uprev IGT to fix memory corruption
> 
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index aeb9bab1b069..dac92cc2777c 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
> +  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0

