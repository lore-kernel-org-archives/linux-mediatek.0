Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1WBmdLjI1LTZuwLV3T/k+joRv6Wr6RetW4x/PNmAck=; b=L9y7CjMBlgeeqt
	5moA9JMtrzeeFRplND3CAJ73Wss6Avr8t0XbkK2x1wOJOz1e73JpbQVDgpxo+0yv2E0u1S7iYQRIN
	1fP+iSps0gx85YTBw4SBsZOyKo0oNdx8CZi4BIEm39J8mq8SPhbWFZLqWU7LUYw8YmYJByo7pOi2b
	aXnU9RI/CXeK6R5bXd5QudrsSMhr9xqulCnGAfpvt1c7tEEsSHU4ECV6EE2WCiLJyxiA3dJq9kjy5
	aH6n4TdYY0uabbTp9AM2rVk6CQeMWmnp5IQyRB3aPNXZzkkqeeibiTeb8vfK7c5qziFLlj1/pvM47
	r/tp1WQtlvj9TisNqwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJw3d-002Ya7-BA; Tue, 15 Feb 2022 11:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJw3Q-002YVX-CT; Tue, 15 Feb 2022 11:31:34 +0000
X-UUID: 12ba89be5ea24804912a395f9a5ecdb9-20220215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NZQxDhp3yucbO3uGyyYSpxHDWHcAFPAvUSgsqbW5dm4=; 
 b=YzwkQJFawD0H051NaXT9f9/n2yNIErmtnv/xFsR+M6100gSDkOued8YgRSeSWfGVvCoES4bdtHS56Byaod72i6++5Qe7smj7GzB/CzSNmvD1tZ7l/OX6tbenQpB51MpzGTJp8KMeVZ6N3Gi0LF1o4h4ceD1ZdcnUCfE1Uv6Ipjw=;
X-UUID: 12ba89be5ea24804912a395f9a5ecdb9-20220215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214268925; Tue, 15 Feb 2022 04:31:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 03:31:26 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Feb 2022 19:31:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 19:31:23 +0800
Message-ID: <f2bce3870b3eacce0c9bcdf5a022e11371a9ace4.camel@mediatek.com>
Subject: Re: [PATCH v2, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, <linux-media@vger.kernel.org>,
 <angelogioacchino.delregno@collabora.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 <linux-kernel@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>, Tomasz Figa
 <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 15 Feb 2022 19:31:23 +0800
In-Reply-To: <1642433742.919482.3923083.nullmailer@robh.at.kernel.org>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
 <20220117120615.21687-4-irui.wang@mediatek.com>
 <1642433742.919482.3923083.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_033132_458107_EB4B2766 
X-CRM114-Status: GOOD (  19.63  )
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

Dear Rob,

Many thanks for your comments.

On Mon, 2022-01-17 at 09:35 -0600, Rob Herring wrote:
> On Mon, 17 Jan 2022 20:06:08 +0800, Irui Wang wrote:
> > Adds encoder cores dt-bindings for mt8195
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-encoder-core.yaml   | 214
> > ++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > core.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> core.example.dts:20:18: fatal error: dt-bindings/memory/mt8195-
> memory-port.h: No such file or directory
>    20 |         #include <dt-bindings/memory/mt8195-memory-port.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:373:
> Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> core.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1413: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1580741
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

This new encoder yaml includes mt8195 iommu and power&clock node, so it
depends on patches:
iommu:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
power:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579

which are not accept yet. 

But IOMMU and power already send new version series patches, I will
rebase this series in next version.

Thanks
BRs
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
