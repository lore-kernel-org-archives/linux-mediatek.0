Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D63C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 11:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7642245C
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 11:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0IzanPao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPU0S8RA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7642245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FjQ97VEI+ASfg1po5bWB9f6hG3eTWx3ZbsYIy0qIg6s=; b=0IzanPaoZXwjMYdq7Qxh8DZjx
	DLWJPkSkP6hRXh2+btoxj5b/glpxrGNi2mDfSdBtNb/8qzLljhDDjIWWdFFdJI2PNxfmG6AMiATcz
	ynP9QCWSnKWd0h7se56DWvL58YmeYjj6zkxpcrXvgRkB0Pz3drbecIw+EnMurJz9/ZrybLTXlK/D/
	7q4uZ1vor3+AHigCbBEnUvEjMbebr1OBXgj2h/Oj5RghgWmdqUvBC0P5fAL+0BHsY9rjF3RlVdii2
	G+OQm26l2Ahn59bRKsMmhd1mpA/3uhB0NTDNxZ8cUgB1UQJsSveZO6K9pgCvdONjtPMhihANk7w7V
	olvvvfXnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Sxp-0004PR-6A; Fri, 31 Jul 2020 11:12:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Sxm-0004O7-Ia
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 11:12:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id l2so17074383wrc.7
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SAJ/B5vlycsw95obezE/2ESChFtR1rGop3GZL1mr6Lo=;
 b=BPU0S8RALM+4SBkU/ZFFEL3yo2qQphBGZUs+LshQF7KlODLeCvfG4d/JmT+U9ly/rs
 W15FjoBZLQwg/HTpX0n/dZJcmeRnpoi1dtFF6Y91gg28NgbZolEHiuot9hYMuM6YOZ8u
 twVVDL1Vtesepv3ut0O5olUjb+pzArd1T0Y7Nuut8AgObrEH8O6iIa2AgXU7RsPAj1it
 ErQm+5MU3eIdG5EefdCKDWWNS2ej67t1BsZodVcp55+UOi5Rlbe0kYNYqncMRYs26DSp
 O1mSR0Y4vONAczHDpGrGK3UQ97vSqxOCi+/ZtkE/opPOUCY7Pt5QjGhc/O+T1lUqDXL8
 4QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SAJ/B5vlycsw95obezE/2ESChFtR1rGop3GZL1mr6Lo=;
 b=hlAp+Yk8lVntrvnni+ZZ1Pj9gb6bPIxXjbxB3QCqOLy0GGfDkfWqZ8XSRmVasiwmTX
 drTC6R8n0yoGDC5zo0+82jROXqQ359x6G2nWpIyxV+VO1qKuPh6gF++QbYaD+0X5oBPt
 yxvgb6VPkqNmh27y55P9BN9MhNF8CscsgmbKa3zCdolDf7bpDdQX+nEqxpuLDVG98/97
 Ct+B26OM4jaQtM3HenlfohAsREKofc3XrGnp/gOOHdKUhE070t6+6PsA4KYempgIt6qh
 SrKJxh4V8bYxsdoIYNodpaxmA+A1jHW5hCwjtdcQtQIKNU1LP08OR7vvq/3MDXGt802s
 Xs/w==
X-Gm-Message-State: AOAM532/9amRLdwgX3DCVdVHur93972AohASyVbLiWG1vIjhIKoy6qja
 bT5u4gz0D3hYbyrR4ColGZdV+w==
X-Google-Smtp-Source: ABdhPJyPGJOocU0OBLIk1fAQ0XbvtfJ/7/7qXWo5zswrtd805FbFvKYD9kgSAcyUo4x7eobsLiv+sA==
X-Received: by 2002:adf:cd12:: with SMTP id w18mr3148164wrm.352.1596193952052; 
 Fri, 31 Jul 2020 04:12:32 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id w2sm15366588wre.5.2020.07.31.04.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 04:12:31 -0700 (PDT)
Date: Fri, 31 Jul 2020 12:12:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces
 into mt6360 regulator resources
