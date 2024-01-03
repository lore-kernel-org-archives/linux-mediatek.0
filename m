Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F36C47074
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iw4D9K6H60zW9yGTucSNQ0sP7AfAVXzYnq7+xAS58UM=; b=k2BH1ICS51xmA88QmDlAzfMRFH
	LQfWGiNUTOp+7h5D3HCOis2f1Ptrh54i4QMLCWzPTETmF2BRHETdZsci06jHSmJwbEgxj46GYTujL
	CJ0xnKB7orPQq/RqePgTg5saS1X2LuNKeMoxLysACR1VTCyoc0c278U9n3aCWONUVnZyVvDnXzsyC
	hdUVMS2LMD+5J6ZSLuIlOJdsGdwBwxHkXW9BeYPYRChkkwrySPFaCeDN+Ktn9JMF6XqrvyILdwuOG
	VrT75zXFoD3Nj0sG/hkrtiIlWDWGxROcQciTIw6t5afyyrzQaBedDeQmN06WtbdfuoNckOsbipdmA
	3EipaudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpTx-009Q7F-18;
	Wed, 03 Jan 2024 00:51:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpTs-009Q4Y-2r;
	Wed, 03 Jan 2024 00:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7E8CACE1292;
	Wed,  3 Jan 2024 00:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA994C433C8;
	Wed,  3 Jan 2024 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243093;
	bh=08KXlXgNZeakwMogHdMN3HKZsxc/azSBB+WAxe4fQKk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YFYMYv4WTcktJ/dyY3MCx1mzQl2yO1WZbhlk7IVHTrRRd+mQXC8UOQKL7efWNbxZG
	 Wbx8Mw2PxlYyOGLOKefA8mEDZjp5yonW111jj/HBZwGNPxt0mlZOIocd1Cf2ap2yuf
	 zi/TicIK9UDpvf/nHYAhusU2ELOnhybZL9vMGAMTtO+EwtlSh13OgJ8OcjcvBAef5w
	 o0LhbK4ZXZXyLs8IUFoJTdbjFGuayp3B8DPAquUhnF8MXRVc2AkDMUXdgl6vguDnu4
	 6xlYz3LvTbalpxjLGDbo7OvHMovs2BQlBf4eO0dapXLqmGCPoJiDiluQOALe7A61I7
	 aewQOFXaBGttw==
Message-ID: <f2fa34e137bb378f88a0a375f4044e50.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/3] clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 02 Jan 2024 16:51:31 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165137_157494_13D64B78 
X-CRM114-Status: GOOD (  13.08  )
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

Quoting AngeloGioacchino Del Regno (2023-11-03 03:25:32)
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>=20
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>      - top_dp is switched to TVDPLL1
>      - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>      - eDP display is garbled
>=20
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>=20
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

