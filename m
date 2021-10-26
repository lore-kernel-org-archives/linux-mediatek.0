Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC2060232
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBC2060232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WNdCxh6kXXN1MhdTdmvQAEa1pG5WdQhAnRgP+VoaNc=; b=B023eRNeuu5lUG
	1A6jyXopI5vRcfP1MvXpTOUdy1/xmPiqp7K17xl54CEl4uTWi7iRbApLbTJHwsbMCbhtz3Ov1A9q3
	GH3usY6r4N2j6znwOQfcDaulJlCeeQfwpNVTVDvsWAprLoRLBxsKe91oaHoinzf4d0mwRnxU2/GeN
	Wix6p4ue8kbQlk8BniDuWsbiFgDbJzxLbhKoJXCtbQ6q/sBY74Ghqn47DrsXjKbePW07M53R+JU2x
	zaINY5jPxOqEb9Lhy9DXulNWvW87JTTsLv5/xjZjmZLMT2Fw78XGObpVwY/MzIPWNuTK5rrW2JvHt
	0tK6CbNhcbPn93qWNsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfICd-0017nB-3k; Tue, 26 Oct 2021 08:53:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfICM-0017iM-50; Tue, 26 Oct 2021 08:52:48 +0000
X-UUID: b3578d03c2ad470fa13550161ae7b6b5-20211026
X-UUID: b3578d03c2ad470fa13550161ae7b6b5-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 167778465; Tue, 26 Oct 2021 01:52:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 01:52:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 16:52:36 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 26 Oct 2021 16:52:35 +0800
From: <guangming.cao@mediatek.com>
To: <daniel@ffwll.ch>
CC: <christian.koenig@amd.com>, <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
Date: Tue, 26 Oct 2021 16:52:41 +0800
Message-ID: <20211026085241.5116-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YW80iakRm5jWjIUp@phenom.ffwll.local>
References: <YW80iakRm5jWjIUp@phenom.ffwll.local>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_015246_226248_5DD9D9A6 
X-CRM114-Status: GOOD (  48.59  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+CgpPbiBUdWUs
IDIwMjEtMTAtMTkgYXQgMjM6MTEgKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVl
LCBPY3QgMTksIDIwMjEgYXQgMDU6Mzc6MjdQTSArMDIwMCwgQ2hyaXN0aWFuIEvpsIppZyB3cm90
ZToKPiA+IAo+ID4gCj4gPiBBbSAxOS4xMC4yMSB1bSAxNDo0MSBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4gPiA+IE9uIFR1ZSwgT2N0IDE5LCAyMDIxIGF0IDA4OjIzOjQ1UE0gKzA4MDAsIAo+ID4g
PiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbSB3cm90ZToKPiA+ID4gPiBGcm9tOiBHdWFuZ21p
bmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBTaW5j
ZSB0aGVyZSBpcyBubyBtYW5kYXRvcnkgaW5zcGVjdGlvbiBmb3IgYXR0YWNobWVudHMgaW4KPiA+
ID4gPiBkbWFfYnVmX3JlbGVhc2UuCj4gPiA+ID4gVGhlcmUgd2lsbCBiZSBhIGNhc2UgdGhhdCBk
bWFfYnVmIGFscmVhZHkgcmVsZWFzZWQgYnV0Cj4gPiA+ID4gYXR0YWNobWVudCBpcyBzdGlsbAo+
ID4gPiA+IGluIHVzZSwgd2hpY2ggY2FuIHBvaW50cyB0byB0aGUgZG1hYnVmLCBhbmQgaXQgbWF5
YmUgY2F1c2UKPiA+ID4gPiBzb21lIHVuZXhwZWN0ZWQgaXNzdWVzLgo+ID4gPiA+IAo+ID4gPiA+
IFdpdGggSU9NTVUsIHdoZW4gdGhpcyBjYXNlcyBvY2N1cnMsIHRoZXJlIHdpbGwgaGF2ZSBJT01N
VQo+ID4gPiA+IGFkZHJlc3MKPiA+ID4gPiB0cmFuc2xhdGlvbiBmYXVsdChzKSBmb2xsb3dlZCBi
eSB0aGlzIHdhcm5pbmcsCj4gPiA+ID4gSSB0aGluayBpdCdzIHVzZWZ1bCBmb3IgZG1hIGRldmlj
ZXMgdG8gZGVidWcgaXNzdWUuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3Vhbmdt
aW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+Cj4gPiA+IAo+ID4gPiBUaGlzIGZl
ZWxzIGEgbG90IGxpa2UgaGFuZC1yb2xsaW5nIGtvYmplY3QgZGVidWdnaW5nLiBJZiB5b3Ugd2Fu
dAo+ID4gPiB0byBkbwo+ID4gPiB0aGlzIHRoZW4gSSB0aGluayBhZGRpbmcga29iamVjdCBkZWJ1
ZyBzdXBwb3J0IHRvCj4gPiA+IGRtYV9idWYvZG1hX2J1Zl9hdHRhY2htZW50IHdvdWxkIGJlIGJl
dHRlciB0aGFuIGhhbmQtcm9sbGluZwo+ID4gPiBzb21ldGhpbmcKPiA+ID4gYmVzcG9rZSBoZXJl
Lgo+ID4gCj4gPiBXZWxsIEkgd291bGQgY2FsbCB0aGF0IG92ZXJraWxsLgo+IAo+IEkgdGhpbmsg
aWYgZG9uZSByaWdodCB0aGUgb2JqZWN0IGRlYnVnIHN0dWZmIHNob3VsZCBiZSBhYmxlIHRvIGdp
dmUKPiB5b3UgYQo+IGJhY2t0cmFjZS4gV2hpY2ggbWlnaHQgYmUgdXNlZnVsIGlmIHlvdSBoYXZl
IGEgZG1hLWJ1ZiBoZWFwcyBkZXNpZ24KPiB3aGVyZQo+IHlvdSByZWFsbHkgaGF2ZSBubyBjbHVl
IHdoeSBhIGJ1ZmZlciB3YXMgYWxsb2NhdGVkL2F0dGFjaGVkIHdpdGhvdXQKPiBzb21lCj4gaGlu
dHMuCldlbGwsIEkgdGhpbmsgaXQncyB0aGUgZmluYWxseSBzb2x1dGlvbiwgZm9yIGN1cnJlbnQg
dGhpbmtpbmcsIGl0IG1heWJlIGJyaW5nIGEgaGlnaApvdmVybG9hZGluZy4gSnVzdCBhcyB0aGlz
IHJldmVydCBwYXRjaDogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0Erd2dhUE1IQSs4
K0x4ZkdOTCtxND1YcmRYcWZ1NFRYb1dMWDdlMjh6OVo3a1BzZi13QG1haWwuZ21haWwuY29tLwpT
bywgd2UgbmVlZCB0byBmaW5kIGEgbGlnaHR3ZWlnaHQgd2F5IHRvIGRvIHRoaXMuCgpHdWFuZ21p
bmcKPiAKPiA+ID4gQWxzbyBvbiB0aGUgcGF0Y2ggaXRzZWxmOiBZb3UgZG9uJ3QgbmVlZCB0aGUg
dHJ5bG9jay4gRm9yCj4gPiA+IGNvcnJlY3RseQo+ID4gPiB3b3JraW5nIGNvZGUgbm9uIG9uZSBl
bHNlIGNhbiBnZXQgYXQgdGhlIGRtYS1idWYsIHNvIG5vIGxvY2tpbmcKPiA+ID4gbmVlZGVkIHRv
Cj4gPiA+IGl0ZXJhdGUgdGhyb3VnaCB0aGUgYXR0YWNobWVudCBsaXN0LiBGb3IgaW5jb3JyZWN0
IGNvZGUgdGhlCj4gPiA+IGtlcm5lbCB3aWxsIGJlCj4gPiA+IG9uIGZpcmUgcHJldHR5IHNvb24g
YW55d2F5LCB0cnlpbmcgdG8gZG8gbG9ja2luZyB3b24ndCBoZWxwIDotKQo+ID4gPiBBbmQKPiA+
ID4gd2l0aG91dCB0aGUgdHJ5bG9jayB3ZSBjYW4gY2F0Y2ggbW9yZSBidWdzIChlLmcuIGlmIHlv
dSBhbHNvCj4gPiA+IGZvcmdvdCB0bwo+ID4gPiB1bmxvY2sgYW5kIG5vdCBqdXN0IGZvcmdvdCB0
byBkZXRhY2gpLgoKWWVzLCBJdCdzIGFsc28gYSBlcnJvciBjYXNlLCBJIHdpbGwgcmVtb3ZlIHRv
IGxvY2sgYXQgbmV4dCB2ZXJzaW9uIHBhdGNoLiBUaGFua3MhCgpHdWFuZ21pbmcKCj4gPiAKPiA+
IFlvdSBhbHNvIGRvbid0IG5lZWQgdGhlIFdBUk4oIWxpc3RfZW1wdHkuLi4pIGJlY2F1c2UgYSBm
ZXcgbGluZQo+ID4gYmVsb3cgd2UKPiA+IGFscmVhZHkgaGF2ZSBhICJXQVJOX09OKCFsaXN0X2Vt
cHR5KCZkbWFidWYtPmF0dGFjaG1lbnRzKSk7Ii4KClNvcnJ5LCBjb3VsZCB5b3UgdGVsbCBtZSB3
aWNoIGZ1bmN0aW9uIHdpbGwgY2hlY2sgaXQ/CkkgZGlkbid0IGZvdW5kIGl0IHNvIEkgc3VibWl0
IHRoaXMgcGF0Y2guCgpHdWFuZ21pbmcKPiAKPiBZZWFoIHRoaXMgcGF0Y2ggaGVyZSBhbG9uZSBp
c24ndCByZWFsbHkgdGhhdCB1c2VmdWwgSSB0aGluay4gTWF5YmUgd2UKPiBjb3VsZCBhZGQgdGhl
IGRtYWJ1Zi0+ZXhwX25hbWUgb3Igc28gdG8gdGhhdCB3YXJuaW5nLCBidXQgb3RoZXJ3aXNlCj4g
dGhlCj4gaW5mbyBwcmludGVkIGhlcmUgaXNuJ3QgYWxsIHRoYXQgdXNlZnVsIGZvciBkZWJ1Z2dp
bmcuIEdyYWJiaW5nIGEKCkkgYWxzbyBwcmludGVkIGRtYWJ1Zi0+ZXhwX25hbWUgaW4gd2FybiBt
ZXNzYWdlLgoKVGhlIHJlYXNvbiBhZGRpbmcgaXQgaGVyZSBpcyB0aGF0IHNvbWUgdXNlcnMgb24g
QU5EUk9JRCBvZiBkbWEtYnVmIGlzIG5vdCBmYW1pbGlhcgp3aXRoIGxpbnV4IGRtYS1idWYgb3Ig
bWF5YmUgd3JpdGUgc29tZSBwcm9ibGVtYXRpYyBjb2RlLCBhZGQgdGhpcyBjaGVjayBjYW4gZmlu
ZAp3aG8gbG9zdCBjYWxsIGdldF9kbWFfYnVmIG9yIGFueSBvdGhlciBhcGkgY2FuIGxldCBsZXQg
dGhlIGRtYS1idWYgbGlmZWN5Y2xlIGlzCnVuZGVyIHVzZXJzJyBleHBlY3RhdGlvbi4KQWRkIGl0
IGp1c3QgbGlrZSBjaGVjayBpbiBkbWEtZmVuY2U6Cmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMjTDUxOQoKRG8g
eW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gdG8gZGVidWcgdGhpcyBwYXJ0PwoKR3VhbmdtaW5nCgo+
IGJhY2t0cmFjZSBvZiB0aGUgYWxsb2NhdG9yIG9yIGF0dGFjaGVyIG90b2ggc2hvdWxkIGZhaXJs
eSBpbW1lZGlhbHkKPiBwb2ludAo+IGF0IHRoZSBidWdneSBjb2RlLgo+IC1EYW5pZWwKPiAKPiA+
IAo+ID4gQ2hyaXN0aWFuLgo+ID4gCj4gPiA+IC1EYW5pZWwKPiA+ID4gCj4gPiA+ID4gLS0tCj4g
PiA+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMjMgKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gPiA+ID4g
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJz
L2RtYS1idWYvZG1hLQo+ID4gPiA+IGJ1Zi5jCj4gPiA+ID4gaW5kZXggNTExZmUwZDIxN2EwLi42
NzI0MDQ4NTdkNmEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
Ywo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+ID4gPiBAQCAtNzQs
NiArNzQsMjkgQEAgc3RhdGljIHZvaWQgZG1hX2J1Zl9yZWxlYXNlKHN0cnVjdCBkZW50cnkKPiA+
ID4gPiAqZGVudHJ5KQo+ID4gPiA+ICAgCSAqLwo+ID4gPiA+ICAgCUJVR19PTihkbWFidWYtPmNi
X3NoYXJlZC5hY3RpdmUgfHwgZG1hYnVmLQo+ID4gPiA+ID5jYl9leGNsLmFjdGl2ZSk7Cj4gPiA+
ID4gKwkvKiBhdHRhY2htZW50IGNoZWNrICovCj4gPiA+ID4gKwlpZiAoZG1hX3Jlc3ZfdHJ5bG9j
ayhkbWFidWYtPnJlc3YpICYmCj4gPiA+ID4gV0FSTighbGlzdF9lbXB0eSgmZG1hYnVmLT5hdHRh
Y2htZW50cyksCj4gPiA+ID4gKwkgICAgIiVzIGVyciwgaW5vZGU6JTA4bHUgc2l6ZTolMDh6dSBu
YW1lOiVzIGV4cF9uYW1lOiVzCj4gPiA+ID4gZmxhZ3M6MHglMDh4IG1vZGU6MHglMDh4LCAlc1xu
IiwKPiA+ID4gPiArCSAgICBfX2Z1bmNfXywgZmlsZV9pbm9kZShkbWFidWYtPmZpbGUpLT5pX2lu
bywgZG1hYnVmLQo+ID4gPiA+ID5zaXplLAo+ID4gPiA+ICsJICAgIGRtYWJ1Zi0+bmFtZSwgZG1h
YnVmLT5leHBfbmFtZSwKPiA+ID4gPiArCSAgICBkbWFidWYtPmZpbGUtPmZfZmxhZ3MsIGRtYWJ1
Zi0+ZmlsZS0+Zl9tb2RlLAo+ID4gPiA+ICsJICAgICJSZWxlYXNlIGRtYWJ1ZiBiZWZvcmUgZGV0
YWNoIGFsbCBhdHRhY2htZW50cywgZHVtcAo+ID4gPiA+IGF0dGFjaDpcbiIpKSB7Cj4gPiA+ID4g
KwkJaW50IGF0dGFjaF9jbnQgPSAwOwo+ID4gPiA+ICsJCWRtYV9hZGRyX3QgZG1hX2FkZHI7Cj4g
PiA+ID4gKwkJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoX29iajsKPiA+ID4gPiAr
CQkvKiBkdW1wIGFsbCBhdHRhY2htZW50IGluZm8gKi8KPiA+ID4gPiArCQlsaXN0X2Zvcl9lYWNo
X2VudHJ5KGF0dGFjaF9vYmosICZkbWFidWYtCj4gPiA+ID4gPmF0dGFjaG1lbnRzLCBub2RlKSB7
Cj4gPiA+ID4gKwkJCWRtYV9hZGRyID0gKGRtYV9hZGRyX3QpMDsKPiA+ID4gPiArCQkJaWYgKGF0
dGFjaF9vYmotPnNndCkKPiA+ID4gPiArCQkJCWRtYV9hZGRyID0KPiA+ID4gPiBzZ19kbWFfYWRk
cmVzcyhhdHRhY2hfb2JqLT5zZ3QtPnNnbCk7Cj4gPiA+ID4gKwkJCXByX2VycigiYXR0YWNoWyVk
XTogZGV2OiVzCj4gPiA+ID4gZG1hX2FkZHI6MHglLTEybHhcbiIsCj4gPiA+ID4gKwkJCSAgICAg
ICBhdHRhY2hfY250LCBkZXZfbmFtZShhdHRhY2hfb2JqLQo+ID4gPiA+ID5kZXYpLCBkbWFfYWRk
cik7Cj4gPiA+ID4gKwkJCWF0dGFjaF9jbnQrKzsKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwkJcHJf
ZXJyKCJUb3RhbCAlZCBkZXZpY2VzIGF0dGFjaGVkXG5cbiIsCj4gPiA+ID4gYXR0YWNoX2NudCk7
Cj4gPiA+ID4gKwkJZG1hX3Jlc3ZfdW5sb2NrKGRtYWJ1Zi0+cmVzdik7Cj4gPiA+ID4gKwl9Cj4g
PiA+ID4gKwo+ID4gPiA+ICAgCWRtYWJ1Zi0+b3BzLT5yZWxlYXNlKGRtYWJ1Zik7Cj4gPiA+ID4g
ICAJaWYgKGRtYWJ1Zi0+cmVzdiA9PSAoc3RydWN0IGRtYV9yZXN2ICopJmRtYWJ1ZlsxXSkKPiA+
ID4gPiAtLSAKPiA+ID4gPiAyLjE3LjEKPiA+ID4gPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
