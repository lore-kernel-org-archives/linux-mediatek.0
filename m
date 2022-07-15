Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B7C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASNZoFJy1d7f3k201KdPaWFsxQuaNSNqOXhlC5/Xqzg=; b=PooaTufTjB+WFD5a+8DCsCKwn8
	UnJTmfRKccQjA7p90ZpfYODqXYIRrkeKjWBYpZOiWSJ1fzn5LZQ+IUEtIimauxOf6+H4Qi8uYVcgU
	2vSObfV5jEMBY3nb6pLs5Dzy8DiYax/0XKCtf5UI2x24KhDrk3dXInpXBiI+PumRCGVWSrbmhau1C
	3goLnQf4Ef05uEyakojB8xaY1bmlEG1pxeSKoISqgs2OYSo/oIz8EYiPZpGq40YPvlqrc2dp3YHI9
	gi10+Ap2yoYUaqcOJCTcjJN/q0tPrS72e/OOeCpiOqehxMfPZUYp1DC5LCNwcQe8Tq7BVKSw1B2K8
	50f9NSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGdc-005lNV-6p; Fri, 15 Jul 2022 08:25:28 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGdR-005lKC-4r; Fri, 15 Jul 2022 08:25:18 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id AA9C21F88; Fri, 15 Jul 2022 10:25:14 +0200 (CEST)
Date: Fri, 15 Jul 2022 10:25:13 +0200
From: Joerg Roedel <joro@8bytes.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iommu/mediatek: Log with dev_err_probe when failing to
 parse dts
Message-ID: <YtEkaa+CCCz0l61q@8bytes.org>
References: <20220712214427.544860-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712214427.544860-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_012517_352112_AF749E3A 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, Jul 12, 2022 at 05:44:27PM -0400, Nícolas F. R. A. Prado wrote:
> mtk_iommu_mm_dts_parse() can fail with EPROBE_DEFER if not all larbs
> have probed yet, so use dev_err_probe() to avoid logging as an error in
> that case. Also drop the return value from the message since it's
> already printed by dev_err_probe(), and add the missing newline at the
> end.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied, thanks.

