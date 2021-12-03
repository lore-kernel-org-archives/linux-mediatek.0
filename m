Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTqFRPINOrw9k87epcrQsH2SLaJCDsBTXEs4pJAcQts=; b=W6+mpGTp+SXF4g
	WnO+pgAoLYh0BrtPfE6FZU7lE+Irbx4WfmtnNf2QHk7W7RTrNnFQtTC1LajlaK8hQd7ecrPtPnY/J
	cLsQaFcesSJZsxq/IUfghbgUm4j8y3rqfIdNKnSTFZAv7/gKOuPvFvjsoi4+l//aVl/dH1cJvXFqY
	o13DY3JWbBFUR/EJS+vCY3I16F8/S2hy+6MpIyAUZB8peX55fDmvgv8jYO8PbpSr5cPygIvIGpfYe
	ZH+SNu/XzxT+bE9RmvbPtB96mlf2Ua86O45C0COc7TsgylWpAsRbbxD1Ww/jgEnqYouKKsfnlTRU6
	bw1bRHq7xZ2i2qcZKrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtFzL-00H2Og-2W; Fri, 03 Dec 2021 21:21:03 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtFzI-00H2O5-Mo
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 21:21:02 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id ABB26CED20;
 Fri,  3 Dec 2021 22:20:58 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2] Bluetooth: btmtksdio: enable msft opcode
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211201201351.2552-1-lukasz.bartosik@semihalf.com>
Date: Fri, 3 Dec 2021 22:20:58 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@semihalf.com
Message-Id: <2852634C-7A15-4B64-A76C-77047F9C5007@holtmann.org>
References: <20211201201351.2552-1-lukasz.bartosik@semihalf.com>
To: Lukasz Bartosik <lb@semihalf.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_132100_935945_82AAA100 
X-CRM114-Status: UNSURE (   6.89  )
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

SGkgTHVrYXN6LAoKPiBFbmFibGUgbXNmdCBvcGNvZGUgZm9yIG10NzkyMSBjaGlwLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IMWBdWthc3ogQmFydG9zaWsgPGxiQHNlbWloYWxmLmNvbT4KPiAtLS0KPiBk
cml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYyB8IDIgKysKPiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpwYXRjaCBoYXMgYmVlbiBhcHBsaWVkIHRvIGJsdWV0b290aC1uZXh0IHRy
ZWUuCgpSZWdhcmRzCgpNYXJjZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
