Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75760CE7A8C
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyFVeqB6utZDh9GVjHOfgFse9+GghiI4681cEKbsRig=; b=zvkjwdg/ZKl/JEaqJ7iPmpGVyG
	FU62o3p0SUVZVeVU96BMJPNtHAT3+YVGZt5Jp3+5MxnRXj5D4FcDDQw9iUs583etgjhww1fXqlVFT
	KXobGigDSN+xoP2lUICIito+P6Mm0yS1udSVCewoTR8gx4Hi68U1vxjAq1y6SNe7K2bT+Rmgv8cLf
	NryslrqX1SVau0EEoGFajG97cZroW6oaJZL48Qb3DXl82j0mm88GJjC9XguzwXZq0HFk9CoKqDCcs
	IWGi/HEkgZFA9LTezl9RrsINiLpV238DCoziWnIBA42gXv/CgqYreW7C+kxrzyh4Qxawac1vjCr9x
	f6o6NSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6y0-00BIKd-15;
	Sat, 23 Sep 2023 18:02:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6xy-00BIIv-1C
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:02:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9a65f9147ccso483565566b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492170; x=1696096970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyFVeqB6utZDh9GVjHOfgFse9+GghiI4681cEKbsRig=;
        b=veM3EVnkmdxZ2GVvqRdEZd6OoHXIkLKbs+fwXEtmj6HIc5rvkP/T33PvIfWhYTjNB9
         +h3trcFLuVkhMDT+o+P+hYV0NCjohLxcQyQA/0w6GMcW7cIz2P7L/K3XKL37vHaiVvls
         sEuVPgK6B9u2g5+h1ubmDo47v9+ok4Nu8keh4Nhi7IApgjyksrgyc0TulTnR29uy0c65
         wqiL3DdTF1Ss9MjcuFtF/MqdhPtWmt9j//zyBA3bz7wFpQCbdJo1iIW7nJUJ+4dHTxma
         0qDje9SHK7I1Mwmp3GPxD1hbpWWrHagnC+2YOrvnWD/x8zq68LRlPChf0fdVvkjd15Bz
         eMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492170; x=1696096970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyFVeqB6utZDh9GVjHOfgFse9+GghiI4681cEKbsRig=;
        b=pn5IDkwI5Jtdb8q2qa8mwYY8pDxMZrvElTTuv85fvauwtnCdLy6Ab2A/eXjeY2keJw
         bi6XDYBvu0mQuhjTop9zI6A7MzbwaGQFsHIO/Osr4beGI3Spvd0SDdZBum9k4z+CQpPP
         t19hEiTwhqwxiz1w7Kj76l1fyfGWJLD7kjnZfhIUQdrsHolTJ282Itj+mthIqmynyrQU
         pjO9cpWren57VaUgZ3z5ZQqv1bff0Sy00WyWHKoTB/1KMGqvX89RlKfQ8L9/3AgMKI2m
         WwiCaMnqLee0Rzek3QF6OW0/TL6PCyVcbjw/6bBETWsTv9tXqmECsQ/ZClJSjzZf8POC
         x1mA==
X-Gm-Message-State: AOJu0Yz0FxPaKsDZXGjZL9nvhtiuDml+9Bb+EHcoecT+XwIcJAiykKdH
	ASkePkJNilCOrbJs/l2vRbr27g==
X-Google-Smtp-Source: AGHT+IEzoIT0eyHgVB5pvxp9pVgGOLU17x+cfcW4hEsmequbeIVUUbsvdCtIG8lzr/pdPnUj/8VHlw==
X-Received: by 2002:a17:907:7888:b0:9b2:6c31:c500 with SMTP id ku8-20020a170907788800b009b26c31c500mr1764699ejc.35.1695492170664;
        Sat, 23 Sep 2023 11:02:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906080500b0099b76c3041csm4131586ejd.7.2023.09.23.11.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:02:50 -0700 (PDT)
Message-ID: <95f61cb0-f0a9-111c-1541-88d51c3e5748@linaro.org>
Date: Sat, 23 Sep 2023 20:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
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
 <20230918192204.32263-7-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110254_410798_D4D2DC4A 
X-CRM114-Status: GOOD (  13.92  )
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
> Add cmdq_mbox_stop to disable GCE thread.
> 
> To support the error handling or the stop flow of the GCE loopping
> thread, lopping thread user can call cmdq_mbox_stop to disable the
> GCE HW thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 6 ++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4d62b07c1411..8bd39fecbf00 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -469,6 +469,12 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>  	spin_unlock_irqrestore(&thread->chan->lock, flags);
>  }
>  
> +void cmdq_mbox_stop(struct mbox_chan *chan)
> +{
> +	cmdq_mbox_shutdown(chan);
> +}
> +EXPORT_SYMBOL(cmdq_mbox_stop);

1. EXPORT_SYMBOL_GPL
2. Missing kernel doc (full doc)



Best regards,
Krzysztof


