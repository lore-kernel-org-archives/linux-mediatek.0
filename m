Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD328C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 17:57:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3171B21D79
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 17:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FenTGe7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hAxOdi99";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="K70HagZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3171B21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rplUjxOashSgvJFYYTztHy16MPzbdr0kotLm1S3b3o8=; b=FenTGe7+ptPbXFrhkKgXljqvQ
	L+VjRsn9pikeHrkMJ8ZoAhhBH/uY9kw8cJU8T9XrnhSuAYjJzG0Jo7tB6jnU/xg5jmUPaHIWwea7f
	yzNL3iAVbYY4n2SgIg6odgOfSnde0tcqFGBejC31y7XLudn/rSUDMRM368/ZSnh8+aRHtBd9tum04
	H/uNT6dD+exTGdfSUjlGF8Xii6S1NTeDSDiMTpFqAvVWcOGT6PpUgz/ZqSoc6l3jDJiqaIxTD+rnK
	6BdqijFksUjkDbEVdBrIIkHqZ5CScPsR+ysjrd7txIw+slcZa9qjJgC2YZhtPEUI4yujny/SJ/SVb
	g10+skHUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGnI3-00084r-2i; Fri, 11 Sep 2020 17:56:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGnHt-00081v-MQ; Fri, 11 Sep 2020 17:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9A8KbB8JAsMszk5e8nKi2X4m4uBUOMdvLJVTs/9a5M0=; b=hAxOdi99/7ma6hMDzdkfOy+/Sa
 aEo03jKWgQ/KgSjAodmSEwAcp65yj2LwYDUaeYrtI5Xm6KRO80jNgUEhIz7rPWUD1GJ/fPzJgLL0M
 dqev50JXZwjBwe1D2NiiPr3F45VsniebZWbCT8jQ0WiMyUkGT3kU3Qhd6v7jwE6vRkSEukWO6yTUM
 i6K5VxCDMvrLAmuui73nzDD2VARUHJKyezv5o92ZwHqJPZ1k/IOISX5lOPjv6LzV+amhheJTDUnOf
 7fY9jNQ5mW1kXzbA98Okrcx2dsvVmGXH6pIPcnRGkQPURUrwOHXZoyr3hx/zYLZUSHzoBwfkkNuPW
 XuayMUVg==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGnHf-000214-Qz; Fri, 11 Sep 2020 17:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599846964;
 bh=9A8KbB8JAsMszk5e8nKi2X4m4uBUOMdvLJVTs/9a5M0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=K70HagZw8wEMCtS1a8d2Dg3m5kFuwffKN6+L3l+RPNH3w0GFdargElrh/i9sZGc4i
 2UPld1WDfqu8IlVu97XRJ1WV3TsmwupBk+hL25c9EfO2XnLuy/15QJrv6MeZE/jaQ/
 IRnWS4Y8FilKcgJkcWCWJ/d/USd/dTkiwQQEj3Uc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.150.14] ([217.61.150.14]) by web-mail.gmx.net
 (3c-app-gmx-bs18.server.lan [172.19.170.70]) (via HTTP); Fri, 11 Sep 2020
 19:49:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-cc01b89b-ddcc-488a-84eb-3c96376c2be6-1599846582837@3c-app-gmx-bs18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Aw: [PATCH net-next v5 6/6] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Date: Fri, 11 Sep 2020 19:49:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <9ad3baefb672805153c737f6259966d1c9b98c2b.1599829696.git.landen.chao@mediatek.com>
References: <cover.1599829696.git.landen.chao@mediatek.com>
 <9ad3baefb672805153c737f6259966d1c9b98c2b.1599829696.git.landen.chao@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:BZ5FW3bde8rsAWlm88krnef1H4ZN4Kuf+O7Ne2Cm4MZCc4sc5ttQ+z8IF1opvo/9lcj/r
 9I6xdSujcRKZeLkBtfmSAk7aUzR3218XQlCGOBux68+Z694KQ36aad/LlwK/qylSsjFP+D/rGGol
 VrmbHcyqn6HdAPrckkS5g3sQPKoTAQOIsTgBjWQb3gDipCpSSRDyGGVCZnMpaB3sC5TDU5Ku+idy
 CCwoiWfcWe+cxrzdyb0JYzOrxrHW/zXqWxQ5CkZWwMjDPEUmqzNV3qD3vHDWeOJmX7g1x5DwiUhE
 o8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:c4Itbg7tfxs=:Wj3hTEBDkRHkhWC8WCRmi9
 JjwN8yv8gyZluhkQdpZXJ42GS6xM+/OOynSgDHEIiSAsVklcVVfLu5efKzrM/3hCRo6DdXboU
 L9ZS4UKmCYIxliOLxBmSerhJewjh1PaVPG8XgYFb1R3jGVVbtMTST0KqAnVtiBXm/bZJsWYSP
 LjMtMWbsdSGMmI88wRMZb6mxlKSsPtRWmMKeddz9u9q2H14Mp8oPSAwC5b7VxGklTW7szuy0M
 wpAlLkLeTNlmuy3+w5S7fh1z0HEDE9GXRw2gC322EuornNSssp3u0YQvKlWDVCFgOsUxqmbVZ
 qLij9lsAoPqW8ogwsVcqeEm/mWHu42kVhNOZP00qQO4Y6tnq3dtUgw5KdH9nvmzuq+kkBp14I
 A+IazhsuEjz1+G9aR7nG8zw+9AZLgoN4BaUYimUX4edGZPEuAh/+f939d2DVTnnV2nbpPBkvO
 +cSf21E8dCnsINCVdYYAv9nO7g6jYaN9GEpeYoPT1xvM8h+VRPcV8dLCAmCCsoEVUZ66DHrie
 viRQIj0cG3v3/dddophTFNPMNyOaE0rNG7s7VG3kNdXtSW4SF66TxwTephWTDdkVUkjkAyaZT
 aRzvSAP3QQgDGTfCU5sJa6AdvYU1dp9MABd+xvlFyxMyWxGKOaR+rTuXSsCq6UxseSEPwwPsR
 qRhKW+24yLYJe4JZnZtmPg+RxKsMmtUbVK7VtlVvyyfWWAlBgUehS6HS2ajiSqHQ3QMA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_185628_261880_D73C7759 
X-CRM114-Status: UNSURE (   6.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, dqfext@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <landen.chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested full series on Bananapi-r2 and r64, results as in v3

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
