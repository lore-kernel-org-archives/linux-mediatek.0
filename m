Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792E5C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:18:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F8B61154
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 15:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F8B61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wc6y2r0HDkcD6ALln3FwV3ABpW6+yULmla7jnHhIDZE=; b=Dk/jHUvf4zRUVPnPk/Za9bPmA
	xmKeIgm8kBJfcD2GP66RNlms1L+3sPCZCy4tsMwX9i0kfiUqRWH/eqvQdxlTQyjf4T7BV74DFIEVA
	JRbgJKuEBH8+oLviA/iMEk2L8Zg6f7qSgAQ3Y1FEhe/HsGAeIFdTpZd2Tdu1qpU4r88E18pFq4TFj
	+Vng85l2bvHJxYUIhGniAhKa4F4ytzbKLWB4JM3iKC5T1uC384tTs1s+OcaZaf0Hg7SrpvOAJoGK+
	dA6nAloQtv4rxmlC3ZSMncjRU7xbzajsVhRIxpE+9zAL6zJoU5t/gKr0p8HRWE4M1DNGr85rKtWGh
	xpLziySAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYs9D-00CS5u-Do; Tue, 20 Apr 2021 15:18:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs9B-00CS5a-5S
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 15:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Y1sA+aQaPXL3h/YxiPjTBbVYUS1bVeZ4E2z5caxyFkY=; b=XHbY4a2sMb1h3lzoAiMGqkIYEq
 h/VIEaOb1O4dhgp5bk7JORlN9UFb64Ix567w/ByCl8I9dGkikLOFjlDkPpYS8OEN3/InFRrFQ+8Vy
 Q8HJPVRBFU1OTixdp2cObL3W72KUF+m5fpw2GMsfsltChF6BKMQhScQYyqOLOxi5CSFpXvt2BrLe9
 hfiZqzg11umVGg/F45x7DTJIgXgCcvGSaKErnz5UIXGGJzu4MFYgZuweiB/3yr76tzA91xFHVEH46
 NcgLZ4phu3EVyAMHpEy/YNVSe3lxw2ZIhPteWrYJJ0avlELdHSmIlo1xeVZIoumlVujAPGiN98Nnq
 QREX1IxQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs95-00CEDK-Uv
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 15:18:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id n127so8608236wmb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y1sA+aQaPXL3h/YxiPjTBbVYUS1bVeZ4E2z5caxyFkY=;
 b=SiOBPrzDeT9AymLJHMv9IvbQ7nLqL+nb1TKmYCV7VsfPhLlQOf0Ww3Z7aLhbBJJ2J7
 OYvZhXQ2PcccyOWO889NYZlaih9v/nwWiBt4R8QDJ9WAUu6PFOx6lXbSn2vhmGZG2Rqz
 /WQHdpc3pzD6MdrnGs7eCwtXUKYxT3AmLCM/durulne/9yAQRHQT6v7P1snV//B0aYZl
 yuEmfxLSyWQfFs9S3gZdyRzZbLiSmAyb8hJrEpZsVaWDZ8fzRee3usTVLMSAFMmg143v
 4NnQjh8JjZg47o7chfVQCx3x4f5SYume8hTOPnxwWj1ehak2ZwymmKRyIlHlEwZWgpc1
 H4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1sA+aQaPXL3h/YxiPjTBbVYUS1bVeZ4E2z5caxyFkY=;
 b=uf1nuADDeAZwgoxLq6D3xhNlVozW6qCloqZoMBV7SjB6tQyrVUelYH+A9e3Fv8IDZK
 95O2f4pCxuE3rCRPVP+CppWLx1NwCuQtyrf2VBQHMRYxRAqcDDM183U+LkMZx4NeCzD+
 lhyvk9xVhgcriH24LScSnOfbrihei2ivERCuLP6gfo6776uP37RqW0ESR4rR8VXzOj+D
 4sndnFvoFTOs4nxc+Dpn1A3arDfa6lo4zpcHry5SLJVigmWZmuOqhiOpWPl4k+E+lgLp
 4ebOiCkVK1uYFdqB/jWZUYwKMScRFhxbJeKRiNEylkZksDLW9X/2vpvDdb+U9QSd3WS7
 PXZg==
