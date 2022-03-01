Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlOch+I4GSKaLHziSZ8P7iMKSL1R6mbBBNRkINJWUEA=; b=FrIYebIbEJ6XgW
	8td2Phk1hKJTpFhrFjbyCYhwNUWB7jLE50vJq65aMFX/hpjGJi8c97KsYelQTH1QZYnM8xU2Db56E
	Tf1bojt2Grd58AXafr7a2PV9xukJ7OULqljtmq1uUkJ16ismmnDpeUERgGAwaHjMeyPuW7Vbzn7sl
	Gd9PIVhwycN0wXRtejDCEs3uwgAX28OHszdFdtb98sxPeyVyokeDCUSKlZF7uBJmohWIer3RKvRnk
	GaNCivl4gHoPPGbfQ1DtPD8qMuKZWMN4dLnxhr04HINn+K+Et7yIDb1G4DKpdaEeS3d9R37VUC75u
	NFSpTJWC0cUxZRCizC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwtD-00FIbf-U7; Tue, 01 Mar 2022 07:25:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwtB-00FIZz-Gm; Tue, 01 Mar 2022 07:25:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so793474wmp.5; 
 Mon, 28 Feb 2022 23:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zxhvlxb6rqKJn2KYtqWngJ9OaqRjUdTtwI4QitwqQQA=;
 b=c+lXxE/6gmZRFmKit0QbHGNwYSt2dtm/VEu+bBheELDImS3q6BqtExuU2RokcAh0+u
 eTd9V5oM/zclJhaFyhFtSGAmVwIavyglIxrdF+P6QeJKPrLN/2kAvsfJdTxhq/NI8Ql3
 heqK/wtv0fnGo78K2+cA1uac2bCfiluMaxpN0CPgYW54cr2jkizMrFnILdnSwasPDaEF
 i824xyzzGkXUP6r/nXhMZrM34+G17BQEp2cI9Uw8+46+MyGRwgV2+57YHO5Qu8eeFptc
 zb2pnfCYJ+IsbhHBT0EiEOudxr3Gj+sEqV+zO/gtpmkG+gkc0u1VZGVwJpMNPI7rIyOs
 DpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zxhvlxb6rqKJn2KYtqWngJ9OaqRjUdTtwI4QitwqQQA=;
 b=fGJ99QIx5p52V7Oi9SrTceGPgM+2x817CXia2jIIM+dGsC46mSIYpY/W+imxJSvSKE
 MZQzzi1USckhvDPD6rKWyucPJ+L0UXtoGHQOBlwt15xXRqgy3pwW38Shs07A1vkW/jkI
 JKDrzjyJOAP4OTQM/RrF1dcsRLhNXQnoEcscRdejOxyYmmQ91qxTCgBJrsaSBe97iy7d
 TaNwyjYK4m7NgioNoFl4hUR9w4G9FF/V8Vph9DvF0U7C1cRXj2VYK3C0Ir9f9e1/H7Jh
 VQgp38kwerUIt6YpcDtXlu5+8wcOuNIEsPxbnET7TDnnDo11KYbjOCvHolbjDXFC+2AI
 n3Ew==
X-Gm-Message-State: AOAM532Df0YjbAzH5CIUBkpLjzlzkIb1LukUND988ZaWWuaRQ0CL4QfC
 b18ZWuz6boWDp0+nCaDdGiw=
X-Google-Smtp-Source: ABdhPJy2m46mxTpEB8OWzY6kpD1xUzJwTkawiRbU4OHDtrb8HDjJTFmfD4Sj8fJWVfSUhMM26Cj6Ow==
X-Received: by 2002:a05:600c:2282:b0:381:1938:b182 with SMTP id
 2-20020a05600c228200b003811938b182mr15866841wmf.147.1646119539842; 
 Mon, 28 Feb 2022 23:25:39 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00380ead5bc65sm1875632wmq.29.2022.02.28.23.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:25:39 -0800 (PST)
Message-ID: <470ec036-b402-2cc2-94b9-75ebaff342fc@gmail.com>
Date: Tue, 1 Mar 2022 08:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soc: mediatek: mtk-infracfg: Disable ACP on MT8192
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <20220215184651.12168-1-alyssa.rosenzweig@collabora.com>
 <e93b12d6-5c7b-2ad6-47e5-c1311d95cba2@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <e93b12d6-5c7b-2ad6-47e5-c1311d95cba2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_232541_588789_E6E76F32 
X-CRM114-Status: GOOD (  25.89  )
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

