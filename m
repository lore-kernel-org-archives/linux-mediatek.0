Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EC7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:04:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 348C02065D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dyVBx3OE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2j+WigMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 348C02065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=82UtZk6R+RjyXy7Rj1xLA0zinNQ+UXBurU2RvY0jSPg=; b=dyVBx3OE0D54d/plyV8X8zfqo
	GpjY1YcCwVz0Vi7Mv6UgrPaA9jlsEnTZjrsvpKclJuULLy42A8E54uu+SxWIrBQ2uovClaias/Bw5
	aCgVLg8MPhH9QOfcX+7GjKVTZCVOaCc74nCHO7mg5XriqQg6nY2KYp0qBqbT6202q526T12OKXb52
	/uzjXTIcdL4yspgcSERIYZQhSAQsh7JPzHow4NKkF3uYUG16QQwhmFk01JziHHMTpgNAYsWNHnm1m
	PnECj0QMptpyidqluwYAhygRUzk8jzCC+ZVKIxrNdAutxoCDB7YskZsjHY+jPVjtzZl/bRvtFdmFN
	Efw+bgHow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswdR-0007wo-Oy; Tue, 07 Jul 2020 23:04:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswdM-0007uy-Lr; Tue, 07 Jul 2020 23:04:17 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8761B2078D;
 Tue,  7 Jul 2020 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594163055;
 bh=EhWbqaZmzsXrJaeaaTa9oa/wuFRN2GqSFupG2BL65vs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2j+WigMMCy0EWqbFXaQS29d/sonlcCSlyGxpLyno0CWRcGuMipY0rCR1Kixv7oH2t
 bSDyDvtpPtPVj5EN4VFaMODBJWpLVaGePDfo2A77wxILRxwsNOGZGkWvAxLdl1avBg
 KtywLJOY3k3TBpwNgjqCcYtYWoo/VLYSRIHTAFCo=
Received: by mail-ej1-f50.google.com with SMTP id dp18so48437314ejc.8;
 Tue, 07 Jul 2020 16:04:15 -0700 (PDT)
X-Gm-Message-State: AOAM532g9ODU2lcWL4BEjLCBWAlVWxIO5CAhtFpk/8E/BBMvm3wHYNg7
 rTPLxx0nXsIGwuiDUEFlrg12Smruti4UlLcb6w==
X-Google-Smtp-Source: ABdhPJxprTd+dID67KymjoMlkTb45ievUJV+INwGOVc0ao2/LY+zUwpER680dwt517Xc1x3bJeVEYifxQKbqdDNuaaU=
X-Received: by 2002:a17:906:b888:: with SMTP id
 hb8mr48868098ejb.124.1594163054098; 
 Tue, 07 Jul 2020 16:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Jul 2020 07:04:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Dj3WjYsLYhP8FfdTfCv0ddv73HmUcT=8x6bT1qP=ADA@mail.gmail.com>
