Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46CEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vySWJ6MN7022l7oLRpZ2ZjFOTGdUlfBsedw6emUG1O4=; b=IN0de31Z0ZxToaUBdgNvsFNgED
	EwaXfIDLwM2AOvMPVXMQK25qrAYPxsW81d1ShCnf/T8UKcex9cnWadus/57gxnPy9P/Dx8FhGyUHX
	nOGy01yZ9rKiYZiXXvWgM8ms2xy9SZDDQ4/CTx1BvNNPUEyNt6Ve7OQaTdQ1EZ08AP24cfyx30eMh
	gZG4HKpEOgLVDTtjr5HUSJP7UF7/eqRofqSiCoIwO6dd3Z48UrwMeH4zpuFibXe4G/wKq0+C8yh+k
	74YJALni+pHCw/K005S/1FW1033jxFwzuZq7psvOp+DL0asrYXGZDZU19sLH2sngvM3wZqxavnVUz
	9gk7GbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3HC-003hiE-Cz; Tue, 14 Feb 2023 21:55:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3H2-003hgJ-EN; Tue, 14 Feb 2023 21:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1676411735; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ca/TggrF2spbW8pMsdJvQthh73Cj9ui7TX9h4Ts4FoBXxMiH6Hts2WOnpoMstcylavAvDL1tu9lR9zJhB9Ovp9gw9HoTW6/ods2PbtaHuKDagLg4Qq3F5QpyO3kHgkbVcw/2Nz6lvy1Awx/gN3wq2ZwnaDp6hiYQLBsXs2M6Tr4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676411735; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vySWJ6MN7022l7oLRpZ2ZjFOTGdUlfBsedw6emUG1O4=; 
	b=Zwqm7OmXoHxtZvgHa2/pUq1iRirvi9dcfAVHbkMliZfcGRmeBB8zIzju6AKZDpu7KyoIK+AhZRtz5Ufk1V3icIwlTT2wEKeh7Am3pBP5WhLBPyHsOkR1sccH7j1TNbW6jaLhHjus6/43LhFm+7RUoX5OZwrbylMGziC92LuvMb0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676411735;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vySWJ6MN7022l7oLRpZ2ZjFOTGdUlfBsedw6emUG1O4=;
	b=Di5jnN9soUnGjJdR/O7p+IrPvwh+BCFYmxAd+xdPOhAwkkYELy8sjacA87Z450a2
	P5OB9yDUlso9h1rdQzX/jrL98upH6zSvN/R57MPEepNi1ber+l9HthibJ3jpEYutJNe
	v44UgNwL7o5qW5XWT0ziksNDISF72+b3UbqcmqGU=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676411732227685.6659792892178; Tue, 14 Feb 2023 13:55:32 -0800 (PST)
Message-ID: <551f3ca9-d919-0eef-844b-8925c94ee236@arinc9.com>
Date: Wed, 15 Feb 2023 00:55:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm: dts: mt7623: disable home key on Bananapi BPI-R2
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, arinc9.unal@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
References: <20230212121354.44590-1-arinc.unal@arinc9.com>
 <C18B89E3-7B54-47B4-98B3-B2D74AB29A54@public-files.de>
 <fbc7cb4e-0424-f9c7-aa99-d8d9f7674175@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <fbc7cb4e-0424-f9c7-aa99-d8d9f7674175@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_135540_578150_49AA86B4 
X-CRM114-Status: UNSURE (   8.44  )
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

On 14.02.2023 21:09, Matthias Brugger wrote:
> 
> 
> On 12/02/2023 13:33, Frank Wunderlich wrote:
>> Am 12. Februar 2023 13:13:54 MEZ schrieb arinc9.unal@gmail.com:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> There's no home key on Bananapi BPI-R2. Disable it.
>>
>>>
>>> +&mt6323keys {
>>> +    home {
>>> +        status = "disabled";
>>> +    };
>>> +};
>>>
>>
>> Acked-by: Frank Wunderlich <frank-w@public-files.de>
>> regards Frank
> 
> 
> Applied, thanks!

Efkaristo poli! (I'm learning Greek, I'm trying to practice wherever I 
can ;))

I'd like to remind my v3 patch series for the mt7623 DTs.

Arınç

