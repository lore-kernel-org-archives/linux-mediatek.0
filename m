Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fd7a9BQQqeefatGkptmpq6+Xp+BD4kDPIyZZcKeqWo=; b=PrKt53JKc+9H2i
	qo8V7dPUDqMgkwyQLU93AmZ0pu7QOOcBrrotULwCntlCYFRvxbSyuDaCYUktdkxEbg8gaorbi7OMR
	JIJSpd1NwBSZaHLjp9to/746CMypPKE9YZbF0EtuX8hGRf7BMxfgr93QrWETV1sTIlBglgOGVa9Db
	ZvF4pjjirWY/C7ZXep34tdED914YbjvXVo0eNhxvub3iJOsv98I+Ia5zEBZK5kg7xsLVtsufqPICu
	mMAudbyq8uP0qstX+v8LqRuio0GOUaIitS4aVlumQxET23wEVgp4G5V2PSqsmwU8Lf91rdV2vVrlb
	4BD4fnwptu8toAoEgWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paB5v-008Mcu-Uy; Thu, 09 Mar 2023 07:53:47 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paB5k-008MWl-UF; Thu, 09 Mar 2023 07:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678348406; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzz/SZmrVGDdioH8gd2ceSR5S33TJJH1SOWXyGiilM4kIIYmJDlDBzMtTQ+VoPAiKa3na2dZEWt10SamAIAm3IPtth/hbtRgABWsXdeh9IeTC6iRNqa5Hux+9ShYkfPMJySSKZ9LNs6+nEOV6pkV734PZyM+f/b2WWup8sN71wU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678348406; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1fd7a9BQQqeefatGkptmpq6+Xp+BD4kDPIyZZcKeqWo=; 
	b=PBivApT/Xh8cQ5OYjSTQ4L1H1J0tTBWlnsbY/K9fFNglEdtqU0KiZzIqwrSWCami65hEklncFHjgkGy/Qc4bC918kPplGxjcw0qkFYby4bh6jt8LIBJVdvGIePL+H8cqr8GS8kHC49i9+BTx+6P1WSHL6MBqdyeYAZdKMqt+6uU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678348406;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1fd7a9BQQqeefatGkptmpq6+Xp+BD4kDPIyZZcKeqWo=;
	b=LCrfBHk2uzlnL8inI09VTobjR/W4aJWYPiPnu+/P5ig6K+WNHIsWVAL1LpengfMp
	xulJpbe0jGodtkiggMHWyMmT8ZDaz/PLdOrFsk3hIL1/5qpiouFgb5iZKoNMSi6EeVd
	kp28eEcce2u0hDMWNR4OU0pboJv2ub6Fai1hlLjk=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 167834840432473.9346941163709; Wed, 8 Mar 2023 23:53:24 -0800 (PST)
Message-ID: <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com>
Date: Thu, 9 Mar 2023 10:53:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Rob Herring <robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-10-arinc.unal@arinc9.com>
 <20230308210514.GA3767521-robh@kernel.org>
 <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
Content-Language: en-US
In-Reply-To: <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_235337_104349_7D5C94F0 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9.03.2023 00:19, Arınç ÜNAL wrote:
> On 9.03.2023 00:05, Rob Herring wrote:
>> On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> This platform from Ralink was acquired by MediaTek in 2011. Then, 
>>> MediaTek
>>> introduced these SoCs which utilise this platform. Rename the schemas to
>>> mediatek to address the incorrect naming.
>>
>> I said we don't do renames due to acquistions, you said that wasn't the
>> reason, but then that's your reasoning here.
> 
> It's not a marketing/acquistion rename as the name of these SoCs were 
> wrong from the get go. The information on the first sentence is to give 
> the idea of why these SoCs were wrongfully named as the base platform 
> that these new MediaTek SoCs share code with was called Ralink.
> 
>>
>> To give you another example, *new* i.MX things are still called
>> 'fsl,imx...' and it has been how many years since merging with NXP?
> 
> Ok this is a point I see now. Though, I fail to see how this is called 
> renaming when there's only new SoCs (from NXP in this case) to be added.

If I understand correctly, i.MX is a family from Freescale so the name 
was kept the same on new SoC releases from NXP. I believe it's different 
in this case here. There's no family name. The closest thing on the name 
of the SoC model is, it's RT for Ralink, MT for MediaTek.

On top of that, mediatek strings already exist for MT SoCs already, at 
least for MT7621.

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/Documentation/devicetree/bindings/mips/ralink.yaml?id=dd3cb467ebb5659d6552999d6f16a616653f9933#n83

Arınç

