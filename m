Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE3C001B0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1HYXE+coLOdcuJ+am2P0PeP2xqJSbH4Iexmg+LIOnk=; b=f2kIIWUc8yR4PqioYGmjd/Ni97
	0hCJnShil9LtQ29V+/85el74DdN85IkOIhSHOxpte+wOVoHkq0Z9uF9lhqacm96wsVTxII3Li+/Q+
	ATRn4+vAW4sJuPxeyBUpYi6In4L97ejRnCQhiNzfVyqQu6EaKkDnJh/bfqYs2pwv4XQccLsizJPNL
	dakSGMIJl2H1fp3GGh+biE+yIrqhRROFUPAB6ZMmxfGwNOTLZKJei4mlbxsUqf/rwz6y4pUPS2AWz
	4BDeoIypAmbEVht6ZUenFF/3/rGrqQSqo8Aw3z46NXB49Nkzm0BMgz6t3NfRFlIjYFiQHdmHyZU+r
	oGv4u2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgjn-003ywH-0K;
	Fri, 07 Jul 2023 08:22:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgjk-003yuW-1L;
	Fri, 07 Jul 2023 08:22:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E8056606FCA;
	Fri,  7 Jul 2023 09:22:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688718163;
	bh=C7CMkxmZPAlHvOPFwq2S9P/9xy5K1sw18FMOfrzXvRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DvqZkfgqgUMrr+u89G0Qog44SqNJzD2utg2faRY9pl8nXtOZORJywbcWcb01Mh9Mb
	 9s4d0sCaaD+ZUnS0VafaPJjmCMK14DnM25sDcVuswmSA9GSQhfIIRC52kc4AYW1/9K
	 +TWstsAk3LrBkXhw1mm5WVGQEthuqx/ZHFZ3qVNAycSNV+iFXF99USK+blOhEVVg8M
	 assnECXSq4tIvwZK2XgsrpY7U+u/fVTi0O9wyllf1pPmbWRNctpZ1UB2NaCqby0+zl
	 Ps7wpuPWcV8QI8mB4aocMhj9X6CQY2QrWPlOWsE0XBwWiW0IkoCSjaFOll4k0bPgV0
	 w/v1Op4BHVtOA==
Message-ID: <16c4d5a9-4eeb-6a92-e97e-6e15eaeb913a@collabora.com>
Date: Fri, 7 Jul 2023 10:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 6/6] thermal/drivers/mediatek/lvts_thermal: Manage
 threshold between sensors
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
 <20230706153823.201943-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706153823.201943-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012244_598885_2624023A 
X-CRM114-Status: GOOD (  12.34  )
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
> Each LVTS thermal controller can have up to four sensors, each capable
> of triggering its own interrupt when its measured temperature crosses
> the configured threshold. The threshold for each sensor is handled
> separately by the thermal framework, since each one is registered with
> its own thermal zone and trips. However, the temperature thresholds are
> configured on the controller, and therefore are shared between all
> sensors on that controller.
> 
> When the temperature measured by the sensors is different enough to
> cause the thermal framework to configure different thresholds for each
> one, interrupts start triggering on sensors outside the last threshold
> configured.
> 
> To address the issue, track the thresholds required by each sensor and
> only actually set the highest one in the hardware, and disable
> interrupts for all sensors outside the current configured range.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


