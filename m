Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C656C4332D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 16:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1014D2072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 16:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXEPwQQB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJAO/b/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1014D2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXOkcpzwEqtXCvD95uFg56urY5vzC3nn9l+/BIVGKfQ=; b=kXEPwQQBJmheWG
	zV2+RaIxEPlAcfVcG0SFjr1MInc89WZS8wJ3yfkMVK4GzpBGC9e6z6HPDKGFmyltPMIlSfq0s+NWj
	hHVYwqMbonSUrE0WD75D+2hj4Zqk2d9Dg051mKhSvCy/t7OBLBM4Vg0p9LwpXbJ7RhQX8ZZa0Tqj4
	yqDNaqiuAWv2e4XQo62FxDrawPMYiDUmwSLcuiMxN1zVPoiJYqSQl7Wc7a3hNKh/tl29qgWeLINnA
	QQJoIuJilypuJCRKyVMg+kZBTbvWgPulmpJLoNPBbN6kXcqMM1OOKHEfDA7cOwWImGc0uDWTg8Dr+
	u9PsD+6XonLmOGV91iKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEyEf-0007sN-1G; Thu, 19 Mar 2020 16:41:33 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEyEb-0007rf-BI
 for linux-mediatek@lists.infradead.org; Thu, 19 Mar 2020 16:41:30 +0000
Received: by mail-qv1-xf30.google.com with SMTP id o18so1366127qvf.1
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2020 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:message-id:from:to:cc:subject:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=vyAMExzQFKjpC1p7pxbxvA9MT64/Ex/7RNGh2RuVBzU=;
 b=NJAO/b/i6XXu1vUbBm1trI283ayCvJtoP8TkREHTcrtcmBmxJMN98rJmytZ0ow8GGD
 smgH4ioHLZu/TUXApynMGIOcP4td80//UzTrvKf7gA8e2ElvLpYuG4cnphYZfoeW8Qzj
 Y07ern09OLsIuYut7cUO662Ie5VmdeH8CGLydsrxCtV+mZqJEZZ3nERwy1DhgcpML2n4
 eRpFwQtpdLzVLoAfXyYqrHkMLsQuzgiUgzMcSoOPgCHy0KOWI0jzY7BQiBQ0huNA6m3j
 efcsHtPj1AIjCfto/cuXv/CKUZiYDs97DFmfHxDyQhMUBPRExjlOVoLTRqPunoJggLwZ
 /GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=vyAMExzQFKjpC1p7pxbxvA9MT64/Ex/7RNGh2RuVBzU=;
 b=m/Od2jnTLM3x6myUNgoB8VarhxO7iOyJ6DKs4vqQ4tPiJZI4K1G1eIQu1TPkINsouJ
 IOV2rxK/5X6KTJhdBb9MU9ojXYBZ+sWAGPlKgYA+94lIO8nNxwKBMy5s1clBU+8oRAsg
 oUOffRrimhhZasWbNMAMUU8yqc3osoGSvlC8Rh/KH0cFBbbpQv46l2X3IvCxGu3DZVhO
 kVYJfxAqOA66ijp/C0trNaGjwpuyWll/qayt0jv4L8RKF7aQ7dVXDYatLeVViiRmOuaf
 lwe9fe5wCUYad2JCdFHJrPpkI0bASNoyvd/7yV1wrXQFSB/1JBAqORlIKUvBN2qjXdde
 yG9A==
X-Gm-Message-State: ANhLgQ3HvkQyxDN9xDNbmUv/TBo85iNWaLV2egXc2o2PJ3ZVrdObGY2G
 7mwgFaTGwD70Y5zkyCEN/C0=
X-Google-Smtp-Source: ADFU+vvTOE2pGo10uUVqIQpvDOOHgn7IT+Dw6//5ek7UaNo4N2khjiyp4d8VaB8scYN4LZ0p0ePqiQ==
X-Received: by 2002:a0c:c60a:: with SMTP id v10mr3854353qvi.140.1584636084808; 
 Thu, 19 Mar 2020 09:41:24 -0700 (PDT)
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca.
 [184.163.105.249])
 by smtp.gmail.com with ESMTPSA id b7sm1841891qkc.61.2020.03.19.09.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 09:41:24 -0700 (PDT)
Date: Thu, 19 Mar 2020 12:41:23 -0400
Message-ID: <20200319124123.GB3412372@t480s.localdomain>
From: Vivien Didelot <vivien.didelot@gmail.com>
To: =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [[PATCH,net]] net: dsa: mt7530: Change the LINK bit to reflect
 the link status
