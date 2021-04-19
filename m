Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5893CC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 06:24:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55C7961157
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 06:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55C7961157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mork.no
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g60S+II+BzyXeKOHLHThChWIH9nH0WSoE+qbr8Wi2fs=; b=kfFfyVVParLKADfXPZ4mP9FWH
	0zEQ0EUdIrA8TRORc0dmZhoEW/LDLm+7MGUp3ZzuyFFy9m30OOrh77FKfGhvLIIU7wWQOCtiNeqD9
	V+l5slzxD0kXUu4Vz537zKESg4wagwVJwHcoUdSdAW5qstMndlGhwVPUUtgGyTUdrSxI6W6jsiue7
	Nv86O1vCQdov0tjVrztsB29KDfWe28CBad3yhRTK7YGWm213pz0sosln5gE+cEf7ciVt7Ps/mtLZy
	y8ue5DWXf0hXYTh6grFrimmXFtq4jYHzZqow+IQ6DwfxWC2Wh/ErGRaZf6lEZ0+A9XR2X19/SBzXx
	IvUUtYT5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYNKl-009Cvp-25; Mon, 19 Apr 2021 06:24:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYNKj-009CvG-VF; Mon, 19 Apr 2021 06:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=E7X1Z/C7m4uTr61eYxZTSepR9nL5wv+XsO96GsmyN1o=; b=gERa+sx0buTeUsx9N290sEzk8M
 bzdp5IOrDPOzGFSYbvOOnHZU4E6qQZDzviQGZrAuYOfLiGRxn8HfepOLjOm5w2ixDchvt77IRhjLP
 N8ydD/9appNL8APZSYZ/OzEpWrZ5zBUfQDIJOnNx8iYif9evEh0GfYxVmRe43CbWNXVs+dY/QxsbR
 7NQVU9+XJ7dy/oCopiduUbaQtd0tuFXRXizDXIe5fZrE8caSo9rOyabgaBX1+N1Gr1iHUPuYJ1N54
 mSb8aJ6WCF4GmJdw5mxAuCn+faUxBCo1nG0POLw/iYM+aZjtU5w446a44d2ygWMvs02aHm97IAvS3
 3FCbGsjw==;
Received: from canardo.mork.no ([2001:4641::1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYNKe-00B3ln-7i; Mon, 19 Apr 2021 06:24:32 +0000
Received: from miraculix.mork.no (fwa161.mork.no [192.168.9.161])
 (authenticated bits=0)
 by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 13J6OA33005567
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Apr 2021 08:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
 t=1618813450; bh=E7X1Z/C7m4uTr61eYxZTSepR9nL5wv+XsO96GsmyN1o=;
 h=From:To:Cc:Subject:References:Date:Message-ID:From;
 b=Ik288FpI4+tP3NUif79juWd79WI9mF6EwixRHDNl9pM365SLN/2YUjFGhP517DrAq
 iLKyA9hXRV4N1CNtUMM0qq9onUb9jv5Jpf3XyXpHfg8L0Qpk+MtZXnF0Otd1cyAcmB
 tak3jj60+xS63bbFXtSk0SkE9+bzRGtYPXIk7s6M=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
 (envelope-from <bjorn@mork.no>)
 id 1lYNKL-000bQN-NA; Mon, 19 Apr 2021 08:24:09 +0200
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Greg Ungerer <gerg@kernel.org>, Florian
 Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: mediatek: support MT7621 SoC
Organization: m
References: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
Date: Mon, 19 Apr 2021 08:24:09 +0200
In-Reply-To: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com> (Ilya
 Lipnitskiy's message of "Sun, 18 Apr 2021 20:42:53 -0700")
Message-ID: <878s5e94hi.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_232428_815533_0E3348F8 
X-CRM114-Status: GOOD (  14.87  )
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

SWx5YSBMaXBuaXRza2l5IDxpbHlhLmxpcG5pdHNraXlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEFk
ZCBtaXNzaW5nIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgU29DIHN1cHBvcnQgdGhhdCBoYXMg
YmVlbiBpbiBwbGFjZQo+IHNpbmNlIHY1LjEKPgo+IEZpeGVzOiA4ODliY2JkZWVlNTcgKCJuZXQ6
IGV0aGVybmV0OiBtZWRpYXRlazogc3VwcG9ydCBNVDc2MjEgU29DIGV0aGVybmV0IGhhcmR3YXJl
IikKPiBDYzogQmrDuHJuIE1vcmsgPGJqb3JuQG1vcmsubm8+Cj4gU2lnbmVkLW9mZi1ieTogSWx5
YSBMaXBuaXRza2l5IDxpbHlhLmxpcG5pdHNraXlAZ21haWwuY29tPgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1uZXQudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1uZXQudHh0Cj4gaW5kZXggNzJk
MDNlMDdjZjdjLi45NTBlZjZhZjIwYjEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1uZXQudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1uZXQudHh0Cj4gQEAgLTEwLDYgKzEw
LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgLSBjb21wYXRpYmxlOiBTaG91bGQgYmUKPiAg
CQkibWVkaWF0ZWssbXQyNzAxLWV0aCI6IGZvciBNVDI3MDEgU29DCj4gIAkJIm1lZGlhdGVrLG10
NzYyMy1ldGgiLCAibWVkaWF0ZWssbXQyNzAxLWV0aCI6IGZvciBNVDc2MjMgU29DCj4gKwkJIm1l
ZGlhdGVrLG10NzYyMS1ldGgiOiBmb3IgTVQ3NjIxIFNvQwo+ICAJCSJtZWRpYXRlayxtdDc2MjIt
ZXRoIjogZm9yIE1UNzYyMiBTb0MKPiAgCQkibWVkaWF0ZWssbXQ3NjI5LWV0aCI6IGZvciBNVDc2
MjkgU29DCj4gIAkJInJhbGluayxydDUzNTAtZXRoIjogZm9yIFJhbGluayBSdDUzNTBGIGFuZCBN
VDc2MjgvODggU29DCgoKVGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzIQoKTm90ZSwgaG93
ZXZlciwgdGhhdCB0aGlzIGNvbXBhdGlibGUgdmFsdWUgaXMgZGVmaW5lZCBpbgpEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JhbGluayxydDI4ODAtbmV0LnR4dAoKSSBiZWxp
ZXZlIHRoYXQgZmlsZSBzaG91bGQgZ28gYXdheS4gVGhlc2UgdHdvIGZpbGVzIGFyZSBib3RoIGRv
Y3VtZW50aW5nCnRoZSBzYW1lIGNvbXBhdGlibGUgcHJvcGVydHkgQUZBSUNTLgoKCkJqw7hybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
