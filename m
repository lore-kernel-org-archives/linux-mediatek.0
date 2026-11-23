Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485EE606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+YobESi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nkwPE3gD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pd7yZOfR/6/VdDILFb0nLqoZvgJwsuh6QMQF6pgZpBQ=; b=4+YobESi+HVsSv
	usO7t/7X4aXXjqjLi7L8WDH4CfTSrD0XrpfFlHvh4IunATev4QwfknLPgaIK98FNu2jPlQNJwIC4s
	GLkHH0fB8PxzAqofR7S9mPfo5urY00nKrSj6r3ESrGFbJb6cxTUw11uB5f8bs1gbwllkjI/PclY23
	9ARYse7Uiz/WHcF92Pn73211Tm+OKl44LIfjIUB/Ff640Vc/yhCFNnlOS8wGj4YCMAjvGyCe+pJxe
	gZ8XzTWLeGMLpkkgf7MUic8KbBPIUzhoD2fyusFd6OHU1wMrX8I/zcpUUuDtzOltLBelqjtVgesT0
	Qv9h/BhuuFOsx728CyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSAO-00000003AF3-3ya5;
	Mon, 23 Nov 2026 11:25:00 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSAK-00000003ACy-13Ob;
	Mon, 23 Nov 2026 11:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=/Ggu3rj0ThvKcNpBPXLiuiRBY02aVQgcwxpp
	10zH9iI=; b=nkwPE3gDvJGKrSHgbKpWIGcydqeX56abOG+5Qe9CkWFoxWH4IguJ
	9H84WETfFpEFGA/uEnnqL8HzGz5BJKHtby8AtWKnoGWUarBKdhQQ2/zKodlZus/C
	YBcc9YS8dcPYOTBYgGdY0/UWJ/aaYrVNQWudojT11gzkb25sC6hIE+c=
Received: from wanghr2026$mail.zgclab.edu.cn ( [58.206.202.88] ) by
 ajax-webmail-web2 (Coremail) ; Mon, 23 Nov 2026 19:24:40 +0800 (GMT+08:00)
Date: Mon, 23 Nov 2026 19:24:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5rWp54S2?= <wanghr2026@mail.zgclab.edu.cn>
To: netdev-bot+sinfo@kernel.org
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on
 setup failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT5 build
 20261010(691d8f62) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-4df55a87-4b50-4a66-85a0-70f79cb6c8b5-tsinghua.edu.cn
