Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEC9C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxzYJd/EP7g30oWAciIo1/h/hEunZ0h/eCegeHvl1J8=; b=c1dP1MYTf8L8OZrUy+o0SqZWBB
	TjLnSegtQchYFyCAP1KumzanEtXjMkSrOl0BQNCyr+DxeLQ522qeAYTwCgAZyakX4lxjB9K+X9JFb
	ZU4LQJTjod6cA8ew44HnV/fqx0B0NP3NCY8BhAcyL+PORLi/2/IyQLbDEnywjabs3Ntb9eqp+76bc
	Qs8HZQRLrnvE+WpD82Pkz8t8FfrtzngXJOzQD3SddhZPXlnr7kRBwKZ/UrhsADGoLrh2wSCluT/Xl
	Qqcoms5cbpLB+9ZRmO954HBqJKRtIdT69ONrSvV+HJbYIYWISpeGnRrPukAuvymexC6Ywp1+MKb6K
	WpSw3slA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcM2c-0000000DsJS-0SwG;
	Tue, 20 Feb 2024 09:03:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcM2Y-0000000DsHK-3S9g;
	Tue, 20 Feb 2024 09:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708419829;
	bh=CbuUipgN3x0OtOMVl+Qzmre0d9c7fvRwbaMamF0Y22E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tK+lxaPHpL7Vvwdd6Xf18pxAWv5XkHGIMP3RkL6KD+TeHZ5FIMEkzraxOQLUuoIkM
	 fWdG3WYWYMw14SmZ4Wv1aoFkmKet4y7tM8zGjhEiZh6js3OmX0R6TwYpRw6jjpvviU
	 vyMC07vHIuIWiilcF0ivZDeSX/5nr6K1Hl6avCjdhA820/jeIQQ8SztJFDLJmMqih1
	 txaXfunCOYKFdUDxLWxQi/epLwy5R3zSlVAT79U0VMvAujSblcfVy/YgTXBj3RKp6Y
	 Ueya6oQxkly9T4xCm5Uemwj3JM2MFqWnRUz8xxG92UP/n84GZjIzudkzJBEZcnCN0H
	 zQxc2jIivH42Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D592F37813DF;
	Tue, 20 Feb 2024 09:03:48 +0000 (UTC)
Message-ID: <ab809d89-339a-44fc-8a5a-ac667d220ce1@collabora.com>
Date: Tue, 20 Feb 2024 10:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 William-tw Lin <william-tw.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
 <CAGXv+5EKCrvsvZwc2zYiMWAeT9vqvU0JnDrz=WBoebBBbcgp0g@mail.gmail.com>
 <f1fc67d4-f979-4c3e-988f-a803b7b11c46@collabora.com>
 <CAGXv+5Gxc3OP8nE681C6YQbDMUNmFDf21BfSvJZPBFgoncve=A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gxc3OP8nE681C6YQbDMUNmFDf21BfSvJZPBFgoncve=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_010351_009272_67B17CFC 
X-CRM114-Status: GOOD (  15.46  )
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

Il 20/02/24 10:03, Chen-Yu Tsai ha scritto:
> On Tue, Feb 20, 2024 at 4:56 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 20/02/24 07:40, Chen-Yu Tsai ha scritto:
>>> On Thu, Feb 8, 2024 at 1:43 AM Daniel Golle <daniel@makrotopia.org> wrote:
>>>>
>>>> The mtk-socinfo driver uses symbols 'soc_device_register' and
>>>> 'soc_device_unregister' which are part of the bus driver for
>>>> System-on-Chip devices.
>>>>
>>>> Select SOC_BUS to make sure that driver is built and the symbols are
>>>> available.
>>>>
>>>> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>> Angelo, I believe this should be picked up for -next?
>>>
>>
>> I'll pick this up for fixes, as I've already sent the PRs for v6.9.
> 
> The socinfo driver is in -next, so I guess you could pick it up as a fix
> for v6.9.
> 

Of course! :-)

Cheers,
Angelo

> ChenYu
> 
>>> Also, mediatek/v6.8-next/soc is missing from mediatek/for-next in today's
>>> linux-next.
>>>
>>
>> Fixing immediately.
>>
>>>> ---
>>>>    drivers/soc/mediatek/Kconfig | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>>>> index 50c664b65f4d4..1b7afb19ccd63 100644
>>>> --- a/drivers/soc/mediatek/Kconfig
>>>> +++ b/drivers/soc/mediatek/Kconfig
>>>> @@ -72,6 +72,7 @@ config MTK_SOCINFO
>>>>           tristate "MediaTek SoC Information"
>>>>           default y
>>>>           depends on NVMEM_MTK_EFUSE
>>>> +       select SOC_BUS
>>>>           help
>>>>             The MediaTek SoC Information (mtk-socinfo) driver provides
>>>>             information about the SoC to the userspace including the
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>
>>



