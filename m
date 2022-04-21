Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46174C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CV7RjUU5dli2YDEDMZH2tBY5+ZMdnMpwNW9UH1wGyo=; b=wloX6MY1of3bmY
	WrI3sg6T/bru7kTPSuhqqCrie/Hrq7JwTSRDmuojWih/VMxgOR8Y944m6WHckaA8EuQt/BQH3FgOn
	f+jTzVY50V/nDOiWZ0gw+ENpKzXewCewZ1SYQ8JGVnWk6FGr47j6NUxXNhdz8GgVjKerUWpfInIbe
	xCSOV306uzvPVe1oiF8/NxukVwVaA+vfMiUEq6JDGc2u9VtUbA8eZSZSAWQpZ6bxNUwo4dTvxzZSa
	6HOBuohEMkZ6j88wbmK6g2/T64xr8v1Nf4C7RbTElsWr18AJnny6ZOSc1Z/O19b5USPGu2cWjIavh
	Eb2crjSRAHlHhYRfnKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhURY-00D6R0-Tu; Thu, 21 Apr 2022 10:53:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhURL-00D6LR-3P; Thu, 21 Apr 2022 10:53:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B36F81F4558D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650538411;
 bh=FBd9UQCF3y8blk7MUJd+m6iRG4OWorxrv+jpCV+U8Mk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KJkRBia6J5KzqsVbeppoDnuwy8hU/Tsp6FPN0BXe16JtWyGSs8OQBa2kd5BjM13fb
 mrub0DRmAYR4+hivTepMnAe/gbKHKzGqFBKZv+QKMmYU3A7c1QgZ25ozb9hMpfI6Qn
 zPEy9gcFNCXhnPZsyG+/+7NS1YyN/a9kjRy3I4oH7ygusMuDcCwgjSK0VCdPdNfhuE
 56Pa1SruogNTZyC2oLrLXvCjcWFar5aC5gbqXfF6cMEON+rxEicQoRPpcN36KMVlum
 khBUmygJ0uZ/8UuDh1hVyJbL+B80kmBM0sEaKzRk2OFZgxyS+Y8IxdEioPNjRmBdT3
 o8RKuMUzQpiqA==
Message-ID: <4afda652-e360-cfd9-a0f5-07910b513621@collabora.com>
Date: Thu, 21 Apr 2022 12:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
Content-Language: en-US
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsa@kernel.org, nfraprado@collabora.com,
 kernel@collabora.com
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_035335_312971_F33F09D6 
X-CRM114-Status: GOOD (  19.16  )
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

