Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A49AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 13:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2303361053
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 13:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2303361053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqTWpZppta/c3miqZyGt6CjrPJzQyxwR6YDLUKpEiNw=; b=d0XnLQl+9iCUAt
	jHYl0fQQPJjN1snkmY1Qix6pQJyy5MRGZKuOTld34Kpbd7L1cP+d0wq/aXRQPLgQjpoeD+MwKWLj5
	30RjuVKDpFLzqFxaka6UTf9hEl8nQ/CkXtAtGhe5mMv9rXqVsgIRMWe2srmAyuzJfKGVkxgtSJw3d
	gUBB2Z1SE/xZNgSR8okrC84FvZ55RoN1LIzro53ZW013OuTU2pFI7rLV06T/KSCriLNt4xOTTpikT
	tt8mY+JX4lUSkq5BFLuQ+h5s+XdlK+I4klltlKC1naxfq2IupYtFX8Msl1q8hJXR5gMUPleVZtvLs
	eke4xgJra9Kl7gkIrX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miFyE-005G8d-9J; Wed, 03 Nov 2021 13:06:26 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miFy1-005G6S-2n; Wed, 03 Nov 2021 13:06:14 +0000
Received: by mail-oi1-f181.google.com with SMTP id o4so3551063oia.10;
 Wed, 03 Nov 2021 06:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PpBLDGAp8QAvqjVk/77K3sJy+V3+g4vLOJungInEx8s=;
 b=K6WNaxpagLyEbSf+TqYp4/1fOW31/Ps/WBNZOQ1lPRKj9Ikez5+snGJcD6TsYvmDqD
 JCzJex2gGNeyareALZwcLSV4hOfs+tjglXlF9M5kdvmBXiXhWhuUwwDaQtooTBb1hbT9
 ZK971MCSOcVfUu/5fffz4uoh1MvJRgfRvIreo8Wc+jw4asq2yJZr/LHl4JuYLS/UTpaY
 xjXrricBMFyX+41RxGAhSCJlFSOAxIQmhxIGHZgZIeBhg32dBWPvYMdcnGXvj0OtPm6o
 mRAkiP6tWenEAzo4gEnIqTIruj5c9nTPyMqwWhwL4lMxAp6dxpkhNjLp8jy7euopXBQD
 yRUQ==
X-Gm-Message-State: AOAM530i28PuCKFj/4BRstFdaHyBXQl34xRENY/ytcI+fmTj+oH/7pys
 4PyP6CTd3tsZenUlUJAYyQ==
X-Google-Smtp-Source: ABdhPJyimSDWGg7KmzU+bES0naA0vbL8UJTrICx8Ayuqdr4L7/WXY+qc6zcOsBE8Tr46lUwg1uGHXw==
X-Received: by 2002:a05:6808:d4a:: with SMTP id
 w10mr10540555oik.168.1635944772004; 
 Wed, 03 Nov 2021 06:06:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id az10sm504163oib.45.2021.11.03.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 06:06:11 -0700 (PDT)
Received: (nullmailer pid 1040289 invoked by uid 1000);
 Wed, 03 Nov 2021 13:06:10 -0000
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20211103081021.9917-3-james.lo@mediatek.com>
References: <20211103081021.9917-1-james.lo@mediatek.com>
 <20211103081021.9917-3-james.lo@mediatek.com>
Subject: Re: [RESEND,
 v13 2/4] dt-bindings: spmi: document binding for the Mediatek SPMI
 controller
Date: Wed, 03 Nov 2021 08:06:10 -0500
Message-Id: <1635944770.215632.1040288.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_060613_151247_CFAEDD2C 
X-CRM114-Status: GOOD (  11.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 03 Nov 2021 16:10:19 +0800, James Lo wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584], [268603392, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584], [268603392, 256]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1550144

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
