Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA368C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MSYDbYWejPMXjOcwjxkiS5EHblGlIiGqrapEhAoCso=; b=ghj4ZLVFiVMWaI
	udiGtQYWTmnYDrCiNBPm9orelgrjxg1nbnUg9aLD1OwTT9re0+49Mv7Y6b1223bvM8s4RpK2+GVbz
	Bf0J+FTJwNlwOTBQ5eyA5V7VCcYLvGHqYS9naH/50mSf+y0/Jn4k2Bf7i3lp0uD7nH7lhlxLd1ESH
	mE0Iarhd0mVwDyQr4tWJbAeHVK6XsCMgqg6qEyc8S/Lr9Lzqp9mmCgn9NKZA7wvnKRJwx44qQ3HDf
	Wc/fci8/VmsxMVHUpULndhBcLVey6injfKWLr8oGwZbgUHwUzqyIY8ApEddc42T/Bcs606xNh57zq
	QHtflGCVef2NUXeeo71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1NI-006qb7-M1; Wed, 08 Mar 2023 21:31:04 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1NF-006qaJ-AB; Wed, 08 Mar 2023 21:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678311053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KjmsOf7ehx4jTfl0riJMXnxP8FB+uRfC7t7inEZq8N4/RkJrqCT6fmm7BnQs+zHQ2vvwR3qcZ0iORKk7ykik2rmogrwU9nkEEese/foHmoA8UjEt4WRDd/5CR35C1EAVu3oq5snlbws7V1pFjSyVREaYwvRhMn0Q/n2n2jVhKxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678311053; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/MSYDbYWejPMXjOcwjxkiS5EHblGlIiGqrapEhAoCso=; 
	b=kaH75wBKImbQlnsYiASJ2kubDY8c9UEzwFcmMy9CJQ9GIhGCEg7YpKgC+IrDmFXR2tMyh0NE2QxgxkMyN05fmQ8B6Y/5qJm8qCdpHC4Raq+mwbKj76ov7ETq6tidzLUptpPOLsKz0gVCFG5hJGiLdNf8s9GgLawSwTsSjjN4/CY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678311053;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/MSYDbYWejPMXjOcwjxkiS5EHblGlIiGqrapEhAoCso=;
	b=iqcpeSZS/8ACGqcTYiZlf7fR4wnhrFjcsfmVJkqUT4r94IIjrgutIKc37/Dzvo92
	mc6bYk1a5bZ9DBNxtqBT/IPAYMyE5STLkqTBLixEHIRAlABt+Voqrnp9vOLC/EK56Dk
	r+sxiPiZGGli2Fn12pb3HMD/2hYwMIienABDW9rM=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678311052439170.96243035381804; Wed, 8 Mar 2023 13:30:52 -0800 (PST)
Message-ID: <4e3919ff-0488-c89e-2ab4-0fc5c5d47f95@arinc9.com>
Date: Thu, 9 Mar 2023 00:30:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 15/20] dt-bindings: pinctrl: {mediatek,ralink}: fix
 formatting
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-16-arinc.unal@arinc9.com>
 <20230308211131.GA3803811-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230308211131.GA3803811-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_133101_492829_51AFA18E 
X-CRM114-Status: GOOD (  10.76  )
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

On 9.03.2023 00:11, Rob Herring wrote:
> On Fri, Mar 03, 2023 at 03:28:44AM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Change the style of description properties to plain style where there's no
>> need to preserve the line endings, and vice versa.
>>
>> Fit the schemas to 80 columns for each line.
> 
> I would just leave the enum cases alone and make this patch just about
> reformatting 'description' entries. Either way:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I guess I've got a bit of OCD so it would really annoy me knowing that 
I've kept some lines exceeding 80 columns. It seems OK with you either 
way so I'm going to keep it. ;)

Arınç

