Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A16CC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 19:58:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2046613E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 19:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2046613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eMBWyXDduEKZ+3pcuQT/6+lZTCDcuH/6XXIDoRB8y3Q=; b=fSTIAWMLsQsfP7P8NLO6wFqgX
	nragkHSHMtpCK2LND8Cs4+UqR/2FWcoA7u3NHVrOBsPHmJ+zVL572alChv2VJU4hoSs9ioa00l21x
	TN8pVtcxW38m9USPZ4JzI/btXoQYhV33opnnVz7tZGjIw/GgM9qw/z+DO/OsmWDbWe488v7n/SXDL
	+v7g2kCwkL/01gbrmCYa9TRlYr5uxdM/0ZWQHlcvzBr7qoEBUyIHjXvmxjstrJjU3KNK7hhZoFTDd
	LYNEN9n7GtceIOlI7R6iYcZAcHn4QCPebCv9mYmMhuJoFq5mApAgleQG46doVFeZlanNThHoDM2m/
	JcFYagWRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYwVc-00Cyfv-P5; Tue, 20 Apr 2021 19:58:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYwVS-00CyfS-1f; Tue, 20 Apr 2021 19:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=ulOh35YKTzDGjHHbOIeKgCUjEcwsBwlNnX1HkWl6feU=; b=lQGvqDH+N1LB+HHSagMHRfKz6H
 m5xcZD2/jlA9l7mlHSnF7TVHS7Mv+PrxyTgkDRK+vkgTTF3UQcvwvQBdmtjJsq8/Wc6/gmW5acFFN
 19/jGDC38B66D2pyIeZNO/UWzjTKpdCzhxyQBRBxrrY+wdr5ghZ2HJyj97KM2SvnIcFzG6DpO5Zuk
 vlHLef1kLnORRsHQ7CRZjI+mMXm1okJFyuHmOvsBtfMPHUHSVCDpqjBNZMN0M/og6FSC5dP3YWms1
 op8tLcNcRF8ZW/0vxecJSnEf2FqEkoYf+wF3ZOx/281eDKxvKZUJsqLXmH91F9BFFL3qeEpDE0Hwg
 OzuiYVjQ==;
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYwVP-00CODP-Cf; Tue, 20 Apr 2021 19:57:56 +0000
Received: by mail-io1-xd36.google.com with SMTP id k25so39762815iob.6;
 Tue, 20 Apr 2021 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ulOh35YKTzDGjHHbOIeKgCUjEcwsBwlNnX1HkWl6feU=;
 b=hBVbeV4BnJGRV3FquaMNFY/ntM0zt3JBUFcQsMJEsKzY0P5cmc7WNpusW18VkSN+za
 Dn75WQbqI+m0NWAJLwp2P4O6SRuNKeAVPjt+g7EBTmL2TjwB06SJFC4vNQe6d2xYQ1VX
 S2Sn3TpTxLY9z0lmHSmt3TQJlvR2hVuWJ7j9PoOS0ffJIL4c0cTLRakKwljssQffYaJY
 /n4dU8E4sr+5sqCh64amQMw1Gk2jk7qF6NC9DzZH6g/9GmjPqtUy2NusyMxvA6KxoO60
 Q/IO5lDqPfGgaKM0eSrxM92CudrgLCFqexslTn19gyZ/nnUYjKZ6zrX10QIPWamkgUOX
 tFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ulOh35YKTzDGjHHbOIeKgCUjEcwsBwlNnX1HkWl6feU=;
 b=HWkXzuzpqWfEnWjnEIFgKcZvi++d7NnUhjGHZFctPoFWF/BLcz0mDlVCYynM9mJDLf
 jxzs0Ov7IhuNuZc+35db47sdHZbQ3qmGkzcs3AQNFHXwYcfFX6X61ineudpnvCcI8t2S
 ojGTWE7c3dz1CBBoDYlSjP3buc4xINQulkZOQ5w7CjXWK8/OTbxbgp6KzGKCXZ9WkFWA
 B+SbeZ4lLoi2d46BYNNMzft4+PKtZlQrU5J9E8/isPMSuEsrBXk2XziEVU2ZPnYxPVj5
 c1Ook55ycCRVZrqe8v8rpbQdhqU7xS4m1emt3+1y5WAquDu2DXl3BnSPTf4b2Y4ZB4+p
 V50Q==
