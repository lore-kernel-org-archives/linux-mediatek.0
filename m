Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599B1C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 12:08:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8286613BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 12:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8286613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uzLn8fKVgFQHvw5CiIhxcmAjd+ab+E8eXD1i9/z5igI=; b=D2lasWGiwRSM8KyZ8F57/xfAr
	S4pFXFJ+7cAamOu0rxl8/n1ZI73tDqKKM8ttivbXj1t1yvVWcbpV09GBBZo6m787kgY1HHjnIFH8S
	ISK6MjRibcILg0Vk7Bia9AKhQIWJwVXbBU4UwRZ+/CbmiB9qbwc8y+wQSw3olAjktXu/YN2YK9t5V
	CFPHrj+bCQRF5MMrMIx25lfnMB5pNTwtdQ3FJRYCSLNcLYHGbaiv/Hiyj3ezeYcEyo3LusWZd5fhJ
	DUBuiWvHcnuolJ6KCc/cCZOyWJ6/3VHEIZwABqiCnQ9ou6p/Tv2a4kEoNIRKCNB+n/8mx19sSsxgw
	p9fabJkuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYpAR-00C1wG-0K; Tue, 20 Apr 2021 12:07:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYpA6-00C1tx-3N
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 12:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fdjavbbnG38i/vDHVgTWk3tsDsi63+Qg6p2AfSLSokM=; b=RlkToMHmzZC+i8XEkh0pA48pyy
 w+MeZlxAzHjRaYLmItaMYfzUnEVT16Al7+jZ2lhIg6LB8LBa/MkIm1SsGnseHeMEqVuDV2g2/N5AJ
 cK8StWUTqTCYQadpzn1o1Gb3hgp/Fy1EBz/PBTbYnapzt+3MPgW3j56p7YihvzwgsmhtUXBB+Udfr
 tmeic/kUSs6C4WqmHKeuxCFm4BDHukgL52pPJxiaUFlHe7eIu22KsWgmyUZC3IPo+FVoxrIWpOXlf
 9DDPWUFEFlvBh1khn9gmgQotK9AUByQLIAgMZI9NCRermE7rUI/hmuozI9WGogdnY+6WcjeaQx7RN
 tqx0bddA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYpA1-00C5TU-ES
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 12:07:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so25337878wrm.1
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fdjavbbnG38i/vDHVgTWk3tsDsi63+Qg6p2AfSLSokM=;
 b=RWbQtV2xG8MQvtq5DQkUl4ClHY7MHwzMjFdlaJqjkzqrAzQwu0/vhsDJPHDqrWrzt5
 yxeN4ErznjF7lzZ7E6ugBbEg0SJpEQIk82KoadIqfB/JmGZKj67z/BO2MzI9GKu7xfSV
 KJkQtAf5s9TAz7ovZgbghlQKOn/zO8MjUjWXh9fG2YiGmYCYRFxclYfFKLXmB3xr4/Em
 XsU7bkCfjSEAX0buiKDTgIv9ChpTTY2YpHcnisji9/5nbaNkKwqzj1UPQzFExpqZBrdM
 Q2IgIZF1W3H4ZkQJsUhlXPG4zF7ly8p0rmCSMjkRm+gyz2ruVW8Ysz1BuNn2Uioz8mWg
 0Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdjavbbnG38i/vDHVgTWk3tsDsi63+Qg6p2AfSLSokM=;
 b=Cr2RoW18GeGsk3lWnic5+B8Wc9nx+hRFjynqbnvetTj9+XqShfJih613scERZncaZt
 AMFWYP5nhW0DHuiRFDUuKAMcPLbGBZGGh152/hgI1fmjVidvKTT4J4vR6gGMYN6uQ1bK
 9p8QVZvXiNTSexuzkZdsAwYF5qg520oeARQ4/PTQHs5v147FzYrMlTM/sDiGte9pCsIu
 EcBi+vRmkTW2Nnf5Kr76wyTBp5VnhOCRAXFW2caN4h0wgwgQHbfiDTVFLA5UsZeF63Qi
 +BnmjFTMr4bqNRhq2LLvosr+xOxGecwVIkdYkEfBcSakh6EamObkGFWUBSoZQ3bDo9QD
 uMWA==
X-Gm-Message-State: AOAM530uJmlykdPk7ezFcMFoy3Ctn9blKNKUzTkTH/UQBN+ncVCOk3Ll
 ls86emWW6Sg4Wj2iL7YYiDX9Gw==
X-Google-Smtp-Source: ABdhPJz9J06FgmbJBAc678ICMLMmla+1EpbzsDA86Wii4YsPgv6y7FvJ0jnuRN5ZORqgbcqEgWao9g==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr20088833wrm.32.1618920438781; 
 Tue, 20 Apr 2021 05:07:18 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a079:f96:da87:2d00?
 ([2a01:e34:ed2f:f020:a079:f96:da87:2d00])
 by smtp.googlemail.com with ESMTPSA id b12sm8989862wmj.1.2021.04.20.05.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:07:18 -0700 (PDT)
