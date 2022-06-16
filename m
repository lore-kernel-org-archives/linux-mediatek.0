Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXVq+gEWnI1UliJJ8cBU8oCRyLrcMuv/4bp+BYrgWDI=; b=AP54V0JmDeV0c00YDWqVBWdeaX
	+Wy4D4fKY2yhPp6CcGMOhsaoaBIzOrau1wy75E/SlEVyW69NvV78WMHtRd8dnuLRPYb82BCJ67xH7
	et7hl0wXmCTncZAfLWeWMeL4Mde6mgd2n4Ci+oLB/HlF9zMHxbulXLSg9RU6XxTQ4qrO1vDvaRSHz
	qKyeJJ9N/mQepMVfD7DQ5zb/okKN3aGarmiwG3gkjfZB70txj5ywI/4pplSF8a946fOsHcqUra6t5
	rIW/v9AdNydgVybNesm9SRu3bmeLhrRNnzB+ZLvTnjFm7G+JFvZlT9cG5B4ciznalkBcd8aH8h7FQ
	QCn2yhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eoo-00HXim-FA; Thu, 16 Jun 2022 02:01:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eju-00HUyB-N5; Thu, 16 Jun 2022 01:56:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9B226CE22D8;
	Thu, 16 Jun 2022 01:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA74BC3411E;
	Thu, 16 Jun 2022 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344563;
	bh=lXVq+gEWnI1UliJJ8cBU8oCRyLrcMuv/4bp+BYrgWDI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hpe9fAsZEarEMYmYXhBOQTGz9DwY/naeoXAe90YGb799P6k+jVVEumWMtjh2BXBLG
	 nvoy4rVhcKPH87IRDuCeq9SZZZDorNFzP1PITHwRxdEcPS29UStnshtMMNi1k1QjAZ
	 PRNT1Kp4Ie2r4jzIjeyznQ4e6N4MIe0GQ3z63Ha8Z4Gehw08bKyWrhylP3j8H+RmfR
	 VY8P0MVP1n7zwvyM0pR7tmB6WLaBAE2EdqRTs5X3kUdzFMl9RA2qD1mPVN4Yl7KJEQ
	 REBfP/urP/rpqV7tWxH2fi6FA/I++w5r+LVoj1SyVG7whz3L6ADiBkjqUhj690tHIV
	 7m+HfBSUAPxCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-20-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-20-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 19/19] clk: mediatek: reset: Add infra_ao reset support for MT8186
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:55:59 -0700
User-Agent: alot/0.10
Message-Id: <20220616015602.EA74BC3411E@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185607_011684_924C57CC 
X-CRM114-Status: UNSURE (   7.92  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:46)
> The infra_ao reset is needed for MT8186.
> - Add mtk_clk_rst_desc for MT8186.
> - Add register reset controller function for MT8186 infra_ao.
> - Add infra_ao_idx_map for MT8186.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