X-Gm-Message-State: AOAM530BMBP52E5U5g/iq2RQ4bgdkg/bJfWLtzg8SxjgdCOvqwyKFTTv
 sfKRegh1AxS48onb/sU2DF/x5A==
X-Google-Smtp-Source: ABdhPJzFfivd1nUbTvbvbC/OCYxG9scaAcwLUaIOksi07Sgc8P8VNa66lkMFWne4o74qEbgTCSBKyQ==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr5130906wmj.100.1618931914021; 
 Tue, 20 Apr 2021 08:18:34 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a079:f96:da87:2d00?
 ([2a01:e34:ed2f:f020:a079:f96:da87:2d00])
 by smtp.googlemail.com with ESMTPSA id m15sm24797766wrx.32.2021.04.20.08.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:18:33 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH] thermal: mediatek: add sensors-support
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210320080646.49615-1-linux@fw-web.de>
 <f4329b1a-02e0-aad5-55bd-82d30a38fc55@linaro.org>
 <trinity-4a3f024e-c01d-44e4-a884-530135853d33-1618930770250@3c-app-gmx-bs72>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b38c3539-c864-67b3-95e8-9b652cf6fcbf@linaro.org>
Date: Tue, 20 Apr 2021 17:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <trinity-4a3f024e-c01d-44e4-a884-530135853d33-1618930770250@3c-app-gmx-bs72>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_081836_021485_125BB396 
X-CRM114-Status: GOOD (  12.63  )
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

CkhpIEZyYW5rLAoKT24gMjAvMDQvMjAyMSAxNjo1OSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToK
PiBIaSwKPiAKPj4gR2VzZW5kZXQ6IERpZW5zdGFnLCAyMC4gQXByaWwgMjAyMSB1bSAxNDowNyBV
aHIKPj4gVm9uOiAiRGFuaWVsIExlemNhbm8iIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+
IAo+PiBObyAjaWZkZWYgaW4gQyBmaWxlLgo+IC4uLgo+IAo+PiBkZXZtX3RoZXJtYWxfYWRkX2h3
bW9uX3N5c2ZzKCkgPwo+IAo+IGJhc2VkIG9uIHlvdXIgY29tbWVudHMgdGhpcyBzaG91bGQgYmUg
ZW5vdWdoL3JpZ2h0Pwo+IAo+ICNpZiBJU19FTkFCTEVEKENPTkZJR19USEVSTUFMX0hXTU9OKQo+
ICAgICB0emRldi0+dHpwLT5ub19od21vbiA9IGZhbHNlOz4gICAgIHJldCA9IGRldm1fdGhlcm1h
bF9hZGRfaHdtb25fc3lzZnModHpkZXYpOwo+ICAgICBpZiAocmV0KQo+ICAgICAgICAgZGV2X2Vy
cigmcGRldi0+ZGV2LCAiZXJyb3IgaW4gdGhlcm1hbF9hZGRfaHdtb25fc3lzZnMiKTsKPiAjZW5k
aWYKPiAKPiBpZiB5ZXMgaSBzZW5kIG91dCB2MiwgYXQgbGVhc3QgaXQgd29ya3Mgb24gbXkgZGV2
aWNlCgpqdXN0IHRoZSBmb2xsb3dpbmcgbGluZXMgc2hvdWxkIHdvcms6CgoJcmV0ID0gZGV2bV90
aGVybWFsX2FkZF9od21vbl9zeXNmcyh0emRldik7CglpZiAocmV0KQoJCWRldl9lcnIoJnBkZXYt
PmRldiwgImVycm9yIGluIHRoZXJtYWxfYWRkX2h3bW9uX3N5c2ZzIik7CgoKVGhlIG5vX2h3bW9u
IHVzYWdlIGlzIGEgYml0IGZ1enp5IGluIHRoZSB0aGVybWFsIGNvcmUgY29kZS4KCgotLSAKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9w
YWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+
IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
