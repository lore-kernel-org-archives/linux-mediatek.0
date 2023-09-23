Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA8FCE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0OmVT82kVRhT6V7fBBibLFNJi2iRMus/lOyy9oKOW0=; b=c+cbLrwfTdYarL0nKUz7VfNDVt
	Jd7wZqDme81gmqqFHqv9mh3/UqP0lHfCE78PVYL4laiSguqtrdwDBZZPqeQXtWlqJaVB7nX4ffcL8
	OASap1ad7GiFUysrsV+QEeAagIdbE0A/1LRRB0c2trMyDUt2h1B+dAbxBYxSTaGrNV+mRjOy8OUhQ
	hfViPHfLAJYueGfrSE00ghYuXBN8Ix0Zwv84NXfnk186W4auq+GDHpSeHy1VNhVGvx2O454Qned0D
	I8MN2mCUV2529+bgfmn0UdXyzNrcFp9G9/yJRE6lTKHSHyMRw/SZKjWuPNOXEqz/wltjVNeFGfJbI
	cCERv1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk74f-00BJ8W-2B;
	Sat, 23 Sep 2023 18:09:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk74d-00BJ7b-1B
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:09:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405361bb949so39221965e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492586; x=1696097386; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0OmVT82kVRhT6V7fBBibLFNJi2iRMus/lOyy9oKOW0=;
        b=K8jkLuT0nss5jEp83TQww6quRCKEbDGg/rSi+fPIXtiQjhF+ZfJIYjFbmHh3VXhCf+
         VaiY2Ht/Zc1vSSlBE8VwupAC+xLOANqimDINcQ5zUaCFcnVzRuWGKWrDegns6L2j/nfg
         miJKrz8Rb9+I4+PRLrXuRv0K6sgebmQS3lKkihjeNIvfU40zG8dr+KFsyLe8uVM6qjLa
         WW3K9yO8PudtkfiO/KXgLn3i9jjGK01Z/fmK+A2F3YMOsNsXnB9oZr9cto4WrwNsfPCB
         cLwgz2sV8iQBf+jISF7GYX1mCzz3Eo2IliX/F1Dc3dRzNvJAsSSnHxstMkewaazQqpkP
         8ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492586; x=1696097386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0OmVT82kVRhT6V7fBBibLFNJi2iRMus/lOyy9oKOW0=;
        b=ELAvpV0BQMC3TQcHLteFgVmOX8UckBoZAf3CYcevJn9cL2+/5arjHdS+naRiBS+Ene
         Q3zNLUdmIymUHYTaREFHvb4Dtup8yO4TtNQY7NRKkrcKA25BlsZG6q4a16l/Lk5rE7Jj
         97h5TsmQgC5Wuolz9fYe/HZXeGQW+/qVIqVRqttYIOeBfA0gfmmXDF+J9EoTR5Vt0q7w
         V1ekXo4hAZF7ZA6qYEurCaahaATVrs11xEe/y1/y2IAgrvCLq2juYdUuf6qVbiInT7k7
         Sw/poe0hYbPecmxcs4sMgY1ysBkmptH7itilB1Ca9nCCR52z7l6ODE3D4C7fwdSWS/KH
         SP+Q==
X-Gm-Message-State: AOJu0YyU5d5p2dEFMF5G8s/og/bylkRDYpBtI5HZyNMCpA/wKRfqvHCP
	+zDk3XfCjQ5K116/izxpNxOf+g==
X-Google-Smtp-Source: AGHT+IGbEDdCor3uAVvI6RHkOnvfxXv6QO0vC7iRLExeI+9NeOdG9D895dHQs60CsZTG3e2Zoj0+KA==
X-Received: by 2002:a5d:4c85:0:b0:321:5d87:5f7c with SMTP id z5-20020a5d4c85000000b003215d875f7cmr2665873wrs.30.1695492586036;
        Sat, 23 Sep 2023 11:09:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b0032148618cc4sm7447722wrv.29.2023.09.23.11.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:09:45 -0700 (PDT)
Message-ID: <87ae80c0-a09b-3642-e3e9-c753cd330bca@linaro.org>
Date: Sat, 23 Sep 2023 20:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 13/15] mailbox: mediatek: Add mt8188 support for CMDQ
 secure driver
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
 <20230918192204.32263-14-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-14-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110947_403557_E5C2EB56 
X-CRM114-Status: GOOD (  15.02  )
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

On 18/09/2023 21:22, Jason-JH.Lin wrote:
> Add mt8188 support for CMDQ secure driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 3940b9f8e774..4e047dc916b9 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -750,6 +750,7 @@ static const struct gce_plat gce_plat_v8 = {
>  	.thread_nr = 32,
>  	.shift = 3,
>  	.control_by_sw = true,
> +	.has_sec = true,

No, you just added it patch ago. Do not add broken code and fix it. Are
there some KPIs in Mediatek to have patch count?

Best regards,
Krzysztof


