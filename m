Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F0ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvPiBwH8NLb4J2QXfw0U5gl00q3gY4CpGxbcjujiABM=; b=4nPKSJo38X2D2rrP5dbQZPy5nG
	WEl4ddhZAytBpR0imWiELAikSgYDsngpR7zq8vbSmPqRci+Mi2jTTk4LXOE4Kj1HZ3RBQNhnXtiGn
	oVGkqlzGkSJksDJxxTV1kO3T3RM1rSnpsYq5h5UG4ka/QZ2jj7QHpbUOPVbYzm/yGS21pXDxl2dcF
	4/EpFrcflgI4RrrggEtUejbwZIEwOlVJPCTKfGMt4kUGLOM345gE+rHiCXUBUKoNtfVK0tr9BzTN4
	93fGF4LJvnTLCTrrngLa1KcY6Nb2nqc09c3Xq0esUp27x/ueTAqPs8geqdbXweMMk+MFdhOwOtn9r
	iWz0YzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZVl-00EgdL-2L; Fri, 09 Sep 2022 08:37:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZVZ-00EgWe-OH; Fri, 09 Sep 2022 08:37:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B05F66601FB3;
	Fri,  9 Sep 2022 09:37:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662712624;
	bh=sUFQFPB1ZomN7xd2eFsCtP/mZPhFujgM6qQtJ4pPldY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m2CiJOwI2T/J4+wtOj/gwUevwNkJ49cTBVeYVI33A75SO2K/Z8X/12qc4+byfGehM
	 rNM+x8S4QB/zsUwr4ouCVQsl1i35bBr4NYncva6qVZ0T1HfjL+GjV4d5jN7gx9+hlk
	 ocgAX5gFwvF+DkBL1j+l/FdPzG/tXir7gAkkuOi5cHvW6aP6EXRJZKyuHj99b5ulTN
	 TF2pK9/lXh+0TNq1BWMkW87gZaPdqvFgAKTvlFgrKas3N/8+YK1K2YvAS8bInDvTzc
	 KqhiF+e0+sidAA3tV0/HankEIaYRqr5KRoUoyyFctVQsGOxE74aFtxlZKlN02GdTYK
	 dY77+FHZDY77g==
Message-ID: <a3288784-18d2-c553-4a76-ddae4de3a751@collabora.com>
Date: Fri, 9 Sep 2022 10:37:01 +0200
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
X-CRM114-CacheID: sfid-20220909_013705_955071_B9B719BA 
X-CRM114-Status: GOOD (  11.20  )
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

Sorry for the previous reply. I got confused by a local tree.
The driver is there upstream.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



