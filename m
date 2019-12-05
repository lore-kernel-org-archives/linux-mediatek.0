Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC2CC43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 14:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0242245C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 14:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEX3bnWK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEjy3aWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0242245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1NTnh80qECbGZbH+61O9GqQhEaZvXdh8Gf14+XjrSE=; b=jEX3bnWK+rIcPV
	Lj+hUTRlp+pyD4YVOOn49Nl68+FIljvNuVQpy7/jFZ93h/lxJt7U7ICLwb0KLMIBCnXzNXZ7Jvaw1
	SQniYHCQAzCvQDd7Z5AcIUWk24YaUQG2e8ZuSjux915Pm/GGRJb6d88QzoJU7kFWsD8u7pZrkeBlw
	/6g1a/7RQsyZQMx6OpAA0i8FG4jAo5l6vYM6eQFzuW2pac/dcwAgthnwCQYGXxO3CtxYd3+1i5jSl
	RDurmHGx1Z7AJDMzeFJRShryJUracK2HtUynReDJ33CmjXum6Qy1fQI01NToB20XTJAg5N+cyXR7c
	Zc226a156TYhH4tDr7eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icsRK-00047r-RL; Thu, 05 Dec 2019 14:49:10 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icsR9-0003yD-QZ; Thu, 05 Dec 2019 14:49:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id b137so1716689pga.6;
 Thu, 05 Dec 2019 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
 b=tEjy3aWT847idRVE/j0aVnV+HovrelpV9vx0sXBsnUpcJaSTMtuUK9EonXSlEmpgl1
 C9VryYh2cCZrCnW8vu2GEUIhS1quctAlNiL9Goa66xRuo0oShIqxqmUSmNhGAeIJPKeY
 /A3gYs7IiEIeQA4LyulxkKV9s+CaUGdgFzH+NntG0IJb9eilyvi8inTVBpLPGMehSs4w
 lehgRMa8jyYGgcqGj5AaOkBlnGaKbs6EkfVa5PiGSw9yWeIiUj8f1Ys/bthnCuqbtMi6
 vVroLppUxdUsWEDqOJWh3TBslzixAHJdllVIo9pZnzHDN0pMjuA/LYn3EKuhbYS6pzSL
 T3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zerf2jeTJ9T1+KiLBXKGAOgo3NLhscKc1xofy5L3cP8=;
 b=DaeGzxuvnm1KlVryHZuB86b/nphHgD+/J8UFofocZXz5yU8T7ac+mS1mrtekwpL2Qj
 YzO1/Y0lBD61OIac3J9Q4Szz+6Xk8xj22nLDcCEXDnmQ4I+J6kySDi/ivDOBZ7GPJ3dg
 V/pOJGppZeSVsavB+GD/lRfS6nrjAeQODs/VUB8ldC3o8GgLBR/g7CzAyf5+oP+3OnqU
 H67aprIrWfWBZxwJGDLodLOkoalACPJ7QYDweAQSgPY7HZzX3aYjUSUcV3zAqSnlS+jT
 +yn/kLwS4dcXizH/U5T/V0FCaG7ZHI3Iemzm7usq6VfOruL1JN74u6n5mIBJuYR2EWd4
 gh8w==
X-Gm-Message-State: APjAAAW4mkNerTbLZKMW389FebLA6M4MUqwz7r5SPAsQVmaCJQBVkhCh
 Ilnqa0v7O1Uej3q3cu7UUXj+bELnH7s=
X-Google-Smtp-Source: APXvYqyoEwFvj/ecUcKGhOn5iUEfeT3IoooJMwY33IQjpCOk/nMjVc0JZT4J+N3pT6rDv4VDA3+2oQ==
X-Received: by 2002:aa7:98cd:: with SMTP id e13mr9039200pfm.56.1575557338720; 
 Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id z130sm12175224pgz.6.2019.12.05.06.48.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Dec 2019 06:48:58 -0800 (PST)
Date: Thu, 5 Dec 2019 20:18:48 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/5] pinctrl: actions: Use the correct style for SPDX
 License Identifier
Message-ID: <20191205144844.GA2903@nishad>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
 <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_064859_886287_A6D69004 
