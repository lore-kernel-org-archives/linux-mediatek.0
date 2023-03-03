Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A0C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KecT7aJZBTtl4AOpLMt2qpIjfIOj61Svcu1Xb2PNyJI=; b=G0ZKOik61QKvWE
	R7wyGMIWYF/Pam4Biq3XrsyF1Fy0zjjxt/+OMML5DSGzNh2Qi0Qm2CEU5dg8QoDy8EgEHoKPst/Fe
	m5jPhk1J0JgMywWcuOr8+C1v7PuVffJhsrDG1tinEMuyd7FctS0mcSn+Wj+wQAWLAhcpXVFk+T3L6
	uZlTQx9BYZTi8PPJmFktA+zW5Hnfl+l7VCpvRAa10igsznBnqbXGJ24v59zJ/f+eHv8jeoGoMHmM2
	7FHKraYLn99Z9nmCw7MmgbVeGBI+49RkOPJsdEvg+bgUCMjQqhSCsT+QADAnTZWWYdw1bkp8/bnFI
	ubnNnsAtS7SUg3yULLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0EB-005I9t-OC; Fri, 03 Mar 2023 07:53:19 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0E9-005I8t-FQ; Fri, 03 Mar 2023 07:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677829991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bToTMVisRwaGZAy2Ep8EDZw0/7dYOPaNtyRClspqoIqRry3bapXKEsrQUvrxHbmykKJeL3NebAlSvkE4ZsyaWRXFAbbxoCnfE9OrD6laNXXwR+J9lgUgAVBjPIqpbjUaZg5C2SFY2Kt+pHYwQ3o0UtsQsfMqxeuT3NLANpeYv+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677829991; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KecT7aJZBTtl4AOpLMt2qpIjfIOj61Svcu1Xb2PNyJI=; 
	b=X+1l2xYAmcRySH0xY9h/jnRoBl0eiJfQKLC3vlfmDgANQvidQlwXMN6WgTG8Pj8n/D9A+bP+q1chJbRbG5JmTyJKXRalZ9B0JuNul5OwVSd/8RVQierqa7W1m5tP4qRFE7fUIuIqNdtASkefaYqVgeIr8x8tXjn/Rr41RPXTGbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677829991;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KecT7aJZBTtl4AOpLMt2qpIjfIOj61Svcu1Xb2PNyJI=;
	b=C8KjfIzfJHHYq/13GitfC3gQpfhRE81yzh5tdynafyCwxzw27Gy9c9T5LIA7rS/5
	e1NLUiS4jxH7GTzuHWIkxoJ5r7pmlcD07EWg53mDN/YfMFW0Lc+AznsQa7qZQ2QlUwO
	6NPS8inkb91Mn4RKCT/usG4gCJsTkTbMACy5hWSs=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1677829990732306.4293848301023; Thu, 2 Mar 2023 23:53:10 -0800 (PST)
Message-ID: <b6dae90f-2c2a-3434-9995-527f33533730@arinc9.com>
Date: Fri, 3 Mar 2023 10:53:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/20] pinctrl: ralink: mt7620: split out to mt76x8
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-5-arinc.unal@arinc9.com>
 <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_235317_817955_8CB9CEFA 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Empty mail?

Arınç

On 3.03.2023 09:03, Sergio Paracuellos wrote:
> On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
>>
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Split the driver out to pinctrl-mt76x8.c. Remove including the unnecessary
>> headers since is_mt76x8() is not being used anymore.
>>
>> Introduce a new compatible string to be able to document the pin muxing
>> information properly.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/pinctrl/ralink/Kconfig          |   5 +
>>   drivers/pinctrl/ralink/Makefile         |   1 +
>>   drivers/pinctrl/ralink/pinctrl-mt7620.c | 257 +--------------------
>>   drivers/pinctrl/ralink/pinctrl-mt76x8.c | 283 ++++++++++++++++++++++++
>>   4 files changed, 290 insertions(+), 256 deletions(-)
>>   create mode 100644 drivers/pinctrl/ralink/pinctrl-mt76x8.c

