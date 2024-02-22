Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98110C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1t4l94yELDYZR6iDnJqPGq5TXMg7b84277zgKd4BYY=; b=Dt+QxB1QMWL0exT9LXT/YxVXLt
	OqYzvtFB3J7HCehT/3PySKkOW1gtpjygwGFD4ozSFnE/rae7ZMW06apT2mLPIdZc5rL+B7DJTOdj5
	j623L67XFGEDD0Xl0gHqaLe7sNKqYyjz43fLdWqp5iErTyCx5KwyxD4aaoIxWOUkS7rJ/+GNVua9M
	NlnlMJmhfwshwdcz1/ewu0gHsAYYVdNPH8i4qdY3YjB4khOSXQKOdL3bvTZBy2EBZoD36RJHKXnjU
	QDpSFnuAlyPw0vUSV3BrBZVxBa7IFaa4wd2NQ/r6FSpu1HiKFUsYiWvZkOI4S8RI0Tksx9fpYTdW+
	U+fnmFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd17q-00000003Wbf-144M;
	Thu, 22 Feb 2024 04:56:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd17n-00000003Wae-0T0W;
	Thu, 22 Feb 2024 04:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EDCD61702;
	Thu, 22 Feb 2024 04:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E99FC43390;
	Thu, 22 Feb 2024 04:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577758;
	bh=h1t4l94yELDYZR6iDnJqPGq5TXMg7b84277zgKd4BYY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CEeoHAkjGC3ivSS8PwlK54FmSb1FUb2WpLTX41AbIgtFsP5HBKEyqCeRjjfVvHE13
	 gFbNCUczcDeVPHpc9JVHMS6AvgjLYQVjJT8je61Zqg6MPrHNmv3Ol+l4jPeyusZ3ox
	 rWv2h0JkCmMSfff1TWv78hSXV48wjXHPyaeM1WEwFPo92v/tMl+O88GJNT8iqL1gzI
	 /yf/3b+Qm0mqrXlfjtEbtxRjb4dRM/oj6lLGRQjgAd+J4CsrNP3H9DPl0LKtbBWLF4
	 Mn0qjRD4tYKDh2ojHeoXBweJme4/F1YRmndWYFTTRITqMW96Y/PkRB0+7L+vHoel+7
	 u/ovmx4j634SA==
Message-ID: <f91b8141d7edab4d6cbd3cb464ccf3d7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fc157139e6b7f8dfb6430ac7191ba754027705e8.1708221995.git.daniel@makrotopia.org>
References: <fc157139e6b7f8dfb6430ac7191ba754027705e8.1708221995.git.daniel@makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7981-topckgen: flag SGM_REG_SEL as critical
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Jianhui Zhao <zhaojh329@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 21 Feb 2024 20:55:55 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205559_219427_5F4739D0 
X-CRM114-Status: UNSURE (   9.22  )
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

Quoting Daniel Golle (2024-02-17 19:11:15)
> Without the SGM_REG_SEL clock enabled the cpu freezes if trying to
> access registers used by MT7981 clock drivers itself.
> Mark SGM_REG_SEL as critical to make sure it is always enabled to
> prevent freezes on boot even if the Ethernet driver which prepares
> and enables the clock is not loaded or probed at a later point.
>=20
> Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

