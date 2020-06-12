Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA88C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 09:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6AC2081A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 09:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z7bbW9k4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1VXmpAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC6AC2081A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndvWv8Gc5G2RM77lxPJKrh3q2kkOHgxzHs9gUISfpa0=; b=Z7bbW9k4mKyhuW
	BTWLntVRqsy3JMurhzjNx5eeS7EmqtXTvhkOzt/mbWpWxr/fx/QDI028t/7pU3YISYep+sPFtK4S/
	z+MQ3jRJv50EAP63TTflNz7bISq+M0qAzdGY56K4ijfZ0y0Z1aDU9l/Oy7mlL+p8a5EynnoFEfHzq
	7kjnjz7lOm/QEvI0uwm429mRlIpu5fH9ns3hKyKJJQTyN7USHqBUq4AbDelKreQR5Uiyqo718XwGK
	GlaQH0XCPOveKwx4o6C9S/WBoAW64LGoj9JBur8NUgwgnPGE9asN8e0lm/nu66s9Q9W0VcUnhAY4g
	YShuKPmP4e0f4IQiVNQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjgPF-0007DL-0Z; Fri, 12 Jun 2020 09:55:25 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjgP4-00074E-8n; Fri, 12 Jun 2020 09:55:15 +0000
Received: by mail-io1-xd42.google.com with SMTP id t9so9574615ioj.13;
 Fri, 12 Jun 2020 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZS9PVjZ5Jb+4QYevpE16v5sDYFxNKXeLDNvqBCj9BNE=;
 b=s1VXmpArUmAQAoLjT8NM+4wAzfoVBOBj7OFVr4bOMd5d3jQZHAmVTbzlwZWXEc+Q22
 UGgHTf8/ivZwK+TP97yOPLRH6sxvC6dXkxXcMtBmbWLUGGCE2wZ2nelzPwYwIL9Ozf5a
 CXgkmnPA6heILULlzSne8Z//SDHw9gyeMx6BBVYeyAO2WYp3Xko9//FiK9Lm/klEXJ2W
 xfiXWHfkcJzRpAgOk98WlYdPfd091y2Aa3HOAr+f8cQ3Ey7poU2wk09pW64eITonIf3z
 yqzgtb5wiHco57IAmAfuAobH4I2Fz6SvNud6/xtvfc3MTmiORAB3yO7Bupp2Ckh69FZ5
 i+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZS9PVjZ5Jb+4QYevpE16v5sDYFxNKXeLDNvqBCj9BNE=;
 b=A2B/wuobeC/l8YOnlZsHkdfjDkqZrSgPlbFnW9ywSf5ByBGHpRYU6fa0AH95RHI0QF
 q6bbe68+4AKicW7Ol/hr6cD9qeYkjnwSzSbjcyk9EwnNAXbF0AZ9yOb1fl7ppmTb6ga2
 ocNKqZMGGdttmkX+RfGfo1fd8qJ7uHqddCVa8P3TkfLcD00cwupucPJtEupasPNHC44y
 1OT8vz//rilYm3wgJPAez5Xf/eQ2Ryeqe6xvccb0Elrcq6kVBzlD/ggsu6GlDyQYs9FP
 gADLdnmKZVuCUwqrc8rPSNLnnNP9eSFVkaq6foOTb+6MOmBOJ2/Th0oZGpQ9LplHK6kO
 iJkQ==
X-Gm-Message-State: AOAM531zYOHADiEpHdHzCv+SzbwbYe1RnhePo0BRC+o22BNfZP2gLxvh
 qdAr1/T8N0MHDIAUUEXgT6CkDIlIcv2ya9KeViQ=
X-Google-Smtp-Source: ABdhPJzxxVxpqjp2Aicg0ipBh3PMBt3CryWdtwrucaesiyOv/PSfKpfbrhtbLDx4y4OB80XPrypx66ART8fiaUz42IA=
X-Received: by 2002:a02:cccd:: with SMTP id k13mr7508035jaq.53.1591955712819; 
 Fri, 12 Jun 2020 02:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
 <20200608192829.GG4106@dell>
 <CAE+NS36mxw-FpQhJ4qV=_+r2CXVi_PaGaZo2m3jXAGFuOO252Q@mail.gmail.com>
 <20200609125305.GL4106@dell>
