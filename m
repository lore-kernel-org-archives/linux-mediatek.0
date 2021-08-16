Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BDCC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:27:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C6F606A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 23:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8C6F606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+yiD1RYzzw5LKnMwo+OkJfVKU9BtO5vX6hjtCO+Ems=; b=q8Hz1Tg5zSrvuW
	kDtpzthtSR5C/cC+PEikeC4jXQ33rBZnLkIsicUNHvkwwxZOGzv2vZ6HRRbjLLaGiD3IwqEoN+LM7
	rUXR69iM2Mr8SMUgNv277l3HoomFyQsoMYuUL8KpJ0tCYTgMuREceIyQ2Hy081w1XgrwCSarpBcpj
	q5HDqDgVL8m5Q55lLiEek3dxTu2mKgYszAKgqJVbyEOH/Gqxe6l8iJKDK6d7SkTo9qC9re/gyHfiJ
	8IpMxFaB6ptk2WUYz1dKL2LMOPKKgN4GHTxPBNBPUSg1eauoNVjpJIB93KyfjctUmH1aLLPaYRn7o
	K6IvS4arsx4nXa/I04DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFm0p-000VOV-2p; Mon, 16 Aug 2021 23:27:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFm0l-000VND-SF
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 23:27:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7696660F35
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629156439;
 bh=U+MTjFl11/u6xWB5BtdpYzmlHyUzJu+Q8daScItw0Cg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A2RgO34IRtApOCJOXYxbRBREd17xQ2HUWdu10XS8ulaG8rBlRUDGRZ+R+qUqfODfI
 gjb866yPoy4xFUhm2NAxTmIwRsgD1Ay1MQdbR0elSi/I2xIZpVNMCGS1QuiPHOXaj2
 mLT61UTKGrRyNB4Z6Oev6mTD0RBz2ckCFalLhNx/S/nhCP7w6MsHZ7XNwQSGzWNWog
 4+LSv/a4stoSL7cbQRXavL54lH/oQRyRxoXZOVM1TQTcgLWNK8XJ58fpTIxV8s1BIV
 7f8jZmxAKe1zuzuzmHM6AwtsI2VLr8M2V+wj+yxPuShuzOyySYkF35I2QMcdHFbH57
 tZx21rKK9lfXA==
Received: by mail-ej1-f44.google.com with SMTP id gt38so13696454ejc.13
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 16:27:19 -0700 (PDT)
X-Gm-Message-State: AOAM5313drc7sm15N7Ky4MPxSAvZ67HrTFEucQGayp3t+zxl0/Rqk67f
 59EAgaOQwMa7m6vMNmIy2FpiHkJTJOGvsjDB+g==
X-Google-Smtp-Source: ABdhPJyD+UWc6ujt6+2QoBzqcFvrFIljTxCdUtCJLgv8gpSXwT3xdKp5M8OnSqQNETP997kqpRL9qHCiH/UBZd1uGUk=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr579077ejk.75.1629156438042; 
 Mon, 16 Aug 2021 16:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210815235510.6597-1-chunkuang.hu@kernel.org>
 <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
In-Reply-To: <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Aug 2021 07:27:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LZDtrM8QBN01q++tcMo0eTHv2GB=QO834L9XJo-vZEw@mail.gmail.com>
Message-ID: <CAAOTY_8LZDtrM8QBN01q++tcMo0eTHv2GB=QO834L9XJo-vZEw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.15
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_162719_996182_54862B08 
X-CRM114-Status: GOOD (  19.66  )
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

