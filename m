Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67646C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 00:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B66522268
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 00:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F1W9dtpj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQx/7dTf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B66522268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EXcj1U/fW1E/KkmgbgBAsgvKNX+tDUgcwe1ZMfh+WH8=; b=F1W9dtpjUI0C3Y+bMoZ2K/m03
	tWlPFMghYaFgPXDeg8m0gFyd6Z77Hw3gJIR5PHtD5wToXs8JqFTXBK0wcSpsn4r+gJqXCrPIr85Et
	QNy48A/xbGDStD+ZeOcFffz5GNTdZz3ceAONpUcYCXZpP0vUpWXYBZCBPjTdJJcnlgk006CIfP6iP
	GWF8fEijqj0FnQvXyIoYdnuK5p3A7QUyMi+YT/RxhDA0C98WvjA7ksDcE1702M7RrV2Zozjpk0Gn5
	YNkt4GGCKIp/qjbQ7XUAdty9XK21p4yfNbCG6QR6IVD9foJZaezdibHH8Hx/sj1rmqCtM9uSB7t4j
	Id8cCcHrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZNxd-0006ha-5n; Mon, 02 Nov 2020 00:44:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZNxW-0006h0-Pp; Mon, 02 Nov 2020 00:44:32 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1DE922277;
 Mon,  2 Nov 2020 00:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604277870;
 bh=KaiRQcVGa2tJ5Os4qhu+MrURan2Yqg+O/vf3Vf6r8s8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GQx/7dTfbZIc7nbb5piys34SR6dIcocJeeXnq/6g5wzMj/K3PpuW14+vOeY8VJ5FG
 oKaLG9iLzD4xpKKNwjhfxWeNAiDxuRTMalNKpajsfEXBU9uGd6azINpR+Bgcon6SKX
 M8BB9dNf8CbxP/Hu8Zf0WbRO4Z54dPS9HBt5pEOg=
Received: by mail-ej1-f49.google.com with SMTP id za3so16585085ejb.5;
 Sun, 01 Nov 2020 16:44:29 -0800 (PST)
X-Gm-Message-State: AOAM533uYYC+EHFuDwm1KwWc9JRl7wo3NHhIDTHkaXM6QQpTfcjJU5sG
 APKZ7ooDEg/DXWb37Vxlwkok6DaA/MN+sLmUsQ==
X-Google-Smtp-Source: ABdhPJwGZn1L0J2z44IZ7UtfYj6caCXaAHlZNLx7AoHZzD3yaqaIFQpMruMolz2btjWEYWDaJVAPiBvKcCD32EssBOo=
X-Received: by 2002:a17:906:3e49:: with SMTP id
 t9mr3688121eji.75.1604277868412; 
 Sun, 01 Nov 2020 16:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20201022094152.17662-1-houlong.wei@mediatek.com>
