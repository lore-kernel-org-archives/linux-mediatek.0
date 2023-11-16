Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D0C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuJCmZxdi2NWI/hPQACzpKSM1WsV4ffa+vP9B8oTORY=; b=vPhtawaQSQGzLOa9yLbP0uEDnY
	SK8QeRWdCO7Uqh2FhI2OlQWp2xWaHMIS+b/ppqU+5e5b0brMD+wNuorWZ4ObPntz8/xP5Ff6PXL19
	uWja2N1d2Jkm+0r792LA1xky6CgxZlyJ5lg/+5q0qALk6IiE14fMFRWDV3L9Fu/EIElOyQ+p4dVWo
	zw5hW4+sCzSjC/mWT3J7hntzlOJHcHqZ9siwOaUTuq44kIS+akCRBxRE0y3wYjXrYO1bOtrkBa0x9
	CSiBqow+KsU53AzkYHVwmlR2QGg2563p3iUn3nG8EDkLrHmBbBj5SaloVxVjH63THIOFiSIjiQ9n3
	gq8626fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3QPE-0025hx-1b;
	Thu, 16 Nov 2023 00:38:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3QPB-0025gW-0W;
	Thu, 16 Nov 2023 00:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69D6461802;
	Thu, 16 Nov 2023 00:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D87C433CB;
	Thu, 16 Nov 2023 00:38:45 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 311901062B6C; Thu, 16 Nov 2023 01:38:42 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 linux-kbuild@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, 
 linux-actions@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
References: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/14] power: reset: Drop platform_driver_probe() and
 convert to platform remove callback returning void
Message-Id: <170009512218.785165.16271461927880645389.b4-ty@collabora.com>
Date: Thu, 16 Nov 2023 01:38:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_163849_301889_A877A2A3 
X-CRM114-Status: GOOD (  13.13  )
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


On Sat, 04 Nov 2023 22:15:02 +0100, Uwe Kleine-König wrote:
> there are two different types of patches here that would justify to
> different series. But as the patches are not independant I chose to put
> them in a single series.
> 
> The first three patches drop usage of platform_driver_probe(). This is a
> concept that isn't so relevant any more today. I didn't check, but it
> saves typically only a few 100k and there are thoughts to deprecate it
> to simplify the core. Getting the usage right is not trivial though the
> at91 drivers got it nearly right. The alternative to these patches is to
> add __ref to the driver struct ideally with a comment describing the
> need like is e.g. done in commit 5b44abbc39ca ("platform/x86: hp-wmi::
> Mark driver struct with __refdata to prevent section mismatch warning").
> 
> [...]

Applied, thanks!

[01/14] power: reset: at91-poweroff: Stop using module_platform_driver_probe()
        commit: 099806de68b75a0fe114376b1ee162fdff572ecc
[02/14] power: reset: at91-reset:: Stop using module_platform_driver_probe()
        commit: 12389c657b623da34ba9b30306e13919d0b42f3a
[03/14] power: reset: at91-sama5d2_shdwc: Stop using module_platform_driver_probe()
        commit: dde74a5de817e0a011e4783cf26295d7f6fdca26
[04/14] power: reset: as3722-poweroff: Convert to platform remove callback returning void
        commit: 904e582f0c7282b3d7c76c73c06f3ad3b0910335
[05/14] power: reset: at91-poweroff: Convert to platform remove callback returning void
        commit: a31438ece3ec27057c77822b0b0bc0614798c425
[06/14] power: reset: atc260x-poweroff: Convert to platform remove callback returning void
        commit: 6f539f3151721f1c90fcdafa2962c19a8efc1afc
[07/14] power: reset: ltc2952-poweroff: Convert to platform remove callback returning void
        commit: 6642b13206b2225b0d75451f5dd763574a2c8bb0
[08/14] power: reset: mt6323-poweroff: Convert to platform remove callback returning void
        commit: 99f7fa6c7cc573ebe2529959723b71b4d12ec2f5
[09/14] power: reset: qnap-poweroff: Convert to platform remove callback returning void
        commit: 1a0457ab2ce81d92c2077a79080141d924884c5f
[10/14] power: reset: regulator-poweroff: Convert to platform remove callback returning void
        commit: 6f7be7b2f15a654a5f08b7d37df282c171b9380b
[11/14] power: reset: restart-poweroff: Convert to platform remove callback returning void
        commit: aedd4da0aa27fe9d0b03b3fbf62376aebbfc385b
[12/14] power: reset: rmobile-reset: Convert to platform remove callback returning void
        commit: 30d26d2be83de0d036f59f384b805dd3bf4bf5ef
[13/14] power: reset: syscon-poweroff: Convert to platform remove callback returning void
        commit: 2973706c4160ed8c1e695b4dfef4bdb3124c5753
[14/14] power: reset: tps65086-restart: Convert to platform remove callback returning void
        commit: 0bf7207e09673144df6425b2cad8bcb015e3501a
[15/15] power: reset: at91-reset: Convert to platform remove callback returning void
        commit: 20cea2b59abe33b80536b936b6729c88d1de2624
[16/16] power: reset: at91-sama5d2_shdwc: Convert to platform remove callback returning void
        commit: 054eb2377523530404fb64c24c8747feb022c5b4

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