Subject: Re: [PATCH] thermal: mediatek: add sensors-support
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210320080646.49615-1-linux@fw-web.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
Date: Tue, 20 Apr 2021 14:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210320080646.49615-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_050721_546679_664B8367 
X-CRM114-Status: GOOD (  20.52  )
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

T24gMjAvMDMvMjAyMSAwOTowNiwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBGcm9tOiBGcmFu
ayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAKPiBhZGQgSFdNT04tc3Vw
cG9ydCB0byBtZWRpYXRla3MgdGhlcm1hbmwgZHJpdmVyIHRvIGFsbG93IGxtLXNlbnNvcnMKPiB1
c2Vyc3BhY2UgdG9vbHMgcmVhZCBzb2MgdGVtcGVyYXR1cmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBG
cmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAtLS0KPiAgZHJpdmVy
cy90aGVybWFsL210a190aGVybWFsLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dGhlcm1hbC9tdGtfdGhlcm1hbC5jIGIvZHJpdmVycy90aGVybWFsL210a190aGVybWFsLmMKPiBp
bmRleCAxNDljNmQ3ZmQ1YTAuLmUyMmQ3N2Q1NzQ1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Ro
ZXJtYWwvbXRrX3RoZXJtYWwuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9tdGtfdGhlcm1hbC5j
Cj4gQEAgLTIzLDYgKzIzLDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgo+ICAKPiArI2luY2x1ZGUgInRoZXJtYWxfaHdtb24uaCIKPiAr
Cj4gIC8qIEFVWEFEQyBSZWdpc3RlcnMgKi8KPiAgI2RlZmluZSBBVVhBRENfQ09OMV9TRVRfVgkw
eDAwOAo+ICAjZGVmaW5lIEFVWEFEQ19DT04xX0NMUl9WCTB4MDBjCj4gQEAgLTk4Myw2ICs5ODUs
MTMgQEAgc3RhdGljIHZvaWQgbXRrX3RoZXJtYWxfcmVsZWFzZV9wZXJpb2RpY190cyhzdHJ1Y3Qg
bXRrX3RoZXJtYWwgKm10LAo+ICAJd3JpdGVsKCh0bXAgJiAofjB4MTBlKSksIG10LT50aGVybWFs
X2Jhc2UgKyBURU1QX01TUkNUTDEpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBtdGtfdGhlcm1h
bF9od21vbl9hY3Rpb24odm9pZCAqZGF0YSkKPiArewo+ICsJc3RydWN0IHRoZXJtYWxfem9uZV9k
ZXZpY2UgKnpvbmUgPSBkYXRhOwo+ICsKPiArCXRoZXJtYWxfcmVtb3ZlX2h3bW9uX3N5c2ZzKHpv
bmUpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IG10a190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCWludCByZXQsIGksIGN0cmxfaWQ7Cj4gQEAgLTEw
ODcsNiArMTA5NiwxOSBAQCBzdGF0aWMgaW50IG10a190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZ290byBlcnJfZGlzYWJsZV9jbGtfcGVyaV90aGVybTsK
PiAgCX0KPiAgCj4gKyNpZmRlZiBDT05GSUdfVEhFUk1BTF9IV01PTgoKTm8gI2lmZGVmIGluIEMg
ZmlsZS4KCj4gKwl0emRldi0+dHpwLT5ub19od21vbiA9IGZhbHNlOwo+ICsJcmV0ID0gdGhlcm1h
bF9hZGRfaHdtb25fc3lzZnModHpkZXYpOwo+ICsJaWYgKHJldCkKPiArCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJlcnJvciBpbiB0aGVybWFsX2FkZF9od21vbl9zeXNmcyIpOwo+ICsKPiArCXJldCA9
IGRldm1fYWRkX2FjdGlvbigmcGRldi0+ZGV2LCBtdGtfdGhlcm1hbF9od21vbl9hY3Rpb24sIHR6
ZGV2KTsKCmRldm1fdGhlcm1hbF9hZGRfaHdtb25fc3lzZnMoKSA/Cgo+ICsJaWYgKHJldCkgewo+
ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgImVycm9yIGluIGRldm1fYWRkX2FjdGlvbiIpOwo+ICsJ
CW10a190aGVybWFsX2h3bW9uX2FjdGlvbih0emRldik7Cj4gKwl9Cj4gKyNlbmRpZgo+ICsKPiAg
CXJldHVybiAwOwo+ICAKPiAgZXJyX2Rpc2FibGVfY2xrX3BlcmlfdGhlcm06Cj4gCgoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
