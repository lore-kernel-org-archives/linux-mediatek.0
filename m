Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3QbSgTpT/lJaF9OZNj0NpBPH0eQdEcrhmd/UK/j6Yk=; b=AhthhbDmXdtYY9o868Cwp+pUJ9
	5NLTA8g+jOjpxiBl6Y2/KhdwK8q7nDyQz9/49mkNFZiv3dpNDzgwLKHlYwDjfSDardpsG6Ho9yD3O
	bVFiR9tpMMFJpMqo0Fw5jzvrZQCc2H2Zh514HQPQkpCXFtL2Y8o67i7MloHbFT3XUYub3Vp8gwul2
	zlbeUoiysBUlydHqrTmaTPXXTbegzFn78p5gGb2Syc1p24IqrfMTF0NO5KakFYse0NchMS8yT7H/z
	VnhbjT0s4ZapOdpyXl5OG/MjMfZfeDhLgBePjTtmGd/wvWq8Z1zlRS1sfVZmGfrNHX2eRc4XQnVZq
	iJpa0Zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1egX-00HSz5-M4; Thu, 16 Jun 2022 01:52:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1efS-00HSKB-Uk; Thu, 16 Jun 2022 01:51:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7976061D02;
	Thu, 16 Jun 2022 01:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5697EC341C0;
	Thu, 16 Jun 2022 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344288;
	bh=VHGuD3oUIVDRtnrxF+nkSpDbHsE8XAqaQQ+vQslwz24=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JBkr00yLx65g8QqtPLDb+l0cklP3maYgekq569wr7R3nmYSO1gLOvXunnsrAEZdiH
	 AzmlXp/SGpXGfX9MLqakAzE2az8Shk1BGKg+IoPgWR1KQ/wJHjn6LghRyx7lG13EEW
	 ZQQdCwGnZJw+HV4l3wOrrCqM10471yTtKQKrzWmvLMq5ZaViqJwMboJdWzZsQ4Ir6C
	 G4NZ1CwP2Xz01PHkKO4LdwiMOgSOsLd9q0jV2Lgp+BHgUx76wCsNkE260NyjBZNcbI
	 NQ+9itvcbWFDXwBrc60FortDi/gGWjVDgrcbj1fukyxpL2BnhjgpDNhe00HxxAoRC4
	 y53lDX23NWIvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-6-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-6-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 05/19] clk: mediatek: reset: Merge and revise reset register function
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:51:25 -0700
User-Agent: alot/0.10
Message-Id: <20220616015128.5697EC341C0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185131_062959_664D1B6D 
X-CRM114-Status: GOOD (  14.91  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:32)
> There are two versions for clock reset register control for MediaTek
> SoCs. The old hardware is one bit per reset control, and does not
> have separate registers for bit set, clear and read-back operations.
> This matches the scheme supported by the simple reset driver.
>=20
> However, because we need to use different data structure from
> reset_simple_data, we can not use the operation of simple reset
> driver.
> For this reason, we keep the original functions and name this version
> as "MTK_RST_SIMPLE".
>=20
> In this patch:
> - Add a version enumeration to separate different reset hardware.
> - Merge the reset register function of simple and set_clr into one
>   function "mtk_register_reset_controller".
> - Rename input variable "num_regs" to "rst_bank_nr" to avoid
>   confusion. This variable is used to define the quantity of reset bank.
> - Document mtk_reset_version and mtk_register_reset_controller.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

