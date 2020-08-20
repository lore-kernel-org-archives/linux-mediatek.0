Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45481C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 20:10:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E93207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 20:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+Ps7O8s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaI2XwvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E93207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GdsG+SCeBszRw9qPzmfeX/ZgKWoAUlk2iGpuflzLN+s=; b=O+Ps7O8sOQJrCmlh3pBG/te67
	HIA5LYbYBjC91SPzKfzYhvKdXrt9WZH5rdiUW0BlEHV77u8sPekbj4IpvPwZ8mi0nrs17Nk5z9oel
	RPv39GF6jAndftOlP5yt93PDNvEK6I+wdXRTT5Pu+RmGhtiRh+C/FrhuZuLeePbOkn4irY+sqnYSA
	fbH6un8lGnXpCQObXrGLBKWWKBrXWJjlJ96v0tVc136Fkik0xJ0J4g8weVztrZTNl8pKuQx+qA4C9
	LnbJb3pzjfbW4rQli2o1v3VJqcRvZ1mFI2X0+84qFZcgUMsnDKt4WvChzGf4MX+T3IBxZ9DCgsmTn
	DLeQ+9+LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qtL-000742-EF; Thu, 20 Aug 2020 20:10:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qtI-00072z-Rg; Thu, 20 Aug 2020 20:10:30 +0000
Received: by mail-lj1-x244.google.com with SMTP id v9so3503122ljk.6;
 Thu, 20 Aug 2020 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
 b=aaI2XwvNa4jYT+ZP++lm8ICOT30vbHbYUWZ2eapjPgVOrbFZiW0JrsNRnHrkHauDAe
 F+tXGAAqJ4vzEu+ctIrX4IM+yBsxNUqux5EEMIr8tDiF5nelEImI1pAGijUjDb9sdpr+
 3jhTQx0pxPCjI9Yjxp5eOYRJHWEFTz3Q/JDopYi/d21uwf6ydkQJd8zd0nrYHrBm51gj
 IJ251b8BXCu/KouQNs7VyVjZaRoQ6EfqJzBBwEfbvaelF0x0hTDyx36zN9EiD0UZhoes
 jE4vU9heUNNm5TPrDjhlMPFoFqDRVuH+5P+XTNd0kuG1aP3MnluFFFC7ajaNVZ0Eb9HZ
 g3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
 b=O14vw+iR6/8TK6d1xTE/aU9phpFQHlE3XfM+JhCOAvedoICrXIla9idMTce1hJxDH8
 83OonqmeNWHwJD1q7uId8qaI6gY3JWE4EigqMDy+WyJjhJutgmdNS1kbRGmiar4jwIA5
 woui2iGibCujmnOOioN1Uov/g6qOQOW4PQWJ6lnRc3H51GefDFdLI12FTgwjcRSe5/6S
 V3Q4DNNLPGecvGcTHYpU3FSghbDpY0KA48XRtUo868Pb3vJ7ZWHolu390vEaaKrLoFlq
 91+TEnJ2tmoy9LEciarZ8fx4J5ppGpR1KXiyCcqFlZjyvMzN+2kh1Xdm0SlMnELLHxj2
 9XUA==
X-Gm-Message-State: AOAM531xkLkMM/3EihMl1co+0pbsVtgs0YR3Pj4dqXIw9ywgQORHkocB
 D35M0xRsEowLE1o2ZCZvQfU=
X-Google-Smtp-Source: ABdhPJwerR6+NSwUtwLl00X9aib7HLlZlj50J5PUAv4AGloGJDrAm7Kb1tk696rJXQBYokDQvzy/bw==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr684ljj.258.1597954226414;
 Thu, 20 Aug 2020 13:10:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id f23sm633489ljk.74.2020.08.20.13.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 13:10:25 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
From: Dmitry Osipenko <digetx@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Message-ID: <ebc9c605-b986-daef-9f2c-1834437fd292@gmail.com>
Date: Thu, 20 Aug 2020 23:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_161028_926781_ABB1CAAE 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MjAuMDguMjAyMCAyMjo1MSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gQWx0ZXJuYXRp
dmVseSwgdGhlIFRlZ3JhIFNNTVUgY291bGQgYmUgY2hhbmdlZCBzdWNoIHRoYXQgdGhlIGRldmlj
ZXMKPiB3aWxsIGJlIGF0dGFjaGVkIHRvIGEgZG9tYWluIGF0IHRoZSB0aW1lIG9mIGEgZmlyc3Qg
SU9NTVUgbWFwcGluZwo+IGludm9jYXRpb24gaW5zdGVhZCBvZiBhdHRhY2hpbmcgYXQgdGhlIHRp
bWUgb2YgYXR0YWNoX2RldigpIGNhbGxiYWNrCj4gaW52b2NhdGlvbi4KPiAKPiBPciBtYXliZSBl
dmVuIElPTU1VIGNvcmUgY291bGQgYmUgY2hhbmdlZCB0byBhdHRhY2ggZGV2aWNlcyBhdCB0aGUg
dGltZQo+IG9mIHRoZSBmaXJzdCBJT01NVSBtYXBwaW5nIGludm9jYXRpb24/IFRoaXMgY291bGQg
YmUgYSB1bml2ZXJzYWwKPiBzb2x1dGlvbiBmb3IgYWxsIGRyaXZlcnMuCgpBbHRob3VnaCwgcGxl
YXNlIHNjcmF0Y2ggdGhpcyA6KSBJJ2xsIG5lZWQgdG8gcmV2aXNpdCBob3cgRE1BIG1hcHBpbmcK
QVBJIHdvcmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
