Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E78CC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 23:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynSaXkMrlyIwU3AUNaTVV6sq0corcvt0FuiZXolCPT8=; b=NdKmyRA6DMAPDf5tXWnM+VIN30
	656hyxZPHfXYyaNAQ7edRBEcTYvoRdgxIL6nW2XWSox+Qk9a/VQ1PzDrERTtRAXFHvbJ0M945Q8y/
	GiNrwNNj+b6hbK9fRGLyIvivjLJXfdcaFdzYKkTuGcEsOe175896/f66YP51TXW2JxeehxreM0ZOU
	pMibg4JXgVWlG+NkTK8b/dzo0HfUHJhRxrHH/L6gFs+y4jrgGzEn9Wj6ziuV3NO+67DNRWXqhMJNs
	Yy35c60zuI28b+FJnOUP2wvvFVFl8ts4SrkSW4nA6XO9KcaRQxfu0W83yYLwkc71y1cPWIINHZ0SE
	19SXd41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQcRx-007sFC-FI; Fri, 10 Feb 2023 23:05:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQcRn-007sDQ-4A; Fri, 10 Feb 2023 23:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8E1EDB825E4;
	Fri, 10 Feb 2023 23:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416C3C433D2;
	Fri, 10 Feb 2023 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676070288;
	bh=ynSaXkMrlyIwU3AUNaTVV6sq0corcvt0FuiZXolCPT8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GhXyb2TxZ2alj4P6jiGoTXLb7HEbaoISdiqSHqJ1jT0uQmftFZ5zaO8+KdaICrhpc
	 Cx4ZXVmupqGxJz1+n+TQ7eTZF0TSvjRbrtVV6KlwpSm1pZHiSh6C5IJuZlMpZciTZE
	 PggBvBtOIbVWVjk+ww5bw4Dkd5486TDwkC68XAVFkolHDdJPeqhwjjbBtbp8jZU8cE
	 Hs/IOZH6j/ll7MyDBcT10pxZjKe8XbMA8pM6T9epEekyL/u4mLbiWFr52zQLFvTs0I
	 ngKah+wHawOrmOX/0FNOfqZv6x42uOE5pjY8Xyh4+dJNN4TmIHV4ld6gZq4KdbPNHM
	 PV5pGh07wBNJg==
Message-ID: <dceaba1f6d628e101430fa643110654b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230103092330.494102-1-wenst@chromium.org>
References: <20230103092330.494102-1-wenst@chromium.org>
Subject: Re: [PATCH v3] clk: core: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 10 Feb 2023 15:04:44 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_150451_336121_7307F95E 
X-CRM114-Status: GOOD (  17.62  )
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

Quoting Chen-Yu Tsai (2023-01-03 01:23:30)
> In the previous commits that added CLK_OPS_PARENT_ENABLE, support for
> this flag was only added to rate change operations (rate setting and
> reparent) and disabling unused subtree. It was not added to the
> clock gate related operations. Any hardware driver that needs it for
> these operations will either see bogus results, or worse, hang.
>=20
> This has been seen on MT8192 and MT8195, where the imp_ii2_* clk
> drivers set this, but dumping debugfs clk_summary would cause it
> to hang.
>=20
> Prepare parent on prepare and enable parent on enable dependencies are
> already handled automatically by the core as part of its sequencing.
> Whether the case for "enable parent on prepare" should be supported by
> this flag or not is not clear, and thus ignored for now.
>=20
> This change solely fixes the handling of clk_core_is_enabled, i.e.
> enabling the parent clock when reading the hardware state. Unfortunately
> clk_core_is_enabled is called in a variety of places, sometimes with
> the enable clock already held. To avoid deadlocking, the core will
> ignore readouts and just return false if CLK_OPS_PARENT_ENABLE is set
> but the parent isn't currently enabled.
>=20
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

