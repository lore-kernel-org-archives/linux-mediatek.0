Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FBC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 07:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5U8jD0mceNdxMH5d+XXNMoLuXyA0CAviMCHpJ7kQo4A=; b=h6QA09ODTJWE27
	PNGVd3sNWznbOxj2XZEhW1g51+gef/FdwJH/7+taUe9Ppy2zWgbKxdEfFDgpP6PrC6t7QMKYBe865
	/c0cSwFT+d30eKYUfSZWLjeEL07Qw+QwszBL7YDUNTYJCJO1rN9SZ+Bt42oJThp1fDR43/BGalHXO
	R7gnM4GzIySsFBRXMLhOtBrIzg04C2hTLrR/eKjuAV9MHKf6evrZbBisWXnA37INpCk2bGd2UV+PB
	OppZ3GhEltWVN/8fN+PqtW7L5Hf9JV2WdGKTPH+pMlAJw9nWX3lSeMIbNcM07efT8T1rXIIqBeMZB
	LtsAmhNv8vmErQUsT+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXRq-00DSH1-Lc; Fri, 10 Mar 2023 07:45:54 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXRn-00DSFs-JD; Fri, 10 Mar 2023 07:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678434342; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ru7IYBxv1TeMY1HDSIbcbhxUNtx0dao2F3QOW2pbVrTwW8MMATPUUfhpbPFDqiDvMQKahq7ri2Mjiem2lj9SCcw7TkhylZSmeax3MK2J/VXzpVq0e8LoVw6F0Lyc+GVikjDwhJ+02yn6gCRLlLwrAU8XmJgfer7Iz/t5NdVBCVs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678434342; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5U8jD0mceNdxMH5d+XXNMoLuXyA0CAviMCHpJ7kQo4A=; 
	b=Nlr0Yw6/VEg6XyZsWZZjN5V+6CSnxtknPmaDq4A1F1Aq0jElIB0fJixzWdmEx39LOFK24K6DTfFAd0WuZflWOJs9fZXNuYm3ByHDcJ0sC+fsJVPd0N5srafRM1XWvuVrVQ8pY4FF5jJKqm8UdH+LKfiUUxXn5dZAzJT3cTpeXqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678434342;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5U8jD0mceNdxMH5d+XXNMoLuXyA0CAviMCHpJ7kQo4A=;
	b=JUSLKQwACAis7T3MVKl2xbQaFmgnTQo32wE1WLFdrJdA3G0c59CgRzZ19UN+6JQh
	MwtY0l61oqaAqNpV7FUhS0MXf2b1ywfgpncP3s5GnBaNnVlNwq7QzsVNhAA00kLHeZc
	rJLu4yaNfejgJibc+I4PLJsuL2k//ZaEdZRqu7XI=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678434340115989.170333737338; Thu, 9 Mar 2023 23:45:40 -0800 (PST)
Message-ID: <6019d3ff-3fdf-543f-c5fb-cba512582fb3@arinc9.com>
Date: Fri, 10 Mar 2023 10:45:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-10-arinc.unal@arinc9.com>
 <20230308210514.GA3767521-robh@kernel.org>
 <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
 <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com>
 <9663817e-7f6f-c3b1-8bf9-321f9b067e96@linaro.org>
 <deca532a-bdf5-c49e-1422-ce6124b61882@arinc9.com>
 <CAMhs-H8M3ir+DshHF60W=QMn9WG3Jgbo8GgXZnDKCLhs=+WBoQ@mail.gmail.com>
 <81cf9e50-d626-cbb3-ebb1-56d080eca66d@arinc9.com>
 <CAMhs-H_YkdacZXE2xqn=_JQtitLvqRFB20s7rjS63dFabAL4qw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H_YkdacZXE2xqn=_JQtitLvqRFB20s7rjS63dFabAL4qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_234551_728755_8AC2B543 
