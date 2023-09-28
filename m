Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F96CCE7B17
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKvyWBCfLcvWQFD9PSKPO0IxgaofIspT2IZpCnpjNtg=; b=D28XXNdtp2ypM7PqaTIk6KAETM
	6FIVxm92Nu+vNC88YOsJbarhRPScSZ94rjXbVBYMqMgO8JNz6hNBKIf4j5hZcDQ26rRAq83MUeQdf
	2m6Udt5waZr5Tbp4OWfNfkhjjv04I6jkpvQW85PW4i98RV7YMIBvNb7s2Ja3A8dyv7MRBHuH5T0Gy
	EDZcZBxUjoYuslR1Jhh6U75rYk498ywyEP0SVPV34NDaipctSrmqNdJe7UtxdCdVKG0wSHNpX0ZM9
	BcP8G0bAij1dp1AA5rIXF5doPT/iUC7/Ck5txT0Bu+pdFXSS1UPjnz6SFnRV9shP5Jk+UdqY23Vkx
	b+QEoxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloCK-002opa-2B;
	Thu, 28 Sep 2023 10:24:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloCG-002op2-0H;
	Thu, 28 Sep 2023 10:24:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA06A6607330;
	Thu, 28 Sep 2023 11:24:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695896678;
	bh=5hCbgR+BACDhVeYZKUOi0bMLQ8NC+PJjXquJc5GRf98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ld5ACCr/B7/IiU8odH20F4Td3WX4xDZs0EwgfnDXiFT9fZtAblS9mr9bwIGislksT
	 e/pXGo5ahcuj5++F+CthhX4Jp9TmVkdI4Yqe/E4OaM5glFtKRu1LQKCDzZFANDd5pH
	 AMbx6tm2ahnklinuCOPjkmDP1FaKGHqHVvofvuV+aIIPICtu0EyqVQCxj4teY4Pthu
	 kih+i8XE9Y/9Jx5IOP960coCEZ6prEr+F5aYrA0nzyhfavnebCPP8kevL+zjW3LBez
	 1xMAm+Y8KOl1zGDGORtl+YEnmm9Y3gJMUp9LAHExSkM2FkWwoUZFA+SGgk4yf4w3Gn
	 tsa0zBvWZp2Rw==
Message-ID: <5d1669c0-64c3-8a5d-6f4e-88f72d4b40b4@collabora.com>
Date: Thu, 28 Sep 2023 12:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH v6 17/20] drm/mediatek: Support MT8188 Padding in
 display driver
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-18-shawn.sung@mediatek.com>
 <9fc58793d90b7a984dc3d40ac44719e9869b1202.camel@mediatek.com>
 <f28018229a5c0c232535da929e9d27cb7f649b7e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f28018229a5c0c232535da929e9d27cb7f649b7e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_032440_272191_BD202D4D 
X-CRM114-Status: GOOD (  17.55  )
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

Il 28/09/23 05:39, Shawn Sung (宋孝謙) ha scritto:
> Hi CK,
> 
> On Thu, 2023-09-28 at 03:05 +0000, CK Hu (胡俊光) wrote:
>> Hi, Hsiao-chien:
>>
>> On Mon, 2023-09-11 at 15:42 +0800, Hsiao Chien Sung wrote:
>>> Padding is a new display module on MT8188, it provides ability
>>> to add pixels to width and height of a layer with specified colors.
>>>
>>> Due to hardware design, Mixer in VDOSYS1 requires width of a layer
>>> to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
>>> we need Padding to deal with odd width.
>>>
>>> Please notice that even if the Padding is in bypass mode,
>>> settings in register must be cleared to 0,
>>> or undefined behaviors could happen.
>>
>> You just set padding to bypass mode and not clear settings to 0. Any
>> thing wrong?
>>
> 
> Since the deafult value of all the registers in Padding is zero, and
> we are not using Padding currently, it's fine if we just set padding to
> bypass mode witout clearing other registers.
> 
> The comment is just a reminder in case we forget it in the future.

Do *not* rely on default register values, because you don't know what booted
Linux in the first place: you shall *not* expect a clean state and you shall
*not* expect a clean boot.

Besides, what I see is that you're setting GENMASK(1, 0) without explaining
why in the code: you have to add at least the definitions for PADDING_EN and
PADDING_BYPASS.

I also don't see why you shouldn't add at least basic handling for this block,
as it looks easy enough: after all, you anyway have to make sure that the
registers are cleared - might as well just add a little more effort on top
and actually set them to meaningful values? That's ultimately your choice, but
I don't want to see any GENMASK(31,0) write even for register clearing.

Please make this driver proper.

Thanks,
Angelo

> 
> Regards,
> Hsiao Chien Sung


