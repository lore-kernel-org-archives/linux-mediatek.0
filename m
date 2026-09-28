Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE9CA5FA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKHR+SJFFASvBta04CRZYYpREuzHifi5SVWuCQ0YQps=; b=vCX/olBwA4EiHFbAirzBZO7b3m
	f71mgFjF5rPWcpWAZjO6JCpclZysqj5vzXAfnjaDrfDdPJw+LALtYpqRnWPHD503mRtRZcGLXukQo
	4kxJbBer6GaqMWLoSbhVqHYAyM6DEiGccHQRn2Baf/1zPAc7o6or6npFCO68mUq95kbfGINcIXo8+
	Xoo42wDHLGeUHQ0LqtfgyCYFqU9uO1PEYMEMnMfx5MAWuCm0QcA4HHPm0RIelGGWCavtbeM9i6Cbi
	0Lk5AVzAIV/rFzPDs/Y7Rpta2Su+ELP4ueycUQ2gNZ/WOgL7R7fYndaQ4KWhln987/EjfkwX6dkZH
	I/qTl5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGBI-00000001L7x-0yCp;
	Mon, 28 Sep 2026 18:34:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGBG-00000001L7W-0Y8S;
	Mon, 28 Sep 2026 18:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE95243DFA;
	Mon, 28 Sep 2026 18:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A5C1F000FF;
	Mon, 28 Sep 2026 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790620465;
	bh=XKHR+SJFFASvBta04CRZYYpREuzHifi5SVWuCQ0YQps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HddpuUAIJy8c5vSGRQw0mfQi6dkV1NhSW7orkilOjlUGTw2o8nKc7M5WmbUMueKuj
	 qZfUbByg5FV1rkLSR/R+8ZmIG7gJ4I9ecDn3mO8WWRaBnUZelIuyA0mHdVUeF6Wzle
	 XmOh9Z/MHItk7ql5bIDMtJkh5KUdB6c0PWSWP3vihRFKo2DsBOnYnwlRznGe56S4GG
	 RuIBTiFLpJW2I1TAEyjsPNcnekmEAnlhMqs1rqf0XxZsr0Y58U3K2rLDxUwkUXj5DJ
	 a3+u180KWuosyDNOk3kh3GJbxh54P1UE+Q0+/es5OvhUYpntT7x7Va2DqRXfcWjCIM
	 YYGU8nTzmMrqA==
Date: Mon, 28 Sep 2026 13:34:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, mfd@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mediatek@lists.infradead.org, Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's nvmem layout
Message-ID: <179062046209.229646.883172989324987113.robh@kernel.org>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
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


On Thu, 17 Sep 2026 23:57:46 -0500, Ryan Brue wrote:
> Four of the MT6397 RTC's alarm registers use only their low bits; the
> high byte of each is storage the clock and the alarm don't touch.
> MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
> assigns the first to a fuel gauge, which is what a battery driver reads
> at boot so that the reported capacity does not jump across a reboot.
> 
> They sit in the RTC's always-on domain, so the driver can offer them as
> a battery-backed nvmem provider. Allow a board to lay cells out over
> them.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


