Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F629C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 01:04:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F23820760
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 01:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1lh5Ef3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6gs8eEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F23820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OoB/EwQ4ifV5BcYUyNymNY3+37mBxthVG5w1IShmJ/Y=; b=G1lh5Ef3fI+BrkOTg23QFBJ+D
	IeJ8yK3tqyalW2H44zmgzj4cyKHGWIoQJzw9ilAolkOSC4oSTWjoV4/1ufsBlKI/BXgNEiFL3nNAP
	halMpEa2eGlNY8b1wSZTvXUWmnj1qmB9JcvC0ugQMFG8EITu3kFS4PUa8FV6GjIYZ9MmQMpZENKJq
	kqTbZXBgRcEiPNsuk+Nt6qtxsvDhylBP1GTDQoqq/mhjK8eIQI7M3v1D1FQobTyIvMc3yc8YfthjK
	xrA7BFiuufQcwuzznGJTZ6JzcGuYxundwdusC7iNJ5umISwSfQDesp8mZTswLSuTMTNZazOqHW7uo
	hBNJgjOLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTEAg-0007IQ-Ob; Fri, 16 Oct 2020 01:04:38 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTEAd-0007I3-3N
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 01:04:36 +0000
Received: by mail-lf1-x144.google.com with SMTP id j30so843846lfp.4
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2020 18:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cWLcvgRHCQdlC5HKIAZhx48ho8BZ0djIP0nz2utcEXI=;
 b=d6gs8eEgXnPgKObab+mhRs0FJniuh/EvHC4kcPD8b51kCsBsPDF0nC+P89o3dFvioO
 iQRmkrwhbm/40lLcsfaQD9Z8Rz+KryRawmwrjekYpYzJdyqpTvpzVd0AtYEzugDSFEGr
 bERNGtkxeXFEx0n4vEBB5gPVkuYAjrbln87StxEAIlAwP6B3VWWUmtsMbjnmg2DwJgcK
 FE5LBkjzsKHM2v/B89JIRTxpc202F22HbNRHMh4DFpSo13sLME06Mp2egtJR3yupLFUe
 Dcd+JZggfMJvdaooE1Vvnd3Um/jPRfUGI4AzZk9Z1hnBBz01P+UN28LeSCnCpf92g8JG
 64UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cWLcvgRHCQdlC5HKIAZhx48ho8BZ0djIP0nz2utcEXI=;
 b=iWALjDjMMapWCUmKeek77nanMDDdgNzyTbfSC4cC9fzOgz6/pbEAEtVCYzG5IsNUSe
 wKu4XgYZYkxeOWrdbdnk/BrWhD76b59fiQj0HrhBDiQGV1zyj9TjyqutAEapNcdT5eL8
 RkOd8pHqIiWbyLoKLFzC+0vpX8pGm0ykVeDIr/7ctKqR0RKZPC8xL7XwUZH3uA6Mkv1H
 3g7aQdagJYoeBFaeMaM1DT/BZsn8XM8S7il05R6CpLaTABx/PNJVBviDi+6DzssSH+ZP
 tg2SOfrzoifUCXubUjr2cF7CEb2PGwIC8XY42MFUZOa2cd8s5oMaEu2WbArzxHdxPjyU
 SQgw==
X-Gm-Message-State: AOAM533JSmDxlQ7WPDPqYCm7Jw6d7bZvqAW5UGvL3sZtw6IAOMB2pfYH
 tPRFug/W90OQN9wIAjj0ISDoPjVUwtDEkRNfKp8YQjOuzNo=
X-Google-Smtp-Source: ABdhPJwBQsFkTYLlprwQbz6Jw0oLof/P3UXX53ZIdXXx96lqKYOe8dv6TLlKh+jH8237HWNEx2pQk8r8OB+0/3nEE4E=
X-Received: by 2002:ac2:5325:: with SMTP id f5mr428582lfh.86.1602810271223;
 Thu, 15 Oct 2020 18:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <3BFCA289-ADD8-4755-80C5-1889A9AFB41D@libreelec.tv>
