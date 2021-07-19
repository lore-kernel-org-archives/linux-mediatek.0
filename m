Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DED6C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 13:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38AD860FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 13:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38AD860FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdPLAQXCrVwOwezrM/Bjx00rAI78kydtx5IJk5LpP/k=; b=WeXxmt9+3rzkyh
	sLuJZZaJAskXZA6TukxAaD8HMQCA04JDJdeI6muZsrYLPWUtlQGF2dWR/GU+csx7K1f2bCqiauPlg
	6EN+58AEhi3j+gexplOLO4gH6qYZORehn4mzcQ+Pl34536DboobV/X4YD5h/GjqeOhXzBYM079KKb
	ohuTLdgykVMEa9Mu9+OC/UsktOwzUSUVF1tR6jwN7dk5gIOpIxleUw9QfJMk36W78iEQ/bUJtIV0c
	5Qc35fUyj2x9B0STUt4GkClXt8o2vXqhqKMiFAiWI7rH91ZA3//42p3DDJbNuFN0AdG6hn6LqHP/U
	jsjxTLWUHCjSPpMrd5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Td9-009myk-Lc; Mon, 19 Jul 2021 13:48:23 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5TcY-009mmq-FL; Mon, 19 Jul 2021 13:47:48 +0000
Received: by mail-io1-f48.google.com with SMTP id p186so19974366iod.13;
 Mon, 19 Jul 2021 06:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WFCd6dwHjP9c0OpScI2NVJFExqK4DR+8Hm3FZ0Ju4A8=;
 b=qZNjpHB59mU5YXl6nKdM81UyBU8lX5lJchmYtKinmUEGpQaVpI2CJJHAVb3sPNNrih
 dpPrmlx14sY8Bh7VeI0tO4L0w40x01BJ61rT4tN9NqHE6ookm9w0/H4D5TnRCCxxcja6
 r4MvMhRtiIkBjPszXc7E/NN7GzVRypINnn4BgaNxhTbCQq1xJ34G10cqck0BY6sf5HWh
 orwS4QrEIf//Y35nJI8VeL3Nny7ui5h23kJPfXsHfpXApXCL8cBFa4dXQGDDHee/Xcns
 QBz1gA+MOUZw3QzmBhSd69T0peTHYG6OBlxX0axNV9VHvc2GauFO/ot4dkOBmMCaRAbN
 vGMA==
X-Gm-Message-State: AOAM53112/X7sO9uAq9wRJD5qV36ZIsJICdA/8xo8QLB2y/vpH5v7KJi
 9yLfK4i4BMt5G++Ahue9bA==
X-Google-Smtp-Source: ABdhPJxkUhkTuVO75TKOfepgSVLaTuhyX3sK4tEcS2rWzTjiIE6gnHDCd9SJs8Xqf9VmYtXYYijRSg==
X-Received: by 2002:a05:6638:192:: with SMTP id
 a18mr21909828jaq.47.1626702465656; 
 Mon, 19 Jul 2021 06:47:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e17sm9368630ilr.51.2021.07.19.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 06:47:45 -0700 (PDT)
Received: (nullmailer pid 1811202 invoked by uid 1000);
 Mon, 19 Jul 2021 13:47:28 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Fritz Koenig <frkoenig@chromium.org>,
 devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@google.com>,
 linux-media@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 srv_heupstream@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20210717081233.7809-13-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-13-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2,
 12/14] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Mon, 19 Jul 2021 07:47:28 -0600
Message-Id: <1626702448.426819.1811201.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_064746_545010_2B660E0B 
X-CRM114-Status: GOOD (  13.41  )
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

On Sat, 17 Jul 2021 16:12:31 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: using yaml format to instead of txt file.
> ---
>  .../media/mediatek-vcodec-comp-decoder.yaml   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 20, column 18
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 20, column 18
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1506388

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
