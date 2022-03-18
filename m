Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=464MQApI0YqgTpOGQWY5BbbtP9tWHALY7bYAhgAZnWg=; b=o0prmUq0kTYZ0x
	QxZUDG36c6eU5ov8E5OwoawNKkRAlJO1pQLmXvDeGfYKsFEje5PNpdTBrFXeUbGZhuyo/8kffHtaH
	9cu7zlx7H4l9sJiDZUzKaS/c49yKMSS0lI/r1CJOH8fOX1d/YicWbSO75eqE6NvNHksVpy7mao4T2
	3yNDSBzKo+YbbrawLb4K+FpHRCqRCWtO0h3wssq2p4KYjh80oH1VT33WnMaNx9SR+6e1LxCd0cqzr
	AyF7Uiyjf401SjdrG2N3rGpC2cvg4QzE3Jl3eEDzrhJYn9TeeeT7mLz/43mjW3lIut2B6epNBBocu
	gB/tg12rA/6TnkuQNhzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVMOm-00311I-1a; Fri, 18 Mar 2022 23:52:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVMOi-003106-BR; Fri, 18 Mar 2022 23:52:46 +0000
X-UUID: df9ec80b2478437eaa999befe8a37994-20220318
X-UUID: df9ec80b2478437eaa999befe8a37994-20220318
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1326054029; Fri, 18 Mar 2022 16:52:39 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 16:52:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 19 Mar 2022 07:52:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 19 Mar 2022 07:52:29 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <allen-kh.cheng@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <hui.liu@mediatek.com>,
 <krzysztof.kozlowski@canonical.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>
Subject: Re: [PATCH v4 10/22] arm64: dts: mt8192: Fix nor_flash status disable
 typo
Date: Sat, 19 Mar 2022 07:52:29 +0800
Message-ID: <20220318235229.8344-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
References: <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_165244_407423_C31466B0 
X-CRM114-Status: UNSURE (   5.89  )
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

> Correct nor_flash status disable typo of mt8192 SoC.
> 
> Fixes: d0a197a0d064a ("arm64: dts: mt8192: add nor_flash device node")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