In-Reply-To: <20200609125305.GL4106@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 12 Jun 2020 17:55:02 +0800
Message-ID: <CAE+NS36b8fV2JnSEJpky+0ES3KTYmQzC0MRTfRUf8yRsJh_bpQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_025514_337292_DEB26853 
X-CRM114-Status: GOOD (  17.95  )
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
 cy_huang@richtek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ25pyIOeaXpSDpgLHk
uowg5LiL5Y2IODo1M+Wvq+mBk++8mgo+Cj4gT24gVHVlLCAwOSBKdW4gMjAyMCwgR2VuZSBDaGVu
IHdyb3RlOgo+Cj4gPiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5
tDbmnIg55pelIOmAseS6jCDkuIrljYgzOjI45a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIE1vbiwg
MDggSnVuIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+ID4KPiA+ID4gPiBGcm9tOiBHZW5lIENo
ZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPgo+ID4gPiA+IGFjY2lkZW50YWxseSBy
ZW1vdmUgZHJpdmVyIG5hbWUgd2hlbgo+ID4gPiA+IHJlcGxhY2UgcHJvYmUgYnkgcHJvYmVfbmV3
IGluIGFkZCBtdDYzNjAgbWZkIGRyaXZlciBwYXRjaCB2NAo+ID4gPiA+Cj4gPiA+ID4gWyAgMTIx
LjI0MzAxMl0gRUFYOiBjMmE4YmM2NCBFQlg6IDAwMDAwMDAwIEVDWDogMDAwMDAwMDAgRURYOiAw
MDAwMDAwMAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdIEVTSTogYzJhOGJjNzkgRURJOiAwMDAwMDAw
MCBFQlA6IGU1NGJkZWE4IEVTUDogZTU0YmRlYTAKPiA+ID4gPiBbICAxMjEuMjQzMDEyXSBEUzog
MDA3YiBFUzogMDA3YiBGUzogMDAwMCBHUzogMDAwMCBTUzogMDA2OCBFRkxBR1M6IDAwMDEwMjg2
Cj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gQ1IwOiA4MDA1MDAzMyBDUjI6IDAwMDAwMDAwIENSMzog
MDJlYzMwMDAgQ1I0OiAwMDAwMDZiMAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdIENhbGwgVHJhY2U6
Cj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGtzZXRfZmluZF9vYmorMHgzZC8weGMwCj4gPiA+ID4g
WyAgMTIxLjI0MzAxMl0gIGRyaXZlcl9maW5kKzB4MTYvMHg0MAo+ID4gPiA+IFsgIDEyMS4yNDMw
MTJdICBkcml2ZXJfcmVnaXN0ZXIrMHg0OS8weDEwMAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/
IGkyY19mb3JfZWFjaF9kZXYrMHgzOS8weDUwCj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gX19w
cm9jZXNzX25ld19hZGFwdGVyKzB4MjAvMHgyMAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IGNo
dF93Y19kcml2ZXJfaW5pdCsweDExLzB4MTEKPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgaTJjX3Jl
Z2lzdGVyX2RyaXZlcisweDMwLzB4ODAKPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgPyBpbnRlbF9s
cHNzX3BjaV9kcml2ZXJfaW5pdCsweDE2LzB4MTYKPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgbXQ2
MzYwX3BtdV9kcml2ZXJfaW5pdCsweGYvMHgxMQo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICBkb19v
bmVfaW5pdGNhbGwrMHgzMy8weDFhMAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IHBhcnNlX2Fy
Z3MrMHgxZWIvMHgzZDAKPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgPyBfX21pZ2h0X3NsZWVwKzB4
MzEvMHg5MAo+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4
MTBhLzB4MTdmCj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4
MTJjLzB4MTdmCj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gcmVzdF9pbml0KzB4MTEwLzB4MTEw
Cj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGtlcm5lbF9pbml0KzB4Yi8weDEwMAo+ID4gPiA+IFsg
IDEyMS4yNDMwMTJdICA/IHNjaGVkdWxlX3RhaWxfd3JhcHBlcisweDkvMHhjCj4gPiA+ID4gWyAg
MTIxLjI0MzAxMl0gIHJldF9mcm9tX2ZvcmsrMHgxOS8weDI0Cj4gPiA+ID4gWyAgMTIxLjI0MzAx
Ml0gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gQ1IyOiAwMDAwMDAw
MDAwMDAwMDAwCj4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gcmFuZG9tOiBnZXRfcmFuZG9tX2J5dGVz
IGNhbGxlZCBmcm9tIGluaXRfb29wc19pZCsweDNhLzB4NDAgd2l0aCBjcm5nX2luaXQ9MAo+ID4g
PiA+IFsgIDEyMS4yNDMwMTJdIC0tLVsgZW5kIHRyYWNlIDM4YTgwMzQwMGYxYTJiZWUgXS0tLQo+
ID4gPiA+IFsgIDEyMS4yNDMwMTJdIEVJUDogc3RyY21wKzB4MTEvMHgzMAo+ID4gPgo+ID4gPiBI
b3cgZGlkIHRoaXMgZHJpdmVyIGV2ZXIgd29yayBmb3IgeW91Pwo+ID4KPiA+IGkgYXNrIG15IGNv
d29ya2VyIGhlbHAgbWUgdmVyaWZ5Lgo+ID4gaSB3aWxsIGNoZWNrIHRoZSBwYXRjaCBteXNlbGYs
IHNpbmNlcmVseSBhcG9sb2dpZXMgZm9yIHRoaXMuCj4KPiBXaGF0IGRvZXMgdGhpcyBtZWFuPwo+
Cj4gQXJlIHlvdSBzYXlpbmcgdGhhdCBmb3IgYWxsIDEwIHZlcnNpb25zIG9mIHRoaXMgcGF0Y2gg
c3VibWlzc2lvbiwgaXQKPiBoYXMgbmV2ZXIgYmVlbiB0ZXN0ZWQ/ICBBbmQgZGVzcGl0ZSBiZWlu
ZyBhdXRob3JlZCBieSB5b3UgYW5kCj4gc3VibWl0dGVkIGJ5IHlvdSwgeW91IGhhdmUgbmV2ZXIg
YWN0dWFsbHkgYm9vdCB0ZXN0ZWQgdGhlIGRyaXZlcgo+IHlvdXJzZWxmPyAgUmVseWluZyBpbnN0
ZWFkIG9uIHlvdXIgY28td29ya2VyIHRvIGNvbmR1Y3QgdGhlIHRlc3RpbmcsCj4gd2hvIGZhaWxl
ZCB0byBkbyBzby4gIElzIHRoYXQgcmVhbGx5IGNvcnJlY3Q/Cj4KCk9uIGNhcmVmdWxseSByZWFk
aW5nIHRvIHRoZSBkb2N1bWVudCBob3cgdG8gdXBzdHJlYW0sIEkgZmluZCB0aGF0IEkKaGFkIGZ1
bGwgZHV0eSBmb3IgdmVyaWZ5IHBhdGNoIGkgc2VudC4KVGhlIGZhdWx0IGlzIGVudGlyZWx5IG1p
bmUgYW5kIEkgZGVlcGx5IHJlZ3JldCB0aGF0IGl0IHNob3VsZCBoYXZlIG9jY3VycmVkLgpJIHdp
bGwgYWx3YXlzIHZlcmlmeSBwYXRjaCBieSBtZXNlbGYgYmVmb3JlIHNlbmRpbmcgaXQuCkkgaGF2
ZSBhbHJlYWR5IHZlcmZpZWQgc3ViLWRldmljZSBhZGMvbGVkL3JlZ3VsYXRvciBkb25lIGluIE1l
ZGlhdGVrCnBob25lIGFuZCBIaWtleTk2MCBkZXZlbG9wbWVudCBib2FyZAoKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiAtLS0K
PiA+ID4gPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8IDEgKwo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+
IGluZGV4IGRiOGNkZjUuLmU5Y2FjYzIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZmQv
bXQ2MzYwLWNvcmUuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+
ID4gPiBAQCAtNDEyLDYgKzQxMiw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10NjM2MF9w
bXVfb2ZfaWQpOwo+ID4gPiA+Cj4gPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBtdDYz
NjBfcG11X2RyaXZlciA9IHsKPiA+ID4gPiAgICAgICAuZHJpdmVyID0gewo+ID4gPiA+ICsgICAg
ICAgICAgICAgLm5hbWUgPSAibXQ2MzYwX3BtdSIsCj4gPiA+ID4gICAgICAgICAgICAgICAucG0g
PSAmbXQ2MzYwX3BtdV9wbV9vcHMsCj4gPiA+ID4gICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFi
bGUgPSBvZl9tYXRjaF9wdHIobXQ2MzYwX3BtdV9vZl9pZCksCj4gPiA+ID4gICAgICAgfSwKPiA+
ID4KPgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
