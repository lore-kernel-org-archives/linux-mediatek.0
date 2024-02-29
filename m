Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07527C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFfmStaqobzdqjhMe7Rij7Gosy32QSdSszw0WDuDHvI=; b=ISqH6j5TNnB6S3Hi1+3s/e9ZgY
	OFCXKZFPJuCZel34/I9Di2YBdJn+5V2ddFykzgony5a1czzl3bfCLBAg6opLSabiOPORMfXtIJQiw
	9gQDWvVizFFvC97Qe2oPZ4fwB5YcRyZ4Tw3mZybkuHWNJVHY30XK64iC1bVuwtxK21fq1NAg1TRsG
	7LQzoyDyx1HPKayghpmSq38SzsysIC68RHEG8Xw5QL0HubMqozzaXLGbrNLT7xf24DGdZk9pZ8mUz
	FWDLHs8K2n1g4lAcabXWnDWZm2Tu0ES8OqClfwcSxQimvAf1oLaODJy7C5Nx4rVIvI9S1Ekpw5zbB
	T9sFrc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnr6-0000000FImN-2JMd;
	Thu, 29 Feb 2024 21:22:16 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnqw-0000000FIis-0Ge8;
	Thu, 29 Feb 2024 21:22:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C69F1C0002;
	Thu, 29 Feb 2024 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709241722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFfmStaqobzdqjhMe7Rij7Gosy32QSdSszw0WDuDHvI=;
	b=LUlcmn2osmvrma3LnoQXI+1bc1HwyrjNo85AoI8dm7cu6YsqdbO3fMsHBuagZSJ3/Ja7LM
	Yb8AGGKwGJGZJFO6llYMR0/8Cnw+UwGB5aihpV5nqilveZUrxzoe+kIYLHYYMMmoJo0NxP
	0FYicsmA+6qjCL+A0B553IMEAQCLziBkSPCuIPGwg5WQgG5Hmy+N+gwjdLXk/au4FN7TA1
	+9PFVFzmf0+gj3yaIBBeVEbeHOohx+lojZEdZkapgN2S9cqhaeqJOq70SDeK+Nvm/kX8E0
	jk19IGeBaj5HKcSQkJ7mT+7hattIDFv5nlCqA7ZYRmpu07+w8pIrHUGP6Rtigw==
Date: Thu, 29 Feb 2024 22:21:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT7622 RTC to the json-schema
Message-ID: <170924169921.1873482.7668745042028473030.b4-ty@bootlin.com>
References: <20240123125043.27192-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123125043.27192-1-zajec5@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_132206_299320_02E36FBF 
X-CRM114-Status: UNSURE (   6.85  )
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

On Tue, 23 Jan 2024 13:50:43 +0100, Rafał Miłecki wrote:
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include-s and adjusted "reg" in example
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: convert MT7622 RTC to the json-schema
      https://git.kernel.org/abelloni/c/aef3952ec13f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

