Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49605C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 12:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1450761002
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 12:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1450761002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBsx6hcKm51dR9CKblkZ5lmAHv2LsHwg9q6NuuXBAVM=; b=wLMJ5qAtS9GfuK
	EBBoCO9N39o21YvJlyY6/mywtDk/qWSo5yiXa2yNmYX5bI8ZslNW+YZVPEODSXWsQGrA9g4jSOkae
	7Hug8+LNQ8UrRj9AID1URY0PzqbbIvcdSbfBAnFtcVs6jAaEl//ErYBa3XiEJsSKohSSh/u+UPW24
	8rI5IYubb6v0tJ+4ebaU8/PRUVPHLmfjJkVJbFB2uL/7UADfREgo7TUwLTW4qgNN8LyfuEf+PpWfJ
	2omllvsItnMvX6MEPBet359N2W/x/CUU8xIiFxEq1MH5B3jXo05ClqT82iJUCUBzM26zQTFO1rcOH
	AjpSvBZ90YvPcZa8pmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw1nc-00AZsK-Hz; Wed, 23 Jun 2021 12:16:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw1nY-00AZrU-7o; Wed, 23 Jun 2021 12:16:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69258ED1;
 Wed, 23 Jun 2021 05:15:57 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC093F718;
 Wed, 23 Jun 2021 05:15:57 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id DA9E16837C9; Wed, 23 Jun 2021 13:15:55 +0100 (BST)
Date: Wed, 23 Jun 2021 13:15:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com,
 benjamin.gaignard@linaro.org, mihail.atanassov@arm.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org,
 hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com,
 tiantao6@hisilicon.com, shawnguo@kernel.org
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210623121555.ttos325zjt55dynw@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
 <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
 <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_051604_409435_97FBC950 
X-CRM114-Status: GOOD (  40.32  )
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

