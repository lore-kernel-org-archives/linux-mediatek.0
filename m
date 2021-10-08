Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5D761039
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE5D761039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFlbz1D9KnQkwP3mpDjYCALzoIofygiZc4orivcUHPs=; b=F9bjT3SJR/xy9O
	ZEaHq8CeP5Vr0bKUje6L9rKbEr284PJfgW2q12JagKEUR9Qumicd1IgFJB2QhY7bFRQXq1R4lgQrK
	Ze82VwaGsLJaNqy4kpKnu+IM3hcRV2nV8uCnyNZEFcLDMuCQHglZNTmPxmajr/sqFEE2pFsdFLPsn
	Z6yP+RU/HSUDNfDK7XUyvoFD698J2V9AtbeJOfKWC6wkzbK+vncdac/zZ9SL9/0jpw7fWmAcS5xCE
	xDFA2mjsML68HXAAIggXgKzWrPwWNbbxf1SKWeAXhSD3rgDYtWU1IirvhNp74TsX/72Vwe2HST5xz
	PTOK43F69R6ZVbhxzGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqtT-0035m3-Pb; Fri, 08 Oct 2021 14:30:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqtG-0035kM-L2; Fri, 08 Oct 2021 14:30:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id m22so30572415wrb.0;
 Fri, 08 Oct 2021 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xnJcxNPfIiTHc4TL8sbE9qRaCvaDY0qgDn9s/irtG9I=;
 b=JtczYzq9QTBW7C1xWLfAkfXkIoy8kUof6q2ih5L7NFgB3YICSpC1LwqJgGhSJU2TGL
 PitJ0TNadQFqmb9UCNnkn2EWUrd4+5B4h7cWcG3JegUCdzlcUqHRJ1oSXnzzRm6gcRtG
 H3Q+K8xgbEm/1fkWISueFPGTB6tL73SUqgNMGczQgspiycy+v/TqiigX3EpFKWC7gOAM
 1L/IObpyJlDIU5ZlEXPCFaO9MZz4QX0ZjCRb1RR0ARW/5Ae3qT3Tz+z+J1SJne7iJ2fU
 2hNDwYEgqIRIEzjkYrXJXXG6Wcq6KmWMJVs2jXvnsKe836F36mZgEQ5qQjyNHv9l/+kL
 yyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xnJcxNPfIiTHc4TL8sbE9qRaCvaDY0qgDn9s/irtG9I=;
 b=yTKiQC4LUd3SZMNX3tB+zYRbsxNMP6b6zly98uD7WS9XGbV5TcL16ZjVPPxcWFQrWA
 cG7s9c9543IKEM8kAWany37uI8oS5uCXticyct8Ky3wVla9H3tXYQ0Q1n1xpIqzedLcO
 PVkB10KtIVAvtrNQcWQthgO6fjqaOTLPQolLgQn5dgq1CN79qpfEesld2j6mjxFSZ/pY
 JUcHLs++QmOMgrTzKIXfm0C/0M1rGD8n/DVwz0poK5cfjQHX9yDZ5MOsikW5f0DSMCjx
 BNTqC6fBi35dv7LwGa63C9TiLo4Pv1G5iWYk4q2RZ+1mrH+9v4bs5nw1lOMIMFHl3mPS
 hoUA==
X-Gm-Message-State: AOAM530p8an+dmcnN3vL7dNP6N8Rc8DuwAQjmoIA5bUo2mtfCH2uhrZu
 clCeFOejMk3Fp/uL+ccFK+g=
X-Google-Smtp-Source: ABdhPJzizMEdrHdk4/jj3c9G0AGxpDVdap48hZ5qVfYPnSlKeHdpvGOSQZb1N0mk51VvBBQIr18MMA==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr3717901wmj.21.1633703424654; 
 Fri, 08 Oct 2021 07:30:24 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id y23sm12061566wmi.16.2021.10.08.07.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 07:30:23 -0700 (PDT)
Message-ID: <b233115c-704a-df4c-9d75-70cebb80a53c@gmail.com>
Date: Fri, 8 Oct 2021 16:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] soc: mediatek: cmdq: Use mailbox rx_callback instead of
 cmdq_task_cb
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20210915232722.10031-1-chunkuang.hu@kernel.org>
 <CAAOTY_8BZ9BgWeQVsD_01ioP8H16c1_QUb_+yniU_4Wp91Nc7A@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAAOTY_8BZ9BgWeQVsD_01ioP8H16c1_QUb_+yniU_4Wp91Nc7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_073026_717372_EE0AA85A 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIDA4LzEwLzIwMjEgMTY6MTUsIENodW4tS3VhbmcgSHUgd3JvdGU6
