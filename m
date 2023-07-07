Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB44EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7F017eNqHhU4s1TUlbkReV4KYen++Nr5RjRSomxY6w=; b=jHxoIIWw0TjrLGrekIyzxIAFY+
	+mDfRWAMrq1fhGb7lV9UWTvx0ZctslQoo9xtjrEHvszUFwgsyDxOzeCBL0cTZpZMuTrnyuL61vL0n
	fCjcWOC/TXgPj9J7tLLXs+kYo/T+Cd72wo42fjt5eq+Cs7T9nMK0lAdreg1DLBuv2LVowp2i3r4D6
	HITEEASrfvETMO77i4JSXWIdUcYwGnGfr0E3OMndfKf5JjTDGA0lyemLjKspkDHz671/ZrA7fWv1i
	KsNkICgVlVSatNg7i4siVJEpuJl25ZQ7drtitDjo3OGzYPLwWdXcJEeDCTQ54gccfnX4GIgjZpYhC
	FD6B+qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgjD-003yk7-3A;
	Fri, 07 Jul 2023 08:22:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgjB-003yiH-0m;
	Fri, 07 Jul 2023 08:22:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AB9C6606FCA;
	Fri,  7 Jul 2023 09:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688718128;
	bh=KlqmsemJjqgs8TN2Gg23NtEfSBp5PE0Ob4EPcUQRJuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTdK+JOhlS1RgWLnLTo3YBkJSNT581LvyIa23ZL6eicmvkcLaVeZ2g9u18dMNXOtW
	 Tkg1Aq4nQlff4bBZ1dqbJGm9dWMsjhuQwVWbcWHECFBoh1cTZuPbwzJEvY78QPckSL
	 7eka9gMKpUNEg71Ki37FrhwC9A4KGP43lfwQmmpa0tuqv+po5EARjMa5kUpl4EFDgk
	 k0MsmvVaVgxDATr5bRtjL2v37taVHc/z/Qkc00kmGPoqxe4mnx1WiKXKqOVjZGG1yv
	 nFLJEiPw9v261ho8uS3+/h33OHfo7A+TllTaehD8q7Qw7HQrWOYWx/0uJIS5sM8nZ3
	 bKyqCZpet8aPQ==
Message-ID: <7d7db84b-e6be-2d45-fbc6-e891718b757a@collabora.com>
Date: Fri, 7 Jul 2023 10:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/6] thermal/drivers/mediatek/lvts_thermal: Don't leave
 threshold zeroed
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706153823.201943-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012209_410780_26AE6102 
X-CRM114-Status: GOOD (  12.68  )
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

Il 06/07/23 17:37, Nícolas F. R. A. Prado ha scritto:
> The thermal framework might leave the low threshold unset if there
> aren't any lower trip points. This leaves the register zeroed, which
> translates to a very high temperature for the low threshold. The
> interrupt for this threshold is then immediately triggered, and the
> state machine gets stuck, preventing any other temperature monitoring
> interrupts to ever trigger.
> 
> (The same happens by not setting the Cold or Hot to Normal thresholds
> when using those)
> 
> Set the unused threshold to a valid low value. This value was chosen so
> that for any valid golden temperature read from the efuse, when the
> value is converted to raw and back again to milliCelsius, the result
> doesn't underflow.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



