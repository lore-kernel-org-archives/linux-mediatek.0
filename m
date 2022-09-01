Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490EDECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsH2hqW4YPpI8hSkaK5p+Ch+1t7odfDqKLN91tPnkJs=; b=wm535ILNYxsHg1f9PMLx0qFwVi
	vvlZdzTo9430KuBlTV4BmH9I4/qBckFwHRMCA21kfOGc3WN1r7cL7Pq/YvS2qD9iCOAKsLbxuwieC
	vgxThIVSnyOsKPsS5JH3aaUDKr28lrNcom6KZG0u6lUlVBNQv2g2GJJpU76cUl6J/N9DZtjXymRxK
	zp4JmvViuMzBlGm8APEJ12Qc8LtLWzg9rdVcmsrYNE33VF5L6ZYlvNQYo3dWB6JUIZyB4wfWKvHeR
	/Lxack+vJ6fcEwQ2JEkRbhry0Y3UHhAHmJfboJVqaRY9YdX1TARTaDZLpAkFXv/OMFQ4A90Unp5rJ
	ugpnUSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYpv-008t8n-Fw; Thu, 01 Sep 2022 01:17:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYph-008t2r-Sq; Thu, 01 Sep 2022 01:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 894FBB823CA;
	Thu,  1 Sep 2022 01:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FFBC433C1;
	Thu,  1 Sep 2022 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661995044;
	bh=NsH2hqW4YPpI8hSkaK5p+Ch+1t7odfDqKLN91tPnkJs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AhQiNkXZ9tQemIV7ziUfsIVAGdIlbnF7cNJ1TwUgoJi4SXJ9SkqNgrElYdf9/bP1X
	 BCjoeHZT5hWNAxAhohMLIVfSqKvOjrxduv4bW266/eo7LYPuIxM4CmySqhxiA8lqQG
	 IRObvh5dT3lpbPNOwfhFsSkH4F6roqxPxkA+toG0lsCEl1Gh6ZYfIyT3L8siidOqgc
	 qxsGXSikfVXzlndD1dIr0GFQvqldfOW6dylsiaQJ2I5lzKA9hh9E+ztAuATswMTBRI
	 ycJCUY6iMWndlkUqARVbQ4jaJLAJI844t2W2lsAELumEHwoymIXiXFAjGQUcjZxpcV
	 BAAGElHq0BRmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220720102817.237483-3-angelogioacchino.delregno@collabora.com>
References: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com> <20220720102817.237483-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195: Add reset idx for USB/PCIe T-PHY
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, nfraprado@collabora.com, rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 31 Aug 2022 18:17:22 -0700
User-Agent: alot/0.10
Message-Id: <20220901011724.25FFBC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_181726_103613_C20C4E9D 
X-CRM114-Status: UNSURE (   8.02  )
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

Quoting AngeloGioacchino Del Regno (2022-07-20 03:28:17)
> Add the reset idx for the t-phy port 1, used as either USB or
> PCI-Express (secondary controller) PHY, depending on board-specific
> configuration/layout.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

