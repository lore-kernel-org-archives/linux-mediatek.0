Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F5C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 21:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FCFA20734
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 21:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwTbgAVS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLUBXAls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FCFA20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXuUZ30aK4hSl+mQP1LjykGsNUEzJBQpYYJuuYxnGKA=; b=VwTbgAVS2TdjeD
	DJVjhHkmk+urXFpSWQjMpk2FUexsunyraAJXmDTiempQm3dAtLgmoQb693tXPR5+ZEClUp0mni2HQ
	UsItwYJ8tOhC50U6NzLv9n/yOeUA2SDE6czYoyNNURQE8l3noPXyXlzcLARrdzpl4cKl3xwOD3v4j
	bNQT6HbqMgPga4pN9XKexIwDRO0R+vZg8EczkxqujH5SvKPcNtrsLy75CDp7hBnthtxf/4tYqunN0
	RkGRniETSjzdAknlJNBkbLtvs4yi1QBr14z2/thtHDhGu/yIeXEH/Mh1Qq4fcjHeZ/T6oxYKRV8DJ
	YjmQpj+KkOg3GgLQ9xCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfsEY-0006rD-Sw; Mon, 01 Jun 2020 21:44:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfsEV-0006pf-KY
 for linux-mediatek@lists.infradead.org; Mon, 01 Jun 2020 21:44:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id q11so1327150wrp.3
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 14:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqOi9XVkzEqBE1rgTfwzfPJ8XwX72091Extww43XdB0=;
 b=BLUBXAlsbcW7Id0UV+YkyUmxE0jzUe0/jTCXnNN4S8dLK5/1aj1C/RlHrWFxV1AwyH
 6GbdjWZyiEzX2SGei8S9rFvzqJyLKzA9Iy1wx2DpNKBEIC7EvyM/NTa3QPflZz7Q+ctF
 ymXXXQNdt5EUCszEr9mNqRiaL85A+fJwEzmckf2Kn1c5Kj4vkhgcAvTDk3fbqqPaWI6M
 cirigyYvKk2PguC2yqvcAtCchyS4BOP//JBSjBzcOvPA9eIXC1GzF9l4PAcWwI/C7xU5
 L3laXdnfYY+55kcVzKEzfzrpIagABRawHXTr1HqGHv8f0SlrtfRQGIBxyD8Oa8lGahS5
 e7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqOi9XVkzEqBE1rgTfwzfPJ8XwX72091Extww43XdB0=;
 b=FyJfG8x+jLqpAj05PVr3OGb5bb+jwYYdnUDEtOT84CnVDOe0T1ec/OfTRECmNuP/es
 GtXNYvoDc/uzoQZP5+vjRWo19BgQHshHTnkb93nvikeXbQEWkVkQtDgMf9uUihfZSlbN
 NdCZhk6WSl5DCd658bpcK8o/O/ehcK1RNOx4wDsfqKOnl2NfN1CvlcTPXFA9spWSCwwq
 HfbgPWv2aaZR9SC26eT7Ju9mWV0O93eCYiInKBKgBMa1W3L+YrKh4WjvQhFzF0XaFL9W
 yLMOv224Ly4V4lDf8+P0tzNt68VjXTzItRymILwi1UukW46xTqIe9D9ZZPB8WjcPOmS/
 MH1g==
X-Gm-Message-State: AOAM533qGg394BXqouL0hC6pLVG7Om4+T0ei43O1PkINhk2hh/2tJ2yC
 cpK0niZoFX0hWYV9bXDe6/IFiA==
X-Google-Smtp-Source: ABdhPJxAkSTXgDmNloFKRd9lVGwwLE5uAp68LgGpm5gXOB9wVVSaY/AqsZoSHbg0AzWXmkv4CYHlkA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr23274786wrq.259.1591047871147; 
 Mon, 01 Jun 2020 14:44:31 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e125:f600:eb3c:705b?
 ([2a01:e34:ed2f:f020:e125:f600:eb3c:705b])
 by smtp.googlemail.com with ESMTPSA id q4sm781499wma.47.2020.06.01.14.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 14:44:30 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
Date: Mon, 1 Jun 2020 23:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-5-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_144435_744934_9A8864C8 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjcvMDUvMjAyMCAxMTo1OCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9y
IG90aGVyIGRldmljZXMgdGhhbiBDUFVzLiBUaGUgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4gZG9l
cyBub3QgcmVxdWlyZSBhIHZhbGlkIGNwdW1hc2sgcG9pbnRlciBhbmQgaXMgcmVhZHkgdG8gaGFu
ZGxlIG5ldwo+IGRldmljZXMuIFNvbWUgb2YgdGhlIGludGVybmFsIHN0cnVjdHVyZXMgaGFzIGJl
ZW4gcmVvcmdhbml6ZWQgaW4gb3JkZXIgdG8KPiBrZWVwIGNvbnNpc3RlbnQgdmlldyAobGlrZSBy
ZW1vdmluZyBwZXJfY3B1IHBkIHBvaW50ZXJzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3og
THViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0KClsgLi4uIF0KCj4gIH0KPiAgRVhQT1JU
X1NZTUJPTF9HUEwoZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4pOwo+ICsKPiArLyoqCj4gKyAqIGVt
X2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKCkgLSBVbnJlZ2lzdGVyIEVuZXJneSBNb2RlbCAo
RU0pIGZvciBhIGRldmljZQo+ICsgKiBAZGV2CQk6IERldmljZSBmb3Igd2hpY2ggdGhlIEVNIGlz
IHJlZ2lzdGVyZWQKPiArICoKPiArICogVHJ5IHRvIHVucmVnaXN0ZXIgdGhlIEVNIGZvciB0aGUg
c3BlY2lmaWVkIGRldmljZSAoYnV0IG5vdCBhIENQVSkuCj4gKyAqLwo+ICt2b2lkIGVtX2Rldl91
bnJlZ2lzdGVyX3BlcmZfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJaWYgKElT
X0VSUl9PUl9OVUxMKGRldikgfHwgIWRldi0+ZW1fcGQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCWlm
IChfaXNfY3B1X2RldmljZShkZXYpKQo+ICsJCXJldHVybjsKPiArCj4gKwltdXRleF9sb2NrKCZl
bV9wZF9tdXRleCk7CgpJcyB0aGUgbXV0ZXggcmVhbGx5IG5lZWRlZD8KCklmIHRoaXMgZnVuY3Rp
b24gaXMgY2FsbGVkIHRoYXQgbWVhbnMgdGhlcmUgaXMgbm8gbW9yZSB1c2VyIG9mIHRoZQplbV9w
ZCwgbm8/Cgo+ICsJZW1fZGVidWdfcmVtb3ZlX3BkKGRldik7Cj4gKwo+ICsJa2ZyZWUoZGV2LT5l
bV9wZC0+dGFibGUpOwo+ICsJa2ZyZWUoZGV2LT5lbV9wZCk7Cj4gKwlkZXYtPmVtX3BkID0gTlVM
TDsKPiArCW11dGV4X3VubG9jaygmZW1fcGRfbXV0ZXgpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xf
R1BMKGVtX2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKTsKPiAKCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
