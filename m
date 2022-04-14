Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6jIrdlMQjBZqdJrXy3L/ed+gLoYy1Aesbp3+NTSyc0=; b=PEXgkAeWwlNn5s
	dTekw+06/j4SwNbPhZd1yX4SjteSqKYCXNqzZS+6t6Z8QJPdOV+FPakU1RQInEZgjab9/S2+72LhN
	DM8Yiim9cza/vxjnVnKtWLAwo9oDTXU1e+S3P+Nzv1pwLgtjQNEZP9bZumHEojZZ0Ip+sWZEoU3EY
	AsPfvuraaCAK+hfZYJ4Ps5kPAGSVl3NOC3TZEV70zmtcBMXmOJRhlV03Zvjene3d0OOnVBSgoCJq0
	uokafrQAL/kXbS2OqxQMvo42duTOS3kvNGYyoZ8nsVS/4PupkRmyEjye23MWnoeEblSvF+yeAzrOJ
	zs+UMwjQqrxFXPYjt6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ney3i-005LHt-88; Thu, 14 Apr 2022 11:54:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ney3X-005LEG-7S; Thu, 14 Apr 2022 11:54:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B009C1F479A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649937272;
 bh=b1Qs+7yt5i52Y0vqCOXaUWCnj9gXnqVJSriesALO6dU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BVo9/App19AXDvXABST6TIBcWiKh16uI6AF2q698a+uy8uLiJItQWXBgQf7+vVD0p
 xWtH3pmTQia4xYUp4WNnEp87B3gAH7Lvc6c4PAd7VgeDigmKlNjz8ZXX759Xy/C+E+
 hdI6fLFHxfcC6D5hvAG9H8WMk0ZF7KD/6orE8w5Kwk5Qh2S+s7f52MFrg8G4E4eBzb
 PRefpTpEJqcfnADQI2Kg2SDxDLkRLTP+0rnQ3EYV+cOeorjfR/AmX5PKXlahNZUYE7
 dbAvPxUBwRHMKIet4tXusWPoGt9fJ4z+rdlPuts0D3EfXVBKQvcZBUF1LxkktjqbRm
 i7UUWaUnSD9fw==
Message-ID: <d7234c71-f5c4-d623-16c4-e16c34b6de35@collabora.com>
Date: Thu, 14 Apr 2022 13:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220414081119.30851-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414081119.30851-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_045435_449054_5BC287F7 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/04/22 10:11, Miles Chen ha scritto:
> We observed: 'dmasound_setup' defined but not used error with
> COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.
> 
> __setup() does not work if MODULE is defined.
> Fix it by warpping dmasound_setup with #ifndef MODULES.
> 
> Error(s):
> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   sound/oss/dmasound/dmasound_core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
> index 9c48f3a9e3d1..a1b3e71beadf 100644
> --- a/sound/oss/dmasound/dmasound_core.c
> +++ b/sound/oss/dmasound/dmasound_core.c
> @@ -1428,6 +1428,7 @@ void dmasound_deinit(void)
>   		unregister_sound_dsp(sq_unit);
>   }
>   
> +#ifndef MODULE
>   static int dmasound_setup(char *str)

Hello Miles,
I agree with Takashi, __maybe_unused looks way better.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
