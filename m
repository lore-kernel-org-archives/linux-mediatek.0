Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B249C43469
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:37:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC02923998
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BStfmsBk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBQJfW+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC02923998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N237vkroZXLtDOz3N/AzrFOZg75f5h7cMumheRBkAuM=; b=BStfmsBkVRHvGpoXTLqqmGNgp
	oS0XmTdVHxnFVT+S00KbN8sH0ggzSE2Tpwm45GNla5SKgE9Bh0FRGMjVvRKHXE+M2KWR29Nj7EeYz
	lrLs9ZsWFtG3dwmf9TI5NljhBTejX578D36J4hgeQOi0nrWOmHv508d9+RJvieYAKDLlBVKcQMq0b
	DyddpJuP5sO8xzJ1wnu36+7KPKr4f1Okfy2yIsiJArvId+A3VhNmhPPnmh2Dwa2fU9woiuXDz9bfT
	ByYDCWQzWi+k4sQjvKc2IDZk+9xB0r+XHRNNCJ+ylaH3MKeXDPrdNF/iLcldMIeEphrL+pVt7ouS5
	+1CfP3scw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOoi-0001eL-RH; Mon, 21 Sep 2020 16:37:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOob-0001bZ-2g; Mon, 21 Sep 2020 16:37:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id c18so13495471wrm.9;
 Mon, 21 Sep 2020 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UZX0lVSW/BkEY5EryFzi+/GuKlznQU9YGzQJgrOT6C4=;
 b=iBQJfW+PbQ6dwx/Cp+3UtA7/VPz72PX7opUnQ6BephjRS45wwN6DC4an23bNi+ZkLp
 KY8NYSomNL0yvk5PYd+YcVM7qPjf1OQ6F4sN8xMMopxX7WzgQaWRIPA7U6CnnxWuinYF
 PuXLhzUkRHSAXdoCZMswlHSFHTS9CnTNYFcOtfvDCGLnGoVL99ZstlVaAX9TJwGjwuPb
 LC4hyQf2iuSV7MpYla1zP2MM9RTgkJbmD+maHoMBcj9Gvv6XUxiz+5T0eBT0ShHHO7Oq
 Kvlo1RBZFyMNune7QwzqMAZ5n1E8n3ghIY3wcBR1on7ovqDkZ14X8JMBwh0TfejPapaJ
 pBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UZX0lVSW/BkEY5EryFzi+/GuKlznQU9YGzQJgrOT6C4=;
 b=KarbVLAJ42fWC6xiXwVHjnIh86g9HgAqrKdeYpb4mLnxc47HwywZTarkzr4nimgPKs
 jnD1X7PR3IObGQjbjK1XdI/428yw9Ql08PkZ0DJ22aJuCr/N6WJHt3UeTy/FrUfESian
 oc+gxJTo42LEl2RyFzPqFrYPHK4b9bWuBfoULcehJhg7C33UBR4IaLJFMFpLiBkHM9s0
 NCxSProYgEYfXf8yTJFX0WKN/p1Vrbwkbe2xSyltWvjRO7DBnQKZKcrew2RydrLa4TeX
 +4U9GznwLLjdvT0oOOq1sfNrKbb6g4HMdp7eaKuSY+glwcCYC+dZFgOqEi/beDdqXDRM
 NGbQ==
X-Gm-Message-State: AOAM530JB1v12AZQqiTw/LyBTzgNa+GE9af8nCF0+lAMKvsTBKbaJrOe
 d2ipcw89ZcGMMXYMbJFIR0RPeKA3Ek/7Tg==
X-Google-Smtp-Source: ABdhPJyp/emP4vnjJL52ic60TOBn1bsoBW6KlikgArO8roRt4MwSrsouq5KTXeDvMPwYcqBCSFtfQw==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr606109wrg.131.1600706239370;
 Mon, 21 Sep 2020 09:37:19 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id c16sm22948533wrx.31.2020.09.21.09.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:37:18 -0700 (PDT)
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a2636ee7-f326-e709-2a50-03253bc0b6c2@gmail.com>
Date: Mon, 21 Sep 2020 18:37:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_123721_122947_03BED3C2 
X-CRM114-Status: GOOD (  18.64  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream <wsd_upstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAwOC8wNy8yMDIwIDAxOjAxLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBEZW5uaXM6
Cj4gCj4gRGVubmlzIFlDIEhzaWVoIDxkZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDfmnIg35pelIOmAseS6jCDkuIvljYgxMTo0N+Wvq+mBk++8mgo+Pgo+PiBObyBuZWVk
IHRvIGNsZWFyIGV2ZW50IGFnYWluIHNpbmNlIGV2ZW50IGFsd2F5cyBjbGVhciBiZWZvcmUgd2Fp
dC4KPj4gVGhpcyBmaXggZGVwZW5kIG9uIHBhdGNoOgo+PiAgICAic29jOiBtZWRpYXRlazogY21k
cTogYWRkIGNsZWFyIG9wdGlvbiBpbiBjbWRxX3BrdF93ZmUgYXBpIgo+IAo+IEFja2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiAKClB1c2hlZCBub3cgdG8g
djUuOS1uZXh0L3NvYwoKVGhhbmtzIQoKPj4KPj4gRml4ZXM6IDJmOTY1YmU3ZjkwMDggKCJkcm0v
bWVkaWF0ZWs6IGFwcGx5IENNRFEgY29udHJvbCBmbG93IikKPj4gU2lnbmVkLW9mZi1ieTogRGVu
bmlzIFlDIEhzaWVoIDxkZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAgICAyICstCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPj4gaW5kZXggYzg0ZTdhMTRkNGE4Li5iYTZj
Zjk1NmIyMzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMK
Pj4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfaHdfY29uZmln
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+PiAgICAgICAgICAgICAgICAgIG1ib3hf
Zmx1c2gobXRrX2NydGMtPmNtZHFfY2xpZW50LT5jaGFuLCAyMDAwKTsKPj4gICAgICAgICAgICAg
ICAgICBjbWRxX2hhbmRsZSA9IGNtZHFfcGt0X2NyZWF0ZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQs
IFBBR0VfU0laRSk7Cj4+ICAgICAgICAgICAgICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQoY21k
cV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPj4gLSAgICAgICAgICAgICAgIGNtZHFf
cGt0X3dmZShjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIHRydWUpOwo+PiArICAg
ICAgICAgICAgICAgY21kcV9wa3Rfd2ZlKGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVu
dCwgZmFsc2UpOwo+PiAgICAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0Yywg
Y21kcV9oYW5kbGUpOwo+PiAgICAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFf
aGFuZGxlKTsKPj4gICAgICAgICAgICAgICAgICBjbWRxX3BrdF9mbHVzaF9hc3luYyhjbWRxX2hh
bmRsZSwgZGRwX2NtZHFfY2IsIGNtZHFfaGFuZGxlKTsKPj4gLS0KPj4gMS43LjkuNQo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKPj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
