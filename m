Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B50EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MIAGwf8uizaOzugeTwYfvAnU62doPkTAJCzhxj7ylY=; b=X48sAoJgm4BL51
	SrQ+8PSoADHkijmcPH0Ja5GEcnVGjhhn/xIqPA4r7BjA9iQN1H5GzBA49CMA7KlZc/GCziomYqbmx
	+dJ3cc1qQ5Tt8JN5DW6MB97H3IGQhXoTIUOD+KLrmqqalkP0SBhjnaMQ2ShPzy4M8MyhfDi/axSDE
	C5T4AVRl9nHj6LYO8nAw6n7DXxUfLdN8/Cr5rnezecbfrGBETTAFpGf7Wo4VMNQ1dccn+hh1yF9YG
	jQ/MxHgxGhJoZI+Ep/TMKL/sNgqQgj+fqqIDyCTwkpt12zPKAKBFbtQVS3JQpocpFGH8B7EdosFLe
	6z5MMo8jIMwRaVA/J/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkwId-00F90S-45; Sat, 30 Apr 2022 23:14:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkwIQ-00F8z0-VV; Sat, 30 Apr 2022 23:14:41 +0000
X-UUID: 02de41a3819d47a8bc405864b5c74a9f-20220430
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8ec4bcce-052d-4440-9621-432c21f909dd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2fdb12c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 02de41a3819d47a8bc405864b5c74a9f-20220430
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2075485794; Sat, 30 Apr 2022 16:14:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Apr 2022 16:14:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 1 May 2022 07:14:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 1 May 2022 07:14:27 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <matthias.bgg@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <angelogioacchino.delregno@collabora.com>, 
 <chun-jie.chen@mediatek.com>, <ikjn@chromium.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>, <robh+dt@kernel.org>,
 <sboyd@kernel.org>, <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: Delete MT8192 msdc gate
Date: Sun, 1 May 2022 07:14:27 +0800
Message-ID: <20220430231427.3328-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220429123133.28869-3-matthias.bgg@kernel.org>
References: <20220429123133.28869-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_161439_053843_6E9590F6 
X-CRM114-Status: UNSURE (   6.99  )
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

> The msdc gate is part of the MMC driver. Delete the not used code.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
