Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E60EC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50uqWVCgVpXnGOnog2Uxr5jYdOEAtqh21qpJyNRiVcU=; b=z3RzLd2EhpxwYAS5aqXDWuS3Id
	9785hMIn1EbDYgQlQfpD4VmVOIqKUP8WcNOrBzMzJ510F5xDSnb5r3bi8OjGLEcx6ChQ6bZVuNDGc
	jPgDdpFEoB5tNntTA+ANxdqtlx0Yl60qRJ7Xw/4zHEH4725sXTLj5HgLawAdLLPZdbkCSgb72PTsP
	CPZv+EsFOWqXItK3WljSmam68REDPNuQo48e+S/cVjVRd6aFifaIo/rtJHpzLfCTqfdo0owU88PcB
	I7xYDjzVH+LrqGODclNEUB+xZt2+jGj83ACKowI4WlA5Ialk/igcyloj86mJ7ds9rmP+wrVhS8xkr
	oxIa1m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHFI-005r6A-QJ; Wed, 15 Feb 2023 12:50:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHEy-005qxc-JD; Wed, 15 Feb 2023 12:50:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B4B66602181;
	Wed, 15 Feb 2023 12:50:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676465427;
	bh=qT7FVzm6XK8tCKeDe2rLup/JS7HhXYm37IBT1713P7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5Sa5yQbLAyZlLdbKM0nuUTpSpAlmcoVgYTN741oN6XhBYAJQCZx5nFBDYoWjlIgN
	 +rke1O1rvOQmxISnqxiIBqZxXPc1sKiTZN7Nau3n2ZWvImrHwvzJwzppGFNRzgAGqb
	 J55j1iKJ431A/YAxH73wHTY4hNJsKiSC1fdqt2fc6pv+3szJ+pwD2fDflU0jwKVdhs
	 ifYqw0aRdbyhjNW9K5ATM7UmUaKWg1OdSlZSqnxgNumB+Z3pKDe8+rPcM8LE/iAUE6
	 2ZU7LbXCGQDc8cV3iGIThLAk8QJHS/zWnKM+qNv1MrYgdEPrHcpliFpNp+yhZw4bH6
	 cuUvGIQ9DXObg==
Message-ID: <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com>
Date: Wed, 15 Feb 2023 13:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>, daniel.lezcano@linaro.org,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230209105628.50294-1-bchihi@baylibre.com>
 <20230209105628.50294-7-bchihi@baylibre.com>
 <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_045028_799068_C0DBB288 
X-CRM114-Status: GOOD (  10.73  )
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

Il 14/02/23 15:43, Balsam CHIHI ha scritto:
> Hi Matthias, Angelo,
> 
> Would you please confirm if this patch can be applied?
> and, if it is the case, to which tree it will be applied?
> 
> Best regards,
> Balsam

I think it's fine to apply 5/6 and 6/6, as you're adding pre-Tjunction
max temperature - this is not board specific, but rather SoC-specific.
In reality it's practically the same for most SoCs, even.

Each board will define extensions (that are thermal envelope dependant)
to these "please-dont-burn-my-device" initial thresholds, but that's a
story for another day, and for other people anyway (including me).

Matthias, over to you!

