Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quFby8x/dv6egYHhj8U86YurD1KRcfo5OVmB4P0FMfw=; b=afxQpYL3kXnu0k
	ykuSZb9FlrZ4+7o9zPklwxE6Gmal1O107u/5yThUXLvXu6bjRGLVGP6TFwjAKM0QFR+4qa+5y8xll
	yE059mQcGX5jJimpfx21IyoysHV4c0zTzkORXH61PbQTsW1HSbuJMdNsRv2szPCMpFml+SgUFdrm9
	7ChBSc2ZE10X/qsSo2p97TFXMjvx4H7XePzch57ccpOXoFluuDRADPuN2KhI1lhYwhq9hm5w79YBa
	mxT4s3ryFV8SYpUWhiDHnA7BDU3n+vKTUxgOi/mz4iYWpO2VlfzakF/OUzipdDRKsGL6DOVuPTy8j
	uXmahdkvo38rUDWOqxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZa1-00AtFU-5C; Mon, 28 Feb 2022 06:32:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZZo-00AtCo-Im; Mon, 28 Feb 2022 06:32:09 +0000
X-UUID: 42012c9350ba4bc1883e7d843d164306-20220227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jLcDc7bXe4PFiEShcYy9OcXei2WSTRogHhT/GGeYfj8=; 
 b=RwbiX/rvChm/DeUsCrXyquaKAl7n0k/dXTvieTP4qY3+QXoSKzE3DAOm4+43GVcONNpkqznFg6v0AQ+37IbUh2VRa71rkgwAq8+W4ZazSZEp5v0umPTXweCyKP2BuRQByC//fEQ/Y4MM/1hzVsnpVFbI4BBnO/ewk5U2TRBSCys=;
X-UUID: 42012c9350ba4bc1883e7d843d164306-20220227
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875019372; Sun, 27 Feb 2022 23:31:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Feb 2022 22:31:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Feb 2022 14:31:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Feb 2022 14:31:41 +0800
Message-ID: <fda2da75dfb55c7349b8283ae7bf0260c71c4cc3.camel@mediatek.com>
Subject: Re: [PATCH v10,1/1] i2c: mediatek: modify bus speed calculation
 formula
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
 <yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>,
 <david-yh.chiu@mediatek.com>
Date: Mon, 28 Feb 2022 14:31:41 +0800
In-Reply-To: <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
References: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
 <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_223208_650780_102FB5F4 
X-CRM114-Status: UNSURE (   9.22  )
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

On Thu, 2022-02-17 at 20:22 +0800, Kewei Xu wrote:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 51
> +++++++++++++++++++++++++++++++++--------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
