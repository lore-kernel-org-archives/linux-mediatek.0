Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20C5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 18:00:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E346650D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 18:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E346650D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Piw5b0vbRW8MCMhAmk9+l5q01+WKBCNv970feAx8D0=; b=ItNmfu5KxKIwAdDzp7lNgdEGR
	M0tfAYWirnk3WVzcllz7Nw3w5c3ZnD9WWziRHl14BXv4u0x2qPVd8Fe+RH2WIslsLvBs5Sw4C4fQ+
	catdYYOOsTWAnFy53uWGCobdmalnYmdt+2Z2cdmQnEAtlQIFrPYcMtTtGhggufoTHcBK/PpUmWjJ8
	Tyy2LUKRnfo1EsTarYGAHjJyLgu09pE944FM9JArsQHnV3cmopRKwmRoC6ei3outrqurn6CVx06xV
	pRb9VcEdDcCQmXVELuKk5VyEvsHQWd6Erhp5jxyhLtrthn8lNcYXywFwYMxQcKVLHSNNk71sJvX6E
	bMlVnreJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDzQ-001Vd0-7n; Tue, 16 Mar 2021 18:00:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDz1-001VQv-Je; Tue, 16 Mar 2021 18:00:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68DBA6512B;
 Tue, 16 Mar 2021 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917592;
 bh=nXlw2vfyIp1WV4usGhcoH7XilW2OrIy0e0d+yxJsh9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e8pqAQMPjtlThMC66+kC/1hiYm64eWZ4wYu4wYB5j5y7/non75NV+4zzyXJ/+Whf9
 LsklXdLpM/fJxJNyg7ccJ6WdDe7xFKiYpv2nB9fIQUiYIeLbzoGxzdIlAQxx5BJQtj
 fg9JlGMFIYeHWV7iJ00Ct6qCS2rqxHtF0cOYWY8rsWRzYkdKqZb2UPFQnPsXQZSNGa
 aupAREoPkP7+LV5Iv7X4CgE5SqmeIchFynOt+etteCZ7Ly3mq8mzFp5pkV8b56iEZf
 mFvvw9TdSuroBaPuJqFasTU/ZmQQUSXe+4uRAi5ygoUtfFeyL5IdN6r0zaWBGh69I6
 Z0WRHjPpDrV/g==
From: Mark Brown <broonie@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-iio@vger.kernel.org,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-serial@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>, linux-spi@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-mmc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: (subset) [PATCH 00/10] Add basic node support for Mediatek MT8195
 SoC
Date: Tue, 16 Mar 2021 17:59:39 +0000
Message-Id: <161591750213.14124.1270039699331063876.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210316111443.3332-1-seiya.wang@mediatek.com>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175957_086437_B282E057 
X-CRM114-Status: GOOD (  13.80  )
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

On Tue, 16 Mar 2021 19:14:33 +0800, Seiya Wang wrote:
> MT8195 is a SoC based on 64bit ARMv8 architecture.
> It contains 4 CA55 and 4 CA78 cores.
> MT8195 share many HW IP with MT65xx series.
> This patchset was tested on MT8195 evaluation board to shell.
> 
> Based on v5.12-rc2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[05/10] dt-bindings: spi: Add compatible for Mediatek MT8195
        commit: 5ac1b909e5b60cc2735bd9174f631dc2c7f44c5a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
