Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C9C4727F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 09:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2F62087D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 09:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fIDNOZBr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6GrHDly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2F62087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1VrHskl1SDIjSTLoWKXobKMoDjpZ4bIDmzKn1Hjq1cQ=; b=fIDNOZBr4J9u5tsibrGdO7wAa
	kR9mNV5Vw/ugbuGaIpnwg4isMLdlbUb8mkKieCXQvLwEE/rqeevCPkOMxljwAqBMTtJ1YShrjwKyc
	ySf7b4NgH50sfV9sQp6gPfo7V91oTGMj6AIFuPEMDnnFnXzn0zSR11lnRrs5TuVayRQOtII4gcL+Y
	ZmjqDDoQFBduhnead/uMsr1Q4RxR6vfPuJJ0GvPZ6jMu1xEcL5qdTsaOUIPKsAyldAJajgjQ3wAFt
	RkZjGJI+0WB/GEwfWyHIQIVhoP3mFr8kCRtU3uyTR2ZXhwNGNyiZA26R38e2fm3toZy/s+gyekzCx
	jbIV6ZDHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNumG-0001ye-Sm; Thu, 01 Oct 2020 09:21:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNubb-0003GX-Rk
 for linux-mediatek@lists.infradead.org; Thu, 01 Oct 2020 09:10:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id l15so1776985wmh.1
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2020 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OqYeGnQSQwhZ/e/vDbKe6Z9MFEMvauFkIAR+AyLSu6U=;
 b=o6GrHDlyWQ1Xu8gkqQa6CyxIaNDdJPzX4iaQWbrF4lvI3jIgd/Ga+UQRbb97B44Oz5
 cJnZ58Bhl/7UxizKT9VLi5RQDyPpfn905dnuYhUM66rc313TCq29D3WIpaa0xNkFkD3s
 cjJLTqaVdi3A9bLg0a9A7p77/IB8ELLFLoCYtGket/FUHA3DQcgf1w9RJ05yZ++/iGDX
 33HrBZVKcr6XNk0SVL2lhz5Kdix1N53TaEX6wBbyE9U8gEeNUV3nN/+6BHL4Xi3Kmxsc
 lDQtnkfneM9taTo0nF1HAO0NLPOHQljBZqd69gR0CSCp5YyUBIRLHcm4hXDTDKJ+HZ8X
 ijKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OqYeGnQSQwhZ/e/vDbKe6Z9MFEMvauFkIAR+AyLSu6U=;
 b=fyj8t7HM+N9cALW3TZUKkZ0Hm2U1hmfTxU2gOcxjaLbDD2ycyWLwpnwSN0aom44hr5
 2QN0kebNZIb3jALC9HvSGDUcVkPq/SXk66j9v9OvDIo2pVvOA+Go6++72j5Fx+wOtTqC
 goevQSYP0xCdlBnByuxqbcTon5uIF4xKvpsi9Wy1W5w8zk3F+setoluFjIEVlfR69FsO
 WEe39epJKLnquCpy19NPhj9CNw9M2yN/6RtHlzH3V7lp964SLnSobbppN1Y+ITsDfzsn
 Y+FO5wKR9Auy2WLptHiuQrEw3j10NlOWbFfr9tFZlxk+YwBzKd8ig7w3jMoHZnk1WFVB
 WbKg==
X-Gm-Message-State: AOAM53365MuEeHn8F2POMP5Odcv39e4wl21HQLjh0z0pTVA49tWJVZR0
 TLtLcnO7CSkJz+4K3/8iG2PddA==
X-Google-Smtp-Source: ABdhPJx1RF21ZOcysPcrco4kHwwwHAg/sHdiRg7TsXuQndvg9yy/CDfpNc0jB7zNS9kDQpLlK6WkJQ==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr7706622wma.32.1601543426714; 
 Thu, 01 Oct 2020 02:10:26 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t6sm9431729wre.30.2020.10.01.02.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 02:10:25 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:10:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v5 04/10] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
Message-ID: <20201001091024.GN6148@dell>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600770019-11585-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600770019-11585-5-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_051028_235437_DEF1E738 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMiBTZXAgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNv
dXJjZXMgaW50byBtdDYzNjAgcmVndWxhdG9yIHJlc291cmNlcwo+IHRvIHNpbXBsaWZ5IHRoZSBz
aW1pbGFyIHJlc291cmNlcyBvYmplY3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxn
ZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMg
fCAxMSArKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91
ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmlj
YWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
