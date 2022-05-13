Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4508C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6KjajT9aAGxIxQaIB8MLY42WNe3gMqD+wisBkVZnvc=; b=AnP+UFBj4EmLbv
	jqNLv4+QVmjXSG9moTlbKwfRxoY6egl7iWyKuRgdqV1uROc+KctZZC6ZbbKv6g5M6BcbESGeiuy1p
	AtrtMoUEPwdp41qfC1NM92RleV5Ts5+5VM46BgQMoOg6s96PLBEQAaiadoRWMUxkCKHC4RE//6uRb
	f8moOKuBbzNph7WmX1Yp/ZS2nHuxLd5m3ZoSg987I+wJA/6jRe9knGLJQS547M/FkJt6YunmcOYnc
	QgWIlQx6vnF7/haj/x5V0VZmuzz4P0/QMBN9FAcUiVRr6ldYSu0EbxcpPjJiyy0BzktPfPe6jy33u
	EWj6nE+ufOpuNkc0wjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npcDP-00029Y-6C; Fri, 13 May 2022 20:48:47 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npcDL-00024u-V9; Fri, 13 May 2022 20:48:45 +0000
Received: by mail-oi1-f182.google.com with SMTP id v66so11559614oib.3;
 Fri, 13 May 2022 13:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=X3TQnSjdMn1h88B2hKWq4Vtc4t9dgcXCcu4yQAA388I=;
 b=DAbZtCG9Y01CY9ytq+yLrb37r5FVwXw+vd2JPTp5XHv8/ZGSt/xQaHI3MTQOtS7KJK
 CBKTtUSoAkCKMhLI/7BGHY4czwPx6cDZChZUtx8n5798QqZXLPolbyK4R4qL8hl7Leyj
 ow9kIolj/RhZbe9/iT63QxUzqq1UFr2sY5cDxhCuumz8T4LCVDIH0+WjpIje/bgre4pq
 8TIAn1vD4j7Kbp5bXhAdmdZRWR2hwxtODdobNhjFSCvOC6AoGlgSUXOF5Qu5ScILMfRa
 SEq28lobS5jSDQ1yzMMw43a2U6ddsR3KdSpTRpvnBOgURdEHX58L+dRRU/io4FAeKcca
 GJEw==
X-Gm-Message-State: AOAM531qxFkoWGtfFIM003ELZJ2cx8nl0bqmBeI0pV51AYaPYNjLUhBc
 mUflzEEzt7e7squsK04eVw==
X-Google-Smtp-Source: ABdhPJwP+9t58/HsOC+vMOmnRUgE5YnXus5JIhh/6Mv2y+iU8XBnzrtKM2mxN6osLdIL8Ofj/qN0yw==
X-Received: by 2002:aca:aa42:0:b0:325:61e3:1726 with SMTP id
 t63-20020acaaa42000000b0032561e31726mr8474090oie.57.1652474915995; 
 Fri, 13 May 2022 13:48:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e2-20020a056870a60200b000e99b1909d4sm1426285oam.25.2022.05.13.13.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:48:35 -0700 (PDT)
Received: (nullmailer pid 894559 invoked by uid 1000);
 Fri, 13 May 2022 20:48:33 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, kernel@collabora.com, ikjn@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, miles.chen@mediatek.com,
 sam.shih@mediatek.com, fparent@baylibre.com, wenst@chromium.org,
 robh+dt@kernel.org, ck.hu@mediatek.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 martin.botka@somainline.org, linux-mediatek@lists.infradead.org,
 marijn.suijten@somainline.org, weiyi.lu@mediatek.com, rex-bc.chen@mediatek.com,
 jason-jh.lin@mediatek.com, y.oudjana@protonmail.com,
 phone-devel@vger.kernel.org, bgolaszewski@baylibre.com, sboyd@kernel.org,
 konrad.dybcio@somainline.org, tinghan.shen@mediatek.com,
 ~postmarketos/upstreaming@lists.sr.ht, paul.bouchara@somainline.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org
In-Reply-To: <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: mediatek: Add clock driver bindings
 for MT6795
Date: Fri, 13 May 2022 15:48:33 -0500
Message-Id: <1652474913.760163.894558.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_134844_101116_F04AA7C5 
X-CRM114-Status: GOOD (  11.31  )
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

On Fri, 13 May 2022 18:50:49 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,mt6795-clock.yaml   | 67 +++++++++++++++++
>  .../mediatek/mediatek,mt6795-sys-clock.yaml   | 73 +++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml:67:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.example.dts:35.13-21 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.example.dtb] Error 1
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
