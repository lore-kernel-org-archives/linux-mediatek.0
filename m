Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 11:37:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81EA064E3B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 11:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81EA064E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1Yjr2fSSGGMzW7HYgZBH1rAVCE4WCImR60SpTvKP3U=; b=owIw1+7SJlQNp6pDR2Yhgq3oM
	uC80fESJNig5PhEv5vYyfhpZdoAZuiWTtNxM+Y+gUTOSQUUNBejMVJcnn9yi5fMH38NqyGN+OlZ+e
	KMX12Zx1i2qsWfrHt4AcmYpL3VAJ0lJ9TyNfsND8QHYcs6CqqV7bQPQS4UjoUDtWZPpv/5Swptcdp
	nhBeldJHBa9+zzqYNHs3K3dNws/Zc+YE6aU+XBdLdhAmhMjFc/TO8CkU46E6YCKqbDeWeYOmuEYlp
	Cv86SVeqsZTr/brLB5DDzKlDL/6CgYKIfcovL+REWH/Byf155aqG2Sxn//Z+fn75wdt7/NZS77EoY
	AyvHhDQjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9noC-0008UI-44; Wed, 10 Feb 2021 11:37:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9no9-0008T1-NH
 for linux-mediatek@lists.infradead.org; Wed, 10 Feb 2021 11:37:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id b3so2104240wrj.5
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Feb 2021 03:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tAlt2AWMRf+ppapnfIwS3IIQSTyeAdGOjz/xqXMAQy8=;
 b=mVTGUnzQMGuNLnKKHydMVOuXLhU+BJUTKWqI2GhhILiy4LsCHu8NOM4LEaMWSDSnw6
 3oVP1xUcpqkIPqxRvexjgQ0N0gnAtdmbF6/7Y07O6DOf3g2wBG4wm6b+B1CSYtJ/cZCY
 y4z7rBuMWdKqUzWaQAU4U70J9R8qoCKxbIHC1upCeY7ZkIhP6HLHQF6pyohninyFjKH3
 aLoT58U4bdxkGz8o2nbY+KQ3iWo7xMVbatOfJw2Dwm140YlRB9ZXqZPMD5Z2vzYeKCW0
 D3JbJXCFYVDdD9zCHJ/yS9q96Orkl5iYx2bLh8U4X/8jjcBzRtEper3/Dd2u4A+17cic
 7dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tAlt2AWMRf+ppapnfIwS3IIQSTyeAdGOjz/xqXMAQy8=;
 b=loFbennx58BuOhe2ZCSYfk3NGNmC0erinxxaPj7/YXtOvPKBgJ7xIVnzHh4Mfl7SiS
 BXQ+Zw/sygTvRGcYyqZXeswtnfNvLtt1Uk2zA2BKxN28zeXT2nLuY+uPx7jREp3vIQ/H
 j9dEoOMaVyZ3/O1hhtrreGP0ys8pnvvG+i8o/ahc2Bn0mVRNt8bQuZ5YTj1+hi9GPWF9
 poSvQ8D9Xv4VdPTXqReEKeukFrXB9daYv/sH6V0SiB60arfsswcLj50stLrNJQq9nguj
 86aPtoEHLUGSGEtklwtpkcBpamaw+dGOwY6VCY8s1I3lhi6tMBJr6sQ7jke66btpllDX
 voKw==
X-Gm-Message-State: AOAM5307IFpsu07EzLgXHGF6gA6DLw0IVwXRyc6oiN5K2bRdJCWRx2ji
 Xssw9B34chmWUaY/b+PQV+TQAGnC4IM=
X-Google-Smtp-Source: ABdhPJzyaZ5hER8iYOoD7B0dMNiH1h5hjCjbKV8kOPK2BhNic61kBShxM+HPX5G8APC3BXiWUwxsCw==
X-Received: by 2002:adf:fc48:: with SMTP id e8mr3213836wrs.154.1612957038930; 
 Wed, 10 Feb 2021 03:37:18 -0800 (PST)
Received: from ziggy.stardust (static-188-169-27-46.ipcom.comunitel.net.
 [46.27.169.188])
 by smtp.gmail.com with ESMTPSA id z15sm2490795wrs.25.2021.02.10.03.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:37:18 -0800 (PST)
Subject: Re: [PATCH 2/3] watchdog: mtk_wdt: add support for 16-bit control
 registers
To: Boris Lysov <arzamas-16@mail.ee>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210131234425.9773-3-arzamas-16@mail.ee>
 <050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net>
 <20210202043355.18080818@pc>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f73f3d85-5f2e-21a3-5ce0-02f384ffa660@gmail.com>
