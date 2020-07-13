Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61904C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 10:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1C5206F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 10:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kN2554tN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+ds4Mxu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1C5206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5VqlShWg6xvR9Z9UyU9kOVwJoPWRySBtnyS0JwvgRwE=; b=kN2554tNFoGNhpRY0c9qgPVlY
	ul9q64gbewgZUuTayNPzX8+VKpx7A1FXISyrntEteCPBwvE2OWJK3SRvEk1YojydmjwUv9cE5e4Iw
	usmpUtkdzvyM4iplT1BD+u3gExtoywj+7Tr/HRwH1WiyqPts1DrbobHNfkwrzBqpSD0f96+wPXCeN
	+axfEhNvfPSJ063ye/V5xh/Wuo3FRFuMsUULp9t2NBuI/x8nNHKkaftpCIwvec58NEuT2UKXUhX4c
	Nm+F4oeAIOKAHcyIq9x3ZA3BRE5tjbSyhv+6C3f3YhDqPdW5Y7J3f2vOJIB0R30aB9JjCOmA0326E
	rTtqkJQQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juvoP-00013Q-M1; Mon, 13 Jul 2020 10:35:53 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juvoL-00011d-VE; Mon, 13 Jul 2020 10:35:51 +0000
Received: by mail-io1-xd44.google.com with SMTP id d18so12902984ion.0;
 Mon, 13 Jul 2020 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zkd7AusD5Iqi8emk4XGpAIzvYnOlGsGXoaeynxJlNps=;
 b=e+ds4Mxu02ZFxQAYVNOw7TqENK6NWoaPkZJ15GsOh6O8+qF/2/IJdeL+TkFXUDfabx
 MdmX8Y29Ljpzf7o42/z88a87iCOrAlwbwT9raV+Vk/b1FtIiFPvM75tVAQ5hRHxZC5Xs
 x+DcYR4yZzlNozDzLblRRiJ1/IBVLe8BJ1F25p/qHDgnfKOuWYMKAhwvPoaqRb/Uv8qy
 Aw7AHkdJaol8wmK2jCh+TCQ6AwqEMxK8PHvv4isbIpHrp0HJsV8o1jzpzwaY642WNrn6
 WGH6B2Hi1tlaV7nor1zz9hHmwAfQZp+NnQcR0AW0wYUaa2y8GdQXW/BsK3WbNoxCKoge
 aCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zkd7AusD5Iqi8emk4XGpAIzvYnOlGsGXoaeynxJlNps=;
 b=b5aHgnBh+V/ZaCjwgKPvuXjs+ytFTXyEVQkQDtjlzExvZSL0e/d8xczu5ilQOSDXa0
 xcmL4aUIRG6ARXIO7RD8Lr4i3Pckx6eKYYuVhiwZVK40/lzGs81rIdzWX8YaNNRJXL6v
 EVznuttCfxxUu0EEctA+ECp2hXNY3kebnS2K8b7zPZcv4KWQmDLzqlMHRIlFi61nV8Pr
 SrrMoiHbyBfzHXWi6BSldjMk8dWxm2Blcj+diABD0t9qwAFNBAGvW4MC3xXGKhXcpJjE
 ZIFGlvmuaR89thvQTg8TxR3WWDTEH5a39ky2vekiUq5UN8ZSg6T/z0Re3LL8RqYxO8QA
 zTgg==
X-Gm-Message-State: AOAM530jGFTOqyMUhKqfge2Y2hXQtVjmofXNKb6l5weVFRJ3HJOWwie1
 GLxL327QSB14dfHYsQpXbE7w8qppZhvZhWEDddQ=
X-Google-Smtp-Source: ABdhPJzCmPsUGSvqCwTgYsZRB+rx9MhwO4tdPSLLlrvlSMY+XJnd1AwtddubSmc8ksVG2gIZUma0ne8j5LMP6u/LfAk=
X-Received: by 2002:a5d:8f0b:: with SMTP id f11mr59878361iof.200.1594636544674; 
 Mon, 13 Jul 2020 03:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-2-git-send-email-gene.chen.richtek@gmail.com>
 <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com> <20200713065110.GB3500@dell>
