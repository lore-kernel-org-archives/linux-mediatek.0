Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28792C4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 10:13:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EDE92074A
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 10:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYVYxYNU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gebb9eMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EDE92074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3YwemE0TgDKqvEYDgiKyFn+S3YllVNt2jWiFafRMkw=; b=TYVYxYNUosbDnSYveZYsXIjXP
	t8PtfM9HhmAnHM3Gy+SUxo+qJMCuNn+fslhOX2YxHigKYl+yTs3MhiScmtg1QZHuKi5LBwPymwKix
	6ZyWbH3iR9YBk04A13Tf6nDdUP0alLovh2wLU53cqizPgP3x1TOnvBIBGS7QNIcdT6t1+ABmrW+F7
	vSSpQ5/fIXumh0zxPaS029thQF/YIYtXPhuOypDUnbETPzz1i1hEoTqiA469NRWPwegjEbJF8N+NS
	pZamZQvlnDlKWkU7IV9wnEf3gcXLOLto0UqzxE5/zBofc7ie9UQRxbpG9BIbAEwyLTcTtN13E9sEm
	cYSmjjl6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNZ6Y-0004FI-Ep; Wed, 30 Sep 2020 10:12:58 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNZ6V-0004ET-BE; Wed, 30 Sep 2020 10:12:56 +0000
Received: by mail-io1-xd44.google.com with SMTP id y13so1187308iow.4;
 Wed, 30 Sep 2020 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/f1OTAWLOFyQByyjBp7gKJkQqlf7y1fR2nEKKjF+R7k=;
 b=Gebb9eMcJ5yfFkylfLya/CB5BMiRp5tp3l3JfanfE2Q5D3UuPDShghq8AzqYauqHiY
 lvCgPqczUI1NuPx6anNfKsaWsFyBC/pNXy9AwZmYhv8cLvAxvmUlTELJX909iZCe7riV
 HHVvV+ZcDn6rGzB5K9NxiPtNIwsYTh5XTZIF+TLzvXmbQBSmD/4Krgqsc2/mtdhA/Q2j
 GcHtLIgtzqEein0lGF3TP8bE+VmZTCZ9xxNieMfyN2TThaz0m7GcXximmRfjkZ4yogOh
 2IpL/XlrtKwXdZR9WB1EKjYIIgGq6eeRC1NrRvMwi0K9cDWf3vQvyJhk9zkhVeyyrusP
 Gqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/f1OTAWLOFyQByyjBp7gKJkQqlf7y1fR2nEKKjF+R7k=;
 b=lCkCthNDe/0Z3mKwUB5kNDIBxALP5iNM/9G50BYpEFhCZHPkZ4KFhyt7SwmlD7lcBn
 tzPbrAMvIJ3pSxlgqtbnT5gIJxTL7kOT4G88eDjDgBnC6loxexKImQWc5omBJ8ROVxN2
 AfGpTmWb6AVQPCitzNxMjtv6zU9WCozPF82WWgTcCz0XWBjow2czEWtRxz7y1DagKkNt
 8cWOqghvdgVkqhxYt4aoeoSpf8WTGt3fKlXBB2NIct0n6ALx1gol5CEA9RfXsZBPQOtZ
 yTE9oCMtp5wc5bJWn9KDEX8/sIQHEhrwJI5cXhUYD8O1jo8RrZdDa8H07NF3ZQzlLalz
 tJ6Q==
X-Gm-Message-State: AOAM5319lY/DD1WqggwCtaDtHfSmFxv4h3ezR2dsCmcTggn0ZM7Oe/2R
 bzsyII6/zf4nXSGV2BzP7p9SjIcNPoSCTkyuyWg=
X-Google-Smtp-Source: ABdhPJzlpDbnNL0UhpMZoIhJBBA7VIiOiuC/U8CgBNOJi1IM8RoCYebPmYNG9DDqVJacuMaeZPty304jCUrO7dWNP7c=
X-Received: by 2002:a05:6638:218d:: with SMTP id
 s13mr1298088jaj.125.1601460773363; 
 Wed, 30 Sep 2020 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200928184423.GA3041988@bogus>
 <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
