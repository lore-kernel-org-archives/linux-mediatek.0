Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CA6C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DB8207FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmarSf9f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWQc1utn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96DB8207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgDbvB9i5iO//T+rEAQP/5qsKRR8OukHr0jJCaSiA6g=; b=LmarSf9fhOzA9S
	xzDZqgozpaT72gs2vSU+59znG4bo5BuUg/GEEXY96uLCqAikCXZXJJ8tVF2V3+XgIniPuH9iJPFor
	v19DC5MpJLMajyliv2rw+hRriBeJSMWgbbFNQSZmtVeriTtLvkIvZurs1zErUXEutG8GoHsI6hbdk
	ou6Z3MWBWMM/OnPyR2rl+WbhQUwa4vTQ/CjvkPnMKOJA1fOnGYnwP1ZuBNX/x9vQ6E2o3Q2k034k8
	XyuykrMPyf0cOMcxG72AUSMU4Z3PwfR5YQL/HxuhQ5HN+tKDSfvQjDw6VT/1B13ZyBt+SkP639tdQ
	x30TuZWNXPEjNoT7frdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc2Fo-0005er-Ub; Fri, 22 May 2020 07:38:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc2Fc-0005Ul-28
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 07:37:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id l18so9164636wrn.6
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OoldvHVpRxJWz04Wv0lGmaRnV3/coogwvzF6ciZCusk=;
 b=QWQc1utngkxkmgE3Q2u4PTwJqopYWiCbwEsGAWquR85cj0X8RjK1xI8yGXqbI7jcyZ
 A7I2kbn65YVRKjJSF/AFeyA4vxnoWX09E1TmCoJFPJnDI1loZx5j4NMh70Df8bXEz0ue
 vTJx15lf1ZYaGAvc4aMYciz4SovxxdQAWHTuEm2oHIXADiPVf3cSpVfQGhuoA5CDtx/S
 OgsJgjynh6wi3beJ5Oa85dFoie+UnAIF5cMSTj2A3m8d5UTVPLX/Od6NZ47RLKMKD49l
 be+/5eFuDjHwPfJ4doYfPk/M5s6VjxS1iBiYXGnfc85uZIUTLhi+4N/SNM+uWfGAe8rj
 geyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OoldvHVpRxJWz04Wv0lGmaRnV3/coogwvzF6ciZCusk=;
 b=fmxYkFoIFW8b2dCywgIqyPiaN4WjJalQwPS58IUsFosrmXNDwhPC7eUlpQA+nJLwkg
 dOR8H5gTV+RatoMtMrzSZrw7NMp7H9lJv4fZab1xLUkRbsl6NzqA7KN2Tc1eNRKgtrqe
 WSdxooVlyOKwJP0g8xNlRx2PuCwGEJLMpHN1ZGVum4+jc37gmeKyWHvIQ3w+uO1Iwsq9
 msZDC4QPzZ8xnHZCpRLdUEBvTaZtDMXVPMGdHa0+yzOCyUowZv8lAxUdZlUN0mIFgZyy
 rh5NNH/J4f2K8Ou4cO/s9jsnBWzzkYxo92dbenS6wTU6ZL4W41dFHMCjTlKoyTg881VL
 faMg==
X-Gm-Message-State: AOAM532ztR+4hjFIDhnwqcUfV0YwVdpjKaMEDf6vRsmq6KGGVycta/rf
 E8TGgUNbhat7OxvOpka3DE92pg==
X-Google-Smtp-Source: ABdhPJy+uDhQ+H8wIBCHXhrT0yMPXls7Yet6TUSGGzWvvHeOOpFgwvBPP6gqkrxYEzHQ+kF+ppxoFA==
X-Received: by 2002:adf:e441:: with SMTP id t1mr2452196wrm.347.1590133070748; 
 Fri, 22 May 2020 00:37:50 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id y8sm82930wmc.37.2020.05.22.00.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:37:50 -0700 (PDT)
Date: Fri, 22 May 2020 08:37:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Message-ID: <20200522073748.GQ271301@dell>
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110145952.9720-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_003752_144275_222E4957 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMCBKYW4gMjAyMCwgbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgd3JvdGU6Cgo+IEZy
b206IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gCj4gVGhlIE1U
NjM5NyBtZmQgaW5jbHVkZXMgYSBwaW4gY29udHJvbGxlci4gQWRkIGJpbmRpbmcKPiBhIGRlc2Ny
aXB0aW9uIGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0
aGlhcy5iZ2dAZ21haWwuY29tPgo+IAo+IC0tLQo+IAo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL210NjM5Ny50eHQgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
