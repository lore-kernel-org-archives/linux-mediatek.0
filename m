Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F96207FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 15:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2AfzjrO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYO1BVfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F96207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w28eCPBmX9jvrMUI/auz1el3pzNp5aRzw0OXLs2Z+OQ=; b=f2AfzjrOF5/VOK
	Y+EnTTVn2ZDf8mYS2kVDjm+CRhff89wztHvKdfLeUxi/BRApD9DGIATknhNRjbf9Thrk3WgmakmVM
	hjVUuFk5FZR9oD3MW2ww/Lb6gxDjUcWkHNggoz7z7iS3zN7a6hEHhgjjRUAnJSfTIFYrj8c+F6Fya
	KIMT+CYSshLjR7+GueDZ/QMutnqvLjVTGYvaBBIWU4rKSL7YS6Rh5cPfBqRQoRLI0V6/UcAWbx1pB
	phzxXJkb/62Y0XhZcLBFuia0Z0zbmdZo3u/ssLy5HptAewG+bGDCl3fS780ztF6saGpPr3QsojEBa
	nbmrg2aOp3AkuLA/fwGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb3t3-0008AT-7S; Tue, 19 May 2020 15:10:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb3su-00082k-7W; Tue, 19 May 2020 15:10:25 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DB6A20842;
 Tue, 19 May 2020 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589901023;
 bh=cDO81NBWR5JNkUDn06ROcvMZX+vtmK43mTmgDiFGwlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KYO1BVfG+R7kOpXoOmTAywsE0eiQsXss/NsSSgXJJjE3FHVJ9XnLrnHRjI2nXsvYf
 j1ys4f0Hr2/RAFw/0wbpP0QBwvnC76RP0kBoHkHzXNeyznPxdLUN6+eRLduEyLs0fv
 zK+V8OYpIDgB3wCdnBU8d7d9VH9tjhJAzhK1Dtfc=
Received: by mail-ej1-f47.google.com with SMTP id x1so12187486ejd.8;
 Tue, 19 May 2020 08:10:23 -0700 (PDT)
X-Gm-Message-State: AOAM532UVxM3hk+94Xsudv588NADdswT5QqVy/Zmny2vDlzDsdZ/5CUv
 iXaTz0EPrXMXS6pBIbcfKKCCYjs9v2OdU/h7Ew==
X-Google-Smtp-Source: ABdhPJyhbV15yj67Zc07chzoIXRKEsVO7rqxl9HErvPnhH7lppKJMsefvURisxOzEimO9K8QU/uJGq8sP+RlLOQJFNs=
X-Received: by 2002:a17:907:2649:: with SMTP id
 ar9mr18714534ejc.375.1589901021958; 
 Tue, 19 May 2020 08:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113156.25009-1-matthias.bgg@kernel.org>
 <20200518113156.25009-3-matthias.bgg@kernel.org>