X-Gm-Message-State: AOAM5319rtqBYGvUYt+ViLZBuuQjOSUlggDI27StA1ag5M9uj+RaZjUc
 H6/eXrV2V0clXRKZps2wbEU80tESJqKqyJLEI3w=
X-Google-Smtp-Source: ABdhPJyMtm2IMk51TN8sNwc+pk0lMCf5V4+rL5Se/aXrIjyF3C9M7dwVP19yTmlfQ0ZT0pj/BxHd6sVsIRvAtY4pj3Y=
X-Received: by 2002:a6b:fc05:: with SMTP id r5mr20312524ioh.103.1618948674007; 
 Tue, 20 Apr 2021 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
 <20210420195132.GA3686955@robh.at.kernel.org>
In-Reply-To: <20210420195132.GA3686955@robh.at.kernel.org>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Tue, 20 Apr 2021 12:57:43 -0700
Message-ID: <CALCv0x2SG=0kBRnxfSPxi+FvaBK=QGPHQkHWHvTXOw64KawPUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support custom
 GMAC label
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_125755_452248_8A59BA57 
X-CRM114-Status: GOOD (  29.38  )
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

T24gVHVlLCBBcHIgMjAsIDIwMjEgYXQgMTI6NTEgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAxOSwgMjAyMSBhdCAwODo0Njo1OUFNIC0wNzAw
LCBJbHlhIExpcG5pdHNraXkgd3JvdGU6Cj4gPiBUaGUgTUFDIGRldmljZSBuYW1lIGNhbiBub3cg
YmUgc2V0IHdpdGhpbiBEVFMgZmlsZSBpbnN0ZWFkIG9mIGFsd2F5cwo+ID4gYmVpbmcgImV0aFgi
LiBUaGlzIGlzIGhlbHBmdWwgZm9yIERTQSB0byBjbGVhcmx5IGxhYmVsIHRoZSBEU0EgbWFzdGVy
Cj4gPiBkZXZpY2UgYW5kIGRpc3Rpbmd1aXNoIGl0IGZyb20gRFNBIHNsYXZlIHBvcnRzLgo+ID4K
PiA+IEZvciBleGFtcGxlLCBzb21lIGRldmljZXMsIHN1Y2ggYXMgdGhlIFViaXF1aXRpIEVkZ2VS
b3V0ZXIgWCwgbWF5IGhhdmUKPiA+IHBvcnRzIGxhYmVsZWQgZXRoWC4gTGFiZWxpbmcgdGhlIG1h
c3RlciBHTUFDIHdpdGggYSBkaWZmZXJlbnQgcHJlZml4Cj4gPiB0aGFuIERTQSBwb3J0cyBoZWxw
cyB3aXRoIGNsYXJpdHkuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBSZW7DqSB2YW4gRG9yc3QgPG9w
ZW5zb3VyY2VAdmRvcnN0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IElseWEgTGlwbml0c2tpeSA8
aWx5YS5saXBuaXRza2l5QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L21lZGlhdGVrL210a19ldGhfc29jLmMgfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jCj4gPiBpbmRleCA2YjAwYzEyYzZjNDMuLmRm
M2NkYTYzYThjNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVr
L210a19ldGhfc29jLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210
a19ldGhfc29jLmMKPiA+IEBAIC0yODQ1LDYgKzI4NDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG5ldF9kZXZpY2Vfb3BzIG10a19uZXRkZXZfb3BzID0gewo+ID4KPiA+ICBzdGF0aWMgaW50IG10
a19hZGRfbWFjKHN0cnVjdCBtdGtfZXRoICpldGgsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4g
PiAgewo+ID4gKyAgICAgY29uc3QgY2hhciAqbGFiZWwgPSBvZl9nZXRfcHJvcGVydHkobnAsICJs
YWJlbCIsIE5VTEwpOwo+ID4gICAgICAgY29uc3QgX19iZTMyICpfaWQgPSBvZl9nZXRfcHJvcGVy
dHkobnAsICJyZWciLCBOVUxMKTsKPiA+ICAgICAgIHBoeV9pbnRlcmZhY2VfdCBwaHlfbW9kZTsK
PiA+ICAgICAgIHN0cnVjdCBwaHlsaW5rICpwaHlsaW5rOwo+ID4gQEAgLTI4NjcsOSArMjg2OCwx
MCBAQCBzdGF0aWMgaW50IG10a19hZGRfbWFjKHN0cnVjdCBtdGtfZXRoICpldGgsIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnApCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gICAg
ICAgfQo+ID4KPiA+IC0gICAgIGV0aC0+bmV0ZGV2W2lkXSA9IGFsbG9jX2V0aGVyZGV2KHNpemVv
ZigqbWFjKSk7Cj4gPiArICAgICBldGgtPm5ldGRldltpZF0gPSBhbGxvY19uZXRkZXYoc2l6ZW9m
KCptYWMpLCBsYWJlbCA/IGxhYmVsIDogImV0aCVkIiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBORVRfTkFNRV9VTktOT1dOLCBldGhlcl9zZXR1cCk7Cj4KPiAnbGFi
ZWwnIGlzIGdlbmVyYWxseSBzdXBwb3NlZCB0byBjb3JyZXNwb25kIHRvIHRoZSBzdGlja2VyIGZv
ciB0aGUKPiBkZXZpY2UgY29ubmVjdG9yIGZvciBhIGh1bWFuIHRvIGlkLiBJIGNhbid0IHJlYWxs
eSB0ZWxsIGlmIHRoYXQncyB0aGUKPiBjYXNlIGhlcmUuIEkgZG9uJ3Qgc2VlIGhvdyAnZ21hY1gn
IHZzLiAnZXRoWCcgbWFwcyB0byBEU0EgbWFzdGVyIHZzLgo+IHNsYXZlLgpUaGUgcG9ydHMgb24g
ZGV2aWNlcyBzdWNoIGFzIFViaXF1aXRpIEVSLVggYXJlIG5hbWVkIGV0aDAgdGhyb3VnaApldGg0
LCBhbGwgb2YgdGhlbSBEU0Egc2xhdmVzLiBUaGUgZ21hYyAoRFNBIG1hc3RlcikgaXMgaGFyZC1j
b2RlZCB0bwpldGgwIHdpdGhvdXQgdGhpcyBjaGFuZ2UuCj4KPiBJIGRvbid0IHRoaW5rIHRoaXMg
c2hvdWxkIGJlIGhhbmRsZWQgd2l0aGluIGEgc3BlY2lmaWMgZHJpdmVyIGVpdGhlci4gSWYKPiB3
ZSdyZSBnb2luZyB0byBoYXZlIGEgd2F5IHRvIG5hbWUgdGhpbmdzLCB0aGVuIGZpeCBpdCBpbgo+
IGFsbG9jX2V0aGVyZGV2KCkuCj4KPiBJdCBjYW4gYWxzbyBiZSBhcmd1ZWQgdGhhdCBkZXZpY2Ug
bmFtaW5nIGZvciB1c2Vyc3BhY2UgaXMgYSB1c2Vyc3BhY2UKPiAodWRldikgcHJvYmxlbS4KWWVh
aCwgdGhhdCBpcyBhIHZhbGlkIGFyZ3VtZW50LiBXZSBjYW4gZHJvcCB0aGlzIGNoYW5nZXNldCBp
ZiB0aGUKYWdyZWVtZW50IGlzIHRoYXQgaXQgZG9lc24ndCBiZWxvbmcgaW4gdGhlIHNwZWNpZmlj
IGRyaXZlciBvciB0aGUKa2VybmVsLXNwYWNlIGF0IGFsbC4KU29tZSBkaXNjdXNzaW9uIChhbmQg
ZGV2aWNlIHBpY3R1cmUpIGhlcmUgaWYgeW91IGFyZSBpbnRlcmVzdGVkOgpodHRwczovL2dpdGh1
Yi5jb20vb3BlbndydC9vcGVud3J0L3B1bGwvMzk3MQoKSWx5YQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
