Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53295C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 22:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FE8207FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 22:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZofFPKj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20FE8207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nykdGbwXe5KjWrWnbgWXvMUDk9fZA2Mn21nNHjHWzbw=; b=gZofFPKjH1uEWfoumORAwWrve
	/5bF9HuABOBh+8aY1tU6U9uu6iaFALPrjFVLSRupgIOVWRdInEVmQlIiRZaSnN8XgugQ8S+Iykh7j
	KIyfGG6ytuQD8g+TcmnH3wlGTfoGGNCeCi1RcMB7z75Kk4u/gKp9Y0IL144aHQV/RPEiMQAzlV1AR
	PZOAILFkodvUG3cZl3KdOye1AzZTOYGs3VyCvN5JPkT4PZ6RhQRv4sAGZgJuk7HcPFomabJBXIfS4
	VvdzaeMVpJSjD0KR8mNnNr4MJehkCdcoz3K/92gYScKJh/2NUYy7iFR1ppS1Hb/88SgLsGtJM7PQw
	E7dfFzgmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxeko-0006aj-4U; Mon, 20 Jul 2020 22:59:26 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxekj-0006ZK-Jr; Mon, 20 Jul 2020 22:59:22 +0000
Received: by mail-io1-f65.google.com with SMTP id l1so19371308ioh.5;
 Mon, 20 Jul 2020 15:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ybLjdJnNEzw3PjLa+ida62upYueSqoAHLo8Hga07AFI=;
 b=EwKmGCbbzzG0WhNj29gt5mJ6IBl3zQTHZLa1f9giLX58pkVTJgCgeYO5lsXTUctiSg
 mvJ72bVWz6LCQ52trNwwl1MFsnZkLSL2iC5bC4y7kKeaRHAg79qvKNvzVMEuLTKveQGw
 EAszNWnjrbpR95+NwUX96JTmMCScJqtpKO/sEbgwIlzMNeMrJfs8rXDWiyqQcvtU+LcC
 lrZqEd/AYhN9bXWC/MIV2TvveKHlkhHrQLpDHlGEY2U2N6EAXE5HWz2M8KN0qQdBt6h1
 /8wK/xyVsc/l767nbqe384SNjPqQnJ0flwvn7yXWzoM1j81/A3/liv7E4q0j9/GC9jtp
 uTDA==
X-Gm-Message-State: AOAM533VfTFIudWAMFXbMfdDdZe9kcffF5MvkWSwL5vuxzCw/84u0ic+
 TerCXhR5DH6++VFFzb40gw==
X-Google-Smtp-Source: ABdhPJzLaIZ/SR4wIJfqeFdccTnBBLnUptFgZ037ZPt4d8W2AdS6R04ewjeU1fu4LJgmATuLmvJZEA==
X-Received: by 2002:a05:6602:2f89:: with SMTP id
 u9mr25210319iow.126.1595285960921; 
 Mon, 20 Jul 2020 15:59:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k14sm9856274ion.17.2020.07.20.15.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:59:19 -0700 (PDT)
Received: (nullmailer pid 3106187 invoked by uid 1000);
 Mon, 20 Jul 2020 22:59:16 -0000
Date: Mon, 20 Jul 2020 16:59:16 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 02/21] dt-binding: memory: mediatek: Extend LARB_NR_MAX
 to 32
Message-ID: <20200720225916.GA3106142@bogus>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711064846.16007-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_185921_665903_E1899F00 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 11 Jul 2020 14:48:27 +0800, Yong Wu wrote:
> Extend the max larb number definition as mt8192 has larb_nr over 16.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
