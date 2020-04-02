Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E3DC43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 12:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A66C206F6
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 12:50:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJj7pUXp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAV4hhYy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A66C206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iry7dhPF/dO2Mm5twcgonOA0rWeMIhg3Kt13kSO8tk=; b=rJj7pUXpii03L6
	vKvDkyKkDm10SKX6fLWM3GfZo2YBkXbWPDPvge6800oOo8u2mGSs0xVAEIanBekQz+0vcdkOEIbly
	vf4fFPTTOhlbRdiVwVrL+zsbsuNRDdpebcK/nc/H4eszP7c/g+7qO/WSlnK1alAslYn5J5jbyawut
	DOsge/7lzCPu2/4G9hd9sxva42TXB/knzh6fMnnnjhRmP01Hl+t3+4LLRzdDERYiVyJQrmHGddJCv
	YO0UbAn19fbZch/fO1ADoXbxZqzVRG+BV2vPoUOp2mcGJW8l4FpwApPDQwCFNJKgLzDs5meJxmAoQ
	LuPRRqwvQnviILOkrDlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzIO-0003M0-6d; Thu, 02 Apr 2020 12:50:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzIK-0002JA-Jb
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 12:50:06 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42D2F21582
 for <linux-mediatek@lists.infradead.org>; Thu,  2 Apr 2020 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585831803;
 bh=BgurOqN8YH50Ohx6QZHMHzK9Spell372FkyiG6w8WT4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XAV4hhYyQ3GdnynfQvvooUuE8rlZ1PDG47HWS+QJfX2oYeDlIcF5/blR/duheKEBX
 4gtQgmxL20OdaRjd3jiUH+sdYOv5eo2a40h/wFiyBtAhP98z0E3Iox0vALB6GDT9Mw
 MMml7G/nQzfGIQT5WyFzTIeaTUJjArBM4SSS3Wak=
Received: by mail-ed1-f54.google.com with SMTP id z65so3973913ede.0
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 05:50:03 -0700 (PDT)
X-Gm-Message-State: AGi0PubR7XVecG9nQROFuAlGL9TvrN3fkEDpu2UhBIfI1R4Kv+j9Ki6Z
 W48h2bp5W6DfteqA5psMTeU0UlSP0AuH18kRTw==
X-Google-Smtp-Source: APiQypJuhApCgfNeVfyRBA7I1Vqx/qouVDmtjFJxSrUqEZy2eH7v73RzO/vmzS4PJe08jnen+1Vf4fAM/BVv+6B8dwg=
X-Received: by 2002:a17:906:124f:: with SMTP id
 u15mr2951082eja.360.1585831801460; 
 Thu, 02 Apr 2020 05:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-2-chunkuang.hu@kernel.org>
 <1585707361.28859.19.camel@mhfsdcap03>
 <ceae861b-b5ee-1d33-67dd-0a2ff4af2816@gmail.com>
