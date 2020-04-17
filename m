Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34694C38A29
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 10:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8A2221EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 10:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hp96gmty";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pT1ZPbKI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B8A2221EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ad1WAK3bCIsjznkk7CbWR/iUcQ/67UxQzUFN/fNuL+c=; b=hp96gmtyPHHGtC
	NSC+s1bg7X4oYpzuKMeKyQovJUgVIUGpm+vJaiQ866Xx5HdImJOWYQZ+T0TMEZXDagrhaSF6rIC+e
	Ywyeii7RKKeGKekfJ1B9M+61+bMjbas2qQZILMvlYabV9cSVNxa+hwArOjS5xm68EZlNcc7fFWCGw
	tiIQND9QWzhw1JOwC5uzESx++GSDHRcP67vXfGwY7naBMzlFWCcyN1kG4gQHkvM5Y24X+CBRkUjvI
	HuvKViUTh8xWUX56rJ4FT1oDJApUJw/CmcNTf2oicqrUsZfh0iQVdOeXWsSI82dlctSbyoRS/TjCA
	Lt6mqXIeo/s/mxgoEAhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPOId-0007x4-2D; Fri, 17 Apr 2020 10:32:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPOIW-0007qP-D9
 for linux-mediatek@lists.infradead.org; Fri, 17 Apr 2020 10:32:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id i10so2438856wrv.10
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2020 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=107gFRkToKH3NZvEzE8D2zQk2B7UQGVYWH3FpM3ffbQ=;
 b=pT1ZPbKIzeOuCLAGwau2qh6AMP05LfNf9H23Mf2O3gsd15pclob8765UcLXtYetbPJ
 tW62+lUJpJcjEBR3UgD04tLEWlMRZvnXZlmDT1BoBH9QoVIvD60GNORkBEolOXl/BjPh
 9XThsJSY/xjjkqyJJAXGLyI/HB4J15kFHjLYD+1K+EP+gqAiv4YoIUcEnqtidGOIiueV
 zTvOBPY9OnOfoBmHGwSx14yxh6y0kuhijDBkFTZKthvd/L9lj6EZ3vxC9Q/dHE+uvk/x
 CSmkXE5EGApOLTFfzUsar1xydm0g5G1kDzCVMa5P7hfVzmecFNz/om0CJECT4us9mTiI
 X8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=107gFRkToKH3NZvEzE8D2zQk2B7UQGVYWH3FpM3ffbQ=;
 b=Rf1v4UxhRJlOyOZVEqcRcq+xy2w/JeX2McT0MVkd/tWfO5W4sNNpcaEw6oztu6ipj7
 l9mstoYYN2MvBd664LYjUhq3p/1B1MjTcABOw4Ae8kU73XcrhUvRgnCsmoeXWfQ3mfHe
 ySCVZH1/llbe1KX8CUjUZWkEV6RGW63sewtB53ze6lE0w0WVjSRBB3305jXMhD6u1aUI
 BIyvFgOzqtRj4BpO2FAjbePN6D++Tuuk837Z6MdGpHd8v9t/31BfzBshAF8qYzit5pj6
 RCaNo/Zqk97tD02vU+Kb9F71V+ys8l+1NYdRTVz3A/+TaENlRauUOsIZVt8tZVLsRkza
 lrJA==
X-Gm-Message-State: AGi0PuaW7njqaiziOCBBPKy6wZyyO9zWvPAUY+nrkOIzP9S1vdE9n83D
 nrxIVr5pT1aygJRW8gYW7kEwBQ==
X-Google-Smtp-Source: APiQypIfmSfeb691l/CD81jIS3LbFcVmiFUm6gA93sVAsJxA5uo5BTobaVoE1BIDagtfVzSXji3Jtw==
X-Received: by 2002:adf:dd84:: with SMTP id x4mr3479893wrl.210.1587119553482; 
 Fri, 17 Apr 2020 03:32:33 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id t20sm6692113wmi.2.2020.04.17.03.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 03:32:32 -0700 (PDT)
