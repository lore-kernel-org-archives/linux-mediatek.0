Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1D4C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=258xJKAj2kmGn20jgmCiz6jUVg46haGAVCZVnmze46E=; b=ymnIzJNRV1eBDVagPg/uQDt9Ng
	x3tbW2LKSTh4qohyeF+jj7basFybP00Q+8UDoGB5ByOVDMTd1JNaDUqucNKaEMs8k6atkHfJUy4vi
	ttacHn7ILVYef6At5SJ9tXF/J0+p2virW3JJiK+WA8X1R89/KUwhjBjhakTPvSYA3mZu6SN6qY686
	LRZLjWUBrJGFP0Qq/nAQOFaQgiIh3XEV7jBHCl0JvBUqQWpoihkbgfV17AnHATPfZ4PwuF+Swotxy
	G1jHFRxkAl55R2x9/8nXaj32y/+jV2rvALBeuqS5XgxQJSprzf9QKecWxGJ4mgYzfwKL6evuGQ4RM
	Kkpm5k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5QBf-00G2md-Di; Wed, 14 Dec 2022 11:44:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5QBc-00G2l9-Te
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 11:44:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A70C26602BF9;
	Wed, 14 Dec 2022 11:44:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671018271;
	bh=vWMG/i0XCLqz8upe0LKns6EShfTqYSiinpfQ04UAviY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQgN+zFFBb4/2tMPRKZBKCD6SGN3wCryzOdFOD3LAwf5nu72uJFIrb6NH7O8W0BTi
	 D9k8ervheSNBfsHwIcv7ofaGL0rWxfWPJo1BMNwPROKP1Kvo0D8iCW/9y0XZp2mQJ2
	 COLwEN41rH3IAPEdwWauwfMnDT1yUQ228W30cXOV45DPbOQyCJTyfgC331FSSJzZZa
	 jb9z+I2LMlVfZnGkmnB3CPwG7J2LS59iS/KKsB95goA2Y6aDBdSHgPx//ezIwDLI7T
	 8s4I1wD398Czdd6sTbODsGHcQOdaAjQFzWW8Kzq2I/JVanhFADyXkZ/SuR3RapnY7z
	 hncZgd/sUB3GA==
Message-ID: <b4a1c27f-44b1-0368-964c-175bc367c795@collabora.com>
Date: Wed, 14 Dec 2022 12:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/4] rework thermal protection
Content-Language: en-US
To: Howard Hsu <howard-yh.hsu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_034433_116253_19143546 
X-CRM114-Status: UNSURE (   9.78  )
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

Il 14/12/22 03:28, Howard Hsu ha scritto:
> Rework thermal protection with the following changes:
> 1. Send thermal fw commands only after mcu init done.
> 2. Firmware expects to disable thermal protect before reconfiguring thermal protect.
> 3. Send fw commands through mt7915_thermal_temp_store() to update firmware
> temperature directly.
> 4. Add error messages for invalid setting.
> 
> Howard Hsu (4):
>    wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only
>      after init_work
>    wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling
>    wifi: mt76: mt7915: rework mt7915_thermal_temp_store()
>    wifi: mt76: mt7915: add error message in
>      mt7915_thermal_set_cur_throttle_state()
> 
>   .../net/wireless/mediatek/mt76/mt7915/init.c  | 32 +++++++----
>   .../net/wireless/mediatek/mt76/mt7915/main.c  | 11 ++++
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 +++++++++++--------
>   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  6 +++
>   4 files changed, 70 insertions(+), 33 deletions(-)
> 


For the entire series:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

