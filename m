Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D21C282DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 15:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A326E20692
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 15:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UX3Rj/Gq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A326E20692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6qZ5dAU7Ls++l4S3ovJU4K5BsrpQRLsFYIloHkPDQo=; b=UX3Rj/GqFMSAr6
	6yaH007RgfEuCU67WiMpuOFLwveeMsVqEloujw20AZla6bXvWMTsc536IDs/9gFlq4qMTUP9ROaPj
	YTUP9DTHqU0IEzZOdGpHLLC0Z+TyAgecRXN1ev4K9boykwxFoefMdRFWGU8oWkIo3tXZ62FJ1vumv
	vvGTnxg4dtM8AHphxgKiKNxwiuiw/pAXFddqmO489p/PGfX/D49x3n6KjTKkK4FamABDjhltOlFaC
	WNkQ03j+J03AfRPLS2C/kFqiGuISifIYBm1cEn2HBffMqY+JDOoTNPwwnpTZUJSktr40khAnjEZS8
	Mac9+ruNqz67je6o7GRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipD3M-0003pK-JM; Wed, 08 Jan 2020 15:15:24 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipD3J-0003oJ-LV
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 15:15:23 +0000
Received: by mail-oi1-f193.google.com with SMTP id c16so2915885oic.3
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2020 07:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9MKeoU4FP/L/hIFVTYWRTXWHyDcNCL5GfbSqC8Dc1Ew=;
 b=l42nW6WJjIyuqea6OCQ7Ls9EZ4Tb6y74oONC+Bfmh+W2XHN/19hKHRDCSm44Wkflyc
 xUC722R1QzWfq1gn85jhjmY4ZwzCcBWOb4+VvSxk+bN24iXiDaJeu8wR5L+u0vaGZ3Tt
 0buI/wyrxP2e2S0JYRHfLYdk2fqNsuGzngFVi1Smyt35/ljZDcD/qCDFcMIUHpAah5pF
 dtmen5tQd46M2GURhE4VEVAa5StNzoVTynUuF+QMyh0pxB85bz5ft31Abo1uwpoUjbBB
 qzRH6ecRRh6idDOJB7JMxbLG2/dfr3NDtpsSsus/wZp1Z/ACgQXFJLk7ryTWNECV4nIE
 12GQ==
X-Gm-Message-State: APjAAAWk1hQs/+yr37sQelJV2YwXZahIDWrazmOAmWoKMl/khAiOOasZ
 n7av/UW5JVUhocuW2qolQmr2Mak=
X-Google-Smtp-Source: APXvYqxMnax4tmWuYOKo6zh2sEHinAsOmqOGL0Y7/Mz571HljTyRNT1tn4hLsFHdBu1hN7LE9047Jg==
X-Received: by 2002:aca:f305:: with SMTP id r5mr3544725oih.174.1578496517559; 
 Wed, 08 Jan 2020 07:15:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m19sm1177053otn.47.2020.01.08.07.15.15
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:15:16 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220333
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 09:15:15 -0600
Date: Wed, 8 Jan 2020 09:15:15 -0600
From: Rob Herring <robh@kernel.org>
To: Ming-Fan Chen <ming-fan.chen@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: Add binding for MT6779 SMI
Message-ID: <20200108151515.GA18724@bogus>
References: <1578465691-30692-1-git-send-email-ming-fan.chen@mediatek.com>
 <1578465691-30692-3-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578465691-30692-3-git-send-email-ming-fan.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_071521_703540_6E75687F 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 02:41:29PM +0800, Ming-Fan Chen wrote:
> This patch add description for MT6779 SMI.
> There are GALS in smi-larb but without clock of GALS alone.
> 
> changelog since v2:
> Add GALS for mt6779 in smi-common.txt
> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.txt     |    5 +++--
>  .../memory-controllers/mediatek,smi-larb.txt       |    3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
