Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B80CCA47B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24uO7iJMZUQAZ6tFY8JUIERthi5gsyIkF8f1gwe8xlU=; b=RtQZJbf9H1Z3APYf8tfnHUdPS3
	9hFmNQiFwTAM39A1++9+K80KLwrE44j7hp4YJPE/iz1AnKWg0IfqnLSY6TPNOGc3h3DtRfpoYdYR0
	ow8C+rqrxaD9CPO2Kxt38NlgIY92BBDpQ6AA6qT3x1QXvcalp4zcPW/vqxsR4ThpKLL2NFvsgzs9J
	BhTF/69gXNNRmZrN8ioUoEDkaWcdkKWvHFsvgRgHtPhQdjWDxpoNyUSigjHcdcy3NYW9GNY68wx3n
	CijL4YdzqvhHaG+5voGptmvbieSwi2jMwufkeE2cDxgPU0GnGNEh/deHZZXeQ3328SYsDERByDFga
	o5DiZswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8cXv-00FIzd-Cy; Tue, 05 Jul 2022 07:00:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8cWE-00FHLA-AD; Tue, 05 Jul 2022 06:58:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D54761532;
	Tue,  5 Jul 2022 06:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74F2C341CD;
	Tue,  5 Jul 2022 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657004325;
	bh=wtCX0mhuv6OWF5JECPvFl2ihKCo2T2AiGHFIg2o0AzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUr54vnD8SejPfoxdafHuCuojZ0XoEd3MsOh1GnmfpjoFlNDTtd/vJ+ZvYwpm4IyG
	 cttENLMUPiUAlGVx0K1mluiO4qeMh0a/RG/d4nVgp37ERs1e85jrzcSgkD6YNyAkSu
	 PToZ7HQamkL0m9KnfTo5NEh+qf54PkQ9dNorWomy9XTmSGLBkBQY4mkpvjgYD0uzLs
	 YN+FfvMJbJP2t5RoB0E/5IQZ/w5KFY6U2ItkqyAdvjjgWmFBipF7qevYDtTUsvwKj1
	 0x6ZdiBbS7Fnnm4NuBflSb7aM+9RE0+wN2u64N96nykywWvTQl8Uko4baItw5Psy37
	 PzNnkw6tyc40w==
Date: Tue, 5 Jul 2022 12:28:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com, kishon@ti.com, matthias.bgg@gmail.com,
	airlied@linux.ie, msp@baylibre.com, granquet@baylibre.com,
	jitao.shi@mediatek.com, wenst@chromium.org,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12 1/1] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YsPhH1sXiT/+unbj@matsya>
References: <20220624062725.4095-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624062725.4095-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_235846_508083_5768EFDE 
X-CRM114-Status: GOOD (  16.54  )
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

On 24-06-22, 14:27, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This is a new driver that supports the integrated DisplayPort phy for
> mediatek SoCs, especially the mt8195. The phy is integrated into the
> DisplayPort controller and will be created by the mtk-dp driver. This
> driver expects a struct regmap to be able to work on the same registers
> as the DisplayPort controller. It sets the device data to be the struct
> phy so that the DisplayPort controller can easily work with it.
> 
> The driver does not have any devicetree bindings because the datasheet
> does not list the controller and the phy as distinct units.
> 
> The interaction with the controller can be covered by the configure
> callback of the phy framework and its displayport parameters.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

-- 
~Vinod

