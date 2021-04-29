Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B169C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3CDF61441
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3CDF61441
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1SVAd/Wgc60Txp0Ls9pdN0woPQW4Vf0kmoJvjq5bm+M=; b=RhTo28vLKNeRnTX8QQZ5gZgpv
	5GytOrs1vg7YyHWH29Ji2sri9BD+iOKPkvQW+W9O0t1cqzx8NX0UItVueNUgHW39BmdKCTknOWSSQ
	xWqpC4vVCdWWbokCDdtFLj2moqKDSV1OJ7j1e/Issfpqga1y9s6B3Wb1xv+ncW54k09sGUX6Q7S35
	WUt086D2uK6lMXm2AnZDHrgyiPZzIGi1i1+AAQq1w2Wlgfc6EAG/Sl6WjJ3kYTTRPl2fhRwzSS9AO
	JRyGIOlXnrZjckmWio+ZoBu7dB8+bMA8n4u1UYt7j3gh5WddoKk0Roo9CDx/btcjPExbyLTx9Xq47
	ALQGzHmxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEFZ-006Zbb-0w; Thu, 29 Apr 2021 21:31:09 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEFV-006ZZt-DZ
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 21:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wEjyC06ii3dCwTCAT/qPducM0WGUmq305cPDsW5uTyI=; b=W/xRzyw2mc9+oa4J39yuPoyihO
 8hyhbfynffo7vUF28SgVIXCLL7zy+V441lazXwNxtYxvv0xg45QiMAio28VWup6Xm22oroZiVba5g
 T6UWjWNokhknLjpJuDem1sC1jdBCMJxyIFhMrrpLAiQaORtOm2EFzO47eclQrkNDkrKR6ei98UpWX
 oe16dNM+Qnk/zsVr6HZB/SMZwKSje4paJwALg6LcIxrU+IhPZqLa2iopFX2ASfZg0uXTNagLmN3f+
 Ijzr/QsTPxTtQZUyoJ53Ik8qhEV44Yeiuh145b2Rx0WxQW6CIZk8x0LTQLAo3A2fjwtwxur57Wa5z
 COGDGeww==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEFJ-000z79-4Z
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 21:30:54 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcEFG-001iMo-7I; Thu, 29 Apr 2021 23:30:50 +0200
Date: Thu, 29 Apr 2021 23:30:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530
 interrupt controller
Message-ID: <YIslin0UThINIe+Z@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143053_193741_217A0CC1 
X-CRM114-Status: UNSURE (   6.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 02:21:30PM +0800, DENG Qingfang wrote:
> Enable MT7530 interrupt controller in the MT7621 SoC.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
