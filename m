Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37214C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 02:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F4D6135D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 02:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5F4D6135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qUafRnrnaByQfEDI5FlcsQIINMEt1/6NgLgxaTTq2oI=; b=J36MoG0yIbhmImspr4bRUKIjoi
	fDep77WtSZm+UG2p46Ib09UxQXYnHVziwR6q9bd0xvq/EC5gO7YGQ5fF3kWC14vErDjl0UKIX6AYg
	ASouIOFLZIxt43h2L0VSEp9N40EOjMSXwjDV+QRy8vsgUDdFX9cb7OA0QsylThy9wEY0m0/AdujRX
	QpJ9MjlO2nf/jZO8M6KaWjt8lPCrKWYL+anziGZNGPfOscemzgHxK6zc7MvndmLSw/9J8Ay4+1TWa
	q2nEAmvIfQaL7QC/MDjfy94dYzuy/IVvTzEprcLpTTp5+PKjv46RzxJMVT/+QnEjPsg1jB73J2bz0
	pGuXP6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0Ac-00FEMW-Ga; Mon, 23 Aug 2021 02:58:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0AU-00FEKo-RX; Mon, 23 Aug 2021 02:58:41 +0000
X-UUID: 95175ebde3f740d0bba03388e6ecdf17-20210822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Date:MIME-Version:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID;
 bh=0EAOtq/TVWqYqnui7ygOJdii1eUyO1hhZQHSE3h6Mug=; 
 b=BgF1N15VXUSDtzDIUmSIxXYR/ywQBQU04cSB1lSCjb09Aetj1VAqwaQoFXr8vRt6dVJ8DgNxjfHYco2joZkK7n7h7w80HDI1m2wTjPwFhsxXcGxzDH+1Zc9jk0xkCBNxp4C8UltdekT+uTGgm9VMfdjeGoKEEMKIIZJgC5u34oU=;
X-UUID: 95175ebde3f740d0bba03388e6ecdf17-20210822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 383066662; Sun, 22 Aug 2021 19:58:31 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Aug 2021 19:58:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 10:58:28 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 10:58:28 +0800
Message-ID: <63dfd3b3bf0bba7cd87f41d278ae52cae42d8481.camel@mediatek.com>
Subject: Re: [PATCH v6 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From: moudy.ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <devicetree@vger.kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, daoyuan huang <daoyuan.huang@mediatek.com>, "Rob
 Landley" <rob@landley.net>, <drinkcat@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>,
 <menghui.lin@mediatek.com>, <tfiga@chromium.org>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, <hsinyi@google.com>, Rob Herring
 <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>, Jernej Skrabec
 <jernej.skrabec@siol.net>, <linux-mediatek@lists.infradead.org>,
 <ben.lok@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <1629377349.142826.288207.nullmailer@robh.at.kernel.org>
References: <20210819070954.16679-1-moudy.ho@mediatek.com>
 <20210819070954.16679-4-moudy.ho@mediatek.com>
 <1629377349.142826.288207.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Aug 2021 10:32:43 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_195836_353023_0F8CA9A7 
X-CRM114-Status: GOOD (  20.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-08-19 at 07:49 -0500, Rob Herring wrote:
> On Thu, 19 Aug 2021 15:09:52 +0800, Moudy Ho wrote:
> > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > a unit in multimedia system used for scaling and color format
> > convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  58 +++++
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 241
> > ++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  66 +++++
> >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> >  5 files changed, 507 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > 
Sorry for missing a space on line:183 of the file "mediatek,mdp3-
rdma.yaml " caused an alignment error that make "dt_binding_check"
fail.
It will be fixed in the further.
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file
> 'Documentation/devicetree/bindings/media/mediatek,mdp3-
> rdma.example.dts'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py",
> line 434, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-
> packages/ruamel/yaml/constructor.py", line 120, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in
> _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in
> _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in
> _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in
> _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 773, in
> _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 848, in
> _ruamel_yaml.CParser._compose_sequence_node
>   File "_ruamel_yaml.pyx", line 904, in
> _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: while scanning a block scalar
>   in "<unicode string>", line 171, column 5
> found a tab character where an indentation space is expected
>   in "<unicode string>", line 183, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20:
> Documentation/devicetree/bindings/media/mediatek,mdp3-
> rdma.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/media/mediatek,mdp3-
> rdma.yaml:  while scanning a block scalar
>   in "<unicode string>", line 171, column 5
> found a tab character where an indentation space is expected
>   in "<unicode string>", line 183, column 1
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/mediatek,mdp3-
> rdma.yaml: ignoring, error parsing file
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> make: *** [Makefile:1419: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1518477__;!!CTRNKA9wMg0ARbw!2av75m5eJ2hSjFAgkXmPi-gQOv7ITc4RcVm1365xi_QcwQlFdg7oYQsw4pZf2ft_$
>  
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
