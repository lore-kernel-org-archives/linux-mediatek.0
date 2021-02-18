Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0C5C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 23:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE3064EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 23:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE3064EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pPXTQLSUU+xFX96x/kNb+AWhw5Rl4QXl6PzPzCQaM64=; b=KeuwmYqwD4mZHEmbhmrFFudaR
	dkzrbKnhBIdkM8JkV2RWiBREt3cf5B9bBHHYJKLbAny5NmtnETx8k3rUN5BXxXor849EQYU9sDGHI
	W78OwRsKLu0Yobj/7AI+rJ+/agSbisHWXuRWe1JUb2GH0NqwjQ/CBdcsL0fUttQT6uvn4fjjbr14s
	PH1kkCahaIIV5JDY9Mdcn+mmDvo8hhg+wJF4ZdCGS+fR5FK5wDp7mSnbF0pwkmNMBo1v+OG8ti8aE
	Ux85gFYy5mHDzCdoV++E2aXKXPQU3sYYbh+1ys8luzZFgL8q9248SMNRlfmEZeyRZl6BJzeOScXqn
	4nMVLXSlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCsXY-0007tl-Ub; Thu, 18 Feb 2021 23:16:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCsXU-0007t2-3T; Thu, 18 Feb 2021 23:16:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C6BA64EB3;
 Thu, 18 Feb 2021 23:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613690210;
 bh=aW+nfXzGr6YQmTzI2tfVJF8MdeeL5uIdMHjY7lwwVVA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z2G4ExpesHWzEjiNcF9bro3mq6wOnWPLirDm4/mu5x5n4MK8vfXxX+jlm+iXfhayh
 YumLXHmWoToUP/i4HfwDutjzEonGb3vy1TARRUDK3bTWaXvYM0EGQMx8sWbZiQ9lBy
 Fbc7MDAf1B3jaLnAFsF+NgfniO+n7AgP7WarX7X995O3vr38ILU1VTTpsVHKUpRxWL
 AQL53DIzEmoz2132nFNgSJ+RPwR9paez/rLBX/SbyEXRSldhuBhYpj1Tiqr2AgUfg3
 GtToAxJPwRrGvghk2chzPpdaEe/L12vRcgNkuUGd5k/xAHvLp9jzmmL+wrf+HaNRao
 qz+yieTM7sXJQ==
Received: by mail-ed1-f49.google.com with SMTP id d2so6376390edq.10;
 Thu, 18 Feb 2021 15:16:50 -0800 (PST)
X-Gm-Message-State: AOAM533HXCog8V4jl+XNC+a0JVDJT/22179OrI3uWe9VCpXWbe4IOkzG
 z0DHTA7/t4pc4B+SkySIubz7L6e6tamS65Vnpg==
X-Google-Smtp-Source: ABdhPJzi8DSty2zCOLtG9xQlyj8HJl1SyN7gvBBx+ROaxLsI2m1FeXFzb1bvqlyTy48OCFAPnepjZlyhBkumEy3crTo=
X-Received: by 2002:a05:6402:c91:: with SMTP id
 cm17mr6470189edb.219.1613690208700; 
 Thu, 18 Feb 2021 15:16:48 -0800 (PST)
MIME-Version: 1.0
References: <1613633299-88332-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1613633299-88332-1-git-send-email-zou_wei@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 19 Feb 2021 07:16:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8gBi4r1YLyXwYwMt8wAW4zrzdt0ooRgZKU-UrbV2uOTA@mail.gmail.com>
Message-ID: <CAAOTY_8gBi4r1YLyXwYwMt8wAW4zrzdt0ooRgZKU-UrbV2uOTA@mail.gmail.com>
Subject: Re: [PATCH -next] soc / drm: mediatek: Mark mtk_mutex_driver with
 static keyword
To: Zou Wei <zou_wei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_181652_275184_DFE9D954 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFpvdToKClpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4g5pa8IDIwMjHlubQy5pyIMTjm
l6Ug6YCx5ZubIOS4i+WNiDM6MTLlr6vpgZPvvJoKPgo+IEZpeCB0aGUgZm9sbG93aW5nIHNwYXJz
ZSB3YXJuaW5nOgo+Cj4gZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmM6NDY0OjI0OiB3
YXJuaW5nOiBzeW1ib2wgJ210a19tdXRleF9kcml2ZXInIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWku
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0ZXguYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgYi9kcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstbXV0ZXguYwo+IGluZGV4IGY1MzFiMTEuLjNhMzE1YTYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstbXV0ZXguYwo+IEBAIC00NjEsNyArNDYxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbXV0ZXhfZHJpdmVyX2R0X21hdGNoW10gPSB7Cj4gIH07Cj4gIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIG11dGV4X2RyaXZlcl9kdF9tYXRjaCk7Cj4KPiAtc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBtdGtfbXV0ZXhfZHJpdmVyID0gewo+ICtzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBtdGtfbXV0ZXhfZHJpdmVyID0gewo+ICAgICAgICAgLnByb2JlICAgICAgICAg
ID0gbXRrX211dGV4X3Byb2JlLAo+ICAgICAgICAgLnJlbW92ZSAgICAgICAgID0gbXRrX211dGV4
X3JlbW92ZSwKPiAgICAgICAgIC5kcml2ZXIgICAgICAgICA9IHsKPiAtLQo+IDIuNi4yCj4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
