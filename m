Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB388CE7A8E
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H149ZKwWnYhZ1xunGnnrQ+QQwSAWk1F1dR91/0OJmNc=; b=ihb//xhJDHMGcC/z8+xKOJgjfl
	OdUcUWkwngYNiNPaCe+cpEkMZ3nB4Tnm9g7KNj9pkpK9qz8nCK2l/cAcdhuFv003GNDWmFW7fcdDw
	FfI91/hA9P87xd5741Ra1yiqpWYKr2o/RyviUI/P2nin7U38+T/QVQh7g4l6+WRzzQBpH24J8xqAu
	t1q1wfLJf48Vx2GfFsnDSRSHxBQ54oP6oZAnzt7ILB1iTJXgKmAH/Wb3Zz4lTxOw5JloKR38eZHNm
	kaaXXuNx1A/MCpBDakibBAU/sE4mjoJo/jsCwkIgb2bzgdjO1RbG3c8ck5yA1aker5ObMiDaeEAZc
	6adgYnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk729-00BIne-2c;
	Sat, 23 Sep 2023 18:07:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk726-00BImf-2D
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:07:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3231dff4343so124577f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492429; x=1696097229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H149ZKwWnYhZ1xunGnnrQ+QQwSAWk1F1dR91/0OJmNc=;
        b=T0Dfa2zVTHlkDzaKFlyDWAYuH43K1GShKQ2M8tCrkPZ4mNWCEa4jV6zfUDuCsjHcf8
         G2Ya/NP6B4uEZQ9Wqip6bIhpaV1Zrx0JjdsBRrVCiuGrqr2cnR1XdotqERoEugRz0V76
         LCy5v949bWWiZhYlzAy7+ihwlHxuPWUKILxjHEyNJ8F2D/X5NCYpevREDHPvwTGLgpPx
         /wi70vgw+C+PAOmQL4FNykod2hVOKwyTdZcRrYArZjiSoeb5v7lyReCIMBz115nNqSmo
         IBU/ZZmqf/xVS3vrbrVIkoJ2OvSDPKFfh03o98RgXYOKR4dUQRvoQb2bv6/LOo5Jx4Q8
         EvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492429; x=1696097229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H149ZKwWnYhZ1xunGnnrQ+QQwSAWk1F1dR91/0OJmNc=;
        b=ffXsxmzDX3KDEGaTpG2h4AjRTciLk0LlQhxYkitGi2edbYJWUQ7ce6+OX1Yn3Lll6Y
         LASBg+zRPxY9sgzIpBQEpo7kCETOUT/p2RwNbF/StoFnbamEHWYoBDttnXrleDTNjvuk
         K5RVzbG+oQIgLLe6kPD+ra8Wql09wTPE0VIr6RMyGjev3ULY+2AYGA+2HRWvTEGVb3Xv
         bsERAHThP4Tat0oN7uNz2h+bdcqaajoFvPpDVpCfGmxU/DGDNooUt/3NbN0Nikf46LmV
         O3PlUIQidqy6Pq3vvh0geuTHOxGXgat25YF1VML0/DuD5pakw3FkoNCwH3VMRojVq5CH
         iK6w==
X-Gm-Message-State: AOJu0YzAprojti0GdNTBQqF0qqT/DRSL3rfXyupy329/d7JdRTeyZ24b
	ZGLHNG8YK/Otpa5Ae2d77aFPHg==
X-Google-Smtp-Source: AGHT+IGGssrmYKQo06++hnwES4sRRwvQ+H+tZUVgGod48UpHafZ5lCkIM3LAng25TajcdA+SQMzndg==
X-Received: by 2002:a5d:4682:0:b0:319:5234:5c92 with SMTP id u2-20020a5d4682000000b0031952345c92mr1812474wrq.35.1695492428791;
        Sat, 23 Sep 2023 11:07:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id p5-20020a056000018500b0031c855d52efsm7427661wrx.87.2023.09.23.11.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:07:08 -0700 (PDT)
Message-ID: <84655695-52bf-a67f-e0f1-7ad46fe44e6e@linaro.org>
Date: Sat, 23 Sep 2023 20:07:05 +0200
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
X-CRM114-CacheID: sfid-20230923_110710_720785_38EB4ACA 
X-CRM114-Status: GOOD (  15.12  )
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

Plus there are no users.

NAK. This is not code which should be posted upstream.

Best regards,
Krzysztof


