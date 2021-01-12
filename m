Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AE9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 00:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744A922AED
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 00:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 744A922AED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MpYp1kabu4tF2t4Kdec8GooPEYrqXEF87IUmSHyLMlw=; b=2ijOLYNrnyy/K7jLHt3OA6nD/
	DtAOz5rn1BM9Mk2LxrnuwlFm0fhTI9NytDTYzDo3G4PPBRjVIVa31f+C0ovMQZZNo6xSVa35UBbsv
	EBTuYS5DTNjz23u/6g6A+vBayTskoKzF1f9NGrFcI5VtFxaxaZhPoQLIac1usJE18662krSdNu98+
	KHeeHR4cz0KB6CzIJNYDI7XUt8jkKTt7h13NPNb5rseoKvGRSKmRGsNfvXSBUPAej/6aFG3PXu70S
	HF/9KnjsjRQNIro+jHv2SPvE1nrKOVy5R0+kFHSMLTw0jnL1e7WYl/U9B236L2RMhVrsiVjRrEK9M
	m5BlXLFEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz7Q9-0004Om-A8; Tue, 12 Jan 2021 00:20:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz7Q1-0004LS-1B; Tue, 12 Jan 2021 00:20:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24EF522D08;
 Tue, 12 Jan 2021 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610410815;
 bh=xT8MvbQsR9UkUaNVPWZFZYrUWOAO1atkSNUZ7hy/oTU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k1mKag3BxKHQJoteEtTEmVGkvD8AhrOyiTgPgLjTrz57CUyTRdPGTFR2jGUHQX0K6
 WsTW+D7pYGJtqOr2P4n/A8inTPTMAWhCqJ7+ZLw4W0YZB+UOy5FaQ9pjVmCjR04qnh
 xC6y77yqF6rJSkmtlwDVsXDm4vtyfrtn7VsM+imLOR+DuxY79Uvuf0Ao+CeOtHdOBn
 gHhxB9//foZE6SGE3358Ful55ukzurLpQUHJE/I50bwp390OxuJY8b9UEYcjNdp3mk
 IadFFRXn89NR+zn0UrT8+kBhbYsXKzmPj4KrI1dmDTsZEtZ9Tmd7lgI72N5kT1KbQZ
 cgJ7wQYzBDw/g==
Received: by mail-ed1-f46.google.com with SMTP id v26so346242eds.13;
 Mon, 11 Jan 2021 16:20:15 -0800 (PST)
X-Gm-Message-State: AOAM533zUVtCJ5+IhD07Bo8TzNSLeimM6d2oxgK9SOXRCkwhsFN3YzFb
 RM87sZq5plEdOUHa3pSY69NfRHdekC1L+3OtHQ==
X-Google-Smtp-Source: ABdhPJw95ZpXKnHgH0CIhq3w3Khy4bp6U8XIOVwTypB2JtA2ezUS774iekd3YAxIwUn1uaUwcoFQCOFiB0igSVjur0Y=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr1348359edf.166.1610410813706; 
 Mon, 11 Jan 2021 16:20:13 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 08:20:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__+DzbaAi=YUsx0_Sbq9rYzddCgiBvDMQyHgKSOiRvpjA@mail.gmail.com>
Message-ID: <CAAOTY__+DzbaAi=YUsx0_Sbq9rYzddCgiBvDMQyHgKSOiRvpjA@mail.gmail.com>
Subject: Re: [PATCH v3, 08/15] drm/mediatek: check if fb is null
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_192017_192308_C1794F9F 
X-CRM114-Status: GOOD (  18.37  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gSXQn
cyBwb3NzaWJsZSB0aGF0IHN0YXRlLT5iYXNlLmZiIGlzIG51bGwuIEFkZCBhIGNoZWNrIGJlZm9y
ZSBhY2Nlc3MgaXRzCj4gZm9ybWF0LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0s
IHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBGaXhlczogYjZiMWJiOTgwZWM0ICggZHJtL21lZGlhdGVr
OiBUdXJuIG9mZiBBbHBoYSBiaXQgd2hlbiBwbGFuZSBmb3JtYXQgaGFzIG5vIGFscGhhKQo+IFNp
Z25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4IDQ5MzRiZWUuLjhlN2Y0OTQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTI3OSw3
ICsyNzksNyBAQCBzdGF0aWMgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBj
b24gPSBvdmxfZm10X2NvbnZlcnQob3ZsLCBmbXQpOwo+IC0gICAgICAgaWYgKHN0YXRlLT5iYXNl
LmZiLT5mb3JtYXQtPmhhc19hbHBoYSkKPiArICAgICAgIGlmIChzdGF0ZS0+YmFzZS5mYiAmJiBz
dGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpCj4gICAgICAgICAgICAgICAgIGNvbiB8
PSBPVkxfQ09OX0FFTiB8IE9WTF9DT05fQUxQSEE7Cj4KPiAgICAgICAgIGlmIChwZW5kaW5nLT5y
b3RhdGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWSkgewo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
