Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38110C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hy39WpIwPEXSIBANNXaKI5GRxkdy7QMbx2YdeZ38qu4=; b=rf9rWLo1gGO5Tu
	xPe7lltjL3PxUuiRaS+h+xrGoQmHgPRAc7bO5D6fkHugOHeqz6XF6c1i+4a6qHIHfsHbMBlTtP3OE
	7mmRD3nJNx3WmW8kQ1d2rc1lHmLxsJQxSreiQgoq6j1pXSZkGT0fWDdV/GpHYCN/KIRAX0hInIKOB
	TLvzB0TRFiQMgnBqvQVx3mXPnNyiv087EUBNwVxVJYAfFS2u7WCkio7E5YA/u3xmFlJjxqbLMbf4E
	HG7vvm6iUe41HlkbbFbsIl0dAWwZ+ThX4bkhKL+UJszA0EkAfvR8sGoA0lMRh9q6mH1kpUsJh79Sh
	MuM32xPL775iDKzADtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWzv-00GbWV-Ah; Fri, 13 May 2022 15:14:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWzj-00GbQC-3W; Fri, 13 May 2022 15:14:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2336E1F461FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454857;
 bh=eNQrmpvsqIQtwYolKiTtDiOp4ht3MwzuuikVm7BUBRA=;
 h=From:To:Cc:Subject:Date:From;
 b=ifTxDALRDsOUg2NBN8H0yqa1BCJr6hM2JSyW9QsFSEqpoBmIkPhzspDTJU52fDmwR
 aI0mPk84dcw4QaxXrYH5comEdHVP+s88W1MXFxjXAUwyb1SP/4OgAfXokT3MGNQJ30
 tin8aNAxuh8Bpi3SGqgNiRoFw0Ys1PYZzxVP6hABWEdFXypIAQYxBdaEoQ6d/1vWsW
 klt7wOLZb8KxcPhBdER+a7IJsYbPOdiyEzE7PysS4HvhFaeyKuUS/nrOAen1GlNzcf
 Jtcc5h+6oFeYhINPkhZyIdOvtGDqbjHHFHAW9vLH7mCeZuXWGKmeK4Q+2k0OG2CBj1
 NM6/52G3zNsGQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - M4U/IOMMU Support
Date: Fri, 13 May 2022 17:14:09 +0200
Message-Id: <20220513151411.395744-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_081419_315206_A7B07F65 
X-CRM114-Status: UNSURE (   8.63  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the IOMMUs found on this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

AngeloGioacchino Del Regno (2):
  dt-bindings: mediatek: Add bindings for MT6795 M4U
  iommu: mtk_iommu: Add support for MT6795 Helio X10 M4Us

 .../bindings/iommu/mediatek,iommu.yaml        |  3 +
 drivers/iommu/mtk_iommu.c                     | 20 +++-
 include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
