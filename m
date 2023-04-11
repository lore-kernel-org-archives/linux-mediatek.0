Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69AC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt/n1zDATMQ8AjF/tNTebpfGXfzU/yXB9Bo34xiiFtQ=; b=FlMg1TeY2ZuQAxvyswOlJapfbC
	nDB27crsCV6gKVo5h/yU8NTzs3D7fXkE/qq0lxEsJy9Vw4o2CFkuDuiribr0rbUHAIG6o9Gkx177P
	QHWEWcjFK1N9oiAl3mukUjgSDYMP0LXiFf4l7IdCtdY3IbxxHkxrzSWtuimDPmyaH0W3LXvtJKWQC
	bg8ZOTSQs1TQty/LdWjdnSCD0FeGiCEOMfXnaL7krYEjGM+Gd5EyqfCr6HA12Bv8cQ28jj4qhiC5N
	fT4uun/Lry3jljAMowgCskhkvNY8bTD3l2qx7eV8HGhb4VS13VKp/FR25mIwi6wZCeVcJLnW93+7N
	BmwCiGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9J0-00GrOX-0z;
	Tue, 11 Apr 2023 08:24:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Iw-00GrLu-1N;
	Tue, 11 Apr 2023 08:24:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 290E066031E8;
	Tue, 11 Apr 2023 09:24:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201481;
	bh=cY3W9hAeKubu0XqrsJSQf99ttpw/QtGoPgsok23jKA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HIi6i2AyTaHO1NtWWauC1ngQPUMjg/IqKMrNKLHXyWua1NMYdbTBFdozTuYd6YUEW
	 E1sbijD1hagTl7JiBfyZyEIxZxvPIHdUvrnsAIK8zDvjt1pLWZihs0bOpkGlQvqync
	 B39xRinP8sJbdBQLaintNi8GtgGDOnbF//gp7HmTPAFznNgnga6x5Q8602dznA7hbR
	 8LeLeBszRH9tGmxa1zIvi+R/K9FeOqp6BIteVpF0tygqyUT+ow3UrdBbnTi28HJBKW
	 6BTYMip/4uY7aw3OjVgnEsVbX8IhyxfjF8GMOP2zD/m9bFBMxtiU7LJ7dG6S+UuEPQ
	 DBGjYxEkdPtjQ==
Message-ID: <ad4933b3-c4c9-ccf5-87e1-cd69610accfe@collabora.com>
Date: Tue, 11 Apr 2023 10:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 10/12] arm64: dts: mediatek: add OPP support for mt8365
 SoC
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
 <20230203-evk-board-support-v5-10-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-10-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012442_597310_AF03FF44 
X-CRM114-Status: UNSURE (   8.62  )
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
> In order to have cpufreq support, this patch adds generic Operating
> Performance Points support.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



