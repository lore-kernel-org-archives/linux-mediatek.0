Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C3C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACB1207DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnTV99NX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ACB1207DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QsuaJ0TTyB5Jlbnpl8uC2oN20xLw3ZxW/ztUAYhT6/k=; b=hnTV99NXGEhQzqN+5g7iO0s/8
	aklXpeqoijlOCw1KLXyMPxlIsxR+1E7hRhldpZAYoLzrzQKuoERm+VWiUMDsB6+Dufv0UIdsQVCZm
	gfKbImhZUDZzuy+gbdwjJulXrj6vs/KyrgxlBNyOOnG5dIUSWgTXm5g1ONShZw2RVuXgd6SIDWqCh
	ldKh2QrohsM0y4HVsCS/nV9Kqmw1ony8kr6K2fSL7Bf62f6dSqsv/AjcZH0NspDsebtR6c7RfucLq
	cr8tQMnsOVSxwLlIHGNBX9P9BadcTuV8aJPjL1SmRP1KZTEHDCFdZvkqin2oQ1+wA6Fqtt/NhFdd3
	XZn0jdNBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84Bd-0002ti-Jr; Tue, 18 Aug 2020 16:10:09 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84Bb-0002tB-9w
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 16:10:07 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k84BW-009w0Q-Bz; Tue, 18 Aug 2020 18:10:02 +0200
Date: Tue, 18 Aug 2020 18:10:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 6/7] arm64: dts: mt7622: add mt7531 dsa to
 mt7622-rfb1 board
Message-ID: <20200818161002.GG2330298@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <fb458715fc82b2222674d857d16841da57920990.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb458715fc82b2222674d857d16841da57920990.1597729692.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_121007_365988_836CD114 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 03:14:11PM +0800, Landen Chao wrote:
> Add mt7531 dsa to mt7622-rfb1 board for 5 giga Ethernet ports support.
> mt7622 only supports 1 sgmii interface, so either gmac0 or gmac1 can be
> configured as sgmii interface. In this patch, change to connet mt7622

connect

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
