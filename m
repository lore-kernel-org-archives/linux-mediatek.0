Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4554C49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:16:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCAF60238
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 16:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCAF60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gOd8bOzzJ82bItQ6xoTL1FaVs6ry1eolEnG9bTpUPQ=; b=hag4GD8q+8ZmLf
	iHt9s5nN5ud76t8HKooSHPkGmuScoA+VWzY2kOT72TbpD4r6rLcfaMHxRG025Zs1RQvr2z0SCDAZy
	k5D6SrKGxFbrwMHEBtVsAR4H4cgv/bLwJE4acI9Gsy1Fltseolj7MW9FeNulIp9A9plcYrAv3XzZn
	YTUao8u0av8sqbpHuw0vECGr9I6hZh2JS9yoUR5G6pnp2YozzPwQfK3PbpsfPjkpZXMFIjtmdKs4g
	Ht/CWy6x+PtN1xTByQlOc30Ae4wmFXTpcn1nqoo5MbILJ97E7ZiHhWwG2lpAeB4cr5TZLkfRhrDIK
	h8KtSpeATkYpkDq3dduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwS1n-00FRWJ-4L; Thu, 24 Jun 2021 16:16:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwS1Z-00FRTN-UC
 for linux-mediatek@lists.infradead.org; Thu, 24 Jun 2021 16:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624551376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE3C8fAY2Ke4f8GlbED3jZxKdHMupZo0qHgep6Jpwjw=;
 b=Hpw5m1Fnt0DC/M1GbyDozBfzfPEz0NOnjXEBna9erk4fwWen/XrwbJc182EKAH8O2Nggs7
 Yxah2jHu8uVEunF8nes0xREyVxvzj2uu0xwgOe3H2KFhseEs5oF0rbfDU76KPn9+h4qhYr
 bM788YhIk7ZfcHVCVMwodgy1aKVZmAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-kn1rgtX5OaScVNH41hFkNw-1; Thu, 24 Jun 2021 12:14:32 -0400
X-MC-Unique: kn1rgtX5OaScVNH41hFkNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA39801596;
 Thu, 24 Jun 2021 16:14:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.10.110.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E91A19C66;
 Thu, 24 Jun 2021 16:14:24 +0000 (UTC)
Message-ID: <0548d1daa7e1eee9d8202481668bbe4975c9b33d.camel@redhat.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
From: Dan Williams <dcbw@redhat.com>
To: Rocco Yue <rocco.yue@mediatek.com>, Greg KH
 <gregkh@linuxfoundation.org>,  David Ahern <dsahern@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>,  netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 bpf@vger.kernel.org, wsd_upstream@mediatek.com, chao.song@mediatek.com, 
 kuohong.wang@mediatek.com
Date: Thu, 24 Jun 2021 11:14:24 -0500
In-Reply-To: <20210624061310.12315-1-rocco.yue@mediatek.com>
References: <YNQYHfE09Dx5kWyg@kroah.com>
 <20210624061310.12315-1-rocco.yue@mediatek.com>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_091618_241410_89B3DBE0 
X-CRM114-Status: GOOD (  26.56  )
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

