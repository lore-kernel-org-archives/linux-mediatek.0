Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8FFC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nd+9YLF/3+eWh/iRX84Oaf3lJFfzLWSPCQA0c+rGho=; b=Oa5TmQHVEaBqS7DnJ8Fxh53LYI
	4OSUYZkn1oJ8bXNEEDHhbVX4mhmEBd8akSg19tdVlfEoW101IZDgh4hap0MWAPJoJjAxCWEaJZZPc
	1J2sratSlLMrvWY3eZr+Nm4c/azJ4rGckk+E5ZmZddX17f6vs1z4N/ShIBQ4/+ssSPGtFmxIJvGO5
	/SG5U2ZqNjOAnoNFF/joVrShxdx8dpvRlt6teUs2A2pHgOsHx3eX3WGOl8SfH+zeIqnPEGhsllOfK
	QEnK6QUFOIQYpUYooEJpP7tbmHqCSlWjmeM5RaDvqBUBtQvr5MwizdRW4L4Pb5YO/ZBZCqPdkZbh+
	EwPXF7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUti4-00000000Jfz-1ZBz;
	Tue, 30 Jan 2024 19:23:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUti0-00000000JfF-3RlO;
	Tue, 30 Jan 2024 19:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 444FB60DFE;
	Tue, 30 Jan 2024 19:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8568C433F1;
	Tue, 30 Jan 2024 19:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706642627;
	bh=8VflfkXLHZ292qH8KopeytZ7etQ8Y0XHoeku0xktQDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzHHxxdaWyxqTms0YeaXMPXZf8yGIJFJG+qFcw4t8Rd3oaR1/O7Rh7TemzD/SQOtU
	 lGKGu5amiPquoxJb5y3FHpFMPDqPIZkitkXTzDmUElViVTOyC9i7X7so28nCtPNEkX
	 eTgn6V0z7nVPSbwlrBRWYoKt3CXcDZ3Rka85RTtupqR+2xIsZ6NQwU0Wq4vth26VZq
	 lzp6ReKdWgtsWi9e2N4bdmsPlO/4zxA1rN1MrLHAbMZKxZOJIH6zxi3PWfOBLm73yH
	 FdqTTUe78BqKRky75Bq8xhBJ/FAZHbt3A5jdf/178stDptU9u5x1Uiwe9k4vNlqEy/
	 WZxuVZnCBYXaQ==
Date: Tue, 30 Jan 2024 13:23:45 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	Ran Bi <ran.bi@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Message-ID: <170664262503.2186910.3437321072867058001.robh@kernel.org>
References: <20240122124949.29577-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122124949.29577-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_112348_917186_0A262910 
X-CRM114-Status: UNSURE (   9.92  )
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


On Mon, 22 Jan 2024 13:49:49 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include and adjusted "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>  2 files changed, 39 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


