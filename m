Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A60C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:39:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC40C22266
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCQ7CKTQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGMZ6pRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC40C22266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/uOz6PDOnMhRH7+uxtZiGfY+hz5uTdC1C4P7fqxYxvU=; b=FCQ7CKTQcOXYpeG9FeSoK53v4
	rgqnIrMbh+cLB0UMhsi6Z7rE30nZELT0nx3wzg1SFZxEahDEqNxsbFNTwovDIjTtcsT6P50H2AJM2
	l2QyxAJdMNq1L8OT7KPHIUGni+5/IoI2gGZ4rhH/bnTKWmK7RseGOYQxfHnrEdrEMaCBNOlRCCUat
	X6+Po81oee3a4bXbXCPd8CTPibTaZMJTSXa+v5k6TFv2O20Qyz115bgtU8J2SO90E9pOHu7tjYx5x
	1l8og49rFOa9BhDQFupqs8EY/YcbPUW/vuf3pCSE7tersOSyTZs1pN2Km/eJ1963fhjFJr9WNbyti
	Cn35lIixQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfKri-0004MO-RQ; Wed, 18 Nov 2020 10:39:06 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfKrd-0004L6-Dr; Wed, 18 Nov 2020 10:39:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id w145so1659202oie.9;
 Wed, 18 Nov 2020 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gdGRlc/c7mQOKpv4Mq/akqz0zWoZvuK0RDkcZAi09eo=;
 b=IGMZ6pRyo0o/6cCRapb81/ZraXlfnBtIB3IdBumayynNPbA1GI46w0gOBEPXmwjTT3
 CllYSwmZ+W2sHoeRkZd0t6VqtQ365qXMQWLv8lijZB1Q90S9modYQiVHd35BV/OEWyDK
 ET3cyfcnLVSnldIofB2QYzpBByY1cTC6f/xva1VmnbpVcGAnDnF8647z9+EVxMoFSJ+R
 UXHypvuibugqCf+zfZ0/grQgmsdWdBxSeWEqUhKt9vRx6Vz4iiz6ke/rIfJyy4X6JAGs
 Mqg6LTWhW58OC5jRPY88zUUdx/zlrgW8xFn7h1ch465BU18I++HiwOzvMG/MnUaeUGx3
 3kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gdGRlc/c7mQOKpv4Mq/akqz0zWoZvuK0RDkcZAi09eo=;
 b=EgzirLeawAANl4gQ6saLpha69aEL1fWt7qkQgq33eFNp4tMjR5RDf4CQaOUUDUTQBW
 H3lUy/axX3EZHtu/4Nh8o+Gg94HXMewkbCRCnwrUKA1eUVPwlpXCKvUy+mGoICBxWxkT
 mWvL116/zLoI5y/1HmNQFxYiu4AzKAg0gZd4ZZnSr1fequ839ElBSpUCygUt0WVE+sWH
 KonrIoOlMl3dViB8sq6mhc/rAF/n6fYg09TRryO1VW2kbQCI1M9yPwFt8L6VxYctrYd5
 ypLcral4yHo+t28+MleYZQgQwOnM0XBtgWg53i+XN3pMeSeCsG/xtdZ0J8dmy2rOhtbU
 SWrg==
X-Gm-Message-State: AOAM533Lto/dKR4jmoo6tCYbIPVpm71cruTBYoOhSyJB1gAcIuvy27JS
 MVMIENk3dNL0my5kxLNxX8zcnCxIRBhCCEnKvRg=
X-Google-Smtp-Source: ABdhPJy5LiGa3WuRLLpKjNLBb36Dr+6EOB0Jevnf/bcIxHJ5lgkE2uNPHfL3Zf6ryE031Ve66rH7MC0KSg1pCUXvr4Y=
X-Received: by 2002:aca:4783:: with SMTP id u125mr2309892oia.23.1605695939755; 
 Wed, 18 Nov 2020 02:38:59 -0800 (PST)
MIME-Version: 1.0
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
 <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
