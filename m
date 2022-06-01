Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD43C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SK0yQRDoD6S92u8kmqD2M+oXJ9pgGtw9tUHxw+qfNFM=; b=IaPEA3LqNW+FKh
	zkcpGUidzQuHh8y23au/3tsAX6Z9HyOo/Y+8K/UolPBl/zKpWhGQB50c1vTQNn7OvA3fOOwwdiyug
	bLl938RV3HpQiGt45GhGy/hW8Fl0fIgmgK1Z0biac/EZToI5t+j6jqpxqnCD3nB5ULjYfKV9dXW3a
	Z6QQtAb9Cpy9XtOOuMY2ACu61XHg+Re/p2+7TkBsTjmRoIIx0tShIXkO0yFDcVFPDc0KBdbVJH5rL
	hhUZsfofdVylqElwfsFDYOg16kasAWPNFh3/W2JHzpuFGBbhyNN33JUBn5F1JRvLmmU3UFuFrSD9R
	E3u+df6CVJAMYN0EIODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVmV-000SgN-9t; Wed, 01 Jun 2022 21:21:31 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVmS-000Sfb-Ii; Wed, 01 Jun 2022 21:21:29 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-e656032735so4467359fac.0;
        Wed, 01 Jun 2022 14:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/6oW80QhCXjbAr5bxlOoJ7/dv7sc0dGdxBSJIeKExWo=;
        b=I+tBbFPvr8zCixki4kLWbpwtnrwiTIlunwfwKxAPuqnS21mJQVw8T8mUYu8SJ3BvME
         JYSKB7k474DFCMm26GVgLQwfaEZObRqzPjbGqBG6QXdA7Q61s/7cZn+353PkFgs84Il8
         6tnn+Cqc3geyokrkjjqcWZcOXi0lCqB2VG6GBfGGic21hH8TmBID0a2M4/8GHI3hZJOV
         /TnbNNcQB+RQYg+HvvO9pKYvlEHScYftVfbjHE9SjZ03u2ZFGZEzk6ljCxh+aX1PTam1
         us5ly2AUSlckfqho+A2hVYxFjIZQu/zU/O8Vhs98/yZpQBg26jHyrR26SpSfHF4RdpQm
         pa4A==
X-Gm-Message-State: AOAM531Mcz0QlAXBuZHfC05nDVs0e9lAQSiQ1gPq6FpUE1yKg91h+VT6
	SM6PgLMXRdcvmEN0OZcETQ==
X-Google-Smtp-Source: ABdhPJyc4qId+hrK3KeE4gabGhq0ngAeE/HQ4HLixDztb207ktrOgTlTDf0YaoiGHWQFDZ9/OXgLSA==
X-Received: by 2002:a05:6870:2483:b0:ed:f721:2734 with SMTP id s3-20020a056870248300b000edf7212734mr932553oaq.242.1654118487846;
        Wed, 01 Jun 2022 14:21:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j25-20020a4ad6d9000000b0035eb4e5a6bcsm1465578oot.18.2022.06.01.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:21:27 -0700 (PDT)
Received: (nullmailer pid 478219 invoked by uid 1000);
	Wed, 01 Jun 2022 21:21:26 -0000
Date: Wed, 1 Jun 2022 16:21:26 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh+dt@kernel.org, henryc.chen@mediatek.com, johnson.wang@mediatek.com, devicetree@vger.kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, krzysztof.kozlowski+dt@linaro.org, zhiyong.tao@mediatek.com
Subject: Re: [PATCH 4/7] dt-bindings: mfd: Add compatible for MT6331 PMIC
Message-ID: <20220601212126.GA478182-robh@kernel.org>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
 <20220520124039.228314-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520124039.228314-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_142128_652562_4A245460 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, 20 May 2022 14:40:36 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MT6331 PMIC MFD device.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
