Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD2C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzP0t2qNfnd3V6PK1d7LQSBOy5pePAV5wJ9vr1fobF0=; b=WidZjj82v4PCoT
	Ip1Fi9NkcTWCd3WsIKPhU4Vif5vtlehA5ExIleyMjRD9c4yNyc3CI3Mh8e7J3A1q6ojjFg57GII1Z
	oLWpf5DK6HsluWZgKWyExVbyBzm0ExGbRGmn47xBshxkB7HXS9c8leOwGIVLXn8yqxmRIYNREZT17
	C5n7HB5qSvGnSieFaBuqIvbZbmPNoNHWbfPmldWwCO2PdySBOLNC2dHnhUS3KHs2L7hdjDnFSpB2w
	gQDo+U7KDfc9kHCLsdHhLvj8k8W8zIfuWvcQib87pCnmazwBsRD0oMYOLdOo41Rz/ottOPWkO5JCh
	H6HdhOOYTRowS+7QtUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX37y-00Dn7G-D7; Tue, 28 Feb 2023 16:46:58 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX37w-00Dn6b-Hx; Tue, 28 Feb 2023 16:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677602805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bq2Q8ygL/SEUX6cgcpwKrWziBtCDM/1IyP1Bgqp4n/3yvzLpkGRt7eQBgYDMx0OHYx6oF829Rf7nUJTL+fgDj16Tej2RUqb7gcIqmL+AYtYF2sVOCOv8IDsqe9+mdEODYNHOSqbssLZ7rzec9nddA7bhNsViYCAHhTx6ivMPiYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677602805; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YzP0t2qNfnd3V6PK1d7LQSBOy5pePAV5wJ9vr1fobF0=; 
	b=lZIygUMLbMVTtXXx6MBZkWDnMik2/GkFQIURsEyey+wf7fPUujaeBrDdAjN9vIKzGV02VK1e27euViDv22GKRko5yHFDH7xJioBw9qQEFb9LQ+MZO2WAu/5ZiHDcRX3x/RYzMZ+EuAmqIs8BDgk49BRv06x8fgnFM3I/o1hiCtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677602805;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YzP0t2qNfnd3V6PK1d7LQSBOy5pePAV5wJ9vr1fobF0=;
	b=MS9/DjXzffLDauoiF3iu8V30lwh6+BRt3Nb1ESoJ8UABM5AQs2FrN0oPDNIpDag6
	tAbI2EtXCNtY+5T00swlN5ZrYFr7nn3vlW3COsvzRbWfGw/C/kRkyLOK1P65A0rfMUl
	IRLyIIqRcqW6yAwuC2vOiqXhWn+qOVJD1II6eeGs=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1677602802848981.7442252849089; Tue, 28 Feb 2023 08:46:42 -0800 (PST)
Message-ID: <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
Date: Tue, 28 Feb 2023 19:46:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
To: Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230227173333.GA496999-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_084656_701376_883B43D2 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/02/2023 20:33, Rob Herring wrote:
> On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Add the ralink,rt2880-pinmux compatible string. It had been removed from
>> the driver which broke the ABI.
>>
>> Add the mediatek compatible strings. Change the compatible string on the
>> examples with the mediatek compatible strings.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>>   .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
>>   .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
>>   .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
>>   .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
>>   5 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> index 1e63ea34146a..531b5f616c3d 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> @@ -17,7 +17,10 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: ralink,mt7620-pinctrl
>> +    enum:
>> +      - mediatek,mt7620-pinctrl
>> +      - ralink,mt7620-pinctrl
> 
> We don't update compatible strings based on acquistions nor marketing
> whims. If you want to use 'mediatek' for new things, then fine.

Understood. Only the SoCs with rtXXXX were rebranded, the mtXXXX SoCs 
share the same architecture from Ralink, so they were incorrectly called 
Ralink SoCs.

I can remove the new strings from Ralink SoCs and add them only for 
MediaTek SoCs. Or you could make an exception for this one, regarding 
the situation. Whatever you think is best.

Arınç

