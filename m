Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFBCC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 12:57:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E6761179
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 12:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E6761179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P8gQedrg9ZUICw0KgaNbWNX6wqUhwb08XS4vnieiAn8=; b=R48w5RjyOeGKB+kevuZFOdXv2
	axuAfuB1Xo3qhsWi8a39zP9vbyNbN4L7pGJZwZpOEtq1UzAuoA3bdYCZPZgE5cGnS0S+0ZUygaAru
	zlGjA9a7x0He28LnLXjgMpw/yNbPW1y3gU+HsnQY6PrUtyWgtEt87B5w+M1b3mX2+IUK/gaNweKdH
	4/9u39UabJVKkAPzLQRpivdBnGuaJJuP3r9Z1Qei34XVgwy1RMfmRG+jG41Ct2NXARrum9nIzC4Cu
	h0os4XAMY0z1uqnOxLbtNI8VQu2XG8fH7r7hb+7Wa61axXcGVRPyBmfVvRbPxH/7hSztJueYezaDG
	su+4BJSrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWf4p-00CeeV-OF; Wed, 14 Apr 2021 12:57:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWf4R-00CeaX-Ai; Wed, 14 Apr 2021 12:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=nIqcTyZ0aGklq+mdSHotuPklBOhZa+ud8+bN5Q5+CPw=; b=lojQOCUCefpMRvGW/xx/VDdwQI
 NbXTjba3ub0vcoukuA9XIBjkWPikO+4iXtqZrVlNr0svArf8zaZMGVVl1MbCe/8RSDTFL6iXZoVwH
 wyEnSJNSG8lzkY8Bkzdz8A0/+JPo9VYHXcqFPVluO1R4JVk/ZoQKhdfevbfZk4SqSYq3V4fF87jpV
 LSjprDVXrba4ulTg3ghy2VDVSfly/SpiuFUd/tF+83pOhnXAOhmVIfqiRptB92v260kXnMWyFT4fa
 7swqEF23FWzicDnj1JUp+knOHqAFgT/wrmnUJMggrVDSQoOP0uUfvI2X5DnSDZQZWUZKOJ3Lz9PR0
 /XxB67oA==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWf4O-007lxx-Ei; Wed, 14 Apr 2021 12:56:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E331F22236;
 Wed, 14 Apr 2021 14:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618404993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIqcTyZ0aGklq+mdSHotuPklBOhZa+ud8+bN5Q5+CPw=;
 b=VZL40Qx/ZFqrvlYpNa+CpUnri3A5IcdLrj+2SxpxVHAI8fYpizPcSIOU0o4IGsNgU2L8zb
 buzdqfa91h/T+Kc3jCccsyXkXKwvO0deOpvm1xgmDARKkJkG9wKdcW8QSFZ/zWqZRgSGou
 k2tTqyTzN0TuoPWxydGMvbSU0aMYGjo=
MIME-Version: 1.0
Date: Wed, 14 Apr 2021 14:56:30 +0200
From: Michael Walle <michael@walle.cc>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, ath9k-devel@qca.qualcomm.com,
 UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, lkp@intel.com, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next v2 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
In-Reply-To: <20210414053336.GQ6021@kadam>
References: <20210414053336.GQ6021@kadam>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cf5c86dd6492b9c1907ea69e2d660eb2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_055636_683518_8AB572A5 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Dan,

Am 2021-04-14 07:33, schrieb Dan Carpenter:
> url:
> https://github.com/0day-ci/linux/commits/Michael-Walle/of-net-support-non-platform-devices-in-of_get_mac_address/20210406-234030
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> cc0626c2aaed8e475efdd85fa374b497a7192e35
> config: x86_64-randconfig-m001-20210406 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2069 axienet_probe()
> warn: passing a valid pointer to 'PTR_ERR'
> 
> vim +/PTR_ERR +2069 drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> 
> 522856cefaf09d Robert Hancock      2019-06-06  2060  	/* Check for
> Ethernet core IRQ (optional) */
> 522856cefaf09d Robert Hancock      2019-06-06  2061  	if (lp->eth_irq 
> <= 0)
> 522856cefaf09d Robert Hancock      2019-06-06  2062
> 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
> 522856cefaf09d Robert Hancock      2019-06-06  2063
> 8a3b7a252dca9f Daniel Borkmann     2012-01-19  2064  	/* Retrieve the
> MAC address */
> 411b125c6ace1f Michael Walle       2021-04-06  2065  	ret =
> of_get_mac_address(pdev->dev.of_node, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2066  	if (!ret) {
> 411b125c6ace1f Michael Walle       2021-04-06  2067
> 		axienet_set_mac_address(ndev, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2068  	} else {
> d05a9ed5c3a773 Robert Hancock      2019-06-06 @2069
> 		dev_warn(&pdev->dev, "could not find MAC address property: %ld\n",
> d05a9ed5c3a773 Robert Hancock      2019-06-06  2070  			 
> PTR_ERR(mac_addr));
> 
>   ^^^^^^^^^^^^^^^^^
> This should print "ret".

Thanks, this was fixed (in the now merged) v4. I forgot
to add you to that huge CC list. Sorry for that.

-michael

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
