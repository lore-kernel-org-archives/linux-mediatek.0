Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A7AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:52:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A0361183
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08A0361183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xNnfJre/fhUcU4GF8oDUutg6KygcZy+VFSYwupDT7g=; b=yNNWvBNVeIqcX1
	ROHoZNXTC14I4Z0fMDW14mr0HB1EdrTPntGOqoi1Tu6OOH1L6iCcMBaiV3h2qlUCw5UQ4rCwnuPAU
	Hc3/n1jGERGMuucuJQi3VnVdv/656OcQUK9DPXnfhsKEwCJNOXP8Ngqn5mbUyB+yweNYUIuIC7JF1
	Cs3gmgM7JzC9vtri9csUmgH/NErOVm0MxgL8FdpNoNzfgg1QccNuxvZK9OuS/xZw9F/POWJhHw10D
	O9EkwVaGtuMeJqOA6CaMaPCEb+ZpFgpyggzEJHEOzmTXkywUV3VuCLZqZzvtnDP7tYAZDyKgfYn1Y
	YftsklufFUGcmMGumfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIZep-004109-Q5; Tue, 24 Aug 2021 16:52:15 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIZem-0040xS-PE; Tue, 24 Aug 2021 16:52:14 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so47821019ott.10; 
 Tue, 24 Aug 2021 09:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XjC4STvYn5W673hggvPcu+zT6dRzkoKFblKiVNLm9w0=;
 b=PEA1Yx7/T30DuTTDscrp1/kYb9oxAnL1Aj3KhPUOcxTjwNC8Yj7z1SrsOjOVFrd4Ry
 fE/THJpvoIu4g0iXP0G6++knmWfYkxVSdmuZqs/7WPlWBAv0ERnngA35cfsbqu1qd4OQ
 cMxzayM3cTxCGwjbbkmDeP9TMoMsDPqxzIesiIjP8eGmCwJpFRwc6sZ+ypcLZFsKPEfL
 aS8sIe6MJNc2abh6+1sgUGReXGL1HKYGEx+tJ0auqBrxypSWQT49Q/e8i6UuhMpER0s4
 PDUFWVmYQZKnHDov/wxVZGA/BXkqEumDIDgC77PTSxXxgyyz8KGcluy1HHDqxsSc1apu
 ITAA==
X-Gm-Message-State: AOAM530OWsOdVVwmw0Wbw5oGveozNPZGGBr/I3U/1jAGVb40juArrhPS
 N7XxsO4tGqdiGEED84Mtdg==
X-Google-Smtp-Source: ABdhPJyfRa/4/UxZyZYdKKDtCptKTyJfMBe9SKVFGHC+BeiS3FEVP6mX3eUI16zgpdl2Uv7NcHU3Dw==
X-Received: by 2002:a9d:de1:: with SMTP id 88mr34277576ots.60.1629823931550;
 Tue, 24 Aug 2021 09:52:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 31sm4644150oti.63.2021.08.24.09.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:52:10 -0700 (PDT)
Received: (nullmailer pid 615362 invoked by uid 1000);
 Tue, 24 Aug 2021 16:52:09 -0000
Date: Tue, 24 Aug 2021 11:52:09 -0500
From: Rob Herring <robh@kernel.org>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: yuhan.wei@mediatek.com, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, wsa@the-dreams.de,
 liguo.zhang@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 qii.wang@mediatek.com, linux-i2c@vger.kernel.org, caiyu.chen@mediatek.com,
 matthias.bgg@gmail.com, ot_daolong.zhu@mediatek.com,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 4/7] dt-bindings: i2c: add attribute
 use-default-timing
Message-ID: <YSUjuZIm4C2B0sDs@robh.at.kernel.org>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
 <1629775828-19993-5-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629775828-19993-5-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_095212_907616_DEFB1049 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, 24 Aug 2021 11:30:25 +0800, Kewei Xu wrote:
> Add attribute use-default-timing for DT-binding document.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
