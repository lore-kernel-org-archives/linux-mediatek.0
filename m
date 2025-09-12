Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA8CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6s4DjcKlA2pZ7v6EsAu/6cLi/c1+O59CbRYF+E3qZc=; b=lLyFTsDlMNfOEz
	bHrCY50NFRtgQAWki2BUIGd9/VyEm6Y7ITD7PYs84vP6QsvR1iNSXejw8xyOjHHMaXicPZtdU3DLw
	4IES82honpgn2nD7e3IW/TScb89/Hj4SVYfXk3cQ3WxGAvgxG8uExApidupQgNCnYy7G+cLabolse
	X3YjADhDsmY5ZWlsCzkvuMaGV5xh63kGjnDJ/RqlqrnChyu11Ppcbz1BqyaXunv1tklNSRj0xaDuq
	/68ZWIY4mR/Z2hnI5w2QWd+bNAaLY8/OeBjnxmnrSScHovOBGyzDcWGjdI7veyUMd9b6GqDJTNe0B
	0sxzpG2RUIEs+OPr6Suw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4ea-00000009q1J-3wqW;
	Fri, 12 Sep 2025 14:21:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4eY-00000009pyr-2kmg
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:21:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45df09c7128so16348615e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686889; x=1758291689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m6s4DjcKlA2pZ7v6EsAu/6cLi/c1+O59CbRYF+E3qZc=;
        b=LW+PTF6sHKMqFu3mYR0PpaK31eQv0OnuaR7RoNDvYDP6QQQQHgCNma8ZsBcTQ4w5u7
         LFLZiE8eCrJ9zbZEtFD96gqdONk86bN7uNiI0125R/T0iv38FdV2+0mf0VeiEVo6F2FY
         ffngiPoYb5zOIspX1XxdXI7hsh+ejNgJIjRZjkTLq+rLERiY1w+3V7+AYYLwuIDr0p0w
         45qJLECYcEJvc0WDaCcpHEag70G8PzWJJLwaRb25kJnsc9SweUJp2ffUvc+TVqxSnUF1
         2/Sgs17ql+7Ds+yQUhqG9mhjklKIGnuUjk97rYYVQgvy8/fl7FdV93Vb3ci11EVP/X4M
         omoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686889; x=1758291689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6s4DjcKlA2pZ7v6EsAu/6cLi/c1+O59CbRYF+E3qZc=;
        b=gqB30fkCkc+nRNoTbuhfcoNOBIxJ8+teEDICV7y3LqAEDK3hmmlckNo0kUm4YLIkpf
         Wm9fD3Z3vuAEdQBNDPltYG33xwQuZHvmuQohrJHfMx2deKuE6E2muOggNOfb9gVX9fON
         MFqd9i2e/1N7fyXvqhfUVY8JK7vDWGNZtYDOXE/qbsxMx1v8z1uASdNjNHzuL1BT5gju
         ivVUwvbeBO9BSNCssX9hIZh6pdwf2V3gu0ySCeyKpvx8mzlfQuNATgOZ38nijLn2Bsa5
         leFXlYk5H9l7BrMjRdp/sAHrOnufcy3ftolFNVSnNy2Nk1AgTJSpY6c7OELZSYLNtkrK
         2/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWGMUItKt84bG4g0MTm50ih9UBVeLhRxSw9J7vJL/96LUH/mAOUlNj6Ft3ZkU59cecEtm7sliOMjuR9yxv+2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqyrbEcg3uK0Nt+SCNFVSBRCYMaRM3MXdGQPLW3wzgvWywsBvz
	QMR69CYi2AK37ITsZD6QLpeVDW2QRAvUJIxKGZF3UouCrK6NaJVO8dCf
X-Gm-Gg: ASbGncv1YxhjJ9p3IjpZVdj6gutJGUTmsVnyrisJVmrrpP0iNtVUbUEJVq3spt8N7I6
	GF8tEZVfl1QWD70xkbP12OL0PxzaabLwFUFH5iSy6wQ0fgH3wKnIgOI8BJoJ8WdlahKlaC9aKWm
	fazJP3y/+0BRA9BoSFrMOYri2YV969OkSlSsZU3iPPmQQZbDeQ8A1cFqFXh/I2zTcfr0D4tT2Wa
	TRSAeyi0Hny4PzVQNTvFLK5Sf71COoM4g9nigrsehaVH79aQlvlN5UUGdyZ2SGc0SlQqMMsrRw5
	Z533oZyfRYfTEVPxMmDh4s8zjo+4hqoy/M8odPqe46sdAjEUfmDJ5JiRkC0fkuUGR0+tUOKqj72
	lDSTp7VkwLB04fDg+ZvrpQiCOwV6Q+hg=
X-Google-Smtp-Source: AGHT+IF9qckBbO1/MUfpNiCtEF6z09eaYzKoz6jvuBpXQ6fGTJDkBa8yQ4C1wqtVjU1kYwNtwHUpjg==
X-Received: by 2002:a05:600c:3146:b0:45d:dc6c:9e30 with SMTP id 5b1f17b1804b1-45f21293373mr35435585e9.14.1757686888870;
        Fri, 12 Sep 2025 07:21:28 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015784c3sm71413955e9.10.2025.09.12.07.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:27 -0700 (PDT)
Message-ID: <6f60e909-b267-4140-8384-6e06e9a199fb@gmail.com>
Date: Fri, 12 Sep 2025 16:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/38] arm64: dts: mediatek: mt8183-pumpkin: Add power
 supply for CCI
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-32-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-32-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072130_714178_F822A51C 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Add a power supply for the Cache Coherent Interconnect node as it
> is required to perform CPU DVFS because both are scaling together.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index dbdee604edab..d5fcb010e1ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -482,6 +482,10 @@ &mfg {
>   	domain-supply = <&mt6358_vgpu_reg>;
>   };
>   
> +&cci {
> +	proc-supply = <&mt6358_vproc12_reg>;
> +};
> +
>   &cpu0 {
>   	proc-supply = <&mt6358_vproc12_reg>;
>   };


