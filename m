Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A3CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeWBVYJmlGHv3HP1aRZWCBvB4u4Cb5G9X8OebZWfO3Y=; b=w5aJvbLR3agpIhfLhBdXplmmwo
	ZP3OQLOl6IYYwDPmY7hM+iM3XHTvvHuFt1uQMk+d1PaYvqpE59o6XFIszXWrJdp71Eke0yfj4zILi
	at6lvKk8qmb9nKT/zpLV6JD/HKLJvMWrMuirgWLWp8HAi69MhVRbUFgQ78hIZNZTB65XhPqYAe7Lf
	g0T8ceYxHwadQ2zKyKPkF5wlpmATvDoGOXD3wIrNyt4lBEJZm6mS1SleI4F9qdt/Qhxf3WY1xJkkq
	t1+gsTyMCiBQEdo6lrV+ByfJCUAAPloIX5WazsN6qXzeI1a5C5dfmI0m/R972y0nhnQCLr9tQ+9r8
	/tP1u4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2Tb-0000000DWSR-1YMM;
	Mon, 02 Sep 2024 08:31:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2R4-0000000DVhq-2YjX;
	Mon, 02 Sep 2024 08:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A270FA418F4;
	Mon,  2 Sep 2024 08:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62960C4CEC8;
	Mon,  2 Sep 2024 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725265757;
	bh=cxKDCdCiqIYOE5vwlnqkPpcgy/ZNa0A4fziYZeuC258=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K0E/fMkMAVtRD/E0g2t9G1nI2nuYeKPDLA7N1xTHwYgSeerdXkGgInLCjPD7H5LF6
	 cKuLUHBjBGwUiS8n9lpvvCLRGq4H1OgPifoRItKxem5U6AhbKXlPVcoJZJOWqk18Cw
	 OhsAmW3Roc1m6mmUuzwjqDidi7bF87RC02nwbXJTJb7IbZBAd3s+rcVdEYWKfT3hrZ
	 JkxQYWGWpu0MPDwhFjKEHKwBu4oK9ZiYqXdI3reyTXMrHQn/pKj/1D40ClgiTiHd1L
	 R36AjBJdtKmZaZyNI6YrHP3BuJAKNokIroLepJePgXtHPH0uvibSXL+u6udtWEAd0y
	 t6N18NItgbIQg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ricardo@marliere.net, Amit Vadhavana <av2082000@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 olivierdautricourt@gmail.com, sr@denx.de, ludovic.desroches@microchip.com, 
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 rjui@broadcom.com, sbranden@broadcom.com, wangzhou1@hisilicon.com, 
 haijie1@huawei.com, fenghua.yu@intel.com, dave.jiang@intel.com, 
 zhoubinbin@loongson.cn, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
 manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com, 
 linus.walleij@linaro.org, ldewangan@nvidia.com, jonathanh@nvidia.com, 
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, 
 michal.simek@amd.com, Frank.Li@nxp.com, n.shubin@yadro.com, 
 yajun.deng@linux.dev, quic_jjohnson@quicinc.com, lizetao1@huawei.com, 
 pliem@maxlinear.com, konrad.dybcio@linaro.org, kees@kernel.org, 
 gustavoars@kernel.org, bryan.odonoghue@linaro.org, linux@treblig.org, 
 dan.carpenter@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20240831172949.13189-1-av2082000@gmail.com>
References: <20240831172949.13189-1-av2082000@gmail.com>
Subject: Re: [PATCH RESEND V2] dmaengine: Fix spelling mistakes
Message-Id: <172526574398.510261.10954732298871538.b4-ty@kernel.org>
Date: Mon, 02 Sep 2024 13:59:03 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_012918_763006_A556573C 
X-CRM114-Status: UNSURE (   3.64  )
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


On Sat, 31 Aug 2024 22:59:49 +0530, Amit Vadhavana wrote:
> Correct spelling mistakes in the DMA engine to improve readability
> and clarity without altering functionality.
> 
> 

Applied, thanks!

[1/1] dmaengine: Fix spelling mistakes
      commit: a688efea0f2a084aee372e5b7b12d4d2d172f99a

Best regards,
-- 
~Vinod



