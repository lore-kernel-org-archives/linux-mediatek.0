Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12809C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:54:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D287E208CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGAdwvwU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6iZdECV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D287E208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GsnucW89t4MEetGDLkOqSTAuHh8BJE/YKBBy/5gbws=; b=iGAdwvwUxLQApyGJ9T2ZWFbId
	CjUYJgaUIcRYW/K/ApoZcbkRazLNfTZDOFXkGu5AGmb+4x+sCweCP1BX90l9XpO92tOyxB12ffZ8j
	jVDjCd02UzeUTIJD4xj2nO+yS/BiVeYxRsxYz/iY7ai0v3R+jzwxBAVpk3KcL8EPmm8A4iUREfL0M
	0zOWNxhwiQSBBKes1mQu6lIa0UFIpzcEqAWEX+pndfKcMagCBCHf8i80dYR1olJh+NhrK7v2LF3jB
	IocX+7Klqr5rwwJbyNpRTZpmJ6texUGGXW8CoAunaWmvDu0Q0Gjk27U4ARpfw+nk21sLXk7EAZsU4
	avIWdXceQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBXLN-0005II-TH; Fri, 28 Aug 2020 05:54:33 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBXLK-0005HA-7P; Fri, 28 Aug 2020 05:54:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id t23so9084663ljc.3;
 Thu, 27 Aug 2020 22:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M5X//ZshFwH0KFUFC07IKRMrNcpHsYLBwYNF7u93/jc=;
 b=F6iZdECVa/kC5OREMqVO4E3qSsVlgWKNDTK8rq46y6mvBT8n0W1NYWRQqb7du7Fx9M
 yDeuyYdz9peRTfxLOYbdSOOavxmHIQ3JYtMqq9N9xSGpdEPGNePDNHLxxaW79jOPw9rW
 K+wQIWujkdKVzKm4QfKadr8CH79KcuM4+JFbt78igw+vbjzjO8rqaiGLfwDwPDhSLjUZ
 DZfZmjj5SdRzzc17r3iHwjEKCP/Hjo87fElmJj5jFSL100xIAflQklK9F92nlrEk7+KE
 EwriOUxhqRtsk0tPr+eAsnJe3TFJxj+IL/SNDq05FL9lLIa8PHYgBYx1NbI8UTVi715N
 EhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M5X//ZshFwH0KFUFC07IKRMrNcpHsYLBwYNF7u93/jc=;
 b=jJ0NtXP0zbX5FGffemM2pHcqIvrcKiqE/VQazTG+FgjK6bRMxbeIiAE7fpeFZi44aJ
 bWkVy9hwkjZ4AUVFEWxVomm10fmDFZFqx9+ara5tNx3DRuJMmUiWk2YP0T27iJj2sXWk
 K8Ij5G0b9Hl+7Czj+cE0MxCmrg0JSqwjgRed6EuPmVttQKMyOYKt/mY9Kiy/Lu9fulaE
 DbS0eSqJNDgnXb4H50hJkdzaPudkS66JopvsYJfY72d5uub09wjDobhtQATAig5rR8PM
 iVVDDt7mrnUXIzdmcrxrrrDscf5eXkMngtmK8nEwbkvfo7DxnhxLHDp7BabgBwKSQlQn
 q8xg==
X-Gm-Message-State: AOAM532kPlJxEJ5walV7bRw8kF/WocB+ZBlO+Z6FCIQRoVyg7R3SptPx
 P7rX+AzvvOH113tmOzXRahtY94YB/jY/3vEaxB0=
X-Google-Smtp-Source: ABdhPJwyIjGEyHiu5PklJExnAu2irMyZy92E3HWunXZk6nTyo4YZk5QUP6tuzmB3qWO18Rd/8O81zM+WhqbVxbAaCsI=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr96315ljn.356.1598594068735;
 Thu, 27 Aug 2020 22:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <1598527137-6915-2-git-send-email-u0084500@gmail.com>
 <20200827164131.GA86149@roeck-us.net>
