Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23E9C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 12:30:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ACA920767
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 12:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zwuz0yh7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWt5TTyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ACA920767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L5If6ad49czxMZIh4KEN1Y1cEfVSQREL9nh/iAeJ1gw=; b=zwuz0yh7pdpBJEhr/xJqBS7t3
	YWyLvRa26QG3EDg9HVQWiFP1yNeGqUBaxcPumCnpgprC7v8LauaYKIvZfRP1Ab+8HrRIu/s5yQq1u
	SEt34CpP06QXB8g4tUSPrQTUwhiJ6BW3i62Zk9k5HhLSbpgLvexJa7tnEAI25PFwE+h/0EvbSo2rT
	Ew86yqHIyhFrQTYk+a0BTXsfd/7LkExoPQmeeG8/8S8aMmm4rdlWbFUNjTnpRVpPzioqu3Vs69tnR
	+gO8fAfIXbq5jTSEkRSE+5fbnYvka0jeIinS05vk2m8MKInA3+sAgnTex3iC+nLHQevn+oSGr+940
	9X5DrpOYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD5Q9-0004G1-S9; Tue, 01 Sep 2020 12:29:53 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD5Q6-0004Ep-De; Tue, 01 Sep 2020 12:29:51 +0000
Received: by mail-io1-xd42.google.com with SMTP id h4so983935ioe.5;
 Tue, 01 Sep 2020 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nr3oAO1J7ou/Wa9BRVlR/mWJbOSg9zgxTm5r/RYqoxo=;
 b=CWt5TTyFycCJCtjJPv8aWy8tpmsRd8b/odwKabtR23wfFxkLqHSNKNG41TvRZHSAF1
 u1ZjDzx+V7+Un/FOxvqZNnaIwViOUFnKv8+IDkqp/amKHRaROg5FjoikQvk/UcHTvVhg
 dUeSyBvmhuMLAC3ShQr7SqvYMxG0ums6/1iPOoawhFdq/NG6mETYKZTTGbMfhWJ2HVsl
 vL60M+aBY95RET5WKuUFFrQn/ZRVslJR9zJmR+GTKcduhqny4OwwPTj/mfo5VdtNVekY
 qrFNcPKoGmd1xDeK63cX/W5BhGvWK4IGrn4jlJnqofXBtZZDh767L+P8JkPsQJup9WO1
 I3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nr3oAO1J7ou/Wa9BRVlR/mWJbOSg9zgxTm5r/RYqoxo=;
 b=QgLY/zVSGmRiBBUm2W4xS97DILPZujL10COr4imIwWHmoTseBjZqwiCt/uJfEKP2Ct
 dfwhOwoKnX+pg6TJ0QMHopfwZmjWsi7rpdRqX4JzImlBphu52mHKGO+KyRl148q2ey5g
 sUkXhEmkKL4nDsudaKsjzgRTBkN/r73KCBOLjk2mBrQQgeFMcU/oXz4VgEm2s5R0Mh0X
 UYc7CUgPn/svtQ3ScWo6p3mwHQ/svdNepXlT5Qbc9B8fygG4ax7fUDL12CNr6fM1AmKH
 T/2cuaNnFzKZZjz2qOEERGq8QmFqnNZzbAQK74ixCr8fhVFfi6VzxAkKqQbdBbCL+mBA
 N69Q==
X-Gm-Message-State: AOAM532BUuv8bHZ4iTxx9CS8HonmeOQBmRGKvxzGxHa0x/i9fOGMEwAI
 MAYSv+v9khEPi6LOZWLne4KMoEUhK5wVyk9ZqEw=
X-Google-Smtp-Source: ABdhPJyoc+ysyeuiX9W3a9XcXr6aUKFAc1uY9bosrpv8NxM0mimkeTh0YjpVyD3McAmhUwVQkjUVzsH5DCRKbbjXjLE=
X-Received: by 2002:a5e:8e0a:: with SMTP id a10mr1255594ion.200.1598963388756; 
 Tue, 01 Sep 2020 05:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
 <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
