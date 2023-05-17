Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCFBC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqvbTDaQlB5Q2U1EnVBHO24QPkqAoM+X9DFpf2XubEo=; b=BaDJUp5Y2zyBixlwAAfPYWSIx8
	mES8DqC8TaKvKPV9YuxnFxRpwaLrDK5f6tZNWBI1DxnCmlelDSAYEsH160ecR5T+udqFwFbPKI84A
	iTshXc5XEFJuUwXMQHwQZuSwOgTVC2Np+o7q5G6BUFiMZFarFQKMcA6fV0qTdTQ+sxTfsDD18Xh6s
	Gk101mxEwUOb1TxVmfS4zCMSAeSSHKt0wD4OZZrxCYaS9zeh3Se78Gc/O80Lo729ClkpOmHhzdgjZ
	yZhOduLTM71H+KrJxXvUPuxQL2wXC45mnk4A9E9Qa2o+7pL/A5pp+6X+UMA8GuOO4kBLCI8TqkD1+
	+yeWjX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLoM-00AjA3-0u;
	Wed, 17 May 2023 18:23:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLoJ-00Aj8v-2o
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 18:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684347818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqvbTDaQlB5Q2U1EnVBHO24QPkqAoM+X9DFpf2XubEo=;
	b=YqBQpP86UzQLZBT1KyIk8VzNcjKRVjKffUYg6r4mNFts6Y2lX+i2gDHll/KUsDExUWQP61
	IBj33yqt3dCRg9x7N6P0kZ+e1FAZh/Rol6yoH+adlzzz4BnaQQ3ZrRBSj20I1er19NMHB5
	snyK4T/8W8H9LPH2ztv9r50ZmB7uFCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-fXEXKLazN36aLP9eHfbL2g-1; Wed, 17 May 2023 14:23:36 -0400
X-MC-Unique: fXEXKLazN36aLP9eHfbL2g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f4fa463282so7955535e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 11:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684347816; x=1686939816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqvbTDaQlB5Q2U1EnVBHO24QPkqAoM+X9DFpf2XubEo=;
        b=amdEQO2PIhQPhC/lqb2rYmJSMjyLWl7hQRt//wWBJI7hAd4uTewviT6afj4waOuy5E
         YsoDfbvw5niuBIy0rXBDESxYdbn07Suhvycj0CfXdTi6GtluP8f7C7ze9CGRV1yEnvtM
         0vv+jjwRCGc4A8KswI1x3Bp4aILqJ5UlDws1kYmNl0qPQyLDX1JjJwYsQSOo5rc5dCwd
         noPlEtGdu4mKrXrCR22CVt2rbZM6UuQV12KruWQZ7dgIiq91ANP3ydILDUlC1W0WkDnY
         sPJdGsB3Eox+Rpe+sezizh3TCbibD9EhSB7Ae032qneIILW5CidAbEJctCuq8Z783Lop
         ltvg==
X-Gm-Message-State: AC+VfDxFBtVuw2rlMG+MejthZPA6sRABOC+PEZsDm6gmGUKVQdaLNfd/
	7U4XnUQ5cQHsPTN3o2lHTNFUGUPMQMlvSpxrcEIG/fxVCYQK60NuE/A/3GZSi9wK1ar4sW10WpA
	8ozOpsfqNrxFv6+H9Lc2G2m2yz8gvq+00
X-Received: by 2002:a7b:c047:0:b0:3f5:f04:4607 with SMTP id u7-20020a7bc047000000b003f50f044607mr7312217wmc.22.1684347815733;
        Wed, 17 May 2023 11:23:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aghbMPeDps3xUcJWgRTN4G72ejk+Q9UkoksMRs7xKUZqCHs8zsQJ6GCxmBST8kSnxNSrUtw==
X-Received: by 2002:a7b:c047:0:b0:3f5:f04:4607 with SMTP id u7-20020a7bc047000000b003f50f044607mr7312200wmc.22.1684347815381;
        Wed, 17 May 2023 11:23:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3900:757e:83f8:a99d:41ae? (p200300cbc7073900757e83f8a99d41ae.dip0.t-ipconnect.de. [2003:cb:c707:3900:757e:83f8:a99d:41ae])
        by smtp.gmail.com with ESMTPSA id q17-20020adfea11000000b0030639a86f9dsm3578463wrm.51.2023.05.17.11.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 11:23:34 -0700 (PDT)
Message-ID: <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com>
Date: Wed, 17 May 2023 20:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
To: Sumit Garg <sumit.garg@linaro.org>, Christoph Hellwig
 <hch@infradead.org>, Xiaoming Ding <xiaoming.ding@mediatek.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fei.xu@mediatek.com, srv_heupstream@mediatek.com, linux-mm@kvack.org
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
 <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_112339_984476_2E3059CB 
X-CRM114-Status: GOOD (  12.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.05.23 12:19, Sumit Garg wrote:
> On Wed, 17 May 2023 at 15:06, Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, May 17, 2023 at 02:56:13PM +0530, Sumit Garg wrote:
>>> Do you mean a pinned user-space page can be paged out automatically?
>>
>> No, pinned pages can't be paged out.
>>
>> But a short term pin implies it will be release after a short delay,
>> and it is feasible for wait for the pin to go away.
> 
> Okay, I see. I would be interested to know the ranges for that short
> delay. I guess it may depend on how much memory pressure there is...
> 

In general: if user space controls it -> possibly forever -> long-term. 
Even if in most cases it's a short delay: there is no trusting on user 
space.

For example, iouring fixed buffers keep pages pinned until user space 
decides to unregistered the buffers -> long-term.

Short-term is, for example, something like O_DIRECT where we pin -> DMA 
-> unpin in essentially one operation.

-- 
Thanks,

David / dhildenb


