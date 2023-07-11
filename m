Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83572C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCdjB20b3vef89KWgqkpwNubXSkEHNE7t48wVBa++0A=; b=nKPjBNO2kAEUa7MNa5ykrseCi7
	GpzfH3vE03QavpacSd7+4rgyRnMXNmy6ROMlxzA8VWJNa52Zy36Gpc1N8xU08acaOkOBu4SSKwA/p
	lV8L+WXdZ421nQ8cD1dzm4tC0HfQfA7mjIO3Q6Hrfxom3qbtwzCQBeWV1VlpAShMgC5baYRJFD+Og
	2k5BXzKn1pe4dRDw2FHAt7ckuezXEI6MPWt+44s6jYO+tLHrNEVQhcIWQ/4ky2JWfIJTz4lfLoI4q
	LGH54UWDPGg6qyn344rGLMhE/U9dxx94piKER0fWnD5rMek3Apnx9IXeL4XMmjf6wKFErzuwo7s+L
	svryy9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7vh-00DzvS-0W;
	Tue, 11 Jul 2023 07:37:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7ve-00Dzud-1v;
	Tue, 11 Jul 2023 07:36:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA32E61354;
	Tue, 11 Jul 2023 07:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D294CC433C7;
	Tue, 11 Jul 2023 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689061017;
	bh=sp9FUz7vFWMOXim7BOi9FhfXePdR8iwcHRlNLjmbrE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o+KWj9bXmQa6HfWyip5V0qnUuXxShVLYk5hJdPLFMtnIUrLDrJNGA3OoPRiDgXTo3
	 8FLQU5yRGDau/XKm0ZH75oQzVIYnmb3fo19Gl5s3xGoxgEXTHVDYPrzPLuUSt/q+9Q
	 e/iSLt9vgfmnvBblKjaVQWM3iSHxXvTYglKEHMwglEsiW0ZdNudN+fAts5ARukzu2E
	 RYWhdZxjxt5mGhE00CK34425ADah9caNJ1RVpLS3DC08xZz9lARxQ629iUtCs7LuE5
	 2mjaY0lCjRz2MqsjDCdwolr2zwa/evxOVdRKjdU1X/cC/LKG/NN4Q7yVsTPtc27QHI
	 SjiMhH5BwXtFQ==
From: Vinod Koul <vkoul@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, 
 Guillaume Ranquet <granquet@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-Id: <168906101241.188690.9773925204562641483.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:06:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_003658_668770_0D787174 
X-CRM114-Status: UNSURE (   5.75  )
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


On Tue, 11 Jul 2023 09:13:25 +0300, Dan Carpenter wrote:
> Negative -EINVAL was intended instead of positive EINVAL.
> 
> 

Applied, thanks!

[1/1] phy: phy-mtk-dp: Fix an error code in probe()
      commit: 03966c3950d36d6b671158be3794eb7211434faa

Best regards,
-- 
~Vinod



