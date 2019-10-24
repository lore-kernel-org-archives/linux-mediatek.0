Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12239CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81FE20856
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InmvfuBF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWFTxBFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81FE20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26nop46hqkhH27H90Y6mjIBB+vgYKk0EUaXz+anH3Es=; b=InmvfuBFsH6TQo
	OtyWIP4TJt9vZWdvEC9a8jDmb9gpeFKoH5LEYdpvAqC55imhond1ho2BiaFsPr4+kJvvHsmeSMpiD
	H1k7bZaAiBiBVylXNzxebcJBXeUXy0VVVZEPOoUgn9lxt/jIkbAU9jEsi3ax/qpN3NuzaiH4SH2E3
	4tJmgB2UxSByZpyIYtBn7QlS+6TaaUMVntCY5HNMPJGeHrq3Rx17nufYIvwjXXDzAphou95Q6TfCs
	bV13oVxf4jDevPOv2BN0Pb/dECA8kJSw4F+z/w57OVNT366fx+zO+nFotNxUrB0zqMlRZiEL91ysO
	HSQWZpl0GIZgWC22RQaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNYUx-0007Tz-Fs; Thu, 24 Oct 2019 08:29:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNYUu-00076s-7Y
 for linux-mediatek@lists.infradead.org; Thu, 24 Oct 2019 08:29:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id v6so1666669wmj.0
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2019 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=G4vdb56f6clb5k1zxUC/hpMvO/EV60ACJWqtpC79nFU=;
 b=MWFTxBFoF/A1/WoBHVj4CbXYa/Pfi+Fu/HBTS1OD78S8XdVhAfAv2FPoim6z/HL0fJ
 bAsjZ+nQU7xuGOSLAMS2cU1WpogE6lpqKrhD0fwpRUWBooxdm7oatdnbiFT1vKMQRuXI
 YUesDSYrlrXY7rtIkZZGFVWVQMmXWOoDkYjmG/FlPyxrTaFiOsrgcX/deoqQpQrz8WC9
 eb7bHMF072EjgrW7DtfWSSoYwWX/Okev8BmdNZBQGxbi/4F2jWxN2L1lgUa8PMMJyWd2
 9WdYf7WE46xuvVtBI4kSOqH1p5U/DpO+hajtJZ1AcsTM2xKtX35hm8MaY5eHyUBhdkRQ
 8xLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=G4vdb56f6clb5k1zxUC/hpMvO/EV60ACJWqtpC79nFU=;
 b=LzDyispuNOLqK+4aiQWnPM2Uh7ra2HahQiffgWT1l31bhdkgWzWRUFLP4/cBtpmqVJ
 pR/oCMlCUo7kiONjySd+1zZ6MRYuzCnoSTm+e2IHTVibtBp5NTC+/x1ZLJaWqCvI8FeJ
 EBi2XAgRGS1y8gvsuMKY+vpg4AjbRui9ZerQir9XqREC4CrP6aFmr0brWeebBHQkwArv
 xKJ70k+1fTj+ecJX0XzXSBWDeHMWtOSiZ2zhXxG3V+yCjfZDIdL36Uyv3uoFK22UJ8EL
 giIHoQtgI9T9H9n0nD3V2WiZiNxBxKVUKnujozMC6jBZPEmFWjdojEbJHgd1T724hmaM
 6EjQ==
X-Gm-Message-State: APjAAAUi6tMs1A2R4a8B/E1XbuQ2t1xNVAU3AlJHc0A27g0zOCVEm2bi
 iOePxKOqfG+MGMc5LUix315kXw==
X-Google-Smtp-Source: APXvYqw2zO/n8ymN3AuSXm7TXS6NYxgbrnPVMDiRr7AlWcfRIHaJr278vr6HY3WfkjlqZz2KGKlL9A==
X-Received: by 2002:a7b:c049:: with SMTP id u9mr3667702wmc.12.1571905770490;
 Thu, 24 Oct 2019 01:29:30 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id j63sm2931576wmj.46.2019.10.24.01.29.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 01:29:29 -0700 (PDT)