In-Reply-To: <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Wed, 18 Nov 2020 18:38:47 +0800
Message-ID: <CAE+NS345g6gokjpBn0G9uR2azA9p2ZCgujC2cM5pWmrmmwqYjA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_053901_546942_3DEB28C1 
X-CRM114-Status: GOOD (  26.50  )
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
MTHmnIgxOOaXpSDpgLHkuIkg5LiK5Y2INjoyNOWvq+mBk++8mgo+Cj4gSGkgR2VuZSwKPgo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Cj4gT24gMTEvMTcvMjAgMTE6NTUgQU0sIEdlbmUgQ2hl
biB3cm90ZToKPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4K
PiA+IEFkZCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgTEVEIHN1cHBvcnQgb24gTVQ2MzYwIFBNSUMK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4K
PiA+IC0tLQo+ID4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlh
bWwgICAgICB8IDExNCArKysrKysrKysrKysrKysrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDExNCBpbnNlcnRpb25zKCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1sCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYw
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2
MC55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMC4uODcxZGI0
ZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbAo+ID4gQEAgLTAsMCArMSwxMTQgQEAKPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
PiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogTEVEIGRy
aXZlciBmb3IgTVQ2MzYwIFBNSUMgZnJvbSBNZWRpYVRlayBJbnRlZ3JhdGVkLgo+ID4gKwo+ID4g
K21haW50YWluZXJzOgo+ID4gKyAgLSBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4K
PiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhpcyBtb2R1bGUgaXMgcGFydCBvZiB0
aGUgTVQ2MzYwIE1GRCBkZXZpY2UuCj4gPiArICBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9tdDYzNjAueWFtbAo+ID4gKyAgQWRkIE1UNjM2MCBMRUQgZHJpdmVyIGlu
Y2x1ZGUgMi1jaGFubmVsIEZsYXNoIExFRCB3aXRoIHRvcmNoL3N0cm9iZSBtb2RlLAo+ID4gKyAg
YW5kIDQtY2hhbm5lbCBSR0IgTEVEIHN1cHBvcnQgUmVnaXN0ZXIvRmxhc2gvQnJlYXRoIE1vZGUK
Pgo+IFdoYXQgYWN0dWFsbHkgaXMgdGhlIFJlZ2lzdGVyIG1vZGU/Cj4KClJlZ2lzdGVyIG1vZGUg
aXMgZXF1YWwgdG8gUy9XIG1vZGUuClJlZCBMRUQgaW5kaWNhdG9yIGljIGRlZmF1bHQgaXMgSC9X
IG1vZGUuIExFRCBlbmFibGUgd2hlbiBjaGFyZ2VyIHBsdWcgaW4uCgo+ID4gKwo+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogbWVkaWF0ZWssbXQ2MzYw
LWxlZAo+ID4gKwo+ID4gKyAgIiNhZGRyZXNzLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+
ICsKPiA+ICsgICIjc2l6ZS1jZWxscyI6Cj4gPiArICAgIGNvbnN0OiAwCj4gPiArCj4gPiArcGF0
dGVyblByb3BlcnRpZXM6Cj4gPiArICAiXmxlZEBbMC02XSQiOgo+ID4gKyAgICB0eXBlOiBvYmpl
Y3QKPiA+ICsgICAgJHJlZjogY29tbW9uLnlhbWwjCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4g
KyAgICAgIFByb3BlcnRpZXMgZm9yIGEgc2luZ2xlIExFRC4KPiA+ICsKPiA+ICsgICAgcHJvcGVy
dGllczoKPiA+ICsgICAgICByZWc6Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogSW5kZXggb2Yg
dGhlIExFRC4KPiA+ICsgICAgICAgIGVudW06Cj4gPiArICAgICAgICAgIC0gMCAjIExFRCBvdXRw
dXQgSU5ESUNBVE9SMV9SRUQKPiA+ICsgICAgICAgICAgLSAxICMgTEVEIG91dHB1dCBJTkRJQ0FU
T1IxX0dSRUVOCj4gPiArICAgICAgICAgIC0gMiAjIExFRCBvdXRwdXQgSU5ESUNBVE9SMV9CTFVF
Cj4gPiArICAgICAgICAgIC0gMyAjIExFRCBvdXRwdXQgSU5ESUNBVE9SMl9NTAo+ID4gKyAgICAg
ICAgICAtIDQgIyBMRUQgb3V0cHV0IEZMRUQxCj4gPiArICAgICAgICAgIC0gNSAjIExFRCBvdXRw
dXQgRkxFRDIKPiA+ICsgICAgICAgICAgLSA2ICMgTEVEIG91dHB1dCBNVUxUSUNPTE9SCj4gPiAr
Cj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+
ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtICIjYWRkcmVzcy1jZWxscyIKPiA+ICsgIC0gIiNz
aXplLWNlbGxzIgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+
ID4gK2V4YW1wbGVzOgo+ID4gKyAtIHwKPiA+ICsgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVk
cy9jb21tb24uaD4KPiA+ICsgICBsZWQtY29udHJvbGxlciB7Cj4gPiArICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10NjM2MC1sZWQiOwo+ID4gKyAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4gPiArICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgIGxlZEAwIHsKPiA+
ICsgICAgICAgcmVnID0gPDA+Owo+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9J
TkRJQ0FUT1I7Cj4gPiArICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9SRUQ+Owo+ID4gKyAg
ICAgICBsZWQtbWF4LW1pY3JvYW1wID0gPDI0MDAwPjsKPiA+ICsgICAgIH07Cj4gPiArICAgICBs
ZWRAMyB7Cj4gPiArICAgICAgIHJlZyA9IDwzPjsKPiA+ICsgICAgICAgZnVuY3Rpb24gPSBMRURf
RlVOQ1RJT05fSU5ESUNBVE9SOwo+ID4gKyAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfQU1C
RVI+Owo+Cj4gWW91IHNob3VsZCByZWFsbHkgaGF2ZSBoZXJlIExFRF9DT0xPUl9JRF9NT09OTElH
SFQgaWYgdGhpcyBpcwo+IGEgbW9vbmxpZ2h0IExFRC4gWW91J2xsIG5lZWQgdG8gYWRkIGl0IHRv
IGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmguCj4KPiA+ICsgICAgICAgbGVkLW1heC1taWNyb2Ft
cCA9IDwxNTAwMDA+Owo+ID4gKyAgICAgfTsKPiA+ICsgICAgIGxlZEA0IHsKPiA+ICsgICAgICAg
cmVnID0gPDQ+Owo+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9GTEFTSDsKPiA+
ICsgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX1dISVRFPjsKPiA+ICsgICAgICAgZnVuY3Rp
b24tZW51bWVyYXRvciA9IDwxPjsKPiA+ICsgICAgICAgbGVkLW1heC1taWNyb2FtcCA9IDwyMDAw
MDA+Owo+ID4gKyAgICAgICBmbGFzaC1tYXgtbWljcm9hbXAgPSA8NTAwMDAwPjsKPiA+ICsgICAg
ICAgZmxhc2gtbWF4LXRpbWVvdXQtdXMgPSA8MTAyNDAwMD47Cj4gPiArICAgICB9Owo+ID4gKyAg
ICAgbGVkQDUgewo+ID4gKyAgICAgICByZWcgPSA8NT47Cj4gPiArICAgICAgIGZ1bmN0aW9uID0g
TEVEX0ZVTkNUSU9OX0ZMQVNIOwo+ID4gKyAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfV0hJ
VEU+Owo+ID4gKyAgICAgICBmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDI+Owo+ID4gKyAgICAgICBs
ZWQtbWF4LW1pY3JvYW1wID0gPDIwMDAwMD47Cj4gPiArICAgICAgIGZsYXNoLW1heC1taWNyb2Ft
cCA9IDw1MDAwMDA+Owo+ID4gKyAgICAgICBmbGFzaC1tYXgtdGltZW91dC11cyA9IDwxMDI0MDAw
PjsKPiA+ICsgICAgIH07Cj4gPiArICAgICBsZWRANiB7Cj4gPiArICAgICAgIHJlZyA9IDw2PjsK
PiA+ICsgICAgICAgZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fSU5ESUNBVE9SOwo+ID4gKyAgICAg
ICBjb2xvciA9IDxMRURfQ09MT1JfSURfTVVMVEk+Owo+ID4gKyAgICAgICBsZWQtbWF4LW1pY3Jv
YW1wID0gPDI0MDAwPjsKPiA+ICsgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAg
ICAgICNzaXplLWNlbGxzID0gPDA+Owo+ID4gKwo+ID4gKyAgICAgICBsZWRAMSB7Cj4gPiArICAg
ICAgICAgcmVnID0gPDE+Owo+ID4gKyAgICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0lO
RElDQVRPUjsKPiA+ICsgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Owo+ID4g
KyAgICAgICB9Owo+ID4gKyAgICAgICBsZWRAMiB7Cj4gPiArICAgICAgICAgcmVnID0gPDI+Owo+
ID4gKyAgICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0lORElDQVRPUjsKPiA+ICsgICAg
ICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfQkxVRT47Cj4gPiArICAgICAgIH07Cj4gPiArICAg
ICB9Owo+Cj4gSXQgaXMgb2YgbGl0dGxlIGF2YWlsIHRvIGhhdmUgbXVsdGljb2xvciBMRUQgd2l0
aCBvbmx5IHR3byBMRURzLgo+IEkgcHJvcG9zZSBub3QgdG8gYWxsb3cgc3VjaCBzZXR1cCAtIGku
ZS4geW91IHNob3VsZCBoYXZlIGVpdGhlcgo+IG9uZSBtdWx0aWNvbG9yIExFRCBjb21wcmlzaW5n
IHRocmVlIHN1Yi1MRURzIChyZWdzOiAwLCAxLCAyKSwKPiBhbmQgd2l0aCBtYWluIGNvbG9yIHBy
b3BlcnR5IHNldCB0byBMRURfQ09MT1JfSURfUkdCLCBvciB0aHJlZSBzZXBhcmF0ZQo+IExFRHMu
Cj4KPiBFZmZlY3RpdmVseSwgeW91IHNob3VsZCBoYXZlIHR3byBzZXBhcmF0ZSBEVCBleGFtcGxl
cyBoZXJlIHRvIG1ha2UgaXQKPiBjbGVhcjogb25lIGZvciB0aGUgY2FzZSB3aXRoIHRocmVlIExF
RCBjbGFzcyBkZXZpY2VzIGFuZCBvbmUgd2l0aAo+IExFRCBtdWx0aWNvbG9yIGNsYXNzIGRldmlj
ZS4KPgoKQUNLCgo+ID4gKyAgIH07Cj4gPiArLi4uCj4gPgo+Cj4gLS0KPiBCZXN0IHJlZ2FyZHMs
Cj4gSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
