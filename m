Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052EDE7717F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 01:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKxi0E7pbM2Jdovu4StrqwHVOtlICq1QK1hNK04O1Co=; b=qHyie+JpqK8LzfS/gFvZeiJqZR
	gQ++X/TCEJ3rs7tCAMrI9rWzl83NHWsLQPRlKLFxkQz3AxL2e4ZGBRpYFFiS0n1e55Fo5SMSQ3mvw
	0Guus+7Bk03lVLajeSocgKZJ80ZvUacGgfCAZb1/E2TiL4zWED+ldThszLLl2/E/dYcOt1RaEpUNs
	IY1anYiq3a6NTFgrMkvVEHbBEWCROdLu2j4HVkCegkQ7ccdNhcFTNF2Ixkid7+Z1Vg2xCpcHxjNCS
	y13HDW+J2NWzX+JREcnpJCzqloC63X8T3gwWMp1FVH849NRKua1ADNu2xTlmrFCnQ9XMQc1fPKj7A
	Jn5PKj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLunq-00000002RqW-0Aoq;
	Fri, 13 Dec 2024 01:49:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLunn-00000002Rq4-2ccm
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 01:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50DD45C633F;
	Fri, 13 Dec 2024 01:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CABC4CECE;
	Fri, 13 Dec 2024 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734054550;
	bh=r4EaCGo2gxuViKp1Wlydj2Tw1dW0Da8pj1POpitSggc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIQnzp4Bv6neyKVzOUKHWnIqEVa306JpeUPeIEbYEalZQFG8Elqg/H6LiFE11L66H
	 dQwyMzQnjGLOotSItxHwwogKcXxlkzus0yySHk7gBV23ielaBCpECIshJB9LddJYcP
	 /m0JMDbAN7y0SUHU1bQunnzlO0TgSCktoEmnaczCzDBjJRQHKUI4rbQk7RRmEBn9XN
	 Aq67tvyxqxo5g8hxumIrhYBxO/obX5qUVfJhwO6Kf/+728e2tobYTYSr532bz4CD4+
	 W2hU5yAhAvMeMt0P7BfYSwF2Lg8HTjMnKQsjlsiGnR5LG6lX9zsj0J7+b2gq10nBUd
	 dQzmjeYegGOkg==
Date: Fri, 13 Dec 2024 01:49:06 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, linux@weissschuh.net,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org, bleung@chromium.org,
	groeck@chromium.org
Subject: Re: [PATCH 0/2] platform/chrome: Remove cros-kbd-led-backlight
Message-ID: <Z1uSkny2GVCEXozm@google.com>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206031405.1711996-1-tzungbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_174911_708422_2A6CB1CB 
X-CRM114-Status: UNSURE (   6.87  )
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

On Fri, Dec 06, 2024 at 03:14:03AM +0000, Tzung-Bi Shih wrote:
> After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
> keyboard-backlight node"), there are no users for using the OF match.
> Instead, the device is added via drivers/mfd/cros_ec_dev.c by
> 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").
> 
> The series removes the OF match and the DT bindings.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_kbd_led_backlight: Remove OF match
      commit: c42951620dd473835f653ec5e127c8f284f4381b
[2/2] dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight
      commit: 770aed02a55a249362ba3c2e6c361107b02aae7b

Thanks!