X-CRM114-Status: GOOD (  21.77  )
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
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MDI6MDhQTSArMDEwMCwgQW5kcmVhcyBGw6RyYmVy
IHdyb3RlOgo+IEFtIDI3LjExLjE5IHVtIDE3OjQwIHNjaHJpZWIgTmlzaGFkIEthbWRhcjoKPiA+
IFRoaXMgcGF0Y2ggY29ycmVjdHMgdGhlIFNQRFggTGljZW5zZSBJZGVudGlmaWVyIHN0eWxlIGlu
Cj4gPiBoZWFkZXIgZmlsZSByZWxhdGVkIEFjdGlvbnMgU2VtaSBPV0wgcGluY3RybCBkcml2ZXIu
Cj4gCj4gT3dsCj4gCkkgdXNlZCB0aGUgc2FtZSBmb3JtYXQgbWVudGlvbmVkIGJlbG93LCB3aGlj
aCBhbHNvIHNheXMgT1dMLgpNZXliZSB3ZSBjYW4gY2hhbmdlIGJvdGggb2YgdGhlbSBpbiBhIHNl
cGFyYXRlIHBhdGNoLgoKPiA+IEZvciBDIGhlYWRlciBmaWxlcyBEb2N1bWVudGF0aW9uL3Byb2Nl
c3MvbGljZW5zZS1ydWxlcy5yc3QKPiA+IG1hbmRhdGVzIEMtbGlrZSBjb21tZW50cyAob3Bwb3Nl
ZCB0byBDIHNvdXJjZSBmaWxlcyB3aGVyZQo+ID4gQysrIHN0eWxlIHNob3VsZCBiZSB1c2VkKS4K
PiA+IAo+ID4gQ2hhbmdlcyBtYWRlIGJ5IHVzaW5nIGEgc2NyaXB0IHByb3ZpZGVkIGJ5IEpvZSBQ
ZXJjaGVzIGhlcmU6Cj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8yLzcvNDYuCj4gPiAK
PiA+IFN1Z2dlc3RlZC1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE5pc2hhZCBLYW1kYXIgPG5pc2hhZGthbWRhckBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5oIHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaCBiL2RyaXZlcnMv
cGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmgKPiA+IGluZGV4IGRhZTJlODM2M2ZkNS4uZmVl
ZTdhZDdlMjdlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3Ry
bC1vd2wuaAo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaAo+
ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjArCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArICovCj4gCj4gVGhp
cyBpcyBub3QgYSB1YXBpIG9yIGFzbSBoZWFkZXIsIHdoaWNoIHRoYXQgLyogKi8gcnVsZSB3YXMg
bGF0ZXIgYWRkZWQKPiBmb3IsIEkgdGhvdWdodD8KPgoKSSBtaWdodCBiZSB3cm9uZyBidXQgSSB0
aGluayBpdCBhcHBsaWVzIHRvIHRoaXMgZmlsZSB0b28gYXMgdGhlcmUgYXMgdGhlcmUgaXMgYSBT
UERYCmlkZW50aWZpZXIgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gIC8qCj4gPiAgICogT1dMIFNv
QydzIFBpbmN0cmwgZGVmaW5pdGlvbnMKPiA+ICAgKgo+IAo+IE5vdCBvYmplY3RpbmcsIGp1c3Qg
bWFraW5nIHN1cmUgd2UncmUgbm90IGJsaW5kbHkgcmVmYWN0b3JpbmcgY29kZS4KPiAKCkkgYW0g
bm90IHN1cmUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBzYXkgaGVyZSwgYnV0IHRoZSBTUERYIGlk
ZW50aWZpZXIKcmVxdWlyZXMgYW4gaW5kZXBlbmRlbnQgYmxvY2sgY29tbWVudC4gSGVuY2UgcGxh
Y2VkIHRoZSBvYm92ZSBjb2RlIGluIGEKc2VwYXJhdGUgYmxvY2sgY29tbWVudC4gRXZlcnl0aGlu
ZyBlbHNlIGlzIGFzIGl0IGlzLgoKPiBJZiBkb2luZyB0aGlzLCBJIHN1Z2dlc3QgdXBkYXRpbmcg
dG8gR1BMLTIuMC1vci1sYXRlci4KPiAKCldlIGNhbiBkbyB0aGlzIGluIGEgc2VwYXJhdGUgcGF0
Y2ggYXMgdGhpcyBwYXRjaCBvbmx5IHRhbGtzIGFib3V0CnRoZSBzdHlsZS4KCj4gUmVnYXJkcywK
PiBBbmRyZWFzCj4gCj4gLS0gCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
Cj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gR0Y6IEZlbGl4IElt
ZW5kw7ZyZmZlcgo+IEhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQoKVGhhbmtzIHZlcnkgbXVjaCBm
b3IgeW91ciB0aW1lIGFuZCByZXZpZXcuCgpSZWdhcmRzLApOaXNoYWQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
