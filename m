Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C834FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 09:54:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956C520775
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 09:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0a1UYAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb1zTsF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 956C520775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s8k8iIzQsPkUBqyXtUYgyS60CIU/95iI6Mw2K3cXZA0=; b=t0a1UYAVVCyaDPg7KybwP0mMr
	Zyx2Fb6NLzXuiNar9i15vI4w+72kaxWAQrB87SnpM2TSuw5XUjCHBVKpQTmeGb7IJ8lNRsLPO5umg
	F7TNLjTUjcfGfoLvT+pzmbTLE06Hvu152N8wMWY/smbI5s7N5dGOqwkuzKdUnLfu7nmQn1knWQg9L
	E94FhRd9LOI00zvpoQa8TK/nwrcpSllAgcIM5KG/LKht345aZ1pwv8+ElsghoenjqaUHcNNWSABEx
	zm4B42XFnOxr2wat4PLrJqplpCPFs0aBYyRgfzFKn4EitgvGjp+/sD5+uOBR1k3FQCrh+Ybn3iKFM
	/qNLJ4XGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw0aR-0001Fn-C1; Thu, 16 Jul 2020 09:53:55 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw0aN-0001EB-6G; Thu, 16 Jul 2020 09:53:52 +0000
Received: by mail-io1-xd44.google.com with SMTP id v6so5370505iob.4;
 Thu, 16 Jul 2020 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+x0RURjDsb6r2gazasWw0snGZpzKhvm0nC6pQGgI0Is=;
 b=Gb1zTsF12JWdG85+D5/yO7b7v1H0ENSfY/qywxTruBppe7aQcsXMRKHYb4N+aBeMui
 yJBoiSi+LAuTUJpA0LVkMW44oLxuRm6frqvAURwtRY/FsEoij0vDo/pX1Js5lCbbuXIT
 yf5DdFGbUxmYRBs4jNLU+IwoWjRLFH8MPBkJ2UIlSRv+0RxjL+lva3GJoUZKRLNamhhU
 j5hBzLXUZqQH1HAZEiUFUZDgtcl+SE/wBOWvclTPFsp7nUIevbigsoKct8m5v0FuFAKL
 B9CCDuIdPd/TKmCaVHQRMX+f1eMP7zrOgoGP5Qx6/CMx74aySIqWfARTcqww2yTgO67M
 +nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+x0RURjDsb6r2gazasWw0snGZpzKhvm0nC6pQGgI0Is=;
 b=TpfixfEveRoHkYQQ0ZhMlmpOca2mfcNbxYGdL8BkODC5eMK8ngjNRJTvTxjk/6m2gH
 4D7WlAceRVLulMhOGLSpEJpHQ57k9JkkfYb+GeX0ORo/YHTzRs7N8uXsIuZmNjZy71JP
 t4GV3grFSse4a4HZ2JARNsGA7BFIJ2kMAteqdPh3HIdX992RXPGjWNsGnpgt2edOwCmM
 Q94CHt2QBKFxk6nGfrRIx5PF+Iga9RxJ14lNG24qWqSQ9z12K1mdBtbXTuR3EEGPA/bX
 VJYq2El61Yd5x+y2PpiIwx3EbG+QRGKvOcWUgKBySw/Awvu874jppHgVBGyFAiRLMaCv
 px1g==
X-Gm-Message-State: AOAM531Mf1vgiY9L0Vlo7sYbmfe4QwYpYaSds0ISGDPzB+guOU5931KF
 5TKdWhgSqgyoEOS8vRyaogYSYefmE/HZEW4Qjrw=
X-Google-Smtp-Source: ABdhPJxgaqlVL9z0xbOCPaV1IajyUWWKOmB+QsBAeF5HXryQlDNC6lZkU9CaVx+4BEf1/DlbTF2Vk7Nc07pLpnWeCYg=
X-Received: by 2002:a02:30ca:: with SMTP id q193mr4259586jaq.125.1594893227833; 
 Thu, 16 Jul 2020 02:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-4-git-send-email-gene.chen.richtek@gmail.com>
 <3205bb9b-c7b4-c99a-2673-f3a56cc0addf@gmail.com>