Date: Wed, 10 Feb 2021 12:37:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202043355.18080818@pc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_063721_846716_60C9D786 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: robh+dt@kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAwMi8wMi8yMDIxIDAyOjMzLCBCb3JpcyBMeXNvdiB3cm90ZToKPiDQkiBTdW4sIDMxIEph
biAyMDIxIDE2OjMxOjA5IC0wODAwCj4gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
PiDQv9C40YjQtdGCOgo+IAo+PiBXZSBjYW4ndCBkbyB0aGlzLiBXaXRoIHRoaXMgZmxhZyBlbmFi
bGVkLCB0aGUgd2F0Y2hkb2cgd29uJ3QKPj4gc3VwcG9ydCBvdGhlciBTb0NzLCBhbmQgdGhlcmUg
aXMgbm90aGluZyB0aGF0IHByZXZlbnRzIHRoZSBmbGFnCj4+IGZyb20gYmVpbmcgc2V0IGZvciB0
aG9zZSBTb0NzLgo+Pgo+PiBUaGlzIGhhcyB0byBiZSBoYW5kbGVkIGRpZmZlcmVudGx5LCB3aXRo
b3V0IGNvbmZpZ3VyYXRpb24KPj4gZmxhZy4gTWF5YmUgdXNlIHJlZ21hcCBmb3IgcmVnaXN0ZXIg
YWRkcmVzc2VzLCBbc25pcF0sCj4+IG9yIHVzZSBhY2Nlc3NvciBmdW5jdGlvbnMgaW4gbXRrX3dk
dF9kZXYuCj4gCj4gVGhhbmsgeW91IGZvciByZXZpZXdpbmcgbXkgcGF0Y2ghCj4gCj4gSSB3aWxs
IGNvbnNpZGVyIHN1Z2dlc3RlZCBmaXhlcywgYW5kIEkgd2lsbCBjb21lIHVwIHdpdGggYmV0dGVy
IHNvbHV0aW9uCj4gaW4gVjIuIEknbSBiZWdpbm5lciBkZXZlbG9wZXIsIGFuZCBhbSBzdGlsbCBs
ZWFybmluZy4KPiAKPj4gdXNlIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byBkZXRlcm1pbmUgd2hp
Y2ggcmVnbWFwIHNldHRpbmdzIHRvIHVzZQo+IAo+IEkgdGhpbmsgcmVseWluZyBvbiBoYXJkY29k
ZWQgImNvbXBhdGlibGUgc3RyaW5nIC0gc2V0dGluZ3MiIHBhaXJzIGluCj4gZHJpdmVyIGlzIG5v
dCBnb29kLiBXaGlsc3QgbW9zdCBNZWRpYXRlayB3YXRjaGRvZ3MgSSd2ZSBzZWVuIHVzZQo+IHNp
bWlsYXIgZHJpdmVycywgbm8gb25lIChleGNlcHQgTWVkaWF0ZWsgaXRzZWxmLCBvZiBjb3Vyc2Up
IGtub3dzIGZvcgo+IHN1cmUgaG93IG1hbnkgZGV2aWNlcyB1c2UgMTYtYml0IG1vZGUsIGFuZCBz
cGVjaWZ5aW5nIGVhY2ggb25lIGluIEMKPiBjb2RlIG1heSBfdGhlb3JldGljYWxseV8gYmxvYXQg
aXQuICh3ZWxsLCBvbiB0aGUgb3RoZXIgaGFuZCwgSSd2ZSBzZWVuCj4gb3RoZXIgd2F0Y2hkb2cg
ZHJpdmVycyB3aXRoIG1hbnkgY29tcGF0aWJsZSBkZXZpY2VzIGxpc3RlZCBpbiBDIGNvZGUsCj4g
YW5kIHRoZXkgZGlkbid0IHNlZW0gYmxvYXRlZCBhdCBhbGwpCgpXZSBlbmFibGUgMTYgYml0IGFj
Y2VzcyBmb3IgIm1lZGlhdGVrLG10NjU3Ny13ZHQiIGlmIHdlIGhhdmUgYSBuZXcgU29DIHRoYXQg
YWxzbwpuZWVkcyAxNiBiaXQgYWNjZXNzLCBtb3N0IHByb2JhYmx5IHdlIGNhbiBqdXN0IHVwZGF0
ZSB0aGUgYmluZGluZyBkb2N1bWVudGF0aW9uCmJ5IGFkZGluZyB0aGUgbmV3IFNvQyB3aXRoIGEg
ZmFsbGJhY2sgdG8gbXQ2NTc3OgoKIm1lZGlhdGVrLG10MTIzNC13ZHQiLCAibWVkaWF0ZWssbXQ2
NTc3LXdkdCI6IGZvciBNVDEyMzQKCkFzIG5vIGJpbmRpbmcgdG8gbXQxMjM0IGlzIHByZXNlbnQg
aW4gdGhlIGRyaXZlciwgdGhlIG10NjU3NyBvbmUgd2lsbCBiZSB1c2VkLgoKUmVnYXJkcywKTWF0
dGhpYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
