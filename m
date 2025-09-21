Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B97CAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhSkOie36LNjLhZ1e/3xKgbbnV6rCK0CBBCBJjtXEl4=; b=qbff6k/pJH6H5x29REKzEqfu61
	EpOyudp3DYe8G+mkZnO7HZpSyP0/JcdivuMmEAr+YkKzTwIWeOYpX7DUW1Uvmkg3VYRe8ipT+Mtwm
	LoatQy/HKn1Co8sOCRL59od/DinDHKPqAfUozb5NjeWBA4CWjem940j3E2FDLbAIHgkvkOcM835iJ
	QCCVgjJCP/17VSw/T3sJiwN4LrOuBryz9eXGgIfCLM/aZIh3uCrWHkfEz7BCjajR+aE7dm03yzH1h
	DqEKarSPxu4H4jmGqa7ElymgVFi+hy9kucsr6ruhbn854hs2+JpWWCqNQex5kfuKdzqBNpMP/82Xu
	URowtfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJt-00000007pSG-1AyC;
	Sun, 21 Sep 2025 16:53:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJk-00000007pKJ-0hva;
	Sun, 21 Sep 2025 16:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 951E1600AE;
	Sun, 21 Sep 2025 16:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB25C4CEE7;
	Sun, 21 Sep 2025 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473619;
	bh=mhSkOie36LNjLhZ1e/3xKgbbnV6rCK0CBBCBJjtXEl4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nlYZlSPRA3rDVi0b9Jl1NP7yoCrtiWufi9T0NPvDbUYQIEeDzKC76OOanlNKGwm9G
	 rj4pGCUXYzQePp/DqDQCb8P3AB1Q/79U+4m7vHDvSHhBARqOG80HpeEN0uJAfpDLaf
	 7VDIvTnmgLmlhJzBznGrv/rhZgwQkfh/rw3VhKezofbZXNbB2kteoLUs+dvmRisrjC
	 URMKmVv6OyR1/RPynpnavFzyxK5p3F51mhwvMT9PMYIsbXH7UTHAOnTeKIUVVIgRMN
	 7UiKXcKf3W+FCRRuJZ3FvVyAOc+tPFcFgcxMT4c2v9K3GFFOi1Ivm4vRt8Ldf7UaR3
	 japFcjxedCUhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-8-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-8-laura.nao@collabora.com>
Subject: Re: [PATCH v6 07/27] clk: mediatek: clk-gate: Add ops for gates with HW voter
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:37 -0700
Message-ID: <175847361789.4354.2149769507345484400@lazor>
User-Agent: alot/0.11
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

Quoting Laura Nao (2025-09-15 08:19:27)
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