In-Reply-To: <179543235894.3294.8827397951204336522@kernel.org>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
 <179543235894.3294.8827397951204336522@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <2a2bfab1.269a1.1a20826a7dd.Coremail.wanghr2026@mail.zgclab.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: yQQGZQCHtmp4IgRrBoVgAQ--.19466W
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQYAD2sD8X5PDgABsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032456_623519_2F7B8BE1 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LSBIb3cgaXQgd2FzIGRpc2NvdmVyZWQuIFN0YXRpYyBzY2FubmluZywgbm90IGEgcnVudGltZSBy
ZXBvcnQuIEkKc2Nhbm5lZCBmb3IgcmVndWxhdG9yX2VuYWJsZSgpIGNhbGxzIGFuZCBjaGVja2Vk
IHRoYXQgZWFjaCBvbmUgaGFzIGEKbWF0Y2hpbmcgcmVndWxhdG9yX2Rpc2FibGUoKSBvbiB0aGUg
ZXJyb3IgcGF0aHMuIG10NzUzMF9zZXR1cCgpCmVuYWJsZXMgdGhlIGNvcmUgYW5kIGlvIHJhaWxz
LCBidXQgb25seSBtdDc1MzBfcmVtb3ZlKCkgZGlzYWJsZXMgdGhlbSwKc28gYSBwcm9iZSB0aGF0
IGZhaWxzIGFmdGVyIHRoZSBlbmFibGUgaGFzIG5vIG1hdGNoaW5nIGRpc2FibGUuCi0gV2hldGhl
ciBpdCB3YXMgdHJpZ2dlcmVkLiBJdCB3YXMgbm90IHRyaWdnZXJlZCwgYW5kIEkgZGlkIG5vdApy
ZXByb2R1Y2UgaXQgb24gaGFyZHdhcmUuIAoKClRoYW5rcywKSGFvcmFuCgoKPiAtLS0tLeWOn+Wn
i+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiBuZXRkZXYtYm90K3NpbmZvQGtlcm5lbC5vcmcKPiDl
j5HpgIHml7bpl7Q6MjAyNi0xMS0yMyAxOToxMjozOCAo5pif5pyf5LiAKQo+IOaUtuS7tuS6ujog
Ikhhb3JhbiBXYW5nIiA8d2FuZ2hyMjAyNkBtYWlsLnpnY2xhYi5lZHUuY24+Cj4g5oqE6YCBOiBj
aGVzdGVyLmEudW5hbEBhcmluYzkuY29tLCBkYW5pZWxAbWFrcm90b3BpYS5vcmcsIGFuZHJld0Bs
dW5uLmNoLCBvbHRlYW52QGdtYWlsLmNvbSwgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRA
a2VybmVsLm9yZywga3ViYUBrZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWF0dGhpYXMu
YmdnQGdtYWlsLmNvbSwgYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tLCBu
ZXRkZXZAdmdlci5rZXJuZWwub3JnLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcsIGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjJdIG5ldDogZHNhOiBtdDc1MzA6IGRp
c2FibGUgdGhlIHBvd2VyIHJhaWxzIG9uIHNldHVwIGZhaWx1cmUKPiAKPiBIaSEKPiAKPiBUaGlz
IGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlLiBUaGlzIHNlcmllcyBsb29rcyBsaWtlIGEgZml4LCBi
dXQgaXRzCj4gY29tbWl0IG1lc3NhZ2VzIHNlZW0gdG8gYmUgbWlzc2luZyBzb21lIGluZm9ybWF0
aW9uOgo+IAo+ICAtIEhvdyB0aGUgaXNzdWUgd2FzIGRpc2NvdmVyZWQsIGUuZy4gaGl0IGluIHBy
b2R1Y3Rpb24sIGhpdCBkdXJpbmcKPiAgICBkZXZlbG9wbWVudCwgc3l6Ym90IHJlcG9ydCwgbWFu
dWFsIGNvZGUgaW5zcGVjdGlvbiwgTExNIG9yIHN0YXRpYwo+ICAgIGFuYWx5c2lzIHRvb2wgc2Nh
bi4KPiAKPiAgLSBXaGV0aGVyIHRoZSBpc3N1ZSB3YXMgYWN0dWFsbHkgdHJpZ2dlcmVkLCBvciBp
cyBvbmx5IHRoZW9yZXRpY2FsCj4gICAgKGUuZy4gZm91bmQgYnkgTExNIGFuZCBub3QgcHJvdmVu
IGF0IHJ1bnRpbWUpLiBJZiBpdCB3YXMgdHJpZ2dlcmVkCj4gICAgcGxlYXNlIGluY2x1ZGUgdGhl
IHN5bXB0b21zLCBsaWtlIHRoZSBzdGFjayB0cmFjZSBvciBrZXJuZWwgbWVzc2FnZXMuCj4gCj4g
UGxlYXNlIGRvIG5vdCByZXBvc3QgdGhlIHNlcmllcyBqdXN0IHRvIGFkZHJlc3MgdGhlIGFib3Zl
LiBJbnN0ZWFkLAo+IHJlcGx5IHRvIHRoaXMgZW1haWwgd2l0aCB0aGUgbWlzc2luZyBpbmZvcm1h
dGlvbiwgc28gdGhhdCByZXZpZXdlcnMKPiBjYW4gdGFrZSBpdCBpbnRvIGFjY291bnQuCj4gCj4g
KklNUE9SVEFOVCo6IElmIHlvdSBkbyByZXBvc3QgKGZvciBvdGhlciByZWFzb25zKSAtIHBsZWFz
ZSBpbmNsdWRlCj4gdGhlIHJlbGV2YW50IGluZm8gaW4gdGhlIGNvdmVyIGxldHRlciBvciBjb21t
aXQgbWVzc2FnZXMuCj4gLS0gCj4gVGhlIGV2YWx1YXRpb24gaXMgZG9uZSBieSBhbiBMTE0gc28g
aXQgbWF5IGJlIHdyb25nLCBpZiB5b3UgdGhpbmsKPiB0aGF0IGlzIHRoZSBjYXNlIHBsZWFzZSBy
ZXBseSBhbmQgZXhwbGFpbi4K

