Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0D1C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSEtccGpbMc4sCa2xkEROqW4zVfAr2YIkXXhq3tk/8E=; b=MYEl7u2YZNCANxQ6WzaQ/Sg9Ix
	X7r37njDy5Yrp6J4azIa9eI0c6np/oBgQy6VoQtCVue4EuAN4isn0IUIdJYucpAEavrFviCRb/csL
	mscqYfQ5I3rICLgoIcIozMWlkNoXplPMN4OQi6NDbNvPkDHy9OqecKzVePZ8KNiGjiPeywlbr3q3e
	HBc/Yrpg4da1OJ5HUiniyqF0vICW/f94jNSNRGaINNiklQTJUik46F7hkWLwsPIKw9iJeTe+kDpWA
	zgQ1S7O8nlR6HKGyej6FwOV0ssHjzHJ/qMMACMb0Edy8OLcKOhfRNVipEeDg8Ypu02Kr0HiMmUlfY
	3HuG4zYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWVf-00000008ZG3-2bzP;
	Fri, 08 Mar 2024 09:27:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWVc-00000008ZF3-3BTz;
	Fri, 08 Mar 2024 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709890039;
	bh=Hk0oseGNqngUA5Ryai/7LoOmEnDwbx2brLZDTUEwJYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OXGX5psaWoyzTVVTM+4gWxnnOSt4DGK16dDRK5oYsBYEkjClepJ9RsVV0Fmf6sX0a
	 2g1NaWC56V3D8HPX25CvEF9xHnmc6G0cxKIUdJUuGaGQ/LfJsTP2yzDXeYqUheds5l
	 pL6ITAub1TTK3guyroG6BUEI5vZLsGvgT1lQFAHETc1zYXj37NJMgeRoH+jqz7Xbvr
	 Yj8wKwlGdDgk0bW7bXySo6J+VQ9s72TSmITRNPsej0rScKG7/GM/ZhCdaTs2cKwO2h
	 /sI8DR2nSShstbb9nt9IGWgG2GjA+76AJWFyq/JhTqNXB4DseZ8pFeHxJnRr0vDojE
	 0Pr5n8ppiYi3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9A653780480;
	Fri,  8 Mar 2024 09:27:18 +0000 (UTC)
Message-ID: <86ec5896-8498-49fe-9d1b-546f5ed26006@collabora.com>
Date: Fri, 8 Mar 2024 10:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: mtk-sd: Remove unused of_gpio.h
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Axe Yang <axe.yang@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_012720_975592_232F9E1B 
X-CRM114-Status: UNSURE (   5.92  )
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

Il 07/03/24 12:43, Andy Shevchenko ha scritto:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



