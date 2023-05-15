Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF882C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN4DVTBhgD8ST06ygHmyVX2KEJ/08GMgUPb6pbPtlz0=; b=1VVug+EtoQCu1k2g1VEc5vFHG7
	ZcmilgFiHw1BzsMy2T+adkMpNQNILEBtdO8E6+xMDhH8zqZP1zgmnG+Bss+tf7LdKwg04nZPK/hAE
	iVPtRit2QfZWgjzUj09Grpcz4nVlTpALoPHluaSbOi9zjvqr4j2OEElB2nC6wr/Wp/F6ksvGUBaXC
	g7vMo2H21ojrwCfVCue1eCuk3bEP5hBW6T8Pmu3CUEQPbuR0kIfW6fOjfjiawynfzy2z/WHxwwqWz
	bwm3O7v4xmWLJcRbe1Dg+Hi1i7Ytx8N4/KYDAKT10Pug64HHoSSlp9C0HOsgziIeqUc8UQ7nOvdQ5
	MVN3I6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWR2-001z7L-2F;
	Mon, 15 May 2023 11:32:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWQy-001z6F-2m;
	Mon, 15 May 2023 11:32:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1A3366031D7;
	Mon, 15 May 2023 12:32:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684150327;
	bh=AfyjFdjKjOCsPrPBTSHo8RI+xoq5WDytfUyvMtnaIrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PuyAgI2m2fSpbJePSFPJHVUqvlOk15FKOWfxYw03phWt40OAgmitzNTl05Z1lYs4i
	 AmDpJyWcCv9jeK5VVLA8L4B+YHKwKnP58T8SH4994nft0B8IVDFQl1jtccCPUPMZ4g
	 T9xVKHROuR8QtIyjcNjT4zqDEBURn1iPzbwaYs9A6lRZcJtPVl+JQSfhrQqCJklqCv
	 sKjlZkSRK5LiuZ/dfHRS2PAEwxvDUTqbWYyPUE1e3Uc8keL15pUpGTPvUFWYBB7Qqv
	 Rz0K1wP+NXKfaYR/Y4gyINKR03OU9YnQCHYmrVT5SuP5qyZq6KzCVIaVRZ2Qzxd63K
	 b2PqC9dmLd/pg==
Message-ID: <c9f2a2d2-c7cd-4b46-0133-c6b44c69650d@collabora.com>
Date: Mon, 15 May 2023 13:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH linux-next v4 1/4] time/sched_clock: Export
 sched_clock_register()
Content-Language: en-US
To: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230421034649.15247-1-walter.chang@mediatek.com>
 <20230421034649.15247-2-walter.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230421034649.15247-2-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_043209_060398_D10E0D32 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 21/04/23 05:46, walter.chang@mediatek.com ha scritto:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> clocksource driver may use sched_clock_register()
> to resigter itself as a sched_clock source.
> Export it to support building such driver
> as module, like timer-mediatek.c
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

You're the sender, so you shall sign off all of the patches. Please do.

I can't give you a Reviewed-by tag because of that.

Regards,
Angelo



