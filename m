Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284D6CD68E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCRkbAErQbwiEwlx38sXikNb/c9TUsY0kKLbdX3p7v8=; b=0N+zZgv5y7X99vgq0j9f7nWZ1i
	KFGx7rqLN7LdrbDznic/SmG5Ib1LJIghTf8r8LLYFBP5A62ZG1cMSLcdBlbrTwgIMp32n5g0xSVny
	ZbbgvZ9fCobriN9JbXgnRcIZA22wi2acBGLPYD1n41PNf1ZhunoKQW3aBxdRXsdGeEeOX3lsrxlXB
	7FxWwTIHnWOJlefJ0/fTMC05CZe1ltl6j1fHVE0gD2bf/UHySZgh9nPSsA4pM9Kj6jA5gEtqeeeVf
	2wsfJ7/DoGhFCpzpWVFLlX1A7r3k8w3dvbovYGanGxhDu0GtEljLegTOWwwy/80t8FYDZsNAL5/AF
	8P6Dwg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8et-00CtOh-2m;
	Tue, 10 Oct 2023 09:04:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8eq-00CtNY-12;
	Tue, 10 Oct 2023 09:04:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41D8E66030BF;
	Tue, 10 Oct 2023 10:03:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696928639;
	bh=AIGG6fyFvhD007VLi8fAW7s1M4cQfB2NwmTFR5Zn+D0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXwf+ivG1BTAOyTdMRjqAhWU8Qohy3vhgIGeU3NarqAUeFwhp4CirTe1sawubRlzJ
	 3gjPhAWjbTF6KENqS7qwWq4novPLu1dvsEdV1LNMNU7HzxfM0TV5pd5deg7kh3g/co
	 kt3R2vwOEMMFZJkOL878y8DHQcmUiqo2QEnOPRMVADuXwmSCCmHJ3RhmG0TolX2H7c
	 JxA7zkyCWyV5E9gVsSkSvhBswmqTRWJGg9qCFzvRIwIr1AXgHNlOxgYgszUY1VrNta
	 rmioEndFP838jQ5FuAT7LV+3dt1HBcxqwsseEwIj161kK4g3s5cxrKt+BLGhZuOIqC
	 RY+r9YHV7twkQ==
Message-ID: <62fbac76-9dfc-8959-d08c-2fed58f38926@collabora.com>
Date: Tue, 10 Oct 2023 11:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_020404_539457_60B1805E 
X-CRM114-Status: GOOD (  14.92  )
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

Il 09/10/23 17:59, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> The SOF platform drivers all use either sof_of_remove() or
> sof_acpi_remove() which both return zero unconditionally. Change these
> functions to return void and the drivers to use .remove_new(). There is
> no semantical change.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



