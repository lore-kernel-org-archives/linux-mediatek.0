Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2ADFA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+it/uWgYLK72rmmUI3p1Wer5BTQwxtjc1xi5SAJGU40=; b=0n1d4Yvem9ehKE4Pz+JUGUU6y/
	zPC4RkFyMWUgx84wd6u9ZVWzGnffHa6O42C0OidbobroHcWWLKsYmBKLAD86cpx2yV4PgfMLEneti
	WcFJBpQad4A/HyajkS1saOTmPfj2dEfR/fwu3Kpr6T7dKnjowKA3paXHP5i4YAu/7ciRSJbuH7zS0
	N54SiyQF65QXy4Vt29o5/Fa0iEQXu8bYOxt8HxvVAiSPSJGURVnwokAPocc1P6iitsqwfS5E3c4sr
	F63tvLb6W3US8YHgRy3T40YKJYuZfGUe8XYJt5fcGZnvlH2s906CcPgGzCH0Wv4yXJLN91asRyEBz
	v4f1MPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWqB-00CeK5-Sq; Mon, 31 Oct 2022 15:36:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWpu-00CeCF-0m; Mon, 31 Oct 2022 15:36:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0699B818CC;
	Mon, 31 Oct 2022 15:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A10C43140;
	Mon, 31 Oct 2022 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230582;
	bh=hQTeoRIMnGPp9UdgDT08Aavn4R9xt6+Q4i1tH0XNAtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTouMncDtMEck6F3hpEnv5HTI5FxTrknmp7Hw+WJKidcVfbyNHJdYHjmRRLvQ1NMi
	 79k6ew61nkE5JUU/R+H8Y4UkCM20ONTgi5IvomLie4xhwbM01zKP+BP1cqNj41B9je
	 sLE2SObyNqVO4v93GRBtNDBDS1YoRyjPj1/UmGcrG3SCxctMAeXaLiGn9k43iyOphl
	 OD9LKi73/RdJWgcEKIBGJaisJJ7orl49E0Azz9nIM82iK8Ztons+syGXtHWUhfTqMH
	 gFNoIxoQRefbmGC7wkvpFacJV+m4GepDRdg8aa0Qzqxqd72bVQhwRsLd5G8iJPOxg2
	 vLf/O4qQ+5HyQ==
Date: Mon, 31 Oct 2022 15:36:14 +0000
From: Lee Jones <lee@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 net-next 1/7] dt-bindings: mfd: ocelot: remove
 spi-max-frequency from required properties
Message-ID: <Y1/rbgXwUZZXY3JK@google.com>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221025050355.3979380-2-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_083626_230172_47DC0368 
X-CRM114-Status: GOOD (  12.88  )
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

On Mon, 24 Oct 2022, Colin Foster wrote:

> The property spi-max-frequency was initially documented as a required
> property. It is not actually required, and will break bindings validation
> if other control mediums (e.g. PCIe) are used.
> 
> Remove this property from the required arguments.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]