Date: Thu, 24 Oct 2019 09:29:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20191024082928.GL15843@dell>
References: <1571749359-15752-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571749359-15752-1-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_012932_298553_FC8CBC11 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMiBPY3QgMjAxOSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBBZGQgbWZkIGRyaXZlciBmb3IgbXQ2MzYwIHBt
aWMgY2hpcCBpbmNsdWRlCj4gQmF0dGVyeSBDaGFyZ2VyL1VTQl9QRC9GbGFzaCBMRUQvUkdCIExF
RC9MRE8vQnVjawo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0
ZWsuY29tCj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTIg
Kwo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYyAgICAgICAgICB8IDQ1NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM2MC1wcml2YXRlLmggfCAy
NzkgKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCAg
ICAgICAgIHwgIDMyICsrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDc4MSBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAtcHJpdmF0ZS5oCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaAo+IAo+IGNoYW5nZWxvZ3MgYmV0
d2VlbiB2MSAmIHYyCj4gLSBpbmNsdWRlIG1pc3NpbmcgaGVhZGVyIGZpbGUKPiAKPiBjaGFuZ2Vs
b2dzIGJldHdlZW4gdjIgJiB2Mwo+IC0gYWRkIGNoYW5nZWxvZ3MKPiAKPiBjaGFuZ2Vsb2dzIGJl
dHdlZW4gdjMgJiB2NAo+IC0gZml4IEtjb25maWcgZGVzY3JpcHRpb24KPiAtIHJlcGxhY2UgbXQ2
MzYwX3BtdV9pbmZvIHdpdGggbXQ2MzYwX3BtdV9kYXRhCj4gLSByZXBsYWNlIHByb2JlIHdpdGgg
cHJvYmVfbmV3Cj4gLSByZW1vdmUgdW5uZWNlc3NhcnkgaXJxX2NoaXAgdmFyaWFibGUKPiAtIHJl
bW92ZSBhbm5vdGF0aW9uCj4gLSByZXBsYWNlIE1UNjM2MF9NRkRfQ0VMTCB3aXRoIE9GX01GRF9D
RUxMCgpbLi4uXQoKPiArLyogSVJRIGRlZmluaXRpb25zICovCj4gK3N0cnVjdCBtdDYzNjBfcG11
X2lycV9kZXNjIHsKPiArCWNvbnN0IGNoYXIgKm5hbWU7Cj4gKwlpcnFfaGFuZGxlcl90IGlycV9o
YW5kbGVyOwo+ICt9Owo+ICsKPiArI2RlZmluZSAgTVQ2MzYwX0RUX1ZBTFBST1AobmFtZSwgdHlw
ZSkgXAo+ICsJCQl7I25hbWUsIG9mZnNldG9mKHR5cGUsIG5hbWUpfQo+ICsKPiArc3RydWN0IG10
NjM2MF92YWxfcHJvcCB7Cj4gKwljb25zdCBjaGFyICpuYW1lOwo+ICsJc2l6ZV90IG9mZnNldDsK
PiArfTsKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtdDYzNjBfZHRfcGFyc2VyX2hlbHBlcihz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB2b2lkICpkYXRhLAo+ICsJCQkJCSAgIGNvbnN0IHN0cnVj
dCBtdDYzNjBfdmFsX3Byb3AgKnByb3BzLAo+ICsJCQkJCSAgIGludCBwcm9wX2NudCkKPiArewo+
ICsJaW50IGk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IHByb3BfY250OyBpKyspIHsKPiArCQlp
ZiAodW5saWtlbHkoIXByb3BzW2ldLm5hbWUpKQo+ICsJCQljb250aW51ZTsKPiArCQlvZl9wcm9w
ZXJ0eV9yZWFkX3UzMihucCwgcHJvcHNbaV0ubmFtZSwgZGF0YSArIHByb3BzW2ldLm9mZnNldCk7
Cj4gKwl9Cj4gK30KPiArCj4gKyNkZWZpbmUgTVQ2MzYwX1BEQVRBX1ZBTFBST1AobmFtZSwgdHlw
ZSwgcmVnLCBzaGlmdCwgbWFzaywgZnVuYywgYmFzZSkgXAo+ICsJCQl7b2Zmc2V0b2YodHlwZSwg
bmFtZSksIHJlZywgc2hpZnQsIG1hc2ssIGZ1bmMsIGJhc2V9Cj4gKwo+ICtzdHJ1Y3QgbXQ2MzYw
X3BkYXRhX3Byb3Agewo+ICsJc2l6ZV90IG9mZnNldDsKPiArCXU4IHJlZzsKPiArCXU4IHNoaWZ0
Owo+ICsJdTggbWFzazsKPiArCXUzMiAoKnRyYW5zZm9ybSkodTMyIHZhbCk7Cj4gKwl1OCBiYXNl
Owo+ICt9Owo+ICsKPiArc3RhdGljIGlubGluZSBpbnQgbXQ2MzYwX3BkYXRhX2FwcGx5X2hlbHBl
cih2b2lkICpjb250ZXh0LCB2b2lkICpwZGF0YSwKPiArCQkJCQkgICBjb25zdCBzdHJ1Y3QgbXQ2
MzYwX3BkYXRhX3Byb3AgKnByb3AsCj4gKwkJCQkJICAgaW50IHByb3BfY250KQo+ICt7Cj4gKwlp
bnQgaSwgcmV0Owo+ICsJdTMyIHZhbDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgcHJvcF9jbnQ7
IGkrKykgewo+ICsJCXZhbCA9ICoodTMyICopKHBkYXRhICsgcHJvcFtpXS5vZmZzZXQpOwo+ICsJ
CWlmIChwcm9wW2ldLnRyYW5zZm9ybSkKPiArCQkJdmFsID0gcHJvcFtpXS50cmFuc2Zvcm0odmFs
KTsKPiArCQl2YWwgKz0gcHJvcFtpXS5iYXNlOwo+ICsJCXJldCA9IHJlZ21hcF91cGRhdGVfYml0
cyhjb250ZXh0LAo+ICsJCQkgICAgIHByb3BbaV0ucmVnLCBwcm9wW2ldLm1hc2ssIHZhbCA8PCBw
cm9wW2ldLnNoaWZ0KTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJcmV0dXJuIHJldDsKPiArCX0K
PiArCXJldHVybiAwOwo+ICt9CgpXaGVyZSBhcmUgdGhlc2UgaGVscGVycyB1c2VkPwoKQXJlIHRo
ZXkgZ2VuZXJpYz8KCldoeSBhcmUgdGhleSBoZWxwZnVsIHRvIHlvdSwgYnV0IG5vdCBoZWxwZnVs
IHRvIGFueW9uZSBlbHNlPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vydmlj
ZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
