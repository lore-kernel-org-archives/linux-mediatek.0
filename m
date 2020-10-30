Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39D9C56201
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 08:52:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A76520728
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 08:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uZz6YlS6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrNLVNGD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A76520728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y8VvLGhJFUUYdmYaYjhmGDX9dHmxPheoQf8GKj70298=; b=uZz6YlS6pfXVT1B9VmlJ/8N14
	pTZVetSpJ2YmrJ27QxUc9ysH+4QgyVivnAesA//xg28m0wd7qdMuJRZSu33zsgXj0eqtFQO5Kol+r
	kgYUjHl9Sv7UaFP4s28J1HPCAZXLNjthrhWL59SOcFBaQqqbV9rj9gHWZjBTcnhNbpFQyZHO4XtKy
	bmPPL36Jn010M+MZoL6FHF5iVgJKAyOstFIWjoLkifi1B2V8mU0wNEJUfkzPajv+1DlUDR7q6JeNn
	WQl3jbw0VIpRwmvK3kuSBI6iQrKIQqcBawk7uQ2lFyRx0uU+eB4AB04t07nfTDCki0M/m4UfKY9P6
	qWcgL0yTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQ8g-0000Yi-N2; Fri, 30 Oct 2020 08:52:02 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQ8X-0000Vl-B2; Fri, 30 Oct 2020 08:51:54 +0000
Received: by mail-oi1-x243.google.com with SMTP id w191so5984060oif.2;
 Fri, 30 Oct 2020 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EYFsizROf5nBI3vjm3lc9058B7pQE1IZ4TMUM0yjHO0=;
 b=nrNLVNGDC4oTXZzPTuj6ZR2IgS0RpSwQa6MzJT2M14RHlHusbs8N/KdjeQODIa69Fq
 ZdSQ2+n4cipmdbZwOOHTgWsz/9K9056sO7RK6KwOPOg+CNEjITywQSQxgEzCZVFDmooV
 HfjseyEiG122IWq13MGtUc3gpURvmvQ23oFXZkO5bAqMj/eti7fpL3VJlmHzrj8Pn0ul
 i804miWfazPue1rTOMFnYjkM6PYEAdPsvCvCHy1x0R06Zywbj8icMgN6LLZiNdHdDmN3
 TBV/YXettblZhpCdF0/9QtbjT4Td9+kE5uNNmlverT0JjOhrhQlVOJUhUeQjtTwsEBH6
 IsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EYFsizROf5nBI3vjm3lc9058B7pQE1IZ4TMUM0yjHO0=;
 b=TfkqLeZvx4I6prQMWwGq8XwOCvcyWCURXQTh3Cnb7puMx3iBWDUj/j3lnS8mIOupIl
 UgFg7zgHfPgQ+b+XkBFk3o80TjQkTEBFGDbC3ITgqkG30cFe8kc23xz8rJ5niXPf7kLt
 r0TWOot+wIQ2BAs07Cs1vBXU5a21KhA8Ep/hTmZRIdMZ6JeYc3KzJkaf2SqEPkFzCQ9O
 Mtgd0Gt+vPpGF6H08zHlhqOl1gqPYvBRKYftAAbm4dzs3iu7AmzSuuQJ41uuUKVWgeyf
 gVcmD3XsSiUzIuDdn5oaHk2OOnPNqTdm3uXDHfg6X8q9kqfdyJ/JtBV2TIcOHcaI+Xcf
 yOVA==
X-Gm-Message-State: AOAM533L5JibTAunyYCiQTWOCuFVyhKnXqH+Qa2cZdGNGk7zpP9KZXAi
 kc7i7Qm/6toab03qtgBm9Uyom/GVs5IXMTpxJV8=
X-Google-Smtp-Source: ABdhPJx9L8WP509ApHzlkJwOOPZ2gkvUW+8ERNKkSL/KG2e7sSxeTIuKtZ55i3auP6YV2QGpiqwTKhXntRWz+/14P6I=
X-Received: by 2002:aca:4c8d:: with SMTP id z135mr891137oia.23.1604047910543; 
 Fri, 30 Oct 2020 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
 <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
 <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
