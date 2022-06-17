Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 00:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQeVB00AjJrbZT5b4yd3bF+T7xqW+4EKimhddU+zKSc=; b=i1Z8nLxmf0PHtQ8XlWMyycDypM
	kjCORfiJIfbqGeesCjUIUdUWf0K8MTMv9Jki6YB0XxAg7WT1LnKfJuKQZuJHmzGS2E0RQMNfQ+T4I
	7J9yyMfH3dcjT1xV/o/OWAzE2xkYfV3yQj29On5qHUWpfJ69Oeb+pACGgKq4BQFvT3/Md3U7q+emA
	pQmjdnGdkO+4XcFRK05/tl9Rftc6T8UAKFhmLhtTHlT5+je9ooO9BX6QDgVY0U8W9zIS3E/PCVUOv
	vU/jBH0cLS0dWIKGgAPxGN0C9aX4kt2vvcrIxyR/pbYMHxkazXsjn40Cu7uDg5zoPjEStVht64Rxj
	7GDkLKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1zaX-004rNC-OM; Fri, 17 Jun 2022 00:11:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1zaM-004rM8-B0; Fri, 17 Jun 2022 00:11:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2973B82688;
	Fri, 17 Jun 2022 00:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD0CC34114;
	Fri, 17 Jun 2022 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655424694;
	bh=uQeVB00AjJrbZT5b4yd3bF+T7xqW+4EKimhddU+zKSc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oJ1o0qOkIqjaahotZjelLA95CRGSCBeyUZCf31ei/1X/0WSeF0ZKdDuayhIRGRJaN
	 6j1kQcUVqOjkYoKEw876rX7umHBVYVEBNJwY24iO8e0Yw7YTCBu71WcIRxPo6hldkU
	 qpwPiNw/XYPAUnoX6TGRaeru4wkyTjt7Bm+EiSkfrDnqRCAKBKUBY1FPvHtx7X5IYp
	 wYKZfsJgBT5LsbGLO5L/VPtlxW2yDXypTR8NjdFK3+9M6mD9Qp7CUE7123WMclPqVx
	 /2Zgj0GtMcEnyiA89/ZeAgyCEhZb0S0Ug+cYCSAcgkDaNSwMaJczKIJLGsLfjaIJJ+
	 vWXbe0S3qEFfQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <88be9f00-2b1a-977d-dadd-95a131bf7f1f@collabora.com>
References: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com> <20220616024442.1337EC3411E@smtp.kernel.org> <88be9f00-2b1a-977d-dadd-95a131bf7f1f@collabora.com>
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Thu, 16 Jun 2022 17:11:32 -0700
User-Agent: alot/0.10
Message-Id: <20220617001134.9AD0CC34114@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_171138_565461_DFDC3ECA 
X-CRM114-Status: GOOD (  12.96  )
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

Quoting AngeloGioacchino Del Regno (2022-06-16 01:48:44)
> Il 16/06/22 04:44, Stephen Boyd ha scritto:
> > Quoting AngeloGioacchino Del Regno (2022-06-14 02:10:20)
> >> Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
> >> clock: this is required to trigger clock source selection on
> >> CLK_TOP_EDP, while avoiding to manage the enablement of the former
> >> separately from the latter in the displayport driver.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >=20
> > Any Fixes tag?
>=20
> Backporting is useless because there's no DisplayPort driver that support=
s MT8195
> in the previous kernel versions, so this clock (and whatever logic behind=
 it) is
> unused.
>=20
> Though, if you think that's going to be useful in any way, I can add one?
>=20

It's always useful. A Fixes tag doesn't mean anything for backporting to
stable kernels.

