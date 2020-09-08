Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94738C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 01:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7FF208C7
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 01:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFA7U3Ar";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHvcacQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7FF208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rqxir8yfFxk2RU2LAFBg6DZRkTeFyOSgN8FRiYm1x8o=; b=fFA7U3ArO46XDYmoKbPIfVCc1
	XyXJx8/Ou7Mt5s0D6dVfF41yRdFrpdfK7+BcryJNZDlXm6HQ3eNBaYi2HbR9HMNdqwYMHuTd3vl64
	i0Zpr9/0LimXhmhxxWwHtVjiSPVuLT70f74I2LctTqjgUMLJrbSy+FU6aod6+hcArP8NsoSKCZ1VH
	RqmD51Gc2J+1O9Dj91eUDjFNhSfGoHw1Ypk8oF1Cw6/3z4mV2eYV3gxGTksu3NIaksfrtIedROgTr
	9DtzxknaWiprMPtGaoJ4cDFQXwRz80EHxtaxeOB0ljhbbAs2Nxvm3JvHwFDm4K1XdXleIPnytMoHt
	4LncRHAsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFSRy-0002PM-Qa; Tue, 08 Sep 2020 01:29:34 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFSRu-0002Oa-G2; Tue, 08 Sep 2020 01:29:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id u4so17049274ljd.10;
 Mon, 07 Sep 2020 18:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HiTxX/NKoyGJdegowbPqKvyW3w0ydFE9dQBnGemN7oI=;
 b=PHvcacQ2g0DZDK/I1eM3G1Qqwh5pAkG83XOJ90BNa+Ojc4BPn8sFHfKbwhVNAGiUl1
 4UgaugzoiLah1hjRTGHaY8zKKUc3kcvb8lOUqDNXVea3M9d4HnHd0yZELpQ7nXO8Iu0u
 xxXkDNzzKKJDfJ5mzoIYab2eKXXqAQ4l6mas/F08Mn0oOhVHGP5E+jSvpyUYY0F4iMy2
 jXS1BmyZ5efHN40PcRV6ph0o+k3Kl2L3C4msGsRjqATJpiAFqAapncRfEGKyicX+E36C
 Tdb986WWxh6F/invXOzjNVsgN0nW2OTnpi9a1w0s5+H1I+z5WpKKeDNAIh8bHruqb8yW
 0eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HiTxX/NKoyGJdegowbPqKvyW3w0ydFE9dQBnGemN7oI=;
 b=nZLfiJhuH1xNnCkL5z058h2mLH3S2pY6CMrTOYKvdveqDREAWjQEHdT8iq1wzYUhF7
 8F7V6AFX95oBVuUaQo6wFlytYfnDi30B4el4VpuS3nfAxjdga2xYk4ThMhgIcj1eaTFQ
 vQRSwBvHnyK50v8cif25JWNGqvxyrNNGej6j6v4A0l1XTGZKuc38ALI2dURKgtB6c+mr
 sf1JWrhI8k5k3AFjPckqzGbzTIDe7zPDcPbYoAwW7hQqPRuO81pBGairztP0e5rGvcNF
 oQccr03MzTWSJntaDKF6CYDbpq5hY0/VNycSc3rf7o9M89lhe+8eUlwCp+T5lX5rhyUn
 dNMQ==
X-Gm-Message-State: AOAM530oQOg0UTfJQHPW8ZJzsyWhfGVp9Lcl/8Dx3A/IzZh5S3hlE3YS
 YqYoQNbhxzKsSCeAB133TJ059JgHq1/9q+SpCGY=
X-Google-Smtp-Source: ABdhPJymEqz1Wr3rdJDULjk0XJZB3s6uZFOdi1SmbSmb/VT1ELtC5xg5WAbWrZvcaLSZggmo858j+QrNyh0ReYE5wRQ=
X-Received: by 2002:a2e:80d6:: with SMTP id r22mr10779753ljg.356.1599528567196; 
 Mon, 07 Sep 2020 18:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
 <1598928042-22115-2-git-send-email-u0084500@gmail.com>
