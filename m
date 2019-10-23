Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3208DCA9EB7
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 09:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D4221E6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 09:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUT+BX5m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baqvOwE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D4221E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5k1OZhdXpcqFZPcg5Gqdw8jXMLI3QQZsxQWvH8uSIRM=; b=NUT+BX5mtnl5v6
	G/sUfN2d/Z0hWJm4PHobNTgpsaoWeFpaKzUfkItpOgJW9vRoxRPS97/dcnujzRnSTvVQjndlySTQH
	2XL4ZJ0h6+gmkyHHCW9rgegxHF0kSV/ghanCAvrui0LAyTJIKCHnC4VQpoPb21HTRSjOZXLbRImi+
	O42UOiZqSXqp8ydg8/OKpCS2QTRe1oLNPWib+hk7B8ClW9LMEKgUS3ibq7tbIg6c5qnD8DkmkkfCf
	PVlxbh9HGElM9eSQcGygCJVmRP75wrB4QjTt6zvFuVbkb/rjvkKPyK7g/Ms05LPnhlH9FB07ii+rJ
	3okn3AYzebuRKqJF7rKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iND8N-0001uL-MW; Wed, 23 Oct 2019 09:40:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iND8K-0001sS-QL
 for linux-mediatek@lists.infradead.org; Wed, 23 Oct 2019 09:40:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id v9so10026015wrq.5
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2019 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=T1vZzFViZyMkNTAaMLcRtzCAcI3MmnDKFouAR6APmLw=;
 b=baqvOwE4akmVAZoKsYSgsHLHqy6z2Ogz6Fh2kYLnw+faVDaGNCl83nolJogzWCqyP5
 W0zBf5tSZqoPFjZUkouxLd9gDLNMjFaTkSlQlE6ZdoVRV3DewMuf3jI7i1g2KDITYfCF
 BxvupF/D4ssQasSWtotBkG/uwDB68xzfxuI09jr63uOP+1B5+rbI3cweZ8Kt0keGj7RT
 WZEprvrNLFm8fCHsK1g55qBu9NKRQCGsWJP+YyKFU/1Mi+x0VGHnzgdO0pLNX9ZUTxFt
 5OlGNAMlbAEQG6gENZoOXxfQnaQzwcRwLr83wcDXelInl6p8ZeLiBdX85bjfQjEiwHUE
 KFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=T1vZzFViZyMkNTAaMLcRtzCAcI3MmnDKFouAR6APmLw=;
 b=mIYsuSqOIlD8ADwAsqfyvIp8Zd3Yh7JC8riOdgvDjyuBhqfAsYo7xNN9fBgcquF/Yx
 kne5eTCRu6GUigQpN57U+rH5ClsjqA6tBkIMMbIWNKaIXbm4l/g4j5SEJ13Vl+HPOzkz
 hNyVJfM7VmPJ7FWOKx2lDqBNJhSONBDOXu4UbQ4Q7gWNbDO8UTL2g0UX1l6L6gNKnZxN
 Dp2/AYYWCRjUE3KYgKpF2C9nlqwXGVn1l3QObWkeKEMfHoN0NCsfwdYJrIL1HieyqS/m
 acwmGGznYVLIJZiPaGqvd37sWQHO++KRdpEQYzbyRo7yjY+POqRa5Vj8kCSR5OWXmjYt
 627w==
X-Gm-Message-State: APjAAAW+vr0N0UOkYGnrnPu34nzzeSMmJBaMqhozRroXlVFlMzQKi5or
 k+dg9msklyLPLI5QIV/srC2RUg==
X-Google-Smtp-Source: APXvYqycXcyw31uAAhWTtIQ5erAv+53zHhtWrf7wMIsRejx/pwbJLyNDcoWiQ9gT5mZGlllhEUK4wg==
X-Received: by 2002:adf:978a:: with SMTP id s10mr7889652wrb.264.1571823645654; 
 Wed, 23 Oct 2019 02:40:45 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id r5sm3650011wrs.57.2019.10.23.02.40.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Oct 2019 02:40:45 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:40:43 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20191023094043.GB19477@dell>
References: <1569338741-2784-1-git-send-email-gene.chen.richtek@gmail.com>
 <20191004133324.GE18429@dell>
 <CAE+NS37bQyWknxy+bXYZqyHH_3RbhTQJc5fVd=ibjV6QMz_rew@mail.gmail.com>
 <CAE+NS37TEcfxOy97WL0kQ2u8zM9sbROaEr-1b81hX2eoqh-sfg@mail.gmail.com>
 <20191016100438.GF4365@dell>
 <CAE+NS36Pdc8zutu=GpNQkREyEu07iLF8NDMtSQcUJE3RuuT2VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36Pdc8zutu=GpNQkREyEu07iLF8NDMtSQcUJE3RuuT2VQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_024048_865494_214EDCD0 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMiBPY3QgMjAxOSwgR2VuZSBDaGVuIHdyb3RlOgoKPiAyMDE5LTEwLTE2IDE4OjA0
IEdNVCswODowMCwgTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz46Cj4gPiBPbiBUdWUs
IDE1IE9jdCAyMDE5LCBHZW5lIENoZW4gd3JvdGU6Cj4gPgo+ID4+IEhpIExlZSwKPiA+Pgo+ID4+
IHdlIGZpbmQgT0ZfTUZEX0NFTEwgaXMgbm90IGRlZmluZWQgaW4gbWZkL2NvcmUuaCwgd2hpY2gg
aXMgcmVhZHkgdG8KPiA+PiBtZXJnZSB0byBuZXh0IGtlcm5lbCB2ZXJzaW9uCj4gPj4gaHR0cHM6
Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9s
aW51eC1uZXh0LWhpc3RvcnkvKy9tYXN0ZXIvTmV4dC9tZXJnZS5sb2cKPiA+Cj4gPiBJdCdzIGhl
cmU6Cj4gPgo+ID4gTWVyZ2luZyBtZmQvZm9yLW1mZC1uZXh0ICgzOGE2ZmM2M2EzZWEgbWZkOiBk
Yjg1MDAtcHJjbXU6IEV4YW1wbGUgdXNpbmcgbmV3Cj4gPiBPRl9NRkRfQ0VMTC9NRkRfQ0VMTF9C
QVNJQyBNQUNST3MpCj4gPiAkIGdpdCBtZXJnZSBtZmQvZm9yLW1mZC1uZXh0Cj4gPiBNZXJnZSBt
YWRlIGJ5IHRoZSAncmVjdXJzaXZlJyBzdHJhdGVneS4KPiA+ICBkcml2ZXJzL21mZC9hYjg1MDAt
Y29yZS5jICAgIHwgMTM4Cj4gPiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiAgZHJpdmVycy9tZmQvZGI4NTAwLXByY211LmMgICB8ICAyMSArKystLS0tCj4g
PiAgZHJpdmVycy9tZmQvaW50ZWwtbHBzcy1wY2kuYyB8ICAyOCArKysrKystLS0KPiA+ICBkcml2
ZXJzL21mZC9pcGFxLW1pY3JvLmMgICAgIHwgICA2ICstCj4gPiAgZHJpdmVycy9tZmQvcms4MDgu
YyAgICAgICAgICB8ICAyMiArKy0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tZmQvY29yZS5oICAg
ICB8ICAyOSArKysrKysrKysgICAgICAgICAgICAgICAgPD09PT09IFtUSElTCj4gPiBPTkVdCj4g
PiAgaW5jbHVkZS9saW51eC9tZmQvcms4MDguaCAgICB8ICAgMiArLQo+ID4gIDcgZmlsZXMgY2hh
bmdlZCwgMTA1IGluc2VydGlvbnMoKyksIDE0MSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBodHRwczov
L2tlcm5lbC5nb29nbGVzb3VyY2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQtaGlzdG9yeS8rL21hc3Rlci9OZXh0L21lcmdlLmxvZyM0NDcwCj4gPgo+IAo+IEkg
dGhvdWdodCBpIG5lZWQgdG8gd2FpdCB0aGlzICJtZmQvZm9yLW1mZC1uZXh0IiBwYXRjaCBtZXJn
ZSB0byBsYXRlc3QKPiBjb2RlYmFzZSwgYnV0IHdlIGNhbid0IGFjdHVhbGx5IGdldCB0aGUgZGF0
ZSBvciB2ZXJzaW9uIChlLmcuIExpbnV4Cj4gNS40LXJjNCkgbGFuZGluZwo+IGFuZCBpIHRyeSBj
b21tYW5kICJnaXQgbWVyZ2UgbWZkL2Zvci1tZmQtbmV4dCIgd2hpY2ggYWxzbyBjYW4ndCB3b3Jr
Cj4gbWF5IGkgYXNrIGhvdyB0byBwdWxsIHRoaXMgcGF0Y2ggZm9yIHRlbXBvcmFyaWx5IGJ1aWxk
IHBhc3M/CgpSZWJhc2Ugb250byBmb3ItbWZkLW5leHQgb3IgY2hlcnJ5LXBpY2sgdGhlIGNvbW1p
dCB5b3UgbmVlZC4KClRoZSB0cmVlIGlzIGxvY2F0ZWQgaGVyZToKCiAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVlL21mZC5naXQvCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
