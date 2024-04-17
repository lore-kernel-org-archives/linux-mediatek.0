Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A5FC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9us4C5zGvLNNPDfZkZmei5akorqvGO8BMZ/4R/4zr4=; b=HguPJpYDrzu9P1o6WLrPQYBrVh
	0Yey5aP2uL6oN+P7U4E6P8fI/I+s/RWq4i4kKwfROiJvI61/Zjr6tCUwDzwoR24O70tR2eXZflvbM
	7KOPzB0ehUXyyWfw52gRRIrj2k/YpdtvyDIeGZ0EKHgKr0WIfvL9xNmAl8FcXp/Vdb5abUJmxGp7T
	rXTakhJg9itPH8t2oMAn82NRJGUQY2B3b+FwYJ9FUZSdAaoJq+PuV327TeodJTO1rZaqkUervXM3W
	NnQQlcyQZRztIlzs4Mx8hfxk2omsy07U2nRV3tb5zUpfnyXDuOfbkYZm3jopuGK/DRJgQDnV2o1kT
	ua4Bu5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5gF-0000000GEOW-2r3a;
	Wed, 17 Apr 2024 13:50:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5gA-0000000GENC-0cQA;
	Wed, 17 Apr 2024 13:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713361823;
	bh=C10c0j9rUMDZTqWWXJ3mbmlN530Uqy2jVku/X9owZB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3DctJJn9xKbax1ctnQtqhoj9wcBbyIUez6JUTeoNeiXYXKeXFwscqwquGvopFS5jA
	 CeORZDrLvUxoswS0xOUrRoLOcPBLraDXfh7T4HIYsNeWKadYqaczN33+x4nULqlZjK
	 cMSyoGf+ZioBTkqU0wU8w8c+RuKiraubHBkxak7Zd1rpGMXDCI0cOPJDG8ZFTMKyQP
	 U460A1XGEFyOVbHHnNywDb6ziDstMz8qm+lN/q10nmT/B5YT0SFZB2LVTL2syaaSb8
	 LqphPFRNZj0iqJ94rBaNzFcMYJSYt5M5QrVsNCPAkJBA1ZDitl9IRpRN1hBfuW3jAG
	 jZnXF9/LhltFA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 62DA3378001E;
	Wed, 17 Apr 2024 13:50:21 +0000 (UTC)
Message-ID: <f04ac76d-4348-4b79-890d-829114921299@collabora.com>
Date: Wed, 17 Apr 2024 15:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
 <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_065026_412158_6DC6D30D 
X-CRM114-Status: GOOD (  12.75  )
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

Il 17/04/24 15:25, Uwe Kleine-König ha scritto:
> Hello,
> 
> On Wed, Apr 17, 2024 at 12:19:19PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
>>> According to the Mediatek MT8365 datasheet, the display PWM block has
>>> a power domain.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
>> It's the same for at least MT8195, MT8183 and I think MT8192 as well... so
>> not having that from the beginning is actually a mistake.
>>
>> Please add a Fixes tag and resend, after which:
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> You mean similar to:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fb7c3d8ba039df877886fd457538d8b24ca9c84b
> 
> ? It seems someone you know well was quicker :-)
> 
> Best regards
> Uwe
> 

LOL! I totally forgot that I fixed that already :-D

I need more coffee!

Cheers,
Angelo

