Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE65EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaQ/jd3RF4UnkFll8LE0EK+DsqV8n3cLHkmxP68d+60=; b=LcTLDhgqqE6rLK0aFNPd4X1b9Z
	lH0w/U4Q93BrNtW2Jpx5Qc/ujD3jChJognGtOKMgftCr7HMILf0yyPYBBM8IjCFed15eyUd0v8Iq2
	ZooFGM84ck04jVRF48ZDXMIkXyWCgHd8faPkCGq1WoMHpEWKvu1aX3aouz4Tl8s48iXSXGs6vWouV
	F9FxfI9KFdTovzMOpozTK8edISqymFgL6MTKW8REASbH1OE7cN4WQfzAQ8g3Ysln3G2IAASPVSscr
	YIPHIEMcVM/IRS73MGG3tRccPplHdOxMQ+5/CbuKpPyfsi74aIQJ5BI1d5eFJ2vbR4hH7TSHx6i18
	/QMj7RIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLC9m-00HL7G-2g;
	Mon, 17 Jul 2023 00:32:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLC9i-00HL4A-2g;
	Mon, 17 Jul 2023 00:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E043660EEB;
	Mon, 17 Jul 2023 00:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD69C433C7;
	Mon, 17 Jul 2023 00:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689553921;
	bh=paHDLzbIxR4t35jchB7wP2+mUhpnQT7MXpvr4zdD+90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGAwd27d2QSwibXdeiJQOvz80aVEcGN2o1X5Hjn3a5g2reDFRFyB8/0fLCXReMZvu
	 OCdiN07ufnxbNjv8XKO9AB3fOzYhNQX9hRRd+h/U1a4skPAGtkOUSbo89sE0UTSZq4
	 MHxDW+6VsYq82Ji4usFwSlv9djC0J4miWFaoqvasAbn6A77yUoHokntrBKnmK+ojeX
	 73TPMhXlvwcSxQFh7SGJ2BMSqaMzIgF+6HqiY1QUz4pygGHzK6d7wKw1w2jlCzhIu+
	 UHgvoPArgFVA7qlBSHffdZr9a/oxJYOdh+fvM2oFhj21Q2AA9ed2m1alBHdtOf000/
	 8V30k5AiPZ+Yg==
Message-ID: <ec511842-b978-b16d-fec3-248e6af37b07@kernel.org>
Date: Mon, 17 Jul 2023 09:31:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ata: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230714174052.4040857-1-robh@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230714174052.4040857-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_173202_916325_3F040153 
X-CRM114-Status: GOOD (  11.40  )
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

On 7/15/23 02:40, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-6.6. Thanks !

-- 
Damien Le Moal
Western Digital Research


