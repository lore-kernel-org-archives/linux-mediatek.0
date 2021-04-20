Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288D4C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:30:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7079613D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 18:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7079613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fGasTmXNZ0YB85hdBEEXRUNNLnx806gZBCnRh66uqz0=; b=RSDtW9oV3igxwOK8pUBmRxBS8
	Cy00UYdwwSVaU87gYFkyUlOsgN7dM0/LTnjrY3N6a/gyUW6WXYnLF8LZ13RcUF90aAH15EI8pjOWa
	FAMvytNmGgFBygKl9wujSvCbgk/sGmSJUOkhd+jQWnxv4jn1uW7Z4hE+Ra/gVzNKrPNTf85k9Xsg5
	pUz9frPdHXMhBAl8UAp1ZIjLkyuciSC/0PQvfH1JOjtz7PvNBsWyit52gHvP1XgORrpyPnn4AVJNa
	N7OiOnFSY2pD50F+LLiQKFhlfnYKcZJnA+pITKgOgXnyC+huZIXDIxoX5qTXDXNSItOdlK2V5+XrG
	ZhNCF0MyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYv91-00CqB7-Gf; Tue, 20 Apr 2021 18:30:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv8o-00Cq6F-3i; Tue, 20 Apr 2021 18:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qRJfvycjMVS7+Dlrjz9iVo/JVehkXqgejrTGtGxoW4s=; b=eW8bVMZYhQAdHp4VSGTw2pfyRQ
 TkOkTGCqAub1Xp6ghB1hG0E134aXMHPYnhGMW6MzMmp6AScXaC499wejErsDwSKKEnIo8n85xE6Ti
 N04N8MuqH22ABz6jZGIRn7pZgpmjYSrbjkVon1D8VI5DIWFnCDc21Gh0jRoTaAlZGG9QtHZ6Z1Ykx
 HrZOBIr0Mqvf6IJN9D7UOu9PeawCEdlTM/LoBBixuAcLWW0ask840wYvIRiZs15DLmB/c6cP14uDy
 oZOK2NZnGltfe19E7PvGen88peJIaTlN2B8MPCtizuvhqzvBq7Vx8k8UhMrfr0AtwudD9M9jS8qrU
 HlKUr4ZA==;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYv8h-00CLXO-HA; Tue, 20 Apr 2021 18:30:28 +0000
Received: by mail-oi1-f175.google.com with SMTP id x20so6139465oix.10;
 Tue, 20 Apr 2021 11:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qRJfvycjMVS7+Dlrjz9iVo/JVehkXqgejrTGtGxoW4s=;
 b=DVla4ClGp/L1dJYjTX5IxC4u2prtVl/0b9MP3sH7djY6ZkAtTHckODDGFXOyJnWX6H
 JR5XkR2Dgjb4Eb68loTz2asyC0cxRE3ScdhvM3Ib8QdzBM4Of1eQplvehGnmAA2n9qe4
 3ZxgvzybS18xKCcdOreYOuiB/9pR4Rh85srW8mCdU7spnBqS91bMbLvZb9NdZ8lxNLLG
 XxBfU/RMi2smSOMnzyncDqLawjYVk0yyKRtxKemWx+/C++QOdoY3Ocj7KD6BeVo/RIjz
 zzYj66r2POD7jjVIBqduBNQpInPoFXUE6iJ6mbAlZfun0ZWegMdgi9pYFVVc2sbjsXLt
 H6DQ==
X-Gm-Message-State: AOAM530pJMUwvguMiqv2bz64jzitch8tchRe41Lb6TqJIB/n3ColKO1U
 MYORQBd4Vx5OW7zfddD7gw==
X-Google-Smtp-Source: ABdhPJxWkFPc8q9nP0fElXNWc9Q4jrFRA2tAzgnQqBAEDU5kiVPRlVmLTq5c/xsKqk85G5VWPJqWAQ==
X-Received: by 2002:aca:3286:: with SMTP id y128mr4170561oiy.145.1618943422492; 
 Tue, 20 Apr 2021 11:30:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j8sm4542127otj.49.2021.04.20.11.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:30:21 -0700 (PDT)
Received: (nullmailer pid 3597326 invoked by uid 1000);
 Tue, 20 Apr 2021 18:30:20 -0000
Date: Tue, 20 Apr 2021 13:30:20 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
Message-ID: <20210420183020.GA3597276@robh.at.kernel.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
 <20210416164055.3223088-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416164055.3223088-4-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_113023_585823_E6E75052 
X-CRM114-Status: GOOD (  10.27  )
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

On Sat, 17 Apr 2021 00:40:51 +0800, Hsin-Yi Wang wrote:
> Kenzo is known as Acer Chromebook 311.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
