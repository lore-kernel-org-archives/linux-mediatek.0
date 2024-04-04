Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD11CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p18Umpu7bShB8jZYC7bDIic76iXWEjm60AJXX9D1W88=; b=lKN+ytdo7C4HRdqYlcIC02NGP9
	xner0zNhhYfjb0LzdJ2i/H+OkPoTv2+xkLOvHautjo+x8kqZtkINH89407eoOKBafRXi4/705j2Zg
	mHNiuqo4+uywroNtdNbytXJdoXw4l6VaK8rWu3nwri6QgFISyI8uLlX8a5NVGWOhULfANwAEKuUWM
	qan4stuo2ZQ5TCwOMplclPXfTdCzt+I21EVjtVj1u9e8sv5BlmdX2C9nIBUg2jcORc8oMwPNk0TyT
	N8NXqY9kgketxROae7PTskbB88nnaHEMDtLwW2QUX30AdWQ3gOB3JBjIonY1xJjeoPHA1UkG+X0uC
	wDzvGyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIjH-00000001ttj-0VHq;
	Thu, 04 Apr 2024 08:45:51 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIj4-00000001toz-0B5X;
	Thu, 04 Apr 2024 08:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712220336;
	bh=f3ZHkHvCpCweFVRDS+9nWl67EHYJRCdqnlO132i1YnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ek1Sbvg/59Y+GNAxAeM5gP3RduwmfKbBbHJnk6mNbhplJoPLulTR4aNwxzm1kiasU
	 YgrayKHq3IxJq4sSguxXkwXDtofmww4VvRe1GhggK754mTR/qXkmlrHr84fXbuEQyV
	 ZUmi4h55358SEK1UKIjoLIAAU8sP/gThIAJgx1l6ZRlB1o3W5D+/tr/vlHltbMdKb/
	 fUL/mDY0Jgr1DmIoiiRnpGqHldzv6LRtekiApFRhrV6YCFs1I8Csv8MZ+hdlpQfClV
	 Hx22YPyijzSo6s7KukpUwXgKgnAIHvGzWRxZM607wV7aq4mELbiyPnAmIAjokHBKEJ
	 0sLuYQ1F3OK7w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D26823780029;
	Thu,  4 Apr 2024 08:45:35 +0000 (UTC)
Message-ID: <ae872ee7-3709-45ce-b240-c35a59427041@collabora.com>
Date: Thu, 4 Apr 2024 10:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: mediatek: paris: More pin config cleanups
To: Linus Walleij <linus.walleij@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327091336.3434141-1-wenst@chromium.org>
 <CACRpkdYi=3ZYVQGAAwJ5iYNX-WY1OPTX_xuP3H-xJj9Q+b+RRw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdYi=3ZYVQGAAwJ5iYNX-WY1OPTX_xuP3H-xJj9Q+b+RRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_014543_675510_5A20D1A7 
X-CRM114-Status: GOOD (  13.23  )
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

Il 04/04/24 10:23, Linus Walleij ha scritto:
> On Wed, Mar 27, 2024 at 10:13 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> 
>> Here are a couple more pin config cleanups for the MediaTek paris
>> pinctrl driver library.
>>
>> Patch 1 fixes readback of PIN_CONFIG_INPUT_SCHMITT_ENABLE. The function
>> was passing back the disabled state incorrectly.
>>
>> Patch 2 reworks support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE, following
>> discussions on the bcm2835/bcm2711 pinctrl drivers [1]. The driver is
>> made to follow the definitions of each option as described in the DT
>> bindings and pinctrl core.
>>
>> Please have a look and merge if possible.
> 
> Patches applied for fixes, it looks like pretty urgent stuff, yet no feedback
> from maintainers for a week so I applied it.
> 
> Yours,
> Linus Walleij

Yeah - sorry about that, but this one went out of my radar for whatever
reason....
Just had a look at it and - even if it's too late - I can give my approval.

Please feel free to ping me if this happens again: when done for a good reason,
pings are helpful and appreciated on my side, no worries!

Btw, Linus, thanks for swiftly applying this as - yes - those are good and
high priority fixes.


*Anyway* - whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

