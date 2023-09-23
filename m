Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E422CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLYCr2Z4vuDAhql4XDXkXixLZPPP1JO3qvIuyryDbtU=; b=qCZbvKllTQ6ghrg4NC1LaP2xHt
	nM2NL3/+09A6OmCZ36mZEj+2yt0P/jKVEj2F198qProexjpGqeSP6c9+ODK8egWhhGzB8cm3z2xL7
	mD7IRdzdIrpgM7G5JvkduBk9Z+ebCSyl0gjkMVY6yRDGMW0scaMy4p0haSyUhMyWC/gn3D1/CEN7/
	Mg17M+HKFAsLT1kws/Hx5B0AyVJBi6k2TdK7XP9XRBS0YpgMP8LFoFpGfpARHfhUpmzsp7AVspAM1
	4/1/zhyHenidHqAhWPtDr6WTt3MAmsDIw+yKjhQHxbcGmFilfiW9YFge7NNl/n1ni6tEwfEpSP3ZF
	mKgfWnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6zy-00BIcd-10;
	Sat, 23 Sep 2023 18:04:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6zv-00BIZy-0o
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:04:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-533d6a8d6b6so797621a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492289; x=1696097089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLYCr2Z4vuDAhql4XDXkXixLZPPP1JO3qvIuyryDbtU=;
        b=ZNb1xkpzZ4zvfOftRbZXDnMjW9SQxU1LN/yrMxSIw+NWHsUHmtwQzKXvYaSAXMi0wq
         Utb52wm5on4+YMV+WfDeSQHokWTXskn5EFxTV6lE1GscsrcGfsD+w9QLlZfvj2G5roB4
         GZWEHG5BN/0dhMuiE2eX/KDHS7DBDejsh6k6WxJrfsTdPkZ18oG0mF1lBgfvWF6KC7C8
         mP+biaMfsIOYqqwaLWOhHWuw0hAF40vOYFeO/DDg2mE35Od14iwtUbRMvUlTjj2+qH1Y
         w0uVML2MlRxTnKCQBIoF3pPER0RLY9an8US8Hk5+BfBFgEwDUUwPrDw0FWwLOatzh/vc
         h9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492289; x=1696097089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLYCr2Z4vuDAhql4XDXkXixLZPPP1JO3qvIuyryDbtU=;
        b=DdwO1yPEXxnP7ZEjl39puNXC+2C5EIfnREUKt1RPh4Cc0uRFD2gtW4S6N2+6BNtt7g
         Ul6hZe3JCg0Xlf2ZONaPvKSHq2YGC1uRzYsCc9SqknHVLb4gMOKZYS/U3NAbJw62HUcg
         BlP9DqtvuF0MpmQW6vXIl0ekZGmVynLzIZV1xu9+7g/YdzCiqJKzjh/kwuYhWs7767n2
         WRVODT0cMhYT/QmScODPgrGaVcDe/Ovfh2ht0caj720fwf0SJ1zzM6V5/m+pjJc5Mcgf
         nugDVeLq43z3xcyMB8SZMVS8z6Ki2j5QX7i7bvkz0zcAsvLHQHFNFc8BTVfuqNLdpDUY
         ucOw==
X-Gm-Message-State: AOJu0YwmhKMghT/V0bsnO1pUR/5u+L5tgb5p2xMCLBNKNhphQXkC9hJs
	24MWw8EsT4ORsXUNOEuUjanLAHREeo8SQ1WynYw=
X-Google-Smtp-Source: AGHT+IEw+sN5D8rf7LUOkThHrXnJDjHXiCrShJbLvyy6HlUTwvbaS++DGIvd128TxX7bpTRBo77clg==
X-Received: by 2002:aa7:d518:0:b0:522:2111:1063 with SMTP id y24-20020aa7d518000000b0052221111063mr2280637edq.18.1695492288665;
        Sat, 23 Sep 2023 11:04:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id s3-20020aa7d783000000b0053116e45317sm3534309edq.44.2023.09.23.11.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:04:48 -0700 (PDT)
Message-ID: <46e6aba3-cd10-5fb1-c217-5d9341a65381@linaro.org>
Date: Sat, 23 Sep 2023 20:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-9-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110455_292184_8696EFF0 
X-CRM114-Status: GOOD (  17.36  )
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

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> Add cmdq_pkt_finalize_loop to CMDQ driver.
> 
> cmdq_pkt_finalize_loop appends end of command(EOC) instruction and
> jump to start of command buffer instruction to make the command
> buffer loopable.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 23 +++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4be2a18a4a02..bbb127620bb3 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -475,6 +475,29 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
> +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	int err;
> +
> +	/* insert EOC and generate IRQ for each command iteration */
> +	inst.op = CMDQ_CODE_EOC;
> +	inst.value = CMDQ_EOC_IRQ_EN;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;
> +
> +	/* JUMP to start of pkt */
> +	err = cmdq_pkt_jump(pkt, pkt->pa_base);
> +	if (err < 0)
> +		return err;
> +
> +	pkt->loop = true;
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_finalize_loop);

1. Missing GPL
2. Missing kerneldoc
3. Missing user
4. Are you going to split the patchset into one function per patch? No.

Best regards,
Krzysztof


