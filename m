Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgTcDpizcrol31kI3z1bE6BMZRsY+LB4+luSilFgQJA=; b=2VDqA4R8CY0ZwmzVyRo7vAXT0B
	1bg29Wtwn3V/kMiwvaO1koWG2Qh/esL867x5g2D2l9ELpaL5/J0GbE0W18wP/J+pmuhlfq30th1qZ
	Jgfcnw1PzvIgYMcWLc1OapzHkoLk12iu62Ac711BIVe8NjZIH1ugIyC57woYk/eWAoorTWhy8YEpT
	M6Y6B79ZS2QM8F+FpLUrnTJ1C5ZCksQs6BixY08L/7GUMsaPlRpM303d081V6wUutGcIM3fWL7AKQ
	kW7hZjzctosuAhwHtOO7UG7YFWmyAc3YcNyyNo2U20G40YJeeQfQn/F5pD6dG8oGwMIOoYF+5PM3e
	La0oiClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eiI-00HTyt-Vv; Thu, 16 Jun 2022 01:54:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eg7-00HSkz-GJ; Thu, 16 Jun 2022 01:52:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D666561CF4;
	Thu, 16 Jun 2022 01:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2FFC3411C;
	Thu, 16 Jun 2022 01:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344330;
	bh=CgTcDpizcrol31kI3z1bE6BMZRsY+LB4+luSilFgQJA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eP8woIkYOO0ZD8NdaymgnGSiiK6QRBl0QCSvSDimFOjwCLEV4LjghdtavjVqOVqpU
	 IePb7oYDGzEuQSOAFzSPRJD7Y5kCP4wnfJ0CcdmWVVQCHkWc8dorvRvFq7b9XIuGt+
	 lT8FDPPpCdWKK0fVSNA8gjmyV/hQb2kMsnxEY2VyhBiShX6xvAf1EqTBjNKCAmjhg6
	 A9dEPftNOJ+H2gsAqGDBzA/t6vVv77H0Orwgh5Q3t0macdrRi0Ia58dyIPHOTcDCa3
	 XT8hE6VZjM6HTzlzd/jD7XlxgLiseSUzf8hjDpcVrmpLadCRfgAIH3qlGMoJ6ax8cy
	 0+2zMHG8b/WRg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-10-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-10-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 09/19] clk: mediatek: reset: Change return type for clock reset register function
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:52:08 -0700
User-Agent: alot/0.10
Message-Id: <20220616015210.9B2FFC3411C@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185211_714485_6915A252 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:36)
> To deal with error handling, we change the function return type from
> void to int for mtk_clk_register_rst_ctrl().
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

