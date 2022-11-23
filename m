Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ED0C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKJVQ/x0v8/dAabzQOh03zOnQjNtyIkkhND82iVe8PA=; b=UA0b4KeKytn8YaIOEQqHwkY50M
	PwXft7PhaM4x7wtTs+hSQBLc9UhdlLgMX47cmoR0rHMQsnGht86O4az0Ytprwlhmk+0cVryHZ0CCw
	Xnj5/XVw21Grx8vjFx6XBItPST+PafJeOFjXZQynYPIsasCbaHjXpaa/NzksORRpABC7WC+B/QP7G
	g01yPhvmYt5FK1KezRdhVQye+gTIlRicHWJWr5fw5mLbNXTK0zfC1+DCbpSiW9+4Bg8mmE5XCUugU
	LWWVQjqJ3YoVFO6YZpkkCFhTg2x4GdDnIqN9iKUoLCjHWmt/IE1CqyLHus3TJNhwbVh+YzwatHXYd
	r8wsnDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsS0-000nal-FC; Wed, 23 Nov 2022 16:18:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsRU-000nXD-Nj; Wed, 23 Nov 2022 16:17:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1529161DE4;
	Wed, 23 Nov 2022 16:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0F5C433D6;
	Wed, 23 Nov 2022 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669220263;
	bh=nIHvw2215u8yi3qmy0MJsRsU0YAgnU/WLNFUep5lX70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bGmSakbnmBl/tYZC+pcD7Sj6xtS5HhXz8vu7MHz0jLaDx7UnmmjlxaNnTAImpfHHJ
	 PeUbSwQg17pBOSs4SSV8Fn3P8evp8llu1rvFH+TA9LI6YL5IdHzv25UME/Njz81Aie
	 WIbm+e2/oYB72rzh1vCNUBltMUGLEOLV46oSEADI78kh9FT4qnmf/zNjuK8+fJIejG
	 5jrdv7kETcsYO67n0qWMFVNFegVNg1dtYD5EcUra/2AxNOJy8qQHCeA2tmqrJ76Ur/
	 WSyLpoDMk06ZEipj86ZexAEwwd0uqVs2Uzq+dLxReTlKrtpdPTe0X3g7JreHujAPxW
	 MD/Xo1FnVP3jQ==
Message-ID: <7af73fa4-3783-a2c3-bea3-29167fc49ec2@kernel.org>
Date: Wed, 23 Nov 2022 17:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] dt-bindings: pwm: mediatek: Add compatible for MT7986
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
References: <6f28ccf3-ea27-9d5e-bd67-14f7729f713f@linaro.org>
 <e2170b37f28238c59b2f43309822b63a4d0ac9b1.1667243978.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <e2170b37f28238c59b2f43309822b63a4d0ac9b1.1667243978.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_081744_851807_CBD7D4C0 
X-CRM114-Status: GOOD (  13.95  )
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

On 31/10/2022 20:23, Daniel Golle wrote:
> Add new compatible string for MT7986 PWM and list compatible units for
> existing entries. Also make sure the number of pwm1-X clocks is listed
> for all supported units.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You managed to miss all folks from DT :/

Best regards,
Krzysztof


