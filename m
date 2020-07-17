Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1654C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 09:36:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C9AD20717
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 09:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gS/CZhyH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVSu3R8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C9AD20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZDVF6pjkqxZI710n/r179KbHtxcvc/0su21pg+l5HE4=; b=gS/CZhyHiv8PWHaP+CDWVijyM
	Feuz/KNLfXcMbOJTYLx4kDBolID4cmSoAbGXTfxx9lrWFhvNjC6xFWcq2XwOKrud6+shOYtjm/XwF
	pC+NhCm37Cgk1dRleHpyO/wLZ+w+QT1MBDDQux/V+42nt9mYk1oobLf8Dn8UrFALIiRfQjumOfcZm
	74lWsqyqTwG+yuTYAP+XhwLAnqFegS1GbDB6t1gwesorFvJqeRskY5qH1rPxxE8lx5o59aE6zXhb5
	1jVJkNUnX3lJotAPYSPNEVJmGWF3QqjcO118Ob/f0s5U4g5KtvGvBtLWYlTaUKYL56D2/pETPyM5v
	l+qd1Japw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwMmm-0000t7-U8; Fri, 17 Jul 2020 09:36:09 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwMmi-0000r2-2J; Fri, 17 Jul 2020 09:36:04 +0000
Received: by mail-il1-x142.google.com with SMTP id q3so6796414ilt.8;
 Fri, 17 Jul 2020 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L84Tbx7w0d/FjjhoBml/6zKrkq6kkL1C9n9lSr0rc/U=;
 b=TVSu3R8vblnAn5ZK5sAEJ+9hv/lK9MiA0wmU1CwnleVCQmsnYALB/Vc/ze+H2gGMvq
 tsqiOZUVPTVdKnoIGUTLjOpeOfhUfL7TLCdBz/X5kEGhK/x8kLRjmUbhB8MwQAvgrD9v
 KsePMnmSw478OY/u1qtLCvsl1PaPI22ULkpOoE+B1SLvHJkYlQi8PGXJqPCKkFI/C86z
 BtGzQOWO+uPQ36Ne6FgLsJqymyZy5b7dUNDyJcXke3GZRjMgQ9Zlq4ywjPgQhG7WB3rv
 wMq5vlwFeACP1DTiCwbTFEEq5z8gOZPUWRVe5UAO6SWXV4MNWIhSJDd8ymhnno9M9Cpb
 rrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L84Tbx7w0d/FjjhoBml/6zKrkq6kkL1C9n9lSr0rc/U=;
 b=CiJYDZqb+fkzPvRBTLJ9gKY5dfr0frmWemwJxhgoDEBQtMn5/FqxobzIa85aO3MxzN
 4WSYgLaFw6B0jQx8r7GYuxi4SeNRo3lXmN/UdLuNK0DQZyUHN/OpONfWMfTrrU/rlNU2
 KQISircQAX06ePAKgPO5fI3MrYwPoEih6poZGWUU1rltWS1OWcxpPVf4nf9v6zmUOWi6
 nx71C9HAmzKse2RDonrhtr7AGV3n5XZns/u6JaFCg7VN7zCgExbAOEtNj0UaZYVEBLU3
 ukBS4Tc0oUWT7MgU8sDLrSm49qLL/5umMgwLbBuoreTYhvits1RwibKNGbv5PoL6xmMO
 yzbg==
X-Gm-Message-State: AOAM532YjbhGqTslp/jlFOkE6m8tiSdkO3KL+0/upcKyCco3mmzSkcAh
 odJSjXMLOYrGXxXP8sClECKaJ7dIeM4Pufj+QtY=
X-Google-Smtp-Source: ABdhPJzdRLQEWD5KEnJXho9QuzH8yzwMLhvMYZTnoeaBUtabb83DQnHYclQRjD/suTWVT1hLulwAtNpjcxQndykcoQQ=
X-Received: by 2002:a92:9f96:: with SMTP id z22mr9183788ilk.266.1594978561818; 
 Fri, 17 Jul 2020 02:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-3-git-send-email-gene.chen.richtek@gmail.com>
 <8fa489a0-7672-cbbd-ec04-32803ca69084@gmail.com>
