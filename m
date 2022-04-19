Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A47C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRobKgVffcz3T5+AOsXDpEV+4E3u0A/28bOYkHtUDdY=; b=bTB+460rvOmzus
	u6VUx63+nvOJatWMW+kUcGALk1Ce1Ds4ug49VGQ4NoDWQgxz27iwzAFwhB10HUjskntZyA3fch5Ow
	GS1EuEimkF+Wa8HzmAB3IdTM+Kn7BVauXJecl9tY1rZ5gkHl94KYb9hGxkYDdinzgp4tJBhrq9UDA
	7XyMLnop2tZI//7O8U1MZ8UPwqNXWgs1YRq8/UOd+hi3LhD+g7Y4sKf5Bm0AhcYy0dLQZ3zvnDiwx
	C57ZeZx/2YTSfmUQfxkczrVByOy4eMvfX62T/gsNonwdCu8TVDVmY7NzN4Re91D9XhnoqC+kqxXIU
	nXebLy2R9tpiyEUHDnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoVQ-0047vK-35; Tue, 19 Apr 2022 14:07:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngo1R-003ttg-RX; Tue, 19 Apr 2022 13:36:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 49A6C1F418A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650375360;
 bh=ocUjKBQRtS1wz0vGDv2AACyasED2cCrcmqG1Y3gxn9Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ovZBUC+TjhSYlr3SJZPhoeAJGHEPCMNOCfvTxnh7nkSaZ0lFdYd92Xe9Hk/5R2737
 ketAtfvETvX1Tpbx6Ht9EynGNgbe5JSmbZtfPDexpX+IduqggrhOlIJFqjYLqltUCV
 Yz2air4Wr/Yr7fjhVhVU/IQnFUJiAqHM3QD4S1PdWiW41aBELzgap5Blu7Oo5oLVTq
 +V537Qup6qp2XXNQsvnbo8P41LINm8cZFQpfJIxDH92sg2Aje1uBpRBNxOEAgUDmck
 cUfqM/naWGJ/2G+h4+0+S8PQl5yjVVxk+HnWNsI5/J6TgMVVpjYNdhW2eNxd9fQg2F
 o8O5rASOxoGlQ==
Message-ID: <4743441e-b89d-966d-ef9a-d1c306416587@collabora.com>
Date: Tue, 19 Apr 2022 15:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v16 3/6] dt-bindings: soc: mediatek: move out common
 module from display folder
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220418083018.1907-1-moudy.ho@mediatek.com>
 <20220418083018.1907-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220418083018.1907-4-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_063602_154904_41006542 
X-CRM114-Status: UNSURE (   6.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/04/22 10:30, Moudy Ho ha scritto:
> In order to share the same hardware information with MDP3,
> change the MUTEX dt-binding to the path "soc/mediatek".
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
