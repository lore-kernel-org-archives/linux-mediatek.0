Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2CFCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksmZH47dOUvvwWU8YpKXgQH7ifwlEkw270FW0y31JhA=; b=HTbLy2wFEhr9iYbCG1bf9zMX8W
	QpxpYZX7jO63AerBtOKlC6HIbHSDFrWTVf2H9mSZL8SnOs41pYuJLB7aMB/7XR6v/O0+SPzQUQckN
	sgm6TZHVQDKAg7K8DOVkZZh6js0fe/8PRlv2m1j9hk5VsdfKc2WClt2InFAm9olf/IXWircXwm1Rb
	lgB8i9l7ndeo/U2gvBOE7A/bGiEURzBSqyDgIetXLx650vX0d2W3kaVDaSZE8X2IDF3ORruPGiiZE
	HEhnKnCSrDfPLljF0Q5QWYHzbJgbpUkHtc5xPXW5yOh+gSLajWX/OCOTtxI8DNXsU/rssdbBAauWJ
	frLD1sAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLO-00000007qrk-2gng;
	Sun, 21 Sep 2025 16:55:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKd-00000007q9v-2Ulf;
	Sun, 21 Sep 2025 16:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC389601AD;
	Sun, 21 Sep 2025 16:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D6CC4CEE7;
	Sun, 21 Sep 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473674;
	bh=ksmZH47dOUvvwWU8YpKXgQH7ifwlEkw270FW0y31JhA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HyccR8Ttsd/W5KUyJbt8XagVWYQVhWqh2rGsfm5BZNLNzKsqtBvSxZxmwRfyXjk0H
	 30hLxk7ng3l2IAAlqzdWHVCIFHq4jgpIugHyyBfpSBk4CSPKf56A6lYO8Mfg0KZ+eQ
	 exH7+gX0+sJvePAzqsPtvjeAd0XvRCcvw7uwW2adj/ErIw3VpcZZYuBDd0MJHth+ts
	 ZH9MSNp+XFwsaTropNzl/iew8CZrL3Rg/FxtOwUMYkCjgo3LPspG7JgVj9ReJa52ZZ
	 d5/bT+6aybBBjzz7S+6/dWYW01gAYEorOVFbwNq7CMpnPps5748jERIfK95TfiW5q5
	 3KNgAxLJ07uug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-19-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-19-laura.nao@collabora.com>
Subject: Re: [PATCH v6 18/27] clk: mediatek: Add MT8196 mcu clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:33 -0700
Message-ID: <175847367333.4354.15922282572758969909@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:38)
> Add support for the MT8196 mcu clock controller, which provides PLL
> control for MCU.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

