Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0VppounFMRmePyPeHi33cQizYD+aDENhZWeL17O+aE=; b=HLJP0m3oYMIRcS1ScJ6yFqJePQ
	CAHJVdUWNcrLFIB+3yYF0H1YlSOJ72p0aH1lnoULBCQ7uVvuulrpk4afkqiB9jWyU2wEsrL3Iv0xy
	sGKKpwZd58aAvj2l0XCg0cP1zbiiVqB1E6UFuwJwIAMDf0AdMRDYZiHdkdA79NVhDJYKfDBxIX4ss
	ke25wEqWs2RZ+5lP9swMfnx7T7m/HZncrYHXFxsCm4SFlnc9lTsMv7WzCbNvN17vDmr1Tyjn9cZUn
	DTMzCIJbhcScmCC80sEps3VjiSNTTfBgDW89gB2TJdH/lmyL5rdGSQQijUuzfdkrX/IYJNUxQxTij
	cyDq9Jgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskgL-00DZhj-PI; Wed, 09 Nov 2022 12:59:53 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskgI-00DZfW-Rr; Wed, 09 Nov 2022 12:59:52 +0000
Received: by mail-oi1-f170.google.com with SMTP id c129so18731061oia.0;
        Wed, 09 Nov 2022 04:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0VppounFMRmePyPeHi33cQizYD+aDENhZWeL17O+aE=;
        b=lAiYZgMrIAWFHbIbU34ZfGf9WLP/6TpXh6je7cTf65F0MBbjgUMEz48AOpSZeIy8UB
         6X6qGH5HOmpCfYSecvQMD5KerZRRZRQH6LgmzmTtx7aQLC8EKKOSuGOQQ8buQ3wbsiLh
         bqlXDYPJvS5dE7YnZnNgI+kdkIE+ZhIUKei4PFyKyGrJUnOCK4IDQapr7qD65WuHbwlV
         MULFcivfSHyLPCt7oXRmzklImyjRjvxWCR+B3bNDEi3tZj5yI+A6g/MDJzt2zuwdk6vs
         DylQN5xqCFEP1yOPSohrMm+CBCb7L9fDB1LAsyaDAvf8CJNgScQy0ITogZyTSSiAJDop
         QWuQ==
X-Gm-Message-State: ACrzQf0Q9A1NtYYqoc8Ggcu5WbSHawITceHnW1sKEFzd1UjzwbznsfK3
	sO7NVlIMR8DPSGJ9aFkrxQ==
X-Google-Smtp-Source: AMsMyM5gyWDXXx0xL8V7eSdlHkp9OkNYW+18J94S4lnodTZ/Z1306cK+ESsuHCc2ctfUyDtDDVU+3Q==
X-Received: by 2002:aca:3944:0:b0:351:22fe:6cc9 with SMTP id g65-20020aca3944000000b0035122fe6cc9mr33227237oia.292.1667998786745;
        Wed, 09 Nov 2022 04:59:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a22-20020a9d4716000000b0066c41be56e7sm5182382otf.55.2022.11.09.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 04:59:46 -0800 (PST)
Received: (nullmailer pid 1538566 invoked by uid 1000);
	Wed, 09 Nov 2022 12:59:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>, linux-media@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Steve Cho <stevecho@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221109073529.26765-2-yunfei.dong@mediatek.com>
References: <20221109073529.26765-1-yunfei.dong@mediatek.com>
 <20221109073529.26765-2-yunfei.dong@mediatek.com>
Message-Id: <166799859988.1535647.9867651548903188009.robh@kernel.org>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: mediatek: vcodec: Change
 the max reg value to 2
Date: Wed, 09 Nov 2022 06:59:47 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_045950_928808_791F52DC 
X-CRM114-Status: GOOD (  13.46  )
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


On Wed, 09 Nov 2022 15:35:28 +0800, Yunfei Dong wrote:
> Need to add racing control register base in device node for mt8195 support
> inner racing mode. Changing the max reg value from 1 to 2.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.example.dtb: video-codec@16000000: reg: [[0, 369098752, 0, 4096]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


