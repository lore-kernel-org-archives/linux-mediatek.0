Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3863FC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 06:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0DF613DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 06:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0DF613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOV7k3CoQP3sWKfhtYtG5fjzzDl2etP7rS2VvWYSJzo=; b=snEvnOeMLX4Wd7
	5+GmSN3QfBzd0G+cS2koF2+sTwPaz9lvNBYANNe+QFV6cmTWsEtzXzvGb77y0OPuk7GrVMciC8S9J
	S/9bf8Vlhv6OgGUHogtNmSj0pex36pH7ZwRu8iMgQsm1s6nnkLiFFxjCQ360hBcJzKr3S5J0KR4pS
	yds/poWDYfAzKDh8oYet8sl68VamBVROxkykLS0u/t3VRV0MMRtHETRSVGw0nSjDN9Gd3ngINBbHu
	G/wtRVUMOfLIhMn254HtgMlq2J02pRJwbXZ6RkfYa3JyTB/OQOt3e11XPoFXWaYo4X9PA4FgFYN/a
	cPvdxIZlKjo7m83JPp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ISf-00819e-UJ; Mon, 05 Jul 2021 06:52:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ISc-008181-RP
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 06:52:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so17311975wry.11
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=0PAq5gly45ZNE8e5BiWwjKT7YlCoXcC5+DypWR8xekQ=;
 b=teM2Bdl5BmbHgjRb4mT+Wc5tlBFFsvI/WLte/ypgOKGUdnv1OQ7Q4UHv391bGmdF2m
 fbjqfqpuKXxhzxCDJDI2lq3ePRxzqLiM9pmXPifuVuP3zMWZKJFPU5YmAOCjpcVqeuT+
 69FZ6JbInI1FogYB3U3CtedBGOV4antwVdPDtoL9m15ETVWCn02f42eWwCd74Kmoq9Ah
 X4zfSED0QHJhts6U9sEG7pgUZbDUQuGpITSr78bulxMXcFqeIVR8K9Byj/P1E/6F5Lm7
 X9tkyUNtOZePnWwwfgmgIa1wZgiLvobUBXGpjyW7Im9d22zS83wFUbpQWU8F6BI7Nsn/
 pxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0PAq5gly45ZNE8e5BiWwjKT7YlCoXcC5+DypWR8xekQ=;
 b=haJa9TDxS7OkvQJJuBJC0t1s/MO7RR/4j/lV/CIXsnpWbiGL54oj9nvepn/H/JbRiT
 dwd/VkeXCbk5IwzKiV4QwOszHLgGsbG/NuTusSDW7C6Hg4Q372XnpDecEtR0ujBBoh2b
 I6akhJYYWszpa8SUVYm/lz8U9fMqCM7G37Cdr7ivCRPwBTga9dMl/fwJpZqlH+3XXm3T
 YsLzhGaOef9JiqPV4i61gZ/Tk6MQuTe1OSlc+2pWBCeKOyxKHL4UAOohSWK5NwELhri5
 v9dVmWNyTMPBGgztNYGYOmELCKXYhxwJdmMCJ8yRdBkodsc8+3PXHzkzBFKD7qC3IXmj
 IVcA==
X-Gm-Message-State: AOAM531Loc6vbW1+cs5f4+mwWQHNfPrlt/DovsmyjLeUWKnYwcK0ztWx
 w1UfAmIWmvYtb55MI4h5Ngehbg==
X-Google-Smtp-Source: ABdhPJyNpOR+dyomUYhPcFDJgtUd7h/Ep6MW12XYAeNSolQ+4SM8/CIDil3Trk4tn13tfpTuwHudRw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr13930736wru.380.1625467922388; 
 Sun, 04 Jul 2021 23:52:02 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:dddd:647c:7745:e5f7])
 by smtp.gmail.com with ESMTPSA id a4sm11784090wru.55.2021.07.04.23.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 23:52:01 -0700 (PDT)
Date: Mon, 5 Jul 2021 08:51:55 +0200
From: Marco Elver <elver@google.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: yee.lee@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, nicholas.Tang@mediatek.com,
 Kuan-Ying.lee@mediatek.com, chinwen.chang@mediatek.com,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 1/2] mm: introduce helper to check slub_debug_enabled
Message-ID: <YOKsC75kJfCZwySD@elver.google.com>
References: <20210705024101.1567-1-yee.lee@mediatek.com>
 <20210705024101.1567-2-yee.lee@mediatek.com>
 <YOJ6aPuNOtzjVhBC@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YOJ6aPuNOtzjVhBC@casper.infradead.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_235206_923491_EAED60CC 
