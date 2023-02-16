Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F494C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OrrPP4Pzsaq9/1PN/JCMo/GyZLkEfrmoWTdV5kP+yw=; b=CX7kDPvHdcbPk4nKYHFDo6F2vS
	X5eYl5IXVXkm5Yd74OE7HuJv5L0pcl+X18xN8VhovePlBCqIeemcdLTt5DWHot4QSkGz2KpZThq5R
	WLmV2nB7Chlk7MVm0F29/BDCPHtoo3bF1+e9bj6tPJ8IOtupSDIDCwlYSMH49qPLx+uNIbWVZttT1
	OijYDdJbOIxHdXbDdwcHw1A/s0WFRxLi2l7xYSXZQfQRUCtZ9igCm2/go5g810LwyT/Z9EZYkntYe
	XFP4tVuhtuU+uzqNev/GFDcP1E1o3XEy/JdZz9kwwsZ3VpVCd4ZLj5RC27xRHtEdThggGuSgM77PC
	0kRz4xZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShBZ-00BCVN-EF; Thu, 16 Feb 2023 16:32:41 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShBX-00BCU3-Ej; Thu, 16 Feb 2023 16:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1676565146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RE3hY2M1j+lcLp/tsX98y11cg1I1hbDNxkXOopJjof+9TfdXNVGPnr3LpGH9otcElHnz9z0ygZ0K1ayn0/hbU+dJOO4gyYPomEB0rissGLlPzgT5JNGgTBJk7cNLVZGL7MgHVjqnVexUe8e3RGG6W8TMoM8sPY9c2XFUKDf40z0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676565146; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9OrrPP4Pzsaq9/1PN/JCMo/GyZLkEfrmoWTdV5kP+yw=; 
	b=f174fVJsDv/uV64R7vGWJP8koZC9yzFoXg8n+O5AAg5VI/CRvC8ghvDEyC/q0cxqw6SvydfjjlVlj1uvHfLy0FTPnkr16EP770+7U9hav0PFpHWeXIsWttBa4UkraapR3gk0syno1vD7ckl6vspKcnTowtafPUcCxCHzez0NZvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676565145;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9OrrPP4Pzsaq9/1PN/JCMo/GyZLkEfrmoWTdV5kP+yw=;
	b=DMBec04GEIhshEHOFDr2LcQWPxn7IFMSWYMHaqc+wpe4WhOluNqerX3+1ChNYF/p
	4pMOi7odLzLPQ9Kt3/pYsqJ2BK/qieqKj77hlu6WHknCVvbpPR2x6uqWnp5tltcGKrI
	nYizgogLrbjnz7dp2d6Vu2W+1PZwhFRIsgC3hW3o=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676565139786160.52083962416282; Thu, 16 Feb 2023 08:32:19 -0800 (PST)
Message-ID: <765313c2-c2d7-9450-aabd-29c471f82ce5@arinc9.com>
Date: Thu, 16 Feb 2023 19:32:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] pinctrl: add mt7981 pinctrl driver
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Sam Shih <sam.shih@mediatek.com>,
 Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674693008.git.daniel@makrotopia.org>
 <ef5112946d16cacc67e65e439ba7b52a9950c1bb.1674693008.git.daniel@makrotopia.org>
 <88ef812b-b8e8-f640-f9f7-a1579ea69d31@arinc9.com>
 <Y+5ZSUURaK/hq1iq@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Y+5ZSUURaK/hq1iq@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_083239_569647_2B1B6B7F 
X-CRM114-Status: GOOD (  16.82  )
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

On 16.02.2023 19:26, Daniel Golle wrote:
> On Thu, Feb 16, 2023 at 04:50:57PM +0300, Arınç ÜNAL wrote:
>> Hi Daniel,
>>
>> On 26.01.2023 03:34, Daniel Golle wrote:
>>> Add pinctrl driver for the MediaTek MT7981 SoC, based on the driver
>>> which can also be found the SDK.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>    drivers/pinctrl/mediatek/Kconfig          |    5 +
>>>    drivers/pinctrl/mediatek/Makefile         |    1 +
>>>    drivers/pinctrl/mediatek/pinctrl-mt7981.c | 1048 +++++++++++++++++++++
>>>    3 files changed, 1054 insertions(+)
>>>    create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7981.c
>>>
>>> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
>>> index fed02c6fea062..f20c28334bcbf 100644
>>> --- a/drivers/pinctrl/mediatek/Kconfig
>>> +++ b/drivers/pinctrl/mediatek/Kconfig
>>> @@ -127,6 +127,11 @@ config PINCTRL_MT7622
>>>    	default ARM64 && ARCH_MEDIATEK
>>>    	select PINCTRL_MTK_MOORE
>>> +config PINCTRL_MT7981
>>> +	bool "Mediatek MT7981 pin control"
>>> +	depends on OF
>>> +	select PINCTRL_MTK_MOORE
>>> +
>>
>> Is there a reason why you removed these lines from v1?
> 
> Oh, that seemed to have happened by accident. Imho it'd be better
> to have these two lines there as well.

Agreed. I'm preparing some patches to move the pinctrl driver for the 
MediaTek MIPS SoCs here, this driver appears on the menuconfig even 
though it shouldn't. Will you fix this yourself, or I can do it and add 
it to my upcoming patch series.

Arınç

