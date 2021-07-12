Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE46C07E9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 15:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800E861206
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 15:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 800E861206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kozpECDqj/xN38ZJi/2SqSnaVjcTcpzgQDHNRn1fkA=; b=l4AloAO8P3wkqZ
	pTDBylvdoNZqr4IB3ek32mTXpYxQU9JeyRs1Y1tGIr7QsGA2+17ejPnl6lnSg7xNY8olYi7aL5zNf
	Vy/hPuifqgBMpGA/hMNPC4W7XA+u8lNABSvH0dMUI2T79SzS+GB+nwf5+IOm87NrDyiCO1Ee5HQGl
	IebLwt6V62LgOYsP4X91//ITHnjIIrP8fkWhZ5pMca21U0stu/61q47VwRZIivyRy8+Epia9SuW0K
	r1b7QQe02Fq2l/iPYhfTIRdNhmuAMDHm3jwgk8LCOUbkKvLtRZtTQMtdpVR1HKTqBbToUVttLMT61
	e2eUJ7t0LGS5wzBAHMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2xUd-007gxZ-5N; Mon, 12 Jul 2021 15:05:11 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2xUa-007gwR-7r; Mon, 12 Jul 2021 15:05:09 +0000
Received: by mail-il1-f182.google.com with SMTP id j5so2251798ilk.3;
 Mon, 12 Jul 2021 08:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EQrxpX8YYl6VoTfdvJSNcghMFZX/hFzAgQgraiuHOJ0=;
 b=H/cNweHzIq127QN8JLnyLgX1LjmfZWT1CWFkN9ESLH6Vh93OZwO1YXr9RSy0tL+b2W
 vQFpzZye6StU8qYAHkux9U39p0MRgx+dOTnq9X/WPAGxVaRyaxHhOSQHstpFCBkgvtAX
 pqETpn8mHKYeuNlTDYFfGes6VdCDYracqY7L3Vub8AQskVPhLldjHXJUZXAzILEWFaUr
 06FAf+bmMRd6Enx5MTy7kC0beobk8o49ejWz5zcO25/PXUmkI4LoVHhZF1oBsT1j5fgW
 o7R8rcWIUTJjZTF2RYPg1W9ud4R4hD43hGoxjbcVtNOWIooHjvDAmPGvXuT5mnJfDZ56
 WIDQ==
X-Gm-Message-State: AOAM531wMbQSNwy/A2kZAGKCZDY/FCh2G9FuydKz1IkIrPfWCOQS1NX1
 HKfmwpY3JplJ6ImSs50drg==
X-Google-Smtp-Source: ABdhPJwtzIgpMoURXaDZ8JILC1RD7IpKSIcAw/P9qBVtWBCvHRE3WS22wzdQA/MB5/jMI9iHSCAlkQ==
X-Received: by 2002:a92:d943:: with SMTP id l3mr16628674ilq.37.1626102307482; 
 Mon, 12 Jul 2021 08:05:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v9sm2014150iop.14.2021.07.12.08.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:05:06 -0700 (PDT)
Received: (nullmailer pid 1930813 invoked by uid 1000);
 Mon, 12 Jul 2021 15:05:05 -0000
Date: Mon, 12 Jul 2021 09:05:05 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/5] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20210712150505.GA1930783@robh.at.kernel.org>
References: <1625368018-17505-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1625368018-17505-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1625368018-17505-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_080508_324243_35208C48 
X-CRM114-Status: GOOD (  12.21  )
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

On Sun, 04 Jul 2021 11:06:55 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v8:
> - Add MT8195 compatible name for spmi support.
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
