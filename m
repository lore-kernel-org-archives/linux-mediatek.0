Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E71C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GNsoQA1rIwWhglvKkAewR4/UUx2TOMjNSugyqN9wWw=; b=bvo5kOjm45rv5E
	jT5i21v+DG1BgH5ptUzq72c3fQMIGg5h0trKWYDC1VRnTHsgTLvhDnU6A9DeJmjYVmbxTtDqLofX1
	YD47jd6fIzWcq019HCydQyICcinl0Q+8rQY9OqGta2Zx0zsuM4Mi2CvLvdhEcpoJJdatyizb34GFZ
	qVBrGP7LJLFylZML25bwbNwlHPbsk09PA3oAjojz6XKImvDIV1M4yMpLpKtFpzeUe7R4xeyMCTsC2
	oFs6wcTomPKxM/dxaTbvpD6QXyopC5eL/hGSdufY7bfMScjPOoU9zCPPWIDDtA83PpCEYlPx9hPkc
	7amJDyiMefdrVCIdqUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzP7j-0045ef-Fs; Thu, 09 Jun 2022 20:51:23 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzP7g-0045cf-7A; Thu, 09 Jun 2022 20:51:21 +0000
Received: by mail-io1-f50.google.com with SMTP id p128so3938455iof.1;
        Thu, 09 Jun 2022 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UkS4SPS1bXVXetBXdzfxgOMHLZzAndl0YdUye+T98U=;
        b=pb3v4CBTPF3RAKsly2axUptMabv8pG95BegUzWKx2I4utGbawgtnrxbkLxKJIrw1lr
         yZ9D0fqIYFBMSYIMsMNMso+tqY0OfmXnkVdTrkLkgQPdAiBPaunSjWG9qY0gZJWHbOJ0
         nEFEerb30YBYTrGZC3zTe+kS8E3WwVtxSIwy2p3gbaTgHhA6g3B/4Ax4dND5uEeAhU2p
         cuWYFQtDd5seO0vXlFBcU63UY4bgqTzvQ8WOM48+rDYY1R3t4+ar9lR2mZc260ls2nFV
         87/Flfw+7cBDVkrU/2sh7r8d2m8iD8C2SSdGxl+OBdcGuIgdkaZDoVk0CMSkNzGfDOOv
         ClGQ==
X-Gm-Message-State: AOAM531T/K7LB3dfeSjagRjn4+Bmzm5+Y4dW8FNZSYditkzNCAXy1ueT
	E9M4W2ikvvr4JSYOLy1C9Q==
X-Google-Smtp-Source: ABdhPJwOVwZeLmYAjjuRwTF1mXzjxf7By9LYuIqGnacWdW2E6Un0R5tJzxy5bnVQ5rBRzs4VUQ+xzA==
X-Received: by 2002:a5e:c318:0:b0:669:975b:7d06 with SMTP id a24-20020a5ec318000000b00669975b7d06mr4223204iok.199.1654807875963;
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b17-20020a026f51000000b0032e71f31487sm9867485jae.31.2022.06.09.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: (nullmailer pid 78588 invoked by uid 1000);
	Thu, 09 Jun 2022 20:51:13 -0000
Date: Thu, 9 Jun 2022 14:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Kees Cook <keescook@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, weishunc@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org, Daisuke Nojiri <dnojiri@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, chrome-platform@lists.linux.dev, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>, Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 1/9] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Message-ID: <20220609205113.GA78534-robh@kernel.org>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_135120_295061_DC84378F 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, 08 Jun 2022 16:35:45 +0800, Tinghan Shen wrote:
> The MT8195 SCP co-processor is a dual-core RISC-V MCU.
> 
> Add a new property to reference the sibling core and to assign
> core id to SCP nodes. Also add a new compatile for the driver of
> SCP 2nd core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
