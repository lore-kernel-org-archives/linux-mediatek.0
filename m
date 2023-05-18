Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A6C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOj9DkEAsffGRvIc8YyAR4RG7FpCib/7HWlSzpx9EZ0=; b=x2uwxF+2yvQPWKrInjiYHKWzd+
	XIX9MjYx7YixiH3xmwhpHfAFibaRO4t4gweN6dGjmrl9ayqqUPhOrTCiyMD2vAl7yRCsMk30hBdpd
	ffS+1GXuH3chu5VJMR2aCW35U3AYV6tOeXuzknixGW18Od8Sdp4NRNCHTgDYNuU6gb6nQKJiEd8di
	y60S8J2PGLzAyfS3bljWe9QuDz61m2C4C9QQjuRgtH8S/ewzilIaoXLFxydiImbl63A+G9ngT99n3
	fGmxIOwiGbCMjNpT4frvhQOP9JR/b6/9R1eR4oja8LQvcxhYsj945ksQiCPjQPVgw7/dMSwqdUYoH
	KfwMhl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pze4c-00D7nc-1Z;
	Thu, 18 May 2023 13:53:42 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pze4X-00D7mP-14;
	Thu, 18 May 2023 13:53:39 +0000
Received: from [10.0.0.182] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 757FB1606D6;
	Thu, 18 May 2023 15:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1684418006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOj9DkEAsffGRvIc8YyAR4RG7FpCib/7HWlSzpx9EZ0=;
	b=YFjVINfxoE+aBlp4VV2kbChSgiAOoB9PyHhWF4UAUAIP+rTmMSIcyV37JXpc1mbRMBd6iS
	Plj0O1o2aM+3+O8m2K/S9QUzccpMUxkQU44Cy95o6K1Akw+HsQnFuVLPMdMXzP7vqclMTm
	zh7U2tA0JCiTyYNQOTOo9u/H/zPuqXE=
Message-ID: <2ae4d22c-b278-e21f-bccc-f8a1757dcf3b@ixit.cz>
Date: Thu, 18 May 2023 15:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from
 Headphone pin name
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, nfraprado@collabora.com, wenst@chromium.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
From: David <david@ixit.cz>
In-Reply-To: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_065337_725114_DAB642C7 
X-CRM114-Status: GOOD (  15.24  )
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

Reviewed-by: David Heidelberg <david@ixit.cz>

On 17/05/2023 17:15, AngeloGioacchino Del Regno wrote:
> Function jack_kctl_name_gen() will remove the redundant " Jack" from
> the name, if present, and then it will add it back, so that all of
> the controls are named "(pin-name) Jack".
>
> Remove " Jack" from the Headphone pin name to spare some CPU cycles.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> index 5e163e23a207..4e0d5bf12b47 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> @@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
>   /* Headset jack detection DAPM pins */
>   static struct snd_soc_jack_pin mt8192_jack_pins[] = {
>   	{
> -		.pin = "Headphone Jack",
> +		.pin = "Headphone",
>   		.mask = SND_JACK_HEADPHONE,
>   	},
>   	{

