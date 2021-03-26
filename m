Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C689C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:17:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B713661A13
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 20:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B713661A13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iO8+ZOCKMzpJ6eH/AqmJJI+X8gjV1unDTnbTdaS3DtM=; b=U9vWEvXz3T1JWjUswanpSd6OA
	baJhOIZZoPd3NcdV4UTAIRXfOHY9YdXbB6iEBFclKe9PrlcmT2T1Z0UpmouJk0hzRopviIwmOjN6g
	Bq5W28r7FYSkv467+UETLI82VYWV3JoEo0Lw+kgWSJ/krcCQaQSdY9y2/nMBG2PnX6sFhlI9unxPP
	pxoX2HUMubvwLETdYafAKvk6whq6kdkUTlsOb7HNeMRIS7dnuTFgl4/MLCGW3tn0YMDD6u0JTXfRE
	UMPwGuB0XJi3yKo5KC0orbBaz9WpS+MUOy1R4qY3HKnctXIaD9QiSD3Uu96rRoM5zDHSZEN126zC7
	PNL+BAjsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPsta-004IX2-Jm; Fri, 26 Mar 2021 20:17:26 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPstV-004IWX-62; Fri, 26 Mar 2021 20:17:23 +0000
Received: by mail-io1-f45.google.com with SMTP id f19so6668868ion.3;
 Fri, 26 Mar 2021 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lXhVUd2LXA0slLO6f28KGEaXuw2/vWQ0zjQm9zItTk4=;
 b=pOgj4SJu68gFC9PoohCkak0GYP3d0B4ECamW2CqGUa1REEOQWe8NMU54BxcLBKUDpY
 sFtYgdpltttFYw1Qhr6iJOqYlqkwOHEJ94W/tSY/l50UxcbGCg3CQpOMd4Mi0bKpbgXh
 /TKDJKVKtaHMoaI9Lsrc5uVOlvtePG6lIQxbYgmszPoD+BCBABiI1uaKPCS7lBcgD47n
 H+83/uLnfD3Nv7V8PNUiOyd6Fddj0eoSQvnletmI745QXhlH9FKM6bFEDDvwRkcbqL9o
 t9P4tbkPyGd942fRLmA3j/y2CEGmAOskGMm1pUmAlDenX0fgWl+UXlaCurrc9ytJB2CD
 kTPQ==
X-Gm-Message-State: AOAM533HFDtbnHju4386QoX1PQMJx7kgyRWuBUgc/N/MM3RyTgrZx9Hk
 pqVgm+x/OUoGbbwLi1aUzA==
X-Google-Smtp-Source: ABdhPJwl6o5+wnj+LjKE0x7DY49tPHfMI2G37msHGO/RrejzHtTxVwpHGu0KtobnVONYYJROIZMCJA==
X-Received: by 2002:a02:cd33:: with SMTP id h19mr13406054jaq.88.1616789839353; 
 Fri, 26 Mar 2021 13:17:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q12sm4923274ilm.63.2021.03.26.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:17:18 -0700 (PDT)
Received: (nullmailer pid 3797035 invoked by uid 1000);
 Fri, 26 Mar 2021 20:17:15 -0000
Date: Fri, 26 Mar 2021 14:17:15 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: bhelgaas@google.com, matthias.bgg@gmail.com, ryder.lee@mediatek.com,
 lorenzo.pieralisi@arm.com, jianjun.wang@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yong.wu@mediatek.com, frank-w@public-files.de
Subject: Re: [PATCH v8 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
Message-ID: <20210326201715.GA3787794@robh.at.kernel.org>
References: <20210323033833.14954-1-chuanjia.liu@mediatek.com>
 <20210323033833.14954-3-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323033833.14954-3-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_201721_362557_CF198AC4 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 23, 2021 at 11:38:31AM +0800, Chuanjia Liu wrote:
> For the new dts format, add a new method to get
> shared pcie-cfg base address and parse node.
> 
> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 50 +++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 12 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
