Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF55C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIQCWnK4HQ7PaQYh87/ttMNjSyjhz5oJq2185mYcVzw=; b=4sFDtGsOXVg32M
	41ykDn6+avj7LNQqnZJytG+Z9ZsU1An3uZ3VwuEvM0Rb1FAqmvvYRC6hIHj0+pAkbGX2PGPvxCwUB
	Bi4FYH9pTVH1X1Bfpdq63k8XWgbl7D8p5kCmqKHbFARGGEWkjTu02MAEzgd4Sw1HEpvbDyxNzw+ww
	/QemPEJfE8ycr1VB+ECIadwjOMu18HgNL8Hb/lB0mHAUZ/JFc+KIv67HTI0KSfgsTpvhOFesvM03M
	3sg+LjvgSicWsAymtGGoePzv9P2zhQwNgbJZWR3/se8X8MayADseozxWrEmMWsW2nJuZRMQK5R6cE
	V6CdESoorFml+FobCnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfRU-0022t3-CD; Thu, 02 Jun 2022 07:40:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfRN-0022qY-3M
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 07:40:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id q21so8339154ejm.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HFO/87aGbgtk33I/L3fMAte270UwuSA7why2H6PNvOA=;
        b=mN+9jqmfWnKT/Fy45KzmqTXK61LpYwelBn53fMaaCN3lzzj6Wk1I4DwXrQcGQv7Om0
         ZW/yKEF02ARPnGCLi0JYn6G8+2Euzm7zo937S/x3Kgdw7mFKrMWdzzDkUE39OmVwdAyl
         jdxTGxalpwlo6x4nn9ZTVZnMMa0IpX40CBniWDnDJOm19W39m8EKqnw34gSjpMgWghAP
         +js28jW5WuMytQUUDrU2MCk1Q9su+9FAjejSbzfhKgITz/KdTDmLhWmgJtAJN4id/IAu
         VN6OjcyLJX3mTS6A3VZosYlgLj+Yy/ahQAmK2C+U+BBo0ArlPkSvc7gpdSBpjiKL0uJv
         GhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HFO/87aGbgtk33I/L3fMAte270UwuSA7why2H6PNvOA=;
        b=2ANHMPLaOYVERKZdZ5zXeWBxhYq2RZ8627ev+mFUmPEMwNk1C9J8mZg0AL5JBhgNtW
         JAnNTAdKYohaGhieVMpSEsauaVRmWRT0peZaFCJVOe7fXwQKfU+UcDqVgz5Ma22H7sxM
         QZ+HfbJkOaxpdMoFaeMM1J6uqblLioB55qeHgKApnzUSrEY2qc+IVHZMSzEj6w2qNaph
         d89sE9Vw1Agl5ya5USeJZouMeVy3PXmh8/DScvQUioCUYzFbXIwSRuNU1SgYgRd0szvf
         QVNXmlE7q2NERuqZCfwt0HuAP5HYfuAqxhVZRsAB7TTZzpYLuOjbgDwzTRKVUjAViByS
         gIBA==
X-Gm-Message-State: AOAM531Ova5S8C3xOQzKSgMTMeVhpgYZtI18D4hOftPeFsE7Ejfuy/O+
	RjugzdgiuRbusty5azVLCJM90Q==
X-Google-Smtp-Source: ABdhPJy700q4fNsXKgsESmT7E5pefeLTeGNQEt9yQudDkNdyZe3ocIfN2I7Ewpexw384BVFeCMpDrg==
X-Received: by 2002:a17:906:b0c5:b0:6f3:bb5e:54a8 with SMTP id bk5-20020a170906b0c500b006f3bb5e54a8mr3136287ejb.534.1654155619493;
        Thu, 02 Jun 2022 00:40:19 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j3-20020a170906094300b0070ad296e4b0sm371503ejd.186.2022.06.02.00.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 00:40:19 -0700 (PDT)
Message-ID: <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
Date: Thu, 2 Jun 2022 09:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_004021_240562_86BC2E75 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/06/2022 08:44, Tinghan Shen wrote:
>>> +  mbox-names:
>>> +    items:
>>> +      - const: mbox0
>>> +      - const: mbox1
>>
>> These should be rather some meaningful names, e.g. "rx" and "tx".
> 
> The mbox name has to align with the adsp ipc driver.
> The adsp ipc driver is using 'mbox%d' for mailbox channels.
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c
> 
> 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> 
> 	/* ...snip... */
> 
> 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> 
> Is it ok to continue using these names?

It is a bit confusing... how did that driver got merged recently without
bindings? Why bindings are separate?

The bindings always come together in one patchset with the driver
implementing them. Bindings are though a separate patch, yet still
followed by the driver which uses them.

I do not see any compatibles in that driver, which suggests there is no
other binding using it. If that's correct, then you need to change the
driver.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
