Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06D8C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKO8ZtWOWbwntppeA2CDijBgfSjnDhZy4cLPpMxEYrs=; b=Qa2coiDQ61GtoQKsxn7mfDGV94
	CKjxGdYDEkZ+/DBxVSUwKQsty5WEw84NT5G+HAsJCe/Zq8aBOerympqk4VzPSf89xphJpPempHCGm
	cLIQspJtP/mEdaoE7COeVtXhDGxctNU7P/zsV0no6XxBurCrkjkSABMYWFzPeW1jwn/GZ4ACxstUv
	3pc2bP3Bdyjs3y3YQoXsRzQxGQr4vD988Fd2JVCydbf/UCKvSxXOtIU94hE9IZwooqUlYg5mNQw+s
	NnLHFGR7v9g7pdYgcX5mEmj0RkPCOeoCNCdXBDNMtxiA+wqNX6S4/+v1qRf15UF0f71I85ueig2+R
	rvMqIF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjn76-00000003FKO-2Oqw;
	Mon, 11 Mar 2024 21:23:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjn6z-00000003FGz-3gTw;
	Mon, 11 Mar 2024 21:23:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB21D20008;
	Mon, 11 Mar 2024 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710192184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKO8ZtWOWbwntppeA2CDijBgfSjnDhZy4cLPpMxEYrs=;
	b=J4/dEabMkyo+qERCackQvl3zu9+iaZGjQ9G+f5UfKMJnShcljwm8wV6yk1AcDnALEPuxUM
	INdp1oAEuRHChMGb/JsP5vqwuCXArV9quhuyBdz9c0YYnd741UxSz+EbN+/PJwZpV03lFv
	/GTXP9KEumnSSizvNKuoNJlnMj+kutrSg+7a63jb2QtORqWO9iKXRwPtFrnpgds9sSR2Rq
	2NSsa9Exm1PVhzo5y/iRj8XUr4gEZlbebCT5YVm8sAsDsWeDhyhHsteIPxhlVuuKMIfdCz
	/k2g3CsEF6CqMQNSuuLNFqir6ZzMTw1jYgOZ2YXKly9dx3hKXWW2R9qB4LU3Hg==
Message-ID: <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
Date: Tue, 12 Mar 2024 00:22:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
To: patchwork-bot+netdevbpf@kernel.org,
 Justin Swartz <justin.swartz@risingedge.co.za>
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_142310_099582_116905E9 
X-CRM114-Status: GOOD (  10.30  )
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

Why was this applied? I already explained it did not achieve anything.

Arınç

On 12.03.2024 00:10, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This patch was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Tue,  5 Mar 2024 06:39:51 +0200 you wrote:
>> Disable LEDs just before resetting the MT7530 to avoid
>> situations where the ESW_P4_LED_0 and ESW_P3_LED_0 pin
>> states may cause an unintended external crystal frequency
>> to be selected.
>>
>> The HT_XTAL_FSEL (External Crystal Frequency Selection)
>> field of HWTRAP (the Hardware Trap register) stores a
>> 2-bit value that represents the state of the ESW_P4_LED_0
>> and ESW_P4_LED_0 pins (seemingly) sampled just after the
>> MT7530 has been reset, as:
>>
>> [...]
> 
> Here is the summary with links:
>    - net: dsa: mt7530: disable LEDs before reset
>      https://git.kernel.org/netdev/net-next/c/2920dd92b980
> 
> You are awesome, thank you!