In-Reply-To: <3BFCA289-ADD8-4755-80C5-1889A9AFB41D@libreelec.tv>
From: Forest Crossman <cyrozap@gmail.com>
Date: Thu, 15 Oct 2020 20:04:19 -0500
Message-ID: <CAO3ALPytXHdb6svA+_EbmV7+g9+FdyQhBKWHUJwOGQxyJgL=kQ@mail.gmail.com>
Subject: Re: mt76 support for MT7668 SDIO?
To: Christian Hewitt <chewitt@libreelec.tv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_210435_176116_F8193301 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: linux-mediatek@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q0M6IGxpbnV4LW1lZGlhdGVrCgpPbiBTdW4sIEp1biA3LCAyMDIwIGF0IDExOjUyIFBNIENocmlz
dGlhbiBIZXdpdHQgPGNoZXdpdHRAbGlicmVlbGVjLnR2PiB3cm90ZToKPgo+IEnigJltIGEgbWFp
bnRhaW5lciBmb3IgYSBkaXN0cm8gdGhhdCBydW5zIEtvZGkgbWVkaWFjZW50cmUgb24gbWFueSBw
b3B1bGFyIEFSTSBTQkNzIGFuZCBBbmRyb2lkIFNUQnMgKHJlcGxhY2luZyBBbmRyb2lkKS4KPgo+
IFNpbWlsYXIgdG8gbXkgcmVxdWVzdCBvbiBSVEw4ODIyQ1MsIEkgaGF2ZSBhIG51bWJlciBvZiBy
ZXF1ZXN0cyBmb3IgV2lGaSBzdXBwb3J0IG9uIEFtbG9naWMgU29DIGRldmljZXMgdXNpbmcgTVQ3
NjY4IGNoaXBzLiBUaGUgQlQgc2lkZSBvZiB0aGUgbW9kdWxlIGlzIHN1cHBvcnRlZCBpbiBtYWlu
bGluZSBmb3Igc29tZXRpbWUsIGJ1dCB0aGVyZSBpcyBubyBtZW50aW9uIG9mIFdpRmkuCj4KPiBJ
cyB0aGVyZSBhbnkgcGxhbiBvciB0aW1lbGluZSBmb3IgTVQ3NjY4IFNESU8gc3VwcG9ydCBpbiBt
dDc2PyAuLiBJ4oCZbSBzdHJ1Z2dsaW5nIHRvIGV2ZW4gZmluZCB2ZW5kb3IgZHJpdmVycyBmb3Ig
dGhpcyBjaGlwLgoKSSByZWFsaXplIGl0J3MgYmVlbiBhYm91dCBmb3VyIG1vbnRocyBzaW5jZSB5
b3Ugc2VudCB0aGlzIGVtYWlsLCBidXQKaWYgeW91J3JlIHN0aWxsIGxvb2tpbmcgZm9yIHNvdXJj
ZXMgZm9yIHRoZSBkb3duc3RyZWFtIGRyaXZlciwgSSBrbm93CnRoZXkncmUgaW5jbHVkZWQgaW4g
dGhlIHNvdXJjZSBjb2RlIHJlbGVhc2VzIGZvciB0aGUgQW1hem9uIEZpcmUgVFYKU3RpY2sgNEtb
MV0gKGxhdGVzdCBvbmUgaGVyZVsyXSkuIEluc2lkZSB0aGF0IHRhcmJhbGwsIHRoZXJlJ3MgYQoi
cGxhdGZvcm0udGFyIiBhcmNoaXZlLiBJbnNpZGUgInBsYXRmb3JtLnRhciIgeW91J2xsIGZpbmQg
dGhlIGtlcm5lbApzb3VyY2VzIGZvciB0aGUgRmlyZSBUViBTdGljayA0Sywgd2hpY2ggaW5jbHVk
ZXMgdGhlIFdpRmkgZHJpdmVyIGZvcgp0aGUgTVQ3NjY4IGFuZCBzZXZlcmFsIG90aGVyIGRldmlj
ZXMuIFNwZWNpZmljYWxseSwgeW91J2xsIGZpbmQgdGhlCk1UNzY2OCBkcml2ZXJzIHVuZGVyCiJr
ZXJuZWwvbWVkaWF0ZWsvbXQ4Njk1LzQuNC9kcml2ZXJzL21pc2MvbWVkaWF0ZWsvY29ubmVjdGl2
aXR5L3dsYW4vZ2VuNCIKYW5kICJ2ZW5kb3IvYW1hem9uL3dsYW4vbWVkaWF0ZWsvZHJpdmVyL210
NzZ4OCIgKG5vdCBzdXJlIHdoYXQgdGhlCmRpZmZlcmVuY2UgaXMpLgoKSSwgdG9vLCBhbSBpbnRl
cmVzdGVkIGluIHVwc3RyZWFtIHN1cHBvcnQgZm9yIHRoZSBNVDc2Njggc2luY2UgSSBoYXZlCnNl
dmVyYWwgVVNCIGRvbmdsZXMgKHdlbGwsIHRlY2huaWNhbGx5IHRoZXkgdXNlIGN1c3RvbSBjb25u
ZWN0b3JzIGFuZAphcmUgY3VzdG9tLW1hZGUgdG8gYmUgdXNlZCBpbnNpZGUgc3BlY2lmaWMgVFZz
WzNdLCBidXQgdGhleSBlbnVtZXJhdGUKZmluZSBvbiBhIG5vcm1hbCBQQykgd2l0aCB0aGUgVVNC
IHZhcmlhbnQgb2YgdGhhdCBjaGlwLCBzbyBpZiBhbnlvbmUKaGFzIGFueSBwbGFucyB0byBhZGQg
dGhhdCBzdXBwb3J0LCBJJ2QgYWxzbyBsaWtlIHRvIGtub3cuIEFuZCBpZgpzb21lb25lIGlzIGlu
dGVyZXN0ZWQgaW4gZG9pbmcgdGhpcyBhbmQgbmVlZHMgaGFyZHdhcmUsIGRldmljZXMgdGhhdAp1
c2UgdGhlIFVTQiB2YXJpYW50IG9mIHRoZSBNVDc2NjggYXJlIHByZXR0eSB3aWRlbHkgYXZhaWxh
YmxlIGFuZCBjYW4KZWFzaWx5IGJlIGZvdW5kIHdpdGggdGhpcyBlQmF5IHNlYXJjaCBVUkxbNF0u
IFRoZSB1c2VyIG1hbnVhbFszXSBmb3IKdGhlIGRldmljZXMgbGlzdGVkIGluIHRoYXQgc2VhcmNo
IGhhcyB0aGUgcGlub3V0IGZvciB0aGUgY3VzdG9tCmNvbm5lY3RvciBvbiB0aGUgYm9hcmQsIHNv
IGl0J3MgcmVsYXRpdmVseSBzdHJhaWdodGZvcndhcmQgdG8gc29sZGVyCnVwIGEgVVNCIGNhYmxl
IHRvIGl0IHRvIGdldCBpdCB3b3JraW5nIHdpdGggYSBjb21wdXRlci4KClsxXTogaHR0cHM6Ly93
d3cuYW1hem9uLmNvbS9ncC9oZWxwL2N1c3RvbWVyL2Rpc3BsYXkuaHRtbD9ub2RlSWQ9MjAxNDUy
NjgwClsyXTogaHR0cHM6Ly9maXJlb3MtdHYtc3JjLnMzLmFtYXpvbmF3cy5jb20vbzVQN2RmQnl4
YkJoY2ZRcUk4SXFVUkV5VWMvRmlyZVRWU3RpY2s0Sy02LjIuNy4zLTIwMjAwNzI0LnRhci5iejIK
WzNdOiBodHRwczovL2ZjY2lkLmlvL0JFSkxHU0JXQUM5Mi9Vc2VyLU1hbnVhbC9Vc2VyLU1hbnVh
bC0zOTQ1MDU5LnBkZgpbNF06IGh0dHBzOi8vd3d3LmViYXkuY29tL3NjaC9pLmh0bWw/X25rdz0l
MjhlYXQ2NDQ1NDgwMSUyQ2xnc2J3YWM5MiUyQ3R3Y20tazUwNWQlMjkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
