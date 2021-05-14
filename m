Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3BEC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:59:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE91613B5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE91613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bM3g/KODcKp68Jbl5qRDyKrcDpi5NSTluVD3T6soN+o=; b=TxwD7MxaLpiW3y/leiFyxja/0
	DPV+2WprEEIZHVC8yHLwYVhrtZurYCvFSeZsrrYa3Q0aLShV0mVffwgTIzDlanVa6P+fKoi6Lx9Dl
	1BugiRekstN7z9SQrmY5kr6vF5PMoT36vJhcZydsJ5gtHDIJUJlY/6sBr/mqiSG4K/N/VWg52Hq20
	aXqPDnEU002crCYXgEpiTg0Vb6GisHQyV3jMvd4KEtNMbpwTkkTckQcBpiA375rNTeSeBBKGA4ie4
	ZUSpwewFCsplw7JSr/d8tN8DQBRei040PfbWQ7K01UvHLhTlQfK9W0J1kYDzIl0jtkJP45U/U+nIj
	iQ1fzTzEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhXPp-0085md-CV; Fri, 14 May 2021 12:59:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXPm-0085m8-Ip; Fri, 14 May 2021 12:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rju+o9Aajm1ncJmVfe9LBvPra3PbTVnQ4yeZB3yC1zA=; b=RTSbwHwwNteLxNIlc41pGAlhlQ
 5pLikGYXwDiaaXnTA0dYvApBmgOtrEuVU08VZR46PwJitntGW+dnPssF463iTikKqWbXfNY5O6YWM
 MRbmvQp/+f+ZDAGrcU3NyMLROpz6MPwSTzbT40GL38yT2uGt9lFaeJGY7QZQSLiOiBog+63b2iE+y
 VH5iBGGpDD55osw0x/dX2j0QGa8MFv931ofaSRqOcRGEnM9JkWlM82plftNM46SCB8xaG/8O3tdi0
 VJRejNj60VN7qbQfrgwWOwy4OcWpQ/4jDjiEbufJIm9Zr2vMPsf/EFUx8ZRWOPtRo9rdDOdl+b4jy
 /ZABGcdg==;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXPk-00BzSk-5S; Fri, 14 May 2021 12:59:37 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so1419126wmb.3; 
 Fri, 14 May 2021 05:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rju+o9Aajm1ncJmVfe9LBvPra3PbTVnQ4yeZB3yC1zA=;
 b=uCfEClAb5Ilw3+cEGXuRhF0bKLAoBbXCfMvPD7poEBMcGY/Y7o9eLkxi5KvCJluSAj
 dTkWvxNyX0scUBJ0jCoUu7r+0PDtCrX/Jrsj4PrroILXx0WM7Nu+zZnfx1a3jvVyeLWb
 wFHTWfpoofhxzMAbGWe0cbdvPYjHemj+zUVrnOyE/Dkn1hmwfn/xxhY2tX0EEjazY/i6
 EigHE8EeX1/LX52Dx6gZ5nZaxIx3mkvbtLRvwr3Rue0hI7lewwLwf8/dHQNKTctgDhHM
 YXLKslxM38XMRYZHVJNWq/ZDb2XwS7bBmf++0lJmSb8okSPV8PrK0Wth7TTS9Y569wB2
 3VrQ==
X-Gm-Message-State: AOAM531AWgJQpKNbUld1DTPeO6I8AjfenHgarh9OC9ON0AId7Oot7wFA
 0/r5CJgC0cCo/aDpAMz1UgQ=
X-Google-Smtp-Source: ABdhPJzQ9SpSJ+e+wCnztJ9hXrrcphBLuAxQKG15b7jG3dXPidwCpCRShgDRjfv4MqOYIjl3MX4U/Q==
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr50450896wmp.165.1620997172732; 
 Fri, 14 May 2021 05:59:32 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id o129sm11877532wmo.22.2021.05.14.05.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:59:32 -0700 (PDT)
Date: Fri, 14 May 2021 14:59:31 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Zou Wei <zou_wei@huawei.com>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com,
 matthias.bgg@gmail.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
Message-ID: <20210514125931.GC9537@rocinante.localdomain>
References: <1620717091-108691-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620717091-108691-1-git-send-email-zou_wei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_055936_225484_CDDAF615 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

SGkgWm91LAoKPiBUaGlzIHBhdGNoIGFkZHMgbWlzc2luZyBNT0RVTEVfREVWSUNFX1RBQkxFIGRl
ZmluaXRpb24gd2hpY2ggZ2VuZXJhdGVzCj4gY29ycmVjdCBtb2RhbGlhcyBmb3IgYXV0b21hdGlj
IGxvYWRpbmcgb2YgdGhpcyBkcml2ZXIgd2hlbiBpdCBpcyBidWlsdAo+IGFzIGFuIGV4dGVybmFs
IG1vZHVsZS4KWy4uLl0KClRoYW5rIHlvdSEKClJldmlld2VkLWJ5OiBLcnp5c3p0b2YgV2lsY3p5
xYRza2kgPGt3QGxpbnV4LmNvbT4KCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
