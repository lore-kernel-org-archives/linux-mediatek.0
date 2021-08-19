Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FC2C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC74600CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DC74600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvW3gXqldzmY4+nKBr+C8xx0SfqVRBBMNFJwS3zpBoQ=; b=Rr1IMY5S67Rm1V
	bKth/fu2lerv3HQB2eUWBqd7BwMkvhpc5gNegQm6nhd3IyTLOnfu06bW7LmL+az8zyQbvzIsyb6S3
	M1FbnDiAU0lc1QUiJ7LRX1G7CAdxPn/DawJuMLRSye/5lcy8GBhwi/CUCzw6Mch0m6BTYz5joFFnl
	QNigXbawNMmfpJe2djQz3lweeFEMq/dP4GXn0gih+0KDY1r+LAP7drwSqYwJQVumElWui6tlk4XXw
	j/qCktgjxIeAv2rd/agyr9IqP2DhZ9R8mcepc3GWbUpTgINHiNcj862o4olNuzAJtxOQrmPfjUeNB
	7YhtdHNxwqiiTxvJOJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjcG-008jXE-Py; Thu, 19 Aug 2021 15:06:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjbx-008jUC-TF; Thu, 19 Aug 2021 15:05:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12A5A6113D;
 Thu, 19 Aug 2021 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629385539;
 bh=LGZKmQwPGywDOK76NamejmfBRkmI5bWYX8EQHyNOtYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFMkEnqsoWtwZiEbZiGpyS0Cg4duOAjVf+cB88adbS/SQPyw/B0t6tB4HsKmsV5T9
 xfHrzvrYdKScH/pudb7r5Encmn61xEI0bjk83hVcUB0NF13czFCdXjkRBYo/bXuGR6
 cveAfJS3wou7w5lghZrKJYZoecX+XIhnUfe9WvV4=
Date: Thu, 19 Aug 2021 17:05:36 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ikjn@chromium.org" <ikjn@chromium.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: Do not use xhci's virt_dev in drop_endpoint
Message-ID: <YR5zQD8dFWsXu5Ns@kroah.com>
References: <20210805133731.1.Icc0f080e75b1312692d4c7c7d25e7df9fe1a05c2@changeid>
 <2593ac262cdf0088e937b9fbc907bb23a6736fb5.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2593ac262cdf0088e937b9fbc907bb23a6736fb5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_080542_004217_FF978845 
X-CRM114-Status: GOOD (  23.08  )
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

