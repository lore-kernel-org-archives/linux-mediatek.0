Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09453C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ot2FcgV6TKJU0g0hx3hs9L+rNM96su9ToMyVwMtK/Dc=; b=zgRNL1A8iDjxKF
	FBqabuUXQCeVNLdThShcewZBZP9zAQQ5SToZHgorlzAlS15/6NWWED434qGf+ZHRJqPQtsWBFDfiJ
	3SkCA6xF1WrMAzKv7zT+9F/kaIMGiUjSaeh5CQvso0buydghUvCOMgyEKv0wPuDx3zLeL2b4oZxNN
	Yn+DWrQFIxN9vWoYHkBfE5RgROmn5tbrA8cgAnorHmWXHgGxIv/R0QeuOxefSlZF2ducpll6yl3qP
	4LKNOwAeqtmlJAVcsJLhEdWANgEBiv7JlBsapfjm6G6jCxHjzTzS7YS91OA20bu9pLhNuQXr/laGP
	eOkdDGfBGp8KEZrefVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB0E-000000045fh-2JSC;
	Thu, 07 Mar 2024 10:29:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB0B-000000045en-3qQL
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 10:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709807365;
	bh=qQoAPE4XH25CEU6J2ar4XCd0VI3maVhc+dknw7Ptp7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SDlIs6zK3Jw1APuXKGz3rdR9MXqUnidA/kxzDEdgMbWOJi1AeTJIcxGwFy8m6C8jB
	 O2KiL1MSwcjvyQJ1h37VjXvfKnqDbCJY8ntQXWUlsYVXiX+TbDWUZE7lw850E5tAoi
	 gp01m3eoWF6RMIoDnKGrRFbJ27vMpY91S84kifbAGawBJr7fXWKYyNtSLTeGxTlom9
	 pp9d/5sq1nZ9ZH6Cc2OAEFLiCfNHCfjfQnt23MQ1p59Hr4F6S/bTDLrOdHPrwhKuwS
	 14pLlgVPojJf/DQDJKqsQc5xB1IEwtiVXLvQ8qBVmtf1NkMu/nwH56OEZMLaoRcFN0
	 fzXVfVW6Rl6nA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02F193780EC6;
	Thu,  7 Mar 2024 10:29:24 +0000 (UTC)
Message-ID: <4c588295-d9aa-43fa-a2e7-adbace573b8c@collabora.com>
Date: Thu, 7 Mar 2024 11:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org
References: <20240306203702.3924719-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240306203702.3924719-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_022928_167858_4E133DF2 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/03/24 21:37, Justin Green ha scritto:
> Add a check to mtk_drm_gem_init if we attempt to allocate a GEM object
> of 0 bytes. Currently, no such check exists and the kernel will panic if
> a userspace application attempts to allocate a 0x0 GBM buffer.
> 
> Tested by attempting to allocate a 0x0 GBM buffer on an MT8188 and
> verifying that we now return EINVAL.
> 
> Signed-off-by: Justin green <greenjustin@chromium.org>

You need a Fixes tag for this one. Please add the right one and resend.

After adding the correct Fixes tag,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 4f2e3feabc0f..ee49367b6138 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -38,6 +38,9 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>   
>   	size = round_up(size, PAGE_SIZE);
>   
> +        if (size == 0)
> +		return ERR_PTR(-EINVAL);
> +
>   	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
>   	if (!mtk_gem_obj)
>   		return ERR_PTR(-ENOMEM);