SGkgVGhvbWFzLAoKT24gV2VkLCBKdW4gMjMsIDIwMjEgYXQgMDg6NDM6MDdBTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkgTGl2aXUKPiAKPiBBbSAyMi4wNi4yMSB1bSAxNzoy
NSBzY2hyaWViIExpdml1IER1ZGF1Ogo+ID4gSGVsbG8sCj4gPiAKPiA+IE9uIFR1ZSwgSnVuIDIy
LCAyMDIxIGF0IDA0OjA5OjQ0UE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4g
PiBGb3IgS01TIGRyaXZlcnMsIHJlcGxhY2UgdGhlIElSUSBjaGVjayBpbiBWQkxBTksgaW9jdGxz
IHdpdGggYSBjaGVjayBmb3IKPiA+ID4gdmJsYW5rIHN1cHBvcnQuIElSUXMgbWlnaHQgYmUgZW5h
YmxlZCB3dGhvdXQgdmJsYW5raW5nIGJlaW5nIHN1cHBvcnRlZC4KPiA+ID4gCj4gPiA+IFRoaXMg
Y2hhbmdlIGFsc28gcmVtb3ZlcyB0aGUgRFJNIGZyYW1ld29yaydzIG9ubHkgZGVwZW5kZW5jeSBv
biBJUlEgc3RhdGUKPiA+ID4gZm9yIG5vbi1sZWdhY3kgZHJpdmVycy4gRm9yIGxlZ2FjeSBkcml2
ZXJzIHdpdGggdXNlcnNwYWNlIG1vZGVzZXR0aW5nLAo+ID4gPiB0aGUgb3JpZ2luYWwgdGVzdCBy
ZW1haW5zIGluIGRybV93YWl0X3ZibGFua19pb2N0bCgpLgo+ID4gPiAKPiA+ID4gdjI6Cj4gPiA+
IAkqIGtlZXAgdGhlIG9sZCB0ZXN0IGZvciBsZWdhY3kgZHJpdmVycyBpbgo+ID4gPiAJICBkcm1f
d2FpdF92YmxhbmtfaW9jdGwoKSAoRGFuaWVsKQo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiA+IC0tLQo+ID4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMgICAgfCAxMCArKystLS0tLS0tCj4gPiA+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDEzICsrKysrKysrKy0tLS0KPiA+ID4gICAyIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2lycS5jCj4gPiA+IGluZGV4IGMzYmQ2NjRlYTczMy4uMWQ3Nzg1NzIxMzIzIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1faXJxLmMKPiA+ID4gQEAgLTc0LDEwICs3NCw4IEBACj4gPiA+ICAgICog
b25seSBzdXBwb3J0cyBkZXZpY2VzIHdpdGggYSBzaW5nbGUgaW50ZXJydXB0IG9uIHRoZSBtYWlu
IGRldmljZSBzdG9yZWQgaW4KPiA+ID4gICAgKiAmZHJtX2RldmljZS5kZXYgYW5kIHNldCBhcyB0
aGUgZGV2aWNlIHBhcmFtdGVyIGluIGRybV9kZXZfYWxsb2MoKS4KPiA+ID4gICAgKgo+ID4gPiAt
ICogVGhlc2UgSVJRIGhlbHBlcnMgYXJlIHN0cmljdGx5IG9wdGlvbmFsLiBEcml2ZXJzIHdoaWNo
IHJvbGwgdGhlaXIgb3duIG9ubHkKPiA+ID4gLSAqIG5lZWQgdG8gc2V0ICZkcm1fZGV2aWNlLmly
cV9lbmFibGVkIHRvIHNpZ25hbCB0aGUgRFJNIGNvcmUgdGhhdCB2YmxhbmsKPiA+ID4gLSAqIGlu
dGVycnVwdHMgYXJlIHdvcmtpbmcuIFNpbmNlIHRoZXNlIGhlbHBlcnMgZG9uJ3QgYXV0b21hdGlj
YWxseSBjbGVhbiB1cCB0aGUKPiA+ID4gLSAqIHJlcXVlc3RlZCBpbnRlcnJ1cHQgbGlrZSBlLmcu
IGRldm1fcmVxdWVzdF9pcnEoKSB0aGV5J3JlIG5vdCByZWFsbHkKPiA+ID4gKyAqIFRoZXNlIElS
USBoZWxwZXJzIGFyZSBzdHJpY3RseSBvcHRpb25hbC4gU2luY2UgdGhlc2UgaGVscGVycyBkb24n
dCBhdXRvbWF0aWNhbGx5Cj4gPiA+ICsgKiBjbGVhbiB1cCB0aGUgcmVxdWVzdGVkIGludGVycnVw
dCBsaWtlIGUuZy4gZGV2bV9yZXF1ZXN0X2lycSgpIHRoZXkncmUgbm90IHJlYWxseQo+ID4gPiAg
ICAqIHJlY29tbWVuZGVkLgo+ID4gPiAgICAqLwo+ID4gPiBAQCAtOTEsOSArODksNyBAQAo+ID4g
PiAgICAqIGFuZCBhZnRlciB0aGUgaW5zdGFsbGF0aW9uLgo+ID4gPiAgICAqCj4gPiA+ICAgICog
VGhpcyBpcyB0aGUgc2ltcGxpZmllZCBoZWxwZXIgaW50ZXJmYWNlIHByb3ZpZGVkIGZvciBkcml2
ZXJzIHdpdGggbm8gc3BlY2lhbAo+ID4gPiAtICogbmVlZHMuIERyaXZlcnMgd2hpY2ggbmVlZCB0
byBpbnN0YWxsIGludGVycnVwdCBoYW5kbGVycyBmb3IgbXVsdGlwbGUKPiA+ID4gLSAqIGludGVy
cnVwdHMgbXVzdCBpbnN0ZWFkIHNldCAmZHJtX2RldmljZS5pcnFfZW5hYmxlZCB0byBzaWduYWwg
dGhlIERSTSBjb3JlCj4gPiA+IC0gKiB0aGF0IHZibGFuayBpbnRlcnJ1cHRzIGFyZSBhdmFpbGFi
bGUuCj4gPiA+ICsgKiBuZWVkcy4KPiA+ID4gICAgKgo+ID4gPiAgICAqIEBpcnEgbXVzdCBtYXRj
aCB0aGUgaW50ZXJydXB0IG51bWJlciB0aGF0IHdvdWxkIGJlIHBhc3NlZCB0byByZXF1ZXN0X2ly
cSgpLAo+ID4gPiAgICAqIGlmIGNhbGxlZCBkaXJlY3RseSBpbnN0ZWFkIG9mIHVzaW5nIHRoaXMg
aGVscGVyIGZ1bmN0aW9uLgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92
YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiA+ID4gaW5kZXggMzQxN2Ux
YWM3OTE4Li5hOThhNGFhZDUwMzcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4g
PiBAQCAtMTc0OCw4ICsxNzQ4LDEzIEBAIGludCBkcm1fd2FpdF92YmxhbmtfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4gICAJdW5zaWduZWQgaW50IHBpcGVf
aW5kZXg7Cj4gPiA+ICAgCXVuc2lnbmVkIGludCBmbGFncywgcGlwZSwgaGlnaF9waXBlOwo+ID4g
PiAtCWlmICghZGV2LT5pcnFfZW5hYmxlZCkKPiA+ID4gLQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+
ID4gPiArCWlmICAoZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9NT0RFU0VUKSkg
ewo+ID4gPiArCQlpZiAoIWRybV9kZXZfaGFzX3ZibGFuayhkZXYpKQo+ID4gPiArCQkJcmV0dXJu
IC1FT1BOT1RTVVBQOwo+ID4gPiArCX0gZWxzZSB7Cj4gPiA+ICsJCWlmICghZGV2LT5pcnFfZW5h
YmxlZCkKPiA+ID4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gKwl9Cj4gPiAKPiA+IEZv
ciBhIHN5c3RlbSBjYWxsIHRoYXQgaXMgdXNlZCBxdWl0ZSBhIGxvdCBieSB1c2Vyc3BhY2Ugd2Ug
aGF2ZSBpbmNyZWFzZWQgdGhlIGNvZGUgc2l6ZQo+ID4gaW4gYSBub3RpY2VhYmxlIHdheS4gQ2Fu
IHdlIG5vdCBjYWNoZSBpdCBwcml2YXRlbHk/Cj4gCj4gSSdtIG5vdCBxdWl0ZSBzdXJlIHRoYXQg
SSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4gVGhlIGFkZGl0aW9uYWxseSBjYWxsZWQKPiBmdW5j
dGlvbnMgYXJlIHRyaXZpYWwgb25lLWxpbmVyczsgcHJvYmFibHkgaW5saW5lZCBhbnl3YXkuCgpU
aGV5IGFyZSBpbmxpbmVkLiBIb3dldmVyIHdlIHJlcGxhY2UgdGhlIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgKHdoaWNoIGNhbiBiZSBjYWxjdWxhdGVkCmF0IGNvbXBpbGUgdGltZSBhcyBvZmZzZXQgZnJv
bSBhIGJhc2UgcG9pbnRlcikgd2l0aCB0aGUgY29kZSBpbgpkcm1fY29yZV9jaGVja19hbGxfZmVh
dHVyZXMoKSB0aGF0IGRvZXMgMyBwb2ludGVyIGRlcmVmZXJlbmNlcywgbWFza2luZyBhbmQgbG9n
aWNhbApBTkQgYmVmb3JlIGNoZWNraW5nIGZvciBtYXRjaGluZyB2YWx1ZS4KCj4gCj4gSG93ZXZl
ciwgaXJxX2VuYWJsZWQgaXMgb25seSByZWxldmFudCBmb3IgbGVnYWN5IGRyaXZlcnMgYW5kIHdp
bGwgZXZlbnR1YWxseQo+IGRpc2FwcGVhciBiZWhpbmQgQ09ORklHX0RSTV9MRUdBQ1kuIFdlIGNh
biByZXdyaXRlIHRoZSB0ZXN0IGxpa2UgdGhpczoKCkkgZ2V0IHRoZSBwb2ludCB0aGF0IGlycV9l
bmFibGVkIGlzIGxlZ2FjeS4gSG93ZXZlciB0aGUgSU9DVEwgY2FsbCBpcyBub3QgYW5kIHVzdWFs
bHkKaXMgdXNlZCBpbiB0aW1lIGNyaXRpY2FsIGNvZGUgdG8gd2FpdCBmb3IgdmJsYW5rIGJlZm9y
ZSBzdGFydGluZyB0aGUgb2xkIGJ1ZmZlcnMgZm9yCmEgbmV3IGZyYW1lLiBBdCA2MEh6IHRoYXQn
cyBwcm9iYWJseSBsZXNzIG9mIGEgY29uY2VybiwgYnV0IGF0IDEyMEh6IHJlZnJlc2ggcmF0ZSBh
bmQKcmVkdWNlZCB2YmxhbmsgdGltZSB5b3VyIHRpbWUgc2xpY2UgYWxsb2NhdGlvbiBmb3IgbmV3
IHdvcmsgbWF0dGVycy4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gCj4gaWZkZWYgQ09ORklHX0RS
TV9MRUdBQ1kKPiAgIGlmICh1bmxpa2VseShjaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0xFR0FD
WSkpKSB7Cj4gICAgIGlmICghaXJxX2VuYWJsZWQpCj4gICAgICAgcmV0dXJuOwo+ICAgfSBlbHNl
Cj4gI2VuZGlmCj4gICB7Cj4gICAgIGlmICghaGFzX3ZibGFua19zdXBwb3J0KGRldikpCj4gICAg
ICAgcmV0dXJuOwo+ICAgfQo+IAo+IEFzIENPTkZJR19EUk1fTEVHQUNZIGlzIG1vc3QgbGlrZWx5
IGRpc2FibGVkIG9uIGNvbmN1cnJlbnQgc3lzdGVtcywgd2UnZCBnZXQKPiBhIHNpbmdsZSB0ZXN0
IGZvciB0aGUgbW9kZXJuIGRyaXZlcnMuIElmIERSTV9MRUdBQ1lpcyBvbiwgdGhlIGNvbXBpbGVy
IGF0Cj4gbGVhc3Qga25vd3MgdGhhdCB0aGUgZWxzZSBicmFuY2ggaXMgcHJlZmVycmVkLgo+IAo+
IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVy
Cj4gCgoKCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZp
eCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAog
XCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
