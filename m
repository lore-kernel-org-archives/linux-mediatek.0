Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E365AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qCrPucC3JK+fYu3hWuKG7P3Nf0KKZKQWh5F+1cXFX8=; b=SBgV93fICVEK8z3f1HJpXaUIIh
	X3cb7zbThgTDkiZyI4TAs8F1r/Vhpb/iiSF9GwyXkj8HGWEgdBAUVP19cqkmGXPtX5OwuXjSbd82R
	W2tXcSgpjBu0L800K6DCBUozZPm39XP5g7Jd0abhqkBVt3eS6SZKSRuoTixSsqVSDffBbdoNZ7SPW
	4iYDF8BHTYvYPo1P0BtvlbQ9OalQNumA4z1Lk2Dbv6Rf0r1RVWNGO49yop7qsTAP66L9RkeSQYqP/
	3eRoYeyrXiuxGrave47brrZ1oYiu8psOwIqiD01rsZrej/qCp8ZQzjbCp2dNe79BfWvLf8ah1ihHf
	7AYWHt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ens-00HXAf-Qu; Thu, 16 Jun 2022 02:00:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ejg-00HUpn-OO; Thu, 16 Jun 2022 01:55:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B5F7B82262;
	Thu, 16 Jun 2022 01:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36508C3411A;
	Thu, 16 Jun 2022 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344548;
	bh=2qCrPucC3JK+fYu3hWuKG7P3Nf0KKZKQWh5F+1cXFX8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I65GcgDIrl4CcSvK+uk8w9piAfvRWP+RqcYJCBrtR1MoDkgN4o+0WByYM1GzcGYmh
	 rwNDGc4SIyzlhTQqSLqUVracmpnxagNJbho9mU2xhf1jNxlWZPtOygsh90heU+aUBq
	 Td7PtNHmcEKpPuIdoGARxHa+THYlzUKS3bgAqI76NiSoB4LDOKeJo1kVKAnjUau2Lu
	 nOv91UUgL0pjkI6mTMB110ANraZtst77Tn7ehkHsG/4xM8yDbQB2QIViMLS0rw5/Uq
	 dz1u8DhVATU1B9OUeeWNcOF+4+BIrg0SGt0yjSdJ2Pp71+/a0sdKljTIEcPeeaXMBL
	 nCVspYszt7IIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-19-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-19-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 18/19] dt-bindings: arm: mediatek: Add #reset-cells property for MT8186
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:55:45 -0700
User-Agent: alot/0.10
Message-Id: <20220616015548.36508C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185552_963805_1BCE5942 
X-CRM114-Status: UNSURE (   8.16  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:45)
> We will use the infra_ao reset which is defined in mt8186-sys-clock.
> The value of reset-cells is 1.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

