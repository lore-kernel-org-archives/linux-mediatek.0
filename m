Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35668C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 14:49:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4A222518
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4A222518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e2YkHz9pGPeUdkmQEXq3rJivboRq4zg73PpO4LDAl0Q=; b=UqzdHOYteZcqiNkVyFgVON/RP
	gQA4dY29SesjfecZY99zY/08AEQyCdTijWkUPwXEsWjauYccGo6BCJG9HJ1C4TbhZUe1L16OSBqqe
	ZberAKasfu9VPizbCqTGfoupZXVsNMWZp6/KQkAsPPNq1HHif7xayk6m9Jy/kOA4QnhgaBA6JJiKf
	wJNJgg+ZLR7Ze8+/8EpcqrcJFkel9F4sz0b/IH8Hd8xRUGqhpOa6NeKx1KWf9MI3E+wDqqfuR6FKT
	ngz2hMiDHSwG66ODKfemyi/IA/VONa5Z2m144hNtmjyiqx2AXBogAZf4L+UdqKTgTsECewZq2dD64
	sHJoLETLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpBdv-00020J-42; Tue, 15 Dec 2020 14:49:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpBdq-0001z2-6t; Tue, 15 Dec 2020 14:49:31 +0000
X-Gm-Message-State: AOAM533wg1LCp3tNZ7D5JkCopv/BczIHMbPA2SV5XbB/LDHDgLMYrXBr
 N4AWzpEAC7+Igap0dZpXCiXC08dPpOyWtCGEAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608043769;
 bh=pcW98idFE8j4CPrJmo7rwXxa0kGRpcZ4oIUzDbC2c/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HPoLcBk9VIqe4+/U+MkqxElc8KoM3OHM8y3hCkubQRLWCE0WGc3ZqIfxv7wJxu41l
 uJ1RSIbwfWFbMv22NqGaJ6yRSetwY33+YD2trssPf3h2l0ezrngjHJCI5SeBt+5o1X
 p7O3WNyttX1eLLzEvZ5OgSDzqazuvVTz9q6ZCZQgeMyj6xKmKfXf9Wi0CvzRsLwB0b
 vMs7rvUc6LIkif5P1VePoQQoiu2WNdQLRSLuuwrZV519O3Vs2lJ0jPJCcN3JlpbtZP
 nW1SesrHlIMF2k90mtr6IhadmEuHVVhkk+4XNEVvzehXeFTVYyezJ+l50dmthTHzJn
 H1G0cvQ1F9obA==
X-Google-Smtp-Source: ABdhPJzVIhS7/7kGUOi+nJf5HUvRGw0qwmZ5xmolBwFv7MPtxTCbsdxcHfV1ADt98+QRviRZJRXHnIf61pDNrmVvoE4=
X-Received: by 2002:adf:e60f:: with SMTP id p15mr3067578wrm.60.1608043767643; 
 Tue, 15 Dec 2020 06:49:27 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Dec 2020 22:49:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
Message-ID: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
Subject: Re: [PATCH v2,
 01/17] dt-bindings: mediatek: add description for postmask
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_094930_324970_E776B85D 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgZGVzY3JpcHRpb24gZm9yIHBvc3RtYXNrCgpXaGF0IGlzIHBvc3RtYXNrPyBJIGdvb2dsZSBp
dCBhbmQgZmluZCBhIHBvc3RtYXNrIEVDTy4gU28gaXQgaXMgcG9zdG1hc2sgRUNPPwoKUmVnYXJk
cywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dAo+IGluZGV4IDVjYTY5M2EuLjE5NzJmYTcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBAIC0zNyw2ICszNyw3IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlw
Pi1kaXNwLWFhbCIgICAgICAgICAgICAgIC0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250cm9s
bGVyCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiICAgICAgICAgICAgLSBn
YW1tYSBjb3JyZWN0aW9uCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtbWVyZ2UiICAg
ICAgICAgICAgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291cmNlcwo+ICsgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3RtYXNrIiAgICAgICAgIC0gcG9zdCBtYXNrCj4gICAg
ICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAgICAgICAgICAgLSBzcGxpdCBzdHJl
YW0gdG8gdHdvIGVuY29kZXJzCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIg
ICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVuZ2luZQo+ICAgICAgICAgIm1lZGlhdGVr
LDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRp
YXRlayxkc2kudHh0Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