In-Reply-To: <3205bb9b-c7b4-c99a-2673-f3a56cc0addf@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 16 Jul 2020 17:53:36 +0800
Message-ID: <CAE+NS36LOqnG+toSQcxVAeQHUqyvs9Z39tU7-ijkAntRUH6uqg@mail.gmail.com>
Subject: Re: [PATCH 3/4] mfd: mt6360: Fix flow which is used to check ic exist
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_055351_268294_E2C19BB6 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjDlubQ35pyI
MTDml6Ug6YCx5LqUIOS4i+WNiDEwOjI15a+r6YGT77yaCj4KPgo+Cj4gT24gMDcvMDcvMjAyMCAx
MjozMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5Acmlj
aHRlay5jb20+Cj4gPgo+ID4gRml4IGZsb3cgd2hpY2ggaXMgdXNlZCB0byBjaGVjayBpYyBleGlz
dAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29t
Pgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgIHwgMjggKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCB8ICA4
ICsrKystLS0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMg
Yi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiBpbmRleCAyZGQ1OTE4Li40YmIyOTQ5IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gKysrIGIvZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gQEAgLTI5Myw2ICsyOTMsMjMgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtZmRfY2VsbCBtdDYzNjBfZGV2c1tdID0gewo+ID4gICAgICAgICAgICAgICAgICAg
TlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC10Y3BjIiksCj4gPiAgIH07Cj4gPgo+ID4gK3N0
YXRpYyBpbnQgbXQ2MzYwX2NoZWNrX3ZlbmRvcl9pbmZvKHN0cnVjdCBtdDYzNjBfZGF0YSAqZGF0
YSkKPiA+ICt7Cj4gPiArICAgICB1MzIgaW5mbzsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4g
PiArICAgICByZXQgPSByZWdtYXBfcmVhZChkYXRhLT5yZWdtYXAsIE1UNjM2MF9SRUdfUE1VX0RF
VklORk8sICZpbmZvKTsKPiA+ICsgICAgIGlmIChyZXQgPCAwKQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKChpbmZvICYgTVQ2MzYwX0NISVBWRU5fTUFT
SykgIT0gTVQ2MzYwX0NISVBWRU5fVkFMKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsKPiA+ICsKPiA+ICsgICAgIGRhdGEtPmNoaXBfcmV2ID0gaW5mbyAmIE1UNjM2MF9DSElQUkVW
X01BU0s7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgIHN0YXRp
YyBjb25zdCB1bnNpZ25lZCBzaG9ydCBtdDYzNjBfc2xhdmVfYWRkcltNVDYzNjBfU0xBVkVfTUFY
XSA9IHsKPiA+ICAgICAgIE1UNjM2MF9QTVVfU0xBVkVJRCwKPiA+ICAgICAgIE1UNjM2MF9QTUlD
X1NMQVZFSUQsCj4gPiBAQCAtMzAzLDcgKzMyMCw2IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBz
aG9ydCBtdDYzNjBfc2xhdmVfYWRkcltNVDYzNjBfU0xBVkVfTUFYXSA9IHsKPiA+ICAgc3RhdGlj
IGludCBtdDYzNjBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiA+ICAgewo+ID4g
ICAgICAgc3RydWN0IG10NjM2MF9kYXRhICpkYXRhOwo+ID4gLSAgICAgdW5zaWduZWQgaW50IHJl
Z19kYXRhOwo+ID4gICAgICAgaW50IGksIHJldDsKPiA+Cj4gPiAgICAgICBkYXRhID0gZGV2bV9r
emFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gPiBAQCAt
MzE5LDE2ICszMzUsMTAgQEAgc3RhdGljIGludCBtdDYzNjBfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoZGF0YS0+cmVnbWFw
KTsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICByZXQgPSByZWdtYXBfcmVhZChkYXRhLT5yZWdt
YXAsIE1UNjM2MF9QTVVfREVWX0lORk8sICZyZWdfZGF0YSk7Cj4gPiArICAgICByZXQgPSBtdDYz
NjBfY2hlY2tfdmVuZG9yX2luZm8oZGF0YSk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAtICAg
ICAgICAgICAgIGRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRGV2aWNlIG5vdCBmb3VuZFxuIik7Cj4g
PiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAtICAgICB9Cj4gPiAtCj4gPiAtICAgICBk
YXRhLT5jaGlwX3JldiA9IHJlZ19kYXRhICYgQ0hJUF9SRVZfTUFTSzsKPiA+IC0gICAgIGlmIChk
YXRhLT5jaGlwX3JldiAhPSBDSElQX1ZFTl9NVDYzNjApIHsKPgo+IFdoeSBub3Qgb25seSBhcHBs
eWluZyB0aGUgTUFTSyBoZXJlIGluc3RlYWQgb2YgcHV0IHRoaXMgYWxsIGluIGEgbmV3IGZ1bmN0
aW9uPwo+CgpJIHRoaW5rIG1lcmdlIHRoZSBpYyBjaGVjayBmbG93IGludG8gZnVuY3Rpb24gaXMg
d2VsbC1vcmdhbml6ZWQuCmlmIG5vdCwgaSBjYW4gcmVzdG9yZSB0aGUgc2FtZSBhcyBiZWZvcmUu
Cgo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKCZjbGllbnQtPmRldiwgIkRldmljZSBub3Qgc3Vw
cG9ydGVkXG4iKTsKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgcmV0ID0gZGV2bV9y
ZWdtYXBfYWRkX2lycV9jaGlwKCZjbGllbnQtPmRldiwgZGF0YS0+cmVnbWFwLCBjbGllbnQtPmly
cSwKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCBiL2luY2x1ZGUv
bGludXgvbWZkL210NjM2MC5oCj4gPiBpbmRleCA5ZmM2NzE4Li41ZWMwZjVkIDEwMDY0NAo+ID4g
LS0tIGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgv
bWZkL210NjM2MC5oCj4gPiBAQCAtMzAsNyArMzAsNyBAQCBzdHJ1Y3QgbXQ2MzYwX2RhdGEgewo+
ID4gICB9Owo+ID4KPiA+ICAgLyogUE1VIHJlZ2lzdGVyIGRlZmluaW5pdGlvbiAqLwo+ID4gLSNk
ZWZpbmUgTVQ2MzYwX1BNVV9ERVZfSU5GTyAgICAgICAgICAgICAgICAgICgweDAwKQo+ID4gKyNk
ZWZpbmUgTVQ2MzYwX1JFR19QTVVfREVWSU5GTyAgICAgICAgICAgICAgICAgICAgICAgKDB4MDAp
Cj4gPiAgICNkZWZpbmUgTVQ2MzYwX1BNVV9DT1JFX0NUUkwxICAgICAgICAgICAgICAgICAgICAg
ICAoMHgwMSkKPiA+ICAgI2RlZmluZSBNVDYzNjBfUE1VX1JTVDEgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICgweDAyKQo+ID4gICAjZGVmaW5lIE1UNjM2MF9QTVVfQ1JDRU4gICAgICAgICAg
ICAgICAgICAgICgweDAzKQo+ID4gQEAgLTIzMyw4ICsyMzMsOCBAQCBzdHJ1Y3QgbXQ2MzYwX2Rh
dGEgewo+ID4gICAjZGVmaW5lIE1UNjM2MF9JUlFfUkVHTlVNICAgMTYKPiA+ICAgI2RlZmluZSBN
VDYzNjBfSVJRX1JFVFJJRyAgIEJJVCgyKQo+ID4KPiA+IC0jZGVmaW5lIENISVBfVkVOX01BU0sg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgweEYwKQo+ID4gLSNkZWZpbmUgQ0hJUF9W
RU5fTVQ2MzYwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDB4NTApCj4gPiAtI2RlZmlu
ZSBDSElQX1JFVl9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMHgwRikKPiA+
ICsjZGVmaW5lIE1UNjM2MF9DSElQVkVOX01BU0sgICAgICAgICAgICAgICAgICAoMHhGMCkKPiA+
ICsjZGVmaW5lIE1UNjM2MF9DSElQVkVOX1ZBTCAgICAgICAgICAgICAgICAgICAoMHg1MCkKPiA+
ICsjZGVmaW5lIE1UNjM2MF9DSElQUkVWX01BU0sgICAgICAgICAgICAgICAgICAoMHgwRikKPgo+
IFNhbWUgaGVyZSBhcyBpbiB0aGUgb3RoZXIgcGF0Y2hlcy4gRG9uJ3QganVzdCByZW5hbWUgZGVm
aW5lcyBpZiB0aGVyZSBpcyBubyBnb29kCj4gcmVhc29uLgo+CgpJcyBlYXN5IHRvIHJlYWQgYSBn
b29kIHJlYXNvbiB0byByZW5hbWUgaXQ/CmlmIG5vdCwgaSBjYW4gcmVzdG9yZSB0aGUgc2FtZSBh
cyBiZWZvcmUuCgo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKPgo+ID4KPiA+ICAgI2VuZGlmIC8qIF9f
TVQ2MzYwX0hfXyAqLwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
