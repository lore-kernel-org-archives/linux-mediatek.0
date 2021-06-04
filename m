Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12B1C07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 13:25:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C455613F1
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 13:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C455613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQfC36uv8u6Afy3r9ohy+ydAa69u+hWgtHBZ0DAu4+s=; b=ezAb/xQYmgsVEt
	wvsfsQ97OJm4Z2Mx2WtnfTiL304UOEBaSUe6vPhDUEmYaH1+sP+pLgZYD1cOo2fMK0rh6SrsLdvbd
	VSi7KHSkL9cAHeOuqwLIg2ciBiqNJqz2amA9Gxj+mUBFMWuA3vxre9NzLxUe7KyLACYl8ktgMuBhs
	f6DM8+tmRVejZQhQ87LzsCSbGNA4w7C+XZFk10DtYLoYKwr9U1AnCrutEf9VijGPgNx8Ew9ziVJhO
	Bqq/E9x6UQm6LvRGZyzNMiZ6dnxDjPCdm+j5P+6YFsS5IT5I20YKFf1QS3eyG3oOx4UUhafiecfWJ
	HyGXujfS+b6XjY5PqEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9p9-00Dk6w-3K; Fri, 04 Jun 2021 13:25:19 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9oY-00DjvC-C8
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 13:24:46 +0000
Received: by mail-wm1-f42.google.com with SMTP id f20so1153962wmg.0
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Jun 2021 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+sT4YYKrQb2O5xI5wztXIAWtyacTFced2VFE4TLIp60=;
 b=ySiUwhYzsJGSzp36XB999q1MbEQ96sQpPPHULrfsaUm/LbNGHvntoy9xwDR6LnPxFI
 aaQlYLo5tfvAVdcsrADn6mrXtmvuH1RhsIXzPpuVQ81Y34PPKUUMjxj491nxsKp/pcy8
 NrdQ6Syy/jwbcbdTdrCoZFjqcj61qpvaKhtZFcOd9wi2sOL+LpwY+SoXdtHyRliKS44L
 RjqSzzMX2GPQsCTYaH1uxRBoEDqGbHUXXwHtHcYyrEcCdA+oykyyoGlhXr5lyk2A2Hvj
 MrW+27uUG7L6hy2QSqWEG7VTQqSUi61G9XuX7+Dbr1sw5YISsiT7dD7FWd0pe/T9dEqw
 7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+sT4YYKrQb2O5xI5wztXIAWtyacTFced2VFE4TLIp60=;
 b=lYt82psKmjzfQ6QyEqS42oI2ILpqONYKXwcFC0SkQz3qOZLWWw6W08kcLJB2rsR44q
 r52l9g5puhXT1yBWD0pnvmaK5ch6z2ikjb7mJjEZUqrDaeU5sPPz1Dm8XfognRKMEuwu
 ZduXCwQ5iC2DMod8koNvcPGVKTxFco5elZyl81ZWgf0G8WcJKv+8miU0IIYFeNdU2OLE
 XjNElecvnUkJyUSgPnD6xTthwPuKsWQ22waUVVrtd00MwHR0sNeZ3v0G96IhbsnpffJk
 bbyIS8YWz5+oCWbEkSNfG2vZbUJSTd2wuuwyywgn+JQdIKeKM39hIaDbtgWMrgZ1eGdV
 +4Ag==
X-Gm-Message-State: AOAM533xAMwNL/1A4roeOl9IwHXUOszdShtYG92KbDLIZI7lJCXnTTif
 WOsewWMtbnmzWkSzMmd6G3G/fw==
X-Google-Smtp-Source: ABdhPJyIXvaJGxAIuz9G9hqzr6MEeZebOlfx+GRaCsLAzvjVFcJ2FSSUkUHrMgXxV8y2OfWOc6gC0w==
X-Received: by 2002:a1c:2805:: with SMTP id o5mr3625525wmo.103.1622813018831; 
 Fri, 04 Jun 2021 06:23:38 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id q11sm5752457wmq.1.2021.06.04.06.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 06:23:38 -0700 (PDT)
Date: Fri, 4 Jun 2021 14:23:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wendell Lin <wendell.lin@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>
Subject: Re: [PATCH 1/1] clk: Export clk_register_composite
Message-ID: <20210604132335.GK2435141@dell>
References: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
 <1597052186.27843.1.camel@mtkswgap22>
 <CAF2Aj3hZB08d8x6XOqsP4m5fv76fWH48U95j8ugLt-YWFJ-kkA@mail.gmail.com>
 <162276982204.1835121.10976600065855289763@swboyd.mtv.corp.google.com>
 <20210604082427.GE2435141@dell> <20210604082524.GF2435141@dell>
 <1622802121.26830.22.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622802121.26830.22.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_062442_475427_C826FAEE 
