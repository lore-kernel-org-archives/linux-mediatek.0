Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5337C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQbvDzRrNGGmJC0cFwixRt7YyXto2u7DcheHfHIL6TM=; b=tyropYJYOrRYhcGSkQFEf2VwH8
	snKaogWrTGBTkHjVd1k+St53ay80I3xrQ71ko/V3qGWjpg72wJ5tCR9I94O0lnIolYKPm+GRGg412
	MfOfdUVzlTI1422X2SmH25JdBJWjgiOkyzjU4l7PS2bfKLpOAnL06fMcUxm0SVyFfl0CHygg2JAl1
	p7I6kCkPCAOe7Aza5ZXAAKDwk/jnOXCYfKY3/1x8/50Xp5UFiWisEJzurz2FOuDlXea+5VFE3rI/Y
	acX7iCnFk1NkhXqSIQx7jxCNimJTat/zh12fsGu4c/y0ImfR79g41aCtf0iUrzf6VycMIxO3ADsDV
	1IsugeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2dKE-003giz-0R;
	Fri, 26 May 2023 19:42:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2dKB-003ghs-1y
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 19:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685130126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQbvDzRrNGGmJC0cFwixRt7YyXto2u7DcheHfHIL6TM=;
	b=XpZKRZKo1QZ2/KNBfJZDmy84mXhESkBPWTI2Ybzl2Xr92xoiP6OvDR0dIv6t2KOx1JGHd7
	q7AfwVV+ust9NdMRofuE3o1vP67O7PfvAOz11aYln6l2d2ODo2cmTD2l0aKVsn5oRFw74C
	2IPR87GEUUK7q3HNesUnAw/cfXzvA1g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-Nos51NjMPSeYfK2KHZdtrg-1; Fri, 26 May 2023 15:42:03 -0400
X-MC-Unique: Nos51NjMPSeYfK2KHZdtrg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f60fb7b31fso4585195e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 12:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130122; x=1687722122;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbvDzRrNGGmJC0cFwixRt7YyXto2u7DcheHfHIL6TM=;
        b=h9eY18UFrFoLFBqO7ON0JlWnqyKBmsa6IUfrh/zWf1mykcPB594c847F48+fBVUeL4
         IHfNLBL996s+YB2BlBjNEvltPkepRt6Vh7KDj603fnpuzkPFGP8zYQ/KqL8P01kq9HJH
         hHE0PwspyUgRsUeGCEPIEKfgcD3g6Vy1oybox/rVP/KAWaVuQlhFdKiLtkryk46TP1oQ
         BjSjOBVAGfcN/noLNu7X1jHAWnLdgGb7vlQsgSM/wVBaozYNlvilNvN00dYS+Uz5+jSy
         FWqG+cDv01kw9zmr+iojvVeh6nLE3nfgWpAWgAlQrLSNlO4IgN/FLvdxh6iazYfX6Knu
         ZJLQ==
X-Gm-Message-State: AC+VfDwy06b/EU7eJWWQpDBMPYrXJmKkyqrjLororFtVNql+rqgMt59k
	WSSX46NHegbL566+8ZW79OxN44HBs4lJmFUzZnGZoO1ymcAMqW5aC+ygNhbBHd1a5uB0+2cZMsJ
	duPw23AGltRU56+Iw6oAjObXe7XAYE2fI3/kBkOqR
X-Received: by 2002:a1c:7407:0:b0:3f6:cfc7:8bce with SMTP id p7-20020a1c7407000000b003f6cfc78bcemr2507517wmc.22.1685130122171;
        Fri, 26 May 2023 12:42:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Fy1XekX9Vh+eeukEwm41budqTXKnvaC+Uc6qWThUB3TK1m5Tn41fjaNow0dI/Ly8Sf8pxmw==
X-Received: by 2002:a1c:7407:0:b0:3f6:cfc7:8bce with SMTP id p7-20020a1c7407000000b003f6cfc78bcemr2507506wmc.22.1685130121842;
        Fri, 26 May 2023 12:42:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2e:ae00:f2e3:50e0:73f7:451? (p200300d82f2eae00f2e350e073f70451.dip0.t-ipconnect.de. [2003:d8:2f2e:ae00:f2e3:50e0:73f7:451])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003f4e8530696sm6035997wmj.46.2023.05.26.12.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:42:01 -0700 (PDT)
Message-ID: <f232be95-74aa-8beb-0413-3dcc7e541ba5@redhat.com>
Date: Fri, 26 May 2023 21:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mm/gup_test:fix ioctl fail for compat task
To: Haibo Li <haibo.li@mediatek.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
References: <20230526022125.175728-1-haibo.li@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230526022125.175728-1-haibo.li@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_124207_724287_69DD401B 
X-CRM114-Status: GOOD (  15.02  )
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

On 26.05.23 04:21, Haibo Li wrote:

Nit: "mm/gup_test: fix ioctl fail for compat task"

> When tools/testing/selftests/mm/gup_test.c is compiled as 32bit,
> then run on arm64 kernel,
> it reports "ioctl: Inappropriate ioctl for device".
> 
> Fix it by filling compat_ioctl in gup_test_fops
> 
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> ---
>   mm/gup_test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/mm/gup_test.c b/mm/gup_test.c
> index 8ae7307a1bb6..c0421b786dcd 100644
> --- a/mm/gup_test.c
> +++ b/mm/gup_test.c
> @@ -381,6 +381,7 @@ static int gup_test_release(struct inode *inode, struct file *file)
>   static const struct file_operations gup_test_fops = {
>   	.open = nonseekable_open,
>   	.unlocked_ioctl = gup_test_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
>   	.release = gup_test_release,
>   };
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


