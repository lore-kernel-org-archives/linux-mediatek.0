Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA5CC19F2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 02:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLXRd+5n/C4jd/IFfhxdX0ToHitHv8rhm+XFVzvPlao=; b=ZTCVWA7gqNu6y3Sv2vZJk4lnri
	cgd2D5Hfxi1QxcqwH1zFgpZwfG3JMJPLdNFGTm5sbU86GMJVvs/NjPGOEXECVx4PlwKvc++uzZz7F
	rKH1watjpbNoytMLpvpnX1oXZgUZSALxf+YW4MzpaxPvK6PEFUAhGDh1LWtJuIW9iAUhE9nEimzjN
	rZmyDzr28xCt9WJGF8FmHihJuv1YCg5jz3fjfLWA5XM5Cuc4vHiA0t4N8QwChrFoClbs5/iDmumv9
	Q5jidsQMyinubK2oV7CTxIMNQlrBoxbLaPoEvn8lSn+2bhTK5srq5S+y94ANrLHd84sxBdwKsNSzU
	pgHO5ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKsxJ-008Hts-D9; Mon, 08 Aug 2022 02:57:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKrp4-007hde-18; Mon, 08 Aug 2022 01:44:51 +0000
X-UUID: e6298e07c42544a9bccfaaf8eb36c51a-20220807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:01f70402-1d8c-4dd9-a489-1999618b5157,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:12,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:17
X-CID-META: VersionHash:0f94e32,CLOUDID:2767029c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e6298e07c42544a9bccfaaf8eb36c51a-20220807
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <qii.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1422669834; Sun, 07 Aug 2022 18:44:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 09:44:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Aug 2022 09:44:25 +0800
Message-ID: <1063819a7cf61e8654cf0f7f54dba115ec714209.camel@mediatek.com>
Subject: Re: [PATCH v5 2/2] i2c: mediatek: add i2c compatible for MT8188
From: Qii Wang <qii.wang@mediatek.com>
To: <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
	<yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>,
	<david-yh.chiu@mediatek.com>
Date: Mon, 8 Aug 2022 09:44:24 +0800
In-Reply-To: <20220806100249.12375-2-kewei.xu@mediatek.com>
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
	 <20220806100249.12375-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_184450_127960_437C8F0F 
X-CRM114-Status: GOOD (  14.43  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2022-08-06 at 18:02 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add i2c compatible for MT8188 and added mt_i2c_regs_v3[], since
> MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> v5: modify the order of mt_i2c_regs_v3[] members and add Reviewed-by
> owner.
> v4: no changes
> V3: no changes
> V2: added mt_i2c_regs_v3[] to replace slave_addr_version.
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 43
> +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..bd8abba3d1c9 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
>  	[OFFSET_DCM_EN] = 0xf88,
>  };
>  


