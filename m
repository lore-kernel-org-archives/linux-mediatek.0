Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1535C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfVkBTG8SNv9Tulxii1+DdNRE/eocOHXxVG3G/nIC5M=; b=aiEgtCIG0LAntYU9IHbg7EGyeN
	ERDCVQJ4CgZbPPl1xn+c8A2JJrmwpm23jxLCECsRhrgHDoieTPoBRWdotZzoeQkPPxFMzWv59r0CM
	ejkiyoAM3kkh/X3u/CXkIALyI0ipnlSOQWsiXpb5pzJ6z+HDIMVquYLGblRD/9VTsmRZs7s4aYann
	MwpZQlLaUBceRMW7PH4vIaYyvfbgFCt7TcpEd8yWzBMsXkgDbBg/HmRd1aHpEDHT27XX0uiECXNRY
	06at5tMR1b54qJoa+nYxkD8fszQmvTauCjveu/PKzcSNt2CvgEZffOi7TfoNr4Hccp9iblfRx7p6o
	AIyzIqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsPv-000wTs-AA; Mon, 10 Oct 2022 13:01:59 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsPs-000wRq-B5; Mon, 10 Oct 2022 13:01:57 +0000
Received: by mail-oi1-f177.google.com with SMTP id w196so6244202oiw.8;
        Mon, 10 Oct 2022 06:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfVkBTG8SNv9Tulxii1+DdNRE/eocOHXxVG3G/nIC5M=;
        b=o8zvFohZDrFudrf6KAXWLuqroLoBLJGkXb3wSLUgR7qmUwJU4/PTvMGumawrBACh5V
         kUIt2OD8mMaN73ZyvxgTSXWG+nv1CRJbL/CLtkjLMNj6qBmcAh0MRU/NkdjqZGmq0+AZ
         Hy5ItcCR4HUX7t8V+BDqTPlxhbet+A+EoTdv+X6wBRQbV5dqXzzBm5cF4VwEZSA0Sv/p
         aS1wWlx+nIml+nyrK5oVuO+ecqMUfWx4ywpYsLoVhVjtc+DDvlf7PTPKDDHdsNwy0I/h
         1aal1ZqHlcrhkz8nKPjxgw7k8ag+EBMoD95XLairkYVss6dN8TGt9kRk9KJq8HegkzfX
         kyEw==
X-Gm-Message-State: ACrzQf18+1TyyvQMM2fXOl+/pUAVsll0QDDkP2RRDvz+lU1CyZiQtkjq
	M/MLqdBzFbQtqP5cF8NYcA==
X-Google-Smtp-Source: AMsMyM5lgFvJ9fLliV+V4FcCSGJENE49rAo3hL62foOpnMFIQYg3mQbq65Qw1Gm/4qIDH33vBplIxw==
X-Received: by 2002:a05:6808:2118:b0:350:3c8e:404d with SMTP id r24-20020a056808211800b003503c8e404dmr9122517oiw.227.1665406914045;
        Mon, 10 Oct 2022 06:01:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d6381000000b006339b36127dsm4803925otk.3.2022.10.10.06.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 06:01:52 -0700 (PDT)
Received: (nullmailer pid 480632 invoked by uid 1000);
	Mon, 10 Oct 2022 13:01:53 -0000
Date: Mon, 10 Oct 2022 08:01:53 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Add compatible for Mediatek MT7986
Message-ID: <166540691329.480578.14649778257492089320.robh@kernel.org>
References: <20221008165627.114782-1-linux@fw-web.de>
 <20221008165627.114782-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008165627.114782-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_060156_409954_F1AA849D 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 08 Oct 2022 18:56:26 +0200, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
> Platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

