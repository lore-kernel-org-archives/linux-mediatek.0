Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0918ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0NyJwoJ04tqWmur5QEU0A1hfTIWUf6x4ar+VWeAzQw=; b=xYmWzMPrm82jCVP7Kb27sCs+0A
	g0weMG2BVr0zGbGA/LEIrYBhYNdvVeH97Tv3tGmh2+MM/Glwi2NUqFctbr4J4LVZ9rJ1zWaWry0xh
	bSd84Ua0hXqz3hzSn/PQV6XKqnBF+W2yeGNesT9xoTeJA9KvwEWGKoKEbjEijz/4R61YSYiQZ8zLa
	+tqXCzrcXtZlJ67kbFnddOLPDkC6HXS0RoQC1h8wTHYuuPaJuoaE5yB6MLwgZVuZ66UuFmv0VXd5L
	6c6PCn+tuF3NAeRfvGX09mBiA+XWLqjCRrwTP+9ONL4IVVeOrJYhKfsLOvsdWTCAqCSrmNntG79br
	ioKbWiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZUU-00EfQc-Ba; Fri, 09 Sep 2022 08:35:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZUH-00EfLF-EP; Fri, 09 Sep 2022 08:35:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D95116601FB3;
	Fri,  9 Sep 2022 09:35:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662712539;
	bh=e5h4NsyYx1mTUec4+K2kbOsmzRKmrL5mll5JoXOlGyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEKqaNRAPl/lBJ29lA0IzL5j3kq8u1IlWhNBE9frxkoh7xb3DNQMBigx2woIWLOZj
	 cZfnVTdHX4mAWms/tT0faWhkGgzYw9ivAHwx4EkKWWvaIePo1asQO1Kt232JT5/tBQ
	 ut8Ox4WqW+gIOR0l16ZUvQ5JjX/2le4C6UT9RVpgIb5UpvP0/aYFZlc9WfSMOhuo0e
	 cqDVgYK/M42huWhOSoWzDiYocT2V5IcKwW/cm8cB2Y7uZxtoGb699OVJ0nXhrcv+IR
	 LO1qTxMWUe2xHA2EExlhI9tgXR8ruJ7TkCqHazWy/4u2p3XEF9HBkl4lfeaKbiWxli
	 HXMibrGS7/tzQ==
Message-ID: <92c5a7bc-62ce-eeb4-f78d-8ccb39f03c7e@collabora.com>
Date: Fri, 9 Sep 2022 10:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 2/4] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, rafael@kernel.org,
 fparent@baylibre.com, amitk@kernel.org, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 robh+dt@kernel.org, rui.zhang@intel.com
References: <20220909073726.32423-1-aouledameur@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220909073726.32423-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_013545_644943_8B1D3B77 
X-CRM114-Status: GOOD (  11.33  )
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

Il 09/09/22 09:37, Amjad Ouled-Ameur ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Add logic in order to be able to turn on the control buffer on MT8365.
> This change now allows to have control buffer support for MTK_THERMAL_V1,
> and it allows to define the register offset, and mask used to enable it.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Hello Amjad,

I agree with these changes, but I can't give you my R-b tag: this driver
has been moved to drivers/thermal/mediatek/soc_temp.c and, as a result,
this series cannot be applied.

Please rebase.

Regards,
Angelo


