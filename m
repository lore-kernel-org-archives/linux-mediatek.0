Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B831C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9frADepiXRz4HvinWq9hHWB/m7Sy4aJ38Pjfpretw8=; b=eoBFgPc6b39PIZ750RVdt4ho9z
	LfjArSxbg2U6Ikl54iSBtT+WGl3oUwQ5Cu08cXmDQDsQ6EZmcSPAR7zFUADomjn11lQq8I7X3PYtZ
	fYa8QVVl4cMOburtyIHFoz+aC+xZhw93GROPvWKv7yUCcIr2D0BrkBrsUU8JbOHds9Kmf+CAE/qQu
	TooVoWb52PAtYXAJ9PPBl8/Sue7/MxChYRC8ko0ZdlanD+yG+rIGaReZ5eCGtvdvHnaoUWgYkyiIa
	3OQUFOLdUznuMmcIF0lhzeiObSsfx98EAbzCzlD+vItFx0wC9knue/rRV4Tn7ABeIO9r42mZpy3+O
	Mzft+kTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oze1Q-001lF0-49; Mon, 28 Nov 2022 13:18:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oze1F-001lCy-LO; Mon, 28 Nov 2022 13:17:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A89086600011;
	Mon, 28 Nov 2022 13:17:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669641476;
	bh=2uXRwe0i//JyPghl6Zfj5I4f4NSH8kMwVmZpxa1n7FY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jADSdHpHmCcKmFVAN5qk55NzAn6vTVxeC+UP+4CqVe7eRb+dKH62Vpa8ytwUq0+aq
	 9uq75z/bLl/EaFjeMFBrX1ubdQP3XegPiLOu4+BDHfXOqx0qM2xRu9OsGsqc4Q1lcV
	 IpDpHDOJgT6Lm1rHjkMhKLkIEJme6Ep3IpdXH/pGjhIdrcfoGrxRnss93TN6uKIWfT
	 scFJCZZNE3Xffb/KGzfkQ32slVx5Vrt8pxZTFFe7JEaUQVmAvYeX0NYAnP8VNoXh7m
	 Ty2ohY0M9DZFCoitf+DAiyJ/bc24IzRF7OldfEukrDbRX2t8+UHJ6ulQxMtbXPVfNc
	 GJX+UgMEOVIFw==
Message-ID: <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com>
Date: Mon, 28 Nov 2022 14:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_051757_859372_D233A57F 
X-CRM114-Status: GOOD (  11.64  )
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

Il 28/11/22 11:49, Ricardo Ribalda ha scritto:
> If the device does not come straight from reset, we might receive an IRQ
> before we are ready to handle it.
> 
> Fixes:

I agree. That's a coding mistake... but...

This commit needs a Fixes tag, as this is indeed a fix.... kexec isn't anything
new, so all kernel versions are affected by this bug.

Moreover, I can see this pattern repeated across *all* MediaTek AFE drivers:
while at it, can you please replicate this change on all of them, each with
their appropriate Fixes tag?

That would make this fix complete.

Thanks!
Angelo



