Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B500DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJjukHsbHrPXxnAGkKBJL1+F80pFk9u9WxONVeM09Rw=; b=Mn36yESxMS4Ef8oKBNgMVeQj/K
	1MXGb40sPZl4tcelgE0FXGXgJOKVqT7Fz/VorfUVCJLvgqVf5Rq4TVrtkObHh7lBAuRfaitLQCTca
	ueIQoobL3d6PyR94I/cbRkEaOyyW7kxanzcAU6+trxG3ASw9Y2oG8e1ArVFckdpR3tDxsO/yG+v+l
	Bp4Np/aMZBZrZNAHSW3gIORmYI6OY7M2B5jxmjShqzTYtjA9MdJy3vlGjdGPzwOaGjYOwOh/AqhKY
	F95Xn/jm1tDOVx/N8/NsgIjVR489FD0XCaidwrZo66usoRm0Hr/9iICK86riOTGkHh1c4K4mxMpCD
	a7m0D0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOEr-00Bp1n-9d; Fri, 30 Sep 2022 22:12:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOEf-00Borz-NF; Fri, 30 Sep 2022 22:11:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8633A62535;
	Fri, 30 Sep 2022 22:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7412C433C1;
	Fri, 30 Sep 2022 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664575910;
	bh=TJjukHsbHrPXxnAGkKBJL1+F80pFk9u9WxONVeM09Rw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nhz13Zh4QN4rt+fH+/KrCI0MKNofWTz9ij7GT/CTRzHHUdXcZcHfoiJmcVn6dA/yf
	 w+OEwQr95DvSu0ltRcv9PJYH54PBS5MkdAn4bBscb4uOAmNNt05U4zth1aBqZJTxe6
	 k1XiRT1B0I9FOPqflJHFwJFLOIqwkJt6FVNfnzVImQE5JHT8IFi69CRkRrWaJtbqVx
	 HcAxfyY9abQE9gqAkQp6sHRIUr9PqRnWYb4rYAAuMda+eqVBHCRAkp9DODtsziUlx2
	 cc1rF6XaJUYv66+wAioe2Liri1tMLF9+k3Dkmjjajr2U+0nN1TFLUg2LUXQPGaB2lB
	 Mfebbh9IG4OMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220822152652.3499972-3-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com> <20220822152652.3499972-3-msp@baylibre.com>
Subject: Re: [PATCH v4 2/4] clk: mediatek: Provide mtk_devm_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <parent.f@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Sep 2022 15:11:49 -0700
User-Agent: alot/0.10
Message-Id: <20220930221150.D7412C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_151157_810565_E820A9C5 
X-CRM114-Status: UNSURE (   7.84  )
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

Quoting Markus Schneider-Pargmann (2022-08-22 08:26:50)
> Provide a helper that replaces the kzalloc with devm_kzalloc so error
> handling gets easier.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next

