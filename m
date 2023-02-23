Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E9CC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48pBeIa12XsqPGOagOxDzp08zqn6BZY2aJxSgntOY8g=; b=4ZQEcY5/BDtopaB+L3qSkzzmVm
	vAvD0Fw2zRDy8Z29X49o7cYt7Wn6fm8iRyb+dThAY5ksCKqqMzldv8Hf14TDdtdy8iuV+IHFHVft7
	yV+Z9vCq/ofiSZI5HgQEil9GStwIkd0QDVxHByQ/U/3BNAm6jZfL/lbYxKXTrAyGc+FWgD/LAmOhC
	VcMlmOOF1uzlzodEMQpaS1YS5O4a5fj6X7MdGxy+7sCWrQlKNHt5gLNW8qAh/BtvRXXO0dgBkbg0t
	DFBH2d3/PTcTCz2YGDUjmwo9uqcdk1hhf7A4LCBLC9rdfiJavAPI9ykpNIMaeobC1UZcck8PkjjBM
	XqsN650w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBRJ-00GQJK-CE; Thu, 23 Feb 2023 13:15:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBR6-00GQFU-G5; Thu, 23 Feb 2023 13:15:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 431386602206;
	Thu, 23 Feb 2023 13:14:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677158090;
	bh=SkSiRxzJCEAr1sFTmhH7tHhIkHjbPmPT0MxEjEjw7OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j/U5N8SROmCt35FIpCvoHjrtDq3vh1K97O2176WfFtid0mh7flPCIV8qaGnda8E22
	 yZ2rXWh9EIaLG4HZpo1YeREAj2FL8AdFLh04AElm1nbDsuXqevWRLNw1unj7E9vWOX
	 ha33FfvMGD0/acwTgR8HIa1U6dSOhh9CHY7IvIEiMg8E7h349E7fLxnTSHJgMwPdhl
	 xMt1H9Nzx4uLCpfhNwupuaufCftSgXyDd9VB89YZwfGEKQDLdp6RW1QaRgaLKtnUz8
	 E9bYqQvE1rqoAH2N9UXjDvFwO33L8OAvu17+ZEvJlBsGsUU38zaYq4aN8CdRTrunuP
	 wrGynykDPI4YQ==
Message-ID: <a28d4400-8df1-1f56-4669-261ddd1a881e@collabora.com>
Date: Thu, 23 Feb 2023 14:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v17 RESEND 1/3] leds: rgb: mt6370: Add MediaTek MT6370
 current sink type LED Indicator support
To: ChiaEn Wu <chiaen_wu@richtek.com>, corbet@lwn.net, pavel@ucw.cz,
 lee@kernel.org, matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
 jacek.anaszewski@gmail.com
Cc: linux-doc@vger.kernel.org, peterwu.pub@gmail.com, cy_huang@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <8f139c773de274311c8ca63a47d6b207c30913e2.1677150607.git.chiaen_wu@richtek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8f139c773de274311c8ca63a47d6b207c30913e2.1677150607.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_051500_792975_0185BC46 
X-CRM114-Status: UNSURE (   8.85  )
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

Il 23/02/23 12:23, ChiaEn Wu ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> driver. It can control four channels current-sink RGB LEDs with 3 modes:
> constant current, PWM, and breath mode.
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


