Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z8ToBN/G7IYieOVNp9lKp1J2Q80IWODciLboMPS0yU=; b=TDidyW1AaWy/41342O+etK9uGa
	ko96fy4UiRJOS22Eg6UHMrrcW2SZjQEnhT0p4x5Dzix8j2EsgWX7WNslT6tdIpwXRSjBPnXjf2l8v
	PR7UbDb0m9zBpsCkVdk/TODcYyHHa8XpWjDB0YGpQyf7UQlzCNIMLVG6s+hq1sEsTecAyWg5HNnKK
	WgrSabqtMehBVJE9rbbEW0iXPxPTad2uu13f5NtWvEh28VRimmPKBaR2CE1oqhCkHlNTGICAxa9w/
	dMLaRyJRgNUkSk7d2A8o/ncA3kmyQuRh3NTa88qkv2GFFc5Bl0KzFTbXvRupABifYUShyIT0UzK+/
	iHKM8nGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnDr-007MrJ-Mb; Mon, 13 Mar 2023 18:48:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnD5-007MPQ-HQ; Mon, 13 Mar 2023 18:47:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E0C961485;
	Mon, 13 Mar 2023 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72F2C433EF;
	Mon, 13 Mar 2023 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733270;
	bh=9Z8ToBN/G7IYieOVNp9lKp1J2Q80IWODciLboMPS0yU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TaGuVYZDc7uUdi8c441+1M+3zcsjxtDhKRgMzvCHIeBAQMPvEnku7WxdqEp7RpMF5
	 2mAYyi4flD6+U41V98C2zQV/0tO6//FYZ/BfXGyebSyDbSEQtx1GgbL8WtcKRZaQD/
	 FnmUkNSE1bVUABWmkedcWLBo/o9vdRFpHEFQMHwAPXogd9/mmRM2B6UJ1bUBtabYfR
	 7hVChr4e3aIyTxhWoX2tovwHAHijnQ7s3JPgCTxHPzxnJ6BEQjXLAjfKFodDXnY1ov
	 x3nKVR5/J9KwwhqElDqz7K46hK/BpJT0618xeURhRWfZfYJVaIZS7M703vvBIRQmu4
	 t32S/NefLh8fA==
Message-ID: <4fe51e2b88df2c189a1a93453766a066.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-7-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-7-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 6/7] clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:48 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114751_695230_AA01139F 
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:04)
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

