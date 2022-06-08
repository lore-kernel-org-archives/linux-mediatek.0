Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA29C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 02:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4A3s8ZJ9gBegF0WPYL3XPvnNP3XGsKTrJpqk4nF3pk=; b=LUF9ZPCp1uS0JX
	mG/nqrrQ/cFb6KRZ/5GnXj2Bji9xUqAZS711xJQe1u0oZSDEfB/cnVmiZeL8FDKod0wmv6uYMd9qE
	15ra/FQWnWs6qz3kPduedl+15dCSaRZO//gHIPP8OcAkZyf4zFuz+KFKEY1eFr9hUsFR0W5KXaqgU
	zmSD3c9PshfX5B6QLFtETIKlR5ZrP2pVyAtg1HgfKOE2fo60FsD/dXqiksUz/87kDubUHkfmWa3wM
	8ldeI+HyJ3eDjYJqncXZ/1boVZ2j2MtXSe6mRkC12mbYi3YiXvJBSzQw20qPnNw/opZEWPD9bhszV
	H7dVcH50E2HAalhn2FEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyl05-00AJoS-DJ; Wed, 08 Jun 2022 02:00:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nykzu-00AJmC-0l; Wed, 08 Jun 2022 02:00:39 +0000
X-UUID: 94895ded8c364498854673f9c9b209d5-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6cfacf11-7f69-4b19-81b8-ac803a80ace5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:dc9a8d7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 94895ded8c364498854673f9c9b209d5-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1622236678; Tue, 07 Jun 2022 19:00:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 18:54:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 09:54:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 09:54:33 +0800
Message-ID: <1a563a388e78e4eab4d1b9ae7b44f761b1e90865.camel@mediatek.com>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@linux.ie"
	<airlied@linux.ie>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "Nancy
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=" <Nancy.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, CK Hu
 =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Date: Wed, 8 Jun 2022 09:54:33 +0800
In-Reply-To: <20220607151119.GA3254370-robh@kernel.org>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
	 <20220606051131.14182-2-rex-bc.chen@mediatek.com>
	 <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
	 <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
	 <20220607151119.GA3254370-robh@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_190038_095883_CDF01C60 
X-CRM114-Status: GOOD (  28.16  )
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

On Tue, 2022-06-07 at 23:11 +0800, Rob Herring wrote:
> On Mon, Jun 06, 2022 at 09:30:42PM +0800, Rex-BC Chen wrote:
> > On Mon, 2022-06-06 at 20:53 +0800, Rob Herring wrote:
> > > On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> > > > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > > > 
> > > > Add vdosys1 RDMA definition.
> > > > 
> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > Reviewed-by: Krzysztof Kozlowski <
> > > > krzysztof.kozlowski@linaro.org>
> > > > Tested-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > ---
> > > >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88
> > > > +++++++++++++++++++
> > > >  1 file changed, 88 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp
> > > > -
> > > > rdma.yaml
> > > > 
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m
> > > dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/linux-dt-
> > > review/Documentation/devicetree/bindings/display/mediatek/mediate
> > > k,md
> > > p-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-
> > > vdo1-
> > > rdma'}] is not of type 'object', 'boolean'
> > > 	from schema $id: 
> > > 
https://urldefense.com/v3/__http://json-schema.org/draft-07/schema*__;Iw!!CTRNKA9wMg0ARbw!3hhZrSKSWnCN5Bha9laiHlB5JCx9_p-ksaYDZmoCLQRi1tI4KJCcTJQva2vds3j3bwKF$
> > >  
> > > /builds/robherring/linux-dt-
> > > review/Documentation/devicetree/bindings/display/mediatek/mediate
> > > k,md
> > > p-rdma.yaml: ignoring, error in schema: properties: compatible
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > > rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to
> > > match
> > > any schema with compatible: ['mediatek,mt8195-vdo1-rdma']
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > See https://patchwork.ozlabs.org/patch/
> > > 
> > > This check can fail if there are any dependencies. The base for a
> > > patch
> > > series is generally the most recent rc1.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the
> > > above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is
> > > up
> > > to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit.
> > > 
> > 
> > Hello Rob,
> > 
> > We found that if we write this, and the error will disapear:
> >  properties:
> >    compatible:
> > -    - const: mediatek,mt8195-vdo1-rdma
> > +    items:
> > +      - const: mediatek,mt8195-vdo1-rdma
> > 
> > But from Krzysztof's review[1], he adviced us to drop items.
> > 
> > Is there any suggsetion for this error or do we have any
> > misunderstanding?
> 
> The '-' is important.
> 
> compatible:
>   const: mediatek,mt8195-vdo1-rdma

Hello Rob,

Thanks for hint.
I will update this and resend.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