Date: Fri, 17 Apr 2020 11:33:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH resend v8] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200417103334.GD3737@dell>
References: <1586273804-7722-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586273804-7722-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_033236_446341_D31A9AEC 
X-CRM114-Status: GOOD (  15.21  )
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

T24gVHVlLCAwNyBBcHIgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBBZGQgbWZkIGRyaXZlciBm
b3IgbXQ2MzYwIHBtaWMgY2hpcCBpbmNsdWRlCj4gQmF0dGVyeSBDaGFyZ2VyL1VTQl9QRC9GbGFz
aCBMRUQvUkdCIExFRC9MRE8vQnVjawo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2Vu
ZV9jaGVuQHJpY2h0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICB8
ICAxMiArKwo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMgIHwgNDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCB8IDI0MCArKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjc4IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oCj4gCj4gY2hhbmdlbG9ncyBi
ZXR3ZWVuIHYxICYgdjIKPiAtIGluY2x1ZGUgbWlzc2luZyBoZWFkZXIgZmlsZQo+IAo+IGNoYW5n
ZWxvZ3MgYmV0d2VlbiB2MiAmIHYzCj4gLSBhZGQgY2hhbmdlbG9ncwo+IAo+IGNoYW5nZWxvZ3Mg
YmV0d2VlbiB2MyAmIHY0Cj4gLSBmaXggS2NvbmZpZyBkZXNjcmlwdGlvbgo+IC0gcmVwbGFjZSBt
dDYzNjBfcG11X2luZm8gd2l0aCBtdDYzNjBfcG11X2RhdGEKPiAtIHJlcGxhY2UgcHJvYmUgd2l0
aCBwcm9iZV9uZXcKPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBpcnFfY2hpcCB2YXJpYWJsZQo+IC0g
cmVtb3ZlIGFubm90YXRpb24KPiAtIHJlcGxhY2UgTVQ2MzYwX01GRF9DRUxMIHdpdGggT0ZfTUZE
X0NFTEwKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjQgJiB2NQo+IC0gcmVtb3ZlIHVubmVjZXNz
YXJ5IHBhcnNlIGR0IGZ1bmN0aW9uCj4gLSB1c2UgZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZQo+
IC0gYWRkIGJhc2UtY29tbWl0IG1lc3NhZ2UKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjUgJiB2
Ngo+IC0gcmV2aWV3IHJldHVybiB2YWx1ZQo+IC0gcmVtb3ZlIGkyYyBpZF90YWJsZQo+IC0gdXNl
IEdQTCBsaWNlbnNlIHYyCj4gCj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY2ICYgdjcKPiAtIGFkZCBh
dXRob3IgZGVzY3JpcHRpb24KPiAtIHJlcGxhY2UgTVQ2MzYwX1JFR01BUF9JUlFfUkVHIGJ5IFJF
R01BUF9JUlFfUkVHX0xJTkUKPiAtIHJlbW92ZSBtdDYzNjAtcHJpdmF0ZS5oCj4gCj4gY2hhbmdl
bG9ncyBiZXR3ZWVuIHY3ICYgdjgKPiAtIGZpeCBrYnVpbGQgYXV0byByZWJvb3QgYnkgaW5jbHVk
ZSBpbnRlcnJ1cHQgaGVhZGVyCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL0tjb25maWcg
Yi9kcml2ZXJzL21mZC9LY29uZmlnCj4gaW5kZXggMmIyMDMyOS4uMGY4YzM0MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21mZC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwo+IEBA
IC04NTcsNiArODU3LDE4IEBAIGNvbmZpZyBNRkRfTUFYODk5OAo+ICAJICBhZGRpdGlvbmFsIGRy
aXZlcnMgbXVzdCBiZSBlbmFibGVkIGluIG9yZGVyIHRvIHVzZSB0aGUgZnVuY3Rpb25hbGl0eQo+
ICAJICBvZiB0aGUgZGV2aWNlLgo+ICAKPiArY29uZmlnIE1GRF9NVDYzNjAKPiArCXRyaXN0YXRl
ICJNZWRpYXRlayBNVDYzNjAgU3ViUE1JQyIKPiArCXNlbGVjdCBNRkRfQ09SRQo+ICsJc2VsZWN0
IFJFR01BUF9JMkMKPiArCXNlbGVjdCBSRUdNQVBfSVJRCj4gKwlkZXBlbmRzIG9uIEkyQwo+ICsJ
aGVscAo+ICsJICBTYXkgWSBoZXJlIHRvIGVuYWJsZSBNVDYzNjAgUE1VL1BNSUMvTERPIGZ1bmN0
aW9uYWwgc3VwcG9ydC4KPiArCSAgUE1VIHBhcnQgaW5jbHVkZXMgQ2hhcmdlciwgRmxhc2hsaWdo
dCwgUkdCIExFRAo+ICsJICBQTUlDIHBhcnQgaW5jbHVkZXMgMi1jaGFubmVsIEJVQ0tzIGFuZCAy
LWNoYW5uZWwgTERPcwo+ICsJICBMRE8gcGFydCBpbmNsdWRlcyA0LWNoYW5uZWwgTERPcwo+ICsK
PiAgY29uZmlnIE1GRF9NVDYzOTcKPiAgCXRyaXN0YXRlICJNZWRpYVRlayBNVDYzOTcgUE1JQyBT
dXBwb3J0Igo+ICAJc2VsZWN0IE1GRF9DT1JFCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL01h
a2VmaWxlIGIvZHJpdmVycy9tZmQvTWFrZWZpbGUKPiBpbmRleCBiODNmMTcyLi44YzM1ODE2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9tZmQvTWFr
ZWZpbGUKPiBAQCAtMjM4LDYgKzIzOCw3IEBAIG9iai0kKENPTkZJR19JTlRFTF9TT0NfUE1JQykJ
Kz0gaW50ZWwtc29jLXBtaWMubwo+ICBvYmotJChDT05GSUdfSU5URUxfU09DX1BNSUNfQlhUV0Mp
CSs9IGludGVsX3NvY19wbWljX2J4dHdjLm8KPiAgb2JqLSQoQ09ORklHX0lOVEVMX1NPQ19QTUlD
X0NIVFdDKQkrPSBpbnRlbF9zb2NfcG1pY19jaHR3Yy5vCj4gIG9iai0kKENPTkZJR19JTlRFTF9T
T0NfUE1JQ19DSFREQ19USSkJKz0gaW50ZWxfc29jX3BtaWNfY2h0ZGNfdGkubwo+ICtvYmotJChD
T05GSUdfTUZEX01UNjM2MCkJKz0gbXQ2MzYwLWNvcmUubwo+ICBtdDYzOTctb2Jqcwk6PSBtdDYz
OTctY29yZS5vIG10NjM5Ny1pcnEubwo+ICBvYmotJChDT05GSUdfTUZEX01UNjM5NykJKz0gbXQ2
Mzk3Lm8KPiAgb2JqLSQoQ09ORklHX0lOVEVMX1NPQ19QTUlDX01SRkxEKQkrPSBpbnRlbF9zb2Nf
cG1pY19tcmZsZC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgYi9k
cml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwLi5kMTE2OGY4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2
MC1jb3JlLmMKPiBAQCAtMCwwICsxLDQyNSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWVkaWFUZWsgSW5jLgoK
VGhpcyBpcyBvdXQgb2YgZGF0ZS4KCj4gKyAqIEF1dGhvcjogR2VuZSBDaGVuIDxnZW5lX2NoZW5A
cmljaHRlay5jb20+Cj4gKyAqLwoKWy4uLl0KCj4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmggYi9pbmNsdWRlL2xpbnV4
L21mZC9tdDYzNjAuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uYzAz
ZTZkMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaAo+
IEBAIC0wLDAgKzEsMjQwIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBNZWRpYVRlayBJbmMuCgpBbHNvIG91
dCBvZiBkYXRlLgoKPiArICovCgpPbmNlIGZpeGVkLCBwbGVhc2UgcmVzdWJtaXQgd2l0aCBteToK
CkZvciBteSBvd24gcmVmZXJlbmNlIChhcHBseSB0aGlzIGFzLWlzIHRvIHlvdXIgc2lnbi1vZmYg
YmxvY2spOgoKICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2Fs
IExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
