Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTl50NUsAD37s+uH/emqCxnMYSj9qJZMFRJIXGR2asM=; b=mbYyNdCZ1ZgTlG
	0qo7WuMidYFOgGUfoAXolagS0UARnvP547sTxFYFGPcHHlguGfKE0LKDKZM4rVij9DxTuM1r2seI2
	g7TJnON/HMQsmF52lWIkR6kx+JyrtK/hckoIOuwreAemVWvkVWPKv+j/nZA3wWKWMG+UWmPblr+Mu
	S4xH2++YWO+QpxBuBqSKlh19Dpk37f8BasMEINiLP3FVcb+pbU2fXThl3kroc/psZ4aZ58fq74ITh
	l3J8LKzKho0FlEpYEsrnk8AZ6z1GQfjRI64jN5BRN20o+skKa/I7SHQUFzMFNDgPPtM6aVPx6GpHk
	UK9WMeHdvvuPL5baYMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrBN-005g6g-Hf; Tue, 03 May 2022 11:59:09 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrBK-005g5A-B6; Tue, 03 May 2022 11:59:08 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so8415844oty.3; 
 Tue, 03 May 2022 04:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Bn5OzfsrZ6KHsFRAzJ/z2ysuxzu8Eq1fItATtTsfaoE=;
 b=Yi4gZrV9UMqVJ95w/HAm+xLVwPpMnrqiKCw1haw1YUHdht/ZPVkk0VEygKdi3HjQ6u
 sRJez2bS1DAd1eaW08V0CzeqYKGCd3RCUz9ixZuWnFaiF1rS0AhhxxnBzAUlR8iE1G6P
 ghSwPVJaOa3S7oojP72canc9u6CnIWLGDfTq9qOBmeiDL+7uWW5DJkb+lk2fAAXCmSnx
 JyrC4AjVa493EAbflqiQ9RJheI9uDp/iHPNfTddivOSOzPJCHM696/ghx2k5gxoR02G3
 0e1D1+ubrg4fPbY2oJMRqKfwx1mMq1JigOgnT/AK4TyTwJj5BlheotY4LetAKk1CqDEY
 c1MQ==
X-Gm-Message-State: AOAM531oEUU0HwFMK5UdQf78CKlvq14sOtYDs78y5baquoMLpI+0JjQH
 SjQjYM9efxmufNbTBh4FRQ==
X-Google-Smtp-Source: ABdhPJwoVPo6dI4Nm7MCzkgHnpwplJNwVGViql/65wPitn5rRmkYgum90kPCTbSg6hdaQbF6wP2EqQ==
X-Received: by 2002:a05:6830:23a6:b0:606:1bc8:b0d3 with SMTP id
 m6-20020a05683023a600b006061bc8b0d3mr3195067ots.196.1651579143584; 
 Tue, 03 May 2022 04:59:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05687031d500b000e686d13872sm6779423oac.12.2022.05.03.04.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 04:59:02 -0700 (PDT)
Received: (nullmailer pid 3296828 invoked by uid 1000);
 Tue, 03 May 2022 11:59:00 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sean.wang@kernel.org, matthias.bgg@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 kernel@collabora.com
In-Reply-To: <20220503105317.54696-3-angelogioacchino.delregno@collabora.com>
References: <20220503105317.54696-1-angelogioacchino.delregno@collabora.com>
 <20220503105317.54696-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Date: Tue, 03 May 2022 06:59:00 -0500
Message-Id: <1651579140.664800.3296827.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_045906_401161_9BF12637 
X-CRM114-Status: GOOD (  11.43  )
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

On Tue, 03 May 2022 12:53:17 +0200, AngeloGioacchino Del Regno wrote:
> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>  include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>  2 files changed, 1132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml:100:14: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block mapping
  in "<unicode string>", line 96, column 13
did not find expected key
  in "<unicode string>", line 100, column 14
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml:  while parsing a block mapping
  in "<unicode string>", line 96, column 13
did not find expected key
  in "<unicode string>", line 100, column 14
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml: ignoring, error parsing file
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