T24gVGh1LCAyMDIxLTA2LTI0IGF0IDE0OjEzICswODAwLCBSb2NjbyBZdWUgd3JvdGU6Cj4gT24g
VGh1LCAyMDIxLTA2LTI0IGF0IDA3OjI5ICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+ID4gCj4gPiBU
aGFua3MgZm9yIHRoZSBleHBsYWluYXRpb24sIHdoeSBpcyB0aGlzIGhhcmR3YXJlIHNvbWVob3cg
InNwZWNpYWwiCj4gPiBpbgo+ID4gdGhpcyB3YXkgdGhhdCB0aGlzIGhhcyBuZXZlciBiZWVuIG5l
ZWRlZCBiZWZvcmU/Cj4gPiAKPiA+IHRoYW5rcywKPiA+IAo+ID4gZ3JlZyBrLWgKPiA+IAo+IAo+
IEJlZm9yZSBrZXJuZWwtNC4xOCwgUkFXSVAgd2FzIHRoZSBzYW1lIGFzIFBVUkVJUCwgbmVpdGhl
ciBvZiB0aGVtCj4gYXV0b21hdGljYWxseSBnZW5lcmF0ZXMgYW4gSVB2NiBsaW5rLWxvY2FsIGFk
ZHJlc3MsIGFuZCB0aGUgd2F5IHRvCj4gZ2VuZXJhdGUgYW4gSVB2NiBnbG9iYWwgYWRkcmVzcyBp
cyB0aGUgc2FtZS4KClRoaXMgZGlzdGluY3Rpb24gc2VlbXMgY29uZnVzaW5nIGZyb20gYSBrZXJu
ZWwgc3RhbmRwb2ludCBpZiBpdCBvbmx5CmNoYW5nZXMgaG93IHY2IElJRHMgYXJlIGRldGVybWlu
ZWQuIERvIHdlIHJlYWxseSBuZWVkIHNvbWV0aGluZyB0aGF0J3MKYWxzbyByZWZsZWN0ZWQgdG8g
dXNlcnNwYWNlIChpbiBzdHJ1Y3QgaWZpbmZvbXNnIC0+IGlmaV90eXBlKSBpZiB0aGUKa2VybmVs
IGlzIGhhbmRsaW5nIHRoZSBiZWhhdmlvciB0aGF0J3MgZGlmZmVyZW50PyBXaHkgc2hvdWxkIHVz
ZXJzcGFjZQpjYXJlPwoKSSdtIGFsc28gY3VyaW91cyB3aHkgdGhpcyBpc24ndCBhbiBpc3N1ZSBm
b3IgdGhlIGlwYS9ybW5ldCAoUXVhbGNvbW0pCm1vZGVtIGRyaXZlcnMuIFRoZXJlJ3MgcHJvYmFi
bHkgYSBnb29kIHJlYXNvbiwgYnV0IHdvdWxkIGJlIGdvb2QgdG8Ka25vdyB3aGF0IHRoYXQgaXMg
ZnJvbSBBbGV4IEVsZGVyIG9yIExvaWMgb3IgQmpvcm4uLi4KCkRhbgoKPiAKPiBBZnRlciBrZXJu
ZWwtNC4xOCAoaW5jbHVkZSA0LjE4IHZlcnNpb24pLCB0aGUgYmVoYXZpb3Igb2YgUkFXSVAgaGFk
Cj4gY2hhbmdlZCBkdWUgdG8gdGhlIGZvbGxvd2luZyBwYXRjaDoKPiBAQMKgIHN0YXRpYyBpbnQg
aXB2Nl9nZW5lcmF0ZV9ldWk2NCh1OCAqZXVpLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgQVJQSFJEX1JBV0lQOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gYWRkcmNvbmZfaWZpZF9yYXdpcChldWksIGRldik7Cj4gwqDCoMKgwqDC
oMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOwo+IH0KPiAKPiB0aGUgcmVhc29u
IHdoeSB0aGUga2VybmVsIGRvZXNuJ3QgbmVlZCB0byBnZW5lcmF0ZSB0aGUgbGluay1sb2NhbAo+
IGFkZHJlc3MgYXV0b21hdGljYWxseSBpcyBhcyBmb2xsb3dzOgo+IAo+IEluIHRoZSAzR1BQIDI5
LjA2MSwgaGVyZSBpcyBzb21lIGRlc2NyaXB0aW9uIGFzIGZvbGxvd3M6Cj4gImluIG9yZGVyIHRv
IGF2b2lkIGFueSBjb25mbGljdCBiZXR3ZWVuIHRoZSBsaW5rLWxvY2FsIGFkZHJlc3Mgb2YKPiBN
UyBhbmQgdGhhdCBvZiB0aGUgR0dTTiwgdGhlIEludGVyZmFjZS1JZGVudGlmaWVyIHVzZWQgYnkg
dGhlIE1TIHRvCj4gYnVpbGQgaXRzIGxpbmstbG9jYWwgYWRkcmVzcyBzaGFsbCBiZSBhc3NpZ25l
ZCBieSB0aGUgR0dTTi4gVGhlIEdHU04KPiBlbnN1cmVzIHRoZSB1bmlxdWVuZXNzIG9mIHRoaXMg
SW50ZXJmYWNlLUlkZW50aWZpZXIuIFRoZW4gTVQgc2hhbGwKPiB0aGVuIGVuZm9yY2UgdGhlIHVz
ZSBvZiB0aGlzIEludGVyZmFjZS1JZGVudGlmaWVyIGJ5IHRoZSBURSIKPiAKPiBJbiBvdGhlciB3
b3JkcywgaW4gdGhlIGNlbGx1bGFyIG5ldHdvcmssIEdHU04gZGV0ZXJtaW5lcyB3aGV0aGVyIHRv
Cj4gcmVwbHkgdG8gdGhlIFJvdXRlciBTb2xpY2l0YXRpb24gbWVzc2FnZSBvZiBVRSBieSBpZGVu
dGlmeWluZyB0aGUKPiBsb3cgNjRiaXRzIG9mIFVFIGludGVyZmFjZSdzIGlwdjYgbGluay1sb2Nh
bCBhZGRyZXNzLgo+IAo+IFdoZW4gdXNpbmcgYSBuZXcga2VybmVsIGFuZCBSQVdJUCwga2VybmVs
IHdpbGwgZ2VuZXJhdGUgYW4gRVVJNjQKPiBmb3JtYXQgaXB2NiBsaW5rLWxvY2FsIGFkZHJlc3Ms
IGFuZCBpZiB0aGUgZGV2aWNlIHVzZXMgdGhpcyBhZGRyZXNzCj4gdG8gc2VuZCBSUywgR0dTTiB3
aWxsIG5vdCByZXBseSBSQSBtZXNzYWdlLgo+IAo+IFRoZXJlZm9yZSwgaW4gdGhhdCBiYWNrZ3Jv
dW5kLCB3ZSBjYW1lIHVwIHdpdGggUFVSRUlQIHRvIG1ha2Uga2VybmVsCj4gZG9lc24ndCBnZW5l
cmF0ZSBhIGlwdjYgbGluay1sb2NhbCBhZGRyZXNzIGluIGFueSBhZGRyZXNzIGdlbmVyYXRlCj4g
bW9kZS4KPiAKPiBUaGFua3MsCj4gUm9jY28KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
