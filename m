Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F4BC79FBD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VPY0deMqZZdrYnmVNpJtaQIzzwrsHUnmWiCqzQ+mTU=; b=c5MGltC4IOcR3ZNDxLO3eB9KDd
	XSgpfhKHXWoZfUjQr+AwhdWmLjhju5D+DHzzBlvpW6j4RSRHXyFpVsILUB9vYP/zWUUrAXrmBuIzh
	wQlnJ1Ycd45qmpVfP7+J7zDQd2RLIa5XSPPtzlnZLsGcaxzTuEGcBAhGdfWeeeIm5IBi7ecGT7Iqz
	7nS+fj1Me6GcZLfKX9HYJKaIPURjLPGYfwhFG81r4O9Ys/XZWN2POgtes9JTdjaOzekDtpGSou15S
	7eOrxazOA+7ZefCBK+5gDWuEc/lQoYDdtaP1nATPZ3LhJNO+QLq06ffUJetbXypkYYyF87uf1Hgm1
	n9FeshZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lvm-0000000CSRa-2bsZ;
	Wed, 09 Sep 2026 17:17:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lvm-0000000CSR5-0St3;
	Wed, 09 Sep 2026 17:17:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C68F34177F;
	Wed,  9 Sep 2026 17:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2712D1F00893;
	Wed,  9 Sep 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974273;
	bh=8VPY0deMqZZdrYnmVNpJtaQIzzwrsHUnmWiCqzQ+mTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/Tl62vDVbX7K7x9KxWl4Y1ioFq2FtWmlA0h7fNRPi1yoUVPKOfJQv4aj0vSn/zG0
	 o4H+TRVi07XNDX4qm6y8JxgfeANszC3KWbSxV5dP4gZ8Ir9Pj/sSjkArLr06pjCU2C
	 VZ8vPxIezLpot7J1zyVd5AjcWlSsvGj8T2Xqlus9nQ1jj9QUYkOQ0+CM8nxcWViVgC
	 lABKCMhDvA07ki3Ckc1S3CR0fWaGkRBV2dO9mhIIcm5GD3E/XHMl4PlazfcNHp2sg4
	 CTTJKi94WMWXwyEXJ1OlEjxa0u+H6PWGstz3+SyzoHQjmxRPx0/VKRE6zNB1wnqGg3
	 YHPzGEhrL4DqQ==
Date: Wed, 9 Sep 2026 19:17:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 07/12] phy: phy-mtk-dp: Support setting volt swing and
 preemphasis values
Message-ID: <voe2zlbmri2mesde2b5ypyj5xtfcaso4i4vsjlkrjfkq2mxxue@5hbymqqlb2da>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-8-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:40PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for honoring the set_voltages request to set the
> voltage swing and preemphasis values in the .configure() callback.
> 
> For proper hardware cleanup, reset both in the .reset() callback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