In-Reply-To: <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 1 Oct 2020 18:12:39 +0800
Message-ID: <CAE+NS36tG3H=MKU1Ewo=9m36j0D6G6GhQDGDkHuGkRn7Wjrqjg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_061255_468531_EDD7E405 
X-CRM114-Status: GOOD (  25.20  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIw5bm0OeaciDMw
5pelIOmAseS4iSDkuIvljYgxMToxN+Wvq+mBk++8mgo+Cj4gUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4g5pa8IDIwMjDlubQ55pyIMjnml6Ug6YCx5LqMIOS4iuWNiDI6NDTlr6vpgZPvvJoK
PiA+Cj4gPiBPbiBXZWQsIFNlcCAyMywgMjAyMCBhdCAwODo1MDo1MVBNICswODAwLCBHZW5lIENo
ZW4gd3JvdGU6Cj4gPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+
ID4gPgo+ID4gPiBBZGQgYmluZGluZ3MgZG9jdW1lbnQgZm9yIExFRCBzdXBwb3J0IG9uIE1UNjM2
MCBQTUlDCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJp
Y2h0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
bGVkcy1tdDYzNjAueWFtbCAgICAgIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFt
bAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
ID4gaW5kZXggMDAwMDAwMC4uYTM1NmExZgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwK
PiA+ID4gQEAgLTAsMCArMSwxMDcgQEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gPiArJVlBTUwgMS4yCj4gPiA+ICst
LS0KPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbGVkcy9sZWRzLW10
NjM2MC55YW1sIwo+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsKPiA+ID4gK3RpdGxlOiBMRUQgZHJpdmVyIGZvciBNVDYz
NjAgUE1JQyBmcm9tIE1lZGlhVGVrIEludGVncmF0ZWQuCj4gPgo+ID4gV2hlcmUncyB0aGUgUE1J
QyBzY2hlbWE/IFRoaXMgZmlsZSBuZWVkcyB0byBiZSByZWZlcmVuY2VkIGZyb20gaXQgYW5kCj4g
PiB0aGF0IG1lYW5zIGl0IGFsbCBuZWVkcyB0byBiZSBvbmUgc2VyaWVzLgo+ID4KPgo+IERvIHlv
dSBtZWFucyBhcyByZWd1bGF0b3IvbWF4Nzc2NTAtcmVndWxhdG9yLnlhbWw/Cj4KPiBkZXNjcmlw
dGlvbjogfAo+ICAgVGhpcyBtb2R1bGUgaXMgcGFydCBvZiB0aGUgTUFYNzc2NTAgTUZEIGRldmlj
ZS4gRm9yIG1vcmUgZGV0YWlscwo+ICAgInNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL21heDc3NjUwLnlhbWwiCj4KCkFjY29yZGluZyB0byBqYWNlayBzdWdnZXN0aW9u
LCBJIG1lcmdlIGZsZWQwfjIgdG8gb25lIFJHQiBtdWx0aWNvbG9yCmRldmljZSBhcyBiZWxvdywK
ICAgICBsZWRAMCB7CiAgICAgICByZWcgPSA8MD47CiAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5D
VElPTl9JTkRJQ0FUT1I7CiAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfUkdCPjsKICAgICAg
IGxlZC1tYXgtbWljcm9hbXAgPSA8MjQwMDA+OwogICAgIH07CgpCdXQgSSBzZWUgbWFrZSBkdF9i
aW5kaW5nX2NoZWNrIGVycm9yLAovbWVkaWEvZ2VuZV9jaGVuL1dEL3Vwc3RyZWFtL2xpbnV4L0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLmV4YW1wbGUu
ZHQueWFtbDoKbGVkLWNvbnRyb2xsZXI6IGxlZEAwOmNvbG9yOjA6MDogOSBpcyBncmVhdGVyIHRo
YW4gdGhlIG1heGltdW0gb2YgOAoKTWF5YmUgdGhlIG1heGltdW0gY29sb3IgbmVlZCBzZXQgZnJv
bSA4IHRvIDksIHdoaWNoIGRlZmluZQpMRURfQ09MT1JfSURfUkdCIGluIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvbGVkcy9jb21tb24uaAogIGNvbG9yOgogICAgZGVzY3JpcHRpb246CiAgICAgIENvbG9y
IG9mIHRoZSBMRUQuIFVzZSBvbmUgb2YgdGhlIExFRF9DT0xPUl9JRF8qIHByZWZpeGVkIGRlZmlu
aXRpb25zIGZyb20KICAgICAgdGhlIGhlYWRlciBpbmNsdWRlL2R0LWJpbmRpbmdzL2xlZHMvY29t
bW9uLmguIElmIHRoZXJlIGlzIG5vCm1hdGNoaW5nCiAgICAgIExFRF9DT0xPUl9JRCBhdmFpbGFi
bGUsIGFkZCBhIG5ldyBvbmUuCiAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sI2RlZmluaXRp
b25zL3VpbnQzMgogICAgbWluaW11bTogMAogICAgbWF4aW11bTogOQoKPiA+ID4gKwo+ID4gPiAr
bWFpbnRhaW5lcnM6Cj4gPiA+ICsgIC0gR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+
Cj4gPiA+ICsKPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgIFRoaXMgbW9kdWxlIGlzIHBh
cnQgb2YgdGhlIE1UNjM2MCBNRkQgZGV2aWNlLgo+ID4gPiArICBBZGQgTVQ2MzYwIExFRCBkcml2
ZXIgaW5jbHVkZSAyLWNoYW5uZWwgRmxhc2ggTEVEIHdpdGggdG9yY2gvc3Ryb2JlIG1vZGUsCj4g
PiA+ICsgIGFuZCA0LWNoYW5uZWwgUkdCIExFRCBzdXBwb3J0IFJlZ2lzdGVyL0ZsYXNoL0JyZWF0
aCBNb2RlCj4gPiA+ICsKPiA+ID4gK3Byb3BlcnRpZXM6Cj4gPiA+ICsgIGNvbXBhdGlibGU6Cj4g
PiA+ICsgICAgY29uc3Q6IG1lZGlhdGVrLG10NjM2MC1sZWQKPiA+ID4gKwo+ID4gPiArICAiI2Fk
ZHJlc3MtY2VsbHMiOgo+ID4gPiArICAgIGNvbnN0OiAxCj4gPiA+ICsKPiA+ID4gKyAgIiNzaXpl
LWNlbGxzIjoKPiA+ID4gKyAgICBjb25zdDogMAo+ID4gPiArCj4gPiA+ICtwYXR0ZXJuUHJvcGVy
dGllczoKPiA+ID4gKyAgIl5sZWRAWzAtNV0kIjoKPiA+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+
ID4gKyAgICAkcmVmOiBjb21tb24ueWFtbCMKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ID4g
KyAgICAgIFByb3BlcnRpZXMgZm9yIGEgc2luZ2xlIExFRC4KPiA+ID4gKwo+ID4gPiArICAgIHBy
b3BlcnRpZXM6Cj4gPiA+ICsgICAgICByZWc6Cj4gPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBJ
bmRleCBvZiB0aGUgTEVELgo+ID4gPiArICAgICAgICBlbnVtOgo+ID4gPiArICAgICAgICAgIC0g
MCAjIExFRCBvdXRwdXQgSU5ESUNBVE9SMQo+ID4gPiArICAgICAgICAgIC0gMSAjIExFRCBvdXRw
dXQgSU5ESUNBVE9SMgo+ID4gPiArICAgICAgICAgIC0gMiAjIExFRCBvdXRwdXQgSU5ESUNBVE9S
Mwo+ID4gPiArICAgICAgICAgIC0gMyAjIExFRCBvdXRwdXQgSU5ESUNBVE9SNAo+ID4gPiArICAg
ICAgICAgIC0gNCAjIExFRCBvdXRwdXQgRkxFRDEKPiA+ID4gKyAgICAgICAgICAtIDUgIyBMRUQg
b3V0cHV0IEZMRUQyCj4gPiA+ICsKPiA+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
PiA+ID4gKwo+ID4gPiArcmVxdWlyZWQ6Cj4gPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gPiArICAt
ICIjYWRkcmVzcy1jZWxscyIKPiA+ID4gKyAgLSAiI3NpemUtY2VsbHMiCj4gPiA+ICsKPiA+ID4g
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gPiArCj4gPiA+ICtleGFtcGxlczoKPiA+
ID4gKyAtIHwKPiA+ID4gKyAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oPgo+
ID4gPiArICAgbGVkLWNvbnRyb2xsZXIgewo+ID4gPiArICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10NjM2MC1sZWQiOwo+ID4gPiArICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ID4g
KyAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ICsKPiA+ID4gKyAgICAgbGVkQDAgewo+ID4g
PiArICAgICAgIHJlZyA9IDwwPjsKPiA+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElP
Tl9JTkRJQ0FUT1I7Cj4gPiA+ICsgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX1JFRD47Cj4g
PiA+ICsgICAgICAgZGVmYXVsdC1zdGF0ZSA9ICJvZmYiOwo+ID4gPiArICAgICB9Owo+ID4gPiAr
ICAgICBsZWRAMSB7Cj4gPiA+ICsgICAgICAgcmVnID0gPDE+Owo+ID4gPiArICAgICAgIGZ1bmN0
aW9uID0gTEVEX0ZVTkNUSU9OX0lORElDQVRPUjsKPiA+ID4gKyAgICAgICBjb2xvciA9IDxMRURf
Q09MT1JfSURfR1JFRU4+Owo+ID4gPiArICAgICAgIGRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKPiA+
ID4gKyAgICAgfTsKPiA+ID4gKyAgICAgbGVkQDIgewo+ID4gPiArICAgICAgIHJlZyA9IDwyPjsK
PiA+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJQ0FUT1I7Cj4gPiA+ICsg
ICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0JMVUU+Owo+ID4gPiArICAgICAgIGRlZmF1bHQt
c3RhdGUgPSAib2ZmIjsKPiA+ID4gKyAgICAgfTsKPiA+ID4gKyAgICAgbGVkQDMgewo+ID4gPiAr
ICAgICAgIHJlZyA9IDwzPjsKPiA+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9J
TkRJQ0FUT1I7Cj4gPiA+ICsgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0FNQkVSPjsKPiA+
ID4gKyAgICAgICBkZWZhdWx0LXN0YXRlID0gIm9mZiI7Cj4gPiA+ICsgICAgIH07Cj4gPiA+ICsg
ICAgIGxlZEA0IHsKPiA+ID4gKyAgICAgICByZWcgPSA8ND47Cj4gPiA+ICsgICAgICAgZnVuY3Rp
b24gPSBMRURfRlVOQ1RJT05fRkxBU0g7Cj4gPiA+ICsgICAgICAgY29sb3IgPSA8TEVEX0NPTE9S
X0lEX1dISVRFPjsKPiA+ID4gKyAgICAgICBmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDE+Owo+ID4g
PiArICAgICAgIGRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKPiA+ID4gKyAgICAgICBsZWQtbWF4LW1p
Y3JvYW1wID0gPDIwMDAwMD47Cj4gPiA+ICsgICAgICAgZmxhc2gtbWF4LW1pY3JvYW1wID0gPDUw
MDAwMD47Cj4gPiA+ICsgICAgICAgZmxhc2gtbWF4LXRpbWVvdXQtdXMgPSA8MTAyNDAwMD47Cj4g
PiA+ICsgICAgIH07Cj4gPiA+ICsgICAgIGxlZEA1IHsKPiA+ID4gKyAgICAgICByZWcgPSA8NT47
Cj4gPiA+ICsgICAgICAgZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fRkxBU0g7Cj4gPiA+ICsgICAg
ICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX1dISVRFPjsKPiA+ID4gKyAgICAgICBmdW5jdGlvbi1l
bnVtZXJhdG9yID0gPDI+Owo+ID4gPiArICAgICAgIGRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKPiA+
ID4gKyAgICAgICBsZWQtbWF4LW1pY3JvYW1wID0gPDIwMDAwMD47Cj4gPiA+ICsgICAgICAgZmxh
c2gtbWF4LW1pY3JvYW1wID0gPDUwMDAwMD47Cj4gPiA+ICsgICAgICAgZmxhc2gtbWF4LXRpbWVv
dXQtdXMgPSA8MTAyNDAwMD47Cj4gPiA+ICsgICAgIH07Cj4gPiA+ICsgICB9Owo+ID4gPiArLi4u
Cj4gPiA+IC0tCj4gPiA+IDIuNy40Cj4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
