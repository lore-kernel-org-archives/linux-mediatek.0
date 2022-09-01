Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB48ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 01:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAy4vnKZ4o7EIwTguBOSNqO3XFi1b+036gmfNtJIiAc=; b=NKPs3lw+7Ydy6RrVOWmj409YBN
	sJYa378gxbnvm+y/cvefByUHkF1UvOfwIjKE8gHuaTylq4xfLNt4bZohwb/TsZ2So3mgkI/AO39oB
	KlWHt0NF3DXXhiynPUKRcSxWn68nsjnjIZ/TN/2/zn4PCpxc9c7Zv2T48CN6vh6fUZPzti4k0Wr93
	NdExQnfcJhD0zFFvMo6wyaI+FvM7t/3M5RicgSZHpOC6gFY5ILzNeDFDMuVMheRTAkJcQiDq8vF34
	sLyeJlWDvdGkkIToF49Gwytxir71j1lIHbrYPicwRmPnzpLHUGOOi3upfeYL3Qs70/xAAN8lAccLx
	VXvnT8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYpj-008t3p-Rc; Thu, 01 Sep 2022 01:17:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYpY-008szi-CM; Thu, 01 Sep 2022 01:17:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09B56B823CB;
	Thu,  1 Sep 2022 01:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADB1C433C1;
	Thu,  1 Sep 2022 01:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661995033;
	bh=aAy4vnKZ4o7EIwTguBOSNqO3XFi1b+036gmfNtJIiAc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KhCiXu5JR9rr0qm33lETd8R5q4uyvB1rwktj6Oti980coJO2RrTKnD6Q5kNnFS4u+
	 fDch1+mTWDru4IW96w8DGb+MjmtJZ/Cyg8h4SkyOKEO7NHcJ8LZ+oqrgnYYlOHHPkd
	 E/4EW6FvHSmjd4pe0Juvlu0u7kNEvK4heTHpNY8Uoc2hXnv9MRiLpY4o6WHbya+wGE
	 WxdYFpIqKhhhxMcWqFuEx67/x7Csl2rWQQC+7peq2Hk2608fopFQM7Dvk6ZG5TkRRo
	 /es9ueV+LXLaCk+0Re5JjDDpz9JbwvXquvE+QEyxWeRs2gRXspLTw1wIg1fmvKiYjT
	 +LJNVmi5cw7Lg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220720102817.237483-2-angelogioacchino.delregno@collabora.com>
References: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com> <20220720102817.237483-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for USB/PCIe t-phy port 1
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, nfraprado@collabora.com, rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 31 Aug 2022 18:17:11 -0700
User-Agent: alot/0.10
Message-Id: <20220901011713.9ADB1C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_181716_579771_D1B675D8 
X-CRM114-Status: UNSURE (   7.16  )
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

Quoting AngeloGioacchino Del Regno (2022-07-20 03:28:16)
> Add the reset index for USBSIF P1 (T-PHY port 1), used as either USB
> or PCI-Express PHY reset.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

