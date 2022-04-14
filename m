Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIreRutHoBlDH4UFzViZPpuMM6slnKTliWMuweXjj6I=; b=Pk9ALWFXXedjze
	nlK6lLPv7nqf7HmbNO9UZ5Kup6vUyXXtyh6FhRQzDIbeOD4gvfFaEFH92sqOYm3LC5EZcVDhKP4/B
	4+1YWJu3hrRlrmdwL720VWEKFJIOck9QrNSYnX1yRa2oZtL3Dv2BmQqFsW+ZRAtp6QZrWWOERjwGT
	bYkok7JfAiYPUvApvwo79NxeiC5pFn42f8yP9TZ8UjVjrbKkUvr5NUuOHL96gbyse6zffRwjXuRjL
	0/MFBiL1S3TLZ76fRlXe2mqHvG2uT5aDQTv6zeA9ZL3y3NNUtNrqkLeVWsU4Mc/iGHmMe9Cd/JP9R
	p0mGKAH2TFMCjWWBokLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuoC-004YDI-2T; Thu, 14 Apr 2022 08:26:32 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuo0-004Y7n-OA; Thu, 14 Apr 2022 08:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649924769; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TS/8AbcqCcTg0XG6oD4ZAE+/nlorL1IE/FgNXvAKY8/FXCi4dpfQtmtWgd+bUnaSu2BJ4WQYG07yrnBODvM/G3NsF7Jbfo3KAlXsUcutEnwjfFNJTvkLuxAWsFhxCItt4zFANxBJgYHNx6aU927chAUEIDu3Ur3a+A7Q7XHiTgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649924769;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9Xw4AMUNkwII/4xbpRieFUaGZTpw21Ls4OfPB8J1Qu0=; 
 b=FWGuaCtSaof2Kb+Tmr2tT5kNYw2FI/7amq+6KT22VIh7EVtOlGzGOQAYm90D6SEsgnZQxdNFa6UHQJOD+NBrYBlSx6iyTjgfT/Pdn2fVZfru9+dbYMC3/AF6PQ5dL56qlk8OHv807IECuI0948/OyvYnZNqGIl+eRN5ErZKSl20=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649924769; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9Xw4AMUNkwII/4xbpRieFUaGZTpw21Ls4OfPB8J1Qu0=;
 b=QwmRSeZ9Awu88SodbDp1aVMHhVIHOHfwUTi8j70ziaPnmPo6LkUc+uMNpvuKLCEX
 n1wFWdmdyVW9Gislvx/ndRiTV8Im+vtCYeJSmbCws0Ci0QxfruRnxrhgkaPEv0JBv0T
 44ZuuLrdvftxCw9Lq08rh+5L3RPRAbObLe0dL5+M=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649924767135253.6117557774876;
 Thu, 14 Apr 2022 01:26:07 -0700 (PDT)
Message-ID: <b8a5b9d0-0020-31d7-f9c1-3e971f28aa94@arinc9.com>
Date: Thu, 14 Apr 2022 11:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
 <e6424c41-fadd-d326-49af-28db51606c2d@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <e6424c41-fadd-d326-49af-28db51606c2d@linaro.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_012620_888181_1BE0FF01 
X-CRM114-Status: GOOD (  12.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/04/2022 18:39, Krzysztof Kozlowski wrote:
> On 13/04/2022 08:36, Sergio Paracuellos wrote:
>> I think you cannot change compatible strings because you have to be
>> compatible with previous stuff. That is the reason why when I
>> refactored all of this stuff from 'arch/mips/ralink' into
>> 'drivers/pinctrl' I maintained the same for all of them and only
>> created one binding for all. I know that these SoCs are mostly used in
>> openWRT and the way of doing things there is that when a new version
>> is released a new dtb is also compiled so I understand the motivation
>> of the change itself. In any case, Rob has the last word here, not me
>> :).
> 
> Breaking other users is usually not accepted, so some good reason would
> be needed here...

As I explained on my response to Sergio, this doesn't necessarily break 
anything.

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