X-CRM114-Status: GOOD (  25.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNCBKdW4gMjAyMSwgV2VuZGVsbCBMaW4gd3JvdGU6Cgo+IE9uIEZyaSwgMjAyMS0w
Ni0wNCBhdCAwOToyNSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gRnJpLCAwNCBKdW4g
MjAyMSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gCj4gPiA+IE9uIFRodSwgMDMgSnVuIDIwMjEsIFN0
ZXBoZW4gQm95ZCB3cm90ZToKPiA+ID4gCj4gPiA+ID4gUXVvdGluZyBMZWUgSm9uZXMgKDIwMjEt
MDUtMjAgMDk6MDc6NDIpCj4gPiA+ID4gPiBPbiBNb24sIDEwIEF1ZyAyMDIwIGF0IDEwOjM2LCBX
ZW5kZWxsIExpbiA8d2VuZGVsbC5saW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gICAgIEhpIE1hdHRoaWFzIGFuZCBhbGwsCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAg
ICBHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFdoYXQgYWJvdXQgYSBub3Qtc28tZ2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaD8gIEdycnJy
Li4uIDopCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEZZSSwgdGhpcyBpcyBzdGlsbCByZXF1aXJlZCBi
eSBtb3JlIHRoYW4gb25lIHNvdXJjZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gUGxlYXNlIGhlbHAg
Z2V0IHRoaXMgb3V0IG9mIGFsbCBvZiB0aGUgdmVuZG9yIHRyZWVzIHBsZWFzZS4KPiA+ID4gPiA+
IAo+ID4gPiA+IAo+ID4gPiA+IElzIHRoZXJlIGFuIGluLWtlcm5lbCB1c2VyPwo+ID4gPiAKPiA+
ID4gSG93IGNhbiB0aGVyZSBiZT8gIEl0J3Mgbm90IGV4cG9ydGVkIHlldC4gOikKPiA+ID4gCj4g
PiA+IEhvd2V2ZXIgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBiYXJyaWVycyBmb3IgdmVuZG9ycyBy
ZXByZXNlbnRlZCBpbgo+ID4gPiBNYWlubGluZSB0byBidWlsZCB0aGVpciBkcml2ZXJzIGFzIG1v
ZHVsZXMgaWYgdGhleSBzbyB3aXNoLiAgSWYvd2hlbgo+ID4gPiB0aGV5IGRvLCB0aGlzIHdpbGwg
bmVlZCB0byBiZSBleHBvcnRlZC4KPiA+IAo+ID4gV2VuZGVsbCBMaW4sIGlzIHRoaXMgd2hhdCB5
b3Ugd2lzaCB0byBkbyB3aXRoIHRoZSBpbi1rZXJuZWwgTWVkaWFUZWsKPiA+IGRyaXZlcj8KPiA+
IAo+IFRoaXMgaXMgYmVjYXVzZSBNZWRpYXRlayBjbG9jayBkcml2ZXIgd291bGQgYmUgYnVpbHQg
YXMga2VybmVsIG1vZHVsZSwKPiBzbyBjbGtfcmVnaXN0ZXJfY29tcG9zaXRlKCkgdXNlZCBzaG91
bGQgYmUgZXhwb3J0ZWQsIHRoZW4gd2UgY291bGQgdXNlCj4gaXQuIAo+IAo+IFBsZWFzZSByZWZl
cjoKPiBbUEFUQ0ggMi8yXSBjbGs6IG1lZGlhdGVrOiBBZGQgRVhQT1JUX1NZTUJPTCBmb3Iga2Vy
bmVsIG1vZHVsZSBzdXBwb3J0IAo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzcvMS8xMjQK
PiArRVhQT1JUX1NZTUJPTChtdGtfY2xrX3JlZ2lzdGVyX2NvbXBvc2l0ZXMpOwo+IAo+IGNsa19y
ZWdpc3Rlcl9jb21wb3NpdGUoKSBpcyB1c2VkIGJ5IE1lZGlhdGVrIGNsayBrZXJuZWwgbW9kdWxl
Lgo+IEZyb20gZXhwb3J0IHN5bWJvbDogbXRrX2Nsa19yZWdpc3Rlcl9jb21wb3NpdGVzLiAKClBl
cmZlY3QuICBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKQW55dGhpbmcgZWxzZSB5b3Ug
bmVlZCBmcm9tIHVzIFN0ZXBoZW4/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBU
ZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
