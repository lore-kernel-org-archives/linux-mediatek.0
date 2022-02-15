Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVkCxccTyAquX2lplNxD1E158J6lYnF/Qk6GV436H80=; b=cDKjpUJwmNI0zp
	ZDtDdbdhYmqy52fwe1BD72+MKO+6e2RFo5GklcovOUp9bUjuuy+U1PU62WX3FYt+KT36Sq9gkJqz9
	gwRfqBOhPoAAubqDuwdBDdx9OWUPdgoPU3NYGggHV6KWJQjcLbNrdJP6cTK8J3hqSpyBrPe7ZM3lQ
	mF82/DEo+j1m2fE6CnJEuVtl6nqQfAzu0Xsd7nS2C0NwCyTDILAp9m7eW8yfFH1Bir+I/4PIFjVm/
	Kf2g/5SnM1LL/YuE0UvqpYn/4knQNi1yjWWzz4s+r8/Aws1PuPI8oZJw933y2JlRUqslIELNlEMS9
	QfhCHJV/IcajkRhybELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzey-003E6h-30; Tue, 15 Feb 2022 15:22:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzel-003E5E-JK; Tue, 15 Feb 2022 15:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16541396;
 Tue, 15 Feb 2022 07:22:18 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336CB3F66F;
 Tue, 15 Feb 2022 07:22:14 -0800 (PST)
Message-ID: <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
Date: Tue, 15 Feb 2022 15:21:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com> <YelxN/zpdkukBBqy@maud>
 <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072219_753532_7AEA6FD7 
X-CRM114-Status: GOOD (  32.56  )
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

