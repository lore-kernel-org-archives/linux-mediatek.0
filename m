Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61591C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT29dFQG9gO6zUOkC6HwFgLGzT9S34ngMonC+QSf2Mg=; b=gjbBL0ftg6s/lr6Zzi6/Em91XZ
	SmujjdtEV8JEURI9k4UDzEikUbshCzPVVYwFGKXMXSv6LD5PwK+YzK80LxfD6h88ThdXJLEXOXxXh
	ODUrDv29mVRsZvGvN+Y6YZ0O1bJBxf93xySIelwR14RyPWTPTC+s0SIb7CN5VzIm+Blw/0noN1m88
	fEjDaRMavnPxNhxbo7aiHnrKA+e4t/hsM+YB6Wnm7+LxUJcJl8Rnk0/rHCBBxHOrS2ClIWpXo51Ys
	5lSQyuqON02oB20mbCRgQEgPXhAibJDRuZtUQWg3HZF2XIMPS+b3M0yVQXJxxTd0G0WFQ2/rD/fjA
	p1kGHP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVj8-0005FV-6j; Mon, 18 Jul 2022 18:44:18 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVj5-0005Da-RS; Mon, 18 Jul 2022 18:44:17 +0000
Received: by mail-io1-f46.google.com with SMTP id n7so10002211ioo.7;
        Mon, 18 Jul 2022 11:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xT29dFQG9gO6zUOkC6HwFgLGzT9S34ngMonC+QSf2Mg=;
        b=xigrSO21cfdPniH2r8qEnh2tgAWtOTZzfxBdFe/L4eHf90SxAxWeKUnCVkdcnJbOtS
         8fS/zuWsDIvsETAFWs4OKQJJkZpMf3mSBM+jkmJSZPjhJT8J0okYmXONLu6XNRe2Sg0P
         O0mmVww9MSrnunLgRJOQSKaRaQLrTC3dqjIqI4usqz2+ggGZH5gxOB3NzV6nvs2fUAqQ
         uwNLkCFN033oDq5sywJzSstc6T4eTfGb25Rq8aUWOoIBVJm+2jsAHUa2kgaLF1nR9DYo
         ouAN3nEXFGtE6rqovxR5YtWViJdPUp9mUlBSlqfRSXQUt8DaqfJ5OvAaTyNku5ooklBu
         3gog==
X-Gm-Message-State: AJIora84Yh/kdBAXYJUeD++i5uqGVJhYet9zqbRp1BUtlZqpyOpX0fmt
	G9sYqPwto72cleGxwb4K2A==
X-Google-Smtp-Source: AGRyM1s6VYhtM8AfinB2gMgIvElLBBuNUg5GEn+jv3VioD1/E3fdRmV5D0aWKyrIxBqsnn62hvzymw==
X-Received: by 2002:a05:6638:272c:b0:33f:6fe4:b76f with SMTP id m44-20020a056638272c00b0033f6fe4b76fmr14884160jav.284.1658169853769;
        Mon, 18 Jul 2022 11:44:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g26-20020a05663810fa00b00339d244c4a6sm5876544jae.23.2022.07.18.11.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:44:13 -0700 (PDT)
Received: (nullmailer pid 3326217 invoked by uid 1000);
	Mon, 18 Jul 2022 18:44:11 -0000
Date: Mon, 18 Jul 2022 12:44:11 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Xiandong Wang <xiandong.wang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: mediatek: add mdp3 mutex
 support for mt8186
Message-ID: <20220718184411.GA3326033-robh@kernel.org>
References: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
 <20220711123247.15807-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711123247.15807-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_114415_909697_38B4E77B 
X-CRM114-Status: GOOD (  10.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jul 2022 20:32:46 +0800, Allen-KH Cheng wrote:
> Add mdp3 mutex compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

