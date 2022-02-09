Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5846C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 03:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgrIlY4WQQGmxGuqfk5/hrBbAe6xDul7oyYpxjvfQWE=; b=DuKskmO9zUQqbk
	vIEwHxYvQQlZsn9B5t8DjA/LHsEVdFwy2K0q10BdocNHmEmgO5u7fHocbm+OtZ873ngIuXS817ivF
	3fkzUMoRxIfuu6Jukm/i/FpID+7k8ebuowkXszLAmvIQfu5GsqPNg3xnQXm+Ls7lycs2oWqG8fgv5
	MsrGxalbGyLOR9sLMBbTPklNciN3hxZby3Qtei7le8ZZCZRXu3e5UIjYMg1GMByNQY+kxjSwOPb5S
	1Fsi0SBtbzCRtcDhLfabIxC5OzuhuR7Vnjcx2RuTuobCVqiazXpR4t8MFfqWlNom/BsRnZfmxL91m
	1kP2307BtqVyrSvfTqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdmN-00G8sh-Vk; Wed, 09 Feb 2022 03:36:27 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHdmL-00G8r8-3z; Wed, 09 Feb 2022 03:36:26 +0000
Received: by mail-oo1-f52.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so1052048ooi.7; 
 Tue, 08 Feb 2022 19:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0eMaFLZdFHtOyElhZiC1aSTh7v5BhW9YI15xZRN/jo=;
 b=04M0IEPCnfX70tHlO/McWDVFEA4SF+4HxBiEm9V5Cmmmdr2lx419Sg03Vi8cltBokS
 EPH8BNOLT3skJlydANUkWK8bwvSMy6IK2Dq5vJIyZ1VOxQMDhoUi2/ucthzsNk0nazKu
 g6RFczqf+CtZsYLqtFx2ekYXeVubruu69RX27yWLFBKm9nAAtwnqkhw5QhEID1JbRx/Y
 1WoVZ7g/hkyUVKGiAJ+6k+jH+6GQGzf8E/iw/s2XJRYfZN8AX4e/tY8DjJmkd4H3TRYI
 e0Z5afxsn5lNciq+gY0bx3ADcpNuedlbZAQ5dJB+TLgRp9EjhLSp+6FhOz+2QvzVqZkr
 BMJg==
X-Gm-Message-State: AOAM531cYasB2G255Jk0RcgoAwyarx1YGc2ni18l2ed05cWLgX3she8a
 8jYX9KOnsI5x3xUvx9VTbQ==
X-Google-Smtp-Source: ABdhPJz8GK79FXdMUJW3iiN73KqRsTqgE1epbU3os+/h7mom2viA19kzju50I1wi3jRxGSJOOYKM/A==
X-Received: by 2002:a05:6870:3815:: with SMTP id
 y21mr142981oal.330.1644377783826; 
 Tue, 08 Feb 2022 19:36:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b7sm6161947ooq.30.2022.02.08.19.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:36:23 -0800 (PST)
Received: (nullmailer pid 3592618 invoked by uid 1000);
 Wed, 09 Feb 2022 03:36:22 -0000
Date: Tue, 8 Feb 2022 21:36:22 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, David Miller <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 7/9] dt-bindings: net: mtk-star-emac: add
 description for new  properties
Message-ID: <YgM2tu+Mo34QVAjC@robh.at.kernel.org>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-8-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127015857.9868-8-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_193625_189431_1593949D 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Jan 2022 09:58:55 +0800, Biao Huang wrote:
> Add description for new properties which will be parsed in driver.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek,star-emac.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
