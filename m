Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNkSSmp1IVh4OFEEBeLkM2DDdLSDxsocXVmB/r/rLUk=; b=hFrIfXaoHk4I2N
	fxlH3slxlHk4ldziZ+fEU1JiAa9kXlxaWo0eyeOkmdH3fLI9odxqK/FKefiAXTkW14Khgb6GFeV/l
	ZqxNiXH5SOhwBuzbAq/pVmDRU86wtsaWYEDPI0ellyqwuJm3Av8DSC+trTfr7S46LLMOBimGqEfiy
	6p6oUeoXgX8vnI97cth8XrS4ohRX1EG0yd17/KsPuJMY3kUsH4y94UB490tvQAKbMeT8aPga0EWNT
	6YXrRJU9J+5u8cBca5cFMO4xDPhd6PqTqzCRy/T9Vdd5w36A6OwXyhUFG3gG8utrL59RUP8DLxYir
	R6jajMAh3qD+B6dJlqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9U2u-00FP9A-JP; Mon, 17 Jan 2022 15:35:48 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9U2s-00FP7O-DX; Mon, 17 Jan 2022 15:35:47 +0000
Received: by mail-oi1-f176.google.com with SMTP id x193so24010424oix.0;
 Mon, 17 Jan 2022 07:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PdccHlgr3Zdp1814HhFMrvJGIRgozixSM54SKvkFpnA=;
 b=ukpxxbGLt33TCGqI+zhnZrxlkPTj0LCO9NRWYGI8TPYyrHs/4rSxHtTBfMCF5Le8eJ
 IgsgoyPyYETBaAZDN0187vGaTTq+HGzepXQvWeo2xKCbAiAcQlkpptqlp73z1JKZvVuT
 qbK93DfczmTx5/GxCpb4WlJDVJCt4eNU1SxPFmNcg+mqk2NhIyHLT/Bt8SbG+zrAZ99r
 V/UbQCZ8kaJg7JMteCcdTmHCvqIzs873Li/Pcmfcg/bSdI6MATCAz3BM4Sb2WAbqZXfu
 99w74N4kSzbksL0XA3Zr4/m5hKSSzWlq/Pu2hdaKiZm4Hvm6YiDl4faCOSr+vYhihWsd
 tOjQ==
X-Gm-Message-State: AOAM532t6sdk2SN+b2i33hlKPOoeLxw7VMO3pBy/c1xEUAcbj7dlO4E9
 HvxUSs5KSp3v+I+xg8zbvA==
X-Google-Smtp-Source: ABdhPJyI7ICuL0OHDG+r1tYSyFFYh4imjg3J5ue8rDUn7lNU4uKpyUkRvJ3l09fkM1OiRFnGsbLg2A==
X-Received: by 2002:a54:4402:: with SMTP id k2mr9876742oiw.131.1642433744862; 
 Mon, 17 Jan 2022 07:35:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a28sm6389929oiy.4.2022.01.17.07.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 07:35:44 -0800 (PST)
Received: (nullmailer pid 3923084 invoked by uid 1000);
 Mon, 17 Jan 2022 15:35:42 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-media@vger.kernel.org,
 angelogioacchino.delregno@collabora.com,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fritz Koenig <frkoenig@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220117120615.21687-4-irui.wang@mediatek.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
 <20220117120615.21687-4-irui.wang@mediatek.com>
Subject: Re: [PATCH v2,
 03/10] dt-bindings: media: mtk-vcodec: Adds encoder cores dt-bindings
 for mt8195
Date: Mon, 17 Jan 2022 09:35:42 -0600
Message-Id: <1642433742.919482.3923083.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_073546_485225_0EA15D7E 
X-CRM114-Status: GOOD (  12.67  )
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

On Mon, 17 Jan 2022 20:06:08 +0800, Irui Wang wrote:
> Adds encoder cores dt-bindings for mt8195
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder-core.yaml   | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.example.dts:20:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   20 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580741

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
