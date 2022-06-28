Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D05C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBkQLleTWrfB+RKhzuLwsu8Qt8+hczyVZ3A4HQVm23w=; b=HAM1g18Zydb7aFbvp01HL7oToK
	lMGAur7GKVen6T3Tozik7RsTB3L16FDKJBC62b5hSntsbfzwULXFP40/zrEWKu1AJ/0ivNAjtKQ3w
	yWi/0xD2Y2vDOIsHaa0MXLyAGehqgixm6hg6V8rDoE6ZNccVXHAQ1oKBBf22ybDqMh+ax/v5TUD7B
	hY5jidnEK8GvSLBY4bkY7UElBsRGVpnk1mAezr4veLyMkWpjNM+WVf8I7FMAbtlrKObw+L3ZTtoBQ
	8H/cC0pBJoRuOwo6XFcQasr3KO78rh1kHYostuUOrltNLkbE2wzIRxbVG+coI0S+ejsoNAX73Z2Tm
	ZgULHKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69ik-00614Q-Pi; Tue, 28 Jun 2022 11:49:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69iT-0060vH-TQ; Tue, 28 Jun 2022 11:49:15 +0000
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3321A660184F;
	Tue, 28 Jun 2022 12:49:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656416949;
	bh=HGQEPLnVH+jJ83Zot50l0PdSWCuDqpbeVYS48mJP2vs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kdJe+hsxGDkqHitC4VywwVUdMSa0p1LJvIbmEMvG8yLFoS8FoF05EUhaL7RdtdOiL
	 ODglyQWuRcqO8Z4xTd9YwEoObsgo/eMMBpbHCocY/hUgQ9X3Wj888YUAqLbMXakCvd
	 AjV+jKscFH196pEGB/x6rxUPw3eYVPWpp92JrejLsBjhM+zkPwa7hl6ZeTZlusqnGV
	 gqrYQnbaGmY3NjMUyYfdk4tQJ82vMXZbgFv5xicP4WfdL6eSFVPfQo/UezmQ9Z9Bpo
	 2B/QR++KoJOGMprTXnWMhvpZzccFpEOU2BTwAYxT+d6+8LfU8Q9I6U6caMsZyxmTI/
	 y3ZDg+Bvli1Mg==
Message-ID: <ed9e1326-b62a-bc98-027a-79121fe2914c@collabora.com>
Date: Tue, 28 Jun 2022 14:49:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] soc: mediatek: Introduce mediatek-regulator-coupler
 driver
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 alyssa.rosenzweig@collabora.com, nfraprado@collabora.com, digetx@gmail.com
References: <20220628110128.64137-1-angelogioacchino.delregno@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220628110128.64137-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_044914_126811_75664D58 
X-CRM114-Status: UNSURE (   7.23  )
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

Hi Angelo,

On 6/28/22 14:01, AngeloGioacchino Del Regno wrote:
> +		mrc->vsram_rdev = rdev;
> +	} else if (!strstr(rdev_name, "vgpu") && !strstr(rdev_name, "Vgpu"))
> +		return 1;

Nit: checkpatch --strict should warn about the missing {} here. In
general braces are always needed for each condition if they were needed
once in the if-else.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

