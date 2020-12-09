Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF0FC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 15:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B126823AFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 15:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B126823AFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S6WCwA4sW7qVMqty+wic2t0l//9ctFAbl6M0wzQlZy0=; b=NrqCntHp5a5re7CBeCcsfs904
	Y5u2A/H/7RfBJP82UslOLLSGTPdHpKAB2Svjc7+vLAapdQsMR9xH3OS5rvloHVscXOHvnYT2foMaC
	4/vgpQBd6KkXJm6SaOBMY3sXOY8o9WqXpPzTmKVbbBSD/UvCsfP17DPiWYMZ3OrBvS5+TNn8FLM4Y
	QvRfyMJoKhp5ePPjsX+QztuFWNGYCON/Cz1wXBXHDg9kW2OSDa7AL3/coNfdXIgO31zx/Q1RlJxSZ
	UHq8aT38+QwZhX0mT3LYFC3/Is8wkfMKHf84SAL/04IC+EzvwAjsJoXppcmp35fwr8tGQVsrEu9ud
	NZZkFa3Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn1Cr-0002Kw-PX; Wed, 09 Dec 2020 15:16:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn1Co-0002KQ-PU; Wed, 09 Dec 2020 15:16:39 +0000
X-Gm-Message-State: AOAM533wIOSwhCauBBFhWLHEtkeNfCGNKnjvApBDjoAxRNgqZbLB0oRm
 mcRoj1qCxP0zkpFbvnMSYSeShjyJCN7/A3vV8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607526997;
 bh=lVUITqM3wBlLLCMwZfMJJE4f8P3aH4i3cxhdHeLKdwE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WslH8wEmlVpqaDl71ybxROkTosAnZP58mHbwXHmgn/KI38WaeTN8BA4JdV3C+xvMZ
 i8dJqxq4c8PUOBSMyxbpqx8/C7mXUlTwuHgkO5/2T8H1pF0jg44W5S/e0YTVLVPJ4W
 vKp/R/jS8Kc6l4iIpg1xEPhgGD1LRCe+vT4t98ZyYRG6aFZ7zuNyCL+Tjf8eieD7LR
 Dx29Fbf7NdBz9dNDzN3DvVPLjZr4ud8XY9X2E3/ylTSr2/ykw79GOgXsKahQC2ffT7
 bL4JPdHOOFOJNZBiXfDfl3g9NmZCFCmvvxNLATGJAPxF2okXj3vGzIy3ws+XBnLrns
 Y45NeBVWeVS9g==
X-Google-Smtp-Source: ABdhPJwKxFDtBsXbsk4rVRivDcq095HuspZwD+RLbGAZbMuQnyG4S281nM/2/1U0U35e2e5hS5J+PlmqXXWbfmPT88E=
X-Received: by 2002:adf:9567:: with SMTP id 94mr910638wrs.394.1607526995364;
 Wed, 09 Dec 2020 07:16:35 -0800 (PST)
MIME-Version: 1.0
References: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607141728-17307-5-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCX+iPXVg-xqVKBGNTfJty=cu+MQYaujjv4NgTd1C740A@mail.gmail.com>
In-Reply-To: <CANMq1KCX+iPXVg-xqVKBGNTfJty=cu+MQYaujjv4NgTd1C740A@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Dec 2020 23:16:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY__2CQ5mo6f0mXNHqcOg_xUCAd7LjkXS2OCf341Dm6rNCg@mail.gmail.com>
Message-ID: <CAAOTY__2CQ5mo6f0mXNHqcOg_xUCAd7LjkXS2OCf341Dm6rNCg@mail.gmail.com>
Subject: Re: [PATCH v1, 4/5] soc: mediatek: cmdq: add address shift in jump
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_101638_994977_A16D9947 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCk5pY29sYXMgQm9pY2hhdCA8ZHJpbmtjYXRAY2hyb21pdW0ub3JnPiDm
lrwgMjAyMOW5tDEy5pyINeaXpSDpgLHlha0g5LiL5Y2IMzozMOWvq+mBk++8mgo+Cj4gT24gU2F0
LCBEZWMgNSwgMjAyMCBhdCAxMjoxNiBQTSBZb25ncWlhbmcgTml1Cj4gPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgYWRkcmVzcyBzaGlmdCB3aGVuIGNvbXBv
c2UganVtcCBpbnN0cnVjdGlvbgo+ID4gdG8gY29tcGF0aWJsZSB3aXRoIDM1Yml0IGZvcm1hdC4K
Pgo+IFRoaXMgbG9va3MgcmVhc29uYWJsZSwgYnV0IHRhc2stPmNtZHEtPnNoaWZ0X3BhIGlzIG5v
dCBuZXcgYW5kIHdhcwo+IGludHJvZHVjZWQgYXMgcGFydCBvZiBtdDY3NzkgR0NFIHN1cHBvcnQu
Cj4KPiBEbyB5b3Ugd2FudCB0byBhZGQgYSBGaXhlcyB0YWc/Cj4gRml4ZXM6IDA4NThmZGU0OTZm
OCAoIm1haWxib3g6IGNtZHE6IHZhcmlhYmxpemUgYWRkcmVzcyBzaGlmdCBpbiBwbGF0Zm9ybSIp
CgpBZGQgdGhpcyBmaXhlcyB0YWcsIGFuZCBtb3ZlIHRoaXMgcGF0Y2ggb3V0IG9mIHRoaXMgc2Vy
aWVzIGJlY2F1c2UKdGhpcyBwYXRjaCBpcyByZWxhdGVkIHRvIGFsbCBTb0Mgd2hvc2Ugc2hpZnRf
cGEgaXMgbm90IHplcm8uCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJldmlld2VkLWJ5OiBO
aWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVtLm9yZz4KPgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDMgKystCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9tYWls
Ym94L210ay1jbWRxLW1haWxib3guYwo+ID4gaW5kZXggMWMwMWZlMC4uNWVkMzlmOCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+IEBAIC0xNzQsNyArMTc0LDggQEAg
c3RhdGljIHZvaWQgY21kcV90YXNrX2luc2VydF9pbnRvX3RocmVhZChzdHJ1Y3QgY21kcV90YXNr
ICp0YXNrKQo+ID4gICAgICAgICBkbWFfc3luY19zaW5nbGVfZm9yX2NwdShkZXYsIHByZXZfdGFz
ay0+cGFfYmFzZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJldl90YXNr
LT5wa3QtPmNtZF9idWZfc2l6ZSwgRE1BX1RPX0RFVklDRSk7Cj4gPiAgICAgICAgIHByZXZfdGFz
a19iYXNlW0NNRFFfTlVNX0NNRChwcmV2X3Rhc2stPnBrdCkgLSAxXSA9Cj4gPiAtICAgICAgICAg
ICAgICAgKHU2NClDTURRX0pVTVBfQllfUEEgPDwgMzIgfCB0YXNrLT5wYV9iYXNlOwo+ID4gKyAg
ICAgICAgICAgICAgICh1NjQpQ01EUV9KVU1QX0JZX1BBIDw8IDMyIHwKPiA+ICsgICAgICAgICAg
ICAgICAodGFzay0+cGFfYmFzZSA+PiB0YXNrLT5jbWRxLT5zaGlmdF9wYSk7Cj4gPiAgICAgICAg
IGRtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKGRldiwgcHJldl90YXNrLT5wYV9iYXNlLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X3Rhc2stPnBrdC0+Y21kX2J1
Zl9zaXplLCBETUFfVE9fREVWSUNFKTsKPiA+Cj4gPiAtLQo+ID4gMS44LjEuMS5kaXJ0eQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
