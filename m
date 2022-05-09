Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 19:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6quBKHFHno/tMV+081QhuLppQJVLbG4RhAXb6g3LbCc=; b=c/Dewy4ofh5QKB
	5e4ALbAFeFWfl2e7T+s5NdO1bpvf/Nm/QDWKg07r/roCeE9cYNXJ1opOhpvYJhgM9Pp0KL7WCywim
	DqWiqqa/2mc8m1X+B7sVrK/eJDI1lXg5C5Gt7pslackCY29gB/A7bw+lrYkhL5kSjxfmw77KdfNJ1
	KLeMcTPkWeECZMc5ynw7346KCwP48ADhOE32HvJEKbrVyWvVsVbPJ1ugIsiRF3B+B8PT8YN5KR/RZ
	zZ9LTUF6G6IzduPXG3kcr47BZ7cv2Ls3OpM7b7VvoWk0Parr+yKHC+VRDKxcOo+w7kC5glItwd+q7
	OY07ug7TUDMYMAb7FX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no9W2-00G5uR-8V; Mon, 09 May 2022 19:57:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no9Vq-00G5sE-Oe; Mon, 09 May 2022 19:57:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34FB2B8191F;
 Mon,  9 May 2022 19:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C267C385B2;
 Mon,  9 May 2022 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652126264;
 bh=xKlmdHLZkImPaVJ0vEbDOGtDhEjWXzfx0mxKGKDFUxc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PmlGsU9so7KVEDdzDsc5qWpNV6GzoLmKQ6M4uuNs8KZuP0ur01kpRPaWxJjBIrj4C
 VTUypkjSTLbcXK/sqFIa+cG4DdtdT0ZHSgb1zjjtqReoLiBMxYg3F98jmahaWTJ/mw
 ViU7DHcDQjd8O4A5KasMR2Xhn3l+aLeh1cDdxPr5tTu28ef5wADDfTFG7czn/SI/u0
 eUY2/ax3Hbbj/Al8z3DVlz7DZl4dEI2jqqDtSYcXC4ad6ovWhoRTYMdvxDR7GQGcZL
 Km4bRMrYIgbwzqfwcN1sNTCnqg7qyxdIZP5odFp5cvLoBsTqDXR90PYRC3fQwVG3LA
 RrfjZNnHmH+zQ==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20220509185625.580811-1-nfraprado@collabora.com>
References: <20220509185625.580811-1-nfraprado@collabora.com>
Subject: Re: [PATCH] Revert "ASoC: dt-bindings: mediatek: mt8192: Add
 i2s-share properties"
Message-Id: <165212626102.1478109.3697258153804528211.b4-ty@kernel.org>
Date: Mon, 09 May 2022 20:57:41 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_125746_992078_633E749E 
X-CRM114-Status: GOOD (  13.12  )
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

T24gTW9uLCA5IE1heSAyMDIyIDE0OjU2OjI1IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBUaGlzIHJldmVydHMgY29tbWl0IGUwNTZjZjQzNDFhZTNmODU2ZjFlMzhkYTAy
YjI3Y2IwNGRlNGM2OWIuIFRoZSBjb21taXQKPiB3YXMgbWVyZ2VkIHdoaWxlIHRoZSBwcm9wZXJ0
eSBuYW1lIGFuZCBkZWZpbml0aW9uIHdlcmUgc3RpbGwgYmVpbmcKPiBkaXNjdXNzZWQuIFJldmVy
dCB0aGUgY29tbWl0IGZvciBub3cgYW5kIGEgZm9sbG93IHVwIGNvbW1pdCB3aWxsIHJlLWFkZAo+
IHRoZSBwcm9wZXJ0eSBhZnRlciBpdCBpcyBmdXJ0aGVyIGRpc2N1c3NlZCBhbmQgcmV2aWV3ZWQu
Cj4gCj4gCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdCBmb3ItbmV4dAoKVGhhbmtzIQoKWzEvMV0g
UmV2ZXJ0ICJBU29DOiBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IG10ODE5MjogQWRkIGkycy1zaGFy
ZSBwcm9wZXJ0aWVzIgogICAgICBjb21taXQ6IGQ5NGQxNDg2OTUyYjg2MGRjZWRkMDRkMGZmOGFk
ZTIxNzY0MTg5MDUKCkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGlu
dGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRo
ZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ug
d2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVt
cyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRl
ZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQg
b3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3
aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBh
ZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55
IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5n
ZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3Vy
cmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2Ug
YWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJl
cGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5rcywKTWFyawoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
