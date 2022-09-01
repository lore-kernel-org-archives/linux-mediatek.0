Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7714ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/sWxA960MFDvZQpRTbbU9NaZ+9atYHgasHRRigNO6o=; b=QKWBjUvyu4WupJDIWyUDJQt3KQ
	1xESVVGlgZ9lfdF7AzXCbZi/DEJvUustFyZBPLzqwNFg66nTE1km3BZGKP2sl4TJlata68iru8oeH
	PqOqK7w7YirWEpVxj8m+py6jEOKcORJJs/SGHMOGSsjbedvPZu7+kIoMHGXSk/5zQj+A7N2/bHPIk
	8dkE3XHlff0kwJGB7gnTgOZUslq2ZhUaxjmQI1XxjNfAOK7h6nkdFfFba3ABY4Khwz8yZ3BQtzN1b
	q1OPPGZ/b5zYjpENr8wI5Ssk99utVXQKgKrfU/xStCtIQtxFj+OFJJpbtXJ7qCTOCgSIWfEIAFPT6
	gmP0IV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYmz-008sBC-0K; Thu, 01 Sep 2022 01:14:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYmn-008s6q-ET; Thu, 01 Sep 2022 01:14:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F15C61CCC;
	Thu,  1 Sep 2022 01:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604D8C433D6;
	Thu,  1 Sep 2022 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661994863;
	bh=x/sWxA960MFDvZQpRTbbU9NaZ+9atYHgasHRRigNO6o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FU8R06aMjE8ZaQ5t5dDRUJU3irbyO7tVijp19Fi9Dh0YZEpASYVgmIEv41LjE96WQ
	 NfASBJGKP9tTbHDHW8KY0tu7cMwRw6t9kocepRZxeSSHRNVGgIjfBpiWg+TVci46rx
	 VAyKcxyv14IEPKuxI5uKmdDEqHD3C6Sd2h11uww9mK6Ff5iCLiF5GyhsscS9jON8tn
	 96/fEP90ov/lISwH7L4j0gA6lFNZg6bk1GnunXTVnMmzDp6J3is3jIKy/6l37WE+Za
	 q+sQF3r8MkVlpKoM3lToF2dr3b4lAg//jTHFaHRfv9nucTRD5nmQU5ym8wF9d3qG2/
	 EmBrVKA0B5xrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220629105205.173471-3-angelogioacchino.delregno@collabora.com>
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com> <20220629105205.173471-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195: Add reset idx for PCIe0 and PCIe1
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, wenst@chromium.org, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 31 Aug 2022 18:14:21 -0700
User-Agent: alot/0.10
Message-Id: <20220901011423.604D8C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_181425_563986_9FA22ECD 
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

Quoting AngeloGioacchino Del Regno (2022-06-29 03:52:05)
> Add the reset idx for PCIe P0, P1, located in infra_ao RST2 registers.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

