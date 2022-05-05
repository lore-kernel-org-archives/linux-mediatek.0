Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPYq73vnaXHVWFf5ONZkdtQk1x9pTo7avxQm5iNnnuo=; b=1uVHvS4IRfaPDT
	Ge42hAG4Qa3RN0x7897dhydzgA/I3irDBNMFrt7ioCZsteokfsgNqUUcTfka0eWbd/gAs9xo7mOuq
	ilsqJUmMKMFoXWueWK1lnDhfF6L6qeKjes95YEpqmGk8olNA3L9YG0nzNxokQpzwkxxFFFnm6m0kC
	OQmQ0pcCVxCqf4nWglP1mdHSvtfDUdcvjGKtfTimzbkjq/oiZ/wAKrNSNtoC/fvmch0yJk8bx63hY
	LIRF29mJr4ZMpSHDsCYjzgDX163P85WBjNxzXnXrI0XeVxbw0HtCBckpQcvUzw0Ee0JxQjrSA8MPO
	hhz0BCM9/nm3A4S5rCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXhw-00F0Nj-IF; Thu, 05 May 2022 09:23:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXgn-00Ezf1-0g
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 09:22:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id u3so5277872wrg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YZkhX8VdSbRZKmQIOzgkSfpmToAIJcyGhKGvONZeKPM=;
 b=wgm3Tdzap7kkOBihTP6T0IhnT9G6Oc8Ge/5nUNlrSnTPInQoGJ98CKanFTwb6sMccZ
 9d4KCxdg9LCYphRKvE9rvwU1++xkoof4loKmHyCYfxAY0gBFhMA3oPXw7NTjEqqxyHfC
 cNwAxA8oRijMoUjff4ROoa9YilWt5ieCB4F7ZaDx7bZ5NBlRq1XEjDizZ9ItDHbBrDJw
 rdCoDCQ1En6Y5bGPfqpHlZRcg2m4vS6Y/g4KRAX51Favpx55TneHi7u6O0EF4FPDa2B0
 NZ6FEyOLhsL2fcnruWZj5H0x5LOeT1KGIGqo+XJU4paF90d6jjbgSv1wgUCBUHYfU45r
 HmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YZkhX8VdSbRZKmQIOzgkSfpmToAIJcyGhKGvONZeKPM=;
 b=8I5hu7D9/6OrUehA3c55rvf5LI84SzSndAApfJ7SbP3wKnmChVTdlnRv8YBknNenr5
 uc6p2M1tDeeS2y8Q6onOJ6OIHVYudwzFLbFWIo4vPjBEA757eNHtLjS260X7/F/Unk8Z
 7zWQTwYrzcLxSqK5GCMFJooX+zNBEiMNviZ72ZgowTD1SfkxzIPrtnWTLl8oTv7qEZC6
 H4/vmxrUTZOQITy/mdrPCl3OEJ7bWp4r1ETNTjLmkIdEMFwr3h28V7OCSS8/v3pQG4Sl
 vU2dXU9nHYjOXp1mrWeo6w87dPLQNqamj3BiY1XIrKeelZFP4kjsXC8Q4DuraIL3NUxA
 FnOw==
X-Gm-Message-State: AOAM531dhh9LFYJZ9YATcqTwZhJ/xNEzt8mtjufuEE6PDHxz0Ak9W5hP
 3421O7kBpGo8OBSFBZ2+aW6gsA==
X-Google-Smtp-Source: ABdhPJwfam1b9VUuK2KiSROtjJ68KFyfCyHnaJU4kSRx96x9vSh8DG8UHpeSy1pcGwoX3pIR2XLwyg==
X-Received: by 2002:a05:6000:1110:b0:20a:e113:8221 with SMTP id
 z16-20020a056000111000b0020ae1138221mr19276809wrw.271.1651742541836; 
 Thu, 05 May 2022 02:22:21 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o9-20020a5d4089000000b0020c5253d8d2sm779379wrp.30.2022.05.05.02.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 02:22:21 -0700 (PDT)
Message-ID: <e9e03c19-cf65-28b8-a81a-10995b1f262f@linaro.org>
Date: Thu, 5 May 2022 11:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Content-Language: en-US
To: frank-w@public-files.de, Vladimir Oltean <olteanv@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
 <20220504152450.cs2afa4hwkqp5b5m@skbuf>
 <trinity-9f557027-8e00-4a4a-bc19-bc576e163f7b-1651678399970@3c-app-gmx-bs42>
 <20220504154720.62cwrz7frjkjbb7u@skbuf>
 <313a5b2e-c571-a13f-3447-b1cd7200f4c9@linaro.org>
 <D201CE50-280C-4089-BB9F-053FEA28FE9A@public-files.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <D201CE50-280C-4089-BB9F-053FEA28FE9A@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_022225_158035_815D9E56 
X-CRM114-Status: GOOD (  11.24  )
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

On 05/05/2022 11:06, Frank Wunderlich wrote:
>> You can make it "(ethernet-)?ports" as well. My comment was purely to
>> make it simpler, for bindings (goes into properties, not
>> patternProperties) and for us. If you prefer to keep it like DSA core,
>> also fine.
> 
> Ok, i'm also thinking, the dsa-definition will be the right way (pattern-properties with optional "ethernet-") in binding.
> 
> Should i use "ethernet-ports" instead of "ports" here? Current dts with mt7530/mt7531 switches using "ports" so i would use it here too. If dsa prefer ethernet-ports now it should be changed in other files too.

I think bindings allow both, so choose something consistent with
existing DTS sources.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
