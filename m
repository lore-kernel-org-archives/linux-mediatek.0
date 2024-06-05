Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9306C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K81YwR+qxJqm1mQZg6UO7/ukijH/IdkGrScLoIhN8hI=; b=YuAr5OPnqgqZUkldDjGomOpTkR
	R4j0HeT7lht5nJEF1ugc3Y/gx2zssq4wym2S0mCwEqssY28FfnYSboX5DI8hKtRz3LOhh7QG9FzPp
	PqA7BGT0bLX9fuM6slc/kkEVCtkzltHny5VspLFIwwQoR13PMWsv7cQNIPC+T9CR+4wspdjoKBFgM
	XOYv+ej1zpUJA4LwimNh5kX3L1HsN8DsdyH9cDoQFWZxxkiD1BnKP4Q53pgSnlY3Ha1cB0ay+Qkp0
	HWUsOAizwUdcm7TtaKh9GwcHRtZGHzYpeJLV8ZZidI/YxAHRhbKp1bUNJSj1lWTP5FDsQaM/ro3Cy
	qn/Tzziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoRv-00000005eLJ-1Zvs;
	Wed, 05 Jun 2024 11:04:59 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoRo-00000005eK2-2r1z;
	Wed, 05 Jun 2024 11:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717585488;
	bh=2hjwVFmRoFTS6oZrCvJYjFdWpPR5DTpzZ9n/nHhVnwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K6C2/xpdswwfBcJ8pX0D/sIOIMtdjmRjwYmn35v/F8f0QIDfOZcoqicTE54jQQWgZ
	 AY/FakYDMcM+W+0L00enXMR5z/k9QQcZ0f9wRUqU5v2OjDnXzBGsOuybbAzYxTT5PU
	 z9pxSfHjs61kj98JKzuE/b9Fgap9ekEkRdhK5ja9jSN5dIOnRrMiNNvYGcbNLoMUgl
	 QUhKYTrAkR3RFY5+90iNHLJ1I5Vn6o4ijxdlvti8wGzcwQbolMp+d2gcoK4KXxGbAR
	 /Mta48PsVYCfMWCdQ/t2AiikgaDoMqRr8oy0S1BFdr/IB1oN5wWy1P//6Dv1bAXX4H
	 a3WALSnj1I7hQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DA8DE37808FA;
	Wed,  5 Jun 2024 11:04:47 +0000 (UTC)
Message-ID: <c7162cb8-6a80-44c7-9dcd-830e5c8331e6@collabora.com>
Date: Wed, 5 Jun 2024 13:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_040453_382467_E4D4CA0B 
X-CRM114-Status: UNSURE (   6.90  )
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

Il 04/06/24 18:46, Julien Panis ha scritto:
> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


