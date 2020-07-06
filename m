Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CB4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 23:46:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC899206E9
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 23:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4VMOifM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NARFzwOm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC899206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xiM+x9BWCJ8Ma3mNo/V9Yq66KGuFcp6cg+R85dWm5TM=; b=m4VMOifMg1+P7bvqGcLFfat7v
	jQbnBnm4phfy8wuIU0mAYdLOGSVwHXvBJAU3+8hjqgReN5+cRfF/7VXRbYMqncc2v1F87f3iyEiCX
	SpEUamZNK91Rkp7P1wqYQaFzMmmmHoCW57WkfBQEFcLoSPfoN6AYW7uJH+VUMn3FX7/XLXqmR+AcQ
	CdRjjfB3xiqi9o6s0W5n1A5qDd3I/bTWIHNK3uY8HxL2zbzWW1h0tkCp1QvUvUPNww7qaz6MXm3zg
	783B/BzcDLZpMDBo34uz+o5GB+oPCk1tD55bv0UfSjrcbxd8MtlRRxCtjHBTWBK0lZkBRL8cv191r
	J+M3hlDZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsaog-0007tQ-PP; Mon, 06 Jul 2020 23:46:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsaoc-0007rz-BC; Mon, 06 Jul 2020 23:46:27 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A2682073E;
 Mon,  6 Jul 2020 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594079184;
 bh=lYWewh87S6iH9k7zGUREHZUS5ol9uho3JTnBeQHhE58=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NARFzwOm3YVKZH09KaLqpfEeS2eC8rMGgFftP3bgk+g3SBS8iHhqEHgHLVxVUyuMJ
 wfI50V4h8I1RJzuggmkSLZjm5n26cZ3XfQoy8KFkCqaZVNinHHaspgFXigDN86xrKP
 TOom6C9OqO6tSK2hdgUtTFhfiBf4kkbTOgGTn19c=
Received: by mail-ej1-f42.google.com with SMTP id a1so44675201ejg.12;
 Mon, 06 Jul 2020 16:46:24 -0700 (PDT)
X-Gm-Message-State: AOAM5336m7As5mmGLRU9yqwROb1vjKDfVZwpcdBo3wfPYtgjSLThpRsN
 i2fnchOxNFRv0Ab/fz8Hw09bz2Whtch5a1bTeg==
X-Google-Smtp-Source: ABdhPJyY/xIkGPmPXd57FlHxva/9PVuURne2hf7iyK2dKHds7uxq2Q26oYLqSaBaS7NAKp66WlYlOteC/nvWbHayRsg=
X-Received: by 2002:a17:906:404e:: with SMTP id
 y14mr44259469ejj.260.1594079183128; 
 Mon, 06 Jul 2020 16:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1593931715-32761-9-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1593931715-32761-9-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Jul 2020 07:46:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-5um+X=cS3rkuN7YHycK2AyJsovumCQ4t+dbwXw62uAQ@mail.gmail.com>
