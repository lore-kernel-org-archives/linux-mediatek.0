Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E474EC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esNtcNx3BW0ZYDyHJtcCsZAGZC+vRBsZkbC1+V6YdwA=; b=MAy1ESnnim/gjNmFD4aHFAVWMN
	Il4tTIpaVET7dhINNnOfrEg7N46NKc9W91usRQi8yw0mi4jIeDmNjvU2WSVK6RcpnjejaeToPJ5Ff
	GTvqqBxvQADB0NIfGZ3PMzb13z+0tqwWh2vYCUVfU16VJ5ZyzpznV3amZ1mnsDmaXDG7CWy3+nKyj
	l0o2Glfyuz1NwPLMKUJtqUtaUqgmiZgZc9ccb1dpHpKz95ELOvsTayQyQfUZcE7HugiIIowrMn5X5
	bLpKFt8dnpEXbz4kDdUX9W7/PW8OvwYfImhKN4fcIx8opCNtSRhaLVSth0+D0Kv2PLCUB9J/0MjEM
	9pdLCLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBn4-00DMTx-D9; Mon, 22 Aug 2022 18:04:46 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBmJ-00DM3F-OV; Mon, 22 Aug 2022 18:04:01 +0000
Received: by mail-oi1-f170.google.com with SMTP id bb16so13116600oib.11;
        Mon, 22 Aug 2022 11:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=esNtcNx3BW0ZYDyHJtcCsZAGZC+vRBsZkbC1+V6YdwA=;
        b=2n/lbA4bQKOnulpgNLz4XxHDrL2eqcCM3lwohMi5wI5mrCBbWKYy4w6oGFN/sGUyos
         K2VoDKYtgVG88IwQRIDihy19KskgxfD7zCx8TRYZl8w3rVpC85zqt/crNmWjcZKERCqT
         DZ2Y/xVbE2dhmREtFqpB4dUKENKWNnR17BMquPW9JI3ocV1kCobaCPKL22kYkUXlQxsN
         6rncixsvgjb8gC70v4QPvcHS1vetwvyi7okND3i8utYdUUfUiOlu1jBlDJ6wk4bjAuqo
         eknPr15BpZ6Leo5Sfz53FpBr6w6ZlQ54XJR86uYpP9ybUAFQRI8XdyAoE7ls5j64V0VA
         OOJA==
X-Gm-Message-State: ACgBeo3KnwbG7xScPb0WssvdnsBdeJdeiJdG7KlEIFrAJLld186k4ftQ
	QIJy0E0Dv449czTF8+xtng==
X-Google-Smtp-Source: AA6agR60bjoaWedKbnY/NS+tnW/H2Gz998DSgaZ40yNsNvcB/kC7hRFGHbUXBQym/1J5IOcu17Q8VQ==
X-Received: by 2002:a05:6808:308e:b0:343:4b22:1a1e with SMTP id bl14-20020a056808308e00b003434b221a1emr9769893oib.102.1661191437571;
        Mon, 22 Aug 2022 11:03:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j4-20020a9d7384000000b0063711d42df5sm1656299otk.30.2022.08.22.11.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:03:57 -0700 (PDT)
Received: (nullmailer pid 74561 invoked by uid 1000);
	Mon, 22 Aug 2022 18:03:55 -0000
Date: Mon, 22 Aug 2022 13:03:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Johnson Wang <johnson.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Peng Fan <peng.fan@nxp.com>, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: interconnect: restrict opp-table to
 objects
Message-ID: <20220822180355.GA74500-robh@kernel.org>
References: <20220818061653.9524-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818061653.9524-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_110359_952302_50F71E23 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 18 Aug 2022 09:16:53 +0300, Krzysztof Kozlowski wrote:
> Simple 'opp-table:true' accepts a boolean property as opp-table, so
> restrict it to object to properly enforce real OPP table nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Correct typo in msg.
> ---
>  .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml        | 3 ++-
>  .../devicetree/bindings/interconnect/mediatek,cci.yaml         | 3 ++-
>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml   | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 

Applied, thanks!

