Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC6C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 10:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CB9221F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 10:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O/mi1nfn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CB9221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WIlMocvkznzQGEE2qDidBaSYRbAvZ52v/yada22CH5g=; b=O/mi1nfnMgvN1Bkip9wuKn9mC
	5tmrlYtOgSdDAEAc2tsyEmCzaz9Nz2T7UFDB+xZjTCeOtDJLpDhTvelJUKu4vGwz8+i5x0V1WZlzq
	p6bgOiznhWqUFX7RIv5Qbs4KeLhjMvefo5ndL5YCQ84jvfEJ0te51/QnLU7qxNHjxeo0ly/CNJppU
	eSiB9AJcFIpKi2NDeYLbN7p+TNmT+epeswEUBab1R6KGcg0kLoHMqoZmEy9M4sorTte1ebk0irC6w
	F5BJSjfym+twKMqKrkUjS6q39Alp/mcN41rCdEw7VqvhgDAXwrB69C/vTZMVircKYvNs9qhOdsPt1
	avxHpRzkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaGFk-0004mp-Gs; Wed, 04 Nov 2020 10:42:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaGDW-0003LY-JQ; Wed, 04 Nov 2020 10:40:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id F359A1F458F3
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Fix unused variable
 'mtk_dpi_encoder_funcs'
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
References: <20201005162241.172912-1-enric.balletbo@collabora.com>
Message-ID: <9752ce85-a3e3-1e2f-c9d8-eae729364fee@collabora.com>
Date: Wed, 4 Nov 2020 11:40:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201005162241.172912-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_054038_831528_90C7B817 
X-CRM114-Status: GOOD (  18.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

On 5/10/20 18:22, Enric Balletbo i Serra wrote:
> Commit f89c696e7f63 ("drm/mediatek: mtk_dpi: Convert to bridge driver")
> introduced the following build warning with W=1
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c:530:39: warning: unused variable 'mtk_dpi_encoder_funcs' [-Wunused-const-variable]
>  static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
> 
> This struct is and the 'mtk_dpi_encoder_destroy()' are not needed
> anymore, so remove them.
> 
> Fixes: f89c696e7f63 ("drm/mediatek: mtk_dpi: Convert to bridge driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

A gentle ping on this small fix. Thanks,

  Enric

> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 589ef33a1780..2609d917e3f9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -522,15 +522,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	return 0;
>  }
>  
> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
> -	.destroy = mtk_dpi_encoder_destroy,
> -};
> -
>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