SGksIERhdmU6CgpEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IOaWvCAyMDIx5bm0OOac
iDE25pelIOmAseS4gCDkuIvljYgyOjA35a+r6YGT77yaCj4KPiAgIENDIFtNXSAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5vCj4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJu
ZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmM6MjU3OjEz
Ogo+IHdhcm5pbmc6IOKAmG10a19kcm1fY21kcV9wa3RfZGVzdHJveeKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZAo+IFstV3VudXNlZC1mdW5jdGlvbl0KPiAgIDI1NyB8IHN0YXRpYyB2b2lkIG10a19k
cm1fY21kcV9wa3RfZGVzdHJveShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLAo+IHN0cnVjdCBjbWRx
X3BrdCAqcGt0KQo+ICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmM6MjI5OjEyOgo+IHdhcm5pbmc6IOKAmG10a19kcm1fY21kcV9w
a3RfY3JlYXRl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkCj4gWy1XdW51c2VkLWZ1bmN0aW9uXQo+
ICAgMjI5IHwgc3RhdGljIGludCBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0ZShzdHJ1Y3QgbWJveF9j
aGFuICpjaGFuLAo+IHN0cnVjdCBjbWRxX3BrdCAqcGt0LAo+ICAgICAgIHwgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgTEQgW01dICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbWVkaWF0ZWstZHJtLm8KPgo+IFdhcm5pbmcgd2hlbiBidWlsdCB3aXRoIENPTkZJR19NVEtf
Q01EUSB0dXJuZWQgb2ZmLiBDYW4geW91IHBsZWFzZSBmaXgKPiB0aGF0IGFuZCByZXNlbmQ/CgpJ
J3ZlIHJlc2VudCB0aGUgdjIgcmVxdWVzdC4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbnQuCgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IERhdmUuCj4KPiBPbiBNb24sIDE2IEF1ZyAyMDIxIGF0
IDA5OjU1LCBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gSGksIERhdmUgJiBEYW5pZWw6Cj4gPgo+ID4gVGhpcyBpbmNsdWRlczoKPiA+Cj4gPiAx
LiBNVDgxMzMgQUFMIHN1cHBvcnQsIGFkanVzdCByZG1hIGZpZm8gdGhyZXNob2xkIGZvcm11bGEu
Cj4gPiAyLiBJbXBsZW1lbnQgbW1hcCBhcyBHRU0gb2JqZWN0IGZ1bmN0aW9uLgo+ID4gMy4gQWRk
IHN1cHBvcnQgZm9yIE1UODE2Ny4KPiA+IDQuIFRlc3QgY29tcG9uZW50IGluaXRpYWxpemF0aW9u
IGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uIG10a19kcm1fY3J0Y19jcmVhdGUuCj4gPiA1LiBDTURR
IHJlZmluZW1lbnQuCj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4KPiA+
IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTczZjBmMGVlNzU0MTE3MWQ4OWYy
ZTI0OTExMzBjNzc3MWJhNThkMzoKPiA+Cj4gPiAgIExpbnV4IDUuMTQtcmMxICgyMDIxLTA3LTEx
IDE1OjA3OjQwIC0wNzAwKQo+ID4KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0Ogo+ID4KPiA+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdCB0YWdzL21lZGlhdGVrLWRybS1uZXh0LTUu
MTUKPiA+Cj4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmU3ZGNkOTI2NDRiYWVi
ZGIxMzdlM2FmOTAwMDY0Y2VlYmNhY2EyMzoKPiA+Cj4gPiAgIGRybS9tZWRpYXRlazogQ2xlYXIg
cGVuZGluZyBmbGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9uZSAoMjAyMS0wOC0xMiAwODoxNjoy
NCArMDgwMCkKPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBNZWRpYXRlayBEUk0gTmV4dCBmb3IgTGludXgg
NS4xNQo+ID4KPiA+IDEuIE1UODEzMyBBQUwgc3VwcG9ydCwgYWRqdXN0IHJkbWEgZmlmbyB0aHJl
c2hvbGQgZm9ybXVsYS4KPiA+IDIuIEltcGxlbWVudCBtbWFwIGFzIEdFTSBvYmplY3QgZnVuY3Rp
b24uCj4gPiAzLiBBZGQgc3VwcG9ydCBmb3IgTVQ4MTY3Lgo+ID4gNC4gVGVzdCBjb21wb25lbnQg
aW5pdGlhbGl6YXRpb24gZWFybGllciBpbiB0aGUgZnVuY3Rpb24gbXRrX2RybV9jcnRjX2NyZWF0
ZS4KPiA+IDUuIENNRFEgcmVmaW5lbWVudC4KPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBDaHVuLUt1YW5n
IEh1ICg0KToKPiA+ICAgICAgIGRybS9tZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sg
aW5zdGVhZCBvZiBjbWRxX3Rhc2tfY2IKPiA+ICAgICAgIGRybS9tZWRpYXRlazogUmVtb3ZlIHN0
cnVjdCBjbWRxX2NsaWVudAo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBEZXRlY3QgQ01EUSBleGVj
dXRpb24gdGltZW91dAo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBBZGQgY21kcV9oYW5kbGUgaW4g
bXRrX2NydGMKPiA+Cj4gPiBEYWZuYSBIaXJzY2hmZWxkICgxKToKPiA+ICAgICAgIGRybS9tZWRp
YXRlazogVGVzdCBjb21wb25lbnQgaW5pdGlhbGl6YXRpb24gZWFybGllciBpbiB0aGUgZnVuY3Rp
b24gbXRrX2RybV9jcnRjX2NyZWF0ZQo+ID4KPiA+IEZhYmllbiBQYXJlbnQgKDIpOgo+ID4gICAg
ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkc2k6IGFkZCBkb2N1bWVudGF0aW9u
IGZvciBNVDgxNjcgU29DCj4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IEFkZCBzdXBwb3J0IGZvciBt
YWluIEREUCBwYXRoIG9uIE1UODE2Nwo+ID4KPiA+IFRob21hcyBaaW1tZXJtYW5uICgxKToKPiA+
ICAgICAgIGRybS9tZWRpYXRlazogSW1wbGVtZW50IG1tYXAgYXMgR0VNIG9iamVjdCBmdW5jdGlv
bgo+ID4KPiA+IFlvbmdxaWFuZyBOaXUgKDQpOgo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBBZGp1
c3QgcmRtYSBmaWZvIHRocmVzaG9sZCBjYWxjdWxhdGUgZm9ybXVsYQo+ID4gICAgICAgZHJtL21l
ZGlhdGVrOiBTZXBhcmF0ZSBhYWwgc3ViIGRyaXZlcgo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBB
ZGQgbXQ4MTgzIGFhbCBzdXBwb3J0Cj4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IENsZWFyIHBlbmRp
bmcgZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRvbmUKPiA+Cj4gPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICAgfCAgIDIgKy0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyAgICAgICAgICAgIHwgMTY3
ICsrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2Rydi5oICAgICAgICAgICAgfCAgIDkgKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfcmRtYS5jICAgICAgICAgICB8ICAgNiArLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICAgICAgIHwgMTczICsrKysrKysrKysrKysr
KysrLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
ICAgICAgIHwgIDQyICstLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMgICAgICAgICAgICAgfCAgNTkgKysrKystLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5oICAgICAgICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyAgICAgICAgICAgICB8ICA0NCArKy0tLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uaCAgICAgICAgICAgICB8ICAgMyAt
Cj4gPiAgMTEgZmlsZXMgY2hhbmdlZCwgMzg2IGluc2VydGlvbnMoKyksIDEyMyBkZWxldGlvbnMo
LSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2FhbC5jCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
