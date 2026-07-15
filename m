Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E553C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/u2TwMdyZJXSdkDNLccl9+Doreu0rUkfQD81CavD5s=; b=WjJwYYTQaZ3FYrpd23cZOF407q
	np0gOiwT/ix0FmEyY0XJgTdXkSyHlV9v2bzuibLRg6XGis9IgyIKbJXJd8oDiMlv8dxgT0aAtH+1L
	0n7+/GHzllNVIyJjVLb5+2QznDAQN8xiW2s5mUgOgwXuY0JCz9JEtWHR+0xO1SAJsDBlaQIY0LMN6
	cGXbR+YgOvGEYRSRhobE58eoJJ3/iitQFdExJggnmkHwrX5KrJ+FRmNS5jPgd0Jyg1g4Z6Sl6xaYW
	dddyz4jfuzGbS9WnvLUAZGkC1SwvvaToXf1kRejyH/ZaFgG04vWwTvpyH09NtWTk8w5XHYCq4L5XC
	Q2LiEl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzZk-0000000EvvW-2bOj;
	Wed, 15 Jul 2026 13:23:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzZi-0000000Evus-39Ad;
	Wed, 15 Jul 2026 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784121775;
	bh=QGeId7QbdbyNXJlEshfDBfuKlWj13X9gty+DTIBYyvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H6sfsOHecJOH1qsCOye4YBEyzTcwh0L+dnI/SsZoHhKtYrJcrTJvMVy1ET70Y/DWP
	 qlAt9R+2VVZIvw4YHYNiiqENRoWbE84Xi8lcEhXkGbnbU6vQX2kUIo/e2CraO6A1B3
	 EBsB8y9oz5w7ARv1K5el3B3bzW9OZb5SBxduzX+5lRwOviqW79hwkODFDMxocj9Pdq
	 hz88MH+4wr838XBLGZIf79xADM0ifFRYjNrI3mL7uj/in9eLtd7Po8fcpSOGoR0gSN
	 SgNxlqFBOG/h1nU9PeH5AFSKDfgeKW+jCNzHHJbemHYXv6glJHFkod+YPR4PnWZGdW
	 LMUEEOh9m681A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 854B717E07AA;
	Wed, 15 Jul 2026 15:22:55 +0200 (CEST)
Message-ID: <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
Date: Wed, 15 Jul 2026 15:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: add mt6572 support
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
 <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062258_945159_680DE3CE 
X-CRM114-Status: UNSURE (   8.84  )
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

On 7/15/26 14:26, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add mt6572 registers and platform data for the pmic wrapper.
> 
> While vendor kernel source code suggests that mt6572 can be paired with
> the mt6320 PMIC, no such devices have been found yet. Hence, registers
> that not included in the mt2701 array are omitted.
> 
> The mt2701 SoC-specific initialization function is used because they
> share the same GPS_INTF settings.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


