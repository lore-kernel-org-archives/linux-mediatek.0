Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C7AC79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=; b=H88ghyWKEekQoXP3MiXiPpvdGY
	xbDfvWsyM1+nDfjHxNWkywwQaKRICgSEARmaseMfdB+0lYPD9IsKtra7Z1WbmfvodE9QL1d6W0C8D
	UUpwhjK+s/DLcBad7ArpA2m/tWXTjt+MpMDd89jTUnBUFvtD61/rfRFMHGxx4bg8MLH5QL6V0lHxV
	akmGEsxE+RlrExWD72Dg8u0ohLBLJcd58ofptBqLUzdEVxnnIU1tuDe3oaTb1YEPiXflTDqC+zC20
	uCupRa0BU1n5iv6VcqGQM4kqunaYLSdNgx2QiN2+4MQHSWjrbraZB4L+VbaJ21kSOaHgCflxCbVx+
	ctfE8sIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ent-0000000EScn-41zK;
	Thu, 10 Sep 2026 13:27:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ens-0000000EScL-1IpE
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=; b=DlODEUxbyT+yvlhlgLcdYRV9Xo
	8etfsOfqlMLBhXey7XpHo5wSmWGM9J1TQIvmanFFrq8PScwdWLnLsQLMSVIxOZQ7hNXwNX6mBXKLX
	BOcq3IZ9M8edaIUdRNUNSlVLI0WGf449vNMXkup94ibTPBCaKALxjBuoX6EMoVQR+SVgLQNf4yoLK
	2A7cHfaHI+JnuHVmOV1X/1eTSsAaxKnc0jbjtdZJI9tjBfxPUuikZCUb/VLxyf3hJtmT+wSeatLTc
	V9tGDobrsQTaEwwEougq2J7DyFnDSbzM9R1xU6pDC0WEXN36beID7Ae6b6lLYwJCKqVyB+FOoDIkk
	ScbvEj3Q==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4enp-00000002Wrl-1Ku7
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 13:26:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2946dc8dbfso143548866b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046815; x=1789651615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=iZvmmvd4zIak5JDVw1Y34XPDlSUQFt/o/4w+EfkOgnAWqqhuPw6ACvPtqYtSoMwmIp
         uKlvGjVhTnAguMGM/zs43hMdYD4vc4Ziw9XTTTgv77SM/hmTcx9cxgAdEKAfEzaO0Cf9
         LXe5hfV9eJOwa+liAYZj62/Ya9Phdo3AwBJG/uskQ8vxJ7MxeWMZTDTb9n5JzDM/WoWN
         DzkGQgx/WX+35PBwOuXMvJ5z4nftpYtluVD8MqDAk0QKjt/noh4SQh/HK2VgifZfUzw+
         ABw5wAs1BUxfwHoUap+V/tLKJa7ER6dnpj1TNa/yprwD8W5QrfiTcheqY6HZkvQOnATK
         8GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046815; x=1789651615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=GwqckN64243d5i/102dLvMpmQNG7IaWm/SwHR9vqMMrg6O8dBbg0p7wrkGnpyvm7n4
         YUllUFjyvmQ+uTW7/44nDhQfesTANocCSVr/2GDctaExtjWafG95+IbENN6vEHxY+gU5
         5N15BydIVo1gyXW6UmQv0JbTtXR/d0I7vmj6HTHcZJ9bRvSeGVXmOXlRWEIYRgKJ9Faz
         12pWM7uM2MLtJTHAS8+U2E8rQ+1Un63th3etapPhLZUfCaXmy4R/0C08ofXk4o7Jn7OW
         UErYaFJcU1W+EogxUzTV6qyDIZYbY3kgtNaNUjSgC+uJTULh9qvxxPu3Nikrh0pyPpNl
         UdhA==
X-Forwarded-Encrypted: i=1; AKwUvBxWe+eESU2DR3o6FafOQb2BM5T1j5CSdmKJKua4OTt1xtwMUrT3xqfDscZGisEWYqflURIhCIgbo7kVErjTLw==@lists.infradead.org
X-Gm-Message-State: AFuF++n1Lh12KYGosjQZnPw6NMV+2XcmJkBg44XLZegpOEteuJsECyl9
	cUGDoLHUf29miCV18+Jo1CnrwfEciiJ48h3hCR9nRziafNPc9OBrv+rH
X-Gm-Gg: AYBFou2uGxlM/c9oeaHBkuUyODOVoKMYYDyHViWl/NBLahkAv5E6vgSF8M27QhK60fq
	mrI/2fxgcCF4rfEea1TC3Vy+6hDJWu9q/h5YKS1e4awBgjpoQAzuVE5jZf+Q8K3tM03wUWEUMlS
	BI/SqRGu4+NEbmOS+ehmAJieMpewwIiJm8t7umQLDL1OgnO+6eYlHqdiPYRNGEWC/aFYuuyVCnG
	PVv4ssVOacyYr/oJ23ySvqo+3tLzdFgRaX7UbjxfeQqKAJ3RWu1G2frZF3X/bKGP6GcunicMuzH
	n/AXu+S/QgEfkjEjAV8aD4/Dip085Xb/DhZQTMdfrhR/i5CPrqty7P9r7wYbwH829zSY4GPnGlz
	7UTqwK2DiLjb23RBVfs1B7Y5MBGFwMJW1jAoE6yUxdzX5pKdGiebnVwTS4YVQpUsomAsGvTJrUX
	kWJFenwNUtOU/BdzEJl4fkoHEJFRnrtpD42NDZhHnSA289gzfm4kgVw0Idsd+g1XiJiXSSMucZW
	heprHg=
X-Received: by 2002:a17:907:a893:b0:c29:286e:2e3e with SMTP id a640c23a62f3a-c29286e30e9mr574563466b.38.1789046815001;
        Thu, 10 Sep 2026 06:26:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm912526366b.63.2026.09.10.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:26:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:26:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Message-ID: <aqKwGQDkB_HruLyQ@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-12-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_142657_670163_92D35A18 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Sep 10, 2026 at 07:57:40PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
                                           ^^^^^^^^^^^^^^^^^^^^
It's unsigned int so it can't be negative.

regards,
dan carpenter

> Reject invalid frequencies before configuring the I2S clock.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> index f20dbb410223..ca7d786cdeff 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> @@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
>  	    dir != SND_SOC_CLOCK_OUT)
>  		return -EINVAL;
>  
> +	if (freq <= 0)
> +		return -EINVAL;
> +
>  	i2s_priv = afe_priv->dai_priv[dai->id];
>  	if (!i2s_priv)
>  		return -EINVAL;
> -- 
> 2.43.0

