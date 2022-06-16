Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085CCC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tybOX2ZUq1lkkdmlC+t9c+9BDKLoV6q0HGEOURZYcw=; b=IQ8A8nNzMBbSBvNliIBs8gHP78
	uDwCERGLiG/C2LmFKGhyiPRuVy1nT52mvMVaYvDG5WT+M+GidZJrnuxfPElvQXAcZa4gNpOgSoYIY
	B9cLhztGCeiAHnblmWO5OiK5SmBF4MnbrxJS4kw0tvfKnuTNpMBZRW9C+IPh3oTELn1L6MHMaH1g1
	AAWajiOGS1/DSr9mHlg+wRioGU1zOwXXg0rbJxdhfZGzio4rf2BgAVO1ZxdyusnSuoLJdns+UKuLt
	Q7AD1rJcma5Mctum0QL+bu7/2ocPmD7CqYkITxmxXWhKZXmYNoEqOzRpDp8Ka30wHzd/FXAmG/uMD
	NDbcNOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fVA-00075H-Ay; Thu, 16 Jun 2022 02:44:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fUy-00072x-V9; Thu, 16 Jun 2022 02:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7187CB82202;
	Thu, 16 Jun 2022 02:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1337EC3411E;
	Thu, 16 Jun 2022 02:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655347482;
	bh=+tybOX2ZUq1lkkdmlC+t9c+9BDKLoV6q0HGEOURZYcw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZzFIFIqi1MdnlLbUz0m/h8wJ/XgZtDNARx+EJ10xb7IC3HXW7ovy1bUvGYEmCIvQk
	 buhDcMgynemjSh/s3EkbL6E2OiHedz6cR6iaMGcdTsC1n7UHuYa3NnnIlN6r34Pfgy
	 rpOZZx7bv4DgRQsXTgtzKa4QhZ0coTpYKwHkkGWpYT6FR/bHLEAudLQ+Hf/9wHyINR
	 yNFNRrBe8M5dJ4q3uSPY8rZe841F5ZXnju8DuzM0RHy83Kqb7Yf+9rtYDvZoIHu3qa
	 N4AlMW2N+QXY+alSqJm+/onS7eoX5aA2nyPfaS5y7BWTmQnpA5IhhFWNOMbTatXE6i
	 k/adjTWR9u5Sw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com>
References: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 15 Jun 2022 19:44:40 -0700
User-Agent: alot/0.10
Message-Id: <20220616024442.1337EC3411E@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_194445_185342_7BF0D643 
X-CRM114-Status: UNSURE (   8.06  )
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

Quoting AngeloGioacchino Del Regno (2022-06-14 02:10:20)
> Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
> clock: this is required to trigger clock source selection on
> CLK_TOP_EDP, while avoiding to manage the enablement of the former
> separately from the latter in the displayport driver.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Any Fixes tag?

