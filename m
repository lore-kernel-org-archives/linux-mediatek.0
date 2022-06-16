Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F4BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U5Lj/b/Nnw+5T77ExxngXXDFdxOraiwkpEje5p7KTU=; b=oxWYEZMlawxarGkgCRTnZW5Frz
	FUrfoAr4z5m+r9h/2byXtHwISFuysPqfbdzgLX+CtnuNViRNtrNW3o0eOxrgKnu1UI6+1PfDVzGZl
	Uq8/eoggEwPKg45ommARSgEsIIsEjx2Vom5yFigh1LMtLTFSJkTdPp0JK6nOpPlyzXBhoeC3uY1st
	zReOpduicnFv+lTCkGcs9lrJ0TeL16UR7f/6RLqSMpTED4FO62Y6zD0p8wXZiPDiOMfNYw3duV552
	IcB5numo56YQ38OXskFA5WG5xj19mm+X9WgvOP3H1I5peHwAgOYtxy1IEXAjLAPK8UYNrCXB0Nw+k
	3KzFgS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1efk-00HSVZ-FQ; Thu, 16 Jun 2022 01:51:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eez-00HRzq-H4; Thu, 16 Jun 2022 01:51:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9589161CDE;
	Thu, 16 Jun 2022 01:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68FAC3411A;
	Thu, 16 Jun 2022 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344260;
	bh=4U5Lj/b/Nnw+5T77ExxngXXDFdxOraiwkpEje5p7KTU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CtlotVeT91CLGG4UkX+Gnwkhe1AIRE5ubXXYSpecAlUEGQ9SjZEYZkLGdSRbGVCOT
	 3aycrxRrgAOHgxXIIGInEqijPmvJbuO/48ZDkce4qnhNa6xDRMHE9dXK7tE9K44hnT
	 1fikloK8vPgcZGR272scLnjvK1VgD5weJnl3dMAiWYoq4bDo1a0hDX5sMocq1ziii9
	 1gngOsjsyJWA3oK0QTl9Gjmddil6Ifg3q0zRgosDN7RWI/KcsyBicEb93h3na61Apo
	 TXKLyloEB8iIWnLKPXq6M+uQEmKH5vDZgur33S4m0Ac+NCLTBfCDU/gVj2AK663mou
	 YBwWyta05xgkQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-5-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-5-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 04/19] clk: mediatek: reset: Extract common drivers to update function
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:50:56 -0700
User-Agent: alot/0.10
Message-Id: <20220616015059.E68FAC3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185101_667172_8D07BEB0 
X-CRM114-Status: UNSURE (   7.18  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:31)
> To make drivers more clear and readable, we extract common code
> within assert and deassert to mtk_reset_update_set_clr() and
> mtk_reset_update().
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

