Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7540C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ed4erZ+GHit7ZLhnJyWp1GJF9wKHODWqJeCXVYmBkT4=; b=2R7ZD37HJgNo0ROy6dTQ0rto4b
	Og9mSvQo74PZMijdlLOQjcLt6SUVtB10Rgtjen3rT0AGNBCulbL1SzzSIu5IeTwg/WvW4gcUdeYyM
	kgiRi2XC7aXxb1iFfPPFGrDpa9WSifTA9+lzU3nSejsByB/FLxpH8dWv57l6ZeyCe7vXkS95A6uOn
	KeKP/5mQAMm+w3nW8g+oqHs/AcD34sM6KEq8TkioVgSoXTwvnglHIgJm1UT6dUZBkU213oX5ji3Cf
	lVfujA0kP7nddxOWzDx3t6eCLUuEm9YHtvT/2GW4gAMpO5Iiwv9E1eQChnh7U1GFtgf4J5EenP4zf
	d9IXtZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXyV-00GoNq-KY; Fri, 27 Jan 2023 23:17:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXyK-00GoJN-3e; Fri, 27 Jan 2023 23:17:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA894B81FCD;
	Fri, 27 Jan 2023 23:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BCC433D2;
	Fri, 27 Jan 2023 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861445;
	bh=ed4erZ+GHit7ZLhnJyWp1GJF9wKHODWqJeCXVYmBkT4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JJD5/ZfNF4+6YjKWdsF8Uzl8GvF7wbH0nNxljBfqJUCgu6+pVSwPL9DuH88jcY74d
	 70pUlWVO7Fwr1+hxjbBYW7YgT+UxWPLqjCtNjyRgwArY/NSoTjYdHhz4xMhGzZZApY
	 LTvIZu9Lfr2EtBn4p+7QnMvlI2JGfJayOvCOD86NmfMFK37tH/K2fuKe/XSk0GtwKk
	 do50o/qG3mbQ1PJAS/BfsrQRGAc/lrCxVZSgoUNViTjO+OLJpIdiD+EsChaHzyldmK
	 xW5aCo55Ac4wLf44jXXhPcU40wa/d/mAY/3VarbKN24sAW/Bh5qEg47qL/bTXRv47k
	 ZECKuuXjQpxgg==
Message-ID: <88903c0db1586ce9a12404969f757a7e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
References: <cover.1674703830.git.daniel@makrotopia.org> <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri, 27 Jan 2023 15:17:23 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_151728_358157_70394467 
X-CRM114-Status: UNSURE (   8.08  )
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

Quoting Daniel Golle (2023-01-25 19:34:05)
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