In-Reply-To: <20200518113156.25009-3-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 May 2020 23:10:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_80D6ZMM5_nEyf_XDjOLaWCOyi3mn9ibWhNX8_ozPK1BQ@mail.gmail.com>
Message-ID: <CAAOTY_80D6ZMM5_nEyf_XDjOLaWCOyi3mn9ibWhNX8_ozPK1BQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk/soc: mediatek: mt6779: Bind clock driver from
 platform device
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_081024_309844_22DEBF20 
X-CRM114-Status: GOOD (  19.52  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Allison Randal <allison@lohutok.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzozM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBtbXN5cyBkcml2ZXIgaXMgbm93IHRo
ZSB0b3AgbGV2ZWwgZW50cnkgcG9pbnQgZm9yIHRoZSBtdWx0aW1lZGlhCj4gc3lzdGVtIChtbXN5
cyksIHdlIGJpbmQgdGhlIGNsb2NrIGRyaXZlciBieSBjcmVhdGluZyBhIHBsYXRmb3JtIGRldmlj
ZS4KPiBXZSBhbHNvIGJpbmQgdGhlIE1lZGlhVGVrIERSTSBkcml2ZXIgd2hpY2ggaXMgbm90IHll
dCBpbXBsZW1lbnQgYW5kCj4gdGhlcmVmb3Igd2lsbCBlcnJyb3Igb3V0IGZvciBub3cuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+
IC0tLQo+Cj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzktbW0uYyB8IDkgKystLS0t
LS0tCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICAgICB8IDggKysrKysrKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzktbW0uYyBiL2RyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzktbW0uYwo+IGluZGV4IGZiNWZiYjhlM2U0MS4uMDU5
YzFhNDFhYzdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3Nzkt
bW0uYwo+ICsrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzktbW0uYwo+IEBAIC04
NCwxNSArODQsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSBtbV9jbGtzW10gPSB7
Cj4gICAgICAgICBHQVRFX01NMShDTEtfTU1fRElTUF9PVkxfRkJEQywgIm1tX2Rpc3Bfb3ZsX2Zi
ZGMiLCAibW1fc2VsIiwgMTYpLAo+ICB9Owo+Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIG9mX21hdGNoX2Nsa19tdDY3NzlfbW1bXSA9IHsKPiAtICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ2Nzc5LW1tc3lzIiwgfSwKPiAtICAgICAgIHt9Cj4gLX07Cj4gLQo+
ICBzdGF0aWMgaW50IGNsa19tdDY3NzlfbW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgewo+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiAr
ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+cGFyZW50LT5vZl9ub2RlOwo+
ICAgICAgICAgc3RydWN0IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOwo+IC0gICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4KPiAgICAgICAgIGNs
a19kYXRhID0gbXRrX2FsbG9jX2Nsa19kYXRhKENMS19NTV9OUl9DTEspOwo+Cj4gQEAgLTEwNiw3
ICsxMDIsNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBjbGtfbXQ2Nzc5X21tX2Ry
diA9IHsKPiAgICAgICAgIC5wcm9iZSA9IGNsa19tdDY3NzlfbW1fcHJvYmUsCj4gICAgICAgICAu
ZHJpdmVyID0gewo+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJjbGstbXQ2Nzc5LW1tIiwKPiAt
ICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfY2xrX210Njc3OV9tbSwK
PiAgICAgICAgIH0sCj4gIH07Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+IGluZGV4IGZl
ZTY0YzhkMzAyMC4uZGMxNTgwOGNmM2EzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay1tbXN5cy5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMK
PiBAQCAtODgsNiArODgsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVy
X2RhdGEgbXQyNzEyX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLmNsa19kcml2ZXIg
PSAiY2xrLW10MjcxMi1tbSIsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1z
eXNfZHJpdmVyX2RhdGEgbXQ2Nzc5X21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLmNs
a19kcml2ZXIgPSAiY2xrLW10Njc3OS1tbSIsCgpUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUs
IGJ1dCBJJ3ZlIG9uZSBxdWVzdGlvbjogd2h5IGRybSBkcml2ZXIKanVzdCB1c2Ugc2luZ2xlICJt
ZWRpYXRlay1kcm0iIGZvciBzdWIgZHJpdmVyIG5hbWUsIGJ1dCBjbG9jayBkcml2ZXIKaGFzIGRp
ZmZlcmVudCBuYW1lIGZvciBlYWNoIFNvQz8KQ291bGQgd2UganVzdCB1c2Ugc2luZ2xlIG5hbWUg
Zm9yIGNsb2NrIGRyaXZlciBzdWNoIGFzICJtZWRpYXRlay1jbGstbW0iPwoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2
ZXJfZGF0YSBtdDY3OTdfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuY2xrX2RyaXZl
ciA9ICJjbGstbXQ2Nzk3LW1tIiwKPiAgfTsKPiBAQCAtMzQzLDYgKzM0NywxMCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9tYXRjaF9tdGtfbW1zeXNbXSA9IHsKPiAgICAg
ICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwKPiAgICAg
ICAgICAgICAgICAgLmRhdGEgPSAmbXQyNzEyX21tc3lzX2RyaXZlcl9kYXRhLAo+ICAgICAgICAg
fSwKPiArICAgICAgIHsKPiArICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ2Nzc5LW1tc3lzIiwKPiArICAgICAgICAgICAgICAgLmRhdGEgPSAmbXQ2Nzc5X21tc3lzX2Ry
aXZlcl9kYXRhLAo+ICsgICAgICAgfSwKPiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzk3LW1tc3lzIiwKPiAgICAgICAgICAgICAgICAgLmRh
dGEgPSAmbXQ2Nzk3X21tc3lzX2RyaXZlcl9kYXRhLAo+IC0tCj4gMi4yNi4yCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
