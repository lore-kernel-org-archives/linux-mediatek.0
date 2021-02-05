Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:45:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0140564F95
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0140564F95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5jShs2FhaUcX4lhIKCcCIvuSJU/3cgTFyoRfz6Se1w=; b=vwEixaZ+TKgz5O7IUghb5dFbD
	aQ32VA3acWWEJfnlolvE8gFkWXtGSk6HwvdnIPC7IsG2lLGAzHXnZgkAGCLnQ1ZSQ3Xn1gboHyFs5
	8gUgR/dmm8dX18flZ0K9UiUePTonhI4qWYFq29OHze5jx+n361oVNhwDqcM1BZmkhlEvQbEuCDYPF
	dQegXzFEvtE5Tz6Y/pQ0Oei89nFyqfsfuTcxAXC7M2Jq0PlBImHLkP8v3pGqw0tpQdB8Q033W6R4d
	WR2Lgav5iobflkxm7OCxrAedEEvMbXNWdFgsLysX3pI1OvFZwo+WsMhKcXJc57fU2dewlP7nSvFj5
	yop1JU3Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l87yn-0007Cb-9i; Fri, 05 Feb 2021 20:45:25 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l87ye-0007Bf-2f; Fri, 05 Feb 2021 20:45:18 +0000
Received: by mail-ot1-f51.google.com with SMTP id i20so8174911otl.7;
 Fri, 05 Feb 2021 12:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RxzEdNszjTydBwDSiQ0N+rau9/NOvPsbDlp/JE7iLN0=;
 b=MDULza+8HkpH5PIwzERR9EUXaxtMJHKlRmTxpm1G1od4Iagmz5kpQsqBXaiUW3dywy
 Efnw0GaCGpo9/C0+MS3xFteTc9tX1v+60xM6KbMdhFe6qR2RB7cXOkS7Echa1Zw754F3
 puntFcSCR84DUBjopISmb1qoGY23LM7Z+z6+0987LXiyOO8V23vLM3r0SoSWKCyq3mcT
 1OGmszXWlaZxc6sMjsl/HZd7D08apqjGRREJkGug9HkuLESLgiTRWEvwA5Ud5qfz3Ple
 3ORn4dFmKkQdv/Ryzjke/HOYAbg96qACm0m0vYdMXhNi1sdZXHqFAs+kdvb3JOiHK0iz
 J7bQ==
X-Gm-Message-State: AOAM532xP2E2te+hgRLZAsFdZ1ufn2qo15hEdacDSUX/d+Fq6lxAI9kD
 LQLiBmJSC7cOh5ETJk842g==
X-Google-Smtp-Source: ABdhPJzfyXuv5KitjkYvUCOHm9SE0/bJEvB60Jlm+gmbAsXJSv2oKsk5L7zAmYSGo2BXBz+hxYi2rw==
X-Received: by 2002:a9d:a77:: with SMTP id 110mr4776175otg.74.1612557914909;
 Fri, 05 Feb 2021 12:45:14 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l4sm1989602oou.8.2021.02.05.12.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 12:45:13 -0800 (PST)
Received: (nullmailer pid 3700636 invoked by uid 1000);
 Fri, 05 Feb 2021 20:45:12 -0000
Date: Fri, 5 Feb 2021 14:45:12 -0600
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V8 07/12] dt-bindings: interconnect: add MT6873
 interconnect dt-bindings
Message-ID: <20210205204512.GA3697049@robh.at.kernel.org>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
 <1611648234-15043-8-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611648234-15043-8-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_154516_497583_D9BD0C3B 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 04:03:49PM +0800, Henry Chen wrote:
> Add interconnect provider dt-bindings for MT6873.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  include/dt-bindings/interconnect/mtk,mt6873-emi.h | 41 +++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h

Odd that you put one header in patch 1 and this one separate.

> 
> diff --git a/include/dt-bindings/interconnect/mtk,mt6873-emi.h b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> new file mode 100644
> index 0000000..0b20011
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0

Don't care about non-GPL users?

> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> +#define __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> +
> +#define MT6873_SLAVE_DDR_EMI		0
> +#define MT6873_MASTER_MCUSYS		1
> +#define MT6873_MASTER_GPUSYS		2
> +#define MT6873_MASTER_MMSYS		3
> +#define MT6873_MASTER_MM_VPU		4
> +#define MT6873_MASTER_MM_DISP		5
> +#define MT6873_MASTER_MM_VDEC		6
> +#define MT6873_MASTER_MM_VENC		7
> +#define MT6873_MASTER_MM_CAM		8
> +#define MT6873_MASTER_MM_IMG		9
> +#define MT6873_MASTER_MM_MDP		10
> +#define MT6873_MASTER_VPUSYS		11
> +#define MT6873_MASTER_VPU_0		12
> +#define MT6873_MASTER_VPU_1		13
> +#define MT6873_MASTER_MDLASYS		14
> +#define MT6873_MASTER_MDLA_0		15
> +#define MT6873_MASTER_UFS		16
> +#define MT6873_MASTER_PCIE		17
> +#define MT6873_MASTER_USB		18
> +#define MT6873_MASTER_DBGIF		19
> +#define MT6873_SLAVE_HRT_DDR_EMI	20
> +#define MT6873_MASTER_HRT_MMSYS		21
> +#define MT6873_MASTER_HRT_MM_DISP	22
> +#define MT6873_MASTER_HRT_MM_VDEC	23
> +#define MT6873_MASTER_HRT_MM_VENC	24
> +#define MT6873_MASTER_HRT_MM_CAM	25
> +#define MT6873_MASTER_HRT_MM_IMG	26
> +#define MT6873_MASTER_HRT_MM_MDP	27
> +#define MT6873_MASTER_HRT_DBGIF		28
> +#define MT6873_MASTER_WIFI		29
> +#define MT6873_MASTER_BT		30
> +#define MT6873_MASTER_NETSYS		31
> +#endif
> -- 
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
