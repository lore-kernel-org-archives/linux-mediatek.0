Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4313AC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 02:44:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104302078B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 02:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yABxHqVQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY5WPUa+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 104302078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1f4fCbnnhNP975f5xZDXSYKcnQvwlK2CmwBG9637eWc=; b=yABxHqVQZZ7cdx/c9TsM0pRod
	5ZFF32B6yh44wCn6X/YNO37inX48uzLGmSGTqniB3P+K1shkbhqYfQ7QEnAHgfEOKMIP+7DSvJW5f
	nTCAR+O9/hNcjIg/vJzp/sRiXZF5jB1llNxW6NkiEkvpMyrI/kDFUDZJyfes+4yJuXyCyP2vUZh2A
	325jf1jTOV9MmOe5HLQmu0nTFG1s+g3XAFr1eE76PrQVjJaNOTwa18W6jhDwjWuIQLFyvFnEVH43p
	RUeUqBy34lHhcYwiFOb1ieIUa5ILRRDvk9gZH1fmmYGNfbgVup0xIuegxUjdEpo5japLSmZe0TJfC
	kRBXemn/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwH1-0005ec-0F; Tue, 01 Sep 2020 02:43:51 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwGv-0005dk-Pz; Tue, 01 Sep 2020 02:43:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id y2so9117341ljc.1;
 Mon, 31 Aug 2020 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3goilOQjfvmalan6T70oSxy71Eb7b8sm1pFq3tCaMuE=;
 b=MY5WPUa+HHogDSqFdmZN/aCR9qyBTb6OaEgBTqAsiSyJgABd9t/VWCw4tbJYfnzZ8G
 d0+MTOLQaEnz7tyRFaKxiXvTzWSDXl8YjOGYNbigIqBOlCrkVmaJxr9bdjWPoyN2+bgW
 yz4HFihFint+E5ACPR7aUJs6tr8fW7kCrhGtg1rqt67/2czpnaj6sMO0a1W0wGc81U7e
 4jMU1Zt/BhGJYkWoNlNsh4Sb3c+b3gA/GmMjimr6uZCdO8lV17BDX99kwWYVt+PBV5Ea
 hGWmc6UBmjs19wZHnYRllBQx71junPviNxMH4g1XNiAujqIMxQPhr8h2dKhttjhKXC5d
 nGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3goilOQjfvmalan6T70oSxy71Eb7b8sm1pFq3tCaMuE=;
 b=SmH06vHX2+gON7COBWAyto8Fv2p3VOs/cY97obihVV5Kdcmv5iWzfaG9HtlYoD6OTX
 DVMlh3yZDO0VL744juzHRqXr+F1DhtDkcwOKgMjjydrfvH9sw8MgArArLtEy6SjuFT9O
 H23JQWFtOXz+MP+TuHH2y+60abQurRmVlhNGysAAtRRbZzVLbBzLHfX/yIrWwBWpEYqz
 XqoFh5fi5G9e4+CevreqCMnXvAsN9hRzCHq24wiTrcA8JopJDihSvAg1DAtfHjGYXji3
 9LgrjgsHyNSzRotWjv4KE/FIysTFo+2taZ4n4rxuZtlsqLpIlO1LgIS++L3Gqo7UguKD
 5oIA==
X-Gm-Message-State: AOAM532Gwy+F+Nh5cvVS1MVX0Kl2ZauN7mbFaG5ybjkB6ma1e52e7tWv
 uZe8s/BQWv/Mi7K2btz9q7M76CWe9uTNry2HmLg=
X-Google-Smtp-Source: ABdhPJw2GiGKDIYf1rIY1lllTSYEgOj3YL6lMrCt6V7USlF65aqaEo1Y3GK64n82UuB3QstIXlXNMPO7W71OWL3x/0A=
X-Received: by 2002:a2e:9b08:: with SMTP id u8mr1851982lji.208.1598928223917; 
 Mon, 31 Aug 2020 19:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
 <20200828220520.GA3482472@bogus>
 <CADiBU3-pd7nvtf2_1ssYVLQc4HOHX6PUyyx6GiJ_gH-4DaGmog@mail.gmail.com>
 <CADiBU39P7jeSOV2_GcXh6A=b8SCViURCsS8SZFmy+oY2hS74tg@mail.gmail.com>
 <1598842698.11403.2.camel@mhfsdcap03>
