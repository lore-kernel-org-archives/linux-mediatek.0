Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790B3C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 12:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C10B6112D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 12:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C10B6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTaIkho0gJIiL4h0GQIU8MSbvrVwQGgnKzGjkUxe2Y4=; b=kFGU4dGoUcGqty
	ea/ktmYaBz3rwjzMHCY71hAe2q8v1yqMJ6C+zVBdbCzUncC3axdmup0RFmynk0oKwvvc76OATpDmx
	9KRu5vlx10cymkT13zFiiizl81u+yqea0fC2BPiwni09JhYIp6yFIQsp9cadEvXgB73nv1XqEtg0T
	5iFTPUdqByEaxbe2Yv08b3w5Lm4sX7P7p6wrUWCFAViyYNsKqXdg7/8epmxs7YCcLaFVZbfEx3VRP
	1HwMA8MEpy8s4jZNpeb2A1FGcHuEPm5B6vdO8/4yQi3SH2KyfI/iwEl24aBWPRQV/7DDNRAY65Ahd
	/bXAwa4PynMJMp9TVARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGhTz-008Ns6-UQ; Thu, 19 Aug 2021 12:49:19 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGhTt-008NqF-Q9; Thu, 19 Aug 2021 12:49:18 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 r38-20020a05683044a600b0051a2c6dd421so8575740otv.3; 
 Thu, 19 Aug 2021 05:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZNMlpd5elTsi6B8hZyA4f6ldMNMZe0l4iu+9KL9MAls=;
 b=DQ0LqqsuYy4ALAX1pIeEMjurfbVygnUb510zAOir2RW4qt+XCFWD6h2u0sXHR0qqLC
 3jIr1a0694TfMIUtOnujnZCod01zq6i2W/vv9sDly9CtN03wJAd67cmyn+oj+/laIJFW
 8x9sPPWt8fRs0CCmTvb+Q2AdsKgJfelIjUVrHrM3dcfTcigKGmZmhH2CF1vE6J5xObH2
 oiSehTeDuPeVCPiAI/QDpCi58RDDdYFiNRxa3NhtVMxaNd4suL5CMBdiwDPf37SjdKhs
 UycCk6OWTyNZsm+2RM/FXJMvNgUSMJIObAKBLmvFN4O2bPYC0SY1AMOvSNGTDQwZuztd
 Sfxg==
X-Gm-Message-State: AOAM53079/eQtnWv1mp/LpYkdu3EzsHcR2YkfbzR0f8w/yR/9+0cfkyJ
 sgZ+oVcAHLjHEufcwBGWoA==
X-Google-Smtp-Source: ABdhPJx3jDL4kYXzHNo10aYXPmecs8RlS3lgGSDuZYyaYvNJSUU0W1uDlCeC1BzxHjCr+IqeAl5AoA==
X-Received: by 2002:a05:6830:12c1:: with SMTP id
 a1mr12254350otq.231.1629377351101; 
 Thu, 19 Aug 2021 05:49:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n4sm555536ooe.10.2021.08.19.05.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:49:10 -0700 (PDT)
Received: (nullmailer pid 288208 invoked by uid 1000);
 Thu, 19 Aug 2021 12:49:09 -0000
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, acourbot@chromium.org,
 pihsun@chromium.org, daoyuan huang <daoyuan.huang@mediatek.com>,
 Rob Landley <rob@landley.net>, drinkcat@chromium.org,
 Maoguang Meng <maoguang.meng@mediatek.com>, sj.huang@mediatek.com,
 menghui.lin@mediatek.com, tfiga@chromium.org,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, hsinyi@google.com,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-mediatek@lists.infradead.org, ben.lok@mediatek.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210819070954.16679-4-moudy.ho@mediatek.com>
References: <20210819070954.16679-1-moudy.ho@mediatek.com>
 <20210819070954.16679-4-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date: Thu, 19 Aug 2021 07:49:09 -0500
Message-Id: <1629377349.142826.288207.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_054913_874996_5BCBE276 
X-CRM114-Status: GOOD (  14.37  )
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

On Thu, 19 Aug 2021 15:09:52 +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  58 +++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 241 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  66 +++++
>  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
>  5 files changed, 507 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.example.dts'
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
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 171, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 183, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml:  while scanning a block scalar
  in "<unicode string>", line 171, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 183, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518477

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
