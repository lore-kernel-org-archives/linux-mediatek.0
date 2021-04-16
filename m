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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388E5C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 08:16:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E3B61184
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 08:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E3B61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2HxykZOY7pAyCwwNCXs0xoLSVx7O+iBZpDVppuSdfE=; b=BK8gmNkOCuHBsG/OrEuACK0bU
	/X5OMs5i6+FyZQb5pHlZSDddNIFSiAUoClpLifi/PBZHcCjoEB5au6/e/zegDjkXgSVbA6Hk9BQAA
	i1SIXYPAhg+iybwHLqzAAokzfLkbll7IPkjUOxp2bUxh7IjJmzMl7IT3h3zTxZfxh4IaEoQ2sBUh9
	nn+41dqe/zpEsG9kmVwRZJWhgwrGd+zE8HyUQx+t3XeE8RsFuHJVPgLebTIjJyD3Wxeef4SwErzjG
	ew4xfYYrJd/X69ZmGm5JFZov/o7AVhlQ+UTKbpR/2L2T4ktlkYsa12UHssqGKGBorAxJl/KjFaomu
	hfzZzToGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJdu-001Ip5-4I; Fri, 16 Apr 2021 08:15:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJFo-001FLI-0a; Fri, 16 Apr 2021 07:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Tkf19eO+Io33QpEZ9OrMFNNm5052NTcThj0KVfGt26E=; b=aVjMy5lROHCMligAmkHZRwycU3
 QClWM8HT1nXhQZ4Fpkg6xRhUgHOf8hzZsnpEw9uQkVkE9F71PS8yvlmn8D2mVc5m/d6TJ2+tc31gD
 wtyUNtKrrySMh1flmXYCuGLiFqWyqQ6aUnjEx8i+IY/DohYT4SiUKsJ7dQ6p3R4HWrXbjR+RkWIdU
 lE88IeINiSS0v/Ha7MlCT1chO1Wht0V5qtmJx4LvkgxgV7uBbJVgj3YFU3hZwF43rVOM89Wy1Qr3E
 ra6iwUR439LX1ZLBt2uB7rKjzi7pFFSl/gEdF01fFzLe8oX0tPwGZnFM6FiGNwvtTw1JYFv6DSfPD
 fKMhfumg==;
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJFl-009AGb-Cr; Fri, 16 Apr 2021 07:51:02 +0000
Received: by mail-oi1-x22c.google.com with SMTP id x77so17626969oix.8;
 Fri, 16 Apr 2021 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tkf19eO+Io33QpEZ9OrMFNNm5052NTcThj0KVfGt26E=;
 b=adlH1/Y2CVaKl1vH5IxrVfUZMgz2Dm6ie2X3uyje5e5//jKV370i8WP3AQHuW3vbUw
 ZR+LGSk9BXwPk7APtR6eguUQm/xqSCu6FWvyCoADVL/xkJa9yJ0to6Ep5QNQsQUa8OQi
 dKJ7CEAM2gi0LExzHs8e0DLKB9jJui5rWFXtjCuEbf9WdkrtbP9PkUpS+dlFuUCBV0m2
 EuCig2dFJc46pPzm4gaUo0QzEWnojq0BumD/utqFClI6ktM2LVk7cPjd52irMEQgbHmH
 0+bNxavCXzaXXZ3IstK/v5s17t7Zui2goTK8NqTOBRQII4pkj6oF9XOxN1JU2z5T0nRn
 Wdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tkf19eO+Io33QpEZ9OrMFNNm5052NTcThj0KVfGt26E=;
 b=PKlhBAgJsmTqCGTmM9FlVn+JirAanOxm8Naf9LAXvoO7HMaMhlPT8HLyvwIE7pLiLl
 +GxZALWOjFgF1kmFvAfugd3lZJKxvhH5gHWgXF29ppn4LHU3bvxzq939gFc64Fh9ccOP
 MKXHI1wTAs5dKZq8T2IAig4G70XROdqfsS0rAUqI3TDLbKzvw2a3m69WWR3l13ZpKgFk
 FYUtXazO2y4uw6kLR7mOYrVrL9uOluonposGCJkjkNgliQrP/qR7tUkfGWVAc7T5CbNS
 jb39WxhAhInfqNGsKlJccHi3q3cM2gT6h7Fd1QLSPFZARK0yN/8fVkh2Zl8FyFNIcpba
 evtA==
X-Gm-Message-State: AOAM533lIRZ61u/KDNJ+HmS76nQmKVYGq5yWEkrFESrR5H5lXXMLcV7a
 1crYLTCt4MzgLHXhu3utB1dlcvlPzKgELSr8RVk=
X-Google-Smtp-Source: ABdhPJz8CjIrb9secSmN82+8dgT65mEJoVfALDHzcnEalMEMeagCfEVWO/3pFoH/4IMU2ZnA4XlvzlP7/zSe0eH/qzY=
X-Received: by 2002:aca:b408:: with SMTP id d8mr5584941oif.47.1618559460006;
 Fri, 16 Apr 2021 00:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618236288-1617-2-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 09:50:50 +0200
Message-ID: <CAFqH_50wSBVHnkzr1+Jh=1pppM7rKwZLjkVwhZnBnO=zEo46CA@mail.gmail.com>
Subject: Re: [PATCH v5, 1/4] soc: mediatek: mmsys: add component OVL_2L2
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_005101_472172_35E87B37 
X-CRM114-Status: GOOD (  14.28  )
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

SGkgWW9uZ3FpYW5nLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgoKTWlzc2F0Z2UgZGUgWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IGRlbCBkaWEgZGwuLCAxMgpk
4oCZYWJyLiAyMDIxIGEgbGVzIDE2OjA0Ogo+Cj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9W
TF8yTDIKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggYi9pbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4IDIyMjhiZjYuLmY2YjU4
ZjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IEBAIC0yOSw2
ICsyOSw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiAgICAgICAgIEREUF9DT01QT05FTlRf
T1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMCwKPiAgICAgICAgIEREUF9DT01Q
T05FTlRfT1ZMXzJMMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMiwKPiAgICAgICAg
IEREUF9DT01QT05FTlRfT1ZMMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUFdNMCwKPiAgICAg
ICAgIEREUF9DT01QT05FTlRfUFdNMSwKPiAtLQo+IDEuOC4xLjEuZGlydHkKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
