Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B574CC49EB7
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 09:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789D661C59
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 09:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789D661C59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGtBQwLwf2V4UeQdGgYQZ30L+IaNKpkWzCxcKaxcdDs=; b=Crb2XXRqvgGO1q
	EyZnMiiswPWOH82IsTktgA1f7i+sDX1Rw1DAz3IrhRyExyL8XzIHUzzYDGl06VYh1WifUFVTxkD5D
	mymdC4kIQJUg7Wb2wVNZA245YXTKiYLLz4DuWLMedi4q6TlPIhqimgk7FB02iAj/OMibfskxlHCke
	PUpXLEG9z248zmZFEjMh2kZ+kuzXfuuq1ZIg2JaTvXqbIHKCXd8cXunMXdiR8u1q1LJs1s+sHdAMX
	la557LiYegi1v46eYo+5gaB3/dgYEZ7s3ZVUWeS4Lf1ZsEglf/Q9asXF5fcCYjM0akNRmY4VMjAID
	84knlgRCnSSXzSb/zt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxnbW-007UFg-Lm; Mon, 28 Jun 2021 09:30:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxnbK-007UDR-Ba; Mon, 28 Jun 2021 09:30:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D96461C5A;
 Mon, 28 Jun 2021 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624872646;
 bh=tko4HhpTn1KfqSQcG6rk256TdCkSHRTiZNDg1gfOL1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mdirt+wh3MtaZ7eNyZ9G3nbYCW5idUpb0uLyW3y3Pff8g1i8FeRt120hCx8rMfLOA
 LnRoyQZ6znqLxXb5WQ4POqk3nvJJlxgEnyIMLyf/4xRDnJ3jrCYholI79Dx7JQswRh
 BPPsck43uFy1epGSrPj0zjj0CnIzhGXT51/oNF84=
Date: Mon, 28 Jun 2021 11:30:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org,
 wsd_upstream@mediatek.com, chao.song@mediatek.com,
 kuohong.wang@mediatek.com
Subject: Re: [PATCH 4/4] drivers: net: mediatek: initial implementation of
 ccmni
Message-ID: <YNmWwSsZ02iigiHC@kroah.com>
References: <YNS4GzYHpxMWIH+1@kroah.com>
 <20210628071829.14925-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628071829.14925-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_023046_478494_239232F6 
X-CRM114-Status: GOOD (  40.37  )
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

