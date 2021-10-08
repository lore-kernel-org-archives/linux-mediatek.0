Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E6DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5A861037
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E5A861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9jLhij+JiC3azUOMlXVL/PZgcWCVwNApu/2z6GjR3o=; b=mxEHgcnzJJC/sc
	+b7pI/Y1XKuyxe5AHudYI4JUptrbCtyzuM7P2netmbzId/4eZAKnwFhM2q8kxIo1c7KoOjUilNuWl
	/Z6Tym51zipSSqjPNqELup/Jnz7vm2tJY1ZkqOnfRtUX9JRAhYrirtiVDr3AmU7IDPzy4Q77YkqUX
	gzI24IxOm1XU7FGTNLYdkR93hQrKTXthfO7Q+sQ+KbkPs+4Z4fqaRaPtN6N5+r8AcEgMPokvf/Iuf
	+2fUG7JkF1gq7V3jnuji5zKLfgYYniIgpHLOvFwRNtHHDhvCLG4RtOKS04pF/blacRFPdWmuid7m4
	cc141t9w1ZC1zmuhzwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqft-00348R-EX; Fri, 08 Oct 2021 14:16:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqff-003461-Ns; Fri, 08 Oct 2021 14:16:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4875D61042;
 Fri,  8 Oct 2021 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633702583;
 bh=gfnYmiYx+3dkf2QkxY+VQ8BWqcH+BG2yBzByLC0yQFQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aEnaZQV2EZEiihXsjxeqEepzOwXZHJ2lV85Pg06tQv8utm+kForP/EWDSUeT9onOE
 5DHF37dXB9XsI/tMywvZSlm37hZFk1xLKoTBMv99Vnij7Ry0cKOQTWAz7lbi9tph8x
 Ffv5WYLQVs3I2ND5c6JrKP+vXFdBJmb+mcvb6Sm+lVWAEeVzleJ6YoTY7gWDvA32pO
 MoSepghxmeRK8932PMPQfnxLMU74qx8mxr0VmZUzdBiWRaPh5qNnfUa+1dwYFyI7l+
 MVOvEEZ56QC9CRh3Ct+0CLwMIyTocBe5esgmz9kbFaQrMpfJjnobv8pgvDiUR9Zz4/
 VJhVw/w8UnYmA==
Received: by mail-ed1-f47.google.com with SMTP id x7so35472052edd.6;
 Fri, 08 Oct 2021 07:16:23 -0700 (PDT)
X-Gm-Message-State: AOAM533HBDGNxLu2Il8vAzTaaRm6UXabysXLdYo33Q4nOAFxaEVER/gk
 dEkr29iywcCi20sKlbPK+J+0E720Cdrz1jLC+w==
X-Google-Smtp-Source: ABdhPJwdhKOutSaYK+RNrD+9iDbGHmKNrnmA/aPTFJPid4OWVGl9MH0bIy7Jr3s/kHMiLiPvTEE5f6q+Xnn20xQaVBc=
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr4791596ejb.6.1633702568065; 
 Fri, 08 Oct 2021 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210915232722.10031-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210915232722.10031-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Oct 2021 22:15:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8BZ9BgWeQVsD_01ioP8H16c1_QUb_+yniU_4Wp91Nc7A@mail.gmail.com>
Message-ID: <CAAOTY_8BZ9BgWeQVsD_01ioP8H16c1_QUb_+yniU_4Wp91Nc7A@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Use mailbox rx_callback instead of
 cmdq_task_cb
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_071623_838995_088ECD80 
X-CRM114-Status: GOOD (  21.45  )
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

SGksIE1hdHRoaWFzOgoKUGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoIGJlY2F1c2UgdGhpcyBwYXRj
aCBkZXBlbmQgb24gWzFdIHdoaWNoIHdvdWxkCmNhdXNlIG51bWVyb3VzIHdhcm5pbmcgbWVzc2Fn
ZS4gU28gSSB3b3VsZCByZXZlcnQgdGhhdCBwYXRjaCBpbiBbMl0uCgpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2Nv
bW1pdC9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWs/aD12NS4xNS1yYzQmaWQ9YzFlYzU0YjdiNWFm
MjVjNzc5MTkyMjUzZjVhOWYwNWU5NWNiNDNkNwpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjExMDA3MjM1MzEwLjE0NjI2LTYt
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmcvCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0OeaciDE25pelIOmAseWb
myDkuIrljYg3OjI35a+r6YGT77yaCj4KPiByeF9jYWxsYmFjayBpcyBhIHN0YW5kYXJkIG1haWxi
b3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZCBjb3ZlciB0aGUKPiBmdW5jdGlvbiBvZiBw
cm9wcmlldGFyeSBjbWRxX3Rhc2tfY2IsIHNvIHVzZSB0aGUgc3RhbmRhcmQgb25lIGluc3RlYWQg
b2YKPiB0aGUgcHJvcHJpZXRhcnkgb25lLiBDbGllbnQgaGFzIGNoYW5nZWQgdG8gdXNlIHRoZSBz
dGFuZGFyZCBjYWxsYmFjawo+IG1hY2hhbmlzbSBhbmQgc3luYyBkbWEgYnVmZmVyIGluIGNsaWVu
dCBkcml2ZXIsIHNvIHJlbW92ZSB0aGUgcHJvcHJpZXRhcnkKPiBjYWxsYmFjayBpbiBjbWRxIGhl
bHBlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyB8
IDI1ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEuaCAgfCAgNSArLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMjggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEtaGVscGVyLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYwo+IGluZGV4IDNjOGU0MjEyZDk0MS4uYzE4MzdhNDY4MjY3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gKysrIGIvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMKPiBAQCAtNDI1LDM0ICs0MjUsMTEgQEAgaW50IGNt
ZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ICB9Cj4gIEVYUE9SVF9TWU1C
T0woY21kcV9wa3RfZmluYWxpemUpOwo+Cj4gLXN0YXRpYyB2b2lkIGNtZHFfcGt0X2ZsdXNoX2Fz
eW5jX2NiKHN0cnVjdCBjbWRxX2NiX2RhdGEgZGF0YSkKPiAtewo+IC0gICAgICAgc3RydWN0IGNt
ZHFfcGt0ICpwa3QgPSAoc3RydWN0IGNtZHFfcGt0ICopZGF0YS5kYXRhOwo+IC0gICAgICAgc3Ry
dWN0IGNtZHFfdGFza19jYiAqY2IgPSAmcGt0LT5jYjsKPiAtICAgICAgIHN0cnVjdCBjbWRxX2Ns
aWVudCAqY2xpZW50ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7Cj4gLQo+IC0gICAg
ICAgZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUoY2xpZW50LT5jaGFuLT5tYm94LT5kZXYsIHBrdC0+
cGFfYmFzZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBrdC0+Y21kX2J1Zl9z
aXplLCBETUFfVE9fREVWSUNFKTsKPiAtICAgICAgIGlmIChjYi0+Y2IpIHsKPiAtICAgICAgICAg
ICAgICAgZGF0YS5kYXRhID0gY2ItPmRhdGE7Cj4gLSAgICAgICAgICAgICAgIGNiLT5jYihkYXRh
KTsKPiAtICAgICAgIH0KPiAtfQo+IC0KPiAtaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5jKHN0cnVj
dCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQo+ICtpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0
IGNtZHFfcGt0ICpwa3QpCj4gIHsKPiAgICAgICAgIGludCBlcnI7Cj4gICAgICAgICBzdHJ1Y3Qg
Y21kcV9jbGllbnQgKmNsaWVudCA9IChzdHJ1Y3QgY21kcV9jbGllbnQgKilwa3QtPmNsOwo+Cj4g
LSAgICAgICBwa3QtPmNiLmNiID0gY2I7Cj4gLSAgICAgICBwa3QtPmNiLmRhdGEgPSBkYXRhOwo+
IC0gICAgICAgcGt0LT5hc3luY19jYi5jYiA9IGNtZHFfcGt0X2ZsdXNoX2FzeW5jX2NiOwo+IC0g
ICAgICAgcGt0LT5hc3luY19jYi5kYXRhID0gcGt0Owo+IC0KPiAtICAgICAgIGRtYV9zeW5jX3Np
bmdsZV9mb3JfZGV2aWNlKGNsaWVudC0+Y2hhbi0+bWJveC0+ZGV2LCBwa3QtPnBhX2Jhc2UsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwa3QtPmNtZF9idWZfc2l6ZSwgRE1B
X1RPX0RFVklDRSk7Cj4gLQo+ICAgICAgICAgZXJyID0gbWJveF9zZW5kX21lc3NhZ2UoY2xpZW50
LT5jaGFuLCBwa3QpOwo+ICAgICAgICAgaWYgKGVyciA8IDApCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBlcnI7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1j
bWRxLmggYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gaW5kZXggYWM2
YjVmM2NiYTk1Li4yYjQ5OGY0ZjM5NDYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1jbWRxLmgKPiBAQCAtMjY4LDggKzI2OCw2IEBAIGludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1
Y3QgY21kcV9wa3QgKnBrdCk7Cj4gICAqIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKCkgLSB0cmlnZ2Vy
IENNRFEgdG8gYXN5bmNocm9ub3VzbHkgZXhlY3V0ZSB0aGUgQ01EUQo+ICAgKiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFja2V0IGFuZCBjYWxsIGJhY2sgYXQgdGhlIGVuZCBvZiBkb25lIHBh
Y2tldAo+ICAgKiBAcGt0OiAgICAgICB0aGUgQ01EUSBwYWNrZXQKPiAtICogQGNiOiAgICAgICAg
ICAgICAgICBjYWxsZWQgYXQgdGhlIGVuZCBvZiBkb25lIHBhY2tldAo+IC0gKiBAZGF0YTogICAg
ICB0aGlzIGRhdGEgd2lsbCBwYXNzIGJhY2sgdG8gY2IKPiAgICoKPiAgICogUmV0dXJuOiAwIGZv
ciBzdWNjZXNzOyBlbHNlIHRoZSBlcnJvciBjb2RlIGlzIHJldHVybmVkCj4gICAqCj4gQEAgLTI3
Nyw3ICsyNzUsNiBAQCBpbnQgY21kcV9wa3RfZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3Qp
Owo+ICAgKiBhdCB0aGUgZW5kIG9mIGRvbmUgcGFja2V0LiBOb3RlIHRoYXQgdGhpcyBpcyBhbiBB
U1lOQyBmdW5jdGlvbi4gV2hlbiB0aGUKPiAgICogZnVuY3Rpb24gcmV0dXJuZWQsIGl0IG1heSBv
ciBtYXkgbm90IGJlIGZpbmlzaGVkLgo+ICAgKi8KPiAtaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsKPiAraW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KHN0cnVjdCBjbWRxX3BrdCAqcGt0KTsKPgo+ICAjZW5kaWYgLyogX19NVEtfQ01EUV9IX18gKi8K
PiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
