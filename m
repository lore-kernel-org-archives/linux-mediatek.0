Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A663C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06h+Dixp3pfmyNHLmEgwHvnmTLomiV3h0dUw0wK6Rv0=; b=xrM3KJD+5ybxjzelLc2m3/zF56
	L394jO/igZ1NVyY/wGDCQS90dcWBYRn/sm3jbCfb7WOw7pHx0Ff+l2TLbol/n6O/5ePJMunW+8HXA
	u323vXeR22zNq48A6Hr1WgPMj7p8FDF/BGEuNUql6cjT8e9cEappxJBlaRzB9EipYDlP5l7rBYnf2
	2Caec4Agdl+vgGwWg1cjjqfip76F3CvO7gF8/IbzuNCgLwPi9k+r5f79t2eaMyrE7YBWrncO9DKVK
	J9LwkPjpvZmymwBYUOp9ruFfhko4dl6/msW5ixtbstMIZQuGOd+S/2/4ZD2V1MKpS36g2lVoaOZwW
	KV4CF+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfo6s-0000000FLun-0ItW;
	Thu, 29 Feb 2024 21:38:34 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfo6n-0000000FLtB-2WqR;
	Thu, 29 Feb 2024 21:38:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FA29FF802;
	Thu, 29 Feb 2024 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709242703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=06h+Dixp3pfmyNHLmEgwHvnmTLomiV3h0dUw0wK6Rv0=;
	b=KK/ZUxdMUD8UIdRpFCufS6iKlqdVruNm8S81hf2wcXf/Raw2jCZcI4NK2pwFHkxIIq49Y2
	t/VtghIveB0cag2gAQK8iKU3/fTWg+vk+qymC3OZUOKuD6fASsMaJymE2wBIqzuKPJSQdk
	z37If8Lmeh1XECZMoRO1DEJBJ7zIF4kna7SrbKqxAUeRAp2kacwhxsdtL/1HfAijE98fFc
	QotFWYt71t7aWuIgs4auu6joCsglV0fmaFw6ABF/1kwzYP3ZZZ8chL5RABl9JPi4DJ5P4f
	V2F/IqwpVP5MWV9iKe/XQjJGWl6Teo+zTuQKJxOgv+YeK6a92Wss58YvgjtenQ==
Date: Thu, 29 Feb 2024 22:38:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] rtc: mt6397: select IRQ_DOMAIN instead of depending
 on it
Message-ID: <170924268327.1875298.3046212604206136101.b4-ty@bootlin.com>
References: <20240213050258.6167-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213050258.6167-1-rdunlap@infradead.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_133829_792803_D1722DBC 
X-CRM114-Status: UNSURE (   9.96  )
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

On Mon, 12 Feb 2024 21:02:58 -0800, Randy Dunlap wrote:
> IRQ_DOMAIN is a hidden (not user visible) symbol. Users cannot set
> it directly thru "make *config", so drivers should select it instead
> of depending on it if they need it.
> Relying on it being set for a dependency is risky.
> 
> Consistently using "select" or "depends on" can also help reduce
> Kconfig circular dependency issues.
> 
> [...]

Applied, thanks!

[1/1] rtc: mt6397: select IRQ_DOMAIN instead of depending on it
      https://git.kernel.org/abelloni/c/544c42f798e1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

