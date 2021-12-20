Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E09C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8h3M0+ZDFDFW2EvJ5B4ovaWHI7oaZkGLwWKd5Vq5NA=; b=5F9+V+B8/k+0qU
	4NbHm/pEpzhXqyEL+dHJnZ/EXTaF4acG7tlJunAe67/UISOglrouBNLkRwh4VEOq/8od7vz4lP0s0
	qojINqEdWSayJn+GEviJML3mTlV4dwrQ8H4aSuQIKYg7hHruDsxNE+eO43z1Km+8MT4BXsHf8L3Av
	oO/QdXbm1ryvldVgx86ZtrjSMIHaDihMtZBKzWLekzO5jYaEDzLh/YceRdvEyZbaKxzY+4T/QvK8t
	/XVGXRy0XtmqQj/mfSlPtl29RJ/T6bPOE5G6GqZcqESHrokMM+aq3dAv33TvpDmOMDOGInexk4iMW
	vgR47WRTTHv8UX7S9tnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNhC-003tFz-Aw; Mon, 20 Dec 2021 18:47:38 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNh8-003t86-O5
 for linux-mediatek@lists.infradead.org; Mon, 20 Dec 2021 18:47:36 +0000
Received: from [192.168.0.2] (ip5f5aed30.dynamic.kabel-deutschland.de
 [95.90.237.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8CC1661EA1927;
 Mon, 20 Dec 2021 19:47:15 +0100 (CET)
Message-ID: <214e5c3f-4198-d647-eb05-adaaeba63aa8@molgen.mpg.de>
Date: Mon, 20 Dec 2021 19:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] Bluetooth: btmtksdio: Enable SCO over I2S function
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Mark-YW.Chen@mediatek.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <638a2506-c410-d98c-b704-6f16f72e0bc6@molgen.mpg.de--annotate>
 <1640022750-16263-1-git-send-email-sean.wang@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1640022750-16263-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_104734_982552_82D63DB6 
X-CRM114-Status: GOOD (  14.73  )
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

RGVhciBTZWFuLAoKCkFtIDIwLjEyLjIxIHVtIDE4OjUyIHNjaHJpZWIgc2Vhbi53YW5nQG1lZGlh
dGVrLmNvbToKPiBGcm9tOiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cgo+PiBB
bSAxOC4xMi4yMSB1bSAwMjowOCBzY2hyaWViIHNlYW4ud2FuZ0BtZWRpYXRlay5jb206Cj4+PiBG
cm9tOiBNYXJrIENoZW4gPG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+Cj4+PiAKPj4+IEZvciBN
ZWRpYVRlayBjaGlwc2V0LCB0aGUgZHJpdmVyIGhhcyB0byBpc3N1ZSB0aGUgc3BlY2lmaWMKPj4+
IGNvbW1hbmQgdG8gZW5hYmxlIEJsdWV0b290aCBTQ08gc3VwcG9ydCBvdmVyIHRoZSBJMlMvUENN
Cj4+PiBpbnRlcmZhY2UuCj4+IAo+PiBQbGVhc2UgZG9jdW1lbnQgdGhlIGRhdGFzaGVldCBuYW1l
LCByZXZpc2lvbiBhbmQgc2VjdGlvbiwgd2hlcmUKPj4gdGhpcyBpcyBkZXNjcmliZWQuCj4gCj4g
dGhlIGRhdGFzaGVldCBpcyBub3QgcmVsZWFzZWQgaW4gcHVibGljIHNvIE1hcmsgYW5kIEkgY2Fu
bm90IHByb3ZpZGUKPiB0aGUgZGV0YWlsIGhlcmUsIGJ1dCB3ZSB3aWxsIG1ha2UgdGhlIHBhdGNo
IGVhc3kgdG8gcmV2aWV3IGFuZAo+IHVuZGVyc3RhbmQuCgpUb28gYmFkLiBUaGUgbmFtZSBhbmQg
cmV2aXNpb24gb2YgdGhlIGRhdGFzaGVldCB3b3VsZCBzdGlsbCBiZSBnb29kIHRvIApoYXZlIGRv
Y3VtZW50ZWQuCgo+PiBQbGVhc2UgYWRkIGhvdyBTQ08gc3VwcG9ydCBjYW4gYmUgdGVzdGVkLiBB
cmUgYWxsIE1lZGlhdGVrIGNoaXBzZXRzCj4+IHN1cHBvcnRlZD8KPiAKPiB0aGUgU0NPIHByb2Zp
bGUgd2FzIHRlc3RlZCBieSBzZXR0aW5nIHVwIGEgVk9JUCBhcHBsaWNhdGlvbiwKPiBjb25uZWN0
ZWQgdG8gSEZQIGRldmljZSwgY2hlY2tlZCB0ZWxlcGhvbnkgZnVuY3Rpb24gY2FuIHdvcmsKPiBu
b3JtYWxseS4KPiAKPiBjdXJyZW50bHksIFNDTyBpcyBvbmx5IHN1cHBvcnRlZCBieSBtdDc5MjEs
IHdlIHdpbGwgY2hhbmdlIHRoZQo+IHN1YmplY3QgdG8gIkJsdWV0b290aDogbXQ3OTIxczogRW5h
YmxlIFNDTyBvdmVyIEkyUyBmdW5jdGlvbiIgdG8KPiBhdm9pZCBhbnkgbWlzdW5kZXJzdGFuZGlu
Zy4KClRoYW5rIHlvdS4KCkkgYWxzbyBzYXcgYSBsaW51eC1maXJtYXJlIHBhdGNoIHVwZGF0aW5n
IHRoZSBmaXJtd2FyZS4gSWYgYSBzcGVjaWZpYwpmaXJtd2FyZSB2ZXJzaW9uIGlzIHJlcXVpcmVk
LCBwbGVhc2UgbWVudGlvbiBpdCB0b28uCgpb4oCmXQoKCktpbmQgcmVnYXJkcywKClBhdWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
