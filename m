Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1AEEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSQcxXNvMtoEvYXleybMuu7n2ZmJdJ1SMRHn1Yv6Wks=; b=eTlz9+SV6H28FlOrH/8QR3oZ7S
	0L0Y1ycskKnlGtVY0eQr83JthWlmTPTUkR3ubci9rF6z6VwH8B6rgtKlSsYqG8XW8Q01ETkLarhcV
	o5hfmtNLZto5Cf8TptxeMoRlXDLhXQIkkqlrRV3LZp5giKCDbd0srgka7nW81LtGnIB7nC4wujVxS
	S71Q09HOdi8VkeywVw8JK64O19Koz6DZLaNvUjYiW8BXITbHfCOwuDWW3kE/vluYSNZkq732RO0QP
	pY/THx7fEXtz7/BIBofA4haN8zlaONOMcFJXs81XXSdbBjgFb52bweEdL3DqYLmXHiIrTHTpmQPMH
	JmemsVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCq-00C6rT-1Q;
	Mon, 10 Jul 2023 15:53:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItCn-00C6oV-0k
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:53:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso20862575e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004418; x=1691596418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSQcxXNvMtoEvYXleybMuu7n2ZmJdJ1SMRHn1Yv6Wks=;
        b=fNvKeNQ5dHiEzFpTJhNte7irMm2l9ZB+OK+PiCcoo62TpXFyk9V/1TvOlTXrioO/+c
         aVkMpPr05YH7+bthIMfTweGRJE4PLObXeSw823ro4zRNg/0xH7Co1n6J2eaGpJFRrUZR
         o6a6FNjMuZMBytXao1Mt/QKXv52caYeYZ7fb7S0wo68Ep65eQoceVIodtUb7EixrrVAF
         c5lVaaUXh5e1qpRi8ETxwJLmKLoDCgsnerHef/OcH5xsw68Hpco6Z6Ov8z2ib6KS+Kkf
         q9xeiqXkqjmIJP9BmlVrkynbx5IbohEGQn3b4kQ4TYlUqbKRg2+d0uXZcDkyaNlpdZZ+
         v42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004418; x=1691596418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSQcxXNvMtoEvYXleybMuu7n2ZmJdJ1SMRHn1Yv6Wks=;
        b=MjIsVptnEslcPykItAfId5JCXmw8D+oZu9viszmF7g+/3wD5ZEp4Mi53CxTxdjZPdS
         2tLdbIfoGHBChbLORmH/X36wJrbHvhSbCfXB4RiF7J/rRhDXFXqosw8jZ/kq8FIDRxc6
         z0mbBQYIug51rJwxdqpOsdkZYuJD3vv2EAk4PTvHSCSCX3nr9ItrIlKkwmmXSPnxPSwY
         l5v2j/Rp45avHTcSRAkKCqRDdZnd6pXcXp/x1lMhy1VmIyZDNjwqKGlme12LxdryRSCi
         JZ90079oqGDT7KBlYTbARP4uLDeGX1L6509GKf2a4Et29fBFgz7gjFqLnRbMIJQb7erR
         z3lQ==
X-Gm-Message-State: ABy/qLbAUtr8clf8rGlCSj1RUAgAe+Sq4yxJW8MH935XZkMoZqJqR5aW
	TGpsN31xEs+PXOugVG9/NOQLgA==
X-Google-Smtp-Source: APBJJlHPBDGOlW5/xdNnkTD1dpp5utDONAo/bvxgt970H8/2oaZXga/IQJyQ0xb3kqq0ns1DNmpEwg==
X-Received: by 2002:a05:600c:20b:b0:3fb:415a:d07 with SMTP id 11-20020a05600c020b00b003fb415a0d07mr12625805wmi.36.1689004418079;
        Mon, 10 Jul 2023 08:53:38 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003fa98908014sm10807420wml.8.2023.07.10.08.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:53:37 -0700 (PDT)
Message-ID: <5a30eb7d-1775-b243-8169-b3b74b1da909@baylibre.com>
Date: Mon, 10 Jul 2023 17:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 4/8] soc: mediatek: pm-domains: Create bus protection
 operation functions
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-5-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-5-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085341_282970_4C89E2D5 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> Separate the register access used for bus protection enable/disable into
> their own functions. These will be used later for WAY_EN support.

-- 
Regards,
Alexandre

