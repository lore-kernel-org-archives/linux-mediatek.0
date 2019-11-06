Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC99FC6195
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C432207FA
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOflw5gX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C432207FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VFAtNlj5LHuaqQcSzDEAiY59pSXM9aKvjv3mqPjmlM=; b=tOflw5gXeLeN8F
	OqGDUgHsYGRaCZ2HhMp80gUWTI73UsGdlwXzM7irqS2+/Nf0aE8WMmOyaEeO7gCtMdjUIPK0zOzI+
	arfgml6ctHe5igoFHk6A7JZSVu/77y8sgblPS6mVbq88N2JPdu+Z6tJN0Y5bDiZk3pWxkyCPexf3a
	OobId9HsZ1tXbarzOYw513zHNlPL+5XEliFnWQqIb/Gn05mE0ikK14mMNZTNt0VHnod53rlqeLXIK
	qhEtogxjncD0lzwce7dNCPigEZZAxpxdjM7BYaC4TxE8o0+rxQfWjSP/7ZSX5DaqT3PsYx3dvwEx1
	R8JoV973ng7ckFjHUEcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSUuj-0000OS-QE; Wed, 06 Nov 2019 23:40:37 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSUub-0000Fg-9s; Wed, 06 Nov 2019 23:40:30 +0000
Received: by mail-oi1-f196.google.com with SMTP id k2so280076oij.12;
 Wed, 06 Nov 2019 15:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F9+XxF3bme0TDxNV87CvWxfYp74g7+cBn1OYi++I3PY=;
 b=PsGBEOiHhwYSTAH3VkRKVU+NcXEpbRH6grnMYuRuvaZGOIA8sg8iJbuEneDj54S8NS
 wuXdB9AwL/JUsRrQcIRWOzZ6mBgqiTmve1nuo7yw+f1vB8GlHiXHx7btCwRek+9fuajD
 R58KQKfeqshYUaWS2Gr6lM5E5TMpKKzapjsUZB1HauF081nScsgLB0KP0BPK5mtmgONI
 zLbsU0r7sjXDZSZ2XVPHlzGuYGSTnuGJys+j6Ps9/tfNrLV/6qU3HdZWQn1DCD+AdUq+
 PlXNFeBm4c6wuohtoziYqlpnIO2TpwvOQ04V0KmNCaERNJ36rzzijAVCburSnHlKjssg
 erIA==
X-Gm-Message-State: APjAAAXlhRcuBdI7iZP+5hHNeMr0U8HOec5pHFMzTmEnZZ3895oiu2C0
 FeupZvXG9JBphVBW5eWJ+g==
X-Google-Smtp-Source: APXvYqySo4f8qKaS3Uh1xjvS4bwqGL+HLtxodI5d2sqmKN62Uk9p/GW8ZMzcEf/idpRcKBR9Z7JIMA==
X-Received: by 2002:a05:6808:3b1:: with SMTP id
 n17mr565821oie.50.1573083627798; 
 Wed, 06 Nov 2019 15:40:27 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u4sm140222otb.35.2019.11.06.15.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 15:40:26 -0800 (PST)
Date: Wed, 6 Nov 2019 17:40:20 -0600
From: Rob Herring <robh@kernel.org>
To: Chao Hao <chao.hao@mediatek.com>
Subject: Re: [RESEND,PATCH 01/13] dt-bindings: mediatek: Add bindings for
 MT6779
Message-ID: <20191106234020.GA19463@bogus>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
 <20191104115238.2394-2-chao.hao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104115238.2394-2-chao.hao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_154029_343511_E8604CE0 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Cui Zhang <cui.zhang@mediatek.com>, Jun Yan <jun.yan@mediatek.com>,
 wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Guangming Cao <guangming.cao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 4 Nov 2019 19:52:26 +0800, Chao Hao wrote:
> This patch adds description for MT6779 IOMMU.
> 
> MT6779 has two iommus, they are MM_IOMMU and APU_IOMMU which
> use ARM Short-Descriptor translation format.
> 
> The MT6779 IOMMU hardware diagram is as below, it is only a brief
> diagram about iommu, it don't focus on the part of smi_larb, so
> I don't describe the smi_larb detailedly.
> 
> 			     EMI
> 			      |
> 	   --------------------------------------
> 	   |					|
>         MM_IOMMU                            APU_IOMMU
> 	   |					|
>        SMI_COMMOM-----------		     APU_BUS
>           |		   |			|
>     SMI_LARB(0~11)  SMI_LARB12(FAKE)	    SMI_LARB13(FAKE)
> 	  |		   |			|
> 	  |		   |		   --------------
> 	  |		   |		   |	 |	|
>    Multimedia engine	  CCU		  VPU   MDLA   EMDA
> 
> All the connections are hardware fixed, software can not adjust it.
> 
> >From the diagram above, MM_IOMMU provides mapping for multimedia engine,
> but CCU is connected with smi_common directly, we can take them as larb12.
> APU_IOMMU provides mapping for APU engine, we can take them larb13.
> Larb12 and Larb13 are fake larbs.
> 
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.txt         |   2 +
>  include/dt-bindings/memory/mt6779-larb-port.h | 217 ++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt6779-larb-port.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
