Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CCCCF9E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYyWLPZgUgbDlCwCcVzoM4HMRueVlb0JIketVHAX4OY=; b=xr3/DNU621qv+IkGiaTQTYpPWb
	greRy4PhIDMRQwXDk6Jz3AUCnoXHVhflLJvsRGCZXMjcXaR3QlwdYUFtILpwtHAbDBLvcmZTNeDxt
	HC6JKx7S3hg0iWNxAyjjd2sZNIR9oG4iLeK1exJjCPpfCOQRHNqHtLY5zXq0LibohaB2V+qI0VYHJ
	e8CSbywx/GlhXS3fQzejD14beWqVTkwuTLGuoAP9B517XVWzKM9UVGP6ATw83yyFu0C/hOmP0kyZW
	04L+SDjrp8NMkRCQ3DJnuwSc4E9VYT8CxnSk9dVbK4LD355AThj0qwOxOuEkfPtOWSVJfWksy50yB
	W3km9dHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfKl-0000000FZPi-24Zn;
	Tue, 28 Oct 2025 08:45:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfKi-0000000FZOs-2NaX;
	Tue, 28 Oct 2025 08:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761641133;
	bh=AzfMJnxDlLOurBkOwjsFhj7GPFZLhxcijnAWsYYiWpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X0nD8Ef80li5RM/i0fesne7rsefbId77wgY5dQqPZ/+p46Npgi57Ixd6Clyo7K2En
	 w+WmhFsu8DfyMvJLLF0/CYBB2aHJGFT7o1tpkjytMnM+rEGd/EiS0pd7gH01iUwkjv
	 cKAjWSdV3D7EUoM8L83giRV2z4BxkTCeCxfMGOBU7jZ6YDL4d3Vq+YSU2molrl250P
	 Jrxgx608OPhy4RzzFhSiSQedfHWcqDSH9xkZUoxaM+DZ6GrB92cPEvvLezPZRfphOM
	 KHdPeOmFbZflKFvYSe4CpHUzQrV26EWCq+Pw1al9OBUwAo0dU6sx14lbpD7NVdwXYa
	 +d+5i9L2Oxwwg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F070F17E126B;
	Tue, 28 Oct 2025 09:45:32 +0100 (CET)
Message-ID: <39602d94-7f2e-42b1-a77e-1d5a3e032277@collabora.com>
Date: Tue, 28 Oct 2025 09:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: mediatek: mt7988a: Add label for
 ssusb0
To: frank-w@public-files.de, Krzysztof Kozlowski <krzk@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251027132817.212534-1-linux@fw-web.de>
 <20251027132817.212534-4-linux@fw-web.de>
 <35504988-448e-4a5c-8ea6-769c06117c01@kernel.org>
 <F6FAB95A-9FF2-416C-B50A-C2B1808FC5FF@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <F6FAB95A-9FF2-416C-B50A-C2B1808FC5FF@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_014536_770033_D756A083 
X-CRM114-Status: GOOD (  11.56  )
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

Il 27/10/25 20:04, Frank Wunderlich ha scritto:
> Am 27. Oktober 2025 19:58:23 MEZ schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>> On 27/10/2025 14:28, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add label for ssusb0 node which is used for BPI-R4-Pro.
>>
>> This makes no sense on its own. We do not add labels because they have 0
>> impact.
>>
>> Please drop or squash.
> 
> Thank you for the review.
> 
> I reference this label in part 4 and tried to separate
> changes in soc dtsi and board layer.
> But of course i can squash this to part 4.
> 
>> Best regards,
>> Krzysztof
> 
> 
> regards Frank

Yes, please squash this to the patch where you actually use the label.

Cheers,
Angelo

