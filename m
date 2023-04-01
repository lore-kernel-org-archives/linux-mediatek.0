Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA2C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUMl4Yd3BPeD44p7DoTuS5zVzXdTlUvchiZrstZxt8I=; b=496WgzQuCjaMdQKtZ6f7DaEMl1
	EzMpvKA9d7l+PHIviqBEFy9239dHwotI1o2ilz+7In4VkEhqeHNf5BPFh6wI/iBh6zvK3oOCjABjo
	Otf5cQ0plHQjgisVyGU+YVq3mayoqtMw79YPG2H7BX1n8SxA/1M2bZxknYimIxAcIc1jQOMgBcWrm
	h1Mrb2g/ljewO6DrSpq69xQ7mDDBvarwvsTek4hQeEawiuXQHgMNv2EpB+7qFv2yV+1R3mB/6F3Cg
	SiydvO+7kbQjssifZKjb+2Vx5cBdBFrmjwV4rJwseZ9Mo9Y+LyLDPbUdtnA6GoHN3ZQK5jULk50QK
	tkI2Om5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgB-009EJf-0d;
	Sat, 01 Apr 2023 00:01:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOg0-009EF2-1W;
	Sat, 01 Apr 2023 00:01:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2667FB832B6;
	Sat,  1 Apr 2023 00:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC3CC433EF;
	Sat,  1 Apr 2023 00:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307257;
	bh=HUMl4Yd3BPeD44p7DoTuS5zVzXdTlUvchiZrstZxt8I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Uj5yDn8FgHN5azN0fo2esp8l0YwuxXF/H+NQBQrSjKpg1eg4/QiUe5oYd1RBHdqGR
	 KQeIzaAI4JUqAGg94xn/5uJyz1m7dUdD8UEqS7ebnXQwqFadnDbr8vZVWEgneU9S68
	 x7JNoDlqLl1IUPM7+arWgKMouh3OY60hb9b1/z04J6/kpGyV2YucOr5vgCGwNYSAQg
	 /fAEt+dFepESXDNKMypZebKl7zssB+1sGYYcci3jexTsD8c22zQn/UWO1GltuZ70/v
	 wkHi++QRkRVaKIk/DhD3eD8aldV7uLO40WodpfsMT+Q6R3mFGkzR2AZjFc5A1+m24v
	 9Qs27yLN3rpeQ==
Message-ID: <5511b6e4f1b005f73971bb6ccf72a4ca.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-4-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-4-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 03/19] clk: mediatek: Add MT8188 topckgen clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:00:55 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170100_652122_426EF910 
X-CRM114-Status: UNSURE (   7.34  )
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

Quoting Garmin.Chang (2023-03-31 05:36:05)
> Add MT8188 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

