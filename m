Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B6C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoFZbIyanyeX5TDL05rxYRQGE7zu1DHkclOBdbpQ8f0=; b=M/mmmfNpFIspJl
	gFZK37qzrNZDWEXp0zysLzjSbtR1hJr1ry8JZ3xpEaka4JBKM9RJykGk9virwDLzUYHMoTCdxN17M
	oglnsaYr2OaZJycGN25tR0BRiWeK1S4isOppOB9NK9LVbaK7JEiU9eZZUOTK4q0GuaYnvz1uxyqQa
	6pCwVBRV+ZASURFWy80H+y2VPFClI9qUYNQES9MNQwKhv+bkUsCwokQMM3+yJ+obpn9kmouTEUFbe
	xtP5U/lRm0BN5oqQboy2lQaNM4EC3lBaBx3EnbSXn5WwjXamQq3vXBj0jKTNKGjJHK0mS+4DfXcym
	OAVjK73c70cORtcN5eBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRINt-001CnH-6Y; Mon, 07 Mar 2022 18:47:05 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRINq-001CmT-9W
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 18:47:03 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F4A13F60F
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646678817;
 bh=7Du6NUZLSH6JPd0VdCqJVM5KAFisPVhRd3glhN4UZOQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ZH/oSi7URveDAMBb9Lavf3tmKC61lAgU695SejnodQd4GV5svsK1W7Lmo04xCrxq3
 ypYtQYtBQGE8/8Zfxu/KyBp5giI8zBtWx943Vpag856JYNkQtrjysDMBTomNZOlsiW
 zGuU/3xWlFjlR8NlZ8nor338G8Y5TXSAnwSkJdvYn9kkYVjdmc7S4zxohx24ohci1h
 mUmkGx8K8w5eNURmV0yFQ9u0Sp4tsCwLPAoUEY4I/zy4XiWxzdRVi7LG5MGYMuKP34
 LVCNQEzOWowCvEoxrQIgkI/wvO+21JNEnB5NDqb8k85yro6P/GiomC5tojJ2fX+Y1b
 O0UQSjlZ+VuIg==
Received: by mail-ej1-f70.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so7336355ejc.19
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 10:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Du6NUZLSH6JPd0VdCqJVM5KAFisPVhRd3glhN4UZOQ=;
 b=dPPra2oF9loRE5Xq1JbTuLF6eUtlfLx6ZU2wm3JDjb7Eh6Vdl1BAXEf76oi6MfD1/g
 IWYgn9CzTjdfn1MoedFFyIuf+CjxJv8mLpz8Q4+m/46fUs5tALdyNb49ZnejGCNX+7Mo
 QnCk/02ClezJ+mlD/lMXwZ2t+v5Zi8jAafsAjkQhus2dKa1yww5Ci315putwKaRGQV35
 GelZYUQ/l9KU0zxRKvm0VKcUTRLf/5XnCPSf+a+Ynz9y3hcujj7IqjvfBGK0X7b/NHFo
 +NfTHRXjcCqF1dRpsU8e3FXAo4RGnb62o4/zX9hdKj+p84EOI97HlHlfNb+3rAR++YQ2
 KwLQ==
X-Gm-Message-State: AOAM530mjRFlzK8WBe0giJ++B12Rtk+TqDBmcMPUNnD/t/PkMjp+Ob0V
 9Yf7ATAVXcDaHYqST7btKQi+xE9oZo16pvyk+/QSn18OqZi0WnAdI2U0WilBD77rRXBfUNeOucV
 gfdcz2c3oUky5WE9aAVyHG0P4J35gVyk0vpQzL2hmBogKAsBRWA==
X-Received: by 2002:a17:907:9956:b0:6cf:cd25:c5a7 with SMTP id
 kl22-20020a170907995600b006cfcd25c5a7mr9944892ejc.635.1646678816734; 
 Mon, 07 Mar 2022 10:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpJUHm+abc5eCLSEqkNsLa+Mh4u6+Bzb3sUElgNYSsiueLRLyvJgLpRmFoXyMOzSLGycIl0Q==
X-Received: by 2002:a17:907:9956:b0:6cf:cd25:c5a7 with SMTP id
 kl22-20020a170907995600b006cfcd25c5a7mr9944880ejc.635.1646678816500; 
 Mon, 07 Mar 2022 10:46:56 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 t19-20020a1709060c5300b006d582121f99sm4960417ejf.36.2022.03.07.10.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:46:55 -0800 (PST)
Message-ID: <0901c63a-6684-348c-6f74-919075700e8b@canonical.com>
Date: Mon, 7 Mar 2022 19:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_104702_574588_AF795058 
X-CRM114-Status: GOOD (  10.45  )
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

On 07/03/2022 04:36, Kewei Xu wrote:
> Add a DT binding documentation for the MT8168 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