Message-ID: <20200731111229.GL2419169@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
 <20200727112921.GK1850026@dell>
 <CAE+NS36cxY9KqxxcmuctK_W_3ZmZnC_xK8VVVaTZqC3vSoqbUw@mail.gmail.com>
 <20200728065422.GB1850026@dell>
 <CAE+NS34OFVf36zp7Nn0ETZ5KEaTet-P_VdPMuiZgqo1HfNxeYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS34OFVf36zp7Nn0ETZ5KEaTet-P_VdPMuiZgqo1HfNxeYA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_071234_638346_D8D7854B 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAzMSBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgyOOaXpSDpgLHkuowg5LiL5Y2IMjo1NOWv
q+mBk++8mgo+ID4KPiA+IE9uIFR1ZSwgMjggSnVsIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0N+aciDI3
5pelIOmAseS4gCDkuIvljYg3OjI55a+r6YGT77yaCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIDE3
IEp1bCAyMDIwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IEZyb206IEdlbmUg
Q2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IENvbWJpbmUg
bXQ2MzYwIHBtaWMvbGRvIHJlc291Y2VzIGludG8gbXQ2MzYwIHJlZ3VsYXRvciByZXNvdXJjZXMK
PiA+ID4gPiA+IHRvIHNpbXBsaWZ5IHRoZSBzaW1pbGFyIHJlc291cmNlcyBvYmplY3QuCj4gPiA+
ID4KPiA+ID4gPiBEbyB0aGUgc3ViLWRldmljZXMgYWN0dWFsbHkgc2hhcmUgdGhlc2UgcmVzb3Vy
Y2VzLCBvciBhcmUgeW91IGRvaW5nCj4gPiA+ID4gdGhpcyBqdXN0IHRvIG1ha2UgdGhlIGNvZGUg
c2ltcGxlcj8KPiA+ID4gPgo+ID4gPgo+ID4gPiBUaGV5IGFyZSBkaWZmZXJlbnQgcmVzb3VyY2Vz
IHVzZWQgYnkgZGlmZmVyZW50IGJ1Y2tzIGFuZCBsZG9zIHdpdGhvdXQKPiA+ID4gc2hhcmluZyBy
ZWxhdGlvbnMuCj4gPiA+IEkganVzdCB0byBtYWtlIHRoZSBjb2RlIHNpbXBsZXIuCj4gPgo+ID4g
SSBkb24ndCB0aGluayB0aGF0J3Mgc2Vuc2libGUuCj4gPgo+ID4gWW91IHNob3VsZCBvbmx5IHNo
YXJlIHJlc291cmNlcyB3aXRoIGNoaWxkIGRldmljZXMgdGhhdCBjb25zdW1lIHRoZW0uCj4gPgo+
IAo+IEF0IGZpcnN0LCBJIHNlcGFyYXRlZCByZWd1bGF0b3JzIGludG8gdHdvIGRyaXZlcnMsIG10
NjM2MC1wbWljLmMgYW5kCj4gbXQ2MzYwLWxkby5jLCBhY2NvcmRpbmcgdG8gZGVmYXVsdC1vbiBw
b3dlciBvciBub3QuCj4gVGhlbiwgSSBtZXJnZWQgdHdvIGRyaXZlcnMgaW50byBtdDYzNjAtcmVn
dWxhdG9yLmMgYW5kIG1lcmdlZCB0aGVpcgo+IHJlc291cmNlcyBhcyB3ZWxsLgo+IFRoZXJlZm9y
ZSwgZm9yIGV2ZXJ5IGRldmljZSBvZiBCVUNLL0xETywgSSdsbCBmaW5kIHJlc291cmNlcyBhY2Nv
cmRpbmcKPiB0byB0aGVpciBuYW1lIGFuZCByZXF1ZXN0IElSUXMuCgpPa2F5LCBzbyBhbGwgb2Yg
dGhlIHJlc291cmNlcyBhcmUgY29uc3VtZWQgYnkgYSBzaW5nbGUgZHJpdmVyPwoKVGhhdCBpcyBm
aW5lIHRoZW4uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
