Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7d9XV6IsnIwU7Gj07fwE3ldNBJ/qjfOW6mSWa+l8tI=; b=fnD48HuSDIG9krw7USJaTXYUz0
	eEBBSA+K0OkXn3poRxm/L030i0MXm5A8n28xV3H8kA8EdzIG8y1zVs2q11eBcC1Q1uq/OiIw2sBuV
	VYrBjRiV7apScIF7U63gq2JSIjQUMQNxDx9XZaNz81kNlSzDO5RNezi9jdtlJWJfR59cEIZGF/uER
	guWscHh4sdOlV161gf+A8RAE7oHnU6OI96W0MNUoX6Inv60LezumwTLeRVSQnR4Bo4T8eYxMiJ4Q4
	H1F4H2eG8hGT2SoPi7XefSz73dkzuIePcDSIjrqbWYiw5PiKA1dMtAqBrLQoorNie4vXGtgHd+D0K
	KEMimMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ospCx-00FmxF-IP; Wed, 09 Nov 2022 17:49:51 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ospCi-00FmcK-PC; Wed, 09 Nov 2022 17:49:39 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 94A33240002;
	Wed,  9 Nov 2022 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668016172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O7d9XV6IsnIwU7Gj07fwE3ldNBJ/qjfOW6mSWa+l8tI=;
	b=CLipaJKhG3s+/op4L0NtH9sjz2WfwiRqjsKDlScPaX0KdHktmnWhIGym0rK890RfIxNJKK
	MLUF4Xl0RxHIqQtYZ5p5uBz7pl4+/Vj1yucDRer129pJAruTVoQ3dc55nGhoi2O/ZZvtYy
	0QOYI5PoA9Ri918CkMmOi0zIf5yl7udtNc3QCrOAvYlTUpdGDVxispUsZ3D6wxtIBLEb7j
	6kPYFE+xx55WzPq7oiXWScyfMSDZL8I3v9OVlxct0YVUKmTcn9glcAm9rBc+aRgd54n4bH
	Zpd32cL6D4eyMhWabFPmWEOczgX5rfFuJugIMBT8yZ3UUaJ9yx9IoaeKImPTQA==
Date: Wed, 9 Nov 2022 18:49:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <Y2voKqz1zRg32jaJ@mail.local>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <ed298a3e-25dd-af19-437c-f27c160788b3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed298a3e-25dd-af19-437c-f27c160788b3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_094937_159637_71DC5D6D 
X-CRM114-Status: GOOD (  17.90  )
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

On 09/11/2022 10:40:39+0100, AngeloGioacchino Del Regno wrote:
> Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
> > - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> > - Add mediatek,mt6357-rtc compatible.
> > - Add maintainer
> > - Remove the .txt binding file
> > 
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
> >   .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
> >   .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
> >   3 files changed, 41 insertions(+), 32 deletions(-)
> > 
> 
> Please split the txt->yaml conversion in one commit and the addition of the
> new mt6357-rtc compatible in another commit.
> 
> Also, isn't the original maintainer of rtc-mt6397 supposed to be...
> Tianping Fang <tianping.fang@mediatek.com> ?
> 
> You can add yourself to the list of maintainers, though, unless Tianping
> explicitly says that he doesn't want to maintain this driver anymore?
> 

This is not about the maintenance of the driver but of the device tree
bindings for the IP

> Regards,
> Angelo
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

