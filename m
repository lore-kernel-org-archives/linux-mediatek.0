Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B789C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C455C61221
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C455C61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMaIBMvKBoXXcvbFB+orR7AHb9w108xbsy4+n2qNPUI=; b=gJTvWbwaafw+Oj
	v0gurB79r2kcIBzyAMVPKHccxeJ9StFl0aKoH1BFf/c+4v9eUJEWnNsW667pg35EDBWgoBdO8iS0r
	NnHU+zxGtBJAmbkStLXlZEicBrL3Jc7P7Obwl9awFfjjWCYzwibiTWWlq46tn21kAs4kt9iSr6QmU
	GNZ/SmrD/V5BGiUqSVhuej1OSdcs0cbdEiLKnvfktYz1uFCHd0I3j0pDyU8xAWpT8vsAkPR99nOy7
	e9H4UBvXIlqkCR+sAxn1eRE1Ti/WaJ+Z9N9TtK+LRMUiT+UmfjpUcowfMmJ7cyQ+wQvYqzePuG6I9
	e8VpjSJoWRzaEczU0BIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6a2g-001upA-8G; Thu, 22 Jul 2021 14:51:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6a2Q-001und-DR; Thu, 22 Jul 2021 14:51:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 181AF61278;
 Thu, 22 Jul 2021 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626965462;
 bh=rDztPuOCPFJ2+9Ze3k5dwFEynafTrGKeqobicVKw0AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FItAMBymdxGzE4ZHnb6y7paPVcwIvjAQoCODh7Z7Y9b2pREP3xZLYJVFFc8i6JaI6
 NKwsseq8ZxOu0uGb2GWdT5RT8ytt3z6CxOfxoujOICsIByCHCntEwzUsd+9UZf7yRP
 Pz/cjokpbvQJJ/VkRqc77RDTmz5QwQrifU0+ssD70ahtWjKp+fPFhaQp0IwzRHe/uc
 1cCFxb4mIZDDGWcqpMvelgnPv04SD1FwFyl84Thqyrbg8Fsmj0V++uYSJi8TyHJ+wx
 NlIp7b80918wMbpVsNOqfXFa7KhNM1r39xSFDW4ajWj3eB1BmAmcf/Xp3SLm4y3ahk
 3SZpZ7AE4L0fA==
Received: by mail-ej1-f43.google.com with SMTP id dp20so8764396ejc.7;
 Thu, 22 Jul 2021 07:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM533FfegUhZGyUbFQvO8i77zZjPa0G9+UG/EPO07arXN2ZJnYz1Eh
 IJOrxuTCqXv+RV0UAH+jjUxAEeRqpR6imE7gTg==
X-Google-Smtp-Source: ABdhPJz5/mZnlsGNENhdYohpLuYZ4p4GiuUxXURD2qTRYS9LvglwExorQzU2DBR/RKJAnW7NgpdmBLF7z8dFTiQQSug=
X-Received: by 2002:a17:906:c097:: with SMTP id
 f23mr293790ejz.194.1626965460605; 
 Thu, 22 Jul 2021 07:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210712094657.1159299-1-hsinyi@chromium.org>
In-Reply-To: <20210712094657.1159299-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Jul 2021 22:50:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8b7KjPG+MarO8Z74FqpCOyDwnHmON2xMUvc6pub6Mjjg@mail.gmail.com>
Message-ID: <CAAOTY_8b7KjPG+MarO8Z74FqpCOyDwnHmON2xMUvc6pub6Mjjg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk-dpi: Set out_fmt from config if not the
 last bridge
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 Jitao Shi <jitao.shi@mediatek.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_075102_516129_903967F8 
X-CRM114-Status: GOOD (  15.88  )
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

SGksIEhzaW4teWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0N+aciDEy5pelIOmAseS4gCDkuIvljYg1OjQ35a+r6YGT77yaCj4KPiBhdG9taWNfZ2V0X291
dHB1dF9idXNfZm10cygpIGlzIG9ubHkgY2FsbGVkIHdoZW4gdGhlIGJyaWRnZSBpcyB0aGUgbGFz
dAo+IGVsZW1lbnQgaW4gdGhlIGJyaWRnZSBjaGFpbi4KPgo+IElmIG10ay1kcGkgaXMgbm90IHRo
ZSBsYXN0IGJyaWRnZSwgdGhlIGZvcm1hdCBvZiBvdXRwdXRfYnVzX2NmZyBpcwo+IE1FRElBX0JV
U19GTVRfRklYRUQsIGFuZCBtdGtfZHBpX2R1YWxfZWRnZSgpIHdpbGwgZmFpbCB0byB3cml0ZSBj
b3JyZWN0Cj4gdmFsdWUgdG8gcmVncy4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsx
XSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1maXhlcwoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBGaXhlczogZWM4NzQ3YzUyNDM0ICgiZHJtL21lZGlh
dGVrOiBkcGk6IEFkZCBidXMgZm9ybWF0IG5lZ290aWF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBI
c2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggYmNlZDU1NTY0
OGIwMS4uMjVjNTY1ZjkxNzljYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+
IEBAIC02MTAsNiArNjEwLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9icmlkZ2VfYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4KPiAgICAgICAgIG91dF9idXNfZm9ybWF0
ID0gYnJpZGdlX3N0YXRlLT5vdXRwdXRfYnVzX2NmZy5mb3JtYXQ7Cj4KPiArICAgICAgIGlmIChv
dXRfYnVzX2Zvcm1hdCA9PSBNRURJQV9CVVNfRk1UX0ZJWEVEKQo+ICsgICAgICAgICAgICAgICBp
ZiAoZHBpLT5jb25mLT5udW1fb3V0cHV0X2ZtdHMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
b3V0X2J1c19mb3JtYXQgPSBkcGktPmNvbmYtPm91dHB1dF9mbXRzWzBdOwo+ICsKPiAgICAgICAg
IGRldl9kYmcoZHBpLT5kZXYsICJpbnB1dCBmb3JtYXQgMHglMDR4LCBvdXRwdXQgZm9ybWF0IDB4
JTA0eFxuIiwKPiAgICAgICAgICAgICAgICAgYnJpZGdlX3N0YXRlLT5pbnB1dF9idXNfY2ZnLmZv
cm1hdCwKPiAgICAgICAgICAgICAgICAgYnJpZGdlX3N0YXRlLT5vdXRwdXRfYnVzX2NmZy5mb3Jt
YXQpOwo+IC0tCj4gMi4zMi4wLjkzLmc2NzBiODFhODkwLWdvb2cKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
