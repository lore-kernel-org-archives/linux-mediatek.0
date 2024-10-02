Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E622BCF31AC
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlBSDaCDvzxhtWTCCyRqSORln1PjBMQoIVK3dKNdpIk=; b=YOX4sC6pG6MlrDS/5bjhCY+sgW
	SDYaooPITL2Z3ex+2rY3SmgBvFnLAsrOI50Dzuc/zy62VU1c9gLPvdJj6gCiIDBIUyQPC5Djwo5hc
	ccLrDQ9PDM18ekDzzEKPnCsKvbQtD5U0+zOGSC5oodSFV/mQhAWTRljYxXdheDyeA9vc0pNMZTRIu
	cQRgJ2J1lxuVMqk0KKoxFt1Y5Rbbfzoq8IrEZbmRqyLl1a1xioYNPXLrPgtPBOrwg4V8E/w7E8UnA
	me8H8OyhPyX32hO02SEX7fuOSEYpEhE1CI8qgX6wrOr+Ku7eyelLs6wi5mEwCVjVgrk28VetVGD7D
	FzzQcxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvNj-00000005Hyl-4BzD;
	Wed, 02 Oct 2024 09:10:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvL6-00000005H8Z-1rmd;
	Wed, 02 Oct 2024 09:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727860086;
	bh=xDp1JK58nUfRoZvz+p7cWfD1b2oACtv8V73s3B0gqUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SEWDuUzW+7Htmb1dgddN/5562jZUFZCNCMiQ/DuI3FvRdVgPfNMOiMC5EqzvuBcRT
	 aePwaJlzmowAZ2YHWDjat4qODZu56GzpfKqe12YCSnxJsgfP0Zvm+CvgX/4TB/RgdW
	 Ki9dNrly2103hLaZNAhqDP8ZNg2FGfrtunT9NwHf1HC6uJ7FqzQRR5tJ3kvLoWJdhM
	 J+zjDFiDACloN62wxDGDHDv/JZoMivxZoKUn77WNzXiLTCNUksBkCUp9gqWb01Dqpy
	 3mYI1AKhwmpCbWjxCXK2rLWVYfmzPG2dcTx+NebRME+vQc8bxFxuhw9S5YZxr6qp0l
	 YN9VOyTtIqbog==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FC9E17E1131;
	Wed,  2 Oct 2024 11:08:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <884f0a5d-e6d3-47dc-8a9e-201bb86b271f@web.de>
References: <884f0a5d-e6d3-47dc-8a9e-201bb86b271f@web.de>
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Call of_node_put(np) only once
 in svs_get_subsys_device()
Message-Id: <172786008620.33539.9448473097115032514.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:08:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_020808_697394_3D579468 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, 24 Sep 2024 20:08:15 +0200, Markus Elfring wrote:
> An of_node_put(np) call was immediately used after a pointer check
> for a of_find_device_by_node() call in this function implementation.
> Thus call such a function only once instead directly before the check.
> 
> This issue was transformed by using the Coccinelle software.
> 
> 
> [...]

Applied to v6.12-next/soc, thanks!

[1/1] soc: mediatek: mtk-svs: Call of_node_put(np) only once in svs_get_subsys_device()
      https://git.kernel.org/mediatek/c/1ee71494

Cheers,
Angelo



