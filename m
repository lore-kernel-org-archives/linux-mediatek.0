Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE0EC3F2C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 14:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFDA20848
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 14:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PP8sfrai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFDA20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaRDq2S+he6XG0qG3qAB9GJZpG9yA87sjRlx5cxeeTc=; b=PP8sfraidJXfuK
	E4CNFh6gFoXblv7gZPk9ABraAKRw0Fo/tdOUspP1Lw8F2OLEnsRBKDt6Q4tzM/VcBszdbLnaB1XiR
	AsZYXx2JRGfFQfPWYjWHRfuaxcAk0FZ28fhVW2Tz3Sq1X0NWmTavqlyv9t0zEPWhYTfeNrcJYcm9r
	ov4AO4rt2zgCLtHOL6SUoHGtUBpmyHn1oK2IsNCjd6wMysHQ726Bs2Rl0uzR0gpw4WWvk6HrLnA/X
	jc4c0lNGpozS3VxmtU1knYirsvMbGzUgksh5ppoKYWblhyklpx2ScY42bb4sCuXu3t95PVWe7DIVd
	tgMeowc/wmrXZewFpYfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98Ar-0008IZ-5K; Tue, 03 Mar 2020 14:05:29 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98Ao-0008IA-GI; Tue, 03 Mar 2020 14:05:27 +0000
Received: by mail-oi1-f194.google.com with SMTP id q65so243724oif.4;
 Tue, 03 Mar 2020 06:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jbQGA6dYjSwP62J+F4COay7zaK+oh5Bs7zMzSTsHDA=;
 b=cd4dgXO3c/EcTP/ZoxxhNRcXKG5xjRai0TslMSTUg3+D4tdVNxEVW3LeDuu4M2qP/n
 uK2FK5XyoyCY0spv+r7p/24IAUwVs95mjcgSKG9KMSIzoKc1xetxFQJo8v2yKZ9jdbf5
 UbTgNswAiopGeofLjyki79QXTv0Lei1WvWoAln69ruVF/hcD7Fz9GmUDgNVF9MaqhBCq
 IhFeKqAec9Tee4h7+HewWfNWlnsxeWFH7CwUOdCYQc3hZXf9wjkr0m1olIZCv2xICcMt
 noCOueCqH0E90XDDhZEfjR7KYTu0HUZkOzooPfvQVtsGejPbjQwkMkOnhs60bqBM5WMu
 S9tA==
X-Gm-Message-State: ANhLgQ3hi363C2PosjUJskv6ZwNtNUz0J9hxqewPSgNKk42TqsXk3I9c
 4c7c3boumfMltXsLJuA5BA==
X-Google-Smtp-Source: ADFU+vttXS1Py6bbTK9e5rZkoBNj2Je8lemdxTIY/n2cP/smJ3TW98j1PCb9hPEhtc/qkXNAeDeYJg==
X-Received: by 2002:aca:be56:: with SMTP id o83mr2583399oif.25.1583244324891; 
 Tue, 03 Mar 2020 06:05:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n19sm7672257oig.57.2020.03.03.06.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:05:23 -0800 (PST)
Received: (nullmailer pid 20776 invoked by uid 1000);
 Tue, 03 Mar 2020 14:05:22 -0000
Date: Tue, 3 Mar 2020 08:05:22 -0600
From: Rob Herring <robh@kernel.org>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Subject: Re: [PATCH v4 01/13] dt-binding: gce: add gce header file for mt6779
Message-ID: <20200303140522.GA20576@bogus>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-2-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583233125-7827-2-git-send-email-dennis-yc.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_060526_546483_8492FDE3 
X-CRM114-Status: GOOD (  11.70  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 3 Mar 2020 18:58:33 +0800, Dennis YC Hsieh wrote:
> Add documentation for the mt6779 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt6779.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
>  2 files changed, 227 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt6779-gce.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
