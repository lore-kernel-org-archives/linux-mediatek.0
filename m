Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:59:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA016117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 05:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA016117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fIbuGBUnOw1udkIiaRORnZApR1jzbeRQnd+AoIG7k7E=; b=LvPwsm4Z7spdPZLG+5ubn4GmN
	w2U8p8AtGcxDMYLN24BI9qXKFtlhpGJD7toLWKfnroWYX9iK4iLRiTyjXx+RdtxiFn1Xb0AMCASCE
	ydQ+K4WkyeC+V7eLXCdEWNxAuQi4q8gFFASf5KwpRio1ijpdnFP1QEkxJdrTD5ThsDkc1ehXSQLuF
	xfs05j0Dj+BZDHcM11MMCNnDVQSD+nnl6eU6GGjjAAWoanQA29ZXmfyoGd7D0CfWZY3pmaQ1zdEIq
	NViRne0mLhryN15dwbuqwlyLyFjKVoyTzTIXHks8n/xImLfFi3/ZGIIJvXc1oFnJ8+4yCIOS1PlT2
	7YfenBUPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHVL-000w2u-GM; Fri, 16 Apr 2021 05:58:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHSZ-000vdY-0G; Fri, 16 Apr 2021 05:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=eGb9tO0JgwKxeoNVQTkPx2c1NNPAmkW7z97RD+8YUJA=; b=iZKsSqePCCTcFiMHSjjxUz2VB7
 2RxBoRRUZK4RfkvPwMjsNFslgtM/b6nKsNpbzev5/D7kpV5TKjfg+8uMndHaBxokRwZPuz9RapzwA
 EYg1hOSE+57j/tH0ZE8boeXIid38ByvIbNe+BfZT+JTkPTnzXlK35islTfbTHlATl+uL7puJwNWTq
 qgZMMyPfWM5lZCE7+UYpEhhwBiwrffIRDDzafl24vDlrs0H5UYkVOdCqZwiHwLSWFW5a9u2Tj7UMY
 +Y1rnXIWhUfOjp6KhUbNppaH2oh1bPvVklx5HNkIb71Rn9A50iIejrLkY0YY4oaDWwT/xHJBs72Ks
 p2dzCMRg==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHSW-0096ER-6a; Fri, 16 Apr 2021 05:56:05 +0000
Received: by mail-oi1-x232.google.com with SMTP id i81so26765980oif.6;
 Thu, 15 Apr 2021 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eGb9tO0JgwKxeoNVQTkPx2c1NNPAmkW7z97RD+8YUJA=;
 b=V+Wo7dau0bTz6J3vRoH7RwQPDgtRcYnomjD2vBP38M8N5XgW7reF3k4yfxKNHpQA09
 SkFLXZNnNTBUDwNxkA0augdi0c288AD5L6HEMmhOdIKDjgjGKO8RbCrDFHcevx8lkp8N
 Aj6l8NwHhNZe5snjYVj5TOdSMaZYEf5PwP8Gis5quK+dJ2UfSKkWFqLKx1/4gb4e8V1J
 s6cieQ87HI0e5DoQgSu+RVRiy1KL/oOmLAHHXyr57Br+zcpo7tqpEwoZipxXxnGE1ylU
 NzCaSb5xRSP42YFZcJvjcQ42bclUBKseHhqLha3hsBtypAkqMWowxz9j3QFcw7PcDBvJ
 Yflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eGb9tO0JgwKxeoNVQTkPx2c1NNPAmkW7z97RD+8YUJA=;
 b=Cd5M/OGhuOh0lbA4PToD4W3CCpC4vndohuTv753zJn9dWUXaZ+7oLfJKZnRbI3TJJW
 RZOoR28mXAdBg62T8k9OBchEb1YKBCPftn4VWmbYD4v57KKR9k0QrVFRdHcNIlS9enla
 /RO+Rtm5n4r31BC/tbwrd27QuAtv8yBsFJkovjX+jEC1aHl7r8zMUqX/gbDTYe/KUuF9
 kZZKPJJfOs4pthw1x3+aXcg/ijVZ7neycmiiSvr3KD3Dys9/cqhoEYhYwB4/NMpIyLiU
 KE4Mgss0F5yAz13Iw6838xrFKEKm913eFesAj1qAxli1AAAeyTj3363MxMZPYZMvkL00
 UO/Q==
X-Gm-Message-State: AOAM530JLeji3j8IB5Th/igb1VbFc2icvTyTi8YcSU013DQCmxYKUgvX
 OjBdlXZRcij4+Vl3y1Z+I+FQkNZPHVcupXERAZg=
X-Google-Smtp-Source: ABdhPJyUG1P2zDXwovNhvUfuCo9ccTWBONlJiEDEMu7B3qbVbom2H7ZLsMjB8RDiVmZcX7glnobvoJ4TsoQGhBaBosA=
X-Received: by 2002:a05:6808:bd6:: with SMTP id
 o22mr5255727oik.129.1618552563257; 
 Thu, 15 Apr 2021 22:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:55:54 +0200
Message-ID: <CAFqH_52buFMF6rvyYDgSZ7wCyP2PHXa771N1L28NR8K=XAVO+w@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kappa
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225604_280206_6EAD1936 
X-CRM114-Status: GOOD (  14.26  )
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

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6MzY6Cj4KPiBLYXBwYSBpcyBrbm93biBhcyBIUCBDaHJvbWVib29rIDExYS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KClJl
dmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9t
ZWRpYXRlay55YW1sIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlh
dGVrLnlhbWwKPiBpbmRleCBhZmY1N2E4YzhjMzAuLjgxYjg2YjE4OWE4ZCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwK
PiBAQCAtMTQ0LDYgKzE0NCwxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBjb25zdDog
Z29vZ2xlLGtha2FkdS1yZXYyCj4gICAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsa2FrYWR1Cj4g
ICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMKPiArICAgICAgLSBkZXNjcmlwdGlv
bjogR29vZ2xlIEthcHBhIChIUCBDaHJvbWVib29rIDExYSkKPiArICAgICAgICBpdGVtczoKPiAr
ICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxrYXBwYQo+ICsgICAgICAgICAgLSBjb25zdDogbWVk
aWF0ZWssbXQ4MTgzCj4gICAgICAgIC0gZGVzY3JpcHRpb246IEdvb2dsZSBLb2RhbWEgKExlbm92
byAxMGUgQ2hyb21lYm9vayBUYWJsZXQpCj4gICAgICAgICAgaXRlbXM6Cj4gICAgICAgICAgICAt
IGVudW06Cj4gLS0KPiAyLjMxLjEuMjk1Lmc5ZWE0NWI2MWI4LWdvb2cKPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
