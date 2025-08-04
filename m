Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F6C87FDB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAP44j28KapwFCLX1U0mRx+4kozUg4OUPSLosvMvTBw=; b=S7vUPsioendmFsPM189OP+e8DB
	kGfhZ4+lFJ9iW1T5fmSoK/AqmwZa3oVm8r6bBj4wnuQamiFCK9hXCb1d/DxLli6+1s060i8gGaoU0
	Q31b90m2mmintKQ57QZudV/cP1VbzhMYo4ZyItSC4eTMoHUgL9jU3Qf4Csn3tXN37QKTvDnGeVpV+
	iZObI23AAh5WI0VSIIvRbbB9DPYZK4IElBW5rXWZglv1dLDUbHzWXyUvuylHXRr58OW7kXgNjnIOn
	eT3q3zCLmNjsnfPHENjaz5my2OJMfaKyPyAg2s2SH8DwinUcRqUAmK3RHT9b8TKJxa4VCVMd7UGG7
	dt6ZRjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir5m-0000000A26G-2D09;
	Mon, 04 Aug 2025 09:02:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqt2-00000009zn9-1bg0;
	Mon, 04 Aug 2025 08:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297379;
	bh=uEPY2NMSqAK+CpEdpvsDmGeXQkYcRzHTYJ6NvWltjLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gl5sO8psb9LsdY8FYwWSXG35W8zf2MMs7VI3+Jv3GmDCA/+PIJY0pCizKmQHZnXS8
	 H7RIoHkiq8YMORSIHO/gStf3f834yywI/NsLAoDgT1ye212GqI/eNWjYFLGGgYypxp
	 r8Ysd5K8lBObzjQwQcpDccpVxegSTfdvYE1Qwc1Zrm4SDKzfnhjZwRKBBdKz/o0uAB
	 Gmrtg79ZB1iTM306zHXddO0rBfj8zChZ4j2HGidF6xIIGCJQWte0fWnqLUxZArRPUZ
	 A48VNKTutYAH6eTSFzy8JaC91+IQYASSCPpzv3FWPNvTi7GQ9q/Z+gj3iBG9IAEBkV
	 Opp88qX0mQ9zw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD0017E04DA;
	Mon,  4 Aug 2025 10:49:38 +0200 (CEST)
Message-ID: <958e731c-6c4b-45bd-ad9f-1860552c57c6@collabora.com>
Date: Mon, 4 Aug 2025 10:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] pwm: mediatek: Rework parameters for clk helper
 function
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-13-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-13-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014940_614720_403E8874 
X-CRM114-Status: UNSURE (   7.43  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> Convert pwm_mediatek_clk_enable() and pwm_mediatek_clk_disable() to take
> lower level parameters. This enables these functions to be used in the next
> commit when there is no valid pwm_chip and pwm_device yet.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