Cj4gSGksIE1hdHRoaWFzOgo+IAo+IFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaCBiZWNhdXNlIHRo
aXMgcGF0Y2ggZGVwZW5kIG9uIFsxXSB3aGljaCB3b3VsZAo+IGNhdXNlIG51bWVyb3VzIHdhcm5p
bmcgbWVzc2FnZS4gU28gSSB3b3VsZCByZXZlcnQgdGhhdCBwYXRjaCBpbiBbMl0uCj4gCgpUaGFu
a3MgZm9yIHRoZSBoZWFkLXVwcy4gSSdsbCBpZ25vcmUgdGhpcyBwYXRjaC4KClJlZ2FyZHMsCk1h
dHRoaWFzCgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlaz9o
PXY1LjE1LXJjNCZpZD1jMWVjNTRiN2I1YWYyNWM3NzkxOTIyNTNmNWE5ZjA1ZTk1Y2I0M2Q3Cj4g
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9w
YXRjaC8yMDIxMTAwNzIzNTMxMC4xNDYyNi02LWNodW5rdWFuZy5odUBrZXJuZWwub3JnLwo+IAo+
IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVA
a2VybmVsLm9yZz4g5pa8IDIwMjHlubQ55pyIMTbml6Ug6YCx5ZubIOS4iuWNiDc6Mjflr6vpgZPv
vJoKPj4KPj4gcnhfY2FsbGJhY2sgaXMgYSBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNrIG1lY2hh
bmlzbSBhbmQgY291bGQgY292ZXIgdGhlCj4+IGZ1bmN0aW9uIG9mIHByb3ByaWV0YXJ5IGNtZHFf
dGFza19jYiwgc28gdXNlIHRoZSBzdGFuZGFyZCBvbmUgaW5zdGVhZCBvZgo+PiB0aGUgcHJvcHJp
ZXRhcnkgb25lLiBDbGllbnQgaGFzIGNoYW5nZWQgdG8gdXNlIHRoZSBzdGFuZGFyZCBjYWxsYmFj
awo+PiBtYWNoYW5pc20gYW5kIHN5bmMgZG1hIGJ1ZmZlciBpbiBjbGllbnQgZHJpdmVyLCBzbyBy
ZW1vdmUgdGhlIHByb3ByaWV0YXJ5Cj4+IGNhbGxiYWNrIGluIGNtZHEgaGVscGVyLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPj4g
LS0tCj4+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgfCAyNSArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEuaCAgfCAgNSArLS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1jbWRxLWhlbHBlci5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVy
LmMKPj4gaW5kZXggM2M4ZTQyMTJkOTQxLi5jMTgzN2E0NjgyNjcgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4+IEBAIC00MjUsMzQgKzQyNSwxMSBAQCBpbnQg
Y21kcV9wa3RfZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3QpCj4+ICAgfQo+PiAgIEVYUE9S
VF9TWU1CT0woY21kcV9wa3RfZmluYWxpemUpOwo+Pgo+PiAtc3RhdGljIHZvaWQgY21kcV9wa3Rf
Zmx1c2hfYXN5bmNfY2Ioc3RydWN0IGNtZHFfY2JfZGF0YSBkYXRhKQo+PiAtewo+PiAtICAgICAg
IHN0cnVjdCBjbWRxX3BrdCAqcGt0ID0gKHN0cnVjdCBjbWRxX3BrdCAqKWRhdGEuZGF0YTsKPj4g
LSAgICAgICBzdHJ1Y3QgY21kcV90YXNrX2NiICpjYiA9ICZwa3QtPmNiOwo+PiAtICAgICAgIHN0
cnVjdCBjbWRxX2NsaWVudCAqY2xpZW50ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7
Cj4+IC0KPj4gLSAgICAgICBkbWFfc3luY19zaW5nbGVfZm9yX2NwdShjbGllbnQtPmNoYW4tPm1i
b3gtPmRldiwgcGt0LT5wYV9iYXNlLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBrdC0+Y21kX2J1Zl9zaXplLCBETUFfVE9fREVWSUNFKTsKPj4gLSAgICAgICBpZiAoY2ItPmNi
KSB7Cj4+IC0gICAgICAgICAgICAgICBkYXRhLmRhdGEgPSBjYi0+ZGF0YTsKPj4gLSAgICAgICAg
ICAgICAgIGNiLT5jYihkYXRhKTsKPj4gLSAgICAgICB9Cj4+IC19Cj4+IC0KPj4gLWludCBjbWRx
X3BrdF9mbHVzaF9hc3luYyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgY21kcV9hc3luY19mbHVzaF9j
YiBjYiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4+ICtpbnQgY21k
cV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QpCj4+ICAgewo+PiAgICAgICAg
ICBpbnQgZXJyOwo+PiAgICAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnQgKmNsaWVudCA9IChzdHJ1
Y3QgY21kcV9jbGllbnQgKilwa3QtPmNsOwo+Pgo+PiAtICAgICAgIHBrdC0+Y2IuY2IgPSBjYjsK
Pj4gLSAgICAgICBwa3QtPmNiLmRhdGEgPSBkYXRhOwo+PiAtICAgICAgIHBrdC0+YXN5bmNfY2Iu
Y2IgPSBjbWRxX3BrdF9mbHVzaF9hc3luY19jYjsKPj4gLSAgICAgICBwa3QtPmFzeW5jX2NiLmRh
dGEgPSBwa3Q7Cj4+IC0KPj4gLSAgICAgICBkbWFfc3luY19zaW5nbGVfZm9yX2RldmljZShjbGll
bnQtPmNoYW4tPm1ib3gtPmRldiwgcGt0LT5wYV9iYXNlLAo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBrdC0+Y21kX2J1Zl9zaXplLCBETUFfVE9fREVWSUNFKTsKPj4gLQo+
PiAgICAgICAgICBlcnIgPSBtYm94X3NlbmRfbWVzc2FnZShjbGllbnQtPmNoYW4sIHBrdCk7Cj4+
ICAgICAgICAgIGlmIChlcnIgPCAwKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oIGIvaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+PiBpbmRleCBhYzZiNWYzY2JhOTUu
LjJiNDk4ZjRmMzk0NiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
Cj4+IEBAIC0yNjgsOCArMjY4LDYgQEAgaW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBjbWRx
X3BrdCAqcGt0KTsKPj4gICAgKiBjbWRxX3BrdF9mbHVzaF9hc3luYygpIC0gdHJpZ2dlciBDTURR
IHRvIGFzeW5jaHJvbm91c2x5IGV4ZWN1dGUgdGhlIENNRFEKPj4gICAgKiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFja2V0IGFuZCBjYWxsIGJhY2sgYXQgdGhlIGVuZCBvZiBkb25lIHBhY2tl
dAo+PiAgICAqIEBwa3Q6ICAgICAgIHRoZSBDTURRIHBhY2tldAo+PiAtICogQGNiOiAgICAgICAg
ICAgICAgICBjYWxsZWQgYXQgdGhlIGVuZCBvZiBkb25lIHBhY2tldAo+PiAtICogQGRhdGE6ICAg
ICAgdGhpcyBkYXRhIHdpbGwgcGFzcyBiYWNrIHRvIGNiCj4+ICAgICoKPj4gICAgKiBSZXR1cm46
IDAgZm9yIHN1Y2Nlc3M7IGVsc2UgdGhlIGVycm9yIGNvZGUgaXMgcmV0dXJuZWQKPj4gICAgKgo+
PiBAQCAtMjc3LDcgKzI3NSw2IEBAIGludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1Y3QgY21kcV9w
a3QgKnBrdCk7Cj4+ICAgICogYXQgdGhlIGVuZCBvZiBkb25lIHBhY2tldC4gTm90ZSB0aGF0IHRo
aXMgaXMgYW4gQVNZTkMgZnVuY3Rpb24uIFdoZW4gdGhlCj4+ICAgICogZnVuY3Rpb24gcmV0dXJu
ZWQsIGl0IG1heSBvciBtYXkgbm90IGJlIGZpbmlzaGVkLgo+PiAgICAqLwo+PiAtaW50IGNtZHFf
cGt0X2ZsdXNoX2FzeW5jKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2Ni
IGNiLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSk7Cj4+ICtpbnQgY21k
cV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QpOwo+Pgo+PiAgICNlbmRpZiAv
KiBfX01US19DTURRX0hfXyAqLwo+PiAtLQo+PiAyLjI1LjEKPj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
