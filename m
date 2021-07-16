Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10792C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EAB613BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EAB613BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvxhgrvhO2zMq4HJP3poLB77he+FUaXc6TOCROB5dpY=; b=hH51fVEdsuxBse
	02KXymxQQ0iRu1XmsgjuGiGwqF5cu7MZWWxl3o0kVUe9+lZS3YW7MIwA8NKvn/tlUm56o7djJSQsU
	WuJXvTvOnWGr4fDeHXAYgvs764V9jor7yuxJgXMGMTusTGIBhEZmJub3K99j0lyppGqb3WjOKKkJG
	EK10yIJunOBoq5BtLeORxhB35Lx519njQlgZyziMGp1yMbsFi1uytI6RLoYRmWcZ2LEhwyMGKoJnD
	vxvWLU7drjrdSI3MHhvKhwjvvqTblXK0P5aFBTi/0flqw2y2Y/LKsPoDVSppenlLCFOJ5cg2dUm36
	9HMKMRHuyUwyA4Ck4nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4RrN-004yGb-3U; Fri, 16 Jul 2021 17:42:49 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4RrK-004yFX-Ep; Fri, 16 Jul 2021 17:42:47 +0000
Received: by mail-io1-f48.google.com with SMTP id z17so4904365iog.12;
 Fri, 16 Jul 2021 10:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=abtEqAV33M3DgIPEkfoggh1NvUGRVPw0OXOjuerHpE4=;
 b=GcKZV2E4Zh70dWGZwiXeVtrcC5nH6k+m2oVycVAlxoUhCNfBlPp4+nE8tk8VW8m468
 seFXK32ZMgh+vmnDDaNZiSEHHA9B5/73zs7rl9vd/Q7ySc4b0cFNBbjuw+64Z1lZzf8D
 I3LzIiKKgD+gyTXoMvQywcVZ5JWoIoEXg3blKIn4Aw1bYlyDghfZG35Esf1AtXlbgYUv
 HgxRVM+Bnudunt9yAB59+Okj7FhcElu0JvxNEXDM66qgxyYozVFoeWptD6WNSSAEMNr7
 vPmTKwseVQKt7+274933GLMeQMDUFy2yG/NOqa2Otde4dYeW0BnHdJAf9VGXB9jGuWvo
 6W/A==
X-Gm-Message-State: AOAM533CZtmLqhjpkD1yc4NbnmCHaN+Jo/3D8SJy/JkpFPxW40TDqp/I
 k5eZFLdUYIIrUb5YRX6qXQ==
X-Google-Smtp-Source: ABdhPJxypwi9lv1+Z3SgmiNgIEr2wremF6jY0WjJ2dthFUCmeqyOmoP5mv6TuceqQs07W1yvN2zhzQ==
X-Received: by 2002:a5e:9309:: with SMTP id k9mr8023167iom.207.1626457365621; 
 Fri, 16 Jul 2021 10:42:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h11sm5338497ilc.1.2021.07.16.10.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:42:44 -0700 (PDT)
Received: (nullmailer pid 3655729 invoked by uid 1000);
 Fri, 16 Jul 2021 17:42:42 -0000
Date: Fri, 16 Jul 2021 11:42:42 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org, hsinyi@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Message-ID: <20210716174242.GA3643756@robh.at.kernel.org>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_104246_537784_9728DBED 
X-CRM114-Status: GOOD (  12.10  )
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

On Wed, Jul 14, 2021 at 12:11:36PM +0200, Enric Balletbo i Serra wrote:
> The mmsys system controller exposes a set of memory client resets and
> needs to specify the #reset-cells property in order to advertise the
> number of cells needed to describe each of the resets.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt         | 2 ++
>  1 file changed, 2 insertions(+)

This will conflict. There's already multiple patches converting this to 
schema[1][2].

Rob

[1] https://lore.kernel.org/lkml/20210519161847.3747352-1-fparent@baylibre.com/
[2] https://lore.kernel.org/lkml/CAC=S1nhi0rLpQznvUP1FVNtEDzdffFG_aMO7j-w4fHBY8ceJnw@mail.gmail.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
