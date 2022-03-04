Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D5FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svWZbVuJj0xu1XbYJCqgf3ZWAQIkkBLcirkmib2V7WI=; b=WO5Tu5XF0zRj3N
	aQVMibmfF1mrZVZa0Uw/r6kzIBDwBTjxRKj6v7KmJf79KnUhn5cgQ2bpubN3aUdXxeKogTKrANKJP
	mfHYd4ti2JqdXae9+5ZFUVLDGBujz/Uri/+e+wriM+vdLzjuXLervXBJS7WmjT1KZwBJkyqqTH4xx
	lK9GUq4YPD3hJzpNxUTtB+OT2uWgSL9ooRQKicN3dYN5VFhEqkh4072lBq72K3HI3na4qmhQn6fMs
	bXZ8rk7plQM24gUVfRZoJGdn3ylwYxpqlzPzo8MmzMXn9XuZ7j8lDeRGGvG6Y3ZyB3ixVCHo9teVI
	l2yFY5+3KVL7M1dzja9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ63a-009nAA-ND; Fri, 04 Mar 2022 11:25:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ63M-009n4o-P5; Fri, 04 Mar 2022 11:24:58 +0000
Received: from [IPV6:2a01:e0a:120:3210:7306:9b30:8b22:3e7d] (unknown
 [IPv6:2a01:e0a:120:3210:7306:9b30:8b22:3e7d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A7461F465D3;
 Fri,  4 Mar 2022 11:24:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646393093;
 bh=yTe/V30XP6omoCEeMk1jAeuDrsOa74fOZiKjXc7oly0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F73leBvPeP7IuwJRp2RmOQsRbF8YKgQDZkK5Qv0MtLsIKeSOXqY2Nuw5HIScydcoa
 8bciQQEwDGezHBhSX+kQfjExzVxOn7ovgJUtMVHfF4DjvQNHkrCGYhI6wsfmNmRBuU
 K/NY33dF3OQtJwpUCCKAYQmDyjr/qAH4XJg0v1ZS4p2WY2I0LQSV3zMbbAzW6S5Gd7
 96EljkMuDmBiHYn9VlqwS8LGpvu2hv6+D1oYTf006QPi7OG/GtxK0WFClJtANSvFtZ
 700lyGelg4h3zX++9mrbTSO4hQXQLt7NFmF6Hu+tAGzBjWsG/246clU1dUfwaolUkh
 yb3DMERXOt+JA==
Message-ID: <fb73a54a-7e75-2e5d-d78a-cacb5f065b06@collabora.com>
Date: Fri, 4 Mar 2022 12:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi funcs
 and delay mipi high to cooperate with panel sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_032457_033374_FAF4E351 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkxlIDA0LzAzLzIwMjIgw6AgMTE6MTUsIHhpbmxlaS5sZWVAbWVkaWF0ZWsuY29tIGEgw6ljcml0
wqA6Cj4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+Cj4KPiBJbiB1
cHN0cmVhbS12NS44LCBkc2lfZW5hYmxlIHdpbGwgb3BlcmF0ZSBwYW5lbF9lbmFibGUsIGJ1dCB0
aGlzCj4gbW9kaWZpY2F0aW9uIGhhcyBiZWVuIG1vdmVkIGluIHY1LjkuIEluIG9yZGVyIHRvIGVu
c3VyZSB0aGUgdGltaW5nIG9mCj4gZHNpX3Bvd2VyX29uL29mZiBhbmQgdGhlIHRpbWluZyBvZiBw
dWxsaW5nIHVwL2Rvd24gdGhlIE1JUEkgc2lnbmFsLAo+IHRoZSBtb2RpZmljYXRpb24gb2YgdjUu
OSBpcyBzeW5jaHJvbml6ZWQgaW4gdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcy4KCkhlbGxvLAoKSSdt
IHRyeWluZyB0byBkZWJ1ZyBhbiBpc3N1ZSBvbiBtdDgxODMga3VrdWkga3JhbmUgc2t1MTc2IGRl
dmljZS4KVGhlIHByb2JsZW0gaXMgdGhhdCBib2UtdHYxMDF3dW0tbmw2IHBhbmVsIGlzbid0IHdv
cmtpbmcuCkF0IGJvb3QgdGltZSBJIGNhbiBzZWUgdGhlc2UgbG9nczoKcGFuZWwtYm9lLXR2MTAx
d3VtLW5sNiAxNDAxNDAwMC5kc2kuMDogZmFpbGVkIHRvIHdyaXRlIGNvbW1hbmQgMQpwYW5lbC1i
b2UtdHYxMDF3dW0tbmw2IDE0MDE0MDAwLmRzaS4wOiBmYWlsZWQgdG8gaW5pdCBwYW5lbDogLTYy
CmFuZCBhIERTSSBpbnRlcnJ1cHQgdGltZSBvdXQuCgpTaW5jZSBJIGJlbGlldmUgdGhlIHByb2Js
ZW0gaXMgbGluayB0byBEU0kvcGFuZWwgZW5hYmxpbmcgc2VxdWVuY2UKSSBoYXZlIHRyeSB0aGlz
IHNlcmllcyBidXQgdGhhdCBkb2Vzbid0IHNvbHZlIHRoZSBpc3N1ZS4KSSBub3RpY2UgdGhhdCB3
aGVuIGdvaW5nIG91dCBvZiBkZWVwIHNsZWVwIG1vZGUgcGFuZWwgaXMgZnVuY3Rpb25hbC4KCk1h
eSB5b3UgaGF2ZSBhbnkgaWRlYSB0byBkZWJ1Zy9zb2x2ZSB0aGlzIHByb2JsZW0gPwoKUmVnYXJk
cywKQmVuamFtaW4KCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IDEuIERzaSBzZXF1ZW5jZSBtYXJr
ZWQgd2l0aCBwYXRjaCBhZGp1c3RtZW50Cj4gMi4gRml4ZXM6IG10a19kc2k6IFVzZSB0aGUgZHJt
X3BhbmVsX2JyaWRnZQo+Cj4gSml0YW8gU2hpICgzKToKPiAgICBkcm0vbWVkaWF0ZWs6IEFkanVz
dCB0aGUgdGltaW5nIG9mIG1pcGkgc2lnbmFsIGZyb20gTFAwMCB0byBMUDExCj4gICAgZHJtL21l
ZGlhdGVrOiBTZXBhcmF0ZSBwb3dlcm9uL3Bvd2Vyb2ZmIGZyb20gZW5hYmxlL2Rpc2FibGUgYW5k
IGRlZmluZQo+ICAgICAgbmV3IGZ1bmNzCj4gICAgZHJtL21lZGlhdGVrOiBrZWVwIGRzaSBhcyBM
UDAwIGJlZm9yZSBkY3MgY21kcyB0cmFuc2Zlcgo+Cj4gWGlubGVpIExlZSAoMSk6Cj4gICAgZHJt
L21lZGlhdGVrOiBBZGQgcHVsbC1kb3duIE1JUEkgb3BlcmF0aW9uIGluIG10a19kc2lfcG93ZXJv
ZmYKPiAgICAgIGZ1bmN0aW9uCj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgfCA3MyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0OSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