Message-ID: <CAAOTY_9Dj3WjYsLYhP8FfdTfCv0ddv73HmUcT=8x6bT1qP=ADA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_190416_851896_74C025F4 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream <wsd_upstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERlbm5pczoKCkRlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhzaWVoQG1lZGlhdGVrLmNv
bT4g5pa8IDIwMjDlubQ35pyIN+aXpSDpgLHkuowg5LiL5Y2IMTE6NDflr6vpgZPvvJoKPgo+IEFk
ZCBjbGVhciBwYXJhbWV0ZXIgdG8gbGV0IGNsaWVudCBkZWNpZGUgaWYKPiBldmVudCBzaG91bGQg
YmUgY2xlYXIgdG8gMCBhZnRlciBHQ0UgcmVjZWl2ZSBpdC4KCkZvciBEUk0gcGFydCwKCkFja2Vk
LWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBDaGFuZ2Ug
c2luY2UgdjI6Cj4gLSBLZWVwIGJlaGF2aW9yIGluIGRybSBjcnRjIGRyaXZlciBhbmQKPiAgIHNl
cGFyYXRlIGJ1ZyBmaXggY29kZSBpbnRvIGFub3RoZXIgcGF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgfCAgICAyICstCj4gIGRy
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jICAgfCAgICA1ICsrKy0tCj4gIGlu
Y2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAgICAzICstLQo+ICBpbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oICAgIHwgICAgNSArKystLQo+ICA0IGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCBlYzZjOWZmYmYzNWUuLmM4NGU3
YTE0ZDRhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBA
QCAtNDkwLDcgKzQ5MCw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19od19jb25maWcoc3Ry
dWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICAgICAgICAgIG1ib3hfZmx1c2go
bXRrX2NydGMtPmNtZHFfY2xpZW50LT5jaGFuLCAyMDAwKTsKPiAgICAgICAgICAgICAgICAgY21k
cV9oYW5kbGUgPSBjbWRxX3BrdF9jcmVhdGUobXRrX2NydGMtPmNtZHFfY2xpZW50LCBQQUdFX1NJ
WkUpOwo+ICAgICAgICAgICAgICAgICBjbWRxX3BrdF9jbGVhcl9ldmVudChjbWRxX2hhbmRsZSwg
bXRrX2NydGMtPmNtZHFfZXZlbnQpOwo+IC0gICAgICAgICAgICAgICBjbWRxX3BrdF93ZmUoY21k
cV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPiArICAgICAgICAgICAgICAgY21kcV9w
a3Rfd2ZlKGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVudCwgdHJ1ZSk7Cj4gICAgICAg
ICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0YywgY21kcV9oYW5kbGUpOwo+ICAgICAg
ICAgICAgICAgICBjbWRxX3BrdF9maW5hbGl6ZShjbWRxX2hhbmRsZSk7Cj4gICAgICAgICAgICAg
ICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKGNtZHFfaGFuZGxlLCBkZHBfY21kcV9jYiwgY21kcV9o
YW5kbGUpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gaW5kZXggZDU1
ZGMzMjk2MTA1Li41MDU2NTFiMGQ3MTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEtaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21k
cS1oZWxwZXIuYwo+IEBAIC0zMTYsMTUgKzMxNiwxNiBAQCBpbnQgY21kcV9wa3Rfd3JpdGVfc19t
YXNrX3ZhbHVlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBoaWdoX2FkZHJfcmVnX2lkeCwKPiAg
fQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZSk7Cj4KPiAtaW50
IGNtZHFfcGt0X3dmZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTE2IGV2ZW50KQo+ICtpbnQgY21k
cV9wa3Rfd2ZlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1MTYgZXZlbnQsIGJvb2wgY2xlYXIpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBjbWRxX2luc3RydWN0aW9uIGluc3QgPSB7IHswfSB9Owo+ICsg
ICAgICAgdTMyIGNsZWFyX29wdGlvbiA9IGNsZWFyID8gQ01EUV9XRkVfVVBEQVRFIDogMDsKPgo+
ICAgICAgICAgaWYgKGV2ZW50ID49IENNRFFfTUFYX0VWRU5UKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgaW5zdC5vcCA9IENNRFFfQ09ERV9XRkU7Cj4gLSAg
ICAgICBpbnN0LnZhbHVlID0gQ01EUV9XRkVfT1BUSU9OOwo+ICsgICAgICAgaW5zdC52YWx1ZSA9
IENNRFFfV0ZFX09QVElPTiB8IGNsZWFyX29wdGlvbjsKPiAgICAgICAgIGluc3QuZXZlbnQgPSBl
dmVudDsKPgo+ICAgICAgICAgcmV0dXJuIGNtZHFfcGt0X2FwcGVuZF9jb21tYW5kKHBrdCwgaW5z
dCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmggYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oCj4gaW5kZXggZWZi
ZDhhOWViMmQxLi5kNWE5ODNkNjVmMDUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tYWls
Ym94L210ay1jbWRxLW1haWxib3guaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmgKPiBAQCAtMjgsOCArMjgsNyBAQAo+ICAgKiBiaXQgMTYtMjc6IHVwZGF0
ZSB2YWx1ZQo+ICAgKiBiaXQgMzE6IDEgLSB1cGRhdGUsIDAgLSBubyB1cGRhdGUKPiAgICovCj4g
LSNkZWZpbmUgQ01EUV9XRkVfT1BUSU9OICAgICAgICAgICAgICAgICAgICAgICAgKENNRFFfV0ZF
X1VQREFURSB8IENNRFFfV0ZFX1dBSVQgfCBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIENNRFFfV0ZFX1dBSVRfVkFMVUUpCj4gKyNkZWZpbmUgQ01EUV9XRkVfT1BU
SU9OICAgICAgICAgICAgICAgICAgICAgICAgKENNRFFfV0ZFX1dBSVQgfCBDTURRX1dGRV9XQUlU
X1ZBTFVFKQo+Cj4gIC8qKiBjbWRxIGV2ZW50IG1heGltdW0gKi8KPiAgI2RlZmluZSBDTURRX01B
WF9FVkVOVCAgICAgICAgICAgICAgICAgMHgzZmYKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1jbWRxLmgKPiBpbmRleCAzNDM1NGU5NTJmNjAuLjk2MDcwNGQ3NTk5NCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+IEBAIC0xODIsMTEgKzE4MiwxMiBAQCBpbnQg
Y21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBoaWdo
X2FkZHJfcmVnX2lkeCwKPiAgLyoqCj4gICAqIGNtZHFfcGt0X3dmZSgpIC0gYXBwZW5kIHdhaXQg
Zm9yIGV2ZW50IGNvbW1hbmQgdG8gdGhlIENNRFEgcGFja2V0Cj4gICAqIEBwa3Q6ICAgICAgIHRo
ZSBDTURRIHBhY2tldAo+IC0gKiBAZXZlbnQ6ICAgICB0aGUgZGVzaXJlZCBldmVudCB0eXBlIHRv
ICJ3YWl0IGFuZCBDTEVBUiIKPiArICogQGV2ZW50OiAgICAgdGhlIGRlc2lyZWQgZXZlbnQgdHlw
ZSB0byB3YWl0Cj4gKyAqIEBjbGVhcjogICAgIGNsZWFyIGV2ZW50IG9yIG5vdCBhZnRlciBldmVu
dCBhcnJpdmUKPiAgICoKPiAgICogUmV0dXJuOiAwIGZvciBzdWNjZXNzOyBlbHNlIHRoZSBlcnJv
ciBjb2RlIGlzIHJldHVybmVkCj4gICAqLwo+IC1pbnQgY21kcV9wa3Rfd2ZlKHN0cnVjdCBjbWRx
X3BrdCAqcGt0LCB1MTYgZXZlbnQpOwo+ICtpbnQgY21kcV9wa3Rfd2ZlKHN0cnVjdCBjbWRxX3Br
dCAqcGt0LCB1MTYgZXZlbnQsIGJvb2wgY2xlYXIpOwo+Cj4gIC8qKgo+ICAgKiBjbWRxX3BrdF9j
bGVhcl9ldmVudCgpIC0gYXBwZW5kIGNsZWFyIGV2ZW50IGNvbW1hbmQgdG8gdGhlIENNRFEgcGFj
a2V0Cj4gLS0KPiAxLjcuOS41Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
