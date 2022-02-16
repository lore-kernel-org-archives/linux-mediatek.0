Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YT8xabIDj+eHH5DjK7YeGTivLK2w8Pk4anL17e24hVg=; b=YtSpSeCYEPC7Uh
	LxK7No843YZ6rmTMUE1FW4LjAiYJSLbLfvUdHxthi6YKOB6NUJEB71hEkCr2Sn/BMeRCULjt3V2fm
	F5y4nVu5ALuOe15xBS3JQPO2O6CZSsWNwirF07nIGf/BtPIE52HDIlv87V1dllYxIGbAroFroIz1d
	7PPRO1uGvslMgJdwYc+Kb8KeeZjlEAnxH8phnMEt0xWIq22u7z/Miknv4vS6CwQfEZb9dQI8NMVEd
	V1nkRcv/eeKcKrLfYa0xqJOdL/8U6fUWI/fG3Q3XbnxNSKMiyP90A9HAze9azceVANvHBzZT+N/Sr
	sREcsh+/rnNRzHFq22nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKT9m-008TfO-L8; Wed, 16 Feb 2022 22:52:18 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKT9T-008TbJ-La; Wed, 16 Feb 2022 22:52:01 +0000
Received: by mail-il1-f178.google.com with SMTP id m8so961921ilg.7;
 Wed, 16 Feb 2022 14:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5LcHm2dtPJOfjjaQ9D+1olObje338uGmX6hVzgLLasI=;
 b=rIdd7z1+hoo6XO9YKcWVg/I6vxxSzF4JaFurJsDynX+DukPn3gkFT/pIwQ0Xu5g4V3
 NaMJmRgNBDUV71GWjqtOXIALNudwjWCl+kbTwly+FILgqqMNXkqRq81sZseBs1/BG2Se
 BIBkC/6QcQRMdBvbQsbssaaS4hr1Qbs+RTqPvthGn7jQReQqs4C8gGA79h2VATjsXmDH
 qIaIlrLUDkTkgD1IG0vObiHJXIaQnFUxmVNiTTcWr86r5pN3xJ8JikUnM5C3ccZYKwny
 +qxqdYOzGZ2n3pMog63jmAynzET2CJfgP/MeYxfv0ZeasKyKerxzjIOruwtA62AvtTHj
 9Z1w==
X-Gm-Message-State: AOAM531Ct8Pq2/RJlAH94HYk3TDSbcmshp6DQVSPpljdK4QKEWIEDVy6
 u52PvQwXTSPA/PFQcHJSmA==
X-Google-Smtp-Source: ABdhPJy6uPiOPSuOwS6ElLhTY/GwFNGS8Y3qpFEdr0AOVnyH/N2tTKBDhuctpLRGIKutBi441ThK7Q==
X-Received: by 2002:a92:ca0f:0:b0:2bf:56d4:3aec with SMTP id
 j15-20020a92ca0f000000b002bf56d43aecmr33197ils.220.1645051918300; 
 Wed, 16 Feb 2022 14:51:58 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s16sm793892iow.10.2022.02.16.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:51:57 -0800 (PST)
Received: (nullmailer pid 1825837 invoked by uid 1000);
 Wed, 16 Feb 2022 22:51:53 -0000
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com,
 lee.jones@linaro.org, linux-pwm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
In-Reply-To: <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
Subject: Re: [v2, 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Date: Wed, 16 Feb 2022 16:51:53 -0600
Message-Id: <1645051913.078742.1825836.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_145159_726141_14BF9145 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, 16 Feb 2022 17:32:48 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
>  2 files changed, 71 insertions(+), 44 deletions(-)
>  create mode 100755 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1593550


pwm@1400a000: compatible:0: 'mediatek,mt7623-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

pwm@1400a000: compatible: ['mediatek,mt7623-disp-pwm', 'mediatek,mt2701-disp-pwm'] is too long
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

pwm@1400a000: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/mt2701-evb.dt.yaml
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

pwm@1400a000: 'power-domains' is a required property
	arch/arm/boot/dts/mt2701-evb.dt.yaml
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

pwm@1401e000: compatible: ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml

pwm@1401e000: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml

pwm@1401e000: 'power-domains' is a required property
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml

pwm@1401f000: compatible: ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