SGkgYWxsLAoKT24gMTcvMDIvMjAyMiAxMTo0MCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
d3JvdGU6Cj4gSWwgMTUvMDIvMjIgMTk6NDYsIEFseXNzYSBSb3Nlbnp3ZWlnIGhhIHNjcml0dG86
Cj4+IE1UODE5MiBjb250YWlucyBhbiBleHBlcmltZW50YWwgQWNjZWxlcmF0b3IgQ29oZXJlbmN5
IFBvcnQKPj4gaW1wbGVtZW50YXRpb24sIHdoaWNoIGRvZXMgbm90IHdvcmsgY29ycmVjdGx5IGJ1
dCB3YXMgdW5pbnRlbnRpb25hbGx5Cj4+IGVuYWJsZWQgYnkgZGVmYXVsdC4gRm9yIGNvcnJlY3Qg
b3BlcmF0aW9uIG9mIHRoZSBHUFUsIHdlIG11c3Qgc2V0IGEKPj4gY2hpY2tlbiBiaXQgZGlzYWJs
aW5nIEFDUCBvbiBNVDgxOTIuCj4+Cj4+IEFkYXB0ZWQgZnJvbSB0aGUgZm9sbG93aW5nIGRvd25z
dHJlYW0gY2hhbmdlIHRvIHRoZSBvdXQtb2YtdHJlZSwgbGVnYWN5Cj4+IE1hbGkgR1BVIGRyaXZl
cjoKPj4KPj4gaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9t
aXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvMjc4MTI3MS81IAo+Pgo+Pgo+PiBOb3RlIHRoaXMg
Y2hhbmdlIGlzIHJlcXVpcmVkIGZvciBib3RoIFBhbmZyb3N0IGFuZCB0aGUgbGVnYWN5IGtlcm5l
bAo+PiBkcml2ZXIuCj4gCj4gSGVsbG8gQWx5c3NhLAo+IHRoZSB2MiBub3RlIHNob3VsZCBub3Qg
Z2V0IGluc2lkZSB0aGUgY29tbWl0IG1lc3NhZ2UsIGV2ZW4gdGhvdWdoIHRoZXkgc2hvdWxkIGJl
Cj4gb24gdGhlIHBhdGNoIHRvIHByb3ZpZGUgY29udGV4dC4KPiBMb29rIGF0IHRoZSBleGFtcGxl
Li4uCj4gCgpJIHRoaW5rIHRoZSBtb3N0IG9idmlvdXMgd291bGQgYmUgdG8gZGlzYWJsZSB0aGUg
QUNQIGluIHRoZSBib290IGZpcm13YXJlLiBCdXQgCmFzIHdlIGNhbid0IGNvbnRyb2wgdGhhdCwg
d2Ugd2lsbCBuZWVkIHRvIHdvcmsgYXJvdW5kIGl0LiBTbzoKUGF0Y2ggYXBwbGllZC4gSSBmaXhl
ZCB0aGUgY29tbWl0IG1lc3NhZ2UgYnkgZGVsZXRpbmcgdGhlIHYyIG5vdGUuCgpUaGFua3MgZXZl
cnlib2R5IGZvciBmaWd1cmluZyBvdXQgd2hhdCB0byBkbyBhYm91dCB0aGF0LgoKUmVnYXJkcywK
TWF0dGhpYXMKCj4+Cj4+IHYyOiBNb3ZlIHRoZSBjaGFuZ2UgZnJvbSBjbGstbXQ4MTkyLmMgdG8g
bXRrLWluZnJhY2ZnLmMgKFJvYmluKS4KPj4gQWx0aG91Z2ggaXQgZG9lcyBub3QgbWFrZSBzZW5z
ZSB0byBhZGQgdGhpcyBwbGF0Zm9ybS1zcGVjaWZpYyBoYWNrIHRvCj4+IHRoZSBHUFUgZHJpdmVy
LCBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGNsb2Nrcy4gV2UgYWxyZWFkeSBoYXZlCj4+IG10
ay1pbmZyYWNmZy5jIHRvIG1hbmFnZSBvdGhlciBpbmZyYWNmZyBiaXRzOyB0aGUgQUNQIGRpc2Fi
bGUgc2hvdWxkCj4+IGxpdmUgdGhlcmUgdG9vLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IFJvYmlu
IE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFseXNzYSBSb3Nl
bnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+PiBDYzogTmljayBGYW4g
PE5pY2suRmFuQG1lZGlhdGVrLmNvbT4KPj4gQ2M6IE5pY29sYXMgQm9pY2hhdCA8ZHJpbmtjYXRA
Y2hyb21pdW0ub3JnPgo+PiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+Cj4+
IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4+IENjOiBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+
PiAtLS0KPiAKPiB2MjogTW92ZSB0aGUgY2hhbmdlIGZyb20gY2xrLW10ODE5Mi5jIHRvIG10ay1p
bmZyYWNmZy5jIChSb2JpbikuCj4gCj4gXl5eIHB1dCBpdCBoZXJlLCBhZnRlciB0aGUgIi0tLSIg
OikKPiAKPiBBbnl3YXksCj4gVGVzdGVkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+IAo+PiDCoCBkcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstaW5mcmFjZmcuY8KgwqAgfCAxOSArKysrKysrKysrKysrKysrKysr
Cj4+IMKgIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL2luZnJhY2ZnLmggfMKgIDMgKysrCj4+
IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWluZnJhY2ZnLmMgCj4+IGIvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLWluZnJhY2ZnLmMKPj4gaW5kZXggMDU5MGI2OGUwZDc4Li4yYWNmMTk2NzZhZjIg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1pbmZyYWNmZy5jCj4+ICsr
KyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1pbmZyYWNmZy5jCj4+IEBAIC02LDYgKzYsNyBA
QAo+PiDCoCAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9q
aWZmaWVzLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4gKyNpbmNsdWRlIDxs
aW51eC9tZmQvc3lzY29uLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvaW5m
cmFjZmcuaD4KPj4gwqAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPj4gQEAgLTcyLDMgKzcz
LDIxIEBAIGludCBtdGtfaW5mcmFjZmdfY2xlYXJfYnVzX3Byb3RlY3Rpb24oc3RydWN0IHJlZ21h
cCAKPj4gKmluZnJhY2ZnLCB1MzIgbWFzaywKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDC
oCB9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgX19pbml0IG10a19pbmZyYWNmZ19pbml0KHZvaWQpCj4+
ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHJlZ21hcCAqaW5mcmFjZmc7Cj4+ICsKPj4gK8KgwqDCoCAv
Kgo+PiArwqDCoMKgwqAgKiBNVDgxOTIgaGFzIGFuIGV4cGVyaW1lbnRhbCBwYXRoIHRvIHJvdXRl
IEdQVSB0cmFmZmljIHRvIHRoZSBEU1Uncwo+PiArwqDCoMKgwqAgKiBBY2NlbGVyYXRvciBDb2hl
cmVuY3kgUG9ydCwgd2hpY2ggaXMgaW5hZHZlcnRlbnRseSBlbmFibGVkIGJ5Cj4+ICvCoMKgwqDC
oCAqIGRlZmF1bHQuIEl0IHR1cm5zIG91dCBub3QgdG8gd29yaywgc28gZGlzYWJsZSBpdCB0byBw
cmV2ZW50IHNwdXJpb3VzCj4+ICvCoMKgwqDCoCAqIEdQVSBmYXVsdHMuCj4+ICvCoMKgwqDCoCAq
Lwo+PiArwqDCoMKgIGluZnJhY2ZnID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJs
ZSgibWVkaWF0ZWssbXQ4MTkyLWluZnJhY2ZnIik7Cj4+ICvCoMKgwqAgaWYgKCFJU19FUlIoaW5m
cmFjZmcpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmVnbWFwX3NldF9iaXRzKGluZnJhY2ZnLCBNVDgx
OTJfSU5GUkFfQ1RSTCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNVDgxOTJf
SU5GUkFfQ1RSTF9ESVNBQkxFX01GRzJBQ1ApOwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+
PiArcG9zdGNvcmVfaW5pdGNhbGwobXRrX2luZnJhY2ZnX2luaXQpOwo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvaW5mcmFjZmcuaCAKPj4gYi9pbmNsdWRlL2xpbnV4
L3NvYy9tZWRpYXRlay9pbmZyYWNmZy5oCj4+IGluZGV4IGQ4NThlMGJhYjdhMi4uZmNiYmQwZGQ1
ZTU1IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9pbmZyYWNmZy5o
Cj4+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL2luZnJhY2ZnLmgKPj4gQEAgLTIy
OSw2ICsyMjksOSBAQAo+PiDCoCAjZGVmaW5lIElORlJBX1RPUEFYSV9QUk9URUNURU5fU0VUwqDC
oMKgwqDCoMKgwqAgMHgwMjYwCj4+IMKgICNkZWZpbmUgSU5GUkFfVE9QQVhJX1BST1RFQ1RFTl9D
TFLCoMKgwqDCoMKgwqDCoCAweDAyNjQKPj4gKyNkZWZpbmUgTVQ4MTkyX0lORlJBX0NUUkzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4MjkwCj4+ICsjZGVmaW5lIE1UODE5Ml9JTkZSQV9DVFJMX0RJ
U0FCTEVfTUZHMkFDUMKgwqDCoCBCSVQoOSkKPj4gKwo+PiDCoCAjZGVmaW5lIFJFR19JTkZSQV9N
SVNDwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4ZjAwCj4+IMKgICNkZWZpbmUgRl9E
RFJfNEdCX1NVUFBPUlRfRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgxMykKPiAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
