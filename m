Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ACCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1spPp6cr39TRoiUjhOvRDR8qv1n0WTbDq6IGKTBm/LU=; b=wXFdqdny1SjFxL
	hMXvUmyyskhOlL+BJKsThiSu3xqjypvPD+Gf7O43eWFSHNoD7vUUqy/Hxj7QfTdc5rjmVzsHGJGUn
	W5SHkNKmhkC4lgi6dSze90XUY1QTyibFEtYs33jg3hOqsBHY+qWzLEjv5PP8ceSey+L8IdSa3moLx
	5hJPoD05pwg4w7NtXVjEXxgxx91WOTCQOwbnvbVE/fl6jYY6XnXc495Ze3hIrEY9HBqun/bEuvg7y
	WaabrFlXBIsuMn3Nw4l8vrx3XN3kmst7PU7UzLKe46/JPt6ifXgN+3Wnkn27eTDF6i6v+HTjHU1G9
	NV7MX9KQhUe+WuRg+f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbLjP-00ErSn-K4; Mon, 04 Apr 2022 12:22:51 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbLjF-00ErQi-4R; Mon, 04 Apr 2022 12:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=0V7pVZcqfS3nz3f+PXRFZmM5UFJ67EOIx9GPX4S4NwU=; b=MN
 wxwn1P9p93bvJ8c2xN8QitjFJRcOd2vJTD68CqnU7FfDF4VjlDwh81DziVM5mbv7tq++MVQ8vmzA6
 5a9dh7SrV/iYdPhYJ1XzZHcvnXh3so0LKXKs7iaLJ6qc7Rme0b/a6CgMjEm5WLlBnw5PmtvnvWQWa
 cdGtHw3pk+Xgrug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbLio-00E5S1-Mj; Mon, 04 Apr 2022 14:22:14 +0200
Date: Mon, 4 Apr 2022 14:22:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: add label support for GMACs
Message-ID: <Ykri9tOtUDmXzHkG@lunn.ch>
References: <20220404114000.3549-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404114000.3549-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_052241_213898_1DD015E9 
X-CRM114-Status: UNSURE (   8.52  )
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

T24gTW9uLCBBcHIgMDQsIDIwMjIgYXQgMDI6NDA6MDBQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBGcm9tOiBSZW7DqSB2YW4gRG9yc3QgPG9wZW5zb3VyY2VAdmRvcnN0LmNvbT4KPiAK
PiBBZGQgbGFiZWwgc3VwcG9ydCBmb3IgR01BQ3MuIFRoZSBuZXR3b3JrIGludGVyZmFjZSBvZiB0
aGUgR01BQyB3aWxsIGhhdmUKPiB0aGUgc3RyaW5nIG9mIHRoZSBsYWJlbCBwcm9wZXJ0eSBkZWZp
bmVkIG9uIHRoZSBkZXZpY2V0cmVlIGFzIGl0cyBuYW1lLgoKU29ycnksIGJ1dCBuby4gVGhpcyBo
YXMgYmVlbiBkaXNjdXNzZWQgYSBmZXcgdGltZXMsIHlvdSBuZWVkIHNvbWV0aGluZwppbiB1c2Vy
IHNwYWNlLCB1ZGV2IG9yIHN5c3RlbWQgZXRjIHRvIHNldCBpbnRlcmZhY2UgbmFtZXMuCgpQbGVh
c2UgbG9vayBiYWNrIGluIHRoZSBhcmNoaXZlIGF0IHByZXZpb3VzIGRpc2N1c3Npb25zLgoKICAg
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
