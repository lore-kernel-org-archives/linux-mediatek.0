Return-Path: <SRS0=oN25=F7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 16:56:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3582122512
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 16:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3582122512
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0xG0pSLh7852PWVUZ2VyNw3hApyf98Itx97FsMAUGo=; b=pWwFenpQOC42o0620THwQDuZBG
	TvaqkAbq1NVZmNJwk2TyC+IeDcO+fbZbsjo0wCgq1tBsxglO3hWDDn1ll4Yri0/gaJ+KyrqMMWgYw
	CvM1QBSNk9KuVvz9Flv3CDngHuZCtzttXxlianLA0k+68gl5iRIZLyL3ibNEk7+TijMVq8BXPSLaB
	H5irZWuwLWsD1Mr0Dqaoci/5AL0HrkD3iDWIwKog6VlunvXqZEe4mnULOMrvX/8fEI4ycIa1LtGnP
	fUHpfqZUf+Nn7lhPLZCSiFxAjEQSQAs4KiHURAhSFgaxOQtusMG0aoXM/xZKePd1JohaIbiOUMowN
	4IPVLtXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktZLQ-0008AT-7z; Sun, 27 Dec 2020 16:56:36 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktZLN-0008A3-Nt; Sun, 27 Dec 2020 16:56:34 +0000
Received: by mail-ot1-f42.google.com with SMTP id b24so7404246otj.0;
 Sun, 27 Dec 2020 08:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=zOHx7r8bUBdtp0nmUurNuEgdm3BgirvRBP8EZaKtUo8=;
 b=YAAxWsQmumjvLgeTCBtkev1zNRE7hzVeWdeTPBmhgvoWR2dUztnHW49YzmzBng1CJ+
 AiINphqzVInKYzMQiYXZKZzwUjSPtkjqmOdd9Ac21lecAp4NT9IHjsIJkP+gsO5yfjSi
 WiGLc43GyrQhPcmISdEnkJEeGr5iH2UY6oZHd3mxxCHyvOE75RSDU9NoLvJGca5ffrMI
 zu5xMSvtddN3ZtQF0GG7uCz4Lai7VVWcnsLwKWf678mLTBGeTr62UAGU+bTi035Cb4IW
 K2xuTAQ+nVnQ6Rjuhndh7HWl/jlhcOPvGw+MQti04Z561nRAtOsLAv/P/rXTadEOZ+97
 7WYw==
X-Gm-Message-State: AOAM5304gTXzoAYWkYu4Dxjav+eYtb9CCq+U0Z5gJ31ezbF3ZFj7O5EE
 1XJMg6G7eBT9QO9QfvPxiA==
X-Google-Smtp-Source: ABdhPJzjfapIxx697lofhNlLTsEkycfgDUBiDloMLI4cPPgY1p1lUj/Z+HubGl8e9Xsc57xtzgW1hQ==
X-Received: by 2002:a9d:27e9:: with SMTP id c96mr29709334otb.15.1609088191057; 
 Sun, 27 Dec 2020 08:56:31 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g92sm8621100otb.66.2020.12.27.08.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 08:56:30 -0800 (PST)
Received: (nullmailer pid 1338172 invoked by uid 1000);
 Sun, 27 Dec 2020 16:56:21 -0000
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
In-Reply-To: <20201224123119.26504-1-Nick.Fan@mediatek.com>
References: <20201224123119.26504-1-Nick.Fan@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Date: Sun, 27 Dec 2020 09:56:21 -0700
Message-Id: <1609088181.485721.1338171.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_115633_785718_81EFA4DB 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 20:31:18 +0800, Nick Fan wrote:
> Convert the Arm Valhall GPU binding to DT schema format.
> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#

See https://patchwork.ozlabs.org/patch/1420519

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
