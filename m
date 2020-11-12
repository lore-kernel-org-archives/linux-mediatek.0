Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E659BC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 21:29:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F73216C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 21:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1nCsinm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F73216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+wVQVBw6O7A9yUFoJ7zmWZawRnja0WP+sGAqC5obeu4=; b=P1nCsinmtNeuw45Y0lCrCoATN
	qFVKufc2684etggp5y4jOtGF8/Br7icqcyh+nijBEzvZB0Z3Ii7xo6m0ZqlHmhT2bJzIaVdIsPvzG
	bXgoM+qTeuKEfeblRljB6FM5PQRbZCmMotnROnAG0SWSFokSIkcjseqEkuyu/boGMHBhDtkz+3nhQ
	43hYLTmBpZ+e0g5HbSCnBL1xvttIr1TAMpaZflldv9D+YmxnnJznQMr+uakoraPu5Tl9BWKrtZGDW
	iCxx9jat3TTmat8pBYp7hhFFwLI3RXBzDC0R6ag/J9JikTpDuSp2kt4z+zjCe/uBJwk3VjdZh7Zwm
	jRgBtkN5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdK9r-0004Jt-Kj; Thu, 12 Nov 2020 21:29:31 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdK9n-0004Ih-9j; Thu, 12 Nov 2020 21:29:28 +0000
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id D4714419B9E;
 Thu, 12 Nov 2020 21:29:23 +0000 (UTC)
Subject: Re: [PATCH 29/32] pwm: lpc18xx-sct: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, claudiu.beznea@microchip.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, slemieux.tyco@gmail.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, heiko@sntech.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mripard@kernel.org, wens@csie.org,
 jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20191229080610.7597-29-tiny.windzz@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <a9e353d2-3d08-adfe-de1c-3efdcd2e5f71@mleia.com>
Date: Thu, 12 Nov 2020 23:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20191229080610.7597-29-tiny.windzz@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20201112_212923_912288_DA2B1D97 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_212923_912288_DA2B1D97 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 12/29/19 10:06 AM, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