T24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMDM6MTg6MzBQTSArMDgwMCwgUm9jY28gWXVlIHdyb3Rl
Ogo+IE9uIFRodSwgMjAyMS0wNi0yNCBhdCAxODo1MSArMDIwMCwgR3JlZyBLSCB3cm90ZToKPiBP
biBUaHUsIEp1biAyNCwgMjAyMSBhdCAxMTo1NTowMlBNICswODAwLCBSb2NjbyBZdWUgd3JvdGU6
Cj4gPj4gT24gVGh1LCAyMDIxLTA2LTI0IGF0IDE0OjIzICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+
ID4+IE9uIFRodSwgSnVuIDI0LCAyMDIxIGF0IDA3OjUzOjQ5UE0gKzA4MDAsIFJvY2NvIFl1ZSB3
cm90ZToKPiA+Pj4gCj4gPj4+IG5vdCBoYXZlIGV4cG9ydHMgdGhhdCBubyBvbmUgdXNlcy4gIFBs
ZWFzZSBhZGQgdGhlIGRyaXZlciB0byB0aGlzIHBhdGNoCj4gPj4+IHNlcmllcyB3aGVuIHlvdSBy
ZXNlbmQgaXQuCj4gPj4+IAo+ID4+IAo+ID4+IEkndmUganVzdCB0b29rIGEgbG9vayBhdCB3aGF0
IHRoZSBMaW51eCBzdGFnaW5nIHRyZWUgaXMuIEl0IGxvb2tzIGxpa2UKPiA+PiBhIGdvb2QgY2hv
aWNlIGZvciB0aGUgY3VycmVudCBjY21uaSBkcml2ZXIuCj4gPj4gCj4gPj4gaG9uc3RseSwgSWYg
SSBzaW1wbHkgdXBsb2FkIHRoZSByZWxldmFudCBkcml2ZXIgY29kZSBCIHRoYXQgY2FsbHMKPiA+
PiBBIChlLmcuIGNjbW5pX3J4X3B1c2gpLCB0aGVyZSBpcyBzdGlsbCBhIGxhY2sgb2YgY29kZSB0
byBjYWxsIEIuCj4gPj4gVGhpcyBzZWVtcyB0byBiZSBhIGNvbnRpbnV0eSBwcm9ibGVtLCB1bmxl
c3MgYWxsIGRyaXZlcnMgY29kZXMgYXJlCj4gPj4gdXBsb2FkZWQgKGUuZy4gcG93ZXIgb24gbW9k
ZW0sIGdldCBoYXJkd2FyZSBzdGF0dXMsIGNvbXBsZXRlIHR4L3J4IGZsb3cpLgo+ID4gCj4gPiBH
cmVhdCwgc2VuZCBpdCBhbGwhICBXaHkgaXMgaXQgZGlmZmVyZW50IG1vZHVsZXMsIGl0J3Mgb25s
eSBmb3Igb25lCj4gPiBjaHVuayBvZiBoYXJkd2FyZSwgbm8gbmVlZCB0byBzcGxpdCBpdCB1cCBp
bnRvIHRpbnkgcGllY2VzLiAgVGhhdCB3YXkKPiA+IG9ubHkgY2F1c2VzIGl0IHRvIGJlIG1vcmUg
Y29kZSBvdmVyYWxsLgo+ID4gCj4gPj4gCj4gPj4gVGhhbmtzfgo+ID4+IAo+ID4+IENhbiBJIHJl
c2VuZCBwYXRjaCBzZXQgYXMgZm9sbG93czoKPiA+PiAoMSkgc3VwcGxlbWVudCB0aGUgZGV0YWls
cyBvZiBwdXJlaXAgZm9yIHBhdGNoIDEvNDsKPiA+PiAoMikgdGhlIGRvY3VtZW50IG9mIGNjbW5p
LnJzdCBzdGlsbCBsaXZlIGluIHRoZSBEb2N1bWVudGF0aW9uLy4uLgo+ID4+ICgzKSBtb2RpZnkg
Y2NtbmkgYW5kIG1vdmUgaXQgaW50byB0aGUgZHJpdmVycy9zdGFnaW5nLy4uLgo+ID4gCj4gPiBm
b3IgZHJpdmVycy9zdGFnaW5nLyB0aGUgY29kZSBuZWVkcyB0byBiZSAic2VsZiBjb250YWluZWQi
IGluIHRoYXQgaXQKPiA+IGRvZXMgbm90IHJlcXVpcmUgYWRkaW5nIGFueXRoaW5nIG91dHNpZGUg
b2YgdGhlIGRpcmVjdG9yeSBmb3IgaXQuCj4gPiAKPiA+IElmIHlvdSBzdGlsbCByZXF1aXJlIHRo
aXMgY29yZSBuZXR3b3JraW5nIGNoYW5nZSwgdGhhdCBuZWVkcyB0byBiZQo+ID4gYWNjZXB0ZWQg
Zmlyc3QgYnkgdGhlIG5ldHdvcmtpbmcgZGV2ZWxvcGVycyBhbmQgbWFpbnRhaW5lcnMuCj4gPiAK
PiA+IHRoYW5rcywKPiA+IAo+ID4gZ3JlZyBrLWgKPiA+IAo+IAo+IEhpIEdyZWcsCj4gCj4gSSBh
bSBncmF0ZWZ1bCBmb3IgeW91ciBoZWxwLgo+IAo+IEJvdGggY2NtbmkgY2hhbmdlIGFuZCBuZXR3
b3JraW5nIGNoYW5nZXMgYXJlIG5lZWRlZCwgYmVjYXVzZSBhcyBmYXIKPiBhcyBJIGtub3csIHVz
dWFsbHkgYSBkZXZpY2UgdHlwZSBzaG91bGQgaGF2ZSBhdCBsZWFzdCBvbmUgZGV2aWNlIHRvCj4g
dXNlIGl0LCBhbmQgcHVyZWlwIGlzIHdoYXQgdGhlIGNjbW5pIGRyaXZlciBuZWVkcywgc28gSSB1
cGxvYWRlZCB0aGUKPiBuZXR3b3JraW5nIGNoYW5nZSBhbmQgY2NtbmkgZHJpdmVyIHRvZ2V0aGVy
Owo+IAo+IFNpbmNlIE1US+KAmXMgbW9kZW0gZHJpdmVyIGhhcyBhIGxhcmdlIGFtb3VudCBvZiBj
b2RlIGFuZCBzdHJvbmcgY29kZQo+IGNvdXBsaW5nLCBpdCB0YWtlcyBzb21lIHRpbWUgdG8gY2xl
YW4gdXAgdGhlbS4gQXQgdGhpcyBzdGFnZSwgaXQgbWF5Cj4gYmUgZGlmZmljdWx0IHRvIHVwc3Ry
ZWFtIGFsbCB0aGUgY29kZXMgdG9nZXRoZXIuCgpXaHk/ICBKdXN0IGR1bXAgdGhlIHdob2xlIHRo
aW5nIGluIGEgZHJpdmVycy9zdGFnaW5nL210ay8gZGlyZWN0b3J5CnN0cnVjdHVyZSBhbmQgYWxs
IHNob3VsZCBiZSBmaW5lLgoKPiBEdXJpbmcgdGhpcyBwZXJpb2QsIGV2ZW4gaWYgY2NtbmkgaXMg
aW5jb21wbGV0ZSwgY2FuIEkgcHV0IHRoZSBjY21uaQo+IGRyaXZlciBpbml0aWFsIGNvZGUgaW4g
dGhlIGRyaXZlci9zdGFnaW5nIGZpcnN0ID8gQWZ0ZXIgdGhhdCwgd2Ugd2lsbAo+IGdyYWR1YWxs
eSBpbXBsZW1lbnQgbW9yZSBmdW5jdGlvbnMgb2YgY2NtbmkgaW4gdGhlIHN0YWdpbmcgdHJlZSwg
YW5kCj4gd2UgY2FuIGFsc28gZ3JhZHVhbGx5IHNvcnQgb3V0IGFuZCBjbGVhbiB1cCBtb2RlbSBk
cml2ZXIgaW4gdGhlIHN0YWdpbmcuCgpJIGRvIG5vdCBrbm93LCBsZXQncyBzZWUgdGhlIGNvZGUg
Zmlyc3QuICBCdXQgd2UgY2FuIG5vdCBhZGQgZnJhbWV3b3Jrcwp3aXRoIG5vIGluLWtlcm5lbCB1
c2VycywgYXMgdGhhdCBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZSBhdCBhbGwuCgo+IEluIGFkZGl0
aW9uLCBkdWUgdG8gdGhlIHJlcXVpcmVtZW50cyBvZiBHS0kgMi4wLAoKVGhhdCBpcyBhIEdvb2ds
ZSByZXF1aXJlbWVudCwgbm90IGEga2VybmVsLm9yZyByZXF1aXJlbWVudC4gIFBsZWFzZSB3b3Jr
CndpdGggR29vZ2xlIGlmIHlvdSBoYXZlIHF1ZXN0aW9ucy9pc3N1ZXMgYWJvdXQgdGhhdCwgdGhl
cmUgaXMgTk9USElORyB3ZQpjYW4gZG8gYWJvdXQgdGhhdCBoZXJlIGluIHRoZSBjb21tdW5pdHkg
Zm9yIG9idmlvdXMgcmVhc29ucy4KCj4gaWYgY2NtbmkgZGV2aWNlCj4gdXNlcyBSQVdJUCBvciBO
T05FLCBpdCB3aWxsIGhpdCBpcHY2IGlzc3VlOyBhbmQgaWYgY2NtbmkgdXNlcwo+IGEgZGV2aWNl
IHR5cGUgb3RoZXIgdGhhbiBQVVJFSVAvUkFXSVAvTk9ORSwgdGhlcmUgd2lsbCBiZSB0ZXRoZXJp
bmcKPiBlYnBmIG9mZmxvYWQgb3IgY2xhdCBlYnBmIG9mZmxvYWQgY2FuIG5vdCB3b3JrIHByb2Js
ZW1zLgo+IAo+IEkgaG9wZSBQVVJFSVAgYW5kIGNjbW5pIGNhbiBiZSBhY2NlcHRlZCBieSB0aGUg
TGludXggY29tbXVuaXR5LgoKQXMgSSBzdGF0ZWQgYmVmb3JlIHlvdSBuZWVkIHRvIGhhdmUgYW4g
aW4ta2VybmVsIHVzZXIgZm9yIHVzIHRvIGJlIGFibGUKdG8gYWNjZXB0IGZyYW1ld29ya3MgYW5k
IGZ1bmN0aW9ucyBpbnRvIHRoZSB0cmVlLiAgT3RoZXJ3aXNlIExpbnV4IHdvdWxkCnF1aWNrbHkg
YmVjb21lIHVubWFuYWdhYmxlIGFuZCB1bm1haW50YWluYWJsZS4gIFdvdWxkIHlvdSB3YW50IHRv
IHRyeSB0bwptYWludGFpbiBjb2RlIHdpdGggbm8gaW4tdHJlZSB1c2Vycz8gIFdoYXQgd291bGQg
eW91IGRvIGlmIHlvdSB3ZXJlIGluCm91ciBwb3NpdGlvbj8KCkJ1dCBmb3IgbmV0d29ya2luZyBm
bGFncyBsaWtlIHRoaXMgdGhhdCBnbyBpbnRvIHVzZXJzcGFjZSwgSSBkbyBub3Qga25vdwp3aGF0
IHRoZSBtYWludGFpbmVycyBvZiB0aGUgbmV0d29ya2luZyBzdGFjayByZXF1aXJlLCBzbyB0aGF0
IHJlYWxseSBpcwp1cCB0byB0aGVtLCBub3QgbWUuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
