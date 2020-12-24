Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660AEC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 14:34:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B786223DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 14:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B786223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pJW4foGCa8p3FrGRVZdCb4aIQasJBCcpHg7yVovRtX0=; b=rDzIxynT8bzJ8JtUVwwNcV7Of
	jwTOomVOMINCK4Yc894PgMfIEA5eyGSOUU6qyU33IbEJQ9tOCM13cfBJ2Q/Ufth9PDmNuARUmZzVf
	XpMCzVvz64ERmMjUm75vk4ptBkIX7PNccUjlbJY+PXuCpdO8Kfk3UsYkyZbgBhW7jmPA3hdhIL2B0
	9PzgEf3aRMfR+FB36oNAl8fTJjqIjquGqf9i42N1ObBZExjZz4Ayhpg+WOV29YmiAzFpZsvTlWnl3
	IIy7kBdYEglv6i2tSMRI2yDyjXsoy3ZwYl1PGahrT8mN2peZ5uWOB1dPN0uEiS5o7p3xINngyEHEJ
	hLjSCTefA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksRgh-0006Fh-MB; Thu, 24 Dec 2020 14:33:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksRgd-0006Ey-Im; Thu, 24 Dec 2020 14:33:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B9F522512;
 Thu, 24 Dec 2020 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608820430;
 bh=fkm1MmkKVX0X8W8b9MoXrIOtavhuaZcXNGosYz3rTuA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WTk8azkMFZpXRQN34mLBrDGokITdgvr3x5pIpTmC89MKcq1Ig7yCh5NY6qXeWj5Iw
 0Tjm0VXDw/eW6Fquc5EvegqBFjgBQhUDcttIno3+VN2eVTdBLbdce5BgY7VA7/zPqz
 u/Ta5wFmVYF063tmzS4MKBlcnaCzLjW+0hFepdiWBjCi8plEukNEWHhaYMaKZtGszF
 1AAsUKzVkRvaE0MmY4ZondREeqLOLJTp35yfW3u8e8z7R6XrpZuIvpSlyXOkx4Cx2e
 gLTSrxAUJSLbtM41Pjswb5U0K3IvSMHktIYdcTUltBGDWYE+ornsXXkLH5UYqOGvcm
 9XPXAa7EaqnjA==
Received: by mail-ej1-f48.google.com with SMTP id g20so3596924ejb.1;
 Thu, 24 Dec 2020 06:33:50 -0800 (PST)
X-Gm-Message-State: AOAM530rbb27DpT2NRX5uw3elUSaLOd4EFmCXiATfzxiNhlv/xjAYZS1
 G9Si/vvUy+BLlzTf3//LUnRLBm38evtUrPakGg==
X-Google-Smtp-Source: ABdhPJyYMY6zOIEeWk9zf3J20HOhFmag+QSOsC7kafdQzV1MNxjeoMc++rF1OktDc7lq7tS6cKOABNFFuW9Djjb8mf8=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr29216615ejb.310.1608820428887; 
 Thu, 24 Dec 2020 06:33:48 -0800 (PST)
MIME-Version: 1.0
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-4-git-send-email-henryc.chen@mediatek.com>
In-Reply-To: <1608790134-27425-4-git-send-email-henryc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Dec 2020 22:33:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY__whne=DuaSv4rOv8f1qTebjqDOVjD5YGYw6eBkkWKmUw@mail.gmail.com>
Message-ID: <CAAOTY__whne=DuaSv4rOv8f1qTebjqDOVjD5YGYw6eBkkWKmUw@mail.gmail.com>
Subject: Re: [PATCH V6 03/13] soc: mediatek: add driver for dvfsrc support
To: Henry Chen <henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_093351_681526_287368A1 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 DTML <devicetree@vger.kernel.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhlbnJ5OgoKSGVucnkgQ2hlbiA8aGVucnljLmNoZW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAy
MOW5tDEy5pyIMjTml6Ug6YCx5ZubIOS4i+WNiDI6MDnlr6vpgZPvvJoKPgo+IEFkZCBkdmZzcmMg
ZHJpdmVyIGZvciBNVDY4NzMvTVQ4MTgzL01UODE5MgoKU2VwYXJhdGUgdGhpcyBwYXRjaCBmb3Ig
ZWFjaCBTb0MuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5
IENoZW4gPGhlbnJ5Yy5jaGVuQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgIHwgIDEyICsKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
TWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWR2
ZnNyYy5jICAgICAgIHwgNTM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGlu
Y2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210a19kdmZzcmMuaCB8ICAzNSArKysKPiAgNCBmaWxl
cyBjaGFuZ2VkLCA1ODYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLWR2ZnNyYy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGtfZHZmc3JjLmgKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
