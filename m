Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7372C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTgi2mL/qWUSdzTq7Jk2j3SyyOnbKCA4XnZYuMo2fk4=; b=qIHEoHNPcxJtnFamiNVn8L6Eul
	6eU9wwKMczfw+XtgCGYBLGk24jAoHRaUBCOFtu9MBeyv+Y7jA2y47z49ZCEnFMnNxMMew9LgikSbn
	dKwpA58bHKgVEq8KN7vdYFmr4pL3vUVfvr/neSD4ee8rVMkcmdmEAeEBPFnUbAtGb/82u0RiGKE1e
	utDWg7rGGg7qdizvQ0os+K/8Le3TTo6XQXXei61OR++bjLqmJ4vqYrrVhkVYcYWKJ92D1cKlrDZM/
	KPa/cTvJ6qaS/a42c6RkUsEGoD3HwqKcJqdh0JUYxlBdW2Uo1AuAeQDbehTR9aJn4IGN8vb+VyQ7U
	IONRZjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpTm-009Q3T-25;
	Wed, 03 Jan 2024 00:51:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpTj-009Q2w-26;
	Wed, 03 Jan 2024 00:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CB37FB80EF5;
	Wed,  3 Jan 2024 00:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C851DC433C8;
	Wed,  3 Jan 2024 00:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243084;
	bh=LWs+wtOQwJE2KAvg5du9NptcRU9govH4f+98sicou70=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WxVaI9694aQvo58unwJTq2noH7ZFX0/naboe8Y0fEDYRJ5cFrH5OcfVD5EugMdpVz
	 cZjjygm2a49RIB7BSTOdyvCoUlxvvotFFLH7ZpVmu/Jo2zg3t6tlkVC1zSJeavIM2t
	 l2T5YbZ3Qi2ONbciE753zohKOsDnfOrfgb8sXZfDiUg0tOpbbPQgopdIzSJYLaB1xH
	 jGuCcV1U3eSPFoUvIK8KkKmYOWNsebz95wOPBhR5sJdBMOVN+HWbYptkdcLFTQyUnz
	 bypp6ZsI+eEmAiPViaiCRYYi6r52hIC+XLWVdn5rwHlbna/pWGh7AJ0L5vS0KW5IRH
	 uwk74UZBvwJzA==
Message-ID: <616e957ebb9d6606ccfdccb822aa0c42.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/3] clk: mediatek: clk-mux: Support custom parent indices for muxes
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 02 Jan 2024 16:51:22 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165127_862530_A98137EC 
X-CRM114-Status: GOOD (  13.51  )
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

Quoting AngeloGioacchino Del Regno (2023-11-03 03:25:31)
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
>=20
> Example:
> - MUX1 (all parents)
>   - parent1; idx=3D0
>   - parent2; idx=3D1
>   - parent3; idx=3D2
>=20
> - MUX1 (wanted parents)
>   - parent1; idx=3D0
>   - parent3; idx=3D2
>=20
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
>=20
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
>=20
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
>=20
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

