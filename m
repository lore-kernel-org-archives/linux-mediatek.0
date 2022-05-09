Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UW4iJJoiQ3iEP/5rAT/foIn3chwBlXhcUhdZx2OVua8=; b=s/5lkB3MurrJqR
	WQ4CTYB5+JX7wJrprrZHLbvrFZpU7KnSqS9POeV3DNH8FHSZhE9ebq56Ubg6D8tw7BXK3KKJJNdL0
	E4znsOxehDktiwS2RQT8ZYtAvJtenQnxdEpyaG8eaEFq5Ie7GY3gG8NVqTt2mU0LWJrRTXIhNzXG6
	u38Oj49npKkmNw3eM9DAI0OWkRLc6aQz79yv8dN5pV22aB0U00f/AHR6AJcmTovkUtejb44JdUBNu
	Es2En4pMwj2Eo0z9ES4os5iE9iGHuJ7e2nzrE4dKGRRvSXlO4kkc8k50RmfkfFId7v41LClSq6gAJ
	TQoK68w6xTYTkLh8vZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2OV-00EKPe-L2; Mon, 09 May 2022 12:21:43 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2Nu-00EK51-Em; Mon, 09 May 2022 12:21:08 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 i25-20020a9d6259000000b00605df9afea7so9979435otk.1; 
 Mon, 09 May 2022 05:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sv2cI5/IIfv5TA9/D1vZuscnav6gHINQOSxljIH5MXs=;
 b=Y97QYFbv2j+64EB7b73Hwj7vmELHRZekfTMJfTk2FjTby+75YtSQBevRCi9wJBi/Hc
 o3BaVO+tn4DQBOMcODEES1NHeidoqMnj+2rgIqRBvL+JTcn7wlMQB1V54NmEyCwDXcBx
 vo0xWxH1XE+xyScJQzdKCq3myiqo/QKPWU+lS/QovF4SYE03znTZXwbbNVhpJ22zEEYV
 bwe18kRlEO7PQZN5usMrptmjOEP8dpm1HsEm+FmcgaZX49z2XRgFZQqcU3fYs/pspA+V
 E+V8XMHblGfApVujfiW/Szx+moCrgwLLOPoaNqFL59czBux9PYa8pPsoxBDf4lSRjA/M
 Gv7Q==
X-Gm-Message-State: AOAM530f1ccOtR6kDt+DhlBLG6zu0Ma2YtgtsmktZCibX6TwwIrN4q2w
 Hwoz/Q3kEXbAwcLWAH8E3A==
X-Google-Smtp-Source: ABdhPJzmgTfUp6EHG/A94h+NBN2R5QfBMhZFGUuuka9lsHg+u9WLwv5BWtw2aG+NwSAp98BLFiz3Zg==
X-Received: by 2002:a9d:74d8:0:b0:606:42dc:5ce3 with SMTP id
 a24-20020a9d74d8000000b0060642dc5ce3mr5735048otl.303.1652098863902; 
 Mon, 09 May 2022 05:21:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 52-20020a9d0eb7000000b0060603221241sm4571643otj.17.2022.05.09.05.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 05:21:03 -0700 (PDT)
Received: (nullmailer pid 3576229 invoked by uid 1000);
 Mon, 09 May 2022 12:20:58 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: airlied@linux.ie, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, jason-jh.lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20220509044302.27878-2-rex-bc.chen@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Mon, 09 May 2022 07:20:58 -0500
Message-Id: <1652098858.557372.3576228.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_052106_602401_6F880FA3 
X-CRM114-Status: GOOD (  12.69  )
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

On Mon, 09 May 2022 12:43:00 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dts:27:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   27 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
