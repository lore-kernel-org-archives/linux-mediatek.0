Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71396C33C9B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 11:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4421C2077B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 11:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnSs9yKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4421C2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFLQRVRzuSIF8i8cv+26ADa4w1vEvJTe6j6yM/StWOA=; b=XnSs9yKVpi+LiA
	3IOo0Ali20pykSLdzeM8JZPRr2eA7qAucrla067nOuoyO/gvXuxKyrRxkJM9Eqjz0AzD4Fo24kFRw
	oX3hLr7dKh7ETQgEarpoeUqBSmIW4auAYE2zarnurhUiihccR1QnMw+Mfgtkp/NymUilvAmbedfHL
	vQ0IJydG5E5q/wn1WFdM2Foivfg5+LZYcpPpns/2sLXtBPmAjxllAW3hHszb4RXAs+cfh8rfYcoZl
	9WxF6koa9ejwb+6QjbevcdXiV21VjylKvbYsiSS96g2YiXaQzMeu3gW3u9QH5fgPA+ypkomOz053a
	LoT/tb69XK+VGSipFYNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ionRV-0007AQ-Fh; Tue, 07 Jan 2020 11:54:37 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ionRS-00079j-AM; Tue, 07 Jan 2020 11:54:36 +0000
Received: by mail-ed1-f67.google.com with SMTP id dc19so50085905edb.10;
 Tue, 07 Jan 2020 03:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/Gn0sKgSVl88I9a03JnH76quh+NEJOSZxLuBtN1E4nM=;
 b=XOtvi0rQH+8Hdy3gr7K0bqX+yNcm+Z45k+3g55aVJqH1N10rAAcv4wDZlp12GzKgv+
 yuxzyH5R44S8R/M36RgjsW8U2Iys1vOr7iEbqVelTbQbGPaaOcucuzR6AxuFR0spkTzt
 o9ZFx44gCIwKgzVBLkNlP++yep2pIJxZhl7BKrGAMDTpPvm4fZPl1pKZQD0lDrAx2j7P
 WXO6pzxNwQj1BRjqOC7/uHV6wSDJkFnqqVnebfxPgt76Y0qtyN2vldTNrlD2C0toXso4
 FxgajkH8JX2GFR/wcLOL5qvysk3iG3/CCiOJGQ5p7j1kCzmmj2uOtZ2XsNPY/zESlN2Q
 HANw==
X-Gm-Message-State: APjAAAXzjfy6FlluRXdYlqD6NBzi2r1/HXChvXzHqZ/CpwihJndoYHtD
 oZY76kTylpG3oJc7f23DqN4=
X-Google-Smtp-Source: APXvYqx1yeqLv4KsAcheDnbCECVEgnRO87Tbb4/fx7f3mlExaDwzc4evn6w18FnCcsfNgAflvXHFmw==
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr114422714edx.157.1578398072576; 
 Tue, 07 Jan 2020 03:54:32 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id cw15sm7677487edb.44.2020.01.07.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:54:31 -0800 (PST)
Date: Tue, 7 Jan 2020 12:54:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107115429.GA32632@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
 <20200107113354.ggq6zarewq5ip354@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107113354.ggq6zarewq5ip354@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_035434_360518_C7B24D2A 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTI6MzM6NTRQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTI6MDM6NTlQTSArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDA3LCAyMDIwIGF0IDExOjQy
