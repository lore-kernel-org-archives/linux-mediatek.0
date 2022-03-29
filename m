Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2619C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqqM6CLkJ4uibfbPSd6t6F/d6GH1SeDvMmye3a13Mp0=; b=QrI2kagHWAlY6h
	k2sZBCWeDW8LJtkvEa10Zh2t8koWfzfF1Ro7HxMRmC1EyCNwARe02FDCIxN9QSPe8tsWoH3de7e4v
	y4Ux+MBFlSJ+ltYG+dfcg2FWl8bxUN73NGSLZuoxUaUnhTeMzO8olptw0ZfmehPN3Wk+dKO3PL4ET
	6oOya2XDAp12qyjhr7Xdd4VQH+PO5RGT7ueA4uittzr6NQbuG4jZTM/3G7EwjHM24Y5HeY9HZe8PQ
	GbfDnjVQCbQLUqbMvQ/4Z6JYVOkMJLSYQ2iQgaDHKwyUBCiDq0uiXqjRohrPnRMxX/NkDcy47uQFs
	mNet9+ZiPXAQJNHDZdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ9Az-00BpYS-Jb; Tue, 29 Mar 2022 10:34:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ9An-00BpVG-QX; Tue, 29 Mar 2022 10:34:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1F4E21F4107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648550038;
 bh=kPA++nT55REBlchYsmQAKCVDO+2FGIFaT9+6SOaLk3s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gQj1CxjzhqGt0pUEPgcYIaxrs4EYIQarFlqUZ4Is689TDVOvVTj2gAMzgAzKp59O/
 UZSgoLqUDCH4KZ6oohX7H/E9+vcCbAbtE62z5s7Fbqr3a5vnPh/uRdqltiEDUXwj8f
 mOJW9uxFkxyydkosxFVmOk0KqnmlxG1kNjlXKsEIOiQW85PLIT2HA+1cN7ro0AvK9W
 kDdzu++ORpOke56KdtkIm4P37NXpUyPYqp+2mzcBglbQEK4Pgfn3kpnnwmst+td8q2
 TnPUyy/rnQEp1G1hh2kf2nlPK8qUgMUEoAg1VJOrZSqXqh3Hvp2JKawy8IR7DO55EM
 O5Cs1E24l5h4A==
Message-ID: <e9daf657-2a29-a4b1-158a-86f2a98a8900@collabora.com>
Date: Tue, 29 Mar 2022 12:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 2/3] mmc: core: Add support for SDIO wakeup interrupt
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-3-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220329032913.8750-3-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_033402_086280_6F4F736C 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/03/22 05:29, Axe Yang ha scritto:
> If wakeup-source flag is set in host dts node, parse EAI information
> from SDIO CCCR interrupt externsion segment for in-band wakeup. If
> async interrupt is supported by SDIO card then enable it and set
> enable_async_irq flag in sdio_cccr structure to 1. The parse flow is
> implemented in sdio_read_cccr().
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Hello Axe,
there was a mistake about my tag (my fault, sorry), can you please change it from
Acked-by to Reviewed-by?

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
