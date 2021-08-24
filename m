Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4ABC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:18:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBB46128A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 15:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EBB46128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuscWOpq6qN1DJ7ya4O/dXUV7AhH48bnEzC6IWGrUN0=; b=tnUUB2l4rBei6J
	EHtkk1XMdAGJbTLzOqY5Lc19EjZ3a3CgMQWgzI7lu8T5W5kJwl1MWxOZraE+f7yaZJMetybg9ahN/
	j7mIyFXNf5w4Vt2sqORKasFhlPt7Fmm1VCAxZPNoDUHgEhg6oyOO7UGyFEa/S54Ue6a3xEDmrs/yr
	N7h0oyLGxmIEEXNncAFt/hMJvE6Jh+clpOnnaEBb74EwkgERXhdrX7Tq++vpy2SInAxnPbRZrTCrv
	5w4TJaUMHRKU4p3EsuCpPE8WTHAaxxZLvx/ZPKHJ8NzAxoOBG+cYm6fRZSRT6t9fVpCxsX5q26diD
	opuWr2uQWJP9J1Rycw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYBX-003gdB-7I; Tue, 24 Aug 2021 15:17:55 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYBK-003gcE-DY; Tue, 24 Aug 2021 15:17:43 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso35742939ots.5; 
 Tue, 24 Aug 2021 08:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xzCZ/DSiFpYX/pfQQrLjgsOGXJhpAq/f18GVHHyrKso=;
 b=CKhtYnxg3nnJPrxgUMCgBxdxITJBcT6qQNFU8XlE8IbbC9zte9Izs0v57PcwbyKh3u
 zeQeehqeQmM2OKOyOwgSCbU0PzLhHigbCSPjX1ZhdFFRjXqY3xoE2ntS0CqCRNfg5/CA
 7BGgYv1O82pLjWsDezDOd7vyi4+G8q89ZHbkPKEbV59/7+S9OpKwX8FJ7P1uiSoP3bCf
 R0wjwMiCNpmQthzLOeOROmuuirpy7pA/xVgVJEv3q9rZs5ZnhpZhqDr2NpMCo/cE5prh
 f8tUkZtaQUz3cryvW1pIX7dr7guA3lmUzoMnW0/8KmkK1HzfAimtgjYYpLe7zHyW/UXe
 l3bQ==
X-Gm-Message-State: AOAM530pSkkDFzL8b1US7NscAwx3YzqeIBesB0F9l4dZnstsM4wherrG
 bTEFTMiK3ytWczUJlyXorLno1G1MtA==
X-Google-Smtp-Source: ABdhPJwEpQ4jQKM+F7cNh3mpA5TGHYL1v0YAFfYdETQzN7PRWoBSPCQp/mS1+w6gaZfI+6Ace00BLA==
X-Received: by 2002:a05:6808:19a:: with SMTP id
 w26mr3305105oic.80.1629818261783; 
 Tue, 24 Aug 2021 08:17:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w15sm4258088oiw.19.2021.08.24.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:17:41 -0700 (PDT)
Received: (nullmailer pid 467053 invoked by uid 1000);
 Tue, 24 Aug 2021 15:17:40 -0000
Date: Tue, 24 Aug 2021 10:17:40 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [v2 02/24] clk: mediatek: Add dt-bindings of MT8195 clocks
Message-ID: <YSUNlPq2jY6ZM09J@robh.at.kernel.org>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820111504.350-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_081742_505979_693FDAEA 
X-CRM114-Status: UNSURE (   9.40  )
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

On Fri, 20 Aug 2021 19:14:42 +0800, Chun-Jie Chen wrote:
> Add MT8195 clock dt-bindings, include topckgen, apmixedsys,
> infracfg_ao, pericfg_ao and subsystem clocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8195-clk.h | 864 +++++++++++++++++++++++++
>  1 file changed, 864 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8195-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