In-Reply-To: <20200319134756.46428-1-opensource@vdorst.com>
References: <20200319134756.46428-1-opensource@vdorst.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_094129_389210_C2068EC9 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Smith <andrew.smith@digi.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUmVuw6ksCgpPbiBUaHUsIDE5IE1hciAyMDIwIDE0OjQ3OjU2ICswMTAwLCBSZW7DqSB2YW4g
RG9yc3QgPG9wZW5zb3VyY2VAdmRvcnN0LmNvbT4gd3JvdGU6Cj4gQW5kcmV3IHJlcG9ydGVkOgo+
IAo+IEFmdGVyIGEgbnVtYmVyIG9mIG5ldHdvcmsgcG9ydCBsaW5rIHVwL2Rvd24gY2hhbmdlcywg
c29tZXRpbWVzIHRoZSBzd2l0Y2gKPiBwb3J0IGdldHMgc3R1Y2sgaW4gYSBzdGF0ZSB3aGVyZSBp
dCB0aGlua3MgaXQgaXMgc3RpbGwgdHJhbnNtaXR0aW5nIHBhY2tldHMKPiBidXQgdGhlIGNwdSBw
b3J0IGlzIG5vdCBhY3R1YWxseSB0cmFuc21pdHRpbmcgYW55bW9yZS4gSW4gdGhpcyBzdGF0ZSB5
b3UKPiB3aWxsIHNlZSBhIG1lc3NhZ2Ugb24gdGhlIGNvbnNvbGUKPiAibXRrX3NvY19ldGggMWUx
MDAwMDAuZXRoZXJuZXQgZXRoMDogdHJhbnNtaXQgdGltZWQgb3V0IiBhbmQgdGhlIFR4IGNvdW50
ZXIKPiBpbiBpZmNvbmZpZyB3aWxsIGJlIGluY3JlbWVudGluZyBvbiB2aXJ0dWFsIHBvcnQsIGJ1
dCBub3QgaW5jcmVtZW50aW5nIG9uCj4gY3B1IHBvcnQuCj4gCj4gVGhlIGlzc3VlIGlzIHRoYXQg
TUFDIFRYL1JYIHN0YXR1cyBoYXMgbm8gaW1wYWN0IG9uIHRoZSBsaW5rIHN0YXR1cyBvcgo+IHF1
ZXVlIG1hbmFnZXIgb2YgdGhlIHN3aXRjaC4gU28gdGhlIHF1ZXVlIG1hbmFnZXIganVzdCBxdWV1
ZXMgdXAgcGFja2V0cwo+IG9mIGEgZGlzYWJsZWQgcG9ydCBhbmQgc2VuZHMgb3V0IHBhdXNlIGZy
YW1lcyB3aGVuIHRoZSBxdWV1ZSBpcyBmdWxsLgo+IAo+IENoYW5nZSB0aGUgTElOSyBiaXQgdG8g
cmVmbGVjdCB0aGUgbGluayBzdGF0dXMuCj4gCj4gRml4ZXM6IGI4ZjEyNmE4ZDU0MyAoIm5ldC1u
ZXh0OiBkc2E6IGFkZCBkc2Egc3VwcG9ydCBmb3IgTWVkaWF0ZWsgTVQ3NTMwIHN3aXRjaCIpCj4g
UmVwb3J0ZWQtYnk6IEFuZHJldyBTbWl0aCA8YW5kcmV3LnNtaXRoQGRpZ2kuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgoKUmV2aWV3
ZWQtYnk6IFZpdmllbiBEaWRlbG90IDx2aXZpZW4uZGlkZWxvdEBnbWFpbC5jb20+CgpGb3IgdGhl
IHN1YmplY3QgcHJlZml4LCBpdCBpcyBwcmVmZXJhYmxlIHRvIHVzZSAiW1BBVENIIG5ldF0iIG92
ZXIKIltbUEFUQ0gsbmV0XV0iLiBZb3UgY2FuIGVhc2lseSBhZGQgdGhpcyBicmFja2V0ZWQgcHJl
Zml4IHdpdGggZ2l0CmZvcm1hdC1wYXRjaCdzIG9wdGlvbiAtLXN1YmplY3QtcHJlZml4PSJQQVRD
SCBuZXQiLgoKClRoYW5rIHlvdSwKCglWaXZpZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
