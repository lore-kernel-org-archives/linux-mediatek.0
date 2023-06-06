Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C117C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhedNjKaUYCOISv5l7y5mTBG4Uqpt0ieEYUYH3C4nxM=; b=D/HKcKpYw1kVF5YcxNn+jmbCmO
	Lgh/tk7ITx70e22ybj5cASjnMbi+HVcNMThYaLqsg4vXjmFhEJpSenxnFJ1X6tnOKyx2+ojjs26Y6
	BE9mxL8T/HvpDzZ8lRryBppsfzkLshLh46TF6ykOio9zMHY2MbQHXRKTqIwZaQqIVSRCfUSn1x1kn
	efmsBrf1BYaiojewWrUY141z/w889LteFowObOV3qKDQ7A8YB9bT9mUNVj5fMjHAqjqvBDEmBDx+J
	59rQXSMkzWtm1LX7Wpj/k0AEw/HtPsO9vvBiVqJffnjDnKoVwrGnYr8wOi8oDYFU/R4t5OdA3gWf8
	5DJXFerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QJ0-000OH5-3A;
	Tue, 06 Jun 2023 06:36:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QIx-000OFM-1Q;
	Tue, 06 Jun 2023 06:36:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f623adec61so58436205e9.0;
        Mon, 05 Jun 2023 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686033390; x=1688625390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhedNjKaUYCOISv5l7y5mTBG4Uqpt0ieEYUYH3C4nxM=;
        b=inlRyYHOgqER7/6mkM2P3HRNBWYTsH/FZLBSQZe8NEwjfWGCH0Nhv2DTN6F5J9QSCb
         OCAiRKdqNIGgq571OE1I1Bk05FijT8SuOtQ9NgvEiAGtorDh/8ipQcRAfU3fBye5shVq
         nPwSz8QLndjpZ9doPWzUreKLb7hrUW2QCyPqbPcTuMPT7C6+zPQQcIsi1/3fpj9v53js
         kSO7PrPs0IUzQBDQffFqeoSibxNdmEjQXJLJluBD1TpsMvLbHpAHWNYJZW+FXJhC7J4R
         CGDx6Z7eWpgBvNx5i2Qa+WiufRbjrKDGkeIc3WbuiFXUjeWSlmxutcywzfloMDaWqPvl
         NP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033390; x=1688625390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhedNjKaUYCOISv5l7y5mTBG4Uqpt0ieEYUYH3C4nxM=;
        b=Uar7i0G3u27dDPi2C0zwXkQsj/AyHsgRDziFKgO+cHcEpO9xJ6kFqG2uX6etJKLg/L
         Izz6LK3pF+IXKlQf0I9lewapZW1I/tWF3sHLP8iuRufSli1O93D8A1h2+/ToUwbFlAbE
         mxTS0uY2bgYIrA4Cz4FrLSkrcprGwztXNL7zbdJxbqOxd4zDMvtL8BADvP8r/hdiVdKv
         VR025Zhq2BcptP/NcgUpZ/3BPQluWo6HULWknBlp4DpE76x2YwWJMQeuSZGIWEH2l8it
         0E+aXZBqQfHKdkBCznjGSJDguzwsAhcj6q3cZRZ01EQkKrA+M7IixWBZTb75SowsTclr
         OqsQ==
X-Gm-Message-State: AC+VfDwV25ff8FRhljXP2T1NXb0UhZkw8XWUqvMJ1dDErZBumjhJMtIr
	YEVSBPEO36osGAITDT57GAI=
X-Google-Smtp-Source: ACHHUZ6KDOKkGJYFqnUJ0Ko4djdiSkTL4HS2X7cqcJInsUa0swdQmwHqZNgDMx0TcFJRtXRnu6hgxw==
X-Received: by 2002:a7b:c7d4:0:b0:3f7:28d8:4319 with SMTP id z20-20020a7bc7d4000000b003f728d84319mr1139286wmk.1.1686033389862;
        Mon, 05 Jun 2023 23:36:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d17-20020a056000115100b0030af15d7e41sm11739773wrx.4.2023.06.05.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:36:28 -0700 (PDT)
Message-ID: <fe360de7-54d8-6351-3df8-e865d5a0a08b@gmail.com>
Date: Tue, 6 Jun 2023 08:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/6] media: dt-bindings: mediatek,vcodec: Don't require
 assigned-clocks
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-3-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230605162030.274395-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_233631_487250_6A6683E2 
X-CRM114-Status: GOOD (  13.94  )
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



On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> On MT8183 it's not necessary to configure the parent for the clocks.
> Remove the assigned-clocks and assigned-clock-parents from the required
> list.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml      | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index 57d5ca776df0..6447e6c86f29 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -67,8 +67,6 @@ required:
>     - clocks
>     - clock-names
>     - iommus
> -  - assigned-clocks
> -  - assigned-clock-parents
>   
>   allOf:
>     - if:

