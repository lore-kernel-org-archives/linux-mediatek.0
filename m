Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C042C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:12:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17D161076
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 17:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17D161076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y+nFz0Fj4ac1oM2ccF3n1Ute6R07zoCV6frjDULtaQE=; b=IK2a8rZ9OPzhmq/EF9WWzF5Bs
	ei1ow9AlynGU2mtkPO6iHuHzb5r6rWITc8b4wPSXLjhfqK98/9fSowjV/kjHQg8jG1AC9NzGQj9b+
	PYGMsC2TAeKIjsuomQXGxQfpb9mWm08nVgqsBHr8Fx/jkOiY/LpDbzu8KxJuT711YyPBXF/KKSgP8
	pHpB7/j59oTzjQtrkzOAAg+/QTG5x34VnjyWaWbLBbeXiVNZjXNiF4T91q+ymrxlxf7uxCK0Huku9
	dykP/4gkvZdVWhqo1bq05ys6j8Ncd7ijWgY3DyCnczOWIehzZ+g/JQ5QPD0l/z1xknXg32TkMNCwN
	njQawaqnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYtur-00CgUY-RM; Tue, 20 Apr 2021 17:12:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtup-00CgUD-It
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 17:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=myKHdFwpoKzTsa/Xj/reG757o1iV2SMy+GaKdMs9Nd8=; b=cg2jA1ZeLxEYE9M7nvx7R2MkP4
 hi/w1Z4kpR8WLiyXCr60o+lFQKpleFSsF1DusaaczvVySzkEKArJ0MJT3J3lBE3UL4cGzXiOS9P9H
 ga2q9jPLReFNdbeXqamg4lQlZ5gqSbarV8lKMjrI5w+VRVX3ZdBZZB4NuQ/gPtzawAWModWXyYyMp
 OKSGRQBAxlyLZqPHhfpG2LU9uSHxlK6dxwPm0eAzC/5PaEhR1v7eow8fqNBdwTzP4LKQ205p1JRuo
 zGkyCoL/UaYLg+56t8eYZhI8Cd5joeA482tDjX6pPjtiVXf2wqg9G0EvscW36isVYcnoNfnOpu7HN
 2onSXTUQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtuj-00CIpn-GR
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 17:11:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id y204so19236424wmg.2
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myKHdFwpoKzTsa/Xj/reG757o1iV2SMy+GaKdMs9Nd8=;
 b=hQHBRzGD5X9iOOj5IVE4mokydlp7T0xfd7ChDgBDkNYY4MCnQAJeQg/PHmxBWanvja
 00QmxA7BkxVDfgr93keTS/uw4qbx8AG2JSFPhutLrohZUHSql9j2R870yOiHTLTyRUPb
 6uwpLkbb/IxA1xVIE3w8hBj36CbBFwqpya1/YJMmog13WApw6hZU0qMkukzzA2PRiDA8
 DqSBGt5SjrMz9nd4L6lpa3+QwQ0RP2rZhDijHnQE245rFLz/7ogYogpiCO3HIqPPDkC6
 ZZna3bf5YMufluV+tJNBZrusL0P5eoBuALbGEVIDvkQxCu+TyZc5rMP5eAmQJCoDatHY
 fmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myKHdFwpoKzTsa/Xj/reG757o1iV2SMy+GaKdMs9Nd8=;
 b=IAwx1+RLKbB9eUoGppHt6Rjs0HSkQfYxC5jirxeOEQR6IfflqVUgIkr9xJY6phjE/Q
 6mCC+Lp6686pO+RmLPp5JjPhoiMB7TaYGPSrrEjSDj/g7lIPk70yaPVO8r0aXQ7ySkj8
 KQZ0tX0fOQqFS8g4nPsJfbukOsoHaIrZ7bMYNn+lLVmiGBqaOZIfjKaM2c88eN0jN7Ni
 896xLRb6aY1J34Agxp3WkgLW+hsgjgNE4ECyXdlyieGKk9gOwWNdJWeit11h702TUyL9
 2uyZg8MahreZqx5/bPrbACYzGcn82h414FgRUikgSPAvz0ZVL1vLo1bin9LnvBCoNw4i
 edrA==
X-Gm-Message-State: AOAM531s1V9fquWuLWElmib+B1VKfWUugm4KjGsSE+tjyLhHD0zZks36
 CAS8h467KF4rnPMKpoEWhaArOQ==
X-Google-Smtp-Source: ABdhPJx0F/M9jruFk1OxQ7jSDx6lUsEzt5yTN43x0G2gTHn74JFGNoDHbnW3xCYETr//yRba4NP8jg==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr5602279wme.68.1618938710867; 
 Tue, 20 Apr 2021 10:11:50 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a079:f96:da87:2d00?
 ([2a01:e34:ed2f:f020:a079:f96:da87:2d00])
 by smtp.googlemail.com with ESMTPSA id l25sm4014033wmi.17.2021.04.20.10.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 10:11:50 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: mediatek: add sensors-support
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210420155410.132141-1-linux@fw-web.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <34942537-79f4-bfab-43cc-7af100d0a433@linaro.org>
Date: Tue, 20 Apr 2021 19:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420155410.132141-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_101153_595898_6297A806 
X-CRM114-Status: GOOD (  18.61  )
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

T24gMjAvMDQvMjAyMSAxNzo1NCwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBGcm9tOiBGcmFu
ayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAKPiBhZGQgSFdNT04tc3Vw
cG9ydCB0byBtZWRpYXRla3MgdGhlcm1hbCBkcml2ZXIgdG8gYWxsb3cgbG0tc2Vuc29ycwo+IHVz
ZXJzcGFjZSB0b29scyByZWFkIHNvYyB0ZW1wZXJhdHVyZQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+IC0tLQo+IHYyOiBkcm9w
IGlmZGVmIGFuZCB1c2VkIGRldm1fdGhlcm1hbF9hZGRfaHdtb25fc3lzZnMKPiAtLS0KPiAgZHJp
dmVycy90aGVybWFsL210a190aGVybWFsLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvbXRrX3Ro
ZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9tdGtfdGhlcm1hbC5jCj4gaW5kZXggMTQ5YzZkN2Zk
NWEwLi4zMmJlOGE3MTVjN2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFsL210a190aGVy
bWFsLmMKPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvbXRrX3RoZXJtYWwuYwo+IEBAIC0yMyw2ICsy
Myw4IEBACj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPiAgCj4gKyNpbmNsdWRlICJ0aGVybWFsX2h3bW9uLmgiCj4gKwo+ICAvKiBBVVhBREMg
UmVnaXN0ZXJzICovCj4gICNkZWZpbmUgQVVYQURDX0NPTjFfU0VUX1YJMHgwMDgKPiAgI2RlZmlu
ZSBBVVhBRENfQ09OMV9DTFJfVgkweDAwYwo+IEBAIC0xMDg3LDYgKzEwODksMTEgQEAgc3RhdGlj
IGludCBtdGtfdGhlcm1hbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
CWdvdG8gZXJyX2Rpc2FibGVfY2xrX3BlcmlfdGhlcm07Cj4gIAl9Cj4gIAo+ICsJdHpkZXYtPnR6
cC0+bm9faHdtb24gPSBmYWxzZTsKCgleXl5eXl4geW91IGNhbiBkcm9wIHRoaXMgbGluZQoKPiAr
CXJldCA9IGRldm1fdGhlcm1hbF9hZGRfaHdtb25fc3lzZnModHpkZXYpOwo+ICsJaWYgKHJldCkK
PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJlcnJvciBpbiB0aGVybWFsX2FkZF9od21vbl9zeXNm
cyIpOwo+ICsKPiAgCXJldHVybiAwOwo+ICAKPiAgZXJyX2Rpc2FibGVfY2xrX3BlcmlfdGhlcm06
Cj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
