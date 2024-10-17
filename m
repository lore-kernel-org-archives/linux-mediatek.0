Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BBBD3C52C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 19:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E89hryLxgKiF/GmdeFH0jIvDQbgZ8NL6L5dKM51hM+E=; b=PMs3CjSwXAhGNgDE0ITsF5yNPl
	fwzhBlfXkOh1jzCvD9HfQJtmktRA39klBymINxQ9Fh1jkSZSg1wlnmvieC/iLDqIgxY5Tann/Bc7a
	/zC9AO26eikKOF+G6/0OXcipS+LfCWl3zl4KbULaomrtpH9j46x1LsOhmRB1wik9/94XYS7MLk8Ft
	GPEWpYPXqLcaLgit8y5pdZG9eUC8iuZWlyN5T8SZgQnbvk0Tl3rkjls53bVq2PyXynnObN/HQoY9I
	lG77zBmvErEN2UfD6UszLqZ6WOtX90gSGZ7hq1FbEDy0pAGYoZkowwqP29VGRtxgvCdVCH72KksLT
	KwuU3fyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1W8t-0000000G1kF-2Ryz;
	Thu, 17 Oct 2024 19:26:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1W7Q-0000000G1eG-0R3t;
	Thu, 17 Oct 2024 19:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 938D1A40E2F;
	Thu, 17 Oct 2024 19:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F66FC4CEC3;
	Thu, 17 Oct 2024 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729193106;
	bh=E89hryLxgKiF/GmdeFH0jIvDQbgZ8NL6L5dKM51hM+E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tdVfDNpI9yLmY7DxePm14sqBwMo5ii05QPABekiRvSI+nObMfBPAUUubx78jTxvuS
	 gmzdn0VjgdJDAz1bcfFdPy8DWMfhzViV06rQYw5+ii1OujVrlA9oVj7EZ1kLaL6oLg
	 arSXURs+JG8aBP4I5xpuTL6EvLXqG3NwsJWiz4vq1QM524fDyKaGWyzGglDq57VLTO
	 Zy5UvHuOzQAVU+h5HQJtS+QIBMsiwPbGLUi5JQX4Pp8PA3+yoZvaghoyLvJHfXapZN
	 swh24zJetDqkNslAKHJrfU/RGkPmE38AF/Cq+DhoVr1EjRVexqbdPmGA6PklzxsVC+
	 D5Nc+EXSudn7g==
Message-ID: <d1b1c3cfb6b97c32aa63a07d3468a1f7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241017071708.38663-2-y.oudjana@protonmail.com>
References: <20241017071708.38663-1-y.oudjana@protonmail.com> <20241017071708.38663-2-y.oudjana@protonmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: Add MediaTek MT6735 clock and reset bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Yassine Oudjana <yassine.oudjana@gmail.com>
Date: Thu, 17 Oct 2024 12:25:04 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_122508_235159_66997FF6 
X-CRM114-Status: UNSURE (   5.99  )
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

Quoting Yassine Oudjana (2024-10-17 00:17:05)
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Add clock definitions for the main clock and reset controllers of MT6735
> (apmixedsys, topckgen, infracfg and pericfg).
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

