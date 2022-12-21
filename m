Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EBEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpPdxS7HiOoDJNdiv8R8Y64fgKbS8lj3lJjc7zmtKM4=; b=CynanqVPxuy+7TvidQSdk2fTUk
	z0tnX9/oxJykWW0kSiizAYgRHowrJT9hGda/YBAeC4j8GHicAaLFGE95fvbhGmr/6vSggGxOIVarI
	nd+/nm7tLyv3hPmo9VuqIdQZ0oaLDgBnoYVTIAiAReiVucmb57gR1z0pWm+A8/jjClRDs47kMC8b2
	kJ0qby5XEJJ0MN56bJ4SbFXtGvgpIFBM4qPEAo8QAvRsgXDYuj5z+elAhf5BUMirAD4TTqfecjBRj
	USK5k3NJxc6TjSWiI2ZHbJQVzChMczRQov7hI6AOKv6pLtBfXS4KaeQ9pWBbbwnKzZ7GH1GiyN0iW
	6VsSIN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p80oM-00G6jH-VS; Wed, 21 Dec 2022 15:15:15 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p80mE-00G4ta-5R
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 15:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:
	Mime-Version:From:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JpPdxS7HiOoDJNdiv8R8Y64fgKbS8lj3lJjc7zmtKM4=; b=R6gyhcmCxqScr4Nw7fBtKffY4/
	ngk90atnnkWBtIGVmt3lQ9Av4psV48AA5S1TxW4avTEpYl54rQgBD8MrPZetdIQ65x6yQYcPnFYbD
	fRuEL4uPKXo+/Xh2XDBx7sbObz5cAXEluhsciW51xsZBmmI40ZMVJu5YooLg78QUe59Q=;
Received: from [2a01:598:b1a1:36a1:31bb:caaa:f244:59d0] (helo=smtpclient.apple)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1p80m3-00Abzx-3z; Wed, 21 Dec 2022 16:12:51 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Felix Fietkau <nbd@nbd.name>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] wifi: mt76: fix potential memory leakage
Date: Wed, 21 Dec 2022 16:12:40 +0100
Message-Id: <B2689D6F-E04E-4E9B-9244-4E5069DC464D@nbd.name>
References: <3940cc5ccb4b17d51b5176e722daef0d1af66d6a.camel@mediatek.com>
Cc: lorenzo@kernel.org, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org
In-Reply-To: <3940cc5ccb4b17d51b5176e722daef0d1af66d6a.camel@mediatek.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
X-Mailer: iPhone Mail (20B101)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_071302_289159_A0568C57 
X-CRM114-Status: UNSURE (   9.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sujuan,

> Yes, it is so expensive, but if no memcopy, it will casue memory
> fragmentation (we hit this issue in internal SQC).
>=20
> as we know, wed needs to exchange rx pkt(belongs to wed rx buffer
> manager) with wifi driver(dma rx data queue) by exchanging wfdma dmad
> to ensure the free wed rx buffer.
>=20
> it is possiable that a large number of buffer has been exchanged to wed
> and can not come back to wlan driver. So, the memory from the same 32K
> page cache is unable to be released, and it will be failed at
> page_frag_alloc in mt76_dma_rx_fill.
>=20
> Any ideas but memcopy?
A simple solution would be to simply allocate single pages, or half-page fra=
gments.

- Felix