X-CRM114-Status: GOOD (  21.26  )
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

T24gTW9uLCBKdWwgMDUsIDIwMjEgYXQgMDQ6MjBBTSArMDEwMCwgTWF0dGhldyBXaWxjb3ggd3Jv
dGU6Cj4gT24gTW9uLCBKdWwgMDUsIDIwMjEgYXQgMTA6NDA6NTdBTSArMDgwMCwgeWVlLmxlZUBt
ZWRpYXRlay5jb20gd3JvdGU6Cj4gPiBGcm9tOiBNYXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xlLmNv
bT4KPiA+IAo+ID4gSW50cm9kdWNlIGEgaGVscGVyIHRvIGNoZWNrIHNsdWJfZGVidWdfZW5hYmxl
ZCwgc28gdGhhdCB3ZSBjYW4gY29uZmluZQo+ID4gdGhlIHVzZSBvZiAjaWZkZWYgdG8gdGhlIGRl
ZmluaXRpb24gb2YgdGhlIHNsdWJfZGVidWdfZW5hYmxlZF91bmxpa2VseSgpCj4gPiBoZWxwZXIu
Cj4gCj4gV2UgZG9uJ3QgdXN1YWxseSBlbWJlZCAnX3VubGlrZWx5JyBpbiBmdW5jdGlvbiBuYW1l
czsgd2UKPiBqdXN0IGRvOgo+IAo+IHN0YXRpYyBpbmxpbmUgYm9vbCBzbHViX2RlYnVnX2VuYWJs
ZWQodm9pZCkKPiB7Cj4gCXJldHVybiBzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZzbHViX2RlYnVn
X2VuYWJsZWQpOwo+IH0KClRoZSBuYW1lcyBhcmUgaWRlbnRpY2FsLCB0aGlzIG9idmlvdXNseSB3
b24ndCB3b3JrOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIG1tL3NsdWIuYzoyMToKbW0vc2xhYi5o
OjIxOToyMDogZXJyb3I6IOKAmHNsdWJfZGVidWdfZW5hYmxlZOKAmSByZWRlY2xhcmVkIGFzIGRp
ZmZlcmVudCBraW5kIG9mIHN5bWJvbAogIDIxOSB8IHN0YXRpYyBpbmxpbmUgYm9vbCBzbHViX2Rl
YnVnX2VuYWJsZWQodm9pZCkKCkJ1dCBpdCBzZWVtcyB0aGF0IHNvbWVvbmUgaGFkIHRoZSBzYW1l
IGlkZWEsIGFuZCB0aGlzIG1lcmdlIHdpbmRvdyBnb3QgYQpfX3NsdWJfZGVidWdfZW5hYmxlZCgp
IHdpdGggNzkyNzAyOTExZjU4LgoKWWVlLCBjYW4geW91IHJlcGxhY2UgdGhpcyBwYXRjaCB3aXRo
IHRoZSBiZWxvdzoKCkZyb206IE1hcmNvIEVsdmVyIDxlbHZlckBnb29nbGUuY29tPgpEYXRlOiBX
ZWQsIDMwIEp1biAyMDIxIDIwOjU2OjU3ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gbW06IG1vdmUg
aGVscGVyIHRvIGNoZWNrIHNsdWJfZGVidWdfZW5hYmxlZAoKTW92ZSB0aGUgaGVscGVyIHRvIGNo
ZWNrIHNsdWJfZGVidWdfZW5hYmxlZCwgc28gdGhhdCB3ZSBjYW4gY29uZmluZQp0aGUgdXNlIG9m
ICNpZmRlZiBvdXRzaWRlIHNsdWIuYyBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyY28gRWx2
ZXIgPGVsdmVyQGdvb2dsZS5jb20+Ci0tLQp2NjoKKiBNb3ZlIGhlbHBlciBpbnN0ZWFkIG9mIGlu
dHJvZHVjaW5nIGEgbmV3IG9uZS4KLS0tCiBtbS9zbGFiLmggfCAxNSArKysrKysrKysrKy0tLS0K
IG1tL3NsdWIuYyB8IDE0IC0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL3NsYWIuaCBiL21tL3Ns
YWIuaAppbmRleCA2N2UwNjYzN2ZmMmUuLmY5OTdmZDVlNDJjOCAxMDA2NDQKLS0tIGEvbW0vc2xh
Yi5oCisrKyBiL21tL3NsYWIuaApAQCAtMjE2LDEwICsyMTYsMTggQEAgREVDTEFSRV9TVEFUSUNf
S0VZX0ZBTFNFKHNsdWJfZGVidWdfZW5hYmxlZCk7CiAjZW5kaWYKIGV4dGVybiB2b2lkIHByaW50
X3RyYWNraW5nKHN0cnVjdCBrbWVtX2NhY2hlICpzLCB2b2lkICpvYmplY3QpOwogbG9uZyB2YWxp
ZGF0ZV9zbGFiX2NhY2hlKHN0cnVjdCBrbWVtX2NhY2hlICpzKTsKK3N0YXRpYyBpbmxpbmUgYm9v
bCBfX3NsdWJfZGVidWdfZW5hYmxlZCh2b2lkKQoreworCXJldHVybiBzdGF0aWNfYnJhbmNoX3Vu
bGlrZWx5KCZzbHViX2RlYnVnX2VuYWJsZWQpOworfQogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBwcmludF90cmFja2luZyhzdHJ1Y3Qga21lbV9jYWNoZSAqcywgdm9pZCAqb2JqZWN0KQogewog
fQorc3RhdGljIGlubGluZSBib29sIF9fc2x1Yl9kZWJ1Z19lbmFibGVkKHZvaWQpCit7CisJcmV0
dXJuIGZhbHNlOworfQogI2VuZGlmCiAKIC8qCkBAIC0yMjksMTEgKzIzNywxMCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcHJpbnRfdHJhY2tpbmcoc3RydWN0IGttZW1fY2FjaGUgKnMsIHZvaWQgKm9i
amVjdCkKICAqLwogc3RhdGljIGlubGluZSBib29sIGttZW1fY2FjaGVfZGVidWdfZmxhZ3Moc3Ry
dWN0IGttZW1fY2FjaGUgKnMsIHNsYWJfZmxhZ3NfdCBmbGFncykKIHsKLSNpZmRlZiBDT05GSUdf
U0xVQl9ERUJVRwotCVZNX1dBUk5fT05fT05DRSghKGZsYWdzICYgU0xBQl9ERUJVR19GTEFHUykp
OwotCWlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZzbHViX2RlYnVnX2VuYWJsZWQpKQorCWlm
IChJU19FTkFCTEVEKENPTkZJR19TTFVCX0RFQlVHKSkKKwkJVk1fV0FSTl9PTl9PTkNFKCEoZmxh
Z3MgJiBTTEFCX0RFQlVHX0ZMQUdTKSk7CisJaWYgKF9fc2x1Yl9kZWJ1Z19lbmFibGVkKCkpCiAJ
CXJldHVybiBzLT5mbGFncyAmIGZsYWdzOwotI2VuZGlmCiAJcmV0dXJuIGZhbHNlOwogfQogCmRp
ZmYgLS1naXQgYS9tbS9zbHViLmMgYi9tbS9zbHViLmMKaW5kZXggMmVlNDNmZjY2N2E1Li4wOTBm
YTE0NjI4ZjkgMTAwNjQ0Ci0tLSBhL21tL3NsdWIuYworKysgYi9tbS9zbHViLmMKQEAgLTExOSwy
NSArMTE5LDExIEBACiAgKi8KIAogI2lmZGVmIENPTkZJR19TTFVCX0RFQlVHCi0KICNpZmRlZiBD
T05GSUdfU0xVQl9ERUJVR19PTgogREVGSU5FX1NUQVRJQ19LRVlfVFJVRShzbHViX2RlYnVnX2Vu
YWJsZWQpOwogI2Vsc2UKIERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHNsdWJfZGVidWdfZW5hYmxl
ZCk7CiAjZW5kaWYKLQotc3RhdGljIGlubGluZSBib29sIF9fc2x1Yl9kZWJ1Z19lbmFibGVkKHZv
aWQpCi17Ci0JcmV0dXJuIHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnNsdWJfZGVidWdfZW5hYmxl
ZCk7Ci19Ci0KLSNlbHNlCQkvKiBDT05GSUdfU0xVQl9ERUJVRyAqLwotCi1zdGF0aWMgaW5saW5l
IGJvb2wgX19zbHViX2RlYnVnX2VuYWJsZWQodm9pZCkKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0K
ICNlbmRpZgkJLyogQ09ORklHX1NMVUJfREVCVUcgKi8KIAogc3RhdGljIGlubGluZSBib29sIGtt
ZW1fY2FjaGVfZGVidWcoc3RydWN0IGttZW1fY2FjaGUgKnMpCi0tIAoyLjMyLjAuOTMuZzY3MGI4
MWE4OTAtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