In-Reply-To: <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 30 Oct 2020 16:51:38 +0800
Message-ID: <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_045153_565798_0A7CDD03 
X-CRM114-Status: GOOD (  30.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTDmnIgyOOaXpSDpgLHkuIkg5LiK5Y2IMToyOOWvq+mBk++8mgo+Cj4gT24gMTAvMjcvMjAgMTA6
MjggQU0sIEdlbmUgQ2hlbiB3cm90ZToKPiA+IEphY2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6
ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDU6NDfl
r6vpgZPvvJoKPiA+Pgo+ID4+IE9uIDEwLzIwLzIwIDg6NDQgQU0sIEdlbmUgQ2hlbiB3cm90ZToK
PiA+Pj4gSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAy
MDIw5bm0MTDmnIg55pelIOmAseS6lCDkuIrljYg1OjUx5a+r6YGT77yaCj4gPj4+Pgo+ID4+Pj4g
SGkgR2VuZSwKPiA+Pj4+Cj4gPj4+PiBPbiAxMC83LzIwIDM6NDIgQU0sIEdlbmUgQ2hlbiB3cm90
ZToKPiA+Pj4+PiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Pj4+
Pgo+ID4+Pj4+IEFkZCBNVDYzNjAgTEVEIGRyaXZlciBpbmNsdWRlIDItY2hhbm5lbCBGbGFzaCBM
RUQgd2l0aCB0b3JjaC9zdHJvYmUgbW9kZSwKPiA+Pj4+PiAzLWNoYW5uZWwgUkdCIExFRCBzdXBw
b3J0IFJlZ2lzdGVyL0ZsYXNoL0JyZWF0aCBNb2RlLCBhbmQgMS1jaGFubmVsIGZvcgo+ID4+Pj4+
IG1vb25saWdodCBMRUQuCj4gPj4+Pj4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiAgICAgZHJpdmVycy9s
ZWRzL0tjb25maWcgICAgICAgfCAgMTIgKwo+ID4+Pj4+ICAgICBkcml2ZXJzL2xlZHMvTWFrZWZp
bGUgICAgICB8ICAgMSArCj4gPj4+Pj4gICAgIGRyaXZlcnMvbGVkcy9sZWRzLW10NjM2MC5jIHwg
NzgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4+
ICAgICAzIGZpbGVzIGNoYW5nZWQsIDc5NiBpbnNlcnRpb25zKCspCj4gPj4+Pj4gICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYwo+ID4+Pj4+Cj4gPj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9LY29uZmlnIGIvZHJpdmVycy9sZWRzL0tjb25maWcK
PiA+Pj4+PiBpbmRleCAxYzE4MWRmLi5jNzE5MmRkIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZl
cnMvbGVkcy9LY29uZmlnCj4gPj4+Pj4gKysrIGIvZHJpdmVycy9sZWRzL0tjb25maWcKPiA+Pj4+
PiBAQCAtMjcxLDYgKzI3MSwxOCBAQCBjb25maWcgTEVEU19NVDYzMjMKPiA+Pj4+PiAgICAgICAg
ICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBvbi1jaGlwIExFRCBkcml2ZXJzIGZv
dW5kIG9uCj4gPj4+Pj4gICAgICAgICAgIE1lZGlhdGVrIE1UNjMyMyBQTUlDLgo+ID4+Pj4+Cj4g
Pj4+Pj4gK2NvbmZpZyBMRURTX01UNjM2MAo+ID4+Pj4+ICsgICAgIHRyaXN0YXRlICJMRUQgU3Vw
cG9ydCBmb3IgTWVkaWF0ZWsgTVQ2MzYwIFBNSUMiCj4gPj4+Pj4gKyAgICAgZGVwZW5kcyBvbiBM
RURTX0NMQVNTX0ZMQVNIICYmIE9GCj4gPj4+Pj4gKyAgICAgZGVwZW5kcyBvbiBMRURTX0NMQVNT
X01VTFRJQ09MT1IKPiA+Pj4+Cj4gPj4+PiBTaW5jZSBDT05GSUdfTEVEX0NMQVNTX01VTFRJQ09M
T1IgY2FuIGJlIHR1cm5lZCBvZmYgeW91IG5lZWQgdG8gaGF2ZQo+ID4+Pj4gYmVsb3cgaW5zdGVh
ZDoKPiA+Pj4+Cj4gPj4+PiBkZXBlbmRzIG9uIExFRFNfQ0xBU1NfTVVMVElDT0xPUiB8fCAhIUxF
RFNfQ0xBU1NfTVVMVElDT0xPUgo+Cj4gTXkgdHlwbyBoZXJlLCBzaG91bGQgYmUgb25lICIhIjoK
Pgo+IGRlcGVuZHMgb24gTEVEU19DTEFTU19NVUxUSUNPTE9SIHx8ICFMRURTX0NMQVNTX01VTFRJ
Q09MT1IKPgo+IEFuZCB5b3Ugc2hvdWxkIGFsc28gaGF2ZQo+Cj4gZGVwZW5kcyBvbiBMRURTX0NM
QVNTX0ZMQVNIIHx8ICFMRURTX0NMQVNTX0ZMQVNICj4KPiBCdXQgdG8gbWFrZSBpdCB3b3JrIGNv
cnJlY3RseSB5b3Ugd291bGQgaGF2ZSB0byBhZGQgcmVnaXN0cmF0aW9uCj4gc3R1YnMgdG8gaW5j
bHVkZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaCBzaW1pbGFybHkgdG8gTEVEIG1jIHN0dWJzCj4g
aW4gaW5jbHVkZS9saW51eC9sZWQtY2xhc3MtbXVsdGljb2xvci5oLgo+Cj4gPj4+Pgo+ID4+Pj4g
VW5sZXNzIHlvdSB3YW50IHRvIHByZXZlbnQgZW5hYmxpbmcgdGhlIGRyaXZlciB3aXRob3V0IFJH
QiBMRUQsCj4gPj4+PiBidXQgdGhhdCBkb2VzIG5vdCBzZWVtIHRvIGJlIHJlYXNvbmFibGUgYXQg
Zmlyc3QgZ2xhbmNlLgo+ID4+Pj4KPiA+Pj4KPiA+Pj4gTWF5IEkgY2hhbmdlIHRvICJzZWxlY3Qg
TEVEU19DTEFTU19NVUxUSUNPTE9SIj8KPiA+Pj4gSSBzdXBwb3NlIFJHQiBhbHdheXMgdXNlIG11
bHRpY29sb3IgbW9kZS4KPiA+Pgo+ID4+IFlvdSB3aWxsIGFsc28gaGF2ZSBtb29ubGlnaHQgTEVE
IHRoYXQgd2lsbCBub3QgbmVlZCBtdWx0aWNvbG9yCj4gPj4gZnJhbWV3b3JrLiBJcyBpdCBzb21l
aG93IHRyb3VibGVzb21lIHRvIGtlZXAgImRlcGVuZHMgb24iPwo+ID4+Cj4gPgo+ID4gSWYgb25s
eSB1c2UgTUwgTEVEIGFuZCBGTEVELCAgRFRTSSB3aWxsIG9ubHkgZGVmaW5lIE1MIExFRCBhbmQg
RkxFRC4KPiA+IFRoZXJlZm9yZSwgdGhlIGRyaXZlcnMgcHJvYmUgd2lsbCBub3QgcmVnaXN0ZXIg
cmdiIG11bHRpY29sb3IgZGV2aWNlLgo+Cj4gUGxlYXNlIHRlc3QgeW91ciB1c2UgY2FzZSBhZ2Fp
biB3aXRoIG15IGZpeGVkICJkZXBlbmRzIG9uIi4KPgo+IEluIGNhc2Ugd2hlbiB0aGVyZSBpcyBv
bmx5IE1MIExFRCBhbmQgRkxFRCBpbiB0aGUgRFQgaXQgc2hvdWxkCj4gcmVnaXN0ZXIgYm90aCBk
ZXZpY2VzIGlmIExFRFNfQ0xBU1NfRkxBU0ggaXMgdHVybmVkIG9uLgo+IE11bHRpY29sb3IgZnJh
bWV3b3JrIGhhcyBub3RoaW5nIHRvIGRvIGluIHRoaXMgY2FzZS4KPgo+IEJ1dCBpZiB5b3UgYWRk
aXRpb25hbGx5IGhhZCBNQyBMRUQgbm9kZSwgdGhlbiBpdCBzaG91bGQKPiBiZSByZWdpc3RlcmVk
IG9ubHkgaWYgTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIGVuYWJsZWQuCj4KPiBTaW1pbGFybHks
IHdoZW4gRkxFRCBub2RlIGlzIHByZXNlbnQsIGJ1dCBMRURTX0NMQVNTX0ZMQVNICj4gaXMgb2Zm
LCBhbmQgTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIG9uLCB0aGUgZHJpdmVyIHNob3VsZCBzdGls
bAo+IGNvbXBpbGUsIGJ1dCByZWdpc3RlciBvbmx5IExFRCBNQyBkZXZpY2UgKGlmIGl0cyBub2Rl
IGlzIHByZXNlbnQpLgo+CgpJIHRoaW5rIHRoaXMgY2FzZSBvbmx5IHJlZ2lzdGVyIExFRCBkZXZp
Y2UsIG5vdCBMRUQgIk1DIiBkZXZpY2UuCkJlY2F1c2Ugb3VyIEZMQVNIIGlzIG5vdCBhIG11bHRp
Y29sb3IgZGV2aWNlLgoKPiBQb3NzaWJsZSBzaG91bGQgYmUgYWxzbyB0aGUgY2FzZSB3aGVuIGJv
dGggTEVEU19DTEFTU19GTEFTSAo+IGFuZCBMRURTX0NMQVNTX01VTFRJQ09MT1IgYXJlIG9mZi4g
VGhlbiBvbmx5IExFRCBjbGFzcyBkZXZpY2UKPiBmb3IgTUwgTEVEIHdpbGwgYmUgcmVnaXN0ZXJl
ZCAocHJvdmlkZWQgdGhlcmUgaXMgTUwgRFQgbm9kZSkuCj4gQnV0IHRvIG1ha2UgaXQgcG9zc2li
bGUgeW91IHNob3VsZCBoYXZlIGFsc28gImRlcGVuZHMgb24gTEVEU19DTEFTUyIKPiBpbiB0aGUg
S2NvbmZpZyBlbnRyeS4KPgoKQWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbiwKZGVwZW5kcyBv
biBMRURfQ0xBU1MgJiYgTEVEU19DTEFTU19GTEFTSCAmJiBPRgpkZXBlbmRzIG9uIExFRFNfQ0xB
U1NfTVVMVElDT0xPUiB8fCAhIUxFRFNfQ0xBU1NfTVVMVElDT0xPUgpkZXBlbmRzIG9uIExFRFNf
Q0xBU1NfRkxBU0ggfHwgIUxFRFNfQ0xBU1NfRkxBU0gKZGVwZW5kcyBvbiBNRkRfTVQ2MzYwCgph
bmQgc291cmNlIGNvZGUgYWRkIGNvbnN0cmFpbnQKCiNpZiBJU19FTkFCTEVEKENPTkZJR19MRURT
X0NMQVNTX01VTFRJQ09MT1IpCiAgICByZXQgPSBkZXZtX2xlZF9jbGFzc2Rldl9tdWx0aWNvbG9y
X3JlZ2lzdGVyX2V4dChwYXJlbnQsICZsZWQtPnJnYiwKaW5pdF9kYXRhKTsKI2VuZGlmCgojaWYg
SVNfRU5BQkxFRChDT05GSUdfTEVEU19DTEFTU19GTEFTSCkKICAgIHJldCA9IGRldm1fbGVkX2Ns
YXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChwYXJlbnQsICZsZWQtPmZsYXNoLCBpbml0X2RhdGEp
OwojZW5kaWYKCj09PT09PT09PT09PT0KCk9yIFNob3VsZCBJIHNlcGVyYXRlIHR3byBkcml2ZXJz
PwpvbmUgZm9yIFJHQiBMRUQsIG9uZSBmb3IgTUwgTEVEIGFuZCBGTEVECgo+ID4gSSB3aWxsIHJl
bW92ZSAiZGVwZW5kcyIsIHVzZSAic2VsZWN0IiBpbnN0ZWFkLgo+Cj4gLS0KPiBCZXN0IHJlZ2Fy
ZHMsCj4gSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
