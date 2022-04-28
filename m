Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmfFUbT3uTjqy+0clWgENwRUqn+POjNXLl96EThEPd4=; b=yrdr6FPVBt53F/
	AMAZFVIjSH2RGkI06Ik0hQznp7Nnyr83d5MNzFzZnBSf4mQQHsVJugpFrJGCxkUO4VUu9pvf921hw
	z0+T9xh78FRCrZzYeuduttEK2DfCdc0b+bkmynZA+b0cAm4evrniPB013GtzgquQORlxcKGeislFI
	UtLe0rHZkXuvktZwMrBjAj59vuwHB0+8VwOqxCfUKHuWkh1VKAZ/qqTYFHj7x2s7FYZuk+oi+1jI7
	3NjPF1p4POAHPPXXXx5OOuIMM7uFgjv2hcWuxRLsD54CeH+MMCKTj9U8sjBG1d5eq3TKErtLanm72
	KVIm9T7wJvsAUdOzIBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk36A-006lyQ-Fg; Thu, 28 Apr 2022 12:18:18 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk367-006lq3-A1; Thu, 28 Apr 2022 12:18:17 +0000
Received: by mail-oi1-f174.google.com with SMTP id v65so5108683oig.10;
 Thu, 28 Apr 2022 05:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=oqNXD0idBs6+FKIlnsEQo6osQwhhpCXlDbeX0RQIYO0=;
 b=6PM5dSkyFXA+rRxcIMXeIXhieHIuXGcCRRpH/TrAeviKFqKa5JF7fFliaAYBxbTpXp
 xBReJylp+rQXyhVwV2O8uSmta1bZmQ51na/lrV89yOB8sjK6zXwrkFAz0zje0u7KVMCN
 1jqYyH39EpOpzfltssfnWZ/qfdqmf00P+DKz6yWuRExznlJH6MhT8SHiPbgTUefoADHK
 amgRuydNAl+U4/ftePq+Beb/aIbFiRUrMdnhrWQKPUirqZfBSnZ2ZNG/7eo0EyLntwUc
 N6N/2rpFyWyYvtrKzF1lz5BIUFCh3gnO04XnyDIklPIUiF4B3tkEsbeqKjtXbuKp4zJM
 S/Uw==
X-Gm-Message-State: AOAM533EbTSl9ZUb5kLVtoavSZq4OBv3Am7fdzw8jVgY7oaRkeirqPof
 TdQLZUymZpj1ijHYlNdDWw==
X-Google-Smtp-Source: ABdhPJz79Uyli5XuXZ/YbldCnIdSvSISWDE5Fl8O5kQTkx6KQr64F68etKJsVQXHaxzZGCB40WZDIg==
X-Received: by 2002:a05:6808:1589:b0:322:9102:5503 with SMTP id
 t9-20020a056808158900b0032291025503mr15696224oiw.68.1651148279242; 
 Thu, 28 Apr 2022 05:17:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j17-20020a4a92d1000000b0035ea6671d8esm999857ooh.35.2022.04.28.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:17:58 -0700 (PDT)
Received: (nullmailer pid 1999481 invoked by uid 1000);
 Thu, 28 Apr 2022 12:17:57 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, broonie@kernel.org, robh+dt@kernel.org,
 aaronyu@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, julianbraha@gmail.com,
 tzungbi@google.com
In-Reply-To: <20220428093355.16172-17-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Date: Thu, 28 Apr 2022 07:17:57 -0500
Message-Id: <1651148277.902080.1999480.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_051815_403901_78A71700 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

On Thu, 28 Apr 2022 17:33:53 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml:30:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml:40:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:

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
