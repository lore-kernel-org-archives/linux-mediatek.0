Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71019C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:16:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE8422222C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEZd+ssw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE8422222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zZDNtqG15440dgiHX1RgL8zFQTQ3sewA5H5nNVQ7JY4=; b=oEZd+sswJQHI+N11qgom1bXqt
	Tex+2+eB5oBboaWNZjO5/seTqYpy5ewUCpLetJPDEyKZeVX5OikBz8Nbm/RRPqksr+/mPZv9dotog
	UtGrO6wQDFOEGS+8i2KTRHXdlEJF/C/LozoBQGVEYwMh2mgwbzX4MhxCAF2koCqjeY7xLkB44OqIw
	6/cHtuUfjewEPVvykpJskUM3qPAuXW8lISegX/wibJokeRobtHeEhUDxrQzYcoguNmhsHyn+V6C1E
	wjAk+EYj4DCLLlaRZK+/p3/xMCaqXsN7s5zfbNdraJLkx9J28EcyyQISfyR/yo9hpLc9mDMQbU9ur
	HWPa9Xd/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX4Es-0002a2-Gl; Mon, 26 Oct 2020 15:16:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX4El-0002XS-1L; Mon, 26 Oct 2020 15:16:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 27E241F44A65
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 07/12] soc: mediatek: pm-domains: Add extra sram control
To: Matthias Brugger <mbrugger@suse.com>, linux-kernel@vger.kernel.org
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-8-enric.balletbo@collabora.com>
 <277b1656-4a64-4fdd-865d-88cf253b7b0e@suse.com>
