Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77270C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQgF3llxgKUbykkcc74yevV5YTgkv/KJF2WY5oDGXhg=; b=s078UC4nzTYNS9
	4misTH0wWDD+xBY6KReybKN0LzQTYLg9aTHKjWLP0rUmLTxPx2P/rMd/PtbknZXLMP+29ZXb++sul
	Q5RF7VQk5Dn9TJk+1GzaQuN/yT6st5g3QaKKECxvNMsuFDy3i09Hn5IjTQSe9dGnMmmMJsVWwniAa
	aLHjs2/RFRJE9PlX/7iMxINKvFz5+b5qraxTuHzzEF4u4IBRneRfQH7AGk7IRKOxGpbPAiaB7P6jv
	I8JdRN3x6/qwI6IcKIM/dJKeR39MZMg4ZTk13Hdipwz3EuUoKkVqxVt2SigleKfl/e7MGR5tTrxQA
	836iOrJ1SIyvKYXhwbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMAn-00FUyb-LT; Wed, 01 Jun 2022 11:05:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwM8b-00FU01-7A; Wed, 01 Jun 2022 11:03:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 244651F43E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654081415;
	bh=gMn+H2/HTrmAs4pmgTH2YddRCIS1nTJanRQ0x2I/SF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ow8WrVmiRTstSmMgXfyTnE7sL1r3gOuwSKcUnJBBfqAapK8uOl7BapDCSw0pzSdl5
	 X25szV0ezJxN2Z3trhZcEq6gIrZXFmdAQ7JYOaPDykjcQY6xnj7zz0ppVeIo/1MRxD
	 BKcJ7FAAZEYPUH8YHCxb9vaIgVcfUjxreZRfadWrAER0AsSOddoaZe4wLJ0h+ngGIG
	 B3xBpV8rvec28FKU+uxNjarnBvyz2zewGkZMNWqKj8sTQ0cgu8RTZ+uxT1JEbGhhrf
	 /D35VgcHRxjuVw0bDgeWDYO9AHo5psrvI5GFsMnFxp9COpKMcgfOFs5iquCLfnU0xc
	 Zmr3+j4j01kWg==
Message-ID: <fab40b87-7471-83a3-d154-aa2da0b7d23f@collabora.com>
Date: Wed, 1 Jun 2022 13:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD
 integration
Content-Language: en-US
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040341_449449_21B6A9F3 
X-CRM114-Status: GOOD (  18.21  )
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

Il 20/05/22 14:46, AngeloGioacchino Del Regno ha scritto:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series adds the necessary headers and support for the MT6331 with
> MT6332 companion PMIC in the mt6397 MFD driver, along with some basic
> devices.
> 
> Adding support to each driver in each subsystem will be done in different
> patch series as to avoid spamming uninteresting patches to maintainers.
> 
> This series depends on another series [1] named
> "MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper"
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> 

Gentle ping to not let this big effort (with drivers depending on this one) get
forgotten and wasted.

P.S.: Mark wanted to merge the regulator drivers for MT6331/6332 from another
       series that depends on this one (but compile errors due to said dependency)

P.P.S.: Lee: Reporting what Mark said (Full context in [2]):
"I'll need a pull request for the MFD bits I guess, please make sure Lee knows 
that's going to be needed."

[2]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220523154709.118663-5-angelogioacchino.delregno@collabora.com/#24876722

Thank you,
Angelo

> [1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC and keys
>    mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
> 
>   .../devicetree/bindings/mfd/mt6397.txt        |   2 +
>   drivers/mfd/mt6397-core.c                     |  47 ++
>   drivers/mfd/mt6397-irq.c                      |   9 +-
>   include/linux/mfd/mt6331/core.h               |  53 ++
>   include/linux/mfd/mt6331/registers.h          | 584 ++++++++++++++++
>   include/linux/mfd/mt6332/core.h               |  53 ++
>   include/linux/mfd/mt6332/registers.h          | 642 ++++++++++++++++++
>   include/linux/mfd/mt6397/core.h               |   2 +
>   8 files changed, 1391 insertions(+), 1 deletion(-)
>   create mode 100644 include/linux/mfd/mt6331/core.h
>   create mode 100644 include/linux/mfd/mt6331/registers.h
>   create mode 100644 include/linux/mfd/mt6332/core.h
>   create mode 100644 include/linux/mfd/mt6332/registers.h
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
