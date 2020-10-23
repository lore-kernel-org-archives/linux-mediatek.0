Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF2BC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:55:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4BA2168B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSUNo+9C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf6ThxZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4BA2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Z5LXk9a6buBfx/fU0kYY3Hc5CyZvlpkENL2Kx9m0Uk=; b=iSUNo+9C0y3SxQ5GGeo3UUG73
	hIDvWN3bXgZRu8pbWB7W+B7z/2zdXLPG7u7esrVbs0XHq38Bai5c6wDa9tcQ5b/Y+pVIse/Boluxa
	tJ5eQ/RsUiXHKfm5ddshAh5eKt7gvUqEtMMpawMLwB/kh5i11+UXFGf47ilEPpC7vzrs1UjGgoay1
	kq9k/oj2D9Saw4yc7N8ssx+IpZcQkDw66zac+XtXQakao+lemeEvUIlo3nLvfuWsu7f2wqMVeRxgL
	bKHKWhksxsNOi5Xa4XHdHz+G1S3/8GK6ZZvGZQGOBmBKKYN5pP1+PEs+rKEd8Wd3SXVqxyQc1FTi+
	lDsZMqPOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtmj-0008Hv-1i; Fri, 23 Oct 2020 09:54:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtme-0008Gl-Ph; Fri, 23 Oct 2020 09:54:53 +0000
Received: by mail-wr1-x442.google.com with SMTP id n18so1110262wrs.5;
 Fri, 23 Oct 2020 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=33PxRKHXGZaR8Akuh25nhwh94mQILSpGUhfNOEDRamY=;
 b=Pf6ThxZAqQDbjixttCY5ALkbcs0hoN7kkdH6NwwXvfnfR0AMHG9dRaPPT8Dpq3e/DX
 ewBWEPM9xvzxF3LJhl8O4wXjq641eSO5lPl73XJMpXdqQta/gmtz9W20vzNJICItsrn+
 jCtfjcXH9tMJDa0TS2mCuBQ0f08tETCacGVEKn1ZhVjYjls40xxyQhITTxp8N34Pmggq
 X65Um0q5prMNdeMm5XOSukFxXsFQLbYs3CrO48VWSihj/lKVaR2Vpw+iIFnuzMaX+F0Z
 Ig9TLXm7wDd7255n19casZ183Rr6BCQ353GJxofAF/45U6A5pNgziPh2Rl1SABtvibOn
 2RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=33PxRKHXGZaR8Akuh25nhwh94mQILSpGUhfNOEDRamY=;
 b=IQG6MU6cV3uob6ghqWvaBflXpByjVBChBr5DoPjzeQAl7MT7wwHxDi1lsZsZxaiAPO
 /Fa1WJ9x+3tSSjm537E4uAgSeFTYyXO3oTCq7efwdr40Hxv/eXjexhx+B7Es3TNSeXIC
 njaTL6CzGEZgBcFnh7IH1pAepQw7OKex+bs40cjEjaZYWxddqZ5qFyWP68CGNvZluP8+
 v1QfHN4oTpf4xLmasjZDKBJOXjz2J1+48FDeay4HOw1tz4cNKcnaxgolZ339iehHOcd5
 9Oq8e6TEWI8EL00iq9iUUunLYDHYsm0hFmH7Rauoa1OgycWOlKnn7xJQLQrN2Q9fyYF8
 TGtg==
X-Gm-Message-State: AOAM530RC4zr9csMT72tGv6hNbv80OikR55wt7DJx7/OI+VjyFXRk/u6
 Yo4EgXHv6cwtloHrdldQ/HggyirVTLMnyw==
X-Google-Smtp-Source: ABdhPJy+ySkVkHwUExvk/bcRpM2hZ71hE496Y1reuvgUUPyeXvWXypE55nkBpoJIYXnB/yxtaIqz4w==
X-Received: by 2002:adf:a455:: with SMTP id e21mr1898622wra.158.1603446890187; 
 Fri, 23 Oct 2020 02:54:50 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id q6sm2325490wma.0.2020.10.23.02.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 02:54:49 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: change mediatek wiki page
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, matthias.bgg@kernel.org
References: <20201020152639.21950-1-matthias.bgg@kernel.org>
 <CAAOTY__MegNwaUGphYNpnKrC_y8SX-_rDNXGxsaBJ6FDBKsQ_w@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8605c61c-4329-9771-ba45-058e7d3f199c@gmail.com>
Date: Fri, 23 Oct 2020 11:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__MegNwaUGphYNpnKrC_y8SX-_rDNXGxsaBJ6FDBKsQ_w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_055452_859756_7F235365 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: kuohong.wang@mediatek.com, yh.chen@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Miles.Chen@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yingjoe.Chen@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMS8xMC8yMDIwIDE4OjUzLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBNYXR0aGlh
czoKPiAKPiA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgyMOaXpSDp
gLHkuowg5LiL5Y2IMTE6Mjflr6vpgZPvvJoKPj4KPj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8
bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPj4KPj4gVGhlIG9sZCB3aWtpIHBhZ2UgdW5mb3J0dW5h
dGVseSBnb3QgbG9zdCBieSBzZXJ2ZXIgY3Jhc2guCj4+IFRoZSBuZXcgd2lraSBjYW4gYmUgZm91
bmQgb24gdGhlIGtlcm5lbC5vcmcgaW5mcmFzdHJ1Y3R1cmUKPj4KPiAKPiBSZXZpZXdlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gCgpwdXNoZWQgdG8gdjUu
MTAtdG1wL3NvYwoKVGhhbmtzCgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxt
YXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+PiAtLS0KPj4gICBNQUlOVEFJTkVSUyB8IDIgKy0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5kZXggMTRiOGVjMGJiNThi
Li43ZDAwODg3ODJhOWYgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5U
QUlORVJTCj4+IEBAIC0yMDY3LDcgKzIwNjcsNyBAQCBNOiAgICAgICAgTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPj4gICBMOiAgICAgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPj4gICBM
OiAgICAgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBu
b24tc3Vic2NyaWJlcnMpCj4+ICAgUzogICAgIE1haW50YWluZWQKPj4gLVc6ICAgICBodHRwczov
L210ay5iY25mcy5vcmcvCj4+ICtXOiAgICAgaHR0cHM6Ly9tdGsud2lraS5rZXJuZWwub3JnLwo+
PiAgIEM6ICAgICBpcmM6Ly9jaGF0LmZyZWVub2RlLm5ldC9saW51eC1tZWRpYXRlawo+PiAgIEY6
ICAgICBhcmNoL2FybS9ib290L2R0cy9tdDYqCj4+ICAgRjogICAgIGFyY2gvYXJtL2Jvb3QvZHRz
L210NyoKPj4gLS0KPj4gMi4yOC4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+PiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
