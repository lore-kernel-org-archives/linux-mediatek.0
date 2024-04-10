Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71427CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE+4Y18rqT6MP9pTdsa016UUd/maawQyVReuqUWJA2U=; b=hmL4SdQ+g9wX5rhH1APHW/Li5O
	q6Id3paE2SEX3JkMfEJBZnyySZUuQuBXwC9fCpIFTE1lxY0m9xf0k0tfMfaiyRmaheHA+G5YMTBC7
	bihBSMgIaFgaLyIQbAGYnJPFkJLnp326Gfxs18VCD4gvk1iuXwyrCkTp98PwOIPVSTms0YJA9+uQk
	M1rf5fZ9rqkY22QcqUcoGSDqESDsl6eGTgc7+d97keNe2+I7yPCMm59cNxcc8fcFMPG1q1ptrD0S/
	QxAoxXKiTsmcz487IvD7mNG+hPhBbv7xOOO4EtSueceBPYxklj2OX/uqn8y48jMnUqtBl6tzTkukx
	Jgvqnl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZL5-00000007cEC-2ODx;
	Wed, 10 Apr 2024 14:54:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZL1-00000007cBH-43q7
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 14:54:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-416b7f372b3so9985815e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712760849; x=1713365649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UE+4Y18rqT6MP9pTdsa016UUd/maawQyVReuqUWJA2U=;
        b=23I/Sa93EKSADbMdYVoIK6u3yrg4mj9vEWu6D/mkiIVIrsiOO/rIYbvfnSdrSzrpsS
         J8pz0tN/0d1OcsCHgCRxwlbi1YjlanqXhciwQ65cF4teW10pjTKralJEyQl3EzB7F2QV
         y1D3b0z7PuVR7gHvf+TlDSsmqbQcTSeljni/i6BqY2goT47u4RmZnAdQ6TPsZZfdrzrE
         8NxLbe9Rf1kQ/Uhk44Q6ed6/MZJs/XGt2IGMEXEWIeuCrOYEKfX69JlZefRUeCd0NyJd
         Dqa5hxHfLlof8pQ9bU+xBInyQpTVu+fgHC+Vfm426QN0gYiDZRc9IXx6oR/YWs6idwsi
         G1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760849; x=1713365649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UE+4Y18rqT6MP9pTdsa016UUd/maawQyVReuqUWJA2U=;
        b=lqNFP5oJ3IJQXpiBdtyt3LmPJARUaiXVcUGVFqnpl1Fvyrz3/6d3tEB0lWfh43mhag
         CgdzRbPxePT5ASsmDFUojcOtzKvLXDTO3zeGmwQpsCze69JqfWgs3grZNKfg1P4ZCkiw
         /OamXh/xt7FlosEWcOZjVUx6eCpYyzmQ/RZBDQfqQ34aZFAvX32x3ptZEpOhkVi8FRBp
         /jiX+COD0JcMFLk00AiVUTdqFFsxP0BU5I2Pllal0eg39EZrZWwX7ta2YhdFKhbIYyVl
         ps7Q6OjLHFvdcXxaTTCD5py/p/G+vWd1KqpCZsOH1p1jHN4xrBHlpQr2suou7i5nJpuO
         EyEw==
X-Forwarded-Encrypted: i=1; AJvYcCXXijGgHkmyjZRfkdSJuPhQKGvPtZwf7sFngYScmfGhS4tSafcqT5Ln+F78P5Mvi89AaFFKmAvtER5ooGYu6Qv4wdYByZhFfhabgIlYsrJZFrgY
X-Gm-Message-State: AOJu0Yx69tZaM8s7NrX5L3Ti1ManzlPcqoWu/vkVyDfroI7aoQ1yc7Xg
	v78svknAj9AChpMRwcvR1uyGzb9uEpngC2CNrS7r9coHkEJk5Qot7ObPdjltj24=
X-Google-Smtp-Source: AGHT+IHCUNg5SsYHXd3cnIQYa7aR4oDCUcNCW6UqXLuavJoCReIkeODB8539jlTtqakTtMbi5H4ORw==
X-Received: by 2002:a05:600c:4f44:b0:416:6abe:2975 with SMTP id m4-20020a05600c4f4400b004166abe2975mr2002047wmq.15.1712760848874;
        Wed, 10 Apr 2024 07:54:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id gw7-20020a05600c850700b004146e58cc35sm2526850wmb.46.2024.04.10.07.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:54:08 -0700 (PDT)
Message-ID: <6506db51-121b-4579-bf14-0ab6e33fb048@baylibre.com>
Date: Wed, 10 Apr 2024 16:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] ASoC: mediatek: mt8195: Migrate to the common
 mtk_soundcard_startup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_075412_149042_616E743A 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
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

Way better with common stuff ! :p

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Add a const mtk_pcm_constraints_data struct array with all of the
> (again, constant) constraints for all of the supported usecases,
> remove the duplicated functions and call mtk_soundcard_startup()
> instead in all of the .startup() callbacks.

-- 
Regards,
Alexandre