SWwgMTEvMDQvMjIgMTU6MjEsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86
Cj4gRXNwZWNpYWxseSAoYnV0IG5vdCBvbmx5KSBkdXJpbmcgcHJvYmUsIGl0IG1heSBoYXBwZW4g
dGhhdCBtdWx0aXBsZQo+IGRldmljZXMgYXJlIGNvbW11bmljYXRpbmcgdmlhIGkyYyAob3IgbXVs
dGlwbGUgaTJjIGJ1c3NlcykgYW5kCj4gc29tZXRpbWVzIHdoaWxlIG90aGVycyBhcmUgcHJvYmlu
ZyBhc3luY2hyb25vdXNseS4KPiBGb3IgZXhhbXBsZSwgYSBDcjUwIFRQTSBtYXkgYmUgZmlsbGlu
ZyBlbnRyb3B5IChvciB1c2Vyc3BhY2UgbWF5IGJlCj4gcmVhZGluZyByYW5kb20gZGF0YSkgd2hp
bGUgdGhlIHJ0NTY4MiAoaTJjKSBjb2RlYyBkcml2ZXIgcmVhZHMvc2V0cwo+IHNvbWUgcmVnaXN0
ZXJzLCBsaWtlIHdoaWxlIGdldHRpbmcvc2V0dGluZyBhIGNsb2NrJ3MgcmF0ZSwgd2hpY2gKPiBo
YXBwZW5zIGJvdGggZHVyaW5nIHByb2JlIGFuZCBkdXJpbmcgc3lzdGVtIG9wZXJhdGlvbi4KPiAK
PiBJbiB0aGlzIGRyaXZlciwgdGhlIG10a19pMmNfdHJhbnNmZXIoKSBmdW5jdGlvbiAod2hpY2gg
aXMgdGhlIGkyYwo+IC5tYXN0ZXJfeGZlcigpIGNhbGxiYWNrKSB3YXMgZ3JhbnVsYXJseSBtYW5h
Z2luZyB0aGUgY2xvY2tzIGJ5Cj4gcGVyZm9ybWluZyBhIGNsa19idWxrX3ByZXBhcmVfZW5hYmxl
KCkgdG8gc3RhcnQgdGhlbSBhbmQgaXRzIGludmVyc2UuCj4gVGhpcyBpcyBub3Qgb25seSBjcmVh
dGluZyBwb3NzaWJsZSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY2llcyBpbgo+IHRoZSBzb21l
IGNhc2VzIChsaWtlIGZvcm1lciBleHBsYW5hdGlvbiksIGJ1dCBpdCdzIGFsc28gc3Vib3B0aW1h
bCwKPiBhcyBjbGtfY29yZSBwcmVwYXJlL3VucHJlcGFyZSBvcGVyYXRpb25zIGFyZSB1c2luZyBt
dXRleCBsb2NraW5nLAo+IHdoaWNoIGNyZWF0ZXMgYSBiaXQgb2YgdW53YW50ZWQgb3ZlcmhlYWQg
KGZvciBleGFtcGxlLCBpMmMgdHJhY2twYWRzCj4gd2lsbCBjYWxsIG1hc3Rlcl94ZmVyKCkgZXZl
cnkgZmV3IG1pbGxpc2Vjb25kcyEpLgo+IAo+IFdpdGggdGhpcyBjb21taXQsIHdlIGF2b2lkIGJv
dGggdGhlIGNpcmN1bGFyIGxvY2tpbmcgYW5kIGFkZGl0aW9uYWwKPiBvdmVyaGVhZCBieSBjaGFu
Z2luZyBob3cgd2UgaGFuZGxlIHRoZSBjbG9ja3MgaW4gdGhpcyBkcml2ZXI6Cj4gLSBQcmVwYXJl
IHRoZSBjbG9ja3MgZHVyaW5nIHByb2JlIChhbmQgUE0gcmVzdW1lKQo+IC0gRW5hYmxlL2Rpc2Fi
bGUgY2xvY2tzIGluIG10a19pMmNfdHJhbnNmZXIoKQo+IC0gVW5wcmVwYXJlIHRoZSBjbG9ja3Mg
b25seSBmb3IgZHJpdmVyIHJlbW92YWwgKGFuZCBQTSBzdXNwZW5kKQo+IAo+IEZvciB0aGUgc2Fr
ZSBvZiBwcm92aWRpbmcgYSBmdWxsIGV4cGxhbmF0aW9uOiBkdXJpbmcgcHJvYmUsIHRoZQo+IGNs
b2NrcyBhcmUgbm90IG9ubHkgcHJlcGFyZWQgYnV0IGFsc28gZW5hYmxlZCwgYXMgdGhpcyBpcyBu
ZWVkZWQKPiBmb3Igc29tZSBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBidXQsIGFmdGVyIHRoYXQs
IHdlIGFyZSBkaXNhYmxpbmcKPiBidXQgbm90IHVucHJlcGFyaW5nIHRoZW0sIGxlYXZpbmcgYW4g
ZXhwZWN0ZWQgc3RhdGUgZm9yIHRoZQo+IGFmb3JlbWVudGlvbmVkIGNsb2NrIGhhbmRsaW5nIHN0
cmF0ZWd5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CkhlbGxvLAp0aGlz
IGlzIGEgZnJpZW5kbHkgcGluZyB0byBub3QgbGV0IHRoaXMgYmUgZm9yZ290dGVuLgoKQ2hlZXJz
LApBbmdlbG8KCj4gLS0tCj4gCj4gdjI6IEZpeGVkIHR5cG9zIGluIGNvbW1pdCBkZXNjcmlwdGlv
bgo+IAo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDExICsrKysrKystLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
