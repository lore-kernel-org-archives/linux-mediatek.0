Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5724CC07E95
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 01:25:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179EB61278
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 01:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 179EB61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAaTPDtIl4FnYdRJ8KyWfHQy9KB4/MvzdBL/K8CKJ/o=; b=swq+mhsUHhJ9bf
	wPI7B1kOtziEH6p9Atmiu4cHyFkIBJlMQWZrdwsHPjKwDnZkalSYY3uuvHR4xzNO4ozf9DriXXr4Y
	Uou1qu58Kx5wsI5Xe3e4YyJvegdGsKtquAb9T4uG4Al08mZ+kvHwrpKOeqxPVtlNO2CdrRgf5+J7o
	Xofsd11u9O1l7bq2kZiHLClpKTNq+2BkTpPnCT4EICNsSflzb1tASaDHtwidMDxAndvMhPWxpKKQS
	ELJzx75O9ZHFveQ0xntXdIX1Qt5vlIcMSjLPnyf0/i7wjeoh9bHIGWJtz554LlbLvbclQp+CbCPOy
	+lHvlw5mGhmhIZ7ZFt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2ODF-004SSi-Vj; Sun, 11 Jul 2021 01:24:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2OD2-004SPL-Ct; Sun, 11 Jul 2021 01:24:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0356A61289;
 Sun, 11 Jul 2021 01:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625966680;
 bh=aIP2rlDtTS95T8nU3RpDMo/i3IGTjw9lAhxt99Ve+t4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Aehw4Ww2zJPJDh2kaIPxE80Co270FEMDET0Acek5TQh13xsNVh561M2xT++vfYzAE
 GDWY6JH+DQJooHuscpBRD/nlbV02w+t+BoKwUAujiUiSuochhFm1Yot8Lau4UxZTCc
 WrdVfG1xL7Eizcop2AJ17RstOFCqZqb/zsr8bG1W028mB05f+4P07C9DG4lwKrzOuj
 bG/XYsr7bFyTK0iwiDKDsVRYmEfcpbnhoMOCPFtgR0HvrGYezZcIQ9dq+HgjXuern2
 NEY1N/7EVGcw6Lxt0nALOn3CaDfj+/6Nw0BdsIkfAMtyoZnQg4U23qkAJYAzln2erw
 +YvId/DzB/zgA==
Received: by mail-ej1-f41.google.com with SMTP id nd37so25115074ejc.3;
 Sat, 10 Jul 2021 18:24:39 -0700 (PDT)
X-Gm-Message-State: AOAM530/Mh/PUz0HiZP1J+pHgZYopF7JhEWI2nBk5hk7OMeQ0s2LqNBy
 isTZ/3asiEBhK8pSdpaYorheRclja+f09SAqVg==
X-Google-Smtp-Source: ABdhPJzOB3OuozcAvCO20qScosy+mz5YpXjiMYn8K2UdgrwIS1/Jxx9i8zT/7TyLVmk2TgpB4VxmTEd5nCx53LCPzaQ=
X-Received: by 2002:a17:906:7e4f:: with SMTP id
 z15mr42435846ejr.194.1625966678643; 
 Sat, 10 Jul 2021 18:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 11 Jul 2021 09:24:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9wvVJ6zZDmOt-8zJK2BkLtEO-h6QQRVkbc8q5QXtns3g@mail.gmail.com>
