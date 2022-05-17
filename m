Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C891C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew8s2LPV8gidd71NwFAM5/YbOlSf1OYWYy6yk5fwPek=; b=RfVAb75IUbK0/2
	a3uEpEz2UamyyuZl+pTx6TtWi5KpIZxi9ZtJKlKx9TGhaQkIdtINdpPjElNCsJ5JBQ4chaWsRUWAb
	m7bD73vFAQ/DPUK4CO3/glCbLzuQkcoDQVAek85ohciaz2RMBDfTqig1aQOiW/B3q8g04R050QGIl
	dvlrxdMjWCICTWAamthOrnrBG/j6FN8OBN9Q0fUGeHJkSdYK5kJmUs9A8aRSqX35A/WZddKZUafjV
	EU1yzmqA6Kzx7/GNgIz8pkvDhigGcmAQBtLHlSKBvgHnTRA82EjzBGjxKLW2ET7gOW5osABwvAmFQ
	OubFGry2JpfpGuoEJphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqsPx-00CPdY-2A; Tue, 17 May 2022 08:18:57 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqsPi-00CPVV-JW
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 08:18:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id gh6so33265426ejb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PMmKxe3WgBWgmW72+NDFsBAaWr7pVUMq7IT2EOFj9rg=;
 b=DXyvSIi7jXgAcG84j0dtTQNSoDlJIe40zgLupS5EpCO8insL1A3QKtDr3G4YtYNT0b
 DpWn3l9GGUDYHesxAFO73sqFKLaDNKK7YLJVzLAY2gm9j/Pn1W1/yJiSdDE+V6VfEawE
 7BvCwhDOBjFde5UyiZ36odZNjDdhjBsz3aadbnvIo0gAPHwVU7yPNYeTJTJahN5Cedpy
 jn9ZlDycZAV49AIAkpAbSKCBFgYK0W14EVxWZAW0RFl76wBEJBgH4xXOT/qDJt4yioHs
 hg5YQn9MV4XKqILR5+vGASilGUivZSB/j/My7a7ImeJAoINREVLPuN/Gsn8IxnhALlPp
 IsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PMmKxe3WgBWgmW72+NDFsBAaWr7pVUMq7IT2EOFj9rg=;
 b=6HSd3O26JoYlSLAxf8FsNc6DQlFbJ2OwexaX/G3L53At3khRqRZ8Ee9QqEqQOoAwMc
 UWPXXHuMJwfLZkSIsjUOBTkvnJmu0EkLBoxl+jzmGpvUtmIi1Vyra/Rve/hhZAe5CkyS
 JbUNNRSJwViHpO4DhauHizBiWgGgwj1FyNw/lurh+XYimV3UWse3SFJDrW+yd/+4INlG
 Wf5KzzXdkvkJHb6OoJ3SZBmaVs9+fBbw4gVvRErTi2Ihr6xr02ukLQaZQTSHmE63jlET
 Gx1q2miAghJVz95aptJJkntpm/9Yhw+uXeAkNMdhzxjcGFbFbCG0FMNBMkt74G2aZ6wS
 yoCg==
X-Gm-Message-State: AOAM530oiLUeRkG7IvwPJamOhOueNVkrS6pW9hgjx1PAev0OtMxcEnIL
 CxlXQJX2HF879qdv5wkiDwTZ8g==
X-Google-Smtp-Source: ABdhPJzrBCibM9RMlaxwEZZmMm1yEb5wWtfOTQfHuB6kYMrz6tNnDZq7nVne/1DF18nq6iRbJULiXQ==
X-Received: by 2002:a17:907:1b14:b0:6ef:a5c8:afbd with SMTP id
 mp20-20020a1709071b1400b006efa5c8afbdmr19134421ejc.151.1652775520403; 
 Tue, 17 May 2022 01:18:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 e9-20020a056402104900b0042ac0e79bb6sm1345467edu.45.2022.05.17.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:18:40 -0700 (PDT)
Message-ID: <626d3f67-ae15-938d-ae87-e111b83435d0@linaro.org>
Date: Tue, 17 May 2022 10:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for
 32kHz and 26MHz XOs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
 <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
 <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
 <0f303425-3b12-7573-b201-030d4d044db8@collabora.com>
 <d78e1936-a0ab-663d-1381-b537bfd7f07d@linaro.org>
 <32c97e47-47a8-d033-4948-3c73a4313703@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <32c97e47-47a8-d033-4948-3c73a4313703@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_011842_674698_CB9979A4 
X-CRM114-Status: GOOD (  11.41  )
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

On 17/05/2022 10:14, AngeloGioacchino Del Regno wrote:

> Right. If external components are strictly necessary, physically, they're
> still external components and not inside of the SoC, and anything external
> *may* change depending on the (hardware) implementation.
> 
> Anyway - I was wondering if splitting this change in two commits would be
> better to let people understand what's going on... probably it would, as
> that would clearly show both the addition of the 32K/26M clocks and the
> subsequent removal of the other two: I would at this point do that, what
> do you think?

Could help.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