In-Reply-To: <20201022094152.17662-1-houlong.wei@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 2 Nov 2020 08:44:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95Y9Jfq3FmhVa6QG7DdTWOOuekpvQj9OuRZ6GjHnVTKQ@mail.gmail.com>
Message-ID: <CAAOTY_95Y9Jfq3FmhVa6QG7DdTWOOuekpvQj9OuRZ6GjHnVTKQ@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: fixup possible timeout issue
To: Houlong Wei <houlong.wei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_194431_067366_0BF1C417 
X-CRM114-Status: GOOD (  24.40  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Daoyuan Huang <daoyuan.huang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, CK HU <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 ginny.chen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhvdWxvbmc6CgpIb3Vsb25nIFdlaSA8aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDEw5pyIMjLml6Ug6YCx5ZubIOS4i+WNiDU6NTXlr6vpgZPvvJoKPgo+IEZpeGVzOiA1
NzZmMWI0YmM4MDIgKCJzb2M6IG1lZGlhdGVrOiBBZGQgTWVkaWF0ZWsgQ01EUSBoZWxwZXIiKQo+
Cj4gVGhlcmUgbWF5IGJlIHBvc3NpYmxlIHRpbWVvdXQgaXNzdWUgd2hlbiBsb3RzIG9mIGNtZHEg
cGFja2V0cyBhcmUKPiBmbHVzaGVkIHRvIHRoZSBzYW1lIGNtZHEgY2xpZW50LiBUaGUgbmVjZXNz
YXJ5IG1vZGlmaWNhdGlvbnMgYXJlIGFzCj4gYmVsb3cuCj4gMS5BZGp1c3QgdGhlIHRpbWVyIHRp
bWVvdXQgcGVyaW9kIGFzIGNsaWVudC0+dGltZW91dF9tcyAqIGNsaWVudC0+cGt0X2NudC4KPiAy
Lk9wdGltaXplIHRoZSB0aW1lIHRvIHN0YXJ0IHRoZSB0aW1lci4KPgo+IFNpZ25lZC1vZmYtYnk6
IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gaW5kZXggZGM2NDRjZmI2NDE5
Li4zMTE0MmMxOTM1MjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEtaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIu
Ywo+IEBAIC0zNTAsNyArMzUwLDggQEAgc3RhdGljIHZvaWQgY21kcV9wa3RfZmx1c2hfYXN5bmNf
Y2Ioc3RydWN0IGNtZHFfY2JfZGF0YSBkYXRhKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRl
bF90aW1lcigmY2xpZW50LT50aW1lcik7Cj4gICAgICAgICAgICAgICAgIGVsc2UKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBtb2RfdGltZXIoJmNsaWVudC0+dGltZXIsIGppZmZpZXMgKwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKGNsaWVudC0+
dGltZW91dF9tcykpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2Vjc190
b19qaWZmaWVzKGNsaWVudC0+dGltZW91dF9tcyAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xpZW50LT5wa3RfY250KSk7Cj4gICAgICAgICAg
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNsaWVudC0+bG9jaywgZmxhZ3MpOwo+ICAg
ICAgICAgfQo+Cj4gQEAgLTM3OSw5ICszODAsNyBAQCBpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMo
c3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5bmNfZmx1c2hfY2IgY2IsCj4KPiAgICAgICAg
IGlmIChjbGllbnQtPnRpbWVvdXRfbXMgIT0gQ01EUV9OT19USU1FT1VUKSB7Cj4gICAgICAgICAg
ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZjbGllbnQtPmxvY2ssIGZsYWdzKTsKPiAtICAgICAg
ICAgICAgICAgaWYgKGNsaWVudC0+cGt0X2NudCsrID09IDApCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgbW9kX3RpbWVyKCZjbGllbnQtPnRpbWVyLCBqaWZmaWVzICsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbXNlY3NfdG9famlmZmllcyhjbGllbnQtPnRpbWVvdXRfbXMp
KTsKPiArICAgICAgICAgICAgICAgY2xpZW50LT5wa3RfY250Kys7Cj4gICAgICAgICAgICAgICAg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNsaWVudC0+bG9jaywgZmxhZ3MpOwo+ICAgICAgICAg
fQo+Cj4gQEAgLTM5MSw2ICszOTAsMjEgQEAgaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5jKHN0cnVj
dCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+ICAgICAgICAgLyogV2Ug
Y2FuIHNlbmQgbmV4dCBwYWNrZXQgaW1tZWRpYXRlbHksIHNvIGp1c3QgY2FsbCB0eGRvbmUuICov
Cj4gICAgICAgICBtYm94X2NsaWVudF90eGRvbmUoY2xpZW50LT5jaGFuLCAwKTsKPgo+ICsgICAg
ICAgaWYgKGNsaWVudC0+dGltZW91dF9tcyAhPSBDTURRX05PX1RJTUVPVVQpIHsKPiArICAgICAg
ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmNsaWVudC0+bG9jaywgZmxhZ3MpOwo+ICsgICAg
ICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBHQ0UgSFcgbWF5YmUgZXhlY3V0ZSB0
b28gcXVpY2tseSBhbmQgdGhlIGNhbGxiYWNrIGZ1bmN0aW9uCj4gKyAgICAgICAgICAgICAgICAq
IG1heSBiZSBpbnZva2VkIGVhcmxpZXIuIElmIHRoaXMgaGFwcGVucywgcGt0X2NudCBpcyByZWR1
Y2VkCj4gKyAgICAgICAgICAgICAgICAqIGJ5IDEgaW4gY21kcV9wa3RfZmx1c2hfYXN5bmNfY2Io
KS4gVGhlIHRpbWVyIGlzIHNldCBvbmx5IGlmCj4gKyAgICAgICAgICAgICAgICAqIHBrdF9jbnQg
aXMgZ3JlYXRlciB0aGFuIDAuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAg
ICBpZiAoY2xpZW50LT5wa3RfY250ID4gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICBtb2Rf
dGltZXIoJmNsaWVudC0+dGltZXIsIGppZmZpZXMgKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKGNsaWVudC0+dGltZW91dF9tcyAqCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xpZW50LT5wa3Rf
Y250KSk7CgpJIHRoaW5rIGZvciBzb21lIGNsaWVudCwgaXQgY2FyZSBhYm91dCBleGVjdXRpb24g
dGltZSBvZiBvbmUgcGFja2V0LApidXQgc29tZSBjbGllbnQgY2FyZSBhYm91dCB0b3RhbCBleGVj
dXRpb24gdGltZSBvZiBhbGwgcGFja2V0cywgc28gd2UKc2hvdWxkIGxldCBjbGllbnQgZHJpdmVy
IGltcGxlbWVudCBpdHMgb3duIHRpbWVvdXQgaGFuZGxlciBhbmQgcmVtb3ZlCmhhbmRsZXIgaW4g
Y21kcSBoZWxwZXIgWzFdLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIwMTEwMjAwMDQzOC4yOTIyNS0xLWNodW5rdWFuZy5o
dUBrZXJuZWwub3JnLwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmNsaWVudC0+bG9jaywgZmxhZ3MpOwo+ICsgICAgICAgfQo+
ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmx1
c2hfYXN5bmMpOwo+IC0tCj4gMi4xOC4wCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
