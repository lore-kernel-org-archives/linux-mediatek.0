Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2180DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygh+k8/C8cGltXt1mswCxKXTqb1WODD2Hfl+ahrKAFM=; b=eZDd1KIRMWmjsY
	o4LM9sDpobaqAj0kBw/8Ll8bUCj5NLGuGmkj56rf5p8O8JJ8dZMh/lbsEv9W5Zvyz3db6eRYYWBRc
	0B81nu4PmWLS8FtqKNTFuZM90tKGSRyKUHW/6dX0CMz0BvFP9q1Zwj0qtXyAHwY5PR6iguZJ2bQsr
	v81ZStOoF7lB3eJWq9lsBAi/1TbAGOLPG0D7YIqFlxd503H3lFIezNn0JHstsQWeGbNOPl7oaEXPf
	Xfpw1zEQXJABhRObyoJ1/Pe7aYCKbRBsQOCn93aQF1CsJvjpwwAvXLAyDEvK+y9amOC7494OENRmu
	RL30YTMzx+Oyow1Zn0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFWB2-0007o8-LG; Thu, 03 Feb 2022 07:05:08 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFWAr-0007lt-Aa; Thu, 03 Feb 2022 07:04:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 436F580EE;
 Thu,  3 Feb 2022 07:04:42 +0000 (UTC)
Date: Thu, 3 Feb 2022 09:04:55 +0200
From: Tony Lindgren <tony@atomide.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH 01/12] genirq: Allow the PM device to originate from irq
 domain
Message-ID: <Yft+l6/JQlZM88rs@atomide.com>
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-2-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201120310.878267-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_230457_432920_AB273BEA 
X-CRM114-Status: UNSURE (   9.49  )
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

* Marc Zyngier <maz@kernel.org> [220201 12:03]:
> As a preparation to moving the reference to the device used for
> runtime power management, add a new 'dev' field to the irqdomain
> structure for that exact purpose.
> 
> The irq_chip_pm_{get,put}() helpers are made aware of the dual
> location via a new private helper.
> 
> No functional change intended.

Works for me:

Tested-by: Tony Lindgren <tony@atomide.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
