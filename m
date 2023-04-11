Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85617C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4yCh2IFZ25gTi44TvKiQR2o8rJNQWTd7LOFC4tJUGA=; b=m6eg5IC7G9bvj05UzTEOzbXVF6
	8iu9J2AOmhe+ECAwh0NjJqU8ODK+X7ln+DBC6Cm5TZ7GKs+3Z8amyJmxVQy+1x0PlUdLkPTQf7uUe
	mlEY1sg4zPKSGyYvdzj/4/DVIHDlrxe04KF2pzmR6rN2301lsogFOTbshBGANyq9NjAj1lIrJ6hD9
	eWbQfOhyDHiNkMYNulKfws7EgZj0fnmJOe0xUbPQuDcX4OpG1gjMIlI4wSNfVCYR+yjW57GspmA25
	UTpBElnrUHL89wzhe1caOz00DS/jZlKCAiZ61F7rtIIwxG+0pioBqoFvvfLE//5WdFmuF04IM83OF
	TLjAwSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Gp-00GqJj-07;
	Tue, 11 Apr 2023 08:22:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Ge-00GqD9-0j;
	Tue, 11 Apr 2023 08:22:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C97A466031E9;
	Tue, 11 Apr 2023 09:22:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201339;
	bh=hvRLTruikuzHoGIAziMiEYGR8Or1q+1dehgCP7XVjVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=is+TzxSxRy6Qy2649H3i4F1Dihqygvu9Lwy1R/C5+F1F4ZjBj/+wVssxtH3tWUhxe
	 fxoIbU6RU15oDJDVXSB0m897UTWeXAUBgWGcY6CnexyR1bgmikJWmCgJlM82s5MSGX
	 j6S7VSciCZ06l13HuIfBmewhwj0VzGfSoAIY8RMS8F7NblZUwpFx7I9erZBAqMcoqc
	 sOSFBGO/L3lmSfDUOXiF47u4MKfgmIgJMkIzFqc+hbKBup7f9QbCUAEVBxuzxxTMl5
	 5JqkETcWEuLmCjQy2jIp15oOvbeFJAntf/O8fyzdasJs6h6zkyxNE1WqmV+sEzOh4b
	 DrWwHOckVZUPw==
Message-ID: <b968a3f6-1aba-fc72-a2fc-1b0d7944b07c@collabora.com>
Date: Tue, 11 Apr 2023 10:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 05/12] arm64: dts: mediatek: add mt6357 PMIC support
 for mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012220_409461_9A836085 
X-CRM114-Status: UNSURE (   8.71  )
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

Il 07/04/23 14:59, Alexandre Mergnat ha scritto:
> This power management system chip integration helps to manage regulators
> and keys.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



