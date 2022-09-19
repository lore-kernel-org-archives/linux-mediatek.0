Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09A0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSgfXRkcdEKK7glSkNub9kl48m36BhjY9Gmv+2s96Qk=; b=g7dhxFsMaTlE95zrXqmvjEqsHj
	AlQw/qvjIvzvC7pj45omVny2PfpgrLnoiIa4kinMDokfomZ98sEn2torryoUSu1ATRr5dBX0Hlm44
	/DF+bcBZjXsoLG1/I5SwvFAbq0WZrlp61a+9ovGqjrCK2S2wADUV2LDtWWsBDZPfCAv1CX8eJmPsO
	4nbXx6YB0AwJSzXsxkHbPJyAi5IXHJUsOq4wXyqNPo2if4Sb1zC7u9Cr258sSJPYctCZFXHvgxo5r
	mfqbzORFRBC0aVYGNmioxsQaEq7D9gqM+3sJHfrpZC0ROjJMM5c0Fe87t7vUjhHvf4sM05br+Fgox
	K5wTiEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGtY-00Bsiz-Sk; Mon, 19 Sep 2022 13:33:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGtN-00Bsg7-PX; Mon, 19 Sep 2022 13:32:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8264660159F;
	Mon, 19 Sep 2022 14:32:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663594375;
	bh=TBhtk3gr4d0sylPaOG83cBfrnCWZRMcFZEocaCMqSfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OaJ8GPRjLhVosM1A/PUElwHNEgeWvltDbM6oZu8+WuZmcnch01XPp21pn/ewA7V70
	 P45LJ1m110d2xmCzDAh517/7Pta90saLbYE0c+urvKeMONCZvH8BgM3pJbJARQ7SVM
	 FZBFIfgtevaC0qCGU4ahm5D7/R+0SAMv28D8MJ6NCD8U1s/pB0dZZpLOPhDw7WqDNX
	 QoN8TyOsZsIxjD662CnOZcP5ezoNbJJFsgyVApfT7v8TfJ66vITMJg8/p7RHdLLRZ6
	 rtI/adJF5CH4FxV/TH9+q6CZHYb9R8AZ6E6Jb5o7qNNklC5cyXo58Xp1tPX+RJVhgl
	 9E4Ee//hum6kA==
Message-ID: <227bce07-37cc-da1d-fc99-065a12cdf3f5@collabora.com>
Date: Mon, 19 Sep 2022 15:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to
 mtk_dsi_poweroff()
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jitao Shi <jitao.shi@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220804194325.1596554-1-nfraprado@collabora.com>
 <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_063257_976364_E3932334 
X-CRM114-Status: GOOD (  12.09  )
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

Il 19/09/22 10:40, Hsin-Yi Wang ha scritto:
> On Mon, Sep 19, 2022 at 4:39 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> As the comment right before the mtk_dsi_stop() call advises,
>> mtk_dsi_stop() should only be called after
>> mtk_drm_crtc_atomic_disable(). That's because that function calls
>> drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.
>>
>> Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
>> refcount, would only be called at the end of
>> mtk_drm_crtc_atomic_disable(), through the call to mtk_crtc_ddp_hw_fini().
>> Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
>> enable/disable and define new funcs") moved the mtk_dsi_stop() call to
>> mtk_output_dsi_disable(), causing it to be called before
>> mtk_drm_crtc_atomic_disable(), and consequently generating vblank
>> timeout warnings during suspend.
>>
>> Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
>> a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
>> getting vblank timeout warnings.
>>
>> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