In-Reply-To: <ceae861b-b5ee-1d33-67dd-0a2ff4af2816@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 2 Apr 2020 20:49:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8EScidYVri=fn+sdteyD1TGSZ4AnYkp7kz2RozriSk=A@mail.gmail.com>
Message-ID: <CAAOTY_8EScidYVri=fn+sdteyD1TGSZ4AnYkp7kz2RozriSk=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy
 to mtk_hdmi driver
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_055004_703897_2F64B31B 
X-CRM114-Status: GOOD (  21.71  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjDlubQ05pyIMeaXpSDpgLHkuIkg5LiL5Y2IMTE6NTPlr6vpgZPvvJoKPgo+Cj4KPiBP
biAwMS8wNC8yMDIwIDA0OjE2LCBDaHVuZmVuZyBZdW4gd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjAt
MDMtMzEgYXQgMjM6NTcgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPj4gRnJvbTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pgo+ID4+IHR6X2Rpc2FibGVkIGlzIHVzZWQgdG8g
Y29udHJvbCBtdGtfaGRtaSBvdXRwdXQgc2lnbmFsLCBidXQgdGhpcyB2YXJpYWJsZQo+ID4+IGlz
IHN0b3JlZCBpbiBtdGtfaGRtaV9waHkgYW5kIG10a19oZG1pX3BoeSBkb2VzIG5vdCB1c2UgaXQu
IFNvIG1vdmUKPiA+PiB0el9kaXNhYmxlZCB0byBtdGtfaGRtaSB3aGVyZSBpdCdzIHVzZWQuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4+IFNp
Z25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4+
IC0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgICAg
fCAyMiArKysrKysrKysrKysrKysrLS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaV9waHkuaCAgICAgICB8ICAxIC0KPiA+PiAgLi4uL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X210MjcwMV9oZG1pX3BoeS5jICAgIHwgIDEgLQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYwo+ID4+IGluZGV4IDVlNGE0ZGJkYTQ0My4uODc4NDMzYzA5YzliIDEwMDY0NAo+
ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiA+PiBAQCAtMTQ0LDExICsxNDQs
MTYgQEAgc3RydWN0IGhkbWlfYXVkaW9fcGFyYW0gewo+ID4+ICAgICAgc3RydWN0IGhkbWlfY29k
ZWNfcGFyYW1zIGNvZGVjX3BhcmFtczsKPiA+PiAgfTsKPiA+Pgo+ID4+ICtzdHJ1Y3QgbXRrX2hk
bWlfY29uZiB7Cj4gPj4gKyAgICBib29sIHR6X2Rpc2FibGVkOwo+ID4+ICt9Owo+ID4+ICsKPiA+
PiAgc3RydWN0IG10a19oZG1pIHsKPiA+PiAgICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsK
PiA+PiAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKPiA+PiAgICAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yIGNvbm47Cj4gPj4gICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPj4g
KyAgICBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiAqY29uZjsKPiA+PiAgICAgIHN0cnVjdCBw
aHkgKnBoeTsKPiA+PiAgICAgIHN0cnVjdCBkZXZpY2UgKmNlY19kZXY7Cj4gPj4gICAgICBzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkY19hZHB0Owo+ID4+IEBAIC0yMzAsNyArMjM1LDYgQEAgc3RhdGlj
IHZvaWQgbXRrX2hkbWlfaHdfdmlkX2JsYWNrKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgYm9vbCBi
bGFjaykKPiA+PiAgc3RhdGljIHZvaWQgbXRrX2hkbWlfaHdfbWFrZV9yZWdfd3JpdGFibGUoc3Ry
dWN0IG10a19oZG1pICpoZG1pLCBib29sIGVuYWJsZSkKPiA+PiAgewo+ID4+ICAgICAgc3RydWN0
IGFybV9zbWNjY19yZXMgcmVzOwo+ID4+IC0gICAgc3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9w
aHkgPSBwaHlfZ2V0X2RydmRhdGEoaGRtaS0+cGh5KTsKPiA+Pgo+ID4+ICAgICAgLyoKPiA+PiAg
ICAgICAqIE1UODE3MyBIRE1JIGhhcmR3YXJlIGhhcyBhbiBvdXRwdXQgY29udHJvbCBiaXQgdG8g
ZW5hYmxlL2Rpc2FibGUgSERNSQo+ID4+IEBAIC0yMzgsNyArMjQyLDcgQEAgc3RhdGljIHZvaWQg
bXRrX2hkbWlfaHdfbWFrZV9yZWdfd3JpdGFibGUoc3RydWN0IG10a19oZG1pICpoZG1pLCBib29s
IGVuYWJsZSkKPiA+PiAgICAgICAqIFRoZSBBUk0gdHJ1c3RlZCBmaXJtd2FyZSBwcm92aWRlcyBh
biBBUEkgZm9yIHRoZSBIRE1JIGRyaXZlciB0byBzZXQKPiA+PiAgICAgICAqIHRoaXMgY29udHJv
bCBiaXQgdG8gZW5hYmxlIEhETUkgb3V0cHV0IGluIHN1cGVydmlzb3IgbW9kZS4KPiA+PiAgICAg
ICAqLwo+ID4+IC0gICAgaWYgKGhkbWlfcGh5LT5jb25mICYmIGhkbWlfcGh5LT5jb25mLT50el9k
aXNhYmxlZCkKPiA+PiArICAgIGlmIChoZG1pLT5jb25mLT50el9kaXNhYmxlZCkKPgo+IFdvdWxk
bid0IHdlIG5lZWQgdG8gY2hlY2s6Cj4gaWYgKGhkbWktPmNvbmYgJiYgaGRtaS0+Y29uZi0+dHpf
ZGlzYWJsZWQpCgpNeSBkZXNpZ24gaXM6IGhkbWktPmNvbmYgd291bGQgbm90IGJlIE5VTEwuCgo+
Cj4gPj4gICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhoZG1pLT5zeXNfcmVnbWFwLAo+
ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGRtaS0+c3lzX29mZnNldCArIEhE
TUlfU1lTX0NGRzIwLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg4MDAw
ODAwNSwgZW5hYmxlID8gMHg4MDAwMDAwNSA6IDB4ODAwMCk7Cj4gPj4gQEAgLTE2ODgsNiArMTY5
Miw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPj4gICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4+Cj4gPj4gICAg
ICBoZG1pLT5kZXYgPSBkZXY7Cj4gPj4gKyAgICBoZG1pLT5jb25mID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKGRldik7Cj4gPj4KPiA+PiAgICAgIHJldCA9IG10a19oZG1pX2R0X3BhcnNlX3Bk
YXRhKGhkbWksIHBkZXYpOwo+ID4+ICAgICAgaWYgKHJldCkKPiA+PiBAQCAtMTc2NSw4ICsxNzcw
LDE5IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+
PiAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG10a19oZG1pX3BtX29wcywKPiA+PiAgICAgICAg
ICAgICAgICAgICAgICAgbXRrX2hkbWlfc3VzcGVuZCwgbXRrX2hkbWlfcmVzdW1lKTsKPiA+Pgo+
ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1pX2NvbmYgbXRrX2hkbWlfY29uZl9tdDI3
MDEgPSB7Cj4gPj4gKyAgICAudHpfZGlzYWJsZWQgPSB0cnVlLAo+ID4+ICt9Owo+ID4+ICsKPiA+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2NvbmZfbXQ4MTcz
Owo+ID4+ICsKPiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RybV9o
ZG1pX29mX2lkc1tdID0gewo+ID4+IC0gICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
NzMtaGRtaSIsIH0sCj4gPj4gKyAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1o
ZG1pIiwKPiA+PiArICAgICAgLmRhdGEgPSAmbXRrX2hkbWlfY29uZl9tdDI3MDEsCj4gPj4gKyAg
ICB9LAo+ID4+ICsgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtaGRtaSIsCj4g
Pj4gKyAgICAgIC5kYXRhID0gJm10a19oZG1pX2NvbmZfbXQ4MTczLAo+Cj4gV2UgZG9uJ3QgaGF2
ZSBhbnkgZGF0YT8gVGhlbiB3ZSBzaG91bGQgc2V0IGRhdGEgdG8gTlVMTCBpbnN0ZWFkLgoKTXkg
ZGVzaWduIGlzIGRhdGEgd291bGQgbm90IGJlIE5VTEwsIHNvIEkgbmVlZCBub3QgdG8gY2hlY2sg
d2hldGhlciBpdAppcyBOVUxMIGluIGRyaXZlci4KClJlZ2FyZHMsCkNLCgo+Cj4gUmVnYXJkcywK
PiBNYXR0aGlhcwo+Cj4gPj4gKyAgICB9LAo+ID4+ICAgICAge30KPiA+PiAgfTsKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiA+PiBpbmRleCAyZDhiMzE4
MjQ3MGQuLmZjMWMyZWZkMTEyOCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfcGh5LmgKPiA+PiBAQCAtMjAsNyArMjAsNiBAQAo+ID4+ICBzdHJ1Y3QgbXRrX2hk
bWlfcGh5Owo+ID4+Cj4gPj4gIHN0cnVjdCBtdGtfaGRtaV9waHlfY29uZiB7Cj4gPj4gLSAgICBi
b29sIHR6X2Rpc2FibGVkOwo+ID4+ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+PiAgICAg
IGNvbnN0IHN0cnVjdCBjbGtfb3BzICpoZG1pX3BoeV9jbGtfb3BzOwo+ID4+ICAgICAgdm9pZCAo
KmhkbWlfcGh5X2VuYWJsZV90bWRzKShzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSk7Cj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlf
cGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5jCj4g
Pj4gaW5kZXggZDNjYzQwMjJlOTg4Li45OWZlMDVjZDM1OTggMTAwNjQ0Cj4gPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYwo+ID4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMKPiA+PiBAQCAtMjM3
LDcgKzIzNyw2IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3BoeV9kaXNhYmxlX3RtZHMoc3RydWN0
IG10a19oZG1pX3BoeSAqaGRtaV9waHkpCj4gPj4gIH0KPiA+Pgo+ID4+ICBzdHJ1Y3QgbXRrX2hk
bWlfcGh5X2NvbmYgbXRrX2hkbWlfcGh5XzI3MDFfY29uZiA9IHsKPiA+PiAtICAgIC50el9kaXNh
YmxlZCA9IHRydWUsCj4gPj4gICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfR0FURSwKPiA+PiAg
ICAgIC5oZG1pX3BoeV9jbGtfb3BzID0gJm10a19oZG1pX3BoeV9wbGxfb3BzLAo+ID4+ICAgICAg
LmhkbWlfcGh5X2VuYWJsZV90bWRzID0gbXRrX2hkbWlfcGh5X2VuYWJsZV90bWRzLAo+ID4KPiA+
IFJldmlld2VkLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