Message-ID: <CAAOTY_-5um+X=cS3rkuN7YHycK2AyJsovumCQ4t+dbwXw62uAQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_194626_532757_5E97CB77 
X-CRM114-Status: GOOD (  22.67  )
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
bT4g5pa8IDIwMjDlubQ35pyINuaXpSDpgLHkuIAg5LiL5Y2IMzoyMOWvq+mBk++8mgo+Cj4gQWRk
IGNsZWFyIHBhcmFtZXRlciB0byBsZXQgY2xpZW50IGRlY2lkZSBpZgo+IGV2ZW50IHNob3VsZCBi
ZSBjbGVhciB0byAwIGFmdGVyIEdDRSByZWNlaXZlIGl0Lgo+Cj4gRml4ZXM6IDJmOTY1YmU3Zjkw
MDggKCJkcm0vbWVkaWF0ZWs6IGFwcGx5IENNRFEgY29udHJvbCBmbG93IikKCkkgdGhpbmsgdGhp
cyBwYXRjaCBpbmNsdWRlIHR3byB0aGluZ3MsIG9uZSBpcyBidWcgZml4LCBhbm90aGVyIGlzCmNo
YW5naW5nIGludGVyZmFjZS4KYmVsb3cgaXMgdGhlIGJ1ZyBmaXggcGFydC4KCi0jZGVmaW5lIENN
RFFfV0ZFX09QVElPTiAgICAgICAgICAgICAgICAgICAgICAgIChDTURRX1dGRV9VUERBVEUgfApD
TURRX1dGRV9XQUlUIHwgXAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Q01EUV9XRkVfV0FJVF9WQUxVRSkKKyNkZWZpbmUgQ01EUV9XRkVfT1BUSU9OICAgICAgICAgICAg
ICAgICAgICAgICAgKENNRFFfV0ZFX1dBSVQgfApDTURRX1dGRV9XQUlUX1ZBTFVFKQoKdGhlIG90
aGVyIGlzIGNoYW5naW5nIGludGVyZmFjZSBwYXJ0LiBTbyB0aGlzIHBhdGNoIHNob3VsZCBiZSBi
cm9rZW4KaW50byB0d28gcGF0Y2hlcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFNpZ25lZC1v
ZmYtYnk6IERlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhzaWVoQG1lZGlhdGVrLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICB8ICAgIDIgKy0KPiAgZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgICB8ICAgIDUgKysrLS0KPiAgaW5jbHVkZS9saW51
eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaCB8ICAgIDMgKy0tCj4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmggICAgfCAgICA1ICsrKy0tCj4gIDQgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGVjNmM5ZmZiZjM1ZS4uYmE2Y2Y5NTZiMjM5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC00OTAsNyAr
NDkwLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2h3X2NvbmZpZyhzdHJ1Y3QgbXRrX2Ry
bV9jcnRjICptdGtfY3J0YykKPiAgICAgICAgICAgICAgICAgbWJveF9mbHVzaChtdGtfY3J0Yy0+
Y21kcV9jbGllbnQtPmNoYW4sIDIwMDApOwo+ICAgICAgICAgICAgICAgICBjbWRxX2hhbmRsZSA9
IGNtZHFfcGt0X2NyZWF0ZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQsIFBBR0VfU0laRSk7Cj4gICAg
ICAgICAgICAgICAgIGNtZHFfcGt0X2NsZWFyX2V2ZW50KGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+
Y21kcV9ldmVudCk7Cj4gLSAgICAgICAgICAgICAgIGNtZHFfcGt0X3dmZShjbWRxX2hhbmRsZSwg
bXRrX2NydGMtPmNtZHFfZXZlbnQpOwo+ICsgICAgICAgICAgICAgICBjbWRxX3BrdF93ZmUoY21k
cV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2ZW50LCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAg
IG10a19jcnRjX2RkcF9jb25maWcoY3J0YywgY21kcV9oYW5kbGUpOwo+ICAgICAgICAgICAgICAg
ICBjbWRxX3BrdF9maW5hbGl6ZShjbWRxX2hhbmRsZSk7Cj4gICAgICAgICAgICAgICAgIGNtZHFf
cGt0X2ZsdXNoX2FzeW5jKGNtZHFfaGFuZGxlLCBkZHBfY21kcV9jYiwgY21kcV9oYW5kbGUpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gaW5kZXggZDU1ZGMzMjk2MTA1
Li41MDU2NTFiMGQ3MTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEtaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIu
Ywo+IEBAIC0zMTYsMTUgKzMxNiwxNiBAQCBpbnQgY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVl
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBoaWdoX2FkZHJfcmVnX2lkeCwKPiAgfQo+ICBFWFBP
UlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZSk7Cj4KPiAtaW50IGNtZHFfcGt0
X3dmZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTE2IGV2ZW50KQo+ICtpbnQgY21kcV9wa3Rfd2Zl
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1MTYgZXZlbnQsIGJvb2wgY2xlYXIpCj4gIHsKPiAgICAg
ICAgIHN0cnVjdCBjbWRxX2luc3RydWN0aW9uIGluc3QgPSB7IHswfSB9Owo+ICsgICAgICAgdTMy
IGNsZWFyX29wdGlvbiA9IGNsZWFyID8gQ01EUV9XRkVfVVBEQVRFIDogMDsKPgo+ICAgICAgICAg
aWYgKGV2ZW50ID49IENNRFFfTUFYX0VWRU5UKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPgo+ICAgICAgICAgaW5zdC5vcCA9IENNRFFfQ09ERV9XRkU7Cj4gLSAgICAgICBpbnN0
LnZhbHVlID0gQ01EUV9XRkVfT1BUSU9OOwo+ICsgICAgICAgaW5zdC52YWx1ZSA9IENNRFFfV0ZF
X09QVElPTiB8IGNsZWFyX29wdGlvbjsKPiAgICAgICAgIGluc3QuZXZlbnQgPSBldmVudDsKPgo+
ICAgICAgICAgcmV0dXJuIGNtZHFfcGt0X2FwcGVuZF9jb21tYW5kKHBrdCwgaW5zdCk7Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggYi9pbmNs
dWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oCj4gaW5kZXggZWZiZDhhOWViMmQx
Li5kNWE5ODNkNjVmMDUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1j
bWRxLW1haWxib3guaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWls
Ym94LmgKPiBAQCAtMjgsOCArMjgsNyBAQAo+ICAgKiBiaXQgMTYtMjc6IHVwZGF0ZSB2YWx1ZQo+
ICAgKiBiaXQgMzE6IDEgLSB1cGRhdGUsIDAgLSBubyB1cGRhdGUKPiAgICovCj4gLSNkZWZpbmUg
Q01EUV9XRkVfT1BUSU9OICAgICAgICAgICAgICAgICAgICAgICAgKENNRFFfV0ZFX1VQREFURSB8
IENNRFFfV0ZFX1dBSVQgfCBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIENNRFFfV0ZFX1dBSVRfVkFMVUUpCj4gKyNkZWZpbmUgQ01EUV9XRkVfT1BUSU9OICAgICAg
ICAgICAgICAgICAgICAgICAgKENNRFFfV0ZFX1dBSVQgfCBDTURRX1dGRV9XQUlUX1ZBTFVFKQo+
Cj4gIC8qKiBjbWRxIGV2ZW50IG1heGltdW0gKi8KPiAgI2RlZmluZSBDTURRX01BWF9FVkVOVCAg
ICAgICAgICAgICAgICAgMHgzZmYKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLWNtZHEuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgK
PiBpbmRleCAzNDM1NGU5NTJmNjAuLjk2MDcwNGQ3NTk5NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEuaAo+IEBAIC0xODIsMTEgKzE4MiwxMiBAQCBpbnQgY21kcV9wa3Rf
d3JpdGVfc19tYXNrX3ZhbHVlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBoaWdoX2FkZHJfcmVn
X2lkeCwKPiAgLyoqCj4gICAqIGNtZHFfcGt0X3dmZSgpIC0gYXBwZW5kIHdhaXQgZm9yIGV2ZW50
IGNvbW1hbmQgdG8gdGhlIENNRFEgcGFja2V0Cj4gICAqIEBwa3Q6ICAgICAgIHRoZSBDTURRIHBh
Y2tldAo+IC0gKiBAZXZlbnQ6ICAgICB0aGUgZGVzaXJlZCBldmVudCB0eXBlIHRvICJ3YWl0IGFu
ZCBDTEVBUiIKPiArICogQGV2ZW50OiAgICAgdGhlIGRlc2lyZWQgZXZlbnQgdHlwZSB0byB3YWl0
Cj4gKyAqIEBjbGVhcjogICAgIGNsZWFyIGV2ZW50IG9yIG5vdCBhZnRlciBldmVudCBhcnJpdmUK
PiAgICoKPiAgICogUmV0dXJuOiAwIGZvciBzdWNjZXNzOyBlbHNlIHRoZSBlcnJvciBjb2RlIGlz
IHJldHVybmVkCj4gICAqLwo+IC1pbnQgY21kcV9wa3Rfd2ZlKHN0cnVjdCBjbWRxX3BrdCAqcGt0
LCB1MTYgZXZlbnQpOwo+ICtpbnQgY21kcV9wa3Rfd2ZlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1
MTYgZXZlbnQsIGJvb2wgY2xlYXIpOwo+Cj4gIC8qKgo+ICAgKiBjbWRxX3BrdF9jbGVhcl9ldmVu
dCgpIC0gYXBwZW5kIGNsZWFyIGV2ZW50IGNvbW1hbmQgdG8gdGhlIENNRFEgcGFja2V0Cj4gLS0K
PiAxLjcuOS41Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
