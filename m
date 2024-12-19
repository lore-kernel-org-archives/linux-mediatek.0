Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EA5E77184
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2024 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ewgxwKN5bjrPvOXXMeap3Nu1zGQbLpOfspH+RZUYFQ=; b=S7yCBt1z6o/Ll6DruYFyRLAfNt
	RtLvaew8fP4eZ45imwSekDNxUJDWcTB/u6Qm8L5aYoZXMITouxn2TfTAi1mchXEjeflxp6k5d44ZD
	fkXs6LAAc14as+79C3NZkCpcd1Ht+TTzDJdxpKoKsYkl6LBVHLFTdZ0FXof9pQAZH27dHOaBHDHrl
	smS+w4rx5/ZhoErlEVbc+1AR0ZbUXv3v2A7IZTm413XVOep/tUXV/+HgMghogwfzSLECw45mwKzaq
	soK/jvZm7BV4zlCaU3SxVR+qSO503o0lBVuYA0eqrakhqw+wW/MAZZVNRPBYYOveWoWBfLBtpzKGf
	THnWh2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFtF-00000001qrB-3CRm;
	Thu, 19 Dec 2024 12:44:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFoS-00000001pjQ-2AYy;
	Thu, 19 Dec 2024 12:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734611970;
	bh=JBbxi0NMjonpSOIyVcV/rl7gTbxBOiQzkChufoJ5ZBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WKbxcCJgKiajWnA36UXvtSMl9jfb5ty6rC+Bi5z2XAlvn5XrMRJ83OzOlIC51Wphe
	 cVv0cYmE8UpmhS5nNSHbueE0KxL910TLdrU9NxbD+LdOscewpVJLD/tBFj038LnbV4
	 j+DfLQKFLVzocRHyThj8GCBr+bjOsieuxQitblkRfbo13qb5W9Bh2IlyIEnZOZUnUE
	 oePYH4d8fwTOd6a3obTgbD9RAYuM9GlVTrPG8ERcEB11S2DuiHOc9PNV+26sxZZzZL
	 j6djALZ5XdbSzsDgPj+UWdnQvkSWYr5O104ACeRoXt9WVXkqQzDclp+IJ4oRwpwFNc
	 ruDQ1PjnaWLDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C63B17E36AF;
	Thu, 19 Dec 2024 13:39:30 +0100 (CET)
Message-ID: <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
Date: Thu, 19 Dec 2024 13:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: Linus Walleij <linus.walleij@linaro.org>,
 chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043932_730093_44C79DDC 
X-CRM114-Status: GOOD (  10.29  )
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

Il 17/12/24 14:45, Linus Walleij ha scritto:
> Hi Chang,
> 
> thanks for your patch!
> 
> On Tue, Dec 3, 2024 at 2:13 PM chang hao <ot_chhao.chang@mediatek.com> wrote:
> 
>> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>>
>> Change 1: change EINT from 1 address to 5 addresses,
>> Eint number is stored on each base.
>> Change 2: Compatible with 1 address design
>>
>> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> 
> This patch looks good to me, as preparation for mt8196,
> but can one of the Mediatek experts please
> review it? If nothing happens I will just apply it I guess...
> 

Linus, that's something like the fourth time that he pushes variations of this
patch which do break all MediaTek SoCs in a way or another, leaving only MT8196
hopefully-functional.

NACK.

Cheers,
Angelo



