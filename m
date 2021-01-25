Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21F7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33AED22DFB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33AED22DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BJGIUaG7z7fwjar6VQL+9/z18XWbLafkyaQRwV5IsaA=; b=EvkqFz3b7R5FIBHix/zt0cMwF
	cFhnVr9BNcWvqm2NlafAnuwJR8HYvtKov6yuMHSAs09WR7wLvW3smlxRn7VzH4iYOOb1kLp3kO46j
	AOGqldOR68KlBr2AKATl39s5Lh70+IqK1aqJwwWoziPrASecXOywUD/mvRNyrWB+PFZCw4DmWB7D6
	vZ3sMq1aS642pYTblvMpLwBj82TeX9MQDyoQtxcQXtm1U5zTX6oZA+ElJfBKc+me2u6xXptyQjeBs
	WablOYuNooO5ApW6LLpx4/yro45mC02U0uClaVaYSTuzfv802fMFi18I6LeeKfPsyZ8+PWDrc+DWu
	BOj+Dd2gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41qQ-0006gR-Jf; Mon, 25 Jan 2021 13:23:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41qM-0006fH-S3; Mon, 25 Jan 2021 13:23:47 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1l41qC-002XAc-9w; Mon, 25 Jan 2021 14:23:36 +0100
Date: Mon, 25 Jan 2021 14:23:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
Message-ID: <YA7GWHKazc6fYAcQ@lunn.ch>
References: <20210125044322.6280-1-dqfext@gmail.com>
 <20210125044322.6280-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125044322.6280-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_082346_918637_C3D11291 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 12:43:21PM +0800, DENG Qingfang wrote:
> Add device tree binding to support MT7530 GPIO controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
