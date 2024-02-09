Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365B3C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqQ/Q3+M8Wzmz5lQdic6HBxBKGEJSivtFgBizIKNhsw=; b=wyUeSEY4ZH9r7VvfwnsF1HchcP
	k2oUGSzSUDl8cSUgfVQPXyIzV3CYWVV7PXmIsM5IbZcu0ZYkzT8r6qgrBS/1cnNuoqSztRgSTQ5D/
	AZjotQFMYj5xmP6YPxVMlLRj1o0JegwcPvH1NQLxs89spAqWYVWDIJnC+0yoqXdg4SftEXPZnGCMT
	FuyEucP6lpnqv5w5JuG4B/3z44tYlYeJseCQYkdVRqwSgLm9M10/k0qNvcSZ82pcKZjqzBX1i04rg
	o6cPPvX38tBNZ9tkL/whK645XXIFJc2pRmYi3iiHcj+Gj3ImTllNHR87gfkj/coRnN4y7crcV0aMC
	00rDDq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdF-0000000GVDh-2zdV;
	Fri, 09 Feb 2024 08:53:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdC-0000000GVCn-0JPK;
	Fri, 09 Feb 2024 08:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707468787;
	bh=SCFizRO1mkhWZ9UsKwKydQaTwmYcQyyC5mBYpD3gCl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KLC64FXNcnXhqbqrahhj6777lmtbhvlfuM4/EKSP6B82iRqUiIQUeiQPP+pPa8STa
	 GxqhhyMKeoxxPAc45FVZsRlqrT1Y7S+W/YsbxJf6GN7E+4c95jIog0Js8Ath1Lhsab
	 cDUMblADW+ABZgm9xawK8jEGaBVhRqZmk/Zm89bqB35oKMrqKE5TsYGjQ7A3QcHtQx
	 jJR2d8kp0gVslhKCnILaBUsz0D5TDCkyMveeerAURziLY/ietnD6NqB2clQX/QYEi1
	 h5tVm7IrsiYr+WG5A4ddgmnVO7u27Rix4vCfDQwRA74oSyXASYdotOT/mNvTX1PNpU
	 80hTWErraMQ3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1628B37809D0;
	Fri,  9 Feb 2024 08:53:07 +0000 (UTC)
Message-ID: <258f93ce-c927-451f-b9f0-7170c140eccb@collabora.com>
Date: Fri, 9 Feb 2024 09:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] dt-bindings: arm: mediatek: convert SSUSBSYS to
 the json-schema clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-4-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240208215926.10085-4-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_005310_260799_EF809662 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 08/02/24 22:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Dropped "syscon" as it was incorrectly used
> 3. Adjusted nodename, "compatible" and "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