OjM0QU0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiA+IEkgZ3Vlc3Mgb3Ro
ZXIgc29sdXRpb24gd291bGQgYmUgdG8gYWRkIHN0dWJzIGZvciBmZXcgY2xrIGZ1bmN0aW9ucy4u
Lgo+ID4gPiA+IAo+ID4gPiA+ID4gQWxzbyBIQVNfSU9NRU0gaXMgYSB0eXBpY2FsIHJlcXVpcmVt
ZW50LCBidXQgSSB0ZXN0ZWQgd2l0aCBhbiBBUkNIPXVtCj4gPiA+ID4gPiBjb25maWcgKHdoaWNo
IGRvZXMndCBoYXZlIEhBU19JT01FTSkgYW5kIHRoZXkgYWxsIGNvbXBpbGUgZmluZS4KPiA+ID4g
PiAKPiA+ID4gPiBCZWNhdXNlIG9mICFIQVNfSU9NRU0sIHNpbmNlIHNvbWUgdGltZSBBUkNIPXVt
IGRvZXMgbm90IHN1cHBvcnQKPiA+ID4gPiBDT01QSUxFX1RFU1QuIFRoZXJlZm9yZSBIQVNfSU9N
RU0gZGVwZW5kZW5jeSBpcyBub3QgbmVlZGVkIGZvciBjb21waWxlCj4gPiA+ID4gdGVzdGluZyAo
YW5kIGZvciByZWd1bGFyIGJ1aWxkIGl0IGlzIHNlbGVjdGVkIGJ5IEFSQ0gpLgo+ID4gPiAKPiA+
ID4gSGVoZSwgSSBkaWRuJ3Qgbm90aWNlIGJlY2F1c2UgZm9yIHRlc3RpbmcgSSBqdXN0IGRyb3Bw
ZWQgdGhlICJkZXBlbmRzIG9uCj4gPiA+IC4uLiIgbGluZXMgaW4gS2NvbmZpZyBpbnN0ZWFkIG9m
IGFkZGluZyAifHwgQ09NUElMRV9URVNUIiA6LSkgU3RpbGwgdGhleQo+ID4gPiBjb21waWxlIGZp
bmUgb24gVU1MLgo+ID4gPiAKPiA+ID4gQWgsIHNpbmNlIGJjMDgzYTY0YjZjMCAoImluaXQvS2Nv
bmZpZzogbWFrZSBDT01QSUxFX1RFU1QgZGVwZW5kIG9uCj4gPiA+ICFVTUwiKSA9PSB2NC44LXJj
MX41Ml4yfjgzIENPTVBJTEVfVEVTVCBjYW5ub3QgYmUgZW5hYmxlZCBvbiBVTUwsIGJ1dAo+ID4g
PiBsYXRlciAxYmNiZmJmZGViMDAgKCJ1bTogYWRkIGR1bW15IGlvcmVtYXAgYW5kIGlvdW5tYXAg
ZnVuY3Rpb25zIikKPiA+ID4gPT0gdjQuMTMtcmMxfjheMn42IFVNIGdvdCBhIGR1bW15IGltcGxl
bWVudGF0aW9uLiBTbyBtYXliZSB3ZSBjb3VsZAo+ID4gPiByZXZlcnQgYmMwODNhNjRiNmMwIHRv
ZGF5PyAoQW5kIGlmIG5vdCwgYSBjb21tZW50IGFib3V0IHdoeSBuZWFyIHRoZQo+ID4gPiAiZGVw
ZW5kcyBvbiAhVU1MIiBpbiBpbml0L0tjb25maWcgd291bGQgYmUgZ3JlYXQuKQo+ID4gPiAKPiA+
ID4gT3J0aG9nb25hbCB0byB0aGF0LCBJIHdvbmRlciBpZiBkZXBlbmRpbmcgb24gSEFTX0lPTUVN
IGlzIHJpZ2h0IGV2ZW4KPiA+ID4gdGhvdWdoIHRoZSBjb21waWxlIHRlc3RlcnMgd29uJ3Qgbm90
aWNlIGl0IG1pc3NpbmcuIE9yIHNob3VsZCBIQVNfSU9NRU0KPiA+ID4gYmUgZHJvcHBlZD8KPiA+
IAo+ID4gSSB0aGluayB5ZXMsIGl0IGNhbiBiZSBkcm9wcGVkLCBidXQgdGhpcyB3b3VsZCByZXF1
aXJlOgo+ID4gMS4gRml4aW5nIGFueSBkZXBlbmRlbmNpZXMgb24gSEFTX0lPTUVNLCBlLmcuOgo+
ID4gICAgIFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIE1G
RF9TWVNDT04KPiA+ICAgICAgIERlcGVuZHMgb24gW25dOiBIQVNfSU9NRU0gWz1uXQo+ID4gICAg
ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ID4gICAgICAgLSBQSFlfREE4WFhfVVNCIFs9eV0gJiYgKEFS
Q0hfREFWSU5DSV9EQThYWCB8fCBDT01QSUxFX1RFU1QgWz15XSkKPiAKPiBJIGRvbid0IHVuZGVy
c3RhbmQgdGhhdCB3YXJuaW5nLiBXaGF0IGRpZCB5b3UgbW9kaWZ5IHRvIHRyaWdnZXIgdGhhdD8K
PiBQcm9iYWJseSByZWxhdGVkIHRvIHRoZSBiaWcgImlmIEhBU19JT01FTSIgaW4gZHJpdmVycy9t
ZmQvS2NvbmZpZz8hCgpPSywgdGhhdCdzIGFjdHVhbGx5IGZyb20gbXkgb3RoZXIgcGF0Y2ggdG8g
aWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIwMDEwMzE2NDcxMC40ODI5LTIta3J6a0BrZXJuZWwub3JnLwoKQWZ0ZXIgcmV2
ZXJ0aW5nIG9mIGJjMDgzYTY0YjZjMCwgZXZlcnkgZHJpdmVyIHRoYXQgc2VsZWN0cyBNRkRfU1lT
Q09OCihvciBzb21lIG90aGVyIHBhcnRzKSBoYXMgdG8gZGVwZW5kIG9uIEhBU19JT01FTS4KCj4g
Cj4gPiAyLiBDaGVja2luZyBpZiBhbGwgb2Ygc3R1YnMgYXJlIGltcGxlbWVudGVkIChub3Qgb25s
eSBJT01FTSBidXQgbWF5YmUKPiA+ICAgIERNQSBhcyB3ZWxsKS4gQWxzbyAxYmNiZmJmZGViMDAg
YnJvdWdodCBvbmx5IGZldyBzdHVicy4gU3RpbGwgd2UKPiA+ICAgIG5lZWQgZGV2bV9pb3JlbWFw
X3Jlc291cmNlKCkgYW5kIG90aGVycy4KPiAKPiBBIHByb2JsZW0gaXMgdGhhdCBpdCdzIHVuY2xl
YXIgKHRvIG1lIGF0IGxlYXN0KSB3aGF0IHRoZSBwcmVzZW5jZSBvZgo+IEhBU19JT01FTSBhY3R1
YWxseSBpbXBsaWVzLiBJIHRob3VnaHQgaXQncyBhYm91dCBpb3JlbWFwICsgcmVhZGwgKwo+IHdy
aXRlbCAoaW5jbHVkaW5nIHRoZWlyIHJlc3BlY3RpdmUgdmFyaWFudHMpLiBEb2VzIGl0IHJlYWxs
eSBpbmNsdWRlIGRtYQo+IHN0dWZmLCB0b28/Cj4gCj4gPiBRdWljayB0ZXN0IHNob3dzIG1lbnRp
b25lZCAidW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyIgYW5kOgo+ID4gICAgIHBoeS1weGEtdXNi
LmM6KC50ZXh0KzB4MmY1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2bV9pb3JlbWFwX3Jl
c291cmNlJwo+ID4gICAgIGRtYS1pb21tdS5jOigudGV4dCsweDE3OSk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGRtYV9wZ3Byb3QnCj4gCj4gZG1hX3BncHJvdCBzZWVtcyB0byBkZXBlbmQgb24g
SEFTX0RNQSB0aG91Z2gsIG5vdCBIQVNfSU9NRU0uCj4gCj4gKE9oLCBIQVNfRE1BIGlzIGRlZmlu
ZWQgdXNpbmcgImRlcGVuZHMgb24gIU5PX0RNQSIgKyAiZGVmYXVsdCB5Ii4KPiBOT19ETUEgaGFz
IHRocmVlIGRpZmZlcmVudCBkZWZpbml0aW9ucy4gVHdvIG9mIHRoZW0gKGluCj4gZHJpdmVycy9j
cnlwdG8vY2NyZWUvY2NfaHdfcXVldWVfZGVmcy5oIGFuZCBhcmNoL2FybS9pbmNsdWRlL2FzbS9k
bWEuaCkKPiB1bnJlbGF0ZWQuKQoKWWVzLCBIQVNfRE1BIGlzIHRoZSBzZWNvbmQgbWlzc2luZyBw
aWVjZSBmb3IgVU0uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
