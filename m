Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F531CAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek0TO7GNCfMGdZrn2a6dssI2HabH0ybImb9FG8faTKA=; b=F8pUEWR7JDg+aP
	1S1Xk0sSR9fSbesKjuh9WDI+ooL+w5CLd6ovO550PRWj2nLLBDbLjJb2hpeuxML5hAGzefQ3k4CiW
	PjhjWrtdt7bLzq62C/fm+IZXPMBDtLeK2yJBxuUO7x7eMBn5c5AHHnvhDU+qJaewAj2Z78QxTTO/b
	nkjZfPAbJ4l0b8hOgsGWbGGdT1cDPKRTzrhEVoI0CX8b52Jc6ruOgklVSkIigoQoRepZ3kzawLkXU
	kbJPsypr/Vng8JgbbuvXg/Dodtz4LaqPApagqgPpJmkaok34XH3AIe9wNxvaALcQ/LlYc0LcvXU8d
	b+W36lRMkGxalQExNcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4g4-00000009qx5-37GC;
	Fri, 12 Sep 2025 14:23:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4g1-00000009qtQ-3Xia
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:23:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e77e917eefso554975f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686980; x=1758291780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ek0TO7GNCfMGdZrn2a6dssI2HabH0ybImb9FG8faTKA=;
        b=QQjbE/DGIYYzCprAhVcqjEnsf0sccnusGJFLCO5YPWo3Ji0MuAJTg+7XF2s2ODSmuw
         x7mi85VyDYSP532TQhANUiN8S/P8gDqUPUQgBi8BW/ewjvoKNQWST/UUasApB2TrOsYd
         BUtZgjYRDpl1zMG+KCy7T2HC7+JQJgBvCzJbAmyalFW6bYuomd2DA5n4h8n9aQJXMUPG
         irqdVYbZZ7/r4OaFWvFUETTCNrUXN/DH3vFLzh0zGXzwYy1imIK0G6+DwsNSlWENQ4Pl
         ZATLnGIYmsZWh9/o5mq6LVIDHQj+Ix/hlVKqDTh7rLkRDibBH7Pzm3q1Ie2uV/HA1gGp
         q1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686980; x=1758291780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek0TO7GNCfMGdZrn2a6dssI2HabH0ybImb9FG8faTKA=;
        b=bSDFLTL7BYEYvKyNGYgdyF7z/QtF8CvvUDhTAUVBVohFnQUVkepikfzUyQ5WpGXpwU
         q26mUm1cnBwfV1OpLDrOH4PuClpLFkO4cYX+WgwH9dwq848DnhNZe3PlVC0oeBm84eDf
         2Tl58yYD1Dpi2iHmBu5nf+ih5KEwiiTSKz5CUs4CJ7yIUMc6DzOXHgcS2Z9NOcCDaV91
         Hkt5bIXasBES/m+dCv20UjACJO1L/daq2btKpdQDn4Ms2VB7Wce01Kr/xyDG3Q/ncQC/
         Z15SMKijm5lRD4HEUq+9KFcoVls7BgIScfP29lPiOQjr0MTQVVU3MAYD8foKU2vUUxuU
         CkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI5ZCmgNYi7u0I3Fne1xyQccEExnOJynPbqlksyTXlqz6IHP6cUsskUr2NaPUZKNmwTRZm50KU13X9eCu9BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxobJBUmLJTt98xCEMdpsHJLFITCa0z4EbjrCuprUNYDOo8el6Y
	hN04KSnsjApZ1ASz0p3/Oh7wgzijuoM9QVaHz8K7rjxo2krdbDgx5C3SRbbB6QJP
X-Gm-Gg: ASbGncu+DTRQzbBhzb6nEEVS040Zr7SWXjxxDiiLRxDNpbY2tWOwPYX2nUIRfJeJCOD
	aFok49fxWrYZCuktpfqr9VxpIe9xv3jg/45MoG6p8riAetF/4CpZDnUwCJLI253xUGZiv+LIHYh
	8BU1oKd0DOwvDYQdVDJLFEfs1uA002ORilB0zBPnx9Wm2vf6qs4H1/tsi4WgDin7k+IfPfod7xX
	zwY0OxIU7dq71SSwCUxykqc0woRc/30W6K2W5ZNbjgni1e0ZuYU8tzjmTTuypNMvouQECts1Zzq
	3ihsk/7lastqlJNsMN7IgpJuoX+iMd1C36zNqRw6clR0lSuYxDqKAauyuyq8i8lrEX8kqyb7vhR
	MpzRpS6/JbK7uveMQIK5SqSgyvjgPwUM=
X-Google-Smtp-Source: AGHT+IEyMrgn2AGObMNXrXfOyNSBeXONFdMwd2oXsFxZJiErmFGwTSul75U9TPJBys255/fSCwqlMQ==
X-Received: by 2002:a05:6000:26cc:b0:3e0:34f4:3225 with SMTP id ffacd0b85a97d-3e765a09238mr3563649f8f.45.1757686979724;
        Fri, 12 Sep 2025 07:22:59 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm6624214f8f.39.2025.09.12.07.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:22:58 -0700 (PDT)
Message-ID: <2d711432-f6db-400d-b97c-135c839cf5f1@gmail.com>
Date: Fri, 12 Sep 2025 16:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing
 regulators to rt5682
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072301_923643_6F2F1A10 
X-CRM114-Status: GOOD (  12.73  )
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
> Add the missing DBVDD and LDO1-IN power supplies to the codec
> node as both RT5682i and RT5682s require those.
> 
> This commit only fixes a dtbs_check warning but doesn't produce
> any functional changes because the VIO18 LDO is already powered
> on because it's assigned as AVDD supply anyway.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index d40f4c1b9766..b3761b80cac7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -534,7 +534,9 @@ audio_codec: codec@1a {
>   		realtek,jd-src = <1>;
>   
>   		AVDD-supply = <&mt6359_vio18_ldo_reg>;
> +		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
>   		MICVDD-supply = <&pp3300_z2>;
> +		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
>   	};
>   };
>   


