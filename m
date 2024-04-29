Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EA8C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kpOLjd1RsRGoMgjZcS9EsszKwG0ZQhgAo+c26was84=; b=1Xtc7zMcUknsn6QaVw7odV96Pi
	94VTx4ar0QA2p5oF84NOtDL2DZZdCTkvMwTnDmXGCcvS7+wkjGyleLfjqLU7iqD9OrB932DRcYnOM
	q2InjpoHg6+oI7v/jdgHh/s1AswKGsiMa7lwN2sWn/73KOesfKPHSMnildQ0nsiHlA3M2Atv9s/TK
	rZi0P1EUy367U5p7PKI3p7N5ekt73Xh7B7YRYL5oUaC/HtE1LBBglNYB0QAlJcQukGyS2GikQ25ri
	quOo2GNTPejF5moAdld5Cph+U9TtxfHtpOn99qLo0a0vYy23Ufol8Gx/7yc7XZnTPbbeQlJuqz9F0
	pRWvT+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Vmx-00000003sOo-4AR7;
	Mon, 29 Apr 2024 18:31:43 +0000
Received: from msa-209.smtpout.orange.fr ([193.252.23.209] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Vmu-00000003sNx-1TEi;
	Mon, 29 Apr 2024 18:31:42 +0000
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 1VmksUnBSiGtU1VmlsQI2r; Mon, 29 Apr 2024 20:31:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714415492;
	bh=2kpOLjd1RsRGoMgjZcS9EsszKwG0ZQhgAo+c26was84=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=amzwYIlzPbcKaAQJXOdD545sUIppqdGaR/8v1JITt97n7KazHFyAzCgHaFyuN7LWe
	 iOxrYE7qhUuW20IWvMWtioSxORH+y48F7Q3yy2cc5F8Ql6FpEHY36vMboQ7ufkO/3L
	 y5wn2hGZUXQFKtjaxzi9v+1LQWJ0BJMiS4rtAlQV0lV+PtY2Y2gC2albLo0NqR9qTL
	 a7xYq7aH5nQyi17j1wkrFAaJM6Ji3qPAjctofHLJqOOn5Nv78NuwmeoEpzOTULElV4
	 lWsBbCy/xzDvcn0ZjBZdOpSXbi3nLsrYiyD4aSiW9unMNxET/z90DHbWfn96WEgGvk
	 IZJdstbFJyloQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 Apr 2024 20:31:32 +0200
X-ME-IP: 86.243.17.157
Message-ID: <d526b169-0385-4f23-8806-17bc73c2507b@wanadoo.fr>
Date: Mon, 29 Apr 2024 20:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6370: Remove an unused field in struct
 mt6370_priv
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <e389be5e1012dc05fc2641123883ca3b0747525a.1714328839.git.christophe.jaillet@wanadoo.fr>
 <16df315e-8a05-49a4-ac07-d1ed150c9317@collabora.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <16df315e-8a05-49a4-ac07-d1ed150c9317@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_113140_823966_114AFDDA 
X-CRM114-Status: UNSURE (   9.04  )
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

Le 29/04/2024 à 10:13, AngeloGioacchino Del Regno a écrit :
> Il 28/04/24 20:27, Christophe JAILLET ha scritto:
>> In "struct mt6370_priv", the 'reg_cfgs' field is unused.
>>
>> Moreover the "struct reg_cfg" is defined nowhere. Neither in this 
>> file, nor
>> in a global .h file, so it is completely pointless.
>>
>> Remove it.
> 
> Sure
> 
>>
>> Found with cppcheck, unusedStructMember.
>>
>> So, remove it.
> 
> Again?! :-P

Yes. This way we safe twice the memory space :).

> 
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> 
> Anyway, this commit misses a Fixes tag; please add the relevant one, 
> after which,

Will do, but this patch does not fix anything.
It is just a clean-up.

CJ

> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>