Message-ID: <59d2decc-029a-709b-7796-fc9f370b67c6@collabora.com>
Date: Mon, 26 Oct 2020 16:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <277b1656-4a64-4fdd-865d-88cf253b7b0e@suse.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_111643_199315_A32DE62B 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgpPbiAxMC85LzIwIDIwOjI3LCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOgo+
IAo+IAo+IE9uIDEwLzA5LzIwMjAgMTk6MjgsIEVucmljIEJhbGxldGJvIGkgU2VycmEgd3JvdGU6
Cj4+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+Pgo+PiBGb3Ig
c29tZSBwb3dlciBkb21haW5zIGxpa2UgdnB1X2NvcmUgb24gTVQ4MTgzIHdob3NlIHNyYW0gbmVl
ZCB0byBkbyBjbG9jawo+PiBhbmQgaW50ZXJuYWwgaXNvbGF0aW9uIHdoaWxlIHBvd2VyIG9uL29m
ZiBzcmFtLiBXZSBhZGQgYSBjYXAKPj4gIk1US19TQ1BEX1NSQU1fSVNPIiB0byBqdWRnZSBpZiB3
ZSBuZWVkIHRvIGRvIHRoZSBleHRyYSBzcmFtIGlzb2xhdGlvbgo+PiBjb250cm9sIG9yIG5vdC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9t
YWlucy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmMKPj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG0tZG9tYWlucy5jCj4+IGluZGV4IDNhYTQzMGE2MDYwMi4uMDgwMmVjY2MzYTBiIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5jCj4+ICsr
KyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmMKPj4gQEAgLTIxLDYgKzIx
LDcgQEAKPj4gwqAgwqAgI2RlZmluZSBNVEtfU0NQRF9BQ1RJVkVfV0FLRVVQwqDCoMKgwqDCoMKg
wqAgQklUKDApCj4+IMKgICNkZWZpbmUgTVRLX1NDUERfRldBSVRfU1JBTcKgwqDCoMKgwqDCoMKg
IEJJVCgxKQo+PiArI2RlZmluZSBNVEtfU0NQRF9TUkFNX0lTT8KgwqDCoMKgwqDCoMKgIEJJVCgy
KQo+PiDCoCAjZGVmaW5lIE1US19TQ1BEX0NBUFMoX3NjcGQsIF94KcKgwqDCoCAoKF9zY3BkKS0+
ZGF0YS0+Y2FwcyAmIChfeCkpCj4+IMKgIMKgICNkZWZpbmUgU1BNX1ZERV9QV1JfQ09OwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDAyMTAKPj4gQEAgLTQyLDYgKzQzLDggQEAKPj4gwqAgI2RlZmlu
ZSBQV1JfT05fQklUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoMikKPj4gwqAgI2RlZmluZSBQ
V1JfT05fMk5EX0JJVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDMpCj4+IMKgICNkZWZpbmUg
UFdSX0NMS19ESVNfQklUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoNCkKPj4gKyNkZWZpbmUg
UFdSX1NSQU1fQ0xLSVNPX0JJVMKgwqDCoMKgwqDCoMKgIEJJVCg1KQo+PiArI2RlZmluZSBQV1Jf
U1JBTV9JU09JTlRfQl9CSVTCoMKgwqDCoMKgwqDCoCBCSVQoNikKPj4gwqAgwqAgI2RlZmluZSBQ
V1JfU1RBVFVTX0RJU1DCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgzKQo+PiDCoCAjZGVmaW5l
IFBXUl9TVEFUVVNfTUZHwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoNCkKPj4gQEAgLTE2Miw2
ICsxNjUsMTQgQEAgc3RhdGljIGludCBzY3BzeXNfc3JhbV9lbmFibGUoc3RydWN0IHNjcHN5c19k
b21haW4gKnBkLAo+PiB2b2lkIF9faW9tZW0gKmN0bF9hZGRyKQo+PiDCoMKgwqDCoMKgIGlmIChy
ZXQgPCAwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgK8KgwqDCoCBp
ZiAoTVRLX1NDUERfQ0FQUyhwZCwgTVRLX1NDUERfU1JBTV9JU08pKcKgwqDCoCB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCB2YWwgPSByZWFkbChjdGxfYWRkcikgfCBQV1JfU1JBTV9JU09JTlRfQl9CSVQ7
Cj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwodmFsLCBjdGxfYWRkcik7Cj4+ICvCoMKgwqDCoMKg
wqDCoCB1ZGVsYXkoMSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgJj0gflBXUl9TUkFNX0NMS0lT
T19CSVQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwodmFsLCBjdGxfYWRkcik7Cj4+ICvCoMKg
wqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAgQEAgLTE3MSw4
ICsxODIsMTUgQEAgc3RhdGljIGludCBzY3BzeXNfc3JhbV9kaXNhYmxlKHN0cnVjdCBzY3BzeXNf
ZG9tYWluCj4+ICpwZCwgdm9pZCBfX2lvbWVtICpjdGxfYWRkcikKPj4gwqDCoMKgwqDCoCB1MzIg
dmFsOwo+PiDCoMKgwqDCoMKgIGludCB0bXA7Cj4+IMKgIC3CoMKgwqAgdmFsID0gcmVhZGwoY3Rs
X2FkZHIpOwo+PiAtwqDCoMKgIHZhbCB8PSBwZC0+ZGF0YS0+c3JhbV9wZG5fYml0czsKPj4gK8Kg
wqDCoCBpZiAoTVRLX1NDUERfQ0FQUyhwZCwgTVRLX1NDUERfU1JBTV9JU08pKcKgwqDCoCB7Cj4+
ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSByZWFkbChjdGxfYWRkcikgfCBQV1JfU1JBTV9DTEtJU09f
QklUOwo+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVsKHZhbCwgY3RsX2FkZHIpOwo+PiArwqDCoMKg
wqDCoMKgwqAgdmFsICY9IH5QV1JfU1JBTV9JU09JTlRfQl9CSVQ7Cj4+ICvCoMKgwqDCoMKgwqDC
oCB3cml0ZWwodmFsLCBjdGxfYWRkcik7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1ZGVsYXkoMSk7Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgdmFsID0gcmVhZGwoY3RsX2FkZHIpIHwgcGQtPmRh
dGEtPnNyYW1fcGRuX2JpdHM7Cj4gCj4gTml0LCBJJ2QgcHJlZmVyOgo+IHZhbCA9IHJlYWRsKGN0
bF9hZGRyKTsKPiB2YWwgfD0gcGQtPmRhdGEtPnNyYW1fcGRuX2JpdHM7Cj4gCgpkb25lIGluIG5l
eHQgdmVyc2lvbi4KCj4gCj4+IMKgwqDCoMKgwqAgd3JpdGVsKHZhbCwgY3RsX2FkZHIpOwo+PiDC
oCDCoMKgwqDCoMKgIC8qIEVpdGhlciB3YWl0IHVudGlsIFNSQU1fUEROX0FDSyBhbGwgMSBvciAw
ICovCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
