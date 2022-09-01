Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290BECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 01:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/76vyDw5YFQkK7f+C2znxTwONiXMNY233XPvV8eTj4=; b=InNmihvg4YDnX0IKJoCniQ+i7E
	wGxdVo7r+bV6ONzan+7RDrTxMc4eWE+xCrA0iFAA7wUU1Iv5q2DZoP7tnn7+7jgwfe7rrbl2IQnu3
	N95G/5j8S6GqQGUG8YDWWL+lRbuQOMeA5wzOLqUYPoph+tNrFcSazWFemxYDsYp3n9XL+c7Ny7nRb
	BnBxn5NBuEg9XEplkvc9vB7GbYl2vweMfGkCVPmghEzYdFNMqq4GSxiHT/ApoHFYJZ6eTuwn0mD8L
	SpIFbSGavmph2eqQtu7U2s1IjLSIuhgC8wLFJZRBA7XIwzHkA0h251D+BVQnYxyVKtboyXb/K/GMX
	2PR6rOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYmp-008s7n-Q8; Thu, 01 Sep 2022 01:14:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYmf-008s58-SH; Thu, 01 Sep 2022 01:14:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45A36B823C8;
	Thu,  1 Sep 2022 01:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2C4C433D6;
	Thu,  1 Sep 2022 01:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661994851;
	bh=R/76vyDw5YFQkK7f+C2znxTwONiXMNY233XPvV8eTj4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V55x74P73lLpqSgoCdJUPauFg/fACr3iPqob7PaHI0UEP7KbgEsGdRoIRM3AJVrvW
	 00vmDXDnuFXSdf2PA8QX8efseS8pvqcI2qVpnyIJTaHpuc8E0JSzBCcK1SDPYJBQ9F
	 taHdWOiH8KSC5iqoffjy9XKFbkQY08wcWGeWML7H/q+7BkjoEEzn8C4j1I2Qv6a+18
	 itkOAsuwz87zSSnWNK1eUgkmiqPtsGpj/8pZpP5FmubrAWWS3rWvnPXelyab1uCQPp
	 lfE9+90YFtB9TbTo7UoJboBMvk0YvU4bkU2+/4ipOrEm0kWYMrkODdgiduGEpqTb5M
	 DfE2u4AjK84sQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com> <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for PCIE controllers
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, wenst@chromium.org, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 31 Aug 2022 18:14:09 -0700
User-Agent: alot/0.10
Message-Id: <20220901011410.ED2C4C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_181418_096393_36C0534B 
X-CRM114-Status: UNSURE (   7.04  )
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

Quoting AngeloGioacchino Del Regno (2022-06-29 03:52:04)
> Add the reset index for PCIe P0 and P1 (PCIe0, PCIe1) on MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

