Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF02C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj1EqQifssBoeW2Mu0UMZouBhzUVXH9Qqd8rb3GME8I=; b=PmGjQf/9v4NKGH+lQuBEOmowV1
	JewJuJL8CieIrLChYxZAW5nwLAtzcxjlpc1J8kcckw6ATtrH3sgm9yGA1Vdqzs/izID/MJoFp4Tpl
	qZ/61MFNzrLcmU+hd65k6YfpW1+IvLLSj2XpmvuRb2Nz/iMgyW2+VqzzCwzeu16tm/Qkcc7Ry28OJ
	cTJeNjJ9rnUOaXBHivFv/2waC+Vtkq5nUKkeRoISSdonmKNaU9ShcVB4oWbrd/iJQ+1TrX1n/SCP7
	/bjRcTyc2WyaiwSaSTx1WpSnCJ6ASOH6UptN+Z0Lk9rmylsE97AFM0JoQarTXGJLRERHvteZEEUB9
	vW5Mq8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2dd-00GLiV-Be; Thu, 12 Jan 2023 18:49:21 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2dO-00GLbF-KI; Thu, 12 Jan 2023 18:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1673549341; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VVwndzmZa3T9qUUdXmyL13LbeRcCo5aJtQeRb7eBu+6OetmVkzSyFwgModVSbrGppw9715GZvPbcVBY//a3GKP0rFb8M7FXFYw6ZhmG6a0aXrqwtQlAZ6o2fQQad9XwefwqXhkYzcrvDeVobMcewjY0dNVne811j2LoXV9YGDgo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1673549341; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xj1EqQifssBoeW2Mu0UMZouBhzUVXH9Qqd8rb3GME8I=; 
	b=HjiaFjlPWYVDLgKpYM4LqTr6gdRXwjI8kdYbj83mbYvEzLluLd8ekB27EXQQXx2rKqz0yWxRttqk6rgO0zL857+7R4HYBxldp82pqPDHc/h0Ddp8EXEeQjIT1SZGEjOWFe9Lavv2WDJfun4fNhKEY5TXVAkYk/RgEtU6OT4A/6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673549341;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xj1EqQifssBoeW2Mu0UMZouBhzUVXH9Qqd8rb3GME8I=;
	b=MVVnnKfETDgCzyJ71jmAq0v6KG9MyoQ61/n28O/AOxxL50oAeLv599dp3ckuEkks
	51maUW8rNrzLygfhxYZqnOXoqtZJuZa0ms6JcL0SJHezSd9qrbC3YObzlQa7AbVKyA1
	DeQrTFmoYmu7mRK2OMYHgeJbOHyWzTqpDwLC7HF8=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1673549337883457.0526498585821; Thu, 12 Jan 2023 10:48:57 -0800 (PST)
Message-ID: <c5412e5c-97ff-ba79-fd78-895889c129d2@arinc9.com>
Date: Thu, 12 Jan 2023 21:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: mt7621: add proper function
 muxing binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-4-arinc.unal@arinc9.com>
 <1b5880bb-d0ce-9dde-2fe6-e058f6efb6f1@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <1b5880bb-d0ce-9dde-2fe6-e058f6efb6f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_104906_771943_2CFCE468 
X-CRM114-Status: UNSURE (   6.62  )
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

On 12.01.2023 12:01, Krzysztof Kozlowski wrote:
> On 31/12/2022 17:08, Arınç ÜNAL wrote:
>> Not every function can be muxed to a group. Add proper binding which
>> documents which function can be muxed to a group or set of groups.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Didn't I already ack it?
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I believe you only did for mt7620.

Thanks.
Arınç