T24gVGh1LCBBdWcgMTksIDIwMjEgYXQgMTE6NTY6NTlBTSArMDAwMCwgQ2h1bmZlbmcgWXVuICjk
upHmmKXls7ApIHdyb3RlOgo+IEhpIEdyZWcsCj4gCj4gT24gVGh1LCAyMDIxLTA4LTA1IGF0IDEz
OjM3ICswODAwLCBJa2pvb24gSmFuZyB3cm90ZToKPiA+IHhoY2ktbXRrIGRlcGVuZHMgb24geGhj
aSdzIGludGVybmFsIHZpcnRfZGV2IHdoZW4gaXQgcmV0cmlldmVzIGl0cwo+ID4gaW50ZXJuYWwg
ZGF0YSBmcm9tIHVzYl9ob3N0X2VuZHBvaW50IGJvdGggaW4gYWRkX2VuZHBvaW50IGFuZAo+ID4g
ZHJvcF9lbmRwb2ludCBjYWxsYmFja3MuIEJ1dCB3aGVuIHNldHVwIHBhY2tldCB3YXMgcmV0aXJl
ZCBieQo+ID4gdHJhbnNhY3Rpb24gZXJyb3JzIGluIHhoY2lfc2V0dXBfZGV2aWNlKCkgcGF0aCwg
YSB2aXJ0X2RldiBmb3IgdGhlCj4gPiBzbG90Cj4gPiBpcyBuZXdseSBjcmVhdGVkIHdpdGggcmVh
bF9wb3J0IDAuIFRoaXMgbGVhZHMgdG8geGhjaS1tdGtzJ3MgTlVMTAo+ID4gcG9pbnRlcgo+ID4g
ZGVyZWZlcmVuY2UgZnJvbSBkcm9wX2VuZHBvaW50IGNhbGxiYWNrIGFzIHhoY2ktbXRrIGFzc3Vt
ZXMgdGhhdAo+ID4gdmlydF9kZXYncwo+ID4gcmVhbF9wb3J0IGlzIGFsd2F5cyBzdGFydGVkIGZy
b20gb25lLiBUaGUgc2ltaWxhciBwcm9ibGVtcyB3ZXJlCj4gPiBhZGRyZXNzZWQKPiA+IGJ5IFsx
XSBidXQgdGhhdCBjYW4ndCBjb3ZlciB0aGUgZmFpbHVyZSBjYXNlcyBmcm9tIHNldHVwX2Rldmlj
ZS4KPiA+IAo+ID4gVGhpcyBwYXRjaCBkcm9wcyB0aGUgdXNhZ2VzIG9mIHhoY2kncyB2aXJ0X2Rl
diBpbiB4aGNpLW10aydzCj4gPiBkcm9wX2VuZHBvaW50Cj4gPiBjYWxsYmFjayBieSBhZG9wdGlu
ZyByaGFzaHRhYmxlIGZvciBzZWFyY2hpbmcgbXRrJ3Mgc2NoZWR1bGUgZW50aXR5Cj4gPiBmcm9t
IGEgZ2l2ZW4gdXNiX2hvc3RfZW5kcG9pbnQgcG9pbnRlciBpbnN0ZWFkIG9mIHNlYXJjaGluZyBh
IGxpbmtlZAo+ID4gbGlzdC4KPiA+IFNvIG10aydzIGRyb3BfZW5kcG9pbnQgY2FsbGJhY2sgZG9l
c24ndCBoYXZlIHRvIHJlbHkgb24gdmlydF9kZXYgYXQKPiA+IGFsbC4KPiA+IAo+ID4gWzFdIAo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjE3MTc5MTQyLTI2ODEtMi1naXQtc2VuZC1l
bWFpbC1jaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IElr
am9vbiBKYW5nIDxpa2puQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gCj4gPiAgZHJpdmVycy91
c2IvaG9zdC94aGNpLW10ay1zY2guYyB8IDE0MCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
Cj4gPiAtLS0tCj4gPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay5oICAgICB8ICAxNSArKy0t
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMgYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktCj4gPiBtdGstc2NoLmMKPiA+IGluZGV4IGNmZmNhZjRkZmE5
Zi4uZjliNGQyN2NlNDQ5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW10
ay1zY2guYwo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYwo+ID4gCj4g
Cj4gSSBzZWUgdGhlIHBhdGNoIGlzIGFscmVhZHkgaW4gdXNiLW5leHQgYnJhbmNoLCBidXQgZmlu
ZCBzb21lIG5ldyBidWdzCj4gaW50cm9kdWNlZCBhZnRlciBJIHRlc3QgaXQgKG9uZSBOVUxMIHBv
aW50IGRlcmVmZXJlbmNlIG9vcHMsIHR3byBtZW1vcnkKPiBsZWFrYWdlIGR1ZSB0byBubyBlcnJv
ciBoYW5kbGluZykuIAo+IFdoYXQgZG8gSSBuZWVkIHRvIGRvPyByZXZlcnQgdGhpcyBwYXRjaCB0
aGVuIHNlbmQgbmV3IHZlcnNpb24gb3IganVzdAo+IHNlbmQgZml4IHBhdGNoZXM/CgpXaGljaCBl
dmVyIHlvdSB3YW50IHRvIGRvIGlzIGZpbmUgd2l0aCBtZS4KCnRoYW5rcywKCmdyZWcgay1oCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
