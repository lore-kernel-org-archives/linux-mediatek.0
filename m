Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30560A2613
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6Z0czFV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QMXQ0J1dfSE8nIvAFypB4Gh+MixjlC/fyg2Q6f38e4c=; b=P6Z0czFVbkyWq9
	9DRxWjnz0qyQeynvE+DlmP1z/7noOcEaVkIYInXmQqfc6pEC/NMuOQj09UWhm3i5454PPcp7KPsnK
	I/kFMzkGUYPYHSr/427xl7XisoJajoBW29fSLyuv92rhRPepkhfon1CVuFnwS0iWx7EKU4efXrD5a
	qnoRH5U+Ww7Y52gBAbCXufP5H6+ddfKxaYTzXJzOnHJMeRi/cXG13GRUDs1sYu8gQzO9+80y4ut3r
	bmCIT+8aWYYWVm0l1JnnJKeQ7KJfRcEGE1zjKVQ7qtd+iPicUv8wGZtA8RSPH1WCdTylT4SYUvi6V
	3NB8XTZg7LmJkmZPiZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkHQ-00000000lhC-1JEm;
	Mon, 16 Nov 2026 00:09:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkHP-00000000lgz-1DCv;
	Mon, 16 Nov 2026 00:09:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 475CA4477F;
	Mon, 16 Nov 2026 00:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015FC1F000C6;
	Mon, 16 Nov 2026 00:09:01 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 50D9D181BFD; Mon, 16 Nov 2026 01:09:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, 
 hyunjungg <hj351016@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
Subject: Re: [PATCH v2 0/3] power: supply: fix work-vs-devres teardown
 use-after-free
Message-Id: <179478774031.232281.13674582077494519216.b4-ty@b4>
Date: Mon, 16 Nov 2026 01:09:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 13:42:09 +0900, hyunjungg wrote:
> From: Hyunjung Ko <hj351016@gmail.com>
> 
> Three power-supply drivers register a poll/detect work for devm
> cancellation before devm_power_supply_register(). devres unwinds in
> reverse, so on unbind the power supply is freed before the work is
> cancelled, and the work's power_supply_changed() then dereferences the
> freed supply. Each patch moves the devm work-cancel registration to after
> devm_power_supply_register() so teardown drains the work first. No
> functional change.
> 
> [...]

Applied, thanks!

[1/3] power: supply: ltc2941: drain poll work before unregistering the supply
      commit: 001fc38da1802cfc4b54fd1141594e5c8dc83893
[2/3] power: supply: axp20x_usb_power: drain vbus_detect work before unregistering the supply
      commit: 4dbc2b7a52a6023508cd424e83487588ed5138f3
[3/3] power: supply: mt6360_charger: drain chrdet_work before unregistering the supply
      commit: 6a40d8459e2385b5d0bdb8832c0bce7f87a55823

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


