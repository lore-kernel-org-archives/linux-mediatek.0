Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF25C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TuiSnDEiAATLI7LW7sQ4Lp0Tbos0jbi1mOixqW/PiU=; b=qeCDBb71/HjK6m
	drCsUGQyr2pI3e4IHn679bl3Hy/NmFrvWn/66ZXApdHlO4Q0X8cbvVLkGP6ffnJYqMPL3UxESMwhd
	c6yDKIwroXQWsbe6fkJgbd4hZoRzusKAYESWNc+B3NOy6y0nxFx9g4hx0vTl8oRgkGUGKc0bknFhR
	VUlT3cp6CYwNkm/QISdvNC52Bi5LQMr+sn3LIE1UUz+QaE4Wspz8lkQqiDeVpZNGyY8sHsY0ZJdFs
	Tt6UuOfSVzIFFh3ya8YJdsozwWG+u7fRhyEfDOpLl9KdqWNq10iGB7pOESJtUz6T/BIcPhdequ83M
	0/ptq+SxDg1oWOtXcYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonIx-007B1g-F8; Wed, 11 May 2022 14:27:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonIc-007Aqv-Ju; Wed, 11 May 2022 14:26:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C256ED1;
 Wed, 11 May 2022 07:26:41 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.1.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D14B3F66F;
 Wed, 11 May 2022 07:26:38 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: ryder.lee@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, jianjun.wang@mediatek.com,
 linux-kernel@vger.kernel.org, robh@kernel.org, kernel@collabora.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, bhelgaas@google.com,
 nfraprado@collabora.com, kw@linux.com
Subject: Re: [PATCH] PCI: mediatek-gen3: Assert resets to ensure expected init
 state
Date: Wed, 11 May 2022 15:26:27 +0100
Message-Id: <165227916327.28061.3388397168727783283.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220404144858.92390-1-angelogioacchino.delregno@collabora.com>
References: <20220404144858.92390-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_072646_736903_5FB037CC 
X-CRM114-Status: UNSURE (   7.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 4 Apr 2022 16:48:58 +0200, AngeloGioacchino Del Regno wrote:
> The controller may have been left out of reset by the bootloader,
> in which case, before the powerup sequence, the controller will be
> found preconfigured with values that were set before booting the
> kernel: this produces a controller failure, with the result of
> a failure during the mtk_pcie_startup_port() sequence as the PCIe
> link never gets up.
> 
> [...]

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek-gen3: Assert resets to ensure expected init state
      https://git.kernel.org/lpieralisi/pci/c/1d565935e3

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
