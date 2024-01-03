Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D763C47077
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pv2/604wB1FbsSwfgxevhJWAEYEnsxB4DMwv7K7Gywk=; b=3ccxjahvz3fr+hRRQzDvmntPr+
	tNN9A1DMVs9i1lnFwTRxsPOWCWkG0x8DRbiBf51s7YsJszfA5LQeDOEPRb9ZOa4i3gWXfPAHOA2qd
	vzV12PTIxHGxN9MnCfWMl7F8aC94AqWyUQ8/bF2riizIiySFL7cb031H3oZ1c9eS65+uLSXsU4dqb
	z0PqOrqdgmzH5uGM9BZLTL6xvrO7aX3eC20o1wxvDGoOa5sbFjCMpE7t2IunoGEecjNgNoGF+v0/R
	j7eWTcQOBtS5aNhj8AvosMjTEXS8+1eE4L9/24Fk17yXi5dugL4tjLJf6QcsrCwVzsvr4jFHBxhIy
	6XBs8IWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpUU-009QLR-1y;
	Wed, 03 Jan 2024 00:52:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpUQ-009QJW-2Y;
	Wed, 03 Jan 2024 00:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 527F9B80F9D;
	Wed,  3 Jan 2024 00:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6AFC433C7;
	Wed,  3 Jan 2024 00:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243128;
	bh=pv2/604wB1FbsSwfgxevhJWAEYEnsxB4DMwv7K7Gywk=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=hGvDwHPql+T2nr7Ckh38R5cHAioVp82CFXOlcYglkFtzL1vNQ2Xpdb3KU5q+bcZJb
	 3o+9plQn+3B0XVxZkaEsmBCTsBUE+xP7fDazumgQ0eJTCeRePFXoLhqmdUHtbOb6fA
	 nn0+e1WN9LTya3j0xcfA56sLTCodlTNGoUu6Ax8RJUlAWn7zX/MPbBgVWNx2VLNNOY
	 nSdY2qcVPD84eU3rR7Mq/rAkiy2XRNYa4v9RSCqJ4UG3pPe98Vnv/Ri8lMOeCLhRb+
	 JHrYe8L7ytvKa0qvFXJT0Oqcox/k2S4xAFxCnIUrrjn8GAuXK9EalHpmlmK4jMsDid
	 qMp0bfd7KrKkw==
Message-ID: <ce85d733622a998396598efd64882e9d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: mediatek: add MT7988 clock IDs
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Golle <daniel@makrotopia.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank Wunderlich <frank-w@public-files.de>, Garmin.Chang <Garmin.Chang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Sam Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Tue, 02 Jan 2024 16:52:06 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165211_248744_259B57ED 
X-CRM114-Status: UNSURE (   6.95  )
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

Quoting Daniel Golle (2023-12-17 13:49:33)
> From: Sam Shih <sam.shih@mediatek.com>
>=20
> Add MT7988 clock dt-bindings for topckgen, apmixedsys, infracfg,
> ethernet and xfipll subsystem clocks.
>=20
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

