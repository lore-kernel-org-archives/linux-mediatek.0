Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7065CAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoiCOQ20nTneneIaxwbn1XHFftteJQcuwFtemtIOqt0=; b=clh64WvZ7UTHbrxdeptP0aC38V
	Xf2SQLWmO/EKr8S7amgcMqntDdDYN1S1EuBsBrBLYI3dL3xAeTbFRnF2z3NtZPBZZ2aIRn/rMJWKB
	eqREVx11FQaQv4zNyHy9dpoOiJff5t//HzJ972AQ2bs4QdR06Mo//PqTquRTWTCzk9j2x46XXQNDW
	phwVNMwKEv21/Jvc90dAB+d8li5xAk2oqEPNXPIV+umwH1/C9oy2dFCqitXKyA7MzvsNdb/kKc0++
	OkKOAxN0R8G9Hm/vIzQL33yV5OCcAQaA2OmAbBHkf3Ku2TD06ASWbBVNaAFh3VqJ9UYkzLpAbDwL9
	VvSnx7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJd-00000007pEQ-3FuQ;
	Sun, 21 Sep 2025 16:53:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJa-00000007pBP-1f6n;
	Sun, 21 Sep 2025 16:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0156601AD;
	Sun, 21 Sep 2025 16:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562E9C4CEE7;
	Sun, 21 Sep 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473609;
	bh=HoiCOQ20nTneneIaxwbn1XHFftteJQcuwFtemtIOqt0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Jfe4nYY0pNIG5vQ0EIKKopwcXzYM1EgFqjnMpcUDDYMoO1eveSIJ3ECoTl7MKIHrv
	 WXDu4Lqe7bQav8VPJCUW13/IEV71pt/2LKHKhq0ly4ee5GJeXCGbiwebc1IMmrtaS9
	 ZEPNeHiOgA1U6APoahn5Xq/33OVuH3NioD+R6i4ra03d+MtEbzxY34mli4rTxA1Man
	 QZMQj0LAPwb5bYPaDhTJTv5F3bMk9KRA+RQ2XtVRShd4GQ3Qav48A2sqS1GhlxXrYE
	 /ZW/WQPSVONNl4H7EJXKKMdso2OE0H7gQ+KvgZMog7TZ0s5oXlBUdD5giJJYMUz7EQ
	 Aa548QbsqGY7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-6-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-6-laura.nao@collabora.com>
Subject: Re: [PATCH v6 05/27] clk: mediatek: clk-mux: Add ops for mux gates with HW voter and FENC
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:28 -0700
Message-ID: <175847360800.4354.17347591921715136589@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:25)
> MT8196 use a HW voter for mux gate enable/disable control, along with a
> FENC status bit to check the status. Voting is performed using
> set/clr/upd registers, with a status bit used to verify the vote state.
> Add new set of mux gate clock operations with support for voting via
> set/clr/upd regs and FENC status logic.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

