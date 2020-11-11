Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B26C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F00520825
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0xASS0jk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F00520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dX1snfNzS8ZxX7glhkrg3NU9ezFSGtvUZpqldvc1IBY=; b=0xASS0jkloDi1u3D5fZb5uRl4
	wdWFwUSymxB/7CgA0v+E4e4kGtd3WpGdaQnSYUO5heAV74hB4ZnF222N4jEe2DJoFz3SMzMWSDwMl
	lzoibt9ZB7Tz5VhV/4Oye3XhVDERA/EsBZgoDg7IERo8KP5M+aEaAjpq/UKo2XhsGFfpfxSUYjfN5
	oiXIVFoA/IHBiw0TykJ8vOCGfsWHeyzTOUvEWTaTdgYwyzMKLofJ2My3OWzodkQUsyXZce7DatYbd
	QSbCZjg4z9yUXi0DtE1yxrSJA0LGdV87F1ahf7SSDWyihjioOnI0/X5ley3HMYnUVpmgHatr49jEy
	isbuVDMjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxkn-0001yy-8y; Wed, 11 Nov 2020 21:34:09 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxkf-0001wr-DY; Wed, 11 Nov 2020 21:34:02 +0000
Received: by mail-ed1-f67.google.com with SMTP id a15so3904340edy.1;
 Wed, 11 Nov 2020 13:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vk3KrPrkDYUVNZL3DTlHOE1fBCf+cXVmLxTYq4r55Ss=;
 b=RKf79SLPfbS9ErM3FXH9qYJ8Hg6CzjFK1XoJQ43XwTgLvosbbrDAs7CEjUKAuVqW51
 PgywAw7IrwoJi8EwHn9OqWbbedPoIggUPX+1zoY3J+cdTf9GppwCB7NQPERYEmC1QDCG
 32dM8yAgLY1JVGTx+1wqBkMNNoAD+kypuVq2eGyEIeLzS0ZR5Lfd6GHgKRvY9Pd5gghw
 xzkBulJgkGb4YPfziitL9G4CVlh4aKw909GuPFgodR4jSyxJYRMFXEF8aOQmSNSukY9v
 Ar1IWY6eyeYe7dCMu+0nPLMNgWuwtf8e3a5EgTkhNSyXKURexHxUGqxccG9nqWbxDobw
 +Mdw==
X-Gm-Message-State: AOAM5330Tl+VkcGGtySUpURBK5wj4ueN4S4ehex/lupb+eHbsbfU/k3n
 CkobMKu4Ef/CvalGYUx6UXc=
X-Google-Smtp-Source: ABdhPJzQP5o5OyQRS7gplBPAqdIpxUsSbwg2yAx1u1p6taNhLhBL8e677pIbq0t1wfjyEtnXAmYO4Q==
X-Received: by 2002:aa7:de95:: with SMTP id j21mr1711074edv.199.1605130440472; 
 Wed, 11 Nov 2020 13:34:00 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x1sm1437502edl.82.2020.11.11.13.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:33:59 -0800 (PST)
Date: Wed, 11 Nov 2020 22:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 06/24] iommu/mediatek: Use the common
 mtk-smi-larb-port.h
Message-ID: <20201111213357.GE287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163401_503656_78EB68E8 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 08:38:20PM +0800, Yong Wu wrote:
> Use the common larb-port header in the source code.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c  | 7 -------
>  drivers/iommu/mtk_iommu.h  | 1 +
>  drivers/memory/mtk-smi.c   | 1 +
>  include/soc/mediatek/smi.h | 2 --
>  4 files changed, 2 insertions(+), 9 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
