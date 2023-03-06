Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nd+k8XAgPSgixGUgbvKDnLLladecVQNt6nXtFJIVZE=; b=gvXaMo7/L1jsRF
	HxM0PgCAPRq1l1/6iefbEbb7ou4cZEsCOC729dV8U8IqS2lFYVqJKZ5HSylMchWp0+i7ZWLPkVdLg
	cZp+kiDTVT4mm1suNKUu/kfgi0/CSffn3uxmbe/vLc6Scgq4ORCa6CpaTneXCULDMJhI0N4FOQgfH
	cBpQq5KARxB9ag/zusuxL+630JWNzUsGg/OXOfnR1vGrDrBqeVwZYMxxG0yLarVkx4D5SOpFKbVcC
	yw7yUJrJB9iHCnpT16SUSENjZZ9wvCPKHQf224X3aS0Jvc9daUtSymouCf/Yb1SU6Fcuk2n8VhECg
	dy8WzG3mZOWYsmYL+TYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCGJ-00DTN0-EM; Mon, 06 Mar 2023 14:56:27 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCG1-00DTD1-F7; Mon, 06 Mar 2023 14:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678114559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=msY3Rd6XS3xqaxJl4LGanNjzLlMn4D8qSKys/ZRSpHDX9wFeRnbb2SWGgB1VYyQmaFcq+xB13R8jkUAiwHgQ+g5I0/T+ib1w2bUiMIwNwCxM8pOehbDfH7Mfym5+yPm8Mto8OoBxubperIwcEpq9oSgmIDpcxx/MyshGz2JZY3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678114559; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9nd+k8XAgPSgixGUgbvKDnLLladecVQNt6nXtFJIVZE=; 
	b=kOGm43Rs2U1fNoz+m4m2WUtxQVDAT0YRuzmw8Owd9FW1Wnyo6hAL8bW5kaoAIwtMLDZ0bjasdubyK6UknMqw2WvTkM7BIlwlL3ECKT7HAQ/bUJMw4gHhF2uAb7N0I0G8FAM95sW7Me1grGlJErpLHA6cTJqwTVRzqJdG3652LcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678114559;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9nd+k8XAgPSgixGUgbvKDnLLladecVQNt6nXtFJIVZE=;
	b=VA12CC+3jMsU/u8aqp6hpuRoil8nuXF/2ajC2F1arRIzefc4vtLnfnuLu33Z63Et
	vbfT1meJmQ2UdQ9qZKlSEb1HishyAySPdOVp/LlxD4VjI7BMeP/qhzXCEBM1HYXlyQM
	DF9nCGtgVgx1lSgqr/wK2qJUP9eCxho9M4FzsBeA=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678114557969142.92607754783864; Mon, 6 Mar 2023 06:55:57 -0800 (PST)
Message-ID: <486ebf30-dde3-b77d-c292-ba7605313273@arinc9.com>
Date: Mon, 6 Mar 2023 17:55:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to
 mediatek, improve dt-bindings
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_065609_620132_56407D4C 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6.03.2023 16:50, Linus Walleij wrote:
> On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:
> 
>> [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
>>
>> This is an ambitious effort I've been wanting to do for months.
> 
> Good with ambitions :)
> 
> As long as Sergio is on board and can test the changes and as long
> as the DT maintainers do not explicitly disapprove, I'm game to merge
> this.

Cheers.

> 
> I guess you will respin on top of v6.3-rc1 when the first round of
> non-RFC feedback is collected.

Sure, if it's necessary. Once I get feedback, I'll rebase it to your 
linusw/linux-pinctrl.git for-next tree, see if it needs manual changes. 
I'll let you know.

Arınç