In-Reply-To: <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 1 Sep 2020 20:29:37 +0800
Message-ID: <CAE+NS36MAwNJkbNV30h=bjB6UnW8u9XuzNkDB4Nor=x63Oz3Eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_082950_460741_30FE8EBC 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Dan Murphy <dmurphy@ti.com>, Gene Chen <gene_chen@richtek.com>,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, pavel@ucw.cz,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 jacek.anaszewski@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIw5bm0OOaciDI25pel
IOmAseS4iSDkuIvljYgxMTozMOWvq+mBk++8mgo+Cj4gT24gOC8yNi8yMCA0OjM3IEFNLCBHZW5l
IENoZW4gd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL0tjb25maWcgYi9kcml2
ZXJzL2xlZHMvS2NvbmZpZwo+ID4gaW5kZXggMWMxODFkZi4uY2U5NWVhZCAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbGVkcy9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+
ID4gQEAgLTI3MSw2ICsyNzEsMTcgQEAgY29uZmlnIExFRFNfTVQ2MzIzCj4gPiAgICAgICAgIFRo
aXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3Igb24tY2hpcCBMRUQgZHJpdmVycyBmb3VuZCBv
bgo+ID4gICAgICAgICBNZWRpYXRlayBNVDYzMjMgUE1JQy4KPiA+Cj4gPiArY29uZmlnIExFRFNf
TVQ2MzYwCj4gPiArICAgICB0cmlzdGF0ZSAiTEVEIFN1cHBvcnQgZm9yIE1lZGlhdGVrIE1UNjM2
MCBQTUlDIgo+ID4gKyAgICAgZGVwZW5kcyBvbiBMRURTX0NMQVNTX0ZMQVNIICYmIE9GCj4gPiAr
ICAgICBkZXBlbmRzIG9uIFY0TDJfRkxBU0hfTEVEX0NMQVNTIHx8ICFWNEwyX0ZMQVNIX0xFRF9D
TEFTUwo+ID4gKyAgICAgZGVwZW5kcyBvbiBNRkRfTVQ2MzYwCj4gPiArICAgICBoZWxwCj4gPiAr
ICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3IgZHVhbCBGbGFzaCBMRUQgZHJp
dmVycyBmb3VuZCBvbgo+ID4gKyAgICAgICBNZWRpYXRlayBNVDYzNjAgUE1JQy4KPiA+ICsgICAg
ICAgU3VwcG9ydCBUb3JjaCBhbmQgU3Ryb2JlIG1vZGUgaW5kZXBlbmRlbnRseSBjdXJyZW50IHNv
dXJjZS4KPgo+ICAgICAgICAgICBTdXBwb3J0cyAgICAgICAgICAgICAgICAgICAgICBpbmRlcGVu
ZGVudGx5IG9mIGN1cnJlbnQgc291cmNlLgo+Cj4gSSdtIGd1ZXNzaW5nIG9uIHRoYXQgZW5kaW5n
OyBJIHdhc24ndCBzdXJlIHdoYXQgd2FzIGludGVuZGVkLCBidXQgaXQgZG9lc24ndAo+IG1ha2Ug
c2Vuc2UgYXMgcG9zdGVkLgo+Cj4KCkkgd2FudCB0byBzYXkgaXMgZmxlZDEvMiBjYW4gaW5kZXBl
bmRlbnRseSBjb250cm9sLgpGb3IgZXhhbXBsZSwgZmxlZDEgaW4gc3Ryb2JlIG1vZGUsIG9yIGZs
ZWQyIGluIHRvcmNoIG1vZGUsCm9yIGJvdGggZmxlZDEgYW5kIGZsZWQyIGluIHRvcmNoIG9yIHN0
cm9iZSBtb2RlCgo+ID4gKyAgICAgICBJbmNsdWRlIExvdy1WRiBhbmQgc2hvcnQgcHJvdGVjdGlv
bi4KPgo+ICAgICAgICAgICBJbmNsdWRlcwo+CgpBQ0sKCj4gPiArCj4gPiAgY29uZmlnIExFRFNf
UzNDMjRYWAo+ID4gICAgICAgdHJpc3RhdGUgIkxFRCBTdXBwb3J0IGZvciBTYW1zdW5nIFMzQzI0
WFggR1BJTyBMRURzIgo+ID4gICAgICAgZGVwZW5kcyBvbiBMRURTX0NMQVNTCj4KPgo+IHRoYW5r
cy4KPiAtLQo+IH5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
