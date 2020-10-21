Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922FBC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:40:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143F12415A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8QmcuU9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQrLTALI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143F12415A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8WbvT2oCo+qShGj5shcg0IFmINsAP1BJwPrcVCR6riA=; b=J8QmcuU9cupPwZ6KKtcSPoYzu
	hyUXcji65gNlMm8NygApnFAJ6ag6k90TKXnUDrTBgZ3q+2/G7DLAEmq2ek2wNCrScwKDr7boIzs/J
	fuwONXm8dMfycMuNDzsjTqNAYPiDCX+IrZY8kqMr7+eNHSXqNMEs39zy96eNIBz2BGIsmLIznY/KG
	auJ0scI8eEuUTzaJHxfkwWJlODnnaaFTZ9A/anv48KkaKq5qOHF7BtFiV/kAIPCmCtpoCk7cekQm2
	qJo6sLQKaarBvFXe4m+laemmyqq6CcdbPGniXFiryDM9AVPo9GwcsWs2VFtakf+9ZrrQbGCMxjVaO
	vMH9E7/1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVNiT-0001wx-3A; Wed, 21 Oct 2020 23:40:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVNiM-0001uZ-AI; Wed, 21 Oct 2020 23:40:19 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D18CB24170;
 Wed, 21 Oct 2020 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603323617;
 bh=60CB1P6lj5vilv39JcGYocCEwfSkX0XlX0Q2dSY3mnY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OQrLTALI6RqWKnh7pzPyUOp9HHoZ280Nw/C7Iw8eOrjJ4XzofJDiEVzqHh6lV+yuv
 R+I/EubKjpWUOLMxjd2SbRyjf9889KdfMFEUoXxOkaSK4iFuMaIdnCvLUQqc3n8Smo
 utwKykVJ20PAqcQ2QcqiWbaGXpBgzXGZYQDYXIe4=
Received: by mail-ej1-f51.google.com with SMTP id w27so1770448ejb.3;
 Wed, 21 Oct 2020 16:40:16 -0700 (PDT)
X-Gm-Message-State: AOAM530ibU0L+bear2fvXmgBpzwpZ56oVVxwSaTd/akXtvDL0eNfQE1j
 zW7Gs94ORvgeGi0C8/tMGqGq5S2cmW0xHIgjgA==
X-Google-Smtp-Source: ABdhPJxx6xQUTYR8DUpWL6giPFZWBpFC3XJxcgE4mykKR3QL/7w8AP7UsYeOQzysJO0h74S6Fp4Owl4F/mPKkzzwQJo=
X-Received: by 2002:a17:906:c293:: with SMTP id
 r19mr5629737ejz.63.1603323615300; 
 Wed, 21 Oct 2020 16:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-2-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 07:40:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8oFA8ug1QRcK=OyEbFQGRZJioQXtnE=3y6JT+WFCd3bg@mail.gmail.com>
Message-ID: <CAAOTY_8oFA8ug1QRcK=OyEbFQGRZJioQXtnE=3y6JT+WFCd3bg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_194018_499245_5F3BC31C 
X-CRM114-Status: GOOD (  18.42  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IEFkZCBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogRmFiaWVu
IFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggMTIxMjIwNzQ1ZDQ2Li4z
Mzk3N2UxNWJlYmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4
dAo+IEBAIC00Myw3ICs0Myw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBi
bG9ja3MpOgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAgICAgICAgICAg
IC0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0Cj4gICAgICAgICAibWVkaWF0
ZWssPGNoaXA+LWRpc3AtbXV0ZXgiICAgICAgICAgICAgLSBkaXNwbGF5IG11dGV4Cj4gICAgICAg
ICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atb2QiICAgICAgICAgICAgICAgLSBvdmVyZHJpdmUKPiAt
ICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQyNzEyIGFuZCBtdDgx
NzMuCj4gKyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwg
bXQ4MTY3IGFuZCBtdDgxNzMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxl
bmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UKPiAgLSBpbnRlcnJ1cHRz
OiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQs
IGV4Y2VwdCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4KPiBAQCAt
NTksNyArNTksNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiCj4gICAgICAgICAibWVkaWF0ZWss
PGNoaXA+LWRpc3AtcmRtYSIKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIgo+
IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSBhbmQgbXQ4MTczLgo+ICsgIHRoZSBz
dXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ4MTY3IGFuZCBtdDgxNzMuCj4gIC0gbGFyYjog
U2hvdWxkIGNvbnRhaW4gYSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBsb2NhbCBhcmJpdGVyIGRl
dmljZSBhcyBkZWZpbmVkCj4gICAgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9tZWRpYXRlayxzbWktbGFyYi50eHQKPiAgLSBpb21tdXM6IFNo
b3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9jayB3aXRoIG1hc3RlciBwb3J0
IGFzCj4gLS0KPiAyLjI4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