In-Reply-To: <1598842698.11403.2.camel@mhfsdcap03>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 1 Sep 2020 10:43:32 +0800
Message-ID: <CADiBU39ippYd2EvFBhesOVU4CPa9C9fsiSTaB9BdnYFZjOt4_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_224345_901174_30140781 
X-CRM114-Status: GOOD (  27.87  )
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
Cc: gene_chen@richtek.com, Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjmnIgz
MeaXpSDpgLHkuIAg5LiK5Y2IMTE6MDDlr6vpgZPvvJoKPgo+IE9uIFNhdCwgMjAyMC0wOC0yOSBh
dCAxMDo0OSArMDgwMCwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKPiA+IENoaVl1YW4gSHVhbmcgPHUw
MDg0NTAwQGdtYWlsLmNvbT4g5pa8IDIwMjDlubQ45pyIMjnml6Ug6YCx5YWtIOS4iuWNiDg6MzLl
r6vpgZPvvJoKPiA+ID4KPiA+ID4gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIw
MjDlubQ45pyIMjnml6Ug6YCx5YWtIOS4iuWNiDY6MDXlr6vpgZPvvJoKPiA+ID4gPgo+ID4gPiA+
IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA2OjMwOjM2UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3Rl
Ogo+ID4gPiA+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gQWRkIGEgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24g
Zm9yIHRoZSBNVDYzNjAgVHlwZS1DIGRyaXZlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiB1c2IgdHlw
ZWM6IG10NjM2MDogUmVuYW1lIERUIGJpbmRpbmcgZG91bWVudCBmcm9tIG10NjM2MCB0byBtdDYz
NngKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9o
dWFuZ0ByaWNodGVrLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy91
c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCj4gPiA+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbAo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10
NjM2MC10Y3BjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21l
ZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiA+ID4gPiBpbmRleCAwMDAwMDAwMC4uOWU4YWIwZAo+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRp
YXRlayxtdDYzNjAtdGNwYy55YW1sCj4gPiA+ID4gPiBAQCAtMCwwICsxLDczIEBACj4gPiA+ID4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCj4gPiA+ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gPiArLS0tCj4gPiA+ID4gPiArJGlkOiAi
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlh
bWwjIgo+ID4gPiA+ID4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMiCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArdGl0bGU6IE1lZGlhdGVrIE1U
NjM2MCBUeXBlLUMgUG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIgRFQg
YmluZGluZ3MKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiA+ICsg
IC0gQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+ICsgIE1lZGlhdGVrIE1UNjM2MCBpcyBhIG11
bHRpLWZ1bmN0aW9uYWwgZGV2aWNlLiBJdCBpbnRlZ3JhdGVzIGNoYXJnZXIsIEFEQywgZmxhc2gs
IFJHQiBpbmRpY2F0b3JzLAo+ID4gPiA+ID4gKyAgcmVndWxhdG9ycyAoQlVDS3MvTERPcyksIGFu
ZCBUeXBlQyBQb3J0IFN3aXRjaCB3aXRoIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4gPiA+
ID4gPiArICBUaGlzIGRvY3VtZW50IG9ubHkgZGVzY3JpYmVzIE1UNjM2MCBUeXBlLUMgUG9ydCBT
d2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArcHJvcGVydGllczoKPiA+ID4gPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ID4gPiArICAgIGVu
dW06Cj4gPiA+ID4gPiArICAgICAgLSBtZWRpYXRlayxtdDYzNjAtdGNwYwo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gKyAgaW50ZXJydXB0cy1leHRlbmRlZDoKPiA+ID4gPgo+ID4gPiA+IFVzZSAnaW50
ZXJydXB0cycuIFRoZSB0b29saW5nIHdpbGwgYXV0b21hdGljYWxseSBzdXBwb3J0Cj4gPiA+ID4g
J2ludGVycnVwdHMtZXh0ZW5kZWQnLgo+ID4gPiBPa2F5Lgo+ID4gPiA+Cj4gPiA+ID4gPiArICAg
IG1heEl0ZW1zOiAxCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4g
PiA+ID4gPiArICAgIGl0ZW1zOgo+ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IFBEX0lSUUIKPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICtwYXR0ZXJuUHJvcGVydGllczoKPiA+ID4gPiA+ICsgICJjb25u
ZWN0b3IiOgo+ID4gPiA+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+ID4gPiA+ICsgICAgJHJlZjog
Li4vY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCMKPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRp
b246Cj4gPiA+ID4gPiArICAgICAgUHJvcGVydGllcyBmb3IgdXNiIGMgY29ubmVjdG9yLgo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gK3JlcXVpcmVkOgo+ID4gPiA+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiA+ID4g
PiArICAtIGludGVycnVwdHMtZXh0ZW5kZWQKPiA+ID4gPiA+ICsgIC0gaW50ZXJydXB0LW5hbWVz
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArZXhhbXBsZXM6Cj4gPiA+ID4gPiArICAtIHwKPiA+ID4g
PiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
Pgo+ID4gPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdXNiL3BkLmg+Cj4gPiA+ID4g
PiArICAgIGkyYzAgewo+ID4gPiA+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
PiA+ID4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgIG10NjM2MEAzNCB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDYzNjAiOwo+ID4gPiA+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDM0PjsK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICB0Y3BjIHsKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNjAtdGNwYyI7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW8yNiAzIElSUV9U
WVBFX0xFVkVMX0xPVz47Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1l
cyA9ICJQRF9JUlFCIjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgY29u
bmVjdG9yIHsKPiA+ID4gPgo+ID4gPiA+IFdoZXJlJ3MgdGhlIGRhdGEgY29ubmVjdGlvbnM/IFRo
ZSBhc3N1bXB0aW9uIG9mIHRoZSBiaW5kaW5nIGlzIHRoZSBVU0IKPiA+ID4gPiAoMiBhbmQgMykg
Y29ubmVjdGlvbnMgY29tZSBmcm9tIHRoZSBwYXJlbnQgaWYgdGhlcmUncyBubyBncmFwaCB0byB0
aGUKPiA+ID4gPiBVU0IgY29udHJvbGxlcihzKS4KPiA+ID4gTVQ2MzYwIGlzIG9ubHkgYSBzdWJw
bWljLiBUeXBlQyBwYXJ0IG9ubHkgaGFuZGxlIHRoZSBDQyBsb2dpYyB0byBzdXBwb3J0IFVTQlBE
Lgo+ID4gPiBGb3IgdGhlIHVzYiBjb25uZWN0aW9uIGxpa2UgYXMgdXNiaHMvdXNic3MsICBpdCBu
ZWVkIHRvIGJlIGhhbmRsZWQKPiA+ID4gYnkvY29ubmVjdCB0byBhcHBsaWNhdGlvbiBwcm9jZXNz
b3Igc2lkZS4KPiA+ID4gTElrZSBhcyBjb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGRlY3Jp
YmVkLCBpdCAgc3BlY2lmeSB0aGUgcG9ydAo+ID4gPiBwcm9wZXJ0eSB0byBiaW5kIFVTQiBIUy9T
Uy4KPiA+ID4KPiA+IERvIGkgbmVlZCB0byBhZGQgdGhlIHBvcnRzIGludG8gdGhlIGNvbm5lY3Rv
ciBub2RlIGZvciBleGFtcGxlPwo+ID4gTGlrZSBhcyBocy9zcy9hdXgsIHRvIG1ha2UgdGhlIHVz
ZXIga25vdyB0byB1c2UgNjM2MCdzIHRjcGM/Cj4gPgo+ID4gSSBjaGVjayB0aGUgIHN0eWxlIGlu
IGNvbm5lY3Rvci91c2ItY29ubmVjdC55YW1sCj4gPiBEbyBJIGFsc28gbmVlZCB0byByZXBsYWNl
IHR3byBzcGFjZSBpbnN0ZWFkIG9mIG9uZSB0YWIgaW4gdGhlIGJpbmRpbmcgZXhhbXBsZT8KPgo+
IHNlZSB3cml0aW5nLXNjaGVtYS5yc3QgYWJvdXQgZXhhbXBsZXM6Cj4KPiAiTm90ZTogWUFNTCBk
b2Vzbid0IGFsbG93IGxlYWRpbmcgdGFicywgc28gc3BhY2VzIG11c3QgYmUgdXNlZCBpbnN0ZWFk
LiIKClRoeC4gSSBoYXZlIGZvbGxvd2VkIGJ5IFJvYidzIGNvbW1lbnQgaW4gdGhlIHByZXZpb3Vz
IG1haWwgdG8gYWRkIHRoZQpmaXggYW5kIHNlbnQgdGhlIHBhdGNoIHY1Lgo+ID4KPiA+ID4gPgo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidXNiLWMtY29u
bmVjdG9yIjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJVU0It
QyI7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS1yb2xlID0gImR1YWwi
Owo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLXJvbGUgPSAiZHVhbCI7
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgdHJ5LXBvd2VyLXJvbGUgPSAic2lu
ayI7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlLXBkb3MgPSA8UERP
X0ZJWEVEKDUwMDAsIDEwMDAsIFBET19GSVhFRF9EVUFMX1JPTEUgfCBQRE9fRklYRURfREFUQV9T
V0FQKT47Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc2luay1wZG9zID0gPFBE
T19GSVhFRCg1MDAwLCAyMDAwLCBQRE9fRklYRURfRFVBTF9ST0xFIHwgUERPX0ZJWEVEX0RBVEFf
U1dBUCk+Owo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9wLXNpbmstbWljcm93
YXR0ID0gPDEwMDAwMDAwPjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ID4gPiA+
ICsgICAgICAgICAgICB9Owo+ID4gPiA+ID4gKyAgICAgICAgfTsKPiA+ID4gPiA+ICsgICAgfTsK
PiA+ID4gPiA+ICsuLi4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjcuNAo+ID4gPiA+ID4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
