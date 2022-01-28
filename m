Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B83C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcR0rkhvb+JC7kHc77jJ7WgP8DUNonPVs33e1ckpPqk=; b=m8ukpo2pSoFQW108PMJEsFQOh7
	Ha4r+YqeY9fkpnXx6ffccgBtNCIjrBIvd5R3V3J0cZFP030WRDN+JSAkusT49vfoI7uSioOUSSj+k
	vZr8LTiwT+bI0QImXJpUKER+rxHd2ZFs5pbrrFf70HDObxAWgoSw6Gd4hHBXTS/LDiqcDHrQJ2xfH
	LGJrMbi1AwBONl27jUvDS0xKASDrWF7yjXByJvEdiiVxMHmPYZ9L28V8M7b3CEfXiTLxmDEbHViY5
	B8zgejUe6wX/NDBsSoOCwbOeR1vS0vkI6pMJGjLdiXWpMQdAoJ7ZXWE81zhEpCTOOXtH3k0wh71OU
	KKOfbDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNKe-001B2S-7W; Fri, 28 Jan 2022 09:14:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNKC-001AsF-Mn; Fri, 28 Jan 2022 09:13:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 029441F45DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643361215;
 bh=1t37Who892UgzGYY1/obVI1c4xg7GCI5hTII7E25RXc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=icjXHmtYlty4sGUEzqvYYuKTs/KKYuBCXYBiIJKGV1pyFbjQO+zU9XWbOgmB9/v1S
 UFd2f7F5Lv5p/xtwrJSx94W16cekuZkPoaNq+zfwxX95RrzT9NkvVEsnFyhabpClTD
 81HswS6Vi3aZzf5lLfcsHp1JpQTshMri2jR1qzmSoeHQ3IT15oW8T06WKCdWmTLo8R
 QcLTNK1MvQGUNMh07HHx9xsG5QSKh00VIvTBcrvqrDxyAmFEKcSJvXAUWsn/Mf9+PT
 9942P6a51mYZLUhLAHO/PL3ilq8Fh8NbnATnoUQ/rWVsNRukJaUpIGEmKfg1VN14LY
 ou3MgSVqDEHPA==
Subject: Re: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-kernel
 <linux-kernel@vger.kernel.org>, andrzej.hajda@intel.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Jagan Teki
 <jagan@amarulasolutions.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
 <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
Message-ID: <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
Date: Fri, 28 Jan 2022 10:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_011344_898211_FE29FDBD 
X-CRM114-Status: GOOD (  34.27  )
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

