Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2C7C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:45:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD2A6147E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD2A6147E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bou9KnexEfAXqNRTcUBD9WGgLDMLdRmh4ziDpFS4+Io=; b=Dx32AVCo8WsF33c/MY3NRHlL8
	ggcWS6uhC+9rSLu9etuux4/yzXImn1jn5jBEmYPEv6IMA66h00XqIljwbTN/6zOyT0XOB9NATEeXD
	LITJToHfBAFRmZIi5c3PxrrckJh469UoWOaW0mfK6UjVnN+zK5JZYV73EErJ7Jv05Xase8Ljrxbl7
	IQjhwkR8VdvhDcclucMZvg7DxoR/CeW4WaAlZh/NkJ3HY0XC6VT3p3hD/ymWptKdk6X4wXNkpz+Hd
	76K7fU/UynN7XOX1tJrrRL6vodaLuhZiABSLpx1vpUMJ817NZ3Dgn07IvZJ7E2Fcq+X/UKSmXNFi1
	AHvVladDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSVz-007rH5-Dr; Fri, 30 Apr 2021 12:45:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSVw-007rGE-I8
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 12:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P/Q2UMe6g+bwChqDvhaUqcFVTS8BXNgvHJspLfDiEto=; b=hNAtwkeXDRBbqbrRHUrQl/F9KH
 FZp3uFOT8SxPT1k3D9SGu1RVt73XEUTcNqtL5EvM7lRpVxCHXwvmRUX3ZmXUloudM10vVh6sQth1n
 j/2YP9FPquUhkarp67mg9+J5XzKbMnCEGFgZOd8rpa/Byt3KYQEA3apGfX68gfgurfi7PG6F1aiMR
 LL1kJPeABb21H4x4aJCi8RflivWAhRy/sH9AKbcd6bJp7ErQYfrIVgHJ0Vy79wFtLfQddT6YB82cv
 S8TPsCHQ/rOrr4KCSfw6V1qEExQeIIq73TKs/jyiL2ovs4QXFNj/XIMK6c1OpgRWctlnJ7lSD/bOc
 jEmAAbMQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSVu-001Ndf-8v
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 12:44:59 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcSVn-001oQa-KO; Fri, 30 Apr 2021 14:44:51 +0200
Date: Fri, 30 Apr 2021 14:44:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIv7w8Wy81fmU5A+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
 <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_054458_329206_9EAED713 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, Apr 30, 2021 at 02:37:16PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i prepare rename of musb-driver to musb_mtk.ko as this is also not the best name.
> 
> if this module does only handle mt753x i would suggest
> 
> phy_mt753x.{c,ko}

Hi Frank

That name will cause confusion with generic PHY drivers. They all seem
to use phy- as a file name prefix. At the moment, no Ethernet PHY
driver has phy as filename prefix or suffix.

       Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
