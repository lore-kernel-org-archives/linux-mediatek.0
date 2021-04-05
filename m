Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCA9C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 21:26:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC07613D2
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 21:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC07613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s0iM6hsIjSmREkdxefa7m6OBrL95vBD3tgC4bYAtDPo=; b=lWQPiphxRwOvtDxsbXjZoPho9
	DnVRiXgntbTJH9pcsELH5m+O0X+6qdOhqF9RkW+QfV8fb+iN9vcRpZk21Szmzie4M6df+NjdM1qE/
	tLAewFr0Y0YnEkbENHjQzAuLohfe7ki8tb5x9g1aCi5r81eA9m1PjCay1oriuoD9hkBC1atjx/PTJ
	+XcRbdHflYEanPwSMqa2aJFpkWCjl8DdNQ3+29fZxmVKZqxo6LXwe9EbtWOLRx7fSpvvD5HLmQJFV
	wfMJR/RsYVuS7AFNbsnvwOKMAkdCKF2OesBKwl1oxkbPD6ljteO5+kvshytHdaUj8UrJaPS06MyPe
	9dEn6k5mQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTWjO-000hb9-I2; Mon, 05 Apr 2021 21:25:58 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTWjC-000hZl-As; Mon, 05 Apr 2021 21:25:48 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lTWij-00Ezaw-R6; Mon, 05 Apr 2021 23:25:17 +0200
Date: Mon, 5 Apr 2021 23:25:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: kernel test robot <lkp@intel.com>
Cc: Michael Walle <michael@walle.cc>, ath9k-devel@qca.qualcomm.com,
 UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] of: net: pass the dst buffer to of_get_mac_address()
Message-ID: <YGuAPb1+AcFTOYdq@lunn.ch>
References: <20210405164643.21130-2-michael@walle.cc>
 <202104060306.lmTxeOmW-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202104060306.lmTxeOmW-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_222547_421026_5E223E9B 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, Apr 06, 2021 at 03:19:11AM +0800, kernel test robot wrote:
> Hi Michael,
> 
> I love your patch! Yet something to improve:

Looks correct. You missed the #else case for #ifdef CONFIG_OF in
stmmac_platform.c

Lets see what else 0-day finds before i start reviewing.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
