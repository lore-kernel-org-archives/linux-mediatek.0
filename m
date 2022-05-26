Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B23C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICWMwv/6r9uaghXSSOysRzcOQTxX/3xaNbBThma3tEU=; b=gaf7J88MbTA4qp
	30psvFxIfUZNI1pJ69+1+TwdMn5/+C2PyV6a10ewizqw5eZu4cIRgtqW06elgHD9PUW2hNJkw95EG
	BmCIMCwELELAMn1BxbYhbkQKQ7sM/FjpSw292gJYg/ibTE3pp3c16qiXzpgYnUSufiygq8OmEabEq
	P4HUKDwEx0XjwDSgaqTl2ZBvHThY1iU1xJSjfEUmsR+esseu2XVLwfwpUtPfKaG/f5VueTlTFzYu5
	Ue8qyWhtjU8mFed3hSc+J1KusstewHLH4GLHmATT2lJ7U9BRar4DeTyvdLNGZQ09hBQG2vHfywux1
	2yzf0isMQwrEv7qxy7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBrl-00EgN3-Sn; Thu, 26 May 2022 11:41:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBra-00EgKX-Vi; Thu, 26 May 2022 11:41:12 +0000
X-UUID: 0b4090d1d9a24db9a621f812b4531e5c-20220526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BdCJJbAMpQnPohLI3AOUzz8OkkuQDgRLo28PoOdbz7g=;
	b=I+4lbrqDdW5L2eKl/+C9cJh8Y4KiJl+g+wh0zMSn4rgQB5w4r7Q8UE7qjFJE/61X5CC8/eXvoJkfsRnDhSYMDBr4Un8iz/88/zDaB0RIUmu6flc/xJkZ58GJA7ysxD0LNE0N8sR6wdXItFKgR1A45R8yLefCo4myByj4bNNxC6o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:1c7aeda3-d990-47c7-8827-8dcfc55089e5,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:67755ab8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 0b4090d1d9a24db9a621f812b4531e5c-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <qii.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2020681592; Thu, 26 May 2022 04:41:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 04:31:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 19:31:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 26 May 2022 19:31:01 +0800
Message-ID: <016ea54b7474b71f2995e4c3a10fe2d3efc2b641.camel@mediatek.com>
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
From: Qii Wang <qii.wang@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	<dan.carpenter@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Wolfram Sang" <wsa@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 26 May 2022 19:31:01 +0800
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_044111_069070_BD8FBE65 
X-CRM114-Status: GOOD (  12.24  )
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

On Sun, 2022-05-22 at 14:22 +0200, Christophe JAILLET wrote:
> The clsk are prepared, enabled, then disabled. So if an error occurs
> after
> the disable step, they are still prepared.
> 
> Add an error handling path to unprepare the clks in such a case, as
> already
> done in the .remove function.
> 
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid
> circular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
