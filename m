Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8E0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 19:37:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81353205CB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 19:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QnxFGxjV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81353205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H47MpcsaFpVqmdmWQ/wHicmoAuR2q5P5uYJlBoXEO6s=; b=QnxFGxjVipQR+KBhFTMJcESFT
	f3ga1VkEpv8tYeoNi9rDjUtQ1FuhNLMJkZo6COAUUvqVNL6GUf3xSgGojonsMmU9c5V8y33P7yP9c
	lEirF+zMWBUX+kxwMafwmGMChiKtPE3lXRCU5pP1dPjRuWL9QsZP2l+r90+ltWj+M0x7Y5NC43ARp
	gq600X4Hum2t/ozEQ0gLQ1zmiEW4jXnOMItICWWOPGXaYuumi7mV7JLXbemlqONl45sTu2kJsjLQV
	u5H9/hv4GzLJPQ8IkXmlMnK/rlnqxKGYChkTMyIAsdXeNxIoT6pPAhgLQkHqFkdc0MoEHa0xji26z
	71ChfpCSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtFsO-000372-Cu; Wed, 08 Jul 2020 19:37:04 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtFsF-00030v-Fi; Wed, 08 Jul 2020 19:36:56 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B6CD01276B345;
 Wed,  8 Jul 2020 12:36:46 -0700 (PDT)
Date: Wed, 08 Jul 2020 12:36:46 -0700 (PDT)
Message-Id: <20200708.123646.545653837566811385.davem@davemloft.net>
To: frank-w@public-files.de
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix mtu warning
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200708154634.9565-1-frank-w@public-files.de>
References: <20200708154634.9565-1-frank-w@public-files.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 08 Jul 2020 12:36:47 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_153655_784150_F34AAFBC 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>
Date: Wed,  8 Jul 2020 17:46:34 +0200

> From: Ren=E9 van Dorst <opensource@vdorst.com>
> =

> in recent Kernel-Versions there are warnings about incorrect MTU-Size
> like these:
> =

> mt7530 mdio-bus:00: nonfatal error -95 setting MTU on port x
> eth0: mtu greater than device maximum
> mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA =
overhead
> =

> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> =

> Fixes: bfcb813203 ("net: dsa: configure the MTU for switch ports")
> Fixes: 72579e14a1 ("net: dsa: don't fail to probe if we couldn't set the =
MTU")
> Fixes: 7a4c53bee3 ("net: report invalid mtu value via netlink extack")

In addition to the other Fixes: tag problems pointed out so far, you should
always put the Fixes: tags first, and immediately before the other tags
such as Signed-off-by: etc. and with no empty lines separating them.

Thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
