Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F287B60E74
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F287B60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXN6RZiFCjxjKoUiPyZA310jZs4I1BxhBEqdfwHO+/c=; b=TeGTuqnXpVlHGQVcFUmcuTUqd9
	tRcywfMWv85LP+4QoFNlJBjnUXhjpor+r6PFFDGOPaXU+RjKE8ReJUZNgtttk23CrUnpqvohv2uNR
	pEPri5npYKiXd4tTXFRr0REcpu17jY0q7UyDuqiAEDR2V690Ux0Nt8YNOQcYhUwxu8nzqr4TfdQPw
	Oq/CxLwH6w9uiIVI4pyT6t8rCpv6XkM2ruHkvLaddfEsn5O653Ra5UfyGrs7q9eM1wWq0NhAGSo5Y
	rTFyjPGzdVWcJKYF4QL/uYJ/mW3FMcir6Mbbq4UW8vaoRXbPJnd7iD4Kfe9oMZ0Hn4xau5nO/xYKA
	sJXrfvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOD9-00284F-L2; Tue, 26 Oct 2021 15:17:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOCx-00281b-96; Tue, 26 Oct 2021 15:17:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9DB4A1F43A1C
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
Message-ID: <88a4e8f1-6ab7-cb2d-c88b-758b92b1811e@collabora.com>
Date: Tue, 26 Oct 2021 17:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-7-flora.fu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_081747_517833_4D35044E 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add apu core driver.
> The core driver will init the reset part of apu functions.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig           | 18 +++++
>   drivers/soc/mediatek/apusys/Makefile   |  3 +
>   drivers/soc/mediatek/apusys/apu-core.c | 91 ++++++++++++++++++++++++++
>   drivers/soc/mediatek/apusys/apu-core.h | 11 ++++
>   4 files changed, 123 insertions(+)
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.h
> 

Hello Flora,

I don't think that this custom probe/init mechanism through apu-core.c
can ever be a thing: you should simply register a number of platform
drivers (likely modules) and let the kernel decide what to probe
first, what to probe last, as it's done for every kernel driver.

I understand that this may reduce probe deferrals, as it's a controlled
probe sequence, made specifically for apusys, but it's anyway something
that won't give you big gains (and if it was, then you should still let
the kernel decide and eventually optimize that mechanism somehow).


I want to note that, since this series is rather huge, I will probably
do more than one incremental review of it... and for how things look,
this will most probably be split to more than one series, to allow getting
reviews from specific subsystem maintainers, leading to better code quality
and robustness in the end.

Some more details are coming in reply of other patches in this series.

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