SWwgMjcvMDEvMjIgMTY6NDYsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86
Cj4gSWwgMjcvMDEvMjIgMTY6MjEsIENodW4tS3VhbmcgSHUgaGEgc2NyaXR0bzoKPj4gSGksIEFu
Z2VsbzoKPj4KPj4gQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4g5pa8Cj4+IDIwMjLlubQx5pyIMjfml6Ug6YCx5ZubIOS4
i+WNiDEwOjM25a+r6YGT77yaCj4+Pgo+Pj4gRFJNIGJyaWRnZSBkcml2ZXJzIGFyZSBub3cgYXR0
YWNoaW5nIHRoZWlyIERTSSBkZXZpY2UgYXQgcHJvYmUgdGltZSwKPj4+IHdoaWNoIHJlcXVpcmVz
IHVzIHRvIHJlZ2lzdGVyIG91ciBEU0kgaG9zdCBpbiBvcmRlciB0byBsZXQgdGhlIGJyaWRnZQo+
Pj4gdG8gcHJvYmU6IHRoaXMgcmVjZW50bHkgc3RhcnRlZCBwcm9kdWNpbmcgYW4gZW5kbGVzcyAt
RVBST0JFX0RFRkVSCj4+PiBsb29wIG9uIHNvbWUgbWFjaGluZXMgdGhhdCBhcmUgdXNpbmcgZXh0
ZXJuYWwgYnJpZGdlcywgbGlrZSB0aGUKPj4+IHBhcmFkZS1wczg2NDAsIGZvdW5kIG9uIHRoZSBB
Q0VSIENocm9tZWJvb2sgUjEzLgo+Pj4KPj4+IE5vdyB0aGF0IHRoZSBEU0kgaG9zdHMvZGV2aWNl
cyBwcm9iZSBzZXF1ZW5jZSBpcyBkb2N1bWVudGVkLCB3ZSBjYW4KPj4+IGRvIGFkanVzdG1lbnRz
IHRvIHRoZSBtdGtfZHNpIGRyaXZlciBhcyB0byBib3RoIGZpeCBub3cgYW5kIG1ha2Ugc3VyZQo+
Pj4gdG8gYXZvaWQgdGhpcyBzaXR1YXRpb24gaW4gdGhlIGZ1dHVyZTogZm9yIHRoaXMsIGZvbGxv
d2luZyB3aGF0IGlzCj4+PiBkb2N1bWVudGVkIGluIGRybV9icmlkZ2UuYywgbW92ZSB0aGUgbXRr
X2RzaSBjb21wb25lbnRfYWRkKCkgdG8gdGhlCj4+PiBtdGtfZHNpX29wcy5hdHRhY2ggY2FsbGJh
Y2sgYW5kIGRlbGV0ZSBpdCBpbiB0aGUgZGV0YWNoIGNhbGxiYWNrOwo+Pj4ga2VlcGluZyBpbiBt
aW5kIHRoYXQgd2UgYXJlIHJlZ2lzdGVyaW5nIGEgZHJtX2JyaWRnZSBmb3Igb3VyIERTSSwKPj4+
IHdoaWNoIGlzIG9ubHkgdXNlZC9hdHRhY2hlZCBpZiB0aGUgRFNJIEhvc3QgaXMgYm91bmQsIGl0
IHdvdWxkbid0Cj4+PiBtYWtlIHNlbnNlIHRvIGtlZXAgYWRkaW5nIG91ciBicmlkZ2UgYXQgcHJv
YmUgdGltZSAoYXMgaXQgd291bGQKPj4+IGJlIHVzZWxlc3MgdG8gaGF2ZSBpdCBpZiBtdGtfZHNp
X29wcy5hdHRhY2goKSBmYWlscyEpLCBzbyBhbHNvIG1vdmUKPj4+IHRoYXQgb25lIHRvIHRoZSBk
c2kgaG9zdCBhdHRhY2ggZnVuY3Rpb24gKGFuZCByZW1vdmUgaXQgaW4gZGV0YWNoKS4KPj4+Cj4+
PiBGaXhlczogMjA5MjY0YTg1NzA3ICgiZHJtL2JyaWRnZTogRG9jdW1lbnQgdGhlIHByb2JlIGlz
c3VlIHdpdGggTUlQSS1EU0kgYnJpZGdlcyIpCj4+Cj4+IFRoZSBmaXhlZCB0YWcgc2hvdWxkIGlu
ZGljYXRlIHRoZSBwYXRjaCB3aGljaCBjYXVzZSB0aGUgYnVnLCBidXQgd2h5IGEKPj4gcGF0Y2gg
anVzdCBhZGRpbmcgZG9jdW1lbnQgd291bGQgY2F1c2UgYnVnPwo+PiBTbyBubyBhbnkgcGF0Y2gg
Y2F1c2UgYnVnPyBUaGlzIHBhdGNoIGp1c3Qgd2FudCB0byBwcmV2ZW50IGEgcG9zc2libGUgYnVn
Pwo+Pgo+IAo+IEkgdGhpbmsgeW91J3ZlIG1pc3NlZCBteSBwcmV2aW91cyBtZXNzYWdlIG9uIHYy
LCBzbyBJIHdpbGwgcGFzdGUgaXQgaGVyZToKPiAKPiB1bmZvcnR1bmF0ZWx5IEkgY291bGRuJ3Qg
ZmluZCBhIHZhbGlkIGNvbW1pdCBmb3IgYSBGaXhlcyB0YWcuIFRoaXMKPiBzdGFydGVkIGJlaW5n
IGFuIGlzc3VlIGF0IHNvbWUgcG9pbnQsIHdoZW4gdGhlIERSTSB3YXMgY2hhbmdlZCB0bwo+IGFk
aGVyZSB0byB0aGUgZG9jdW1lbnRlZCBwcm9iZSBzZXF1ZW5jZTogdGhlIE1lZGlhVGVrIERTSSBk
cml2ZXIgd2FzCj4gbm90IHRoZSBvbmx5IG9uZSB0aGF0IGdvdCBicm9rZW4vYWZmZWN0ZWQgYnkg
dGhlc2UgY2hhbmdlcy4KPiAKPiBJZiB5b3UgaGF2ZSBhbnkgYWR2aWNlIG9uIHdoaWNoIGNvbW1p
dCBzaG91bGQgYmUgdGFnZ2VkLCBJJ20gb3BlbiBmb3IKPiBhbnkga2luZCBvZiBzdWdnZXN0aW9u
Lgo+IAo+IAo+IEkgdHJpZWQgdG8gY2hlY2sgb24gb3RoZXIgZHJpdmVycyB3aGljaCBnb3QgZml4
ZWQgZm9yIHRoZSBzYW1lIGJlaGF2aW9yLAo+IGZvciBleGFtcGxlIGRybS9tc20sIGJ1dCBub25l
IG9mIHRoZW0gaGFkIGEgRml4ZXMgdGFnLgo+IFdoZW4gdGhlIERSTSBnb3QgY2hhbmdlZCB0byBh
ZGhlcmUgdG8gdGhpcyBzZXF1ZW5jZSwgc29tZSBkcm0vYnJpZGdlCj4gZHJpdmVycyB3ZXJlIGFs
c28gY2hhbmdlZDsgdGhpcyBoYXMgY3JlYXRlZCBzb21lIGluY29tcGF0aWJpbGl0aWVzIHdpdGgK
PiBzb21lIGRybSBkcml2ZXJzLCBpbmNsdWRpbmcgZHJtL21zbSBhbmQgZHJtL21lZGlhdGVrLgo+
IAo+IFRoaXMgY29tbWl0IGlzIG5vdCBmaXhpbmcgYSBsYXRlbnQgYnVnIHRoYXQgd2FzIGludHJv
ZHVjZWQgaW4gZHJtL21lZGlhdGVrCj4gYnV0IHJhdGhlciBvbmUgdGhhdCB3YXMgaW5kdWNlZCBi
eSB0aGUgbmV3LCBmaXhlZCwgcHJvYmUgZmxvdyB0aGF0IGdvdAo+IHJlY2VudGx5IGRvY3VtZW50
ZWQgLSBhbmQgdG8gd2hpY2ggZHJpdmVycyBzaG91bGQgYWRoZXJlOyBmYWlsaW5nIHRvIGFkaGVy
ZQo+IHRvIHRoYXQgd2lsbCBwcm9kdWNlIGFuIGVuZGxlc3MgLUVQUk9CRV9ERUZFUiBsb29wLCBk
dWUgdG8gb3RoZXIgZHJpdmVycwo+IChhcyBtZW50aW9uZWQsIGZvciBleGFtcGxlIGRybS9icmlk
Z2UgZHJpdmVycykgaGF2aW5nIGJlZW4gY2hhbmdlZCB0byB1c2UKPiB0aGF0IHByb2JlIHNlcXVl
bmNlLgo+IAo+IAo+IFJlZ2FyZHMsCj4gQW5nZWxvCj4gCgpJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJv
dXQgYW5vdGhlciBzb2x1dGlvbiB0byB0aGlzIGlzc3VlLgoKV291bGQgaXQgYmUgZmluZSBpZiBJ
IHNlbmQgYSB2NCB0aGF0IHJlbW92ZXMgdGhlIEZpeGVzIHRhZywgYnV0IGFkZHMgdGhlIGZvbGxv
d2luZz8KCkNjOiBzdGFibGVAa2VybmVsLm9yZyAjIHY1LjE1KwoKPj4gUmVnYXJkcywKPj4gQ2h1
bi1LdWFuZy4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4+PiBSZXZpZXdlZC1i
eTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+Cj4+PiBSZXZpZXdlZC1i
eTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pgo+Pj4gLS0tCj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTY3ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygr
KSwgODMgZGVsZXRpb25zKC0pCj4+PgoKCi0tIApBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubwpT
b2Z0d2FyZSBFbmdpbmVlcgoKQ29sbGFib3JhIEx0ZC4KUGxhdGludW0gQnVpbGRpbmcsIFN0IEpv
aG4ncyBJbm5vdmF0aW9uIFBhcmssIENhbWJyaWRnZSBDQjQgMERTLCBVSwpSZWdpc3RlcmVkIGlu
IEVuZ2xhbmQgJiBXYWxlcywgbm8uIDU1MTM3MTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
