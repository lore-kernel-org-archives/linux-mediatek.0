Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABE7C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljsypJpBXhvMBP8K/2+k16E6BKcRzVE1HpkZG0IWuSw=; b=E9Uok/wII16jAg4XIhKlCg1e44
	BvGyFh0Z9l7/7IT3hGUR/5DhWNXaxHm/7y2J0/9mRzzJPYDe6EuUy1m/oSMF2JL0IiuIPxWM88cA9
	PUyC0tFLWHkqWhjrxYzyxLnQGI68sTb+pPJP4N7TrB2LV4Hd5/zlDf/lRK5I6+xbjrVu8UvFGz5ND
	rkbyTB3e6To2MMM4/pvsvhXG/cI9mP9y/6nauzIIU9d6u8B2NxkfDjg5IG38VUM1Hz+1bpS4ypHls
	fImrpkx8GKMNtQVxxxhZB+yI6Q5ntYdU54SmUYXEgvMyiCiNu4TT1ONKkYCnp3tYgHsDUTRs6pLbO
	Synrnoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCv-007MJW-Fg; Mon, 13 Mar 2023 18:47:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCd-007MBo-CT; Mon, 13 Mar 2023 18:47:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6C5561416;
	Mon, 13 Mar 2023 18:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3CDC433D2;
	Mon, 13 Mar 2023 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733242;
	bh=ljsypJpBXhvMBP8K/2+k16E6BKcRzVE1HpkZG0IWuSw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h93YxbKXox6YIBETRmCrd9KyjNMlZHbKBdsNYTHsyWKKLeuq1TEwwKXQys18O+OKH
	 7abYeakeGMa21U7gOBR/aznxVoXzaXpEdDo28qQ55VWkWzdDyvlWxm1O0+jPZjYloP
	 nZcRNV35j66R+0ALMl62zeKk2SCh2aZ47SR9XrrBj5lXEjxV3zsob8WNlnrRzwdKzu
	 lDrftMi1sWsBixZoifFke6lTmFRDMNTbkPi9kQhpWGMuYbg9JHuqhT5SZhCXuvloHR
	 IvDj03iW7LF9BXfBJ/ev/oyyTv+DRJfFWWOluos3ithP/lbDljPm3suL71yb7DseE2
	 YoDj9qQAToUcQ==
Message-ID: <c5388593e1d4320901208fe3f21fda1d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-4-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-4-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795, MT8173/92/95
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:20 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114723_480991_9B5B66B4 
X-CRM114-Status: UNSURE (   6.64  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:01)
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

