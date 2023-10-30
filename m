Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C79FC4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhgYLbg9CpuoRxcaeuro+Zs7vQs2cUHUGXONLu3huPI=; b=gpBxSbVY9Esk77v/YU1Q/MWYLH
	x2dbvPKnOe56SZV2HBubNDk/2OCIEg+8/VX5fZ0V0YLSxekn5sUQ/7sGPy75tULkpGilqdSoR2sdF
	d4g3qYhpiyWWAh9vfp/p28VcABDxspRHoqSpAD9RsZfVEoUu3hJn0TO97zA4ZlVxuapyUHDy+qfw0
	cMIXXa2QFJZcV/UUBMN3Tv7FFjKsKciMeegyo74QH/rrRJ5Hvl5wSfvIiEPxgKpOFGbrg57nYFKit
	11Ua+tiAXxsSCkabGTRcOsQRUdDRuUBWrLlIl3bJuPzjSVRw9+omvmDqzKSCg1rMk0YRF06P6tuqs
	7lbZFdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUTA-003ZnH-3D;
	Mon, 30 Oct 2023 15:46:25 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUT7-003Zmm-2u;
	Mon, 30 Oct 2023 15:46:23 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b2ec5ee2e4so2871152b6e.3;
        Mon, 30 Oct 2023 08:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698680780; x=1699285580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhgYLbg9CpuoRxcaeuro+Zs7vQs2cUHUGXONLu3huPI=;
        b=eLVkeoWwaOV6CoqnN3GR5KLEc+9HdClugjHsuVJEQ1qYhZO6ONt9i+vivlk7Kt4jkg
         oWRNLE4/hHvkB0U1Zchq72mfp+WS309/7v6/RMKos1LEIealLKaODW4cOLV1X3+hv/Uh
         F3/a0tDBli1CvIPzjyrYmKwBvPaFDJZ+JbAzWeEiUFf6sfAtQ9Flw44OrmmwQYlvDIi+
         2rtFtgk7lAVp0kvSKG42ou0J9rL6gjb5jQ9g5DXpPhDbkzRXSUKzim6fZyX6MXAvoblz
         7977y0JyWd2QWYR8w499OJGyfEZyARz+riQNAGhoF7Uvg4tgSSu7hBBpB6ZBvHtGoDUv
         hFBg==
X-Gm-Message-State: AOJu0YyMaXnzirqq+pBYLyNJuAi7PMGvmfXnPt9Cdms9EI4TGUtTrjtk
	k8MNgJ/0C0ou+Ud0JLMRGw==
X-Google-Smtp-Source: AGHT+IFSruwbJkEig+B3Y64xgE9mhFyNxARc1HIyHctZR+Z00jxUt3Wrrm8hz4v/Q8eRTqSYiXD6+w==
X-Received: by 2002:a05:6808:8ea:b0:3b2:f3e6:f36f with SMTP id d10-20020a05680808ea00b003b2f3e6f36fmr11142849oic.54.1698680780125;
        Mon, 30 Oct 2023 08:46:20 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
        by smtp.gmail.com with ESMTPSA id i13-20020a056808030d00b003afe5617691sm1404553oie.12.2023.10.30.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 08:46:19 -0700 (PDT)
Received: (nullmailer pid 1240978 invoked by uid 1000);
	Mon, 30 Oct 2023 15:46:16 -0000
Date: Mon, 30 Oct 2023 10:46:16 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: arm64: mediatek: Add
 mt8183-kukui-katsu
Message-ID: <169868077528.1240604.14632740739675998202.robh@kernel.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026191343.3345279-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_084621_958270_C8FDD490 
X-CRM114-Status: GOOD (  10.15  )
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


On Thu, 26 Oct 2023 12:09:11 -0700, Hsin-Yi Wang wrote:
> Add katsu sku32 and sku38 which uses different audio codec.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


