Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A5CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d48bhLyzRVyeGxbnJF3Qv5h7/XTC0mhguBxZRlvvqU=; b=fdfTK4Xsiu0u8wQ9hY+kxvIZlx
	hHg717Gwf43S/8QvUCimZIr11ejvYcewXKr1Tz+kPdrWf0/V9w3/jd9TqvNMbU131EWhyW2dkofUl
	r4m8NNVRaBdsoOG9Y6IWA//qfkUDhco0NlCzm3ytsynzT0H7/bgclJ0FbjGnLYlWSfWzPmvKUyqM6
	iZlPP7O4D9w/9StEJV8yTyBwJUy8BANzxWyHXd9SVsz1k8sAqKf7S6o6EYQzMwFX7QAHQyHhCZWX4
	kRazQlKFzoKlsZX2FZTW/dE0+AD2c4Mx64krgOrlBb6m8COYixeUxR7L73zpYNZY1EWwoySABQ3u7
	FtgfakXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnE7-007N1o-RN; Mon, 13 Mar 2023 18:48:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnDG-007MU6-Sr; Mon, 13 Mar 2023 18:48:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 623BDB811EA;
	Mon, 13 Mar 2023 18:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAB5C433D2;
	Mon, 13 Mar 2023 18:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733280;
	bh=/d48bhLyzRVyeGxbnJF3Qv5h7/XTC0mhguBxZRlvvqU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GfHGVKoxU0W/N2wLo63mnd3Wc7tjoxw0cGbP7H/w/QB19ZggiY552NYKNip1AuS7O
	 yyEhBH5QUlTGepcYtQ0rYggBoxFGql5gkm+/6tE56b+9lS7Aszl6U3Uw11ZuLiRxbl
	 icEgjpYGDpuvQaidAQ+DoXKSfAmEC9XMwwHAe5fteGtrtJ8x/7Lx0KXHS9HEmbzWLO
	 RTfX5PzuiaXOTdpdG4PJEil+sMdxq5mEBJWaH60BSkHM8rFfpRuQ3Gzu7rihSDEYUp
	 Hi1BVYbP7E5WI9ncfgl22zSPBmHMqY9zEoEFS18oQT76bnG8/W0hZTazCNFmWO9OX/
	 Tze0GVrUJZQOg==
Message-ID: <f0333440693d55316a064e3ad1dbd307.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 7/7] clk: mediatek: mt8195: Add support for frequency hopping through FHCTL
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:58 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114803_238886_0F670028 
X-CRM114-Status: UNSURE (   7.94  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:05)
> Add FHCTL parameters and register PLLs through FHCTL to add support
> for frequency hopping and SSC. FHCTL will be enabled only on PLLs
> specified in devicetree.
>=20
> This commit brings functional changes only upon addition of
> devicetree configuration.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