In-Reply-To: <8fa489a0-7672-cbbd-ec04-32803ca69084@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 17 Jul 2020 17:35:50 +0800
Message-ID: <CAE+NS36ubtAVLwYxw_3ZEAHzOr_TFVNZKo+r0WCPARoukbJHzQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] mfd: mt6360: Remove handle_post_irq callback function
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_053604_135942_1E0E05A6 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjDlubQ35pyI
MTDml6Ug6YCx5LqUIOS4i+WNiDEwOjIy5a+r6YGT77yaCj4KPgo+Cj4gT24gMDcvMDcvMjAyMCAx
MjozMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5Acmlj
aHRlay5jb20+Cj4gPgo+ID4gUmVtb3ZlIGhhbmRsZV9wb3N0X2lycSB3aGljaCBpcyB1c2VkIHRv
IHJldHJpZ2dlciBpcnEuCj4gPiBTZXQgaXJxIGxldmVsIGxvdyB0cmlnZ2VyIHRvIGtlZXAgaXJx
IGFsd2F5cyBiZSBoYW5kbGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2Vu
ZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbWZkL210NjM2MC1jb3Jl
LmMgIHwgMjUgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L21m
ZC9tdDYzNjAuaCB8ICA2ICsrKy0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9t
dDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gaW5kZXggNWRmYzEz
ZS4uMmRkNTkxOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+
ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+IEBAIC0yMDgsMjQgKzIwOCwxNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9pcnEgbXQ2MzYwX2lycXNbXSA9ICB7Cj4gPiAg
ICAgICBSRUdNQVBfSVJRX1JFR19MSU5FKE1UNjM2MF9MRE83X1BHQl9FVlQsIDgpLAo+ID4gICB9
Owo+ID4KPiA+IC1zdGF0aWMgaW50IG10NjM2MF9wbXVfaGFuZGxlX3Bvc3RfaXJxKHZvaWQgKmly
cV9kcnZfZGF0YSkKPiA+IC17Cj4gPiAtICAgICBzdHJ1Y3QgbXQ2MzYwX2RhdGEgKmRhdGEgPSBp
cnFfZHJ2X2RhdGE7Cj4gPiAtCj4gPiAtICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRh
dGEtPnJlZ21hcCwKPiA+IC0gICAgICAgICAgICAgTVQ2MzYwX1BNVV9JUlFfU0VULCBNVDYzNjBf
SVJRX1JFVFJJRywgTVQ2MzYwX0lSUV9SRVRSSUcpOwo+ID4gLX0KPiA+IC0KPiA+IC1zdGF0aWMg
c3RydWN0IHJlZ21hcF9pcnFfY2hpcCBtdDYzNjBfaXJxX2NoaXAgPSB7Cj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCByZWdtYXBfaXJxX2NoaXAgbXQ2MzYwX2lycV9jaGlwID0gewo+ID4gKyAgICAg
Lm5hbWUgPSAibXQ2MzYwX2lycXMiLAo+ID4gICAgICAgLmlycXMgPSBtdDYzNjBfaXJxcywKPiA+
ICAgICAgIC5udW1faXJxcyA9IEFSUkFZX1NJWkUobXQ2MzYwX2lycXMpLAo+ID4gLSAgICAgLm51
bV9yZWdzID0gTVQ2MzYwX1BNVV9JUlFfUkVHTlVNLAo+ID4gLSAgICAgLm1hc2tfYmFzZSA9IE1U
NjM2MF9QTVVfQ0hHX01BU0sxLAo+ID4gLSAgICAgLnN0YXR1c19iYXNlID0gTVQ2MzYwX1BNVV9D
SEdfSVJRMSwKPiA+IC0gICAgIC5hY2tfYmFzZSA9IE1UNjM2MF9QTVVfQ0hHX0lSUTEsCj4gPiAr
ICAgICAubnVtX3JlZ3MgPSBNVDYzNjBfSVJRX1JFR05VTSwKPiA+ICsgICAgIC5tYXNrX2Jhc2Ug
PSBNVDYzNjBfUkVHX1BNVV9DSEdNQVNLMSwKPiA+ICsgICAgIC5zdGF0dXNfYmFzZSA9IE1UNjM2
MF9SRUdfUE1VX0NIR0lSUTEsCj4gPiArICAgICAuYWNrX2Jhc2UgPSBNVDYzNjBfUkVHX1BNVV9D
SEdJUlExLAo+Cj4gTm9uIHJlbGV2YW50IHBhdGNoZXMgZm9yIHRoZSBjb21taXQuIFBsZWFzZSBk
cm9wIHRoaXMuCj4KCkFDSwoKPiA+ICAgICAgIC5pbml0X2Fja19tYXNrZWQgPSB0cnVlLAo+ID4g
ICAgICAgLnVzZV9hY2sgPSB0cnVlLAo+ID4gLSAgICAgLmhhbmRsZV9wb3N0X2lycSA9IG10NjM2
MF9wbXVfaGFuZGxlX3Bvc3RfaXJxLAo+ID4gICB9Owo+ID4KPiA+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCByZWdtYXBfY29uZmlnIG10NjM2MF9wbXVfcmVnbWFwX2NvbmZpZyA9IHsKPiA+IEBAIC0z
MzksMTAgKzMzMSw5IEBAIHN0YXRpYyBpbnQgbXQ2MzYwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gICAgICAgfQo+
ID4KPiA+IC0gICAgIG10NjM2MF9pcnFfY2hpcC5pcnFfZHJ2X2RhdGEgPSBkYXRhOwo+ID4gICAg
ICAgcmV0ID0gZGV2bV9yZWdtYXBfYWRkX2lycV9jaGlwKCZjbGllbnQtPmRldiwgZGF0YS0+cmVn
bWFwLCBjbGllbnQtPmlycSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBJUlFGX1RSSUdHRVJfRkFMTElORywgMCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmbXQ2MzYwX2lycV9jaGlwLCAmZGF0YS0+aXJxX2RhdGEpOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfT05FU0hPVCwgMCwgJm10NjM2MF9p
cnFfY2hpcCwKPgo+ICBGcm9tIHdoYXQgSSBzZWUgSVJRRl9PTkVTSE9UIGlzIHNldCBpbXBsaWNp
dGx5IGluIHJlZ21hcF9hZGRfaXJxX2NoaXBfZndub2RlLgo+IEFjdHVhbGx5IEkgdGhpbmsgd2hh
dCB5b3Ugd2FudCB0byBhZGQgaXMgSVJRRl9UUklHR0VSX0xPVy4KPgoKQUNLLgpJIHdpbGwgbW9k
aWZ5IGFyZ3VtZW50ICJpcnFmbGFncyIgdG8gMCwgYmVjYXVzZSBpcnEgdHJpZ2dlciB0eXBlIGlz
CnNldCBieSBvZl9pcnFfZ2V0IGZ1bmN0aW9uCgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZkYXRhLT5pcnFfZGF0YSk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAg
ICAgICAgICAgICAgIGRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBSZWdtYXAg
SVJRIENoaXBcbiIpOwo+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM2MC5oIGIvaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYw
LmgKPiA+IGluZGV4IDc2MDc3ZTQuLjlmYzY3MTggMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21mZC9tdDYzNjAuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKPiA+
IEBAIC0xNzksNyArMTc5LDcgQEAgc3RydWN0IG10NjM2MF9kYXRhIHsKPiA+ICAgI2RlZmluZSBN
VDYzNjBfUE1VX1NQQVJFMiAgICAgICAgICAgICAgICAgICAoMHhBMCkKPiA+ICAgI2RlZmluZSBN
VDYzNjBfUE1VX1NQQVJFMyAgICAgICAgICAgICAgICAgICAoMHhCMCkKPiA+ICAgI2RlZmluZSBN
VDYzNjBfUE1VX1NQQVJFNCAgICAgICAgICAgICAgICAgICAoMHhDMCkKPiA+IC0jZGVmaW5lIE1U
NjM2MF9QTVVfQ0hHX0lSUTEgICAgICAgICAgICAgICAgICAoMHhEMCkKPiA+ICsjZGVmaW5lIE1U
NjM2MF9SRUdfUE1VX0NIR0lSUTEgICAgICAgICAgICAgICAgICAgICAgICgweEQwKQo+ID4gICAj
ZGVmaW5lIE1UNjM2MF9QTVVfQ0hHX0lSUTIgICAgICAgICAgICAgICAgICgweEQxKQo+ID4gICAj
ZGVmaW5lIE1UNjM2MF9QTVVfQ0hHX0lSUTMgICAgICAgICAgICAgICAgICgweEQyKQo+ID4gICAj
ZGVmaW5lIE1UNjM2MF9QTVVfQ0hHX0lSUTQgICAgICAgICAgICAgICAgICgweEQzKQo+ID4gQEAg
LTIxMSw3ICsyMTEsNyBAQCBzdHJ1Y3QgbXQ2MzYwX2RhdGEgewo+ID4gICAjZGVmaW5lIE1UNjM2
MF9QTVVfQlVDSzJfU1RBVCAgICAgICAgICAgICAgICAgICAgICAgKDB4RUQpCj4gPiAgICNkZWZp
bmUgTVQ2MzYwX1BNVV9MRE9fU1RBVDEgICAgICAgICAgICAgICAgICAgICAgICAoMHhFRSkKPiA+
ICAgI2RlZmluZSBNVDYzNjBfUE1VX0xET19TVEFUMiAgICAgICAgICAgICAgICAgICAgICAgICgw
eEVGKQo+ID4gLSNkZWZpbmUgTVQ2MzYwX1BNVV9DSEdfTUFTSzEgICAgICAgICAgICAgICAgICgw
eEYwKQo+ID4gKyNkZWZpbmUgTVQ2MzYwX1JFR19QTVVfQ0hHTUFTSzEgICAgICAgICAgICAgICAg
ICAgICAgKDB4RjApCj4gPiAgICNkZWZpbmUgTVQ2MzYwX1BNVV9DSEdfTUFTSzIgICAgICAgICAg
ICAgICAgICAgICAgICAoMHhGMSkKPiA+ICAgI2RlZmluZSBNVDYzNjBfUE1VX0NIR19NQVNLMyAg
ICAgICAgICAgICAgICAgICAgICAgICgweEYyKQo+ID4gICAjZGVmaW5lIE1UNjM2MF9QTVVfQ0hH
X01BU0s0ICAgICAgICAgICAgICAgICAgICAgICAgKDB4RjMpCj4gPiBAQCAtMjMwLDcgKzIzMCw3
IEBAIHN0cnVjdCBtdDYzNjBfZGF0YSB7Cj4gPiAgICNkZWZpbmUgTVQ2MzYwX1BNVV9NQVhSRUcg
ICAgICAgICAgICAgICAgICAgKE1UNjM2MF9QTVVfTERPX01BU0syKQo+ID4KPiA+ICAgLyogTVQ2
MzYwX1BNVV9JUlFfU0VUICovCj4gPiAtI2RlZmluZSBNVDYzNjBfUE1VX0lSUV9SRUdOVU0gICAg
ICAgIChNVDYzNjBfUE1VX0xET19JUlEyIC0gTVQ2MzYwX1BNVV9DSEdfSVJRMSArIDEpCj4KPiBO
b3QgcmVsZXZhbnQgZm9yIHRoZSBjb21taXQuIEJ1dCB3aHkgZGlkIHlvdSB1c2UgdGhpcyBzdHJh
bmdlIGNvbXB1dGF0aW9uIGluIHRoZQo+IGZpcnN0IHBsYWNlPwo+CgpJIHdhbnRlZCB0byBlbXBo
YXNpemUgaXJxIHJhbmdlIHdpdGggc3RhcnQgYW5kIGVuZCBhZGRyZXNzLgoKPiA+ICsjZGVmaW5l
IE1UNjM2MF9JUlFfUkVHTlVNICAgIDE2Cj4gPiAgICNkZWZpbmUgTVQ2MzYwX0lSUV9SRVRSSUcg
ICBCSVQoMikKPiA+Cj4gPiAgICNkZWZpbmUgQ0hJUF9WRU5fTUFTSyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoMHhGMCkKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
