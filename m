Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE47C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU8KgpwJk2DA/OR7maXDLOg5h4wrn25AGwbgvBf9iqw=; b=xfvj7u9cunyWiadWRBdHZw8sRa
	98Ay6qWghyGeqnWRNxA9gopl6ce9vngU9056W9KAFnvQyGpi7D0R6cHsLkgBTExmdUxWPw+UCRmzG
	8Dij3Uu5RQ+qrMLFCJTvo6RzXf7vLtbhVoIX24efBeHqfbmDZQFQO7LgJ9cRbhuGBInQwMTw7tzDe
	DsUm/IO89n3oH3ukewNpDQe2ED7WmVVj8yNBzKwhoJ9gBF9fLTtfLBkBRoGe00Keu2a9Yjy/s5UrF
	7xpl9f7ZAn93ZY3o8UlbbBJc9TxuZh23YN2HFk8OGub51k8pO1HZIFSyg2ZLjrYWq9H/420doq6u3
	9RrUXfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnDC-007MSB-3w; Mon, 13 Mar 2023 18:47:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCn-007MFc-Ah; Mon, 13 Mar 2023 18:47:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB82C61469;
	Mon, 13 Mar 2023 18:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9E3C433D2;
	Mon, 13 Mar 2023 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733252;
	bh=GU8KgpwJk2DA/OR7maXDLOg5h4wrn25AGwbgvBf9iqw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=E/zVWhhLHi/WqHCMT7zAoghn3bUcdbovogtM3NORJN7yQoJMzMOeu0AwoW1tpvngq
	 lHzXnAMUq6O8FojB+jqRDOG5qrlpFsPi4a8E6Kchobflxujsmyf5sVby0hL3TzQMen
	 A2f53L+qQNGuDSuMWxnA7QS0vb0Clz7m3SxDV6kqPpPoxfVxfgFhldoXvzdLboLTdR
	 y2kpUDXHXGkoGnHdgB+jI6wekAhKYpI7vFBQsqU4FswG1boXWm8ifVJcELutyhCsFS
	 hzbrHswuCe4oTr5F0hZ8MxKyFLKfmY3ghvOjFXvqGJz8ED0QJBm47ijngrkl3DL4kw
	 xEbZyxa96Prng==
Message-ID: <a9ee130db23118fb7b94be88d5be70ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-5-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-5-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 4/7] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:30 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114733_448886_F80D6DCE 
X-CRM114-Status: UNSURE (   8.14  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:02)
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

