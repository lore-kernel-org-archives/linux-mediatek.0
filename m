Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E49FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 18:31:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1846864E92
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 18:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1846864E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKDAEeRzLQzIEErTf+xZykUfYGBLrPCdqYRDK8By22k=; b=EU7foFPDulmXJyvwpF2QHSEJv2
	OtYUFqSpLHeFyzpfMsmCzJ/kEJofhEb0A9Jl6zbLRqHC+8CKOSi7rqBv+J1KcwJWjfIS12YJDWZM9
	iG8nYeJTX0yHhEJwOIesdILDj72a1dzwOADMAkPZBYxJqf+WkTDKVylyPmI8rHx3Dmnj+cpLnKrm7
	kb1pK2wuxrhYp3zNWDmbowACKd+WpmMe2VzVcWvkrzjZ2nJ7sBHsGBftaRuuDxKaHzNmBBayJHNlR
	YnJSnznZStQxzl/j7xjDUtcRcnorW1BH1pS1UZG36urrKG9BY7/moYm/IS7kVQITNFAT2QU0Ewe9q
	Kjl3tKEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCo4n-000761-71; Thu, 18 Feb 2021 18:30:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCo4k-00075E-KC
 for linux-mediatek@lists.infradead.org; Thu, 18 Feb 2021 18:30:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id c6so5663856ede.0
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Feb 2021 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UPOBpjGSaa1iqiYyN6y24D5Iry/MgCBcOmk7mQpQh3Q=;
 b=i6jcGEcSbK4nMFGOhYnTOdTnnqwXUOtePDUS77lv0+cQV0ADwYMtdOXexWD+LR/pTj
 jV8SxZtpcIRc8INRf6vlWFvnxolgxIZqMQILnzsi55w4B2svG8dBpp0ij4y0OGDDFFWt
 QPCDxFYvFXzAbI6FCCDnrudue3NAi5aIcBRiujZzg1Z1OB2ZVV2k70XyKhiiB6AXH5aF
 3BjUO4TcwGg1KrzClP953E+JpOwv3gX5Cph54kRpeJ7TRk7PxdAs1A0YPmiLLamv/5QS
 O/ZUELYcfTP/aqsvu3oemJMnMCNmA1xzjFucOEGKZXrJPgftrrfrAvjE54SjaYr0PhZj
 G2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UPOBpjGSaa1iqiYyN6y24D5Iry/MgCBcOmk7mQpQh3Q=;
 b=m9/RYiRD2HacukxNgo6THkwG5wmZU+zdg8NgTe12NGnUUseMA1gXNT0PjIZms4FaFc
 VJ73yPe++Bgc0D1UGhIsmhdXI8S9yTJIn/2xaKckBzEcJImvKvyWXrTgT3Lv7V68FB1Y
 RCazStwjzukIpHrYIbKwHEHy8v0MYF46M87fct+CpDqQOg6CvOV6ZbPUEvtXFnT9O7lE
 VnZx84zYap9CjMlzO2NRd8WTg4s5wp/rf3Z3ddnnXgzrfB8Mwo2NE73aBd77RYpFDKVz
 pREwc9KRdOwDgK2a0g/X1UxXvUuYTZ4+dkAeX/zMQF8OKzMh+vpm3hk8N0VNbGA4OcNu
 BU7Q==
X-Gm-Message-State: AOAM530w+PiADSL9yqRCi8nr9ECchj1PW/+j2OZu7UYi/OFIqG8+am6K
 quhZGFw7zJM2yt3Dn4faQDM/od6SCR6dWw==
X-Google-Smtp-Source: ABdhPJwTP1PJ9L/1/1MIn/UFUPU6BuY4e1C1n1zsM1kN5QmCAk5dWtwJqNDCZkDR2n/qPAJU+OILxg==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr5316796edc.381.1613673051954; 
 Thu, 18 Feb 2021 10:30:51 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id ga5sm3154078ejb.114.2021.02.18.10.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 10:30:51 -0800 (PST)
Subject: Re: [QUESTION] what kind of support does MT6797 has?
To: Mohammad Rasim <mohammad.rasim96@gmail.com>,
 linux-mediatek@lists.infradead.org
References: <476cadfc-8da0-bb82-ea4d-55ee18735f89@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9130a74a-f49b-5abf-ec86-4085a45feb01@gmail.com>
Date: Thu, 18 Feb 2021 19:30:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <476cadfc-8da0-bb82-ea4d-55ee18735f89@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_133054_688261_99B4A63E 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTW9oYW1tYWQsCgpPbiAxMy8wMi8yMDIxIDE5OjI5LCBNb2hhbW1hZCBSYXNpbSB3cm90ZToK
PiBIaSwKPiAKPiBJIGhhdmUgYW4gb2xkIFJlZG1pIG5vdGUgNFggcGhvbmUgd2l0aCBhbiBNVDY3
OTcgc29jLCB1bmZvcnR1bmF0ZWx5IHRoZSB2ZW5kb3IKPiBoYXNuJ3QgcmVsZWFzZWQgYSBrZXJu
ZWwgZm9yIHRoYXQgZGV2aWNlLgo+IAoKVW5mb3J0dW5hdGVseSB0aGUgdXBzdHJlYW0gc3VwcG9y
dCBmb3IgdGhlIGJvYXJkIGlzIHJhdGhlciBydWRpbWVudGFyeS4KaHR0cHM6Ly9tdGsud2lraS5r
ZXJuZWwub3JnL21hdHJpeC9tb2JpbGVfY2hpcHMKCklmIHlvdSB3YW50IHRvIGhlbHAsIHlvdSBj
YW4gZmluZCBzb21lIG9sZCBCU1Aga2VybmVsIHNvdXJjZSBoZXJlOgpodHRwczovL2dpdGh1Yi5j
b20vbWJnZy9saW51eC14MjAvdHJlZS9oZWxpby14MjAKCkJ1dCBiZXdhcmUgdGhhdCB5b3Ugd2ls
bCBuZWVkIHRvIHVzZSBpdCBvbmx5IGFzIHJlZmVyZW5jZSBhbmQgcmV3cml0ZSB0aGUKZHJpdmVy
cyBmcm9tIHNjcmF0Y2guCgpSZWdhcmRzLApNYXR0aGlhcwoKPiBGdWxsIGRldmljZSBzcGVjczrC
oGh0dHA6Ly93d3cuZGV2aWNlaW5mb2h3LnJ1L2RldmljZXMvaXRlbS5waHA/aXRlbT0xMDU1MDEK
PiAKPiBOb3cgSSdtIHRoaW5raW5nIG9mIHJ1bm5pbmcgTGludXggb24gaXQgKHBvc3RtYXJrZXRv
cykgdXNpbmcgbWFpbmxpbmUga2VybmVsLCBzbwo+IEkgd2FudCB0byBrbm93IGlmIGkgd2FzIGFi
bGUgdG8gYnVpbGQgYSBkZXZpY2UgdHJlZSBmb3IgbXkgZGV2aWNlIGZvciB0aGUKPiBtYWlubGlu
ZSBrZXJuZWwgd2hhdCBraW5kIG9mIHN1cHBvcnQgY2FuIGkgZXhwZWN0ID8KPiAKPiBvbmx5IHNp
bXBsZWZiID8KPiAKPiBkb2VzIHBtaWMsIHVzYiB3b3JrID8KPiAKPiB3aWZpIHN1cHBvcnQgPwo+
IAo+IAo+IFJlZ2FyZHMKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
