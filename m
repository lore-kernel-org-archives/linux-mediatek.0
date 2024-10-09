Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B5CED60E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtZX1vZUBgjO4+SGVzMvXWL65ePGhiBpJhklPmYBB5o=; b=ulDe4ym26ADPKKLucG01j70eXE
	8SvhpQBRgkeNMPvZ68HdENzTxIInLOpQENtTT4oK9kTQL9w5QkrbhRuqVhhacswNpKv783S/lzNLD
	fnhd/7mXmCOMyJzRHtr09hh7uBfVgNaPt6fUufg+uldhBn83LUWl5gOrFN9uWhMPmRHbgy4MeYbze
	adqJHZf2NtXPhcAx1XMi6tdJnqZIieRcWRGcXM5OLPtck1JlSg/9uiftQZpjrP9bxhw9L0LqBRTnl
	EWZZP1Lst9Ut7Bqrjcj44civ+y1cGJIzllU3A/Z1o77oEMmIKyswRy9VTC0/O0n0gqGziWCfaqXFd
	ZV4zpzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syPyA-000000083r3-2eIm;
	Wed, 09 Oct 2024 06:14:46 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syPx6-000000083hT-2Z8j;
	Wed, 09 Oct 2024 06:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728454406; x=1729059206; i=markus.elfring@web.de;
	bh=ZtZX1vZUBgjO4+SGVzMvXWL65ePGhiBpJhklPmYBB5o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a7uOQysBHV+g/x6T60El/CKr7ua4nO0qIGclYPxH+fWegBsTwDb2zUnHSBy8ne6N
	 TS4+mi909WpXAiNJIdQVws3DzDYDWx+FyBboCTob/i9YUPZ4ULxP9opdmGMsB3ArZ
	 hJ9nhXQBmyOMKHQ9HCEVziuIhPp/5I9DMkG+z/kQvYglWIQ36L49o4soXfyOV7Kmh
	 2/of9NQebSB1H0kmiFBZyhUtwXYGhDblid9zJlFvDzDimG7mSOR0h7uKnOTqb0wlo
	 HXhXxYfOwXZIZvyTVK44HVg9JiUMv78PdYQjAQoC8rUqPyYZ3rm3B7CfxH8i8rzxT
	 JohGy4dJzpktBT4QNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MumNL-1tp8vW45z9-00sMd7; Wed, 09
 Oct 2024 08:13:26 +0200
Message-ID: <e1a3cb30-1ccc-4a1d-bfaf-2767b5d08042@web.de>
Date: Wed, 9 Oct 2024 08:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v10 4/5] drm/mediatek: ovl: Add blend_modes to driver data
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>
References: <20241008064716.14670-5-jason-jh.lin@mediatek.com>
 <0116377a-cbf1-45d7-b961-4ef0198ad8d7@web.de>
 <09159834fb362b2e6b3aaee70b4321c07d37601c.camel@mediatek.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <09159834fb362b2e6b3aaee70b4321c07d37601c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JGQJDOCJHmYZ3e9104Aphwc/tkO+tdF8wud/mdYUCpghL4nZqsN
 yh7znJJ4Iq2H2HacvgcmMPTwFGs638OggnRD+0ENRLdw07OkUVloOMRpE8YhMtwnQtzYdKZ
 knFku9GC8MZ1bkpytqdqI8z9jJmQWJP5jc87L6LmvHxEPDXq8ixdEW35DDdRMxj2VxFnzYc
 5GgxCjIvGPNalJAhI5RRQ==
UI-OutboundReport: notjunk:1;M01:P0:Dd2/EnH01Ks=;ObEDTRZtRsotfhbuK8a4VemregX
 nfts+kNKlwym840SOGVxshtbSaX/R7raL4W8jCA7ccQHk3tSzawApdM6ZC7FuT7iQ9LNlJt0X
 YyCJkKu8N7uN/q3FpDenZniQWCAv1X8uFuTan8kWsWgMXodhHmTFVoRYy0As4/eWIMJJfbD1a
 WqH6Cs4wfk4nZtiH+vG7+ZRMnM9x1l/AYkDHRw+FWy6TK6EHSAvGx39WOZpiMmbIwQ7oLwBIM
 ANJe1wMpsUK8WuvdMBeUR8Ef/HUBoasTtexIxaypbPcK1vu28Sgqs9MCPOxsJ7r0qsHOqEKBf
 LCmTgNXj2wiHFc8460zjMvR9hfO69L6QGxaHLsGPfEaaIPIJepPb2YOVx+vX16ilFa/gCnHTC
 SKVaVfc11F9tEEJWZX1XHZGqg5atggKwgeiQXhUZAmOjjOKvbLZlrdafeVj0ZsIUlf2C7eEB5
 xKtma4ve4UmItQLxs4aSdAY2+XUdLYgNiRMZbadqIUioFiH513WMsRKhnXWGy/RokcpSdajfc
 yUgh5W+iboJzhDMKwItdoaYh7CJNZEBpMStZyw5MyZmA9U4RXlR0FNIfx+7tDUG4jT1x6hb91
 Ds/55NFicx+895Sjngt7xW3sv7PTFZXDjUuMhNveFoWTgygmDIqaF5sHm0OLMzC1IoPruziLK
 k98h8/kJ4+qVyTI6slKisCBnCYgtG1y9rNaBl1rkWj+IkeBWX8Qhc/xDL6gKWPLuu7jHLCEuF
 eYHuJub8tqc9Pox9UwsoEysdM904LI77h8JmXgjLfld2J8zmAygZTwsXo6FdRT0i4+xbxzZk8
 sumxlD5dBBTFcUvdUKrUWh+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_231340_958001_5A2A2E4F 
X-CRM114-Status: UNSURE (   7.68  )
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

>>  =E2=80=A6
>>> pre-multiplied is supported in the current platform.
>> =E2=80=A6
>>
>>                 format would be?
=E2=80=A6
> blend_modes is the driver data that describes the supported blend mode
> in current platform no matter format would be any one.
>
> This sentence is describing mtk_ovl_fmt_convert() will check if the
> blend_modes included BIT(DRM_MODE_BLEND_PREMULTI).
Do you see another opportunity to improve the change description
as I indicated?

Regards,
Markus

