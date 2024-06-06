Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64214C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6nHOSRQUTf8lskncbcfrnOE9UYbIGtkvvS9zsNteIA=; b=K5eg0Izi/dZ+je
	HN2JkJoRgkX1D35aUMGYimzvw1vMW7loijcsL3Clh6Uw8IsxdzOXvaQ9eK8HZPJLC522HFHV0q3zW
	NnqHc1d9wmkQmM1xp2aL9jSEJWehA9e2P0UMXuI08DWMLlQ6bBTHGrqzp8AqR/ucBnG5/lLw+UbF1
	e0p/JFohFWEFHvwshU/6YgSjSsYNz5T0/qjOP2btj3KS7QxhO2VQRZDLzxA5Xt9WN8MZ8BPN3l3q8
	vgjvCFR8SPueIBK7O8XCe6pe/L9h90XEfcupCCKQzMdTK6i5WKydX/x8LHbg0Rfi2z6qWTPLfblsp
	WsldZNKDmPFndFh8+Jzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8zq-00000008yqX-3aRv;
	Thu, 06 Jun 2024 09:01:22 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8zm-00000008ynC-2IFQ;
	Thu, 06 Jun 2024 09:01:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9AB01BF20E;
	Thu,  6 Jun 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1717664472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6nHOSRQUTf8lskncbcfrnOE9UYbIGtkvvS9zsNteIA=;
	b=B+gYOMfoQgw4FyCl7kj7mLnNlrqSsM7ytiJnzZz8Q+UEsu9yEbM0jF6r7MZ6XbJ5Rff/C/
	vMWapylmnzqLdpbZXMWTMMoeG0wnWNOhd5q/G8AlcxneKdkkH08Z7wLDmDYk7aFLM6kwfZ
	BTmZi3nz/kET4STOEYSgG/C52WmwE+TKOfkyl2u4CckHlIzim2M7XHnp8zHqcQJFBBbKFa
	/PsVRVDQ5aWSS7uLf23fHfBKuNCXV2kDl5HhHWvapM6h7OwKDC1kWngXRQmaxQVGRruvbM
	XDI6/HzXUaEvUdATk7M7pxvn62d9/uUbbm1Fg47T2P1Rks/5iAbhBcRA6b+RfA==
Message-ID: <0ae387c1-31b2-4e87-aa7d-f98e3c90e985@arinc9.com>
Date: Thu, 6 Jun 2024 12:01:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
 <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_020118_906665_10A27D98 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/06/2024 11.26, Thorsten Leemhuis wrote:
> On 31.05.24 08:10, Arınç ÜNAL wrote:
>> I had already submitted a patch series that would've prevented this
>> issue back in 14 March 2024 [1]. I've asked numerous times for the patch
>> series to be applied [2][3][4][5].
>>> Eventually Daniel asked for some changes [6]. But I won't have time to do
>> that anytime soon and I think the patch series is good enough to be applied
>> as is.
> 
> Then I guess we need some other way to resolve this in mainline to unfix

I don't believe we need another way to resolve it. I've already told that
the patch series is good enough to be applied as is and I don't see any
responses with reasons against this here.

> Frank's device. The two obvious options are afaics:
> 
> * revert the culprit (868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY
> address of switch from device tree")) and reapply it in a later cycle

Sorry, no. There's nothing wrong with that patch. The actual cause of this
issue is the patch that introduced this device tree source file with the
wrong PHY address.

> * apply Frank's patch (or an improved one) in this thread (and if needed
> revert it when some better changes emerge.
> 
> Arınç ÜNAL, could you please comment on that and ideally handle the
> necessary tasks, as it's your patch that causes the regression.

I don't see any necessary tasks for me to handle. AngeloGioacchino Del
Regno whom is the only person I know that maintains these device tree
source files can simply apply the patch series that I have already
submitted and we can all move on. I haven't heard from them whilst the
patch had been waiting since March. So I'm not sure who's going to apply
this patch, and to which tree.

Arınç

