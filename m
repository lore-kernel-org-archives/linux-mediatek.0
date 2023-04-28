Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC1C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaFAPotc4Tet+5Lkq4Wes2jlNlqpTRGPPd/XZUEUiMw=; b=wGjfiHwh0H55IYln0Xhuky01Ii
	dhMHzzlB3TG6G5wKnYDeICOtuAFUFhmZ4WsEM79OaNkD2URagKtiGl1oqqOSGnBZHzC0y3HSPjQgt
	ZEJZcZ/aiVF9pVyHOLcO8VNMO0aFqLFYqCRwzeXQU2MOcEO+E4TQvaGAmYls1xPnHJmeqUzK335ns
	JyC04ZPeyAdnsE3Zcc+ubHV7y6e3Hh+vAfC0A2hzoi3bqGxLakLWzSKVj+n5Lv9P6BVxM1jyvJnMX
	2rSoqgB7530vV+pjEXgElwccM4YXpqtBaPfZV9pyHYFl0ChTkx1iiucOea7H4cLEQS3C81RgOS2Ke
	MdEk0s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psPSg-00B29g-2V;
	Fri, 28 Apr 2023 14:52:38 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psPSe-00B28o-1l;
	Fri, 28 Apr 2023 14:52:37 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b983027d0faso14265925276.0;
        Fri, 28 Apr 2023 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682693553; x=1685285553;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaFAPotc4Tet+5Lkq4Wes2jlNlqpTRGPPd/XZUEUiMw=;
        b=dYBtG7r0DBI6uLuQoXL2dmI6Jk3lrfhakia9bS1hQ1FXmxjVWhdFfk2ORtXP5Vc8Cs
         r237qGlDhORgrds9ihdEw5OeGko6vgQYhk/lvW4euoR5IUxqNQq/fnej5vertuG7w4iF
         OPw3+fGFH5EmYEIxv641p+d6xD6vYJ69ZCWtTsmWQSqaww/xNb76sCb5/nnyPX5gl5qs
         FAmIxfWZXO5gOlSKqGOJ87iWtEMZ8ZfyAL74z11OfqccUtf3Btg6rp5YaZtyuGXhuMOI
         h7WZ+W85gAe73tzkJfs4rPREc5Wv3SHC6hk+53ag1nEnr3y3fZfDPN2zcB7chNmtdgxO
         cIuQ==
X-Gm-Message-State: AC+VfDxbFtMXj71Erx2fan0MlA9qjKtko8C6YWKi8k7XB8jb1105c6ux
	s3NfwVhEdj4tswLPBmxsjg==
X-Google-Smtp-Source: ACHHUZ5NBWHe8QhTsN+gWIF0zuKZ1dCFoewZMy4/csM/yFA+609U4TQP8o3KAwNDbQ5ThRLXTaLv6A==
X-Received: by 2002:a25:1586:0:b0:b9a:6d87:f4cf with SMTP id 128-20020a251586000000b00b9a6d87f4cfmr4095959ybv.2.1682693553378;
        Fri, 28 Apr 2023 07:52:33 -0700 (PDT)
Received: from robh_at_kernel.org (75-148-192-78-Houston.hfc.comcastbusiness.net. [75.148.192.78])
        by smtp.gmail.com with ESMTPSA id a16-20020a056902057000b00b96816d3790sm5149099ybt.36.2023.04.28.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 07:52:32 -0700 (PDT)
Received: (nullmailer pid 3983 invoked by uid 1000);
	Fri, 28 Apr 2023 14:52:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Liju Chen <liju-clr.chen@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ivan Tseng <ivan.tseng@mediatek.com>, Trilok Soni <quic_tsoni@quicinc.com>, linux-doc@vger.kernel.org, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>, Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arch@vger.kernel.org, Jade Shih <jades.shih@mediatek.com>, linux-kernel@vger.kernel.org, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, David Bradil <dbrazdil@google.com>
In-Reply-To: <20230428103622.18291-3-yi-de.wu@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
 <20230428103622.18291-3-yi-de.wu@mediatek.com>
Message-Id: <168269352006.3076.11433928748883862569.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Date: Fri, 28 Apr 2023 09:52:31 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_075236_581620_3AFF947D 
X-CRM114-Status: GOOD (  13.70  )
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


On Fri, 28 Apr 2023 18:36:17 +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  .../hypervisor/mediatek,geniezone-hyp.yaml    | 31 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/hypervisor/mediatek,geniezone-hyp.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230428103622.18291-3-yi-de.wu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