Message-ID: <CAAOTY_9wvVJ6zZDmOt-8zJK2BkLtEO-h6QQRVkbc8q5QXtns3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add MediaTek SoC DRM (vdosys0) support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_182440_516328_EA239B70 
X-CRM114-Status: GOOD (  13.22  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDfmnIgxMOaXpSDpgLHlha0g5LiL5Y2INzozOOWvq+mBk++8mgo+Cj4gVGhlIGhhcmR3
YXJlIHBhdGggb2YgdmRvc3lzMCB3aXRoIGVEUCBwYW5lbCBvdXRwdXQgbmVlZCB0byBnbyB0aHJv
dWdoCj4gYnkgc2V2ZXJhbCBtb2R1bGVzLCBzdWNoIGFzLCBPVkwsIFJETUEsIENPTE9SLCBDQ09S
UiwgQUFMLCBHQU1NQSwKPiBESVRIRVIsIERTQyBhbmQgTUVSR0UuCgpZb3Ugc2hvdWxkIGFkZCB0
aGUgZGlmZmVyZW5jZSBpbiBlYWNoIHZlcnNpb24uIFsxXSBpcyBhbiBleGFtcGxlIGZvciB0aGlz
LgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9jb3Zlci8yMDIxMDcwOTAyMjMyNC4xNjA3ODg0LTEtZWl6YW5AY2hyb21pdW0ub3JnLwoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBBZGQgRFJNIGFuZCB0aGVzZSBtb2R1bGVzIHN1cHBvcnQg
YnkgdGhlIHBhdGNoZXMgYmVsb3c6Cj4KPiBqYXNvbi1qaC5saW4gKDkpOgo+ICAgZHQtYmluZGlu
Z3M6IG1lZGlhdGVrOiBhZGQgZGVmaW5pdGlvbiBmb3IgbXQ4MTk1IGRpc3BsYXkKPiAgIGR0LWJp
bmRpbmdzOiBtZWRpYXRlazogYWRkIERTQyBkZWZpbml0aW9uIGZvciBtdDgxOTUKPiAgIGR0LWJp
bmRpbmdzOiBhcm06IG1lZGlhdGVrOiBhZGQgZGVmaW5pdGlvbiBmb3IgbXQ4MTk1IG1tc3lzCj4g
ICBhcm02NDogZHRzOiBtdDgxOTU6IGFkZCBkaXNwbGF5IG5vZGUgZm9yIHZkb3N5czAKPiAgIHNv
YzogbWVkaWF0ZWs6IGFkZCBtdGstbW1zeXMgc3VwcG9ydCBmb3IgbXQ4MTk1IHZkb3N5czAKPiAg
IHNvYzogbWVkaWF0ZWs6IGFkZCBtdGstbXV0ZXggc3VwcG9ydCBmb3IgbXQ4MTk1IHZkb3N5czAK
PiAgIGRybS9tZWRpYXRlazogYWRkIG1lZGlhdGVrLWRybSBvZiB2ZG9zeXMwIHN1cHBvcnQgZm9y
IE1UODE5NQo+ICAgZHJtL21lZGlhdGVrOiBhZGQgRFNDIHN1cHBvcnQgZm9yIE1UODE5NQo+ICAg
ZHJtL21lZGlhdGVrOiBhZGQgTUVSR0Ugc3VwcG9ydCBmb3IgTVQ4MTk1Cj4KPiAgLi4uL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQgIHwgIDE1ICsKPiAgLi4uL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgIHwgICA5ICstCj4gIC4uLi9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sICAgICAgICB8ICA1NyArKwo+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpICAgICAgfCAxMTEgKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmggICAgICAgfCAgMTYgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHNjLmMgICAgICAgfCAyMDUgKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyAgICAgfCA1MjUgKysr
KysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
LmMgICAgICB8ICAgNiArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
aCAgICAgICB8ICAxNCArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMgICB8ICAyOSArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmggICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
ICAgICAgICB8ICAzMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
aCAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxOTUtbW1zeXMuaCAg
ICAgICAgICAgfCAxOTEgKysrKysrKwo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
YyAgICAgICAgICAgICAgfCAgMTEgKwo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0ZXgu
YyAgICAgICAgICAgICAgfCAxMDcgKysrLQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuaCAgICAgICAgfCAgMTAgKwo+ICAxOCBmaWxlcyBjaGFuZ2VkLCAxMzM3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFt
bAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X2RzYy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfbWVyZ2UuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXQ4MTk1LW1tc3lzLmgKPgo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
