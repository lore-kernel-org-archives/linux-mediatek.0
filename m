Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE1BC54E66
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y2WCRg38vZjx+jg3Hy0I1hvQc4HDSJn/8wv1tgeMPA=; b=ODpWzX6PWG8AxJw1O/KWP1Tspt
	0IlOIrRyazv4o8y7gmwHXzLJMwvdqYc7Mal/XsgDVcp20hadkpjtfcdcSF1DGZ5X7fEHgE2tyhEwy
	+iMC8hUkqvSW/6Gxwphd5TqjNTZsQ3Q4UF2oROUFiS2Ylb1kNSd8/ICUMpKXSCwyJs1GKBPzzpVcN
	KgSCp3QF9nGCL11XUcLKd+OLyBD/4+O2Sh04+4RbuPZ4CvJ4JtUmL0pDyvF5D5+R/IqTAISYzM8b0
	Y5+beiz55d7vvVlX1UAB3gcnzB//v1j0GCmHxkzSBBa19Rnpi8zzk9pBY2ESLK3dzfN4KBXZEETsZ
	tcx4eDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxec-00000004v22-0AAR;
	Tue, 12 Mar 2024 08:38:34 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxeX-00000004v0U-1EIX;
	Tue, 12 Mar 2024 08:38:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D340FE0005;
	Tue, 12 Mar 2024 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710232706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+y2WCRg38vZjx+jg3Hy0I1hvQc4HDSJn/8wv1tgeMPA=;
	b=da+a25s08RVCs6ZnhisGvFDQsAwIINFRgmU2YyAgUGEky+9XVBVrD8SXHePUa0Q8LMJbTa
	27ZdBhTElzHzH9F5CbB+v4OmAbnfa2YlAi4lImVz97hgEZw2TRD7HyIEZCYtiPzGIHX/Zl
	frEVAuK40PeKHO7E5Y6LGUeeHnCJ+vPQyqq2RPrQJ53r4X0NEBjizcv30H3tw+yhtr9Zkb
	/R+MqMyHc28Xk0cX4q8rcczB4edWo26nmLsuldu7mhTxj9iqwMswUdHVGRyc2UjCLKH89d
	bu7Khks1iQYqWt/rY7J1ZDc1QB0BajOi/4dJiJfmZ4sni/4oKI9MLHSf3ml3cQ==
Message-ID: <7780460c-abc3-4009-9f95-28d123a9a23d@arinc9.com>
Date: Tue, 12 Mar 2024 11:38:08 +0300
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
X-CRM114-CacheID: sfid-20240312_013829_789031_BEB5377A 
X-CRM114-Status: GOOD (  13.69  )
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

I am once again calling for this patch to be reverted on the net-next tree
on the basis of:

- This patch did not go through a proper reviewing process. There are
   proposed changes on the code it changes regarding the scope and the
   method of the patch, and improvements to be made on the patch log.

- This patch should be backported to stable releases, therefore it
   shouldn't be on the net-next tree and should be submitted to the net tree
   instead.

Arınç

