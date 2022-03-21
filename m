Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A551CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 22:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH9Crx5Qp7wWIU7zCKv5NbHZ1uzzDUgr1XpjBYXjC6w=; b=d+Osk1CFFJ/Ppp
	R1kFPxGNDJU21oIokFe+dbY/y8CkRog2+qk04Lg04AlN/whLU7f412U2Nl128/ofgzPbciIOBZctx
	4pmNGmcYvQZLTyHWMOY2ufsTFIdaTaUQwnCQDKoIga2Rw+OD+dAaf8xn2byMZZEh58SiJt5slft/l
	wWBJ50mwiCwzkjboT1AfjbdJBKv7gBpuOH3qNEHKDnL8Ot4FavBDlcPr3fJNMVmy/MpeUIOX6nGL4
	DeEt7QIaXxf6Bqx7AhnRfTKt7/7QQ3n8z25GOzWv1Y+PC3pLOgxOX/qjys1njPy2D5PtjUBBdckNd
	/zJqkN12xrhdnncBPkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQW1-009Eu0-R3; Mon, 21 Mar 2022 22:28:41 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQVp-009ErW-Uq; Mon, 21 Mar 2022 22:28:31 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso7025131otd.6; 
 Mon, 21 Mar 2022 15:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P30I1IvBZVWzxnjjs8xKnvlDjjaGWLFseUJUE0t0iug=;
 b=KxFBuYaO13xE1iEvDyOBwNrIg7ysj0vE9+TAHeIRQfCV3B8Vd4t008duH+x/sjtBs1
 iCSk2g2txabK9vP1Qp3nICC/9lpj8256AkH0KlfxCPl9s4Zqp74Ev/8cuMugSpxy7Pc4
 V/DIAqq7DEyoNIzx4R3D4SG4YWR+7qFbxqzGWpKZelFfeT6RubmZ19MTMuehYAbout4D
 vgmmOkysZRUmOz0T9PkSqf1f08nCCWBNKjjqg+4Wk1cLuzAr9NLs06E43+QMoMe3JK2h
 Y1epy1vnPng1MC/vnOdMZDIcbK33zCZt8KebtCM1AYxk/RftYDPRnHGhisuisNeCMoxQ
 t3hQ==
X-Gm-Message-State: AOAM532oXbYVfY16PxYRGJhcM5rdVKLq/issQr9GKDdTq+RFYOVzbqzn
 BqQ4zKuCu56VA2JirU74YA==
X-Google-Smtp-Source: ABdhPJwhjaMdN3trRKuth/6PhzKCiyCDabep5R8B9rofsON9bTADl679fotxe+oPsBcjqvQOnCb4+Q==
X-Received: by 2002:a9d:7994:0:b0:5b2:3110:e69c with SMTP id
 h20-20020a9d7994000000b005b23110e69cmr8812492otm.267.1647901708497; 
 Mon, 21 Mar 2022 15:28:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g8-20020acab608000000b002ecf38fb699sm8030714oif.38.2022.03.21.15.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 15:28:27 -0700 (PDT)
Received: (nullmailer pid 653541 invoked by uid 1000);
 Mon, 21 Mar 2022 22:28:25 -0000
Date: Mon, 21 Mar 2022 17:28:25 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, tfiga@chromium.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 jason-jh.lin@mediatek.com, river.cheng@mediatek.com, 
 linux-kernel@vger.kernel.org, roy-cw.yeh@mediatek.com, 
 srv_heupstream@mediatek.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 pihsun@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 hsinyi@google.com, linux-arm-kernel@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>, randy.wu@mediatek.com, 
 Geert Uytterhoeven <geert+renesas@glider.be>, allen-kh.cheng@mediatek.com, 
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, 
 drinkcat@chromium.org, menghui.lin@mediatek.com, 
 Alexandre Courbot <acourbot@chromium.org>, Rob Landley <rob@landley.net>
Subject: Re: [PATCH v14 3/6] dt-bindings: soc: mediatek: move out common
 module from display folder
Message-ID: <Yjj8CanzmdHeX7qz@robh.at.kernel.org>
References: <20220317143926.15835-1-moudy.ho@mediatek.com>
 <20220317143926.15835-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317143926.15835-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_152830_018503_DD1141F2 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 17 Mar 2022 22:39:23 +0800, Moudy Ho wrote:
> In order to share the same hardware information with MDP3,
> change the MUTEX dt-binding to the path "soc/mediatek".
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/{display => soc}/mediatek/mediatek,mutex.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (97%)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