In-Reply-To: <20200713065110.GB3500@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 13 Jul 2020 18:35:32 +0800
Message-ID: <CAE+NS36uRRqHetQE5QVJ94WX4g7CdQzvD-0VOnLfKAbqdHs3Sg@mail.gmail.com>
Subject: Re: [PATCH 1/4] mfd: mt6360: Refactor and fix code style
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_063550_028297_811CA46F 
X-CRM114-Status: GOOD (  12.88  )
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

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMTPml6Ug6YCx
5LiAIOS4i+WNiDI6NTHlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMTAgSnVsIDIwMjAsIE1hdHRoaWFz
IEJydWdnZXIgd3JvdGU6Cj4KPiA+Cj4gPgo+ID4gT24gMDcvMDcvMjAyMCAxMjozMCwgR2VuZSBD
aGVuIHdyb3RlOgo+ID4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4K
PiA+ID4KPiA+ID4gUmVhcnJhbmdlIGluY2x1ZGUgZmlsZS4KPiA+ID4gUmVtb3ZlIGJyYWNrZXRz
IGFyb3VuZCByYXcgbnVtYmVycy4KPiA+ID4gSW5kaWNhdGUgc3ViLWRldiBjb21wYXRpYmxlIG5h
bWUgYnkgdXNpbmcgIi0iCj4gPiA+IENvbWJpbmUgbXQ2MzYwIHBtaWMvbGRvIHJlc291Y2VzIGlu
dG8gbXQ2MzYwIHJlZ3VsYXRvciByZXNvdXJjZXMuCj4gPiA+IFJlbmFtZSBtdDYzNjBfcG11X2Rh
dGEgYnkgbXQ2MzYwX2RhdGEuCj4gPiA+IFJlbmFtZSBtdDYzNjBfcG11IGJ5IG10NjM2MC4KPiA+
Cj4gPiBUaGF0IHNlZW1zIGxpa2UgYSBsb3Qgb2YgY29zbWV0aWNzLiBXaHkgaXMgdGhpcyBuZWVk
ZWQ/Cj4gPiBJZiB5b3UgdGhpbmsgdGhhdCdzIG5lZWRlZCBpdCBzaG91bGQgYmUgc3BsaXQgdXAg
aW4gZGlmZmVyZW50IGNvbW1pdHMsIGVhY2gKPiA+IGV4cGxhaW5pbmcgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIHdoeSB5b3UgZG8gdGhhdC4KPgo+IEFncmVlZC4gIFRoaXMgc2V0IGlzIHN0aWxsIG5v
dCBicm9rZW4gdXAgZW5vdWdoLgo+Cj4gUGxlYXNlIHBsYWNlIGVhY2ggbG9naWNhbCBjaGFuZ2Ug
aW50byBpdHMgb3duIHBhdGNoIGZvciByZXZpZXcuCj4KCjEuIFJlYXJyYW5nZSBpbmNsdWRlIGZp
bGUuCkFmdGVyIGNoZWNrIHNlcnZlcmFsIGZpbGUgYWJvdXQgY29kaW5nIHN0eWxlLCBpbmNsdWRl
IGZpbGUgc2VlbXMgc29ydApieSBhcmNoaXRlY3R1cmUsIG5vdCBieSBhbHBoYWJldAoyLiBSZW1v
dmUgYnJhY2tldHMgYXJvdW5kIHJhdyBudW1iZXJzLgpEdWUgdG8gcmVkdW5kYW50IGJyYWNrZXRz
LCBhbm90aGVyIHJldmlld2VyIHJlY29tbWVuZGVkIHRvIGRlbGV0ZSB0aGVtLgozLiBJbmRpY2F0
ZSBzdWItZGV2IGNvbXBhdGlibGUgbmFtZSBieSB1c2luZyAiLSIKU3VnZ2VzdGlvbiBieSBMZWVz
IHdoZW4gcmV2aWV3IG1mZCBiaW5kaW5nIGRvY3VtZW50Lgo0LiBDb21iaW5lIG10NjM2MCBwbWlj
L2xkbyByZXNvdWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzLgpTaW1wbGlmeSB0
aGUgc2ltaWxhciByZXNvdXJjZXMgb2JqZWN0Lgo1LiBSZW5hbWUgbXQ2MzYwX3BtdV9kYXRhIGJ5
IG10NjM2MF9kYXRhLgpOb3Qgb25seSBpbmNsdWRlIHBtdSBwYXJ0LCBidXQgYWxzbyBlbnRpcmUg
TVQ2MzYwIElDLgo2LiBSZW5hbWUgbXQ2MzYwX3BtdSBieSBtdDYzNjAuClNhbWUgcmVhc29uIGFz
IGFib3ZlLgoKV2UgdHJ5IHRvIG1ha2UgY29kZSBtb3JlIHNpbXBsZXIgYW5kIGVhc2llciB0byB1
bmRlcnN0YW5kCldlIGNhbiBhbHNvIGRpc2NhcmQgY2hhbmdlcyBpZiBwYXRjaCAxLDIsNCw1LDYg
ZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlLgoKPiAtLQo+IExlZSBKb25lcyBb5p2O55C85pav
XQo+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
