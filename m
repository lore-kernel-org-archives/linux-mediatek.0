Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyOACkmpqd35DtSD43A5malVFs6NwEhSJUyNtUP59tY=; b=MJh6AeFX8xMoNv
	u82JlZpfMbsHDas1uohQQ3KInC7cAO3ynpnUaDlFyInm0kpgPZIp1y0dtHndZMpqhMDo4P2WAZXap
	Wi9wIVfWJdOkaqc68H7X7mVBuMom1cRdt9a7k0TWEVknQqq22QA8pF3o2KIu96pEH16BCCmoQEm3Z
	LTwe8PUMZwoQVG72f4+KO8ElF7S5tV5ml42lEoiWQ92RMMvw+9fyKmHv/5b9Xk9JTljqESM3jlkFj
	8x4SHUv9vjg8s/kFDlendQlGy4kKnkL6vMJGd6eqg1HIDplDSfRBW0q2+2Fb4bzw3cFnjKFs8WddJ
	XJ2xnjCcurmMEY6JjKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqses-00CUF9-Pr; Tue, 17 May 2022 08:34:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqseh-00CUB9-Rq; Tue, 17 May 2022 08:34:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2B88F1F41ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652776448;
 bh=LCe72gf7Q6QuyRU8/hNAkV44/40CUOPrEMqg9amSQ6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mWuOx6AFAnuY4LuC4el83eJaIr8+U3BZJlHbPUYkQtJljV6YtNFTt7BsfuUSe0+Be
 Kkt1sSbONVTRTrxKUd3jMN1iqIOJ7woU8CjO16EYzUO4NPpj5Sq9lW2srgPc27jPUM
 D+jR1YYzKTzx8Zz4tr+OuxurKqpxGJdEhi4gzziD+eKoRCMRHXJxK2rvyUx1hAxThA
 pJlf75oPSboAcQlnABY1MKvccRmjm2CogQqQW9bqiUmw2HwzHWltElzn17Pf9oh5hD
 KCJ1+roGMSkFEiwkxb87NuoGWHbfsaMMKlrs3CCswLO9CealVlEVy1DMqNeAJbCb3R
 Pi/bAk0pq/VYA==
Message-ID: <ca40156f-5bc1-ef3a-517e-6ad61e9bf3df@collabora.com>
Date: Tue, 17 May 2022 10:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220505083757.11288-1-angelogioacchino.delregno@collabora.com>
 <20220505083757.11288-2-angelogioacchino.delregno@collabora.com>
 <20220517000657.GA3609297-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220517000657.GA3609297-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_013412_078152_EC3FEFE7 
X-CRM114-Status: GOOD (  12.50  )
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

Il 17/05/22 02:06, Rob Herring ha scritto:
> On Thu, May 05, 2022 at 10:37:56AM +0200, AngeloGioacchino Del Regno wrote:
>> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>>   include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>>   2 files changed, 1132 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>>   create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
>>

..snip..

>> diff --git a/include/dt-bindings/pinctrl/mt6795-pinfunc.h b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
>> new file mode 100644
>> index 000000000000..4888bb7fb9cf
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
>> @@ -0,0 +1,908 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Dual license please.
> 

Whoooops!

Sorry, my intention was to indeed put (GPL-2.0-only OR BSD-3-Clause) here,
like I've done for the others.
I'm sending a v4 with the right license right away.

Thanks for making me notice this unintentional mistake.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
