Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F0FC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 15:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DCA021741
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 15:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLOyBmj7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNJALoFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DCA021741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYh7AMRqavSCkdZGNU+GJjD1mDx7T5H3VN6VEytdsjM=; b=eLOyBmj7xceYj8
	LgDxuXQJCmeEBSgz+g0EzYvaFBMyrlsyRRG8aYO/PjlN5Gw24UP57m6F1CIgRYVzGVDpuM6nFAVm2
	qgw2C+IhNyFY3+VNTytyly43FUbzw4J2lq4S0onQBRXHjZecjpR5yhNY4F7SjU/I6sagDo/8cisy6
	2Cci7SV/ZW6gQ4y4lS8Qz/hso/C3NS+KlwbCQnW45r1OPA2eJ60IyFFmkqu3IHnFyONv5cbHeW7Ul
	KVfLQC/WGLw5Pi41vS+CEUei90FLfybmfpmI/dB08hskXTKQI7m0Ghp5wrbM711bVdzHNFbB1kxqT
	HNM07+f/8tZ/c/qDwN2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9VjP-0002H1-M8; Wed, 04 Mar 2020 15:14:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9VjH-00028p-3r
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 15:14:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id a5so2520746wmb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2020 07:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ntkN2Bt2eytzYo8LHWkETJyp51uX20eFB3He3wFrMNw=;
 b=ZNJALoFg7NbZIlCreszRaLeqZiUnLe5Flj9+uAcQPt3PU/qA2sI14FPluBDqsdXgI/
 1fCS41eNErjZSFzRZxMeJhMget6pFDN5fOEU5+wD+RfNcrP2bq430ItHZZiyifyZQgW3
 twe3emHg0w9L/OTmr73xd+dGeQTRQaOL6mgy5YZ44MHF5lmqa0qimopn4zrnYGSfjtiF
 Kt0H38kUXf0eNP0snIMzOSgkWWvUuN2AlPcKssLWAU+OeL9TfEr6zQU8fVQNV8lLdhuC
 g1+/G1KOcW7kuW7/qYTbHWrEqg03ocpLCwmC0M+VVslR/xkjNiv41SZ3qUEhqDtWATD1
 +BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ntkN2Bt2eytzYo8LHWkETJyp51uX20eFB3He3wFrMNw=;
 b=oHJ9aRIorO8F01pnqWvzD4gMHHGk9/QYhMFyJSlWMDkXAVwWUzzGldG0TMMvXeY0rK
 wK+Ia/oKOlkQ7Skbrivk3wWATXDRS8cTyhMUqEKQkxSAsjO3jxCT3lUEGFDw0eSaWD72
 Tv7pjf2rSsWB8EkhlflCKOmL0VPc9HjCJrSysPAY+LCKfAuQfsE8qFxjFaT7COIP19b6
 JSk7Yxi4VNSKUZNvTGnC8WQee/Ol1Ah0rFiS2tkpr0pcpINkZF5AevCg8cFEmtHb2Xmv
 0UANiztqoHOlLw7CX5+N6UwbtziGCwRXJ3s3rDCHEJlwouMmiwIT7AX63z0rRGwOTNxO
 8aVA==
X-Gm-Message-State: ANhLgQ2bOHuz2uriSNR7+JYumRDLwopd9UoLntNiGcfCgV3XQu1+m2Qr
 nhFcK/SHfH+fXQJuJ3kAQthPyg==
X-Google-Smtp-Source: ADFU+vsy9i8tQNn4aoMQESfufuXZTbONKfMbOIzTmzcSncwnWJ+oYo6P0UZaWtHBIQA1UKlaxZJ3tA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr4024812wmb.81.1583334872783;
 Wed, 04 Mar 2020 07:14:32 -0800 (PST)
Received: from dell ([2.31.163.122])
 by smtp.gmail.com with ESMTPSA id c11sm39066333wrp.51.2020.03.04.07.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 07:14:32 -0800 (PST)
Date: Wed, 4 Mar 2020 15:15:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: 
Message-ID: <20200304151512.GD3332@dell>
References: <1583249249-17380-1-git-send-email-gene.chen.richtek@gmail.com>
 <6b920875-8764-73a4-a763-788ce485b0cb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b920875-8764-73a4-a763-788ce485b0cb@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_071435_258414_6544ABF0 
X-CRM114-Status: GOOD (  10.14  )
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
 linux-mediatek@lists.infradead.org, Gene Chen <gene.chen.richtek@gmail.com>,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwNCBNYXIgMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gUGxlYXNlIHJl
c2VuZCB3aXRoIGFwcHJvcGlhdGUgY29tbWl0IG1lc3NhZ2UuCgpQbGVhc2UgcmVmcmFpbiBmcm9t
IHRvcC1wb3N0aW5nIGFuZCBkb24ndCBmb3JnZXQgdG8gc25pcC4KCj4gT24gMDMvMDMvMjAyMCAx
NjoyNywgR2VuZSBDaGVuIHdyb3RlOgo+ID4gQWRkIG1mZCBkcml2ZXIgZm9yIG10NjM2MCBwbWlj
IGNoaXAgaW5jbHVkZQoKTG9va3MgbGlrZSB5b3VyIGZvcm1hdHRpbmcgaXMgb2ZmLgoKSG93IHdh
cyB0aGlzIHBhdGNoIHNlbnQ/CgpCZXN0IHByYWN0aWNlIGlzIHRvIHVzZSBgZ2l0IHNlbmQtZW1h
aWxgLgoKPiA+IEJhdHRlcnkgQ2hhcmdlci9VU0JfUEQvRmxhc2ggTEVEL1JHQiBMRUQvTERPL0J1
Y2sKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5j
b20KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgIHwgIDEyICsrCj4gPiAg
ZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvbWZkL210NjM2
MC1jb3JlLmMgIHwgNDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oIHwgMjQwICsrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDY3OCBpbnNlcnRpb25zKCspCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
