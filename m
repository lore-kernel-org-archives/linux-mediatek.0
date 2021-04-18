Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A29C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 12:20:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D5261359
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 12:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D5261359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vA6+1f34Iv4LeER0CVv7iCbzHDBbbZqUKdr58xpDskE=; b=P0frwgozU5B1tAoL3YFTI6v6B
	jFd9zCRoLuyMPhEMDkemJc3K5iCPMCJXRvd9CZVrxTl2QLZB1x7jez9eO/eOHdS5Ih+QU5KTw+BFz
	t/MW2gfpR3NNfB3qnRNrjW4zuJm8dI5MGI6dpw/iLM2DlCSQi7lQ1Lm0BwL8eK/6bCTtBycpygCdp
	XgCjNwFGKJuSVxD1U2jtKIA9/Dyfx9SkDXDNgYUBU+XeDEGrlctqSfIUOedR7Is1jl0zQWNeNmmVp
	n9AuYz/INalQV9jeXrSPCP2ZM/PDuD/ZwI3taOquYzdscVsKTjxqCueRag4XNgu6R+hkfO0ljUfVH
	pMURowIDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lY6PY-007u04-MU; Sun, 18 Apr 2021 12:20:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY6PW-007ty9-QT
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 12:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=KrJxZ3ktoX8ugMIz09NLW4gbn+NeR1J5vIHhd/Rt0b4=; b=bCly8mTjsbr95F7joSWw4NH/4V
 Lh+Al/2HJSuwQqgj9AdfLKnC/7H2zrRmI7JnVmKXlAsRN7pbvDK81ItiTCNHelqfOw6ShfsDk+GHh
 inLS1mZkKGHn2ka6BN+UKLoV3AZbNuLy9wWFqkEia5O4bF3o75na7STerC/eqLFucbNYNOZ9/wrG6
 Gc9OcByiTXQdIptJJhhEMhS1oBOO3yZ3x1qx9KnKzV18dtoeSzxVICvYFQ37enNw58gVCDk4sFi+w
 hJllmXWdQvHUR3MLegFgpGsvOrWp9tdmLHCyfJJF+wyJqcy8xsYywU/qYEcVgkq2igBOXBD4eGsXK
 UgskO4vA==;
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY6PS-00AQ7O-5c
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 12:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618748404;
 bh=KrJxZ3ktoX8ugMIz09NLW4gbn+NeR1J5vIHhd/Rt0b4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YLFIFghVMg8gSivY5How0d537JTJoO5HLC6PznzaBeSUc8wV7L/eFFKedHNvn6RC4
 QhEEtsxc/KCF6jmJRZt8LW4D3P4X/sDCsSBdc3r3RUOoqnk74157UYPv0Gp0qMJA4b
 F+QzZ+QaDxqDaPpm2X0z1CALegKte6Yjo5QMiWS8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.75.88] ([80.245.75.88]) by web-mail.gmx.net
 (3c-app-gmx-bap31.server.lan [172.19.172.101]) (via HTTP); Sun, 18 Apr 2021
 14:20:04 +0200
MIME-Version: 1.0
Message-ID: <trinity-a589052c-229f-4be9-aad5-779246fe2024-1618748404510@3c-app-gmx-bap31>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, davem@davemloft.net,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Aw: [PATCH][net-next] net: mediatek: add flow offload for mt7623
Date: Sun, 18 Apr 2021 14:20:04 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210331133437.75269-1-frank-w@public-files.de>
References: <20210331133437.75269-1-frank-w@public-files.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:cTNeHwOY6sX+aBIMeXaS00D/xbai9pT3547kt55/25/7h+ZEHmjF8qW/zxxmaUNt7v0EQ
 hDWe01YzRpJ43L3/b4ec/XgTvsqKEqrwcUnv9+yCLnp/uLNDS6H+y24+2BZ6hQtP/hlw4O7Z60Iv
 8kRSTkh/Ya0ena95pfOgtSQvynZxqpn7187Ta6rmFdP58KkjJ0Elyb1zT45Chlt8BbyGcrSSRbOs
 WIVPSivO8WP4TQoXTEMsvz4HDyQBsULDQ9CIxbqIzY4lAVLTRI+vlx9b17z2djh/LMjiZr+VfgWJ
 lw=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZqimDKHl4jk=:ULSNJzrUxiJPjPpzO0DQmj
 v2xeCkV6xxYePHFiYIObreNt3RN3POPJACBsvZvHYD0HmgLgSshRl/9Svuhys+qedSE1Cp66X
 BECkMAFeRL59ppU/P+CQk2N3V/uf5DPs9tcJY7p3enTzzo1UZYrpb2TYh3MpZOvnIIzFSHMaE
 XHLfPPDxfL/t2ptm3iBDKPraj9aERbZZkeQ3brXItBrNHdEAKCwx82Z0cLQ8Ir244Wus0LIp8
 KLc1ElAc91cD+vv7sbQnwD4BFC8xRo6M0CqEotWa7rwYchCjnMM+StwIYotDpW40C4I/PgC2p
 LAGGC5dHx5ZQKEOZBae6hO2Att+c16DqRlkjTxyPWoozA5AR7FI4IPaAfBAVgONshqJ+R0tXT
 /ZpGjab6dscqcWARB5ZTNStXTSKd992bMemY7HYeeeamwxyUdfvqQNjr7FEe3HoYBothSzN5f
 Bl916WZoB3Wm3+Wx7aPTegpVD9cFyQXFD2J/L7OH0cPBZURTKlq0JDIeBdKwlVpu8ulRhdMSt
 ciRqI98sZNeyO2p6ebAT6Mh6eITe4guduYRN/sjQTw28rCUQQ3hw5JDRjHeUo0z9oZJYB9ViO
 xApPwCUYSWLAFhJMiuvdmVTkjtv24sMoSzNWuNvID3EKvr34/Go8FmL1Rzb0vqq6/npJbxn5Q
 bGkFfQ0VXnx9+lgdv9qAWRg8gHc6DUUPruNGTFOTCznD7zHnHfRL3wtJeeEprS3pWM1njt6aM
 A/R5wCXiYYfjm/fJ9uE5XPPAv+B4sawjhkgfK1OJEWuwWgIk8w0xKZhCI56HEOXtSDQHiA1t8
 3K//Zo17K0UCZHIICtwEJ7HBqW4Fa0b9e4CFe7U2NQXGMgVRdXvxoI3VNe/OceMAWxBaNQyIN
 4zHsEDLZtmVVUNGLjXITGoyRDvcfr/+Y5R118RY0+QgD069ZrTclt/3ZCuOONLORYZVRyCbsh
 I712Nh+zvug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_052018_528400_353FC686 
X-CRM114-Status: UNSURE (   3.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgphbnkgY29tbWVudD8KCnJlZ2FyZHMgRnJhbmsKCgo+IEdlc2VuZGV0OiBNaXR0d29jaCwg
MzEuIE3DpHJ6IDIwMjEgdW0gMTU6MzQgVWhyCj4gVm9uOiAiRnJhbmsgV3VuZGVybGljaCIgPGZy
YW5rLXdAcHVibGljLWZpbGVzLmRlPgo+IEJldHJlZmY6IFtQQVRDSF1bbmV0LW5leHRdIG5ldDog
bWVkaWF0ZWs6IGFkZCBmbG93IG9mZmxvYWQgZm9yIG10NzYyMwo+Cj4gbXQ3NjIzIHVzZXMgb2Zm
bG9hZCB2ZXJzaW9uIDIgdG9vCj4gCj4gdGVzdGVkIG9uIEJhbmFuYXBpLVIyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