In-Reply-To: <20200827164131.GA86149@roeck-us.net>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 28 Aug 2020 13:54:16 +0800
Message-ID: <CADiBU38oTZLR=EPSW=ANGZn8074FyQqb=WS5kyMvu_8_Ua=XaQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb typec: mt6360: Rename driver/Kconfig/Makefile
 from mt6360 to mt636x
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_015430_344598_1441F62F 
X-CRM114-Status: GOOD (  18.76  )
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMOW5tDjmnIgyOOaXpSDp
gLHkupQg5LiK5Y2IMTI6NDHlr6vpgZPvvJoKPgo+IE9uIFRodSwgQXVnIDI3LCAyMDIwIGF0IDA3
OjE4OjU2UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8
Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPgo+ID4gMS4gUmVuYW1lIGZpbGUgZm9ybSB0Y3BjaV9t
dDYzNjAuYyB0byB0Y3BjaV9tdDYzNnguYwo+ID4gMi4gUmVuYW1lIGludGVybmFsIGZ1bmN0aW9u
IGZyb20gbXQ2MzYwIHRvIG10NjM2eCwgZXhjZXB0IHRoZSByZWdpc3Rlcgo+ID4gZGVmaW5pdGlv
bi4KPiA+IDMuIENoYW5nZSBLY29uZmlnL01ha2VmaWxlIGZyb20gTVQ2MzYwIHRvIE1UNjM2WC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vS2NvbmZpZyAgICAgICAgfCAg
IDYgKy0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy90Y3BtL01ha2VmaWxlICAgICAgIHwgICAyICst
Cj4gPiAgZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYyB8IDIxMiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy91c2IvdHlwZWMvdGNwbS90
Y3BjaV9tdDYzNnguYyB8IDIxMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAyMTYgaW5zZXJ0aW9ucygrKSwgMjE2IGRlbGV0aW9ucygtKQo+
ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpX210NjM2
MC5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lf
bXQ2MzZ4LmMKPgo+IE1heWJlIEhlaWtraSBpcyBvayB3aXRoIHRoaXMgY2hhbmdlLCBidXQgSSBh
bSBub3QsIGZvciB0aGUgcmVhc29ucwo+IG1lbnRpb25lZCBiZWZvcmUuIFNvIEkgd29uJ3QgYXBw
cm92ZSB0aGlzIHBhdGNoLiBOb3RlIHRoYXQsIGVpdGhlcgo+IGNhc2UsIGl0IHNob3VsZCBiZSBt
ZXJnZWQgd2l0aCB0aGUgZmlyc3QgcGF0Y2guCgpZZXMsIEkgYWdyZWUgd2l0aCB5b3Ugb3Bpbmlv
bi4gdXNlIDYzNngsICB0aGUgcmFuZ2UgaXMgdG9vIGxhcmdlIGZyb20KMCB0byA5LCBpdCBtYXkg
bm90IGFsbCBiZSBjb21wYXRpYmxlLgpFdmVuIHRob3VnaCBpdCdzIGFsc28gcG9zc2libGUgdGhh
dCB0aGUgcGFydCBudW1iZXIgZG9uJ3QgaGF2ZSB0aGUKc2FtZSBmdW5jdGlvbi4KU28gSSdtIGdv
aW5nIHRvIHJlbW92ZSB0aGUgcmVuYW1lIHBhdGNoLgpEbyBJIG5lZWQgdG8gYWRkIGEgcGF0Y2gg
bmFtZWQgInJldmVydCI/IE9yIGp1c3QgcmVtb3ZlIGl0LiBJJ20gbm90CnN1cmUgd2hpY2ggd2F5
IGlzIGJldHRlci4KCkl0IHNlZW1zIHlvdSBhbGwgd2FudCB0aGUgY29kZSBjaGFuZ2UgdG8gYmUg
c3F1YXNoZWQgaW50byB0aGUgZmlyc3QKY29kZS4gQW5kIHRoZSBzZWNvbmQgb25lIGlzIHRoZSBE
VCBiaW5kaW5nLiBSaWdodD8KCgo+Cj4gR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
