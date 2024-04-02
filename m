Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E502C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IrDqQMiUE8cZwCa+YphOcVyRNNSYIoiVZ8a/f1BQq8=; b=TKURNigrvsHjjxxiHF3kqze11i
	hgWZQrffEEYOKEwjk9MB9ujRTyicvfGiO7Z2HlJWP/IpQ45aQZJnb6b3TWmsai01LfPhB+yimQH6c
	Z/K3rr6UcDJ6UcfR2R7MQp0cMKHRajNC3OXeLfDXsiqHftqxiPVrMO/Y5B2V2WilGWBw92EUgdM84
	+nD7nWenEZ3f9FCE1JYvnOVnjTdL1di0Iik95DxB/xP9JQxvOEtmWRKYo+FhemE1sFQCWFedwi0QO
	OM7dcAQZm3gV5m5HXNwjES0w8lVVG2j3+aBx8TuX35LkpVaWEGr6wOz3qRF8Gp0PrtrajYcPnzHEw
	LJBdEh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb61-0000000AaH3-3fU4;
	Tue, 02 Apr 2024 10:10:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb5x-0000000AaEp-49Yi;
	Tue, 02 Apr 2024 10:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712052619;
	bh=0kebiPk3tKa7/IHwyWmTQTorTf80HcI+vNk71eLMMfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yALmyE4v5Uk7/0unVC+y/UOxPUvStllE+5MALfnESMk/JZnZY2xEGUMFxLXHXmOYZ
	 DDR8xv67oMX6e0PabhS+CU7bsYYMORlBGN7WK1LmSzwmeJZNMOQfgt1JOlEK3WiwXs
	 rs+LOrM/FPBTNRUOhGsyWvIctp0xDzdsQ4oHpxZT7oOtpP62tYvIieFRkVeQOf0cOq
	 0MoBi1S/8C/5pvOP0WlDF1qP1x3wAaG3mgesYR7vJStVdLUOfMp92hRqqNPoxN/iBo
	 haLCdCu03AxewvFtNfVtgznCxrf2O2rG7Uu/qxNhEhqZ7UTx9TIW8M7NIa/E4GunlL
	 n6tL3q1UjIGbA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4FA237820EE;
	Tue,  2 Apr 2024 10:10:18 +0000 (UTC)
Message-ID: <e3746b1b-fe23-4205-a5f4-2fb8ff6a9fe7@collabora.com>
Date: Tue, 2 Apr 2024 12:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Init `ddp_comp` with devm_kcalloc()
To: Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, "Jason-JH.Lin"
 <jason-jh.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_031022_195555_FD81C38A 
X-CRM114-Status: GOOD (  15.21  )
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

Il 28/03/24 17:22, Douglas Anderson ha scritto:
> In the case where `conn_routes` is true we allocate an extra slot in
> the `ddp_comp` array but mtk_drm_crtc_create() never seemed to
> initialize it in the test case I ran. For me, this caused a later
> crash when we looped through the array in mtk_drm_crtc_mode_valid().
> This showed up for me when I booted with `slub_debug=FZPUA` which
> poisons the memory initially. Without `slub_debug` I couldn't
> reproduce, presumably because the later code handles the value being
> NULL and in most cases (not guaranteed in all cases) the memory the
> allocator returned started out as 0.
> 
> It really doesn't hurt to initialize the array with devm_kcalloc()
> since the array is small and the overhead of initting a handful of
> elements to 0 is small. In general initting memory to zero is a safer
> practice and usually it's suggested to only use the non-initting alloc
> functions if you really need to.
> 
> Let's switch the function to use an allocation function that zeros the
> memory. For me, this avoids the crash.
> 
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: I really dislike the dynamic selection stuff, as that's only a partial
solution for something that should've been in DT from day 1 instead.
P.P.S.: I took care of that already - a series is about to come in a few days.

Cheers,
Angelo


