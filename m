Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC0BC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 16:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201516101A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 16:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201516101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y8CJZGxyTZRmfZiAxIeJ29hxHbJop+xHwuoiOSXMVdY=; b=e5TTfiZxPI/ZCrqn05QvnyU29
	/6xVpbkTf0H7zJYVN/aYoqVFQoO1O1AfC2n4HMLikCat/Zdp7trhCf4YPxwQ9KsaIsAR4WRubQEcI
	LHoinEqqxenVyQF+xc4FITZopbW5A2IkYNgZRx48EJeUSRMtbhkD/2V8PlyG1xbrfCxOZBdnYLw8V
	m8H6SXKpAWzlJ589w7wv9C48yigfKT8UvwmU1+6j0MkubdGYvzytOcehCteqWRvjh89vOcmvq8BIB
	8fThetR0pM5hoXfoV8rtJdakhRUfUIY02rktFs83J3Xs70wOgFOPbLR7ykvQonPUKk4Mo469OF9eY
	Y8SuTnEKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRe6a-0078jN-Sj; Wed, 31 Mar 2021 16:54:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRe6V-0078iM-HF
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 16:54:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id j7so20408949wrd.1
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xznif/MH/M9aiazIt+TNwkIsOPRFEi4pc4I4E7feLW4=;
 b=Wk926Zyt5NAXknc85ifZFdrd+TO9JoBNPnmY9WYuuQC33cRHUHTXCafLp14OfaJiok
 zMDuxi+Yb/lOZIUb5Rq3flGlAl8+qGNspGvohvQDQ/dLV/9RbLPegY3RSWH9PiRYgWed
 Xoo/3U7DcD62z7r/coj38fXgrNVhte++FvMmm4PsWijLOGrdGHLL9vtNNPE169Fm/1KV
 4axDbRRbn1T0aJVToDTbKoPlpZgiUKEqnM5ihaVnBqKxwEyPLqMzBqXcHqCe85WZjeyX
 4Xi6neCT47iRXCEEj51oa56gBGTXj4mP2dXtsCdQysbhDOdrK2XoWEt2W5Zq58wTjSgp
 sf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xznif/MH/M9aiazIt+TNwkIsOPRFEi4pc4I4E7feLW4=;
 b=nBPCMIf6CIq9TSyDzCd+Ri041jZWGqRGdMoNa4qa3Kc1WjJXH4iX0tJPbTVmyWb5vh
 oiwlecYXzGh2LJPYdTmLyNEaAL/mj81ozkLHtwHTyDDULHLwTTVkY8hgwA72pCuwkYy5
 WUyNnx26chWdhymdULp1U7iZC07PxfqRWunAw/uYW2hp9tit244wab6WuVwPRttndrnz
 jZDgtjABxH/HmWByYC+sI1xBRPHFWvxpjjMBS9LW/sl899YxGBpLKS0BH/+J8W0lyirw
 H1pGs15IBHkPAJrhHxF3VNqpa68JMS87VqHX35ErG6vks87dAJgiSs/rRmgzH8889NPg
 XsCg==
X-Gm-Message-State: AOAM532CNhyXITcs/doNk/KpD2VZoOKeAKtnlhyP94LMvJ1mmorU8EOP
 lcnMVgSYJa9UVV/jXHMiCEm2WA==
X-Google-Smtp-Source: ABdhPJz5xMvEY9p8BlcNg5+yfUOg7rpIqdqRGBYPoR4/ELJyxsX1WBqLykwzflMtZ5F7GPdFvcZwAg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr4946180wrw.196.1617209642816; 
 Wed, 31 Mar 2021 09:54:02 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:1573:1dd5:899d:6362?
 ([2a01:e34:ed2f:f020:1573:1dd5:899d:6362])
 by smtp.googlemail.com with ESMTPSA id w6sm5388004wrl.49.2021.03.31.09.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 09:54:02 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: cpufreq_cooling: fix slab OOB issue
To: Michael Kao <michael.kao@mediatek.com>, fan.chen@mediatek.com,
 Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 brian-sy yang <brian-sy.yang@mediatek.com>
References: <20201229050831.19493-1-michael.kao@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b3616c67-c65e-d145-c9a3-e6c209849266@linaro.org>
Date: Wed, 31 Mar 2021 18:54:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229050831.19493-1-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_175403_763975_A2F9ABEB 
X-CRM114-Status: GOOD (  13.34  )
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

