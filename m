Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80595CAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aqnxZVIrrJA4IYTRMrSAJlPuZKH6oOg92Ps9YHuKOo=; b=fZ3Y/r8avIn5ZDDGYsezjXZiH6
	aZEgybozaSKan5BFTptEh4FU9u1x5/HkZpPFiObZGWuySlI3YvzqQMsGHf69LT6pdvpJQChWOPum0
	NA+iFnR9NQxzsEV5azYf1r3esDCfW2w/dKe4Zg2rhSTGBTl7g+mM3EtikyBcxpmUFTm1CH+SgnRWZ
	fVqKZmtwJPsPtMlUlpD8xapBMyOM4fxhwkSG1rxadR0q8bS6xUeY3o3gNEzvR3rLoRCUjN0GMLFam
	aVX7GgkZ4F8OYvfu6fMlKdhCREr9IGQobEe+hlcQPRwglQErRJ+znz3vWKS2/w3zI1G8hRAY/EFqC
	pkToTjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLw-00000007rPC-1frW;
	Sun, 21 Sep 2025 16:55:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NL8-00000007qbg-2XND;
	Sun, 21 Sep 2025 16:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38DB644207;
	Sun, 21 Sep 2025 16:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D496FC4CEE7;
	Sun, 21 Sep 2025 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473706;
	bh=3aqnxZVIrrJA4IYTRMrSAJlPuZKH6oOg92Ps9YHuKOo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fhivRKPTQpjyQvCukz6mNbeBb+f0jkamIDLH6FP2v2I/h/mesFb9sxNRpVcvZiss6
	 tZ65z7tmfYOPMm49Bj7XyIbfvUiqyDJA8iRvOX8hWu+qQlVOcYgketzhZzB2ri0X5u
	 WkIDK+ydIAmg4B12fI0cAIT78wV8DMOLh+EvSADAp2PUje/mGgTh3KjrxDgEoVaCo6
	 8oTd5b8Gbl8zm/320sB6S96FSb2Dbmrz5H6lK7k3tK8iPEeGHDhEClKklvTUoaAFxz
	 yZ3hrwPmV+G6qgmqK20sonQeomfyLPKmCRGoOrl6T0tyVhWvzekoyVkQLoEyFCmt9s
	 3+qA6hGHIExDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-26-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-26-laura.nao@collabora.com>
Subject: Re: [PATCH v6 25/27] clk: mediatek: Add MT8196 ovl1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:55:04 -0700
Message-ID: <175847370443.4354.544247349627203501@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095506_681793_35E01987 
X-CRM114-Status: UNSURE (   6.97  )
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

Quoting Laura Nao (2025-09-15 08:19:45)
> Add support for the MT8196 ovl1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the ovl1 clock driver via
> platform_device_register_data().
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

