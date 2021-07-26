Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11256C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 04:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D1060F02
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 04:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3D1060F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywOR+hukvYFE9j1uPtQq2Q6m23uw/3YettHlCJr1F0M=; b=1uhVm9UGkuDHXf
	lgWAUZhVzyKTKj0xI3A/+QIWiYQaCPGjzrb4H9NzsVHx2jsRt1wzS6v8LE5h4LcbvOnjVIconhCIb
	c93+5IiINLst9YsVtMizadZMBlvsuqbqaWItsNuELPKZWNLp/4Y+l4R+1wRP090lOSyUm25OHJjgt
	U4MHvGZuDJ1Sq8ttKg/LgPm/y4GJDBJJEXHgmhmr7VUfyl/jH+tMpJVArHXJqx7oMIXaYjf6yo89d
	SDhOkp2FSKeQHsbBpQx1ThDRBuiSR+p1nJSpRaW95Z7hn719qeNcnJuxUArjyxUa0xZA74cvJ4E60
	a3BIrn4AdsrBGoCS5D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7rpp-009Wdj-4X; Mon, 26 Jul 2021 04:03:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7rpZ-009WYw-8T; Mon, 26 Jul 2021 04:03:08 +0000
X-UUID: 02be25c227c342798b13acef97b90126-20210725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1qkMfTfeNRmsWMXbQc8lB+Iu1NAA2I+IZkOV+hmaRlY=; 
 b=n3LrDrR5TA/du10LfUrjJS6LRF2AbbmsDlYs6yci5avcTsMEzYuafFJYAkARVdtdD6nvU+xm4G23ivt6tnGjG2x4SRREcFGeKSEWYFiBc9i0tJiRJlcWL867wE82lSiCcibUnvRdBQ2tuvz2598mlmmf2j8e9rrb1xkPWYCyCKg=;
X-UUID: 02be25c227c342798b13acef97b90126-20210725
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003427888; Sun, 25 Jul 2021 21:03:00 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 25 Jul 2021 21:02:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 12:02:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 12:02:57 +0800
Message-ID: <1627272177.27642.1.camel@mtksdaap41>
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: add
 force_dsi_end_without_null for dsi
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Date: Mon, 26 Jul 2021 12:02:57 +0800
In-Reply-To: <20210726021104.80007-2-jitao.shi@mediatek.com>
References: <20210726021104.80007-1-jitao.shi@mediatek.com>
 <20210726021104.80007-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_210305_343038_FAE82267 
X-CRM114-Status: GOOD (  17.43  )
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

Hi, Jitao:

On Mon, 2021-07-26 at 10:11 +0800, Jitao Shi wrote:
> Some bridge chip will shift screen when the dsi data does't ent at
> the same time in line.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index 8238a86686be..1c2f53f3ac3d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -19,6 +19,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
>  
> +Optional properties:
> +- force_dsi_end_without_null: Some bridge chip(ex. ANX7625) requires the
> +  packets on lanes aligned at the end.
> +

I think you should add this property in [1] because this limitation is
ANX7625's limitation.

[1]
Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml

Regards,
CK

>  MIPI TX Configuration Module
>  ============================
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