T24gMjkvMTIvMjAyMCAwNjowOCwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gRnJvbTogYnJpYW4tc3kg
eWFuZyA8YnJpYW4tc3kueWFuZ0BtZWRpYXRlay5jb20+Cj4gCj4gU2xhYiBPT0IgaXNzdWUgaXMg
c2Nhbm5lZCBieSBLQVNBTiBpbiBjcHVfcG93ZXJfdG9fZnJlcSgpLgo+IElmIHBvd2VyIGlzIGxp
bWl0ZWQgYmVsb3cgdGhlIHBvd2VyIG9mIE9QUDAgaW4gRU0gdGFibGUsCj4gaXQgd2lsbCBjYXVz
ZSBzbGFiIG91dC1vZi1ib3VuZCBpc3N1ZSB3aXRoIG5lZ2F0aXZlIGFycmF5Cj4gaW5kZXguCj4g
Cj4gUmV0dXJuIHRoZSBsb3dlc3QgZnJlcXVlbmN5IGlmIGxpbWl0ZWQgcG93ZXIgY2Fubm90IGZv
dW5kCj4gYSBzdWl0YWJsZSBPUFAgaW4gRU0gdGFibGUgdG8gZml4IHRoaXMgaXNzdWUuCj4gCj4g
QmFja3RyYWNlOgo+IFs8ZmZmZmZmZDAyZDJhMzdmMD5dIGRpZSsweDEwNC8weDVhYwo+IFs8ZmZm
ZmZmZDAyZDJhNTYzMD5dIGJ1Z19oYW5kbGVyKzB4NjQvMHhkMAo+IFs8ZmZmZmZmZDAyZDI4OGNl
ND5dIGJya19oYW5kbGVyKzB4MTYwLzB4MjU4Cj4gWzxmZmZmZmZkMDJkMjgxZTVjPl0gZG9fZGVi
dWdfZXhjZXB0aW9uKzB4MjQ4LzB4M2YwCj4gWzxmZmZmZmZkMDJkMjg0NDg4Pl0gZWwxX2RiZysw
eDE0LzB4YmMKPiBbPGZmZmZmZmQwMmQ3NWQxZDQ+XSBfX2thc2FuX3JlcG9ydCsweDFkYy8weDFl
MAo+IFs8ZmZmZmZmZDAyZDc1YzJlMD5dIGthc2FuX3JlcG9ydCsweDEwLzB4MjAKPiBbPGZmZmZm
ZmQwMmQ3NWRlZjg+XSBfX2FzYW5fcmVwb3J0X2xvYWQ4X25vYWJvcnQrMHgxOC8weDI4Cj4gWzxm
ZmZmZmZkMDJlNmZjZTVjPl0gY3B1ZnJlcV9wb3dlcjJzdGF0ZSsweDE4MC8weDQzYwo+IFs8ZmZm
ZmZmZDAyZTZlYWQ4MD5dIHBvd2VyX2FjdG9yX3NldF9wb3dlcisweDExNC8weDFkNAo+IFs8ZmZm
ZmZmZDAyZTZmYWMyND5dIGFsbG9jYXRlX3Bvd2VyKzB4YWVjLzB4ZGUwCj4gWzxmZmZmZmZkMDJl
NmY5ZjgwPl0gcG93ZXJfYWxsb2NhdG9yX3Rocm90dGxlKzB4M2VjLzB4NWE0Cj4gWzxmZmZmZmZk
MDJlNmVhODg4Pl0gaGFuZGxlX3RoZXJtYWxfdHJpcCsweDE2MC8weDI5NAo+IFs8ZmZmZmZmZDAy
ZTZlZGQwOD5dIHRoZXJtYWxfem9uZV9kZXZpY2VfY2hlY2srMHhlNC8weDE1NAo+IFs8ZmZmZmZm
ZDAyZDM1MWNiND5dIHByb2Nlc3Nfb25lX3dvcmsrMHg1ZTQvMHhlMjgKPiBbPGZmZmZmZmQwMmQz
NTJmNDQ+XSB3b3JrZXJfdGhyZWFkKzB4YTRjLzB4ZmFjCj4gWzxmZmZmZmZkMDJkMzYwMTI0Pl0g
a3RocmVhZCsweDMzYy8weDM1OAo+IFs8ZmZmZmZmZDAyZDI4OTk0MD5dIHJldF9mcm9tX2Zvcmsr
MHhjLzB4MTgKPiAKPiBGaXhlczogMzcxYTNiYzc5YzExYiAoInRoZXJtYWwvZHJpdmVycy9jcHVm
cmVxX2Nvb2xpbmc6IEZpeCB3cm9uZyBmcmVxdWVuY3kgY29udmVydGVkIGZyb20gcG93ZXIiKQo+
IFNpZ25lZC1vZmYtYnk6IGJyaWFuLXN5IHlhbmcgPGJyaWFuLXN5LnlhbmdAbWVkaWF0ZWsuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgS2FvIDxtaWNoYWVsLmthb0BtZWRpYXRlay5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBhcm0uY29tPgo+IC0tLQoK
QXBwbGllZCwgdGhhbmtzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
