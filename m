Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BECCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QM8kTgQ78W86iTeVKPs+BBG1wcSl/iwFT1aR26Wl6sc=; b=nnrPBuvs/HRPal
	NRzq7ATzP1OBKmhNWZJLOWQDlzLcTPSJb26UdznsZ7Sf4awjjeepTutPQj69dtOEMDGF7Jm4j+5YF
	DHtpDjPqJiX+AK2KHG6JFsDo5b7HLLuknf8aK1D4fcKHq3VUSEgYJ7j94a5rSf3VlgtCDShCGoQWc
	fZkJGU8ZChQgoHmqiIIW4QBeH+s04bIUdztfHjq+l6uGkjD4Kh+72UHIp+ROYZk0cd2lOdY9lry/D
	XxXcHv5+UM6x65CqD9lrMUJ7nx6KPnkWfqZHXUltmIyrXxisQIzwhJUUFGssbdzRXRrSYVKHAGheC
	cQ3eYFfJJq9RISm/DuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxnC-00E4IJ-J1; Wed, 08 Jun 2022 15:40:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxn0-00E4Cz-GY; Wed, 08 Jun 2022 15:40:12 +0000
X-UUID: 5e598e5df1dc47ee8dbb30c193f964e6-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6d240dd9-693a-4ba5-b612-dd8332f05cac,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:c4faaa7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 5e598e5df1dc47ee8dbb30c193f964e6-20220608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2082882921; Wed, 08 Jun 2022 08:40:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 08:40:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 23:40:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 23:40:00 +0800
Message-ID: <b9f62fe5e39d23d8ce64773814fbb9f5ba1a0a21.camel@mediatek.com>
Subject: Re: [RESEND v5 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nancy Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?= <Nancy.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "airlied@linux.ie"
	<airlied@linux.ie>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>
Date: Wed, 8 Jun 2022 23:40:00 +0800
In-Reply-To: <1654695907.376302.1272085.nullmailer@robh.at.kernel.org>
References: <20220608043852.4980-1-rex-bc.chen@mediatek.com>
	 <20220608043852.4980-4-rex-bc.chen@mediatek.com>
	 <1654695907.376302.1272085.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_084010_603333_A5F36009 
X-CRM114-Status: GOOD (  21.17  )
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

On Wed, 2022-06-08 at 21:45 +0800, Rob Herring wrote:
> On Wed, 08 Jun 2022 12:38:52 +0800, Bo-Chen Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,ethdr.yaml      | 188
> > ++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> > aml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dts:71.40-41 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:383:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1404: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
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

Hello Rob,

I am not sure why there is this error.
But from my running result: line 71 in mediatek,ethdr.example.dts is
"resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,"

This reset define is in previous patch of this series.
I don't know how to avoid this.

And I also just got this:
./Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
mple.dtb: hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295,
7, 16384, 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
45056, 4096, 4294967295, 7, 49152, 4096] is too long
        From schema:
./Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yam
l
./Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
mple.dtb: hdr-engine@1c114000: mediatek,gce-client-reg: [[4294967295,
7, 16384, 4096, 4294967295, 7,
20480, 4096, 4294967295, 7, 28672, 4096, 4294967295, 7, 36864, 4096,
4294967295, 7, 40960, 4096, 4294967295, 7, 45056, 4096, 4294967295, 7,
49152, 4096]] is too short
        From schema:
./Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yam
l

Is there any suggestion?

BRs,
Bo-Chen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
