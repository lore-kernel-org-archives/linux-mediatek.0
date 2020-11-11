Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3C1C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:30:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C2B208FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xa+DGct+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8C2B208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5mbg9jD13/lvyAPoUGVAkB2nuQxouasIUvMBDO8P+Y=; b=xa+DGct+UUcIOqo+m6BDhva02
	nE8dC3a9h0IoD/ts9Q2WK1R59KOWr3fJj1KKl51k8A7FjhqjaUpiQOBYOSJTcP7npbODBosCod7gj
	04C9ZvvNTww7+Fleqn1SPfJ00juj+jMB+V0XhVGyf2MXZXyo5UfM9w1aVWjdJHYskeP5V5b1PObuY
	xcvadsCpdIrd6fqQPpANcSHnd6a6EsF7jtTfO9Xe8MG8yn98LqeLrIo+M2avA1Sk4enCvnhxswy6V
	1zMPcgnBIQ/9XPg1KkJxVCvJXcQSbmOGXnTlyVZ2Wm8BRpWa9JLydMcX9bKXKdZoSBoUqnsnQbOOs
	jH14ojpVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxh4-0001Eo-FV; Wed, 11 Nov 2020 21:30:18 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxh2-0001Da-Ab; Wed, 11 Nov 2020 21:30:17 +0000
Received: by mail-ed1-f67.google.com with SMTP id ay21so3883209edb.2;
 Wed, 11 Nov 2020 13:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HXTmIvGpS6O2JN7ZP+tV8NA98uj/d24NOFx2y9hbQXo=;
 b=cksAGzg63T8dFCmN7YgHhBKa8YBZJVvx8z7dG2t8YXoiCOxONEoiQ6HEzX4XM1T7hN
 +Sg07UAiCwg681WDyFORaY1CmAAxkxkZV8Qz2N6w6mEfUN2LMYAr7Rb65Oq78PFNbfXl
 9fjrw5cqYIFIq0rmY6U5nF1GUSmXv+NMkRzqTHrnpRKyJWUe+8nF2D+bdsGOlsuOZ94V
 AInAtpOtfo7XmSlxIiIqaWua31bqDwTa7reCNc1FNxBnSTcCQXvtmVqGXSp4KKevZLUQ
 UQYZe/sCX5RejSmxJAFO4nIkz4nKkXdBD/jMTWl3p6svV2hIDceMvt+yDOfFeoDQSYyO
 zkvg==
X-Gm-Message-State: AOAM533nKIPmkEp6rUGQMRb0vp6amElRXqnOaJW2zNOH5TDHQlXsS4Sx
 RLx7mb9z5f3IaDfuq74o/CM=
X-Google-Smtp-Source: ABdhPJzZenTK1Rz6VyR60TpP7GxdbeoRs2AcpvlAu6VCtNPuHEDus85c+Hal/IVl6aOsp2lRL06b2Q==
X-Received: by 2002:a50:fe14:: with SMTP id f20mr1601079edt.61.1605130210735; 
 Wed, 11 Nov 2020 13:30:10 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id z2sm1433060edr.47.2020.11.11.13.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:30:09 -0800 (PST)
Date: Wed, 11 Nov 2020 22:30:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 02/24] dt-bindings: memory: mediatek: Add a common
 larb-port header file
Message-ID: <20201111213007.GA287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163016_432493_36B4C9B5 
X-CRM114-Status: GOOD (  14.02  )
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

On Wed, Nov 11, 2020 at 08:38:16PM +0800, Yong Wu wrote:
> Put all the macros about smi larb/port togethers, this is a preparing
> patch for extending LARB_NR and adding new dom-id support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt8167-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
>  6 files changed, 20 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> 
> diff --git a/include/dt-bindings/memory/mt2712-larb-port.h b/include/dt-bindings/memory/mt2712-larb-port.h

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
