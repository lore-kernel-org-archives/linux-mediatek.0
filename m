Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED3EC2BA19
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 11:54:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F4320732
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 11:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kzOn1u9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F4320732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Deq4IOKvxDhCv4PGU7PTi//uGnsAXHl7EPUIQqQDr80=; b=kzOn1u9Re6z9HcGr5ZgSrOrvA
	EErf2dJGn8CUCwah/Xs/92S1wn8gGgdTBfDPBLrO1egSNyne+NWIIf+D00EM+hbGHPb3aJn592AkI
	gpZlrs451QXNiUCpA0uJRwdJSy3aVgKL/9W0UywFp4ua8IAafonluSuAywnKhOpHy1rgooyB5tkKf
	Ar04Rp3mTBypHWD7XYmKyckqIO/SdPjpuQZkCzJSHnBJaBjXc9nCvI28WVVweTr/mrx6hr+PE0TBi
	0j/voTvpbL8Tk1KS2BDAa7H24PfbV8+7PvjH3NKTiWSt+RvSDuW0NrjmmsJ+BYzfOS1cZm9eqXpb/
	QoCZQRp6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOgck-00066s-2O; Wed, 15 Apr 2020 11:54:34 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOgcR-0005ik-23; Wed, 15 Apr 2020 11:54:17 +0000
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 15 Apr 2020
 19:54:57 +0800
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
From: Xingyu Chen <xingyu.chen@amlogic.com>
To: Evan Benn <evanbenn@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
Message-ID: <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
Date: Wed, 15 Apr 2020 19:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
Content-Language: en-GB
X-Originating-IP: [10.28.39.241]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_045415_519101_65F139D1 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksRXZhbgoKT24gMjAyMC80LzExIDIzOjA2LCBYaW5neXUgQ2hlbiB3cm90ZToKPiBIaSwgRXZh
bgo+IAo+IE9uIDIwMjAvNC8zIDE0OjA0LCBFdmFuIEJlbm4gd3JvdGU6Cj4+IEFwb2xvZ2llcyBJ
IGZvcmdvdCB0byBhZGQgdGhpcyBub3RlIHRvIG15IGNvdmVyIGxldHRlci4KPj4KPj4gWGluZ3l1
IGRvIHlvdSBtaW5kIHNlZWluZyBpZiB5b3UgY2FuIG1vZGlmeSB5b3VyIEFURiBmaXJtd2FyZSB0
byBtYXRjaCAKPj4gdGhpcyBkcml2ZXI/Cj4+IFdlIGNhbiBhZGQgYSBjb21wYXRpYmxlIG9yIG1h
a2Ugb3RoZXIgY2hhbmdlcyB0byBzdWl0IHlvdS4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ggWzBd
LMKgIEkgd2lsbCB0ZXN0IHRoaXMgcGF0Y2ggb24gdGhlIG1lc29uLUExIAo+IHBsYXRmb3JtLCBi
dXQgSXQgbG9va3MgbW9yZQo+IGNvbnZlbmllbnQgdG8gYmUgY29tcGF0aWJsZSB3aXRoIG90aGVy
IHBsYXRmb3JtcyBpZiB1c2luZyB0aGUgY29tcGF0aWJsZSAKPiBzdHJpbmdzIHRvIGNvcnJlbGF0
ZQo+IHBsYXRmb3JtIGRpZmZlcmVuY2VzIGluY2x1ZGUgZnVuY3Rpb24gSUQgYW5kIHdkdF9vcHMu
Cj4gCj4gWzBdOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNDcxODI5LwoK
SSBoYXZlIHRlc3RlZCB5b3VyIHBhdGNoIG9uIHRoZSBtZXNvbi1BMSwgYnV0IEkgdXNlIHRoZSBj
b21wYXRpYmxlIApzdHJpbmdzIHRvIGNvcnJlbGF0ZSB0aGUgZm9sbG93aW5nIHBsYXRmb3JtIGRp
ZmZlcmVuY2Vz77yMaXQgd29ya3Mgbm9ybWFsbHkuCgpzdGF0aWMgY29uc3Qgc3RydWN0IHNtY3dk
X2RhdGEgc21jd2RfbXRrX2RhdGEgPSB7CgkuZnVuY19pZCA9IDB4ODIwMDNkMDYsCgkub3BzICAg
ICA9ICZzbWN3ZF9vcHMsCn0KCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgc21jd2RfZGF0YSBzbWN3ZF9t
ZXNvbl9kYXRhID0gewoJLmZ1bmNfaWQgPSAweDgyMDAwMDg2LAoJLm9wcyAgICAgPSAmc21jd2Rf
dGltZWxlZnRfb3BzLAp9CgpJbiBhZGRpdGlvbiwgSXQgbG9va3MgbW9yZSByZWFzb25hYmxlIHRv
IHVzZSB0aGUgIm1zZWMiIGFzIHRoZSB1bml0IG9mIAp0aW1lb3V0IHBhcmFtZXRlciBmb3IgdGhl
IEFURiBmdyBpbnRlcmZhY2Ugd2l0aCBTTUNXRF9TRVRfVElNRU9VVDoKCi0gVGhlIGZ3IGludGVy
ZmFjZSB3aWxsIGNvbXBhdGlibGUgd2l0aCB0aGUgdWJvb3QgZ2VuZXJpYyB3YXRjaGRvZyAKaW50
ZXJmYWNlIGF0IFswXSwgYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8gY29udmVydCB0aW1lb3V0IGZy
b20gbXNlYwp0byBzZWMuCgotIFNvbWUgdmVuZG9yJ3Mgd2F0Y2hkb2cgbWF5IGJlIG5vdCBzdXBw
b3J0IHRoZSAid2R0X3RyaWdnZXJfcmVzZXQiIApyZXNldCBvcGVyYXRpb24sIGJ1dCB0aGV5IGNh
biB1c2UgdGhlIG1ldGhvZCBiZWxvdyB0byByZXNldCB0aGUgc3lzdGVtCmJ5IHRoZSB3YXRjaGRv
ZyByaWdodCBub3cuCgp3YXRjaGRvZ19zZXRfdGltZSgxKTsgIC8vMW1zCndhdGNoZG9nX2VuYWJs
ZSgpOwoKWzBdOiAKaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi9t
YXN0ZXIvZHJpdmVycy93YXRjaGRvZy93ZHQtdWNsYXNzLmMKCkJlc3QgUmVnYXJkcwo+PiBUaGFu
a3MKPj4KPj4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA0OjI5IFBNIEV2YW4gQmVubiA8ZXZhbmJl
bm5AY2hyb21pdW0ub3JnIAo+PiA8bWFpbHRvOmV2YW5iZW5uQGNocm9taXVtLm9yZz4+IHdyb3Rl
Ogo+Pgo+PiAgICAgVGhpcyBpcyBjdXJyZW50bHkgc3VwcG9ydGVkIGluIGZpcm13YXJlIGRlcGxv
eWVkIG9uIG9haywgaGFuYSBhbmQKPj4gICAgIGVsbSBtdDgxNzMKPj4gICAgIGNocm9tZWJvb2sg
ZGV2aWNlcy4gVGhlIGtlcm5lbCBkcml2ZXIgaXMgd3JpdHRlbiB0byBiZSBhIGdlbmVyaWMgU01D
Cj4+ICAgICB3YXRjaGRvZyBkcml2ZXIuCj4+Cj4+ICAgICBBcm0gVHJ1c3RlZCBGaXJtd2FyZSB1
cHN0cmVhbWluZyByZXZpZXc6Cj4+ICAgICBodHRwczovL3Jldmlldy50cnVzdGVkZmlybXdhcmUu
b3JnL2MvVEYtQS90cnVzdGVkLWZpcm13YXJlLWEvKy8zNDA1Cj4+Cj4+ICAgICBQYXRjaCB0byBh
ZGQgb2FrLCBoYW5hLCBlbG0gZGV2aWNlIHRyZWU6Cj4+ICAgICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjAwMTEwMDczNzMwLjIxMzc4OS0xLWhzaW55aUBjaHJv
bWl1bS5vcmcvCj4+ICAgICBJIHdvdWxkIGxpa2UgdG8gYWRkIHRoZSBkZXZpY2UgdHJlZSBzdXBw
b3J0IGFmdGVyIHRoZSBhYm92ZSBwYXRjaCBpcwo+PiAgICAgYWNjZXB0ZWQuCj4+Cj4+ICAgICBD
aGFuZ2VzIGluIHYzOgo+PiAgICAgLSBDaGFuZ2UgbmFtZSBiYWNrIHRvIGFybQo+PiAgICAgLSBB
ZGQgb3B0aW9uYWwgZ2V0X3RpbWVsZWZ0IG9wCj4+ICAgICAtIGNoYW5nZSBuYW1lIHRvIGFybV9z
bWNfd2R0Cj4+Cj4+ICAgICBDaGFuZ2VzIGluIHYyOgo+PiAgICAgLSBDaGFuZ2UgbmFtZSBhcm0g
PiBtdDgxNzMKPj4gICAgIC0gdXNlIHdhdGNoZG9nX3N0b3Bfb25fcmVib290Cj4+ICAgICAtIHVz
ZSB3YXRjaGRvZ19zdG9wX29uX3VucmVnaXN0ZXIKPj4gICAgIC0gdXNlIGRldm1fd2F0Y2hkb2df
cmVnaXN0ZXJfZGV2aWNlCj4+ICAgICAtIHJlbW92ZSBzbWN3ZF9zaHV0ZG93biwgc21jd2RfcmVt
b3ZlCj4+ICAgICAtIGNoYW5nZSBlcnJvciBjb2Rlcwo+Pgo+PiAgICAgRXZhbiBCZW5uICgxKToK
Pj4gICAgIMKgIGR0LWJpbmRpbmdzOiB3YXRjaGRvZzogQWRkIEFSTSBzbWMgd2R0IGZvciBtdDgx
NzMgd2F0Y2hkb2cKPj4KPj4gICAgIEp1bGl1cyBXZXJuZXIgKDEpOgo+PiAgICAgwqAgd2F0Y2hk
b2c6IEFkZCBuZXcgYXJtX3NtZF93ZHQgd2F0Y2hkb2cgZHJpdmVyCj4+Cj4+ICAgICDCoC4uLi9i
aW5kaW5ncy93YXRjaGRvZy9hcm0tc21jLXdkdC55YW1swqAgwqAgwqAgwqAgfMKgIDMwICsrKwo+
PiAgICAgwqBNQUlOVEFJTkVSU8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIMKgNyArCj4+ICAgICDCoGFyY2gvYXJtNjQvY29uZmlncy9kZWZj
b25maWfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAxICsKPj4gICAgIMKgZHJpdmVy
cy93YXRjaGRvZy9LY29uZmlnwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEz
ICsrCj4+ICAgICDCoGRyaXZlcnMvd2F0Y2hkb2cvTWFrZWZpbGXCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoDEgKwo+PiAgICAgwqBkcml2ZXJzL3dhdGNoZG9nL2FybV9zbWNf
d2R0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDE4MQo+PiAgICAgKysrKysrKysrKysrKysr
KysrCj4+ICAgICDCoDYgZmlsZXMgY2hhbmdlZCwgMjMzIGluc2VydGlvbnMoKykKPj4gICAgIMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4+ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvYXJtLXNtYy13ZHQueWFtbAo+PiAgICAgwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jCj4+Cj4+ICAgICAtLSAKPj4gICAgIDIuMjYu
MC4yOTIuZzMzZWY2YjJmMzgtZ29vZwo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
