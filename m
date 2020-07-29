Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB1CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:31:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB742070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgFU9RBT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="moO8mzcB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="TK6bTwUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB742070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qJmOE2hCWWD3Nhl3Mv2106JNfXps4cLuUw0PQam8WIc=; b=OgFU9RBTRtBwGPzzp2XeoQasB
	lShWOuBXNM3Qyl4kjzIBuXbzSiSnVLjyzHTxLDXbYGdyqeRNnPzINuSDGD/ej2nnPLeP81wx4wlR1
	tIucLJbbaOCSHTsIA8fWx1d4qKmEK15fH/mm0v30ZMXBRlntzu3c81zxuhMoGS+E0oJ88UhzcwF0y
	HOGtb6TxbIjuXRJKxjn3bvtEFFdicQ/0ITES/QTAzvgeKNae/+Oikt7V+uJPiXt/aiZmbymWjZeux
	FDbR/I5igFOeZI/BX5UIx5RM/hprxIoPnZ0QLzd8x9lVNa3zjmRjMjgUhshtjEB8HA6GmsV36x/zh
	tWnTsmhEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gYc-0000aa-BI; Wed, 29 Jul 2020 07:31:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gYX-0000aB-UF
 for linux-mediatek@merlin.infradead.org; Wed, 29 Jul 2020 07:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/6jwjysC3R7FYZx0gkpHIqy73Z1vAPgihqzQyWq7aQE=; b=moO8mzcB6vUDuGvaGUKKzyExIu
 ANtlm6RaSQJBUS+4+zLVYgyb4MJJig7d6oG5pYjgZb7qTpRDFip9T9ea+cruMHFph0SBRz9Ek8guf
 QYWcK7zRKN7+3QMWq2nClzHpssJz0zfuwwaPNRdw7HGhvLkZvNPBtBsGeofSOBWXl8hV0Fh4+HutA
 wZGIVtOIyMY3lK6mhFYEnprEoRFbwBn4PUlwuuGLMlAv7g0gcWv05hCdxqfzq7nIHra/NNMuYEsnj
 o41PeRFxjsRfhfFtd2ceLNI7flK/VIlcXqRzcH5ITxrdlEF8u/mPtYE7mGAYTzztWNA/gA9rghwRy
 VtmFkXiw==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gYU-0006tl-Nl
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 07:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596007825;
 bh=/6jwjysC3R7FYZx0gkpHIqy73Z1vAPgihqzQyWq7aQE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TK6bTwUW8MtjJXH8EFFKJnMhOzjn29sYIwyiokDnmA54/lqyxeFBrR+yvhFZBVJ5t
 voIxkON12u8+OG0OTHGTOzyQDdrapsXfYA3Ut84WswoRi8fPnfdCsZb1AdhwBI+rlV
 +SYUXBjGBfUPnwVbgeLnf22IdX1Bl7ETCA0v9RGE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.75.74.240] ([185.75.74.240]) by web-mail.gmx.net
 (3c-app-gmx-bs12.server.lan [172.19.170.63]) (via HTTP); Wed, 29 Jul 2020
 09:30:25 +0200
MIME-Version: 1.0
Message-ID: <trinity-2271c653-26b2-4f06-95c1-f64fdc0d3499-1596007825341@3c-app-gmx-bs12>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Miller <davem@davemloft.net>, stable@vger.kernel.org
Subject: Aw: Re: [PATCH] net: ethernet: mtk_eth_soc: Always call
 mtk_gmac0_rgmii_adjust() for mt7623
Date: Wed, 29 Jul 2020 09:30:25 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200728.170547.454266815690646224.davem@davemloft.net>
References: <trinity-fb0cdf15-dfcf-4d60-9144-87d8fbfad5ba-1586179542451@3c-app-gmx-bap62>
 <52f10e30f62b8521fd83525a03ecff94b72d509b.camel@infradead.org>
 <20200728.170547.454266815690646224.davem@davemloft.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:LFOtg+/9chRHhl3e6u15HWjD5zZplHcQ/p6xFuZe2KjmcNMNo4+LXQasBIpAoe6IkOjTt
 OVlN8iD7lOjjKifkxXdQb2xRUNlKz4mK+mIV5Tp6GNbqkQFf/BdSRKNTE7y7JOrue3t4gAuAJWH9
 LGOnPPI+aTaDgv+Pjhy/Fgvz8JfNikMgzuAdJhOH6RFivRtYNMKUJqlwCU2DqLcKBGrne5sw0MHu
 7UxekuI1HDXnCNgzvOnN4JNrXZzvuBhYJNw4eF8ghwtcrqwxOAabUpd/TAsb0eclYAemBhcYcEcQ
 A0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:azLCOmZcRdE=:01GF9R4OxBLxO9kk4G/4gG
 axgxc1vEWIe+r0Y5SDS9hWWPSKI4oDf7zxab4jx76yw4EnLOJU7sVDyrCeDxtESRiC2rLIDDH
 POEU6q7kWE+Ms893KJRtuA/15Tad9Dlc8I76dvGGgLYFidg7KcpDsjwJ17FjTM8O9elaP0Qog
 cioghFsExBKs5jKYnSLSHhl/7Gno5OBxNtPs+lgaSXGuwS/zuc6eVDhC58NaSbc44frs4gKoa
 sMTxapgqi8GsIYOGtR22npk80z3r7aa9lmu5UVg3RzotCj2tp0Mi4pV4uLctlgcfFKO/FHRo2
 rigcOKPud5iFCAVALonVWUooV49nt9IINLJXjkxDGzjRZOsPIo8xGvJh4sk1vhMIDaeJ0e+xX
 1Dw4Av0DYK9RXrWWayD0K7iEMm7GFxDk40IriUkNAbCosmXG2ebbsBu4/2+RGfFTxTkODtHrX
 QuBUKBS7k07AL4yQtqjUgHjhAo8Dn9E66DkvKIwXU1lV3Cgs/wXmoo1yNa3FJjVFo4ZLaJ+rf
 GH0qKED/kbpRLrPwfrmt97XOYDyHMNzIphBuBrJKRQbBQ4EpuzmuKhVz6rp1ts+PcF4k35y72
 dJAT7ClDLKWygT+27Xh2yvcm4f7JherF3UIrDK3wDRSPpz0fqkRjCvG9ZUYCXmAdbeZsMAbHf
 06cZyZhfuXA8GNY1J+aQysqo2yEKkdtmZlo7IUPKTZJzZG4d6FBOUuavmBqyEyFGv9KA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_083115_305097_41BD80AF 
X-CRM114-Status: UNSURE (   4.49  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 steven.liu@mediatek.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 dwmw2@infradead.org, Mark-MC.Lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Thank you David's to get this finally applied. Add recipient for stable tree as TRGMII on 5.4+ is also broken without this Patch.

regards Frank


> Gesendet: Mittwoch, 29. Juli 2020 um 02:05 Uhr
> Von: "David Miller" <davem@davemloft.net>
Applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