X-CRM114-Status: GOOD (  19.77  )
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
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, devicetree@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10.03.2023 10:05, Sergio Paracuellos wrote:
> On Thu, Mar 9, 2023 at 10:09 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> On 9.03.2023 14:33, Sergio Paracuellos wrote:
>>> On Thu, Mar 9, 2023 at 11:34 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>
>>>> On 9.03.2023 12:52, Krzysztof Kozlowski wrote:
>>>>> On 09/03/2023 08:53, Arınç ÜNAL wrote:
>>>>>> On 9.03.2023 00:19, Arınç ÜNAL wrote:
>>>>>>> On 9.03.2023 00:05, Rob Herring wrote:
>>>>>>>> On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wrote:
>>>>>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>>>
>>>>>>>>> This platform from Ralink was acquired by MediaTek in 2011. Then,
>>>>>>>>> MediaTek
>>>>>>>>> introduced these SoCs which utilise this platform. Rename the schemas to
>>>>>>>>> mediatek to address the incorrect naming.
>>>>>>>>
>>>>>>>> I said we don't do renames due to acquistions, you said that wasn't the
>>>>>>>> reason, but then that's your reasoning here.
>>>>>>>
>>>>>>> It's not a marketing/acquistion rename as the name of these SoCs were
>>>>>>> wrong from the get go. The information on the first sentence is to give
>>>>>>> the idea of why these SoCs were wrongfully named as the base platform
>>>>>>> that these new MediaTek SoCs share code with was called Ralink.
>>>>>>>
>>>>>>>>
>>>>>>>> To give you another example, *new* i.MX things are still called
>>>>>>>> 'fsl,imx...' and it has been how many years since merging with NXP?
>>>>>>>
>>>>>>> Ok this is a point I see now. Though, I fail to see how this is called
>>>>>>> renaming when there's only new SoCs (from NXP in this case) to be added.
>>>>>>
>>>>>> If I understand correctly, i.MX is a family from Freescale so the name
>>>>>
>>>>> It's the same "family" as your platform, because as you said:
>>>>> "introduced these SoCs which utilise this platform"
>>>>>
>>>>>> was kept the same on new SoC releases from NXP. I believe it's different
>>>>>> in this case here. There's no family name. The closest thing on the name
>>>>>> of the SoC model is, it's RT for Ralink, MT for MediaTek.
>>>>>
>>>>> It's not about the name. NXP took Freescale platform and since many
>>>>> years makes entirely new products, currently far, far away from original
>>>>> platform.
>>>>>
>>>>> That's the same case you have here - Mediatek took existing platform and
>>>>> started making new products with it.
>>>>>
>>>>>>
>>>>>> On top of that, mediatek strings already exist for MT SoCs already, at
>>>>>> least for MT7621.
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/Documentation/devicetree/bindings/mips/ralink.yaml?id=dd3cb467ebb5659d6552999d6f16a616653f9933#n83
>>>>>
>>>>> NXP also has compatibles with nxp, thus still not that good reason.
>>>>
>>>> Ok, makes sense. Am I free to call the SoCs MediaTek, change the schema
>>>> name from ralink,mtXXXX-pinctrl.yaml to mediatek,mtXXXX-pinctrl.yaml
>>>> whilst keeping the compatible string ralink?
>>>>
>>>> I plan to do some cleanup on ralink.yaml as well. From what I
>>>> understand, I should change the mediatek,mt7621-soc compatible string to
>>>> ralink,mt7621-soc?
>>>
>>> You have to take care of these SoC strings since they are used in the
>>> very beginning of the ralink startup platforms for any single ralink
>>> SoC. See for example [0] and [1] (but they are in all soc init code).
>>> I think it is better to maintain the ralink.yaml file as it is.
>>
>> I'd really rather address this inconsistency everywhere possible. The
>> code you pointed out looks different than what I did on the pinctrl
>> driver but, surely it's possible on the code to introduce ralink and
>> keep the mediatek string for the sake of old DTs, no?
> 
> In any case, the changes you might have in mind for this should be a
> different patch series.

Agreed.

Arınç

