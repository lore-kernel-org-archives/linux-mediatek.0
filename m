Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8EEC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prOCCxWWynzBXdlIQAGVocqt+Zh/4wGqiXQRieeuvRs=; b=qjcNr3o1GuEz87m2rEuE6sJQ+J
	rgfBPac4ZF6Wq7iXv6UI87BinkY8SMSDdsFqWCknppX6bllTvZnZ7sa8mNOPwI69K1+arzrSXFPDx
	zVMeHF8BNiEwzdUovhyHsH49isCzzR3aKbJyf6QDDhVePPlE+S/POhExaKRjeWADqHabCHk9J8ajD
	ZnDetVdNjs+q3ljMsP+j+Sh/ARKL0vSu4eYC0kCDcDB0jyFHm+vh0+xaLiDPzCkS2fy1Lv/w6wOxp
	4YWCb15QvZFkkvIui5yO8mr0WlxcshMZlHzJpM2fMMH5JEJnC0Eyujd5UYak/C1DjkSRROIR0kSsD
	/wRHGu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmAY-00BpUW-0L; Wed, 22 Feb 2023 10:16:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlTh-00BSn0-Es; Wed, 22 Feb 2023 09:31:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC70766021A4;
	Wed, 22 Feb 2023 09:31:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058315;
	bh=z1nbc9uu0vOOIzAQoEiB9OWmVSYp4DkRy59rM1/bgZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eIQroP8mU2qOY/sCGOZpM1hWWFpg6TPZE8qebzrIl5+KS7KhafIXe6H4csJN8wt3t
	 p82KITsZAWCBkbW4SJkuwaO06GJuY8nePV/2nJgVaA2SCFoPLo9kh/sOpTYgmsZj6Q
	 JCxJuKmerXN9mWiC8bEn0rh9eCSvuN5wR+/BJZ5XIAyfqU2WReleKLbzSLIno/z9G/
	 1QwqyKQoTlCAEG+ZN2eB2MCc0jrVZhlwMw5zrqwmEBPe4E1ov1IbcSBhf6r9N21Wmv
	 u9J6Bh9IVxgsIG0t4uvGUWVrrqFGc/b8kXCMq0kaF2qxVssIlUjcX4lSCx24XI6jIx
	 Y+OmtGXpXC/YA==
Message-ID: <94b131f7-9a66-7e26-4f8f-9d84e2c90fbf@collabora.com>
Date: Wed, 22 Feb 2023 10:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balsam CHIHI <bchihi@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-7-daniel.lezcano@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221180710.2781027-7-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_013157_683936_A432CB33 
X-CRM114-Status: GOOD (  11.46  )
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

Il 21/02/23 19:07, Daniel Lezcano ha scritto:
> Some drivers are directly using the thermal zone's 'device' structure
> field.
> 
> Use the driver device pointer instead of the thermal zone device when
> it is available.
> 
> Remove the traces when they are duplicate with the traces in the core
> code.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
#MediaTek LVTS



