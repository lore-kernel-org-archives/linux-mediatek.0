Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E3FC48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec+HfulWnFdZLySKE8Yk9N8CDwVxn2I881+DjZOg4P0=; b=RMlnl5cwlrJnE1WSA9xgyD8B+B
	TlEjVbutqkIAfngAjVQudUZbF3GKjzXQLbUWc5P+7RSEhjCKBly5gIRM/F18uhwOWO9YhrnhB0d/Y
	KKN1CDFoMhhwZqDiXS8X22CaZlkbnalz58FGBm5c4F0XvNzgBI095DTlucEGl5u+PQxnWDm36Ak5v
	tvpWuw8C/u+N2lCsLpKxpse9VUWk2v/1RzFMRkJwxcaDExNkky0VqkK0n5+YEYi+nMsdmBaIKqEhG
	ggkfEhHsxt3f+oufUoZs7A/TVFJ9hWzxcV8SJJKhfc/irKhaMWDGHRAFH5C23SpNQVdsa4z5/Ail0
	SUu85jjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raG0D-0000000D8GC-0oRr;
	Wed, 14 Feb 2024 14:12:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raG07-0000000D8CY-3TsW;
	Wed, 14 Feb 2024 14:12:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1raFzr-00046P-39;
	Wed, 14 Feb 2024 14:12:24 +0000
Date: Wed, 14 Feb 2024 14:12:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 2/2] pwm: mediatek: add support for MT7988
Message-ID: <ZczKP-L7MptwnKF_@makrotopia.org>
References: <20240214140454.6438-1-zajec5@gmail.com>
 <20240214140454.6438-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214140454.6438-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_061239_895674_D1B30E9C 
X-CRM114-Status: GOOD (  16.01  )
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

On Wed, Feb 14, 2024 at 03:04:54PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 uses new registers layout just like MT7981 but it supports 8 PWM
> interfaces.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> V2: New patch in the series
> 
>  drivers/pwm/pwm-mediatek.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 562102a47ac0..292c8bd5b343 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -339,6 +339,13 @@ static const struct pwm_mediatek_of_data mt7986_pwm_data = {
>  	.reg_offset = mtk_pwm_reg_offset_v1,
>  };
>  
> +static const struct pwm_mediatek_of_data mt7988_pwm_data = {
> +	.num_pwms = 8,
> +	.pwm45_fixup = false,
> +	.has_ck_26m_sel = false,
> +	.reg_offset = mtk_pwm_reg_offset_v2,
> +};
> +
>  static const struct pwm_mediatek_of_data mt8183_pwm_data = {
>  	.num_pwms = 4,
>  	.pwm45_fixup = false,
> @@ -369,6 +376,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
>  	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
>  	{ .compatible = "mediatek,mt7981-pwm", .data = &mt7981_pwm_data },
>  	{ .compatible = "mediatek,mt7986-pwm", .data = &mt7986_pwm_data },
> +	{ .compatible = "mediatek,mt7988-pwm", .data = &mt7988_pwm_data },
>  	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
>  	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
>  	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
> -- 
> 2.35.3
> 
> 