T24gMjAyMi0wMi0xNSAxMDo0NCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4g
SWwgMjAvMDEvMjIgMTU6MjcsIEFseXNzYSBSb3Nlbnp3ZWlnIGhhIHNjcml0dG86Cj4+PiBXZSBh
bHNvIGFscmVhZHkgaGF2ZSBTb0Mtc3BlY2lmaWMgR1BVIGNvbXBhdGlibGVzIGJlY2F1c2UgZXZl
biB3aXRob3V0Cj4+PiBleHBlcmltZW50YWwgaW50ZXJjb25uZWN0IGVhc3RlciBlZ2dzLCBwZW9w
bGUgaW50ZWdyYXRlIHRoZXNlIElQcyBpbiAKPj4+IGZhaXJseQo+Pj4gaW52b2x2ZWQgd2F5cyBh
bmQgdGhlcmUncyBhIGZhaXIgZGVncmVlIG9mIHZhcmlldHkuIEhvd2V2ZXIgdW5sZXNzIHdlIAo+
Pj4gd2FudAo+Pj4gdG8gYmUgc3VwZXItc3RyaWN0IGl0J3MgYWxzbyBub3QgdG9vIGhhcmQgdG8g
c2ltcGx5IGFzc3VtZSB0aGF0IGlmIHdlIAo+Pj4gY2FuCj4+PiBmaW5kIGEgIm1lZGlhdGVrLG10
ODE5Mi1pbmZyYWNmZyIgc3lzY29uIHRoZW4gd2Ugc2V0IHRoZSBNVDgxOTIgbWFnaWMgCj4+PiBi
aXQKPj4+IHdpdGhpbiBpdCwgYW5kIGlmIHdlIGNhbid0IHRoZW4gd2UgZG9uJ3QuCj4+Cj4+IFdl
IG5lZWQgYSBNVDgxOTItc3BlY2lmaWMgY29tcGF0aWJsZSBmb3IgdGhlIEdQVSBhbnl3YXkgZHVl
IHRvICJ1bmlxdWUiCj4+IHBvd2VyIG1hbmFnZW1lbnQgcmVxdWlyZW1lbnRzLCB0aGlzIGlzIHdo
eSB0aGUgTVQ4MTgzIGJlZm9yZSBpdCBoYXMgYQo+PiBzcGVjaWZpYyBHUFUgY29tcGF0aWJsZS4g
U28gSSdtIG5vdCB3b3JyaWVkIGFib3V0IHRoZSBjb21wYXRpYmxlLgo+Pgo+IAo+IFRoaW5nIGlz
LCBhcyBpdCB3YXMgZXhwbGFpbmVkLCB0aGlzIGlzIGFib3V0IGEgdW53YW50ZWQgU29DIAo+IG1p
c2NvbmZpZ3VyYXRpb24sCj4gaGVuY2UgdGhpcyBpcyB2ZXJ5IHNwZWNpZmljIHRvIG9uZSBTb0Ms
IHdoaWNoICpoYXBwZW5zIHRvKiBpbnRlZ3JhdGUgYSAKPiBNYWxpIEdQVS4KPiAKPiBJIGFncmVl
IHdpdGggU3RlcGhlbidzIHJlYXNvbmluZyAtIGFsc28gaW4gbXkgb3BpbmlvbiwgdGhlIHBhbmZy
b3N0IAo+IGRyaXZlciBzaG91bGQKPiBiZSBkZWRpY2F0ZWQgdG8gbWFuYWdpbmcgdGhlIE1hbGkg
R1BVcyBhbmQgKm5vdCogdGhlIFNvQ3Mgb24gd2hpY2ggaXQgaXMgCj4gcHJlc2VudCwKPiBzbyBk
aXNhYmxpbmcgdGhlIEFjY2VsZXJhdG9yIENvaGVyZW5jeSBQb3J0IGZvciBNRkcgc2hvdWxkIGJl
IHBlcmZvcm1lZCAKPiBpbnNpZGUgb2YKPiBmaWxlcyB0aGF0IGFyZSBkZWFsaW5nIHdpdGggdGhl
IHNwZWNpZmljIFNvQyB0aGF0IHJlcXVpcmVzIHRoaXMgCj4gY29uZmlndXJhdGlvbiAob3IsCj4g
aWYgeW91IHdhbnQsIHF1aXJrKS4KPiAKPiBTaW1wbHkgcHV0LCB0aG91Z2gsIGFzIHlvdSBhbHJl
YWR5IHBlcmZlY3RseSBrbm93LCB0aGVyZSBpcyBubyBkcml2ZXIgCj4gdGhhdCBpcwo+IGRlZGlj
YXRlZCB0byBleGNsdXNpdmVseSBtYW5hZ2UgdGhlICJleHRyYSIgSU5GUkEgYml0cywgc28gaGVy
ZSdzIHdoYXQgCj4gSSd2ZSBiZWVuCj4gdGhpbmtpbmcgZm9yIGEgd2hpbGU7IG15IGxvZ2ljYWwg
cmVhc29uaW5nOgo+IC0gRG9pbmcgaXQgaW4gdGhlIElPTU1VIGRyaXZlciBtYXkgc2VlbSBhdCBh
IGZpcnN0IGdsYW5jZSB0byBtYWtlIHNvbWUgCj4gc2Vuc2UsCj4gIMKgIGJ1dCB0aGVuLCBkb2Vz
IHRoaXMgcmVhbGx5IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCB0aGUgSU9NTVU/IEkgCj4gZG9u
J3QgdGhpbmsgc287Cj4gLSBQZXJmb3JtaW5nIHRoZSBkaXNhYmxlbWVudCBpbiBtdGstcG0tZG9t
YWlucyBpcyB2ZXJ5IHNoYWR5Li4uIHRoZXJlJ3MgCj4gbm90aGluZwo+ICDCoCB0aGF0IHNjcmVh
bXMgInBvd2VyIiBpbiB0aGF0Owo+IC0gVGhpcyBkb2Vzbid0IHNjcmVhbSAiY2xvY2tzIiBlaXRo
ZXIsIEkgdW5kZXJzdGFuZCB0aGF0Owo+IC0gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGlzIHNw
ZWNpZmljIHRoaW5nIHdvbid0IGhhcHBlbiBhbnltb3JlIChvciBhdCAKPiBsZWFzdCwKPiAgwqAg
bm90IGluIE1lZGlhVGVrIGxhbmQsIGJ1dCBJIGFsc28gZG9uJ3QgZXhwZWN0IHRvIHNlZSB0aGlz
IG9uIG90aGVyIAo+IFNvQ3MpLgo+IAo+IEdldHRpbmcgYmFjayB0byBNZWRpYVRlay1sYW5kLCBv
bmx5IE1UODE5MiBpcyAoYW5kIHdpbGwgZXZlciBiZSkgCj4gYWZmZWN0ZWQsIGZyb20KPiB3aGF0
IEkgdW5kZXJzdGFuZC4uLiBhbmQgdGhlcmUgaXMgb25lIGRyaXZlciB0aGF0IGlzIHZlcnkgc3Bl
Y2lmaWMgdG8sIAo+IHRhcmdldHMKPiBvbmx5LCBhbmQgd291bGQgcHJvYmUgb25seSBvbiBNVDgx
OTIgLSB3aGljaCBhbHNvIGhhcHBlbnMgdG8gbWFuYWdlIHRoZSAKPiB2ZXJ5IHNhbWUKPiBpb3Nw
YWNlIHRoYXQgd2UgYWxzbyB3YW50IHRvIHBva2UgYXQgdG8gZGlzYWJsZSB0aGlzIGJpdC4uLi4u
Lgo+IAo+IC4uLiBjbGstbXQ4MTkyIQoKVGhlIG9ubHkgdHJvdWJsZSB3aXRoIHRoYXQgYXJndW1l
bnQgaXMgdGhhdCBpdCBmYWxscyBhcGFydCB1bmRlciB0aGUKc2xpZ2h0ZXN0IHNjcnV0aW55IDsp
CgpUaGUgcmVsZXZhbnQgcGFydHMgb2YgdGhlIHBvd2VyIGRvbWFpbiwgSU9NTVUgYW5kIEdQVSBk
cml2ZXJzIGFyZSBldmVyeQpiaXQgYXMgU29DLXNwZWNpZmljIGFzIHRoZSBjbG9jayBkcml2ZXIs
IGFuZCBpdCBpcyB0aGUgZ2VuZXJpYyBzeXNjb24KZHJpdmVyIHdoaWNoIG93bnMgYW5kIG1hbmFn
ZXMgdGhlIGFjdHVhbCBNTUlPIHNwYWNlLgoKQWxsIGluIGFsbCB0aGlzIGhhcyBub3cgY29udmlu
Y2VkIG1lIHRoYXQgaXQgKmlzKiB3b3J0aCB0aGUgc2xpZ2h0IGV4dHJhCmVmZm9ydCB0byBwdXQg
cmFuZG9tIGluZnJhY2ZnIHN0dWZmIGluIHRoZSByYW5kb20gaW5mcmFjZmcgc3R1ZmYgcGxhY2Uu
CkFuZCBieSAic2xpZ2h0IiBJIG1lYW4gaXQgdHVybnMgb3V0IEkndmUgc3BlbnQgbG9uZ2VyIHdy
aXRpbmcgdGhpcyBwcm9zZQp0aGFuIGJhc2hpbmcgb3V0IHRoZSBpbGx1c3RyYXRpdmUgZGlmZiBi
ZWxvdywgd2hpY2ggaXMgdGhlIGxhc3Qgb3BpbmlvbgpJIHNoYWxsIGhhdmUgb24gdGhpcyBtYXR0
ZXIuIEZlZWwgZnJlZSB0byB0YWtlIGl0IGFuZCBmaXggaXQsIG9yIGRvIAphbnl0aGluZyBlbHNl
IGlmIHlvdSBwcmVmZXIgOikKCkNoZWVycywKUm9iaW4uCgotLS0tLT44LS0tLS0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1pbmZyYWNmZy5jIApiL2RyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1pbmZyYWNmZy5jCmluZGV4IDA1OTBiNjhlMGQ3OC4uYWYyMmQwZjNkNTQ3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstaW5mcmFjZmcuYworKysgYi9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstaW5mcmFjZmcuYwpAQCAtNzIsMyArNzIsMjAgQEAgaW50IG10
a19pbmZyYWNmZ19jbGVhcl9idXNfcHJvdGVjdGlvbihzdHJ1Y3QgcmVnbWFwIAoqaW5mcmFjZmcs
IHUzMiBtYXNrLAoKICAJcmV0dXJuIHJldDsKICB9CisKK3N0YXRpYyBpbnQgX19pbml0IG10a19p
bmZyYWNmZ19pbml0KHZvaWQpCit7CisJc3RydWN0IHJlZ21hcCAqaW5mcmFjZmc7CisKKwkvKgor
CSAqIE1UODE5MiBoYXMgYW4gZXhwZXJpbWVudGFsIHBhdGggdG8gcm91dGUgR1BVIHRyYWZmaWMg
dG8gdGhlIERTVSdzCisJICogQWNjZWxlcmF0b3IgQ29oZXJlbmN5IFBvcnQsIHdoaWNoIGlzIGlu
YWR2ZXJ0ZW50bHkgZW5hYmxlZCBieQorCSAqIGRlZmF1bHQuIEl0IHR1cm5zIG91dCBub3QgdG8g
d29yayB2ZXJ5IHdlbGwsIHNvIGRpc2FibGUgaXQuCisJICovCisJaW5mcmFjZmcgPSBzeXNjb25f
cmVnbWFwX2xvb2t1cF9ieV9jb21wYXRpYmxlKCJtZWRpYXRlayxtdDgxOTItaW5mcmFjZmciKTsK
KwlpZiAoaW5mcmFjZmcpCisJCXJlZ21hcF9zZXRfYml0cyhpbmZyYWNmZywgTVQ4MTkyX0lORlJB
X0NUUkwsCisJCQkJTVQ4MTkyX0lORlJBX0NUUkxfRElTQUJMRV9NRkcyQUNQKTsKKwlyZXR1cm4g
MDsKK30KK3Bvc3Rjb3JlX2luaXRjYWxsKG10a19pbmZyYWNmZ19pbml0KTsKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL2luZnJhY2ZnLmggCmIvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvaW5mcmFjZmcuaAppbmRleCA0NjE1YTIyOGRhNTEuLjk0ZjBmMzM4Y2U0OSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvaW5mcmFjZmcuaAorKysgYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9pbmZyYWNmZy5oCkBAIC0xNDcsNiArMTQ3LDkgQEAK
ICAjZGVmaW5lIElORlJBX1RPUEFYSV9QUk9URUNURU5fU0VUCQkweDAyNjAKICAjZGVmaW5lIElO
RlJBX1RPUEFYSV9QUk9URUNURU5fQ0xSCQkweDAyNjQKCisjZGVmaW5lIE1UODE5Ml9JTkZSQV9D
VFJMCQkJMHgyOTAKKyNkZWZpbmUgTVQ4MTkyX0lORlJBX0NUUkxfRElTQUJMRV9NRkcyQUNQCUJJ
VCg5KQorCiAgI2RlZmluZSBSRUdfSU5GUkFfTUlTQwkJCQkweGYwMAogICNkZWZpbmUgRl9ERFJf
NEdCX1NVUFBPUlRfRU4JCQlCSVQoMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