In-Reply-To: <1598928042-22115-2-git-send-email-u0084500@gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 8 Sep 2020 09:29:15 +0800
Message-ID: <CADiBU3895A-tmnfLD60j4j-Y034ho8dzsgVvrSeNtQnP9Nzfjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Greg KH <gregkh@linuxfoundation.org>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_212930_563046_192EA95B 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 cy_huang <cy_huang@richtek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkuCgpjeV9odWFuZyA8dTAwODQ1MDBAZ21haWwuY29tPiDmlrwgMjAyMOW5tDnmnIgx5pelIOmA
seS6jCDkuIrljYgxMDo0MOWvq+mBk++8mgo+Cj4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVh
bmdAcmljaHRlay5jb20+Cj4KPiBBZGQgYSBkZXZpY2V0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlv
biBmb3IgdGhlIE1UNjM2MCBUeXBlLUMgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hpWXVh
biBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAgICAgICAgIHwgOTUgKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYz
NjAtdGNwYy55YW1sCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1sCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMC4uMWU4ZTFjMgo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2
MC10Y3BjLnlhbWwKPiBAQCAtMCwwICsxLDk1IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4g
KyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3VzYi9tZWRpYXRlayxtdDYzNjAt
dGNwYy55YW1sIyIKPiArJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIyIKPiArCj4gK3RpdGxlOiBNZWRpYXRlayBNVDYzNjAgVHlwZS1DIFBvcnQg
U3dpdGNoIGFuZCBQb3dlciBEZWxpdmVyeSBjb250cm9sbGVyIERUIGJpbmRpbmdzCj4gKwo+ICtt
YWludGFpbmVyczoKPiArICAtIENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+
ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBNZWRpYXRlayBNVDYzNjAgaXMgYSBtdWx0aS1mdW5j
dGlvbmFsIGRldmljZS4gSXQgaW50ZWdyYXRlcyBjaGFyZ2VyLCBBREMsIGZsYXNoLCBSR0IgaW5k
aWNhdG9ycywKPiArICByZWd1bGF0b3JzIChCVUNLcy9MRE9zKSwgYW5kIFR5cGVDIFBvcnQgU3dp
dGNoIHdpdGggUG93ZXIgRGVsaXZlcnkgY29udHJvbGxlci4KPiArICBUaGlzIGRvY3VtZW50IG9u
bHkgZGVzY3JpYmVzIE1UNjM2MCBUeXBlLUMgUG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5
IGNvbnRyb2xsZXIuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBl
bnVtOgo+ICsgICAgICAtIG1lZGlhdGVrLG10NjM2MC10Y3BjCj4gKwo+ICsgIGludGVycnVwdHM6
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4gKyAgICBpdGVt
czoKPiArICAgICAgLSBjb25zdDogUERfSVJRQgo+ICsKPiArICBjb25uZWN0b3I6Cj4gKyAgICB0
eXBlOiBvYmplY3QKPiArICAgICRyZWY6IC4uL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwj
Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgUHJvcGVydGllcyBmb3IgdXNiIGMgY29ubmVj
dG9yLgo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtyZXF1aXJlZDoK
PiArICAtIGNvbXBhdGlibGUKPiArICAtIGludGVycnVwdHMKPiArICAtIGludGVycnVwdC1uYW1l
cwo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
dXNiL3BkLmg+Cj4gKyAgICBpMmMwIHsKPiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
KyAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgbXQ2MzYwQDM0IHsKPiArICAg
ICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjM2MCI7Cj4gKyAgICAgICAgcmVnID0gPDB4
MzQ+Owo+ICsgICAgICAgIHRjcGMgewo+ICsgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDYzNjAtdGNwYyI7Cj4gKyAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZncGlv
MjYgMyBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+ICsgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0g
IlBEX0lSUUIiOwo+ICsKPiArICAgICAgICAgIGNvbm5lY3RvciB7Cj4gKyAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAidXNiLWMtY29ubmVjdG9yIjsKPiArICAgICAgICAgICAgbGFiZWwgPSAiVVNC
LUMiOwo+ICsgICAgICAgICAgICBkYXRhLXJvbGUgPSAiZHVhbCI7Cj4gKyAgICAgICAgICAgIHBv
d2VyLXJvbGUgPSAiZHVhbCI7Cj4gKyAgICAgICAgICAgIHRyeS1wb3dlci1yb2xlID0gInNpbmsi
Owo+ICsgICAgICAgICAgICBzb3VyY2UtcGRvcyA9IDxQRE9fRklYRUQoNTAwMCwgMTAwMCwgUERP
X0ZJWEVEX0RVQUxfUk9MRSB8IFBET19GSVhFRF9EQVRBX1NXQVApPjsKPiArICAgICAgICAgICAg
c2luay1wZG9zID0gPFBET19GSVhFRCg1MDAwLCAyMDAwLCBQRE9fRklYRURfRFVBTF9ST0xFIHwg
UERPX0ZJWEVEX0RBVEFfU1dBUCk+Owo+ICsgICAgICAgICAgICBvcC1zaW5rLW1pY3Jvd2F0dCA9
IDwxMDAwMDAwMD47Cj4gKwo+ICsgICAgICAgICAgICBwb3J0cyB7Cj4gKyAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
Cj4gKwo+ICsgICAgICAgICAgICAgIHBvcnRAMCB7Cj4gKyAgICAgICAgICAgICAgICByZWcgPSA8
MD47Cj4gKyAgICAgICAgICAgICAgICBlbmRwb2ludCB7Cj4gKyAgICAgICAgICAgICAgICAgIHJl
bW90ZS1lbmRwb2ludCA9IDwmdXNiX2hzPjsKPiArICAgICAgICAgICAgICAgIH07Cj4gKyAgICAg
ICAgICAgICAgfTsKPiArICAgICAgICAgICAgICBwb3J0QDEgewo+ICsgICAgICAgICAgICAgICAg
cmVnID0gPDE+Owo+ICsgICAgICAgICAgICAgICAgZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAg
ICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnVzYl9zcz47Cj4gKyAgICAgICAgICAgICAgICB9Owo+
ICsgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgcG9ydEAyIHsKPiArICAgICAgICAg
ICAgICAgIHJlZyA9IDwyPjsKPiArICAgICAgICAgICAgICAgIGVuZHBvaW50IHsKPiArICAgICAg
ICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcF9hdXg+Owo+ICsgICAgICAgICAgICAg
ICAgfTsKPiArICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICB9Owo+ICsgICAgICAgICAg
fTsKPiArICAgICAgICB9Owo+ICsgICAgICB9Owo+ICsgICAgfTsKPiArLi4uCgpBbnkgY29tbWVu
dCBhYm91dCB0aGUgdjUgZHQtYmluZGluZyBkb2N1bWVudCBjaGFuZ2U/Cj4gLS0KPiAyLjcuNAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
