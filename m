Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 23:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgBDII4Aa39+4df6HmHJw1NqOHFRxSFyHFx9BaMkHgM=; b=r+wiF1ssSNmJI3
	H4Jn6P1KF4QpEXqXHs7Wz4Yfa2siuwZdH876Q3fQXD6a8NQa9pEj+NaPirdRAhs88tcEKIdIxUV6+
	9ewP/g9KG04wBnbslVLU02LHEGZEMKMjHSDWQxayR6FVeX3KkVeFDlbr6JZt+bwH2BTTpdIo3rUs8
	NgDqZM+2XJ5voDfUuv5gmvhMoW4QVfcRgEXUpHVk8vCDeozK5r2KjttpLi71xWrnRxJs89cC9zBfE
	xiqZthMG9RF7TDc2qMhKZ6vLYkwxHj0hAbg8zNzZSx7SIYwbjQtDTsbLYYK5QVIzW/h0DA7KDcO5T
	yiLOCqOC5GMHtHSx9/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUzbT-00Haol-Pf; Thu, 17 Mar 2022 23:32:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUzbR-00HanS-GI; Thu, 17 Mar 2022 23:32:22 +0000
X-UUID: 0fc2381e1440401998c60df8f556afe5-20220317
X-UUID: 0fc2381e1440401998c60df8f556afe5-20220317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1006713268; Thu, 17 Mar 2022 16:32:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 16:32:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 07:32:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 07:32:10 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <irui.wang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <acourbot@chromium.org>, <andrew-ct.chen@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
 <frkoenig@chromium.org>, <hsinyi@chromium.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <longfei.wang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <matthias.bgg@gmail.com>, <mchehab@kernel.org>, <robh+dt@kernel.org>,
 <srv_heupstream@mediatek.com>, <tfiga@google.com>,
 <tiffany.lin@mediatek.com>, <tzungbi@chromium.org>, <yong.wu@mediatek.com>,
 <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v3,
 03/10] dt-bindings: media: mtk-vcodec: Adds encoder cores dt-bindings
 for mt8195
Date: Fri, 18 Mar 2022 07:32:10 +0800
Message-ID: <20220317233210.6744-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220317082230.23622-4-irui.wang@mediatek.com>
References: <20220317082230.23622-4-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_163221_571178_396E5503 
X-CRM114-Status: UNSURE (   5.66  )
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

Hi Irui,

> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Encoder Accelerator With Multi Core

s/Mediatek/MediaTek/
> +
> +maintainers:
> +  - Irui Wang <irui.wang@mediatek.com>
> +
> +description: |
> +  Mediatek Video Encode is the video encode hardware present in Mediatek

s/Mediatek/MediaTek/

> +  SoCs which supports high resolution encoding functionalities. Required
> +  parent and child device node.
> +

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
