Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 01:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q36HLHnIcF79vIrZO+d1DJaY9uq+GwjTJqq+csNgW0I=; b=0UdwOoKm0FV1D4
	XujnQE/tXJDe0oQ33Wm+8Xz8Thi4l1WE4xhjJ5WYpVNB5NP++lMedF3pnfnkKdRlIAHL8rKJHte3W
	PbXRR1gVrJE/godDFVIPIwL3yVXQrGlZb9rBpKMbViyMKzWxch+5pbzZywPVHW5Fsc1aSZnwPHCnt
	ZUPyprtsZUv9LOhhpGJIxXNJ+15bm+ENMA76S1j5D8aCASOBPr+XmrXfZ9wx1U5Y9EhidWLZrFa9i
	nKtyj4koSpQd2qFwlpqO0Q3qaLt9ua4Op4Fw3yslnfbvCMQEhduFn6p5QeqVzOITtbclk0nZo4Ip6
	BhAe+PEZDVFS1qgL8mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN2gG-00GQKH-1G; Thu, 24 Feb 2022 01:12:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN2g4-00GQHl-2s; Thu, 24 Feb 2022 01:12:17 +0000
X-UUID: 3595f895176f4514917db4462c8eb1a7-20220223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C+jjlCpNgcu/qaJ3D3pLT3r9IZ3AlKN5W6VS2lO3S60=; 
 b=SgNPgYLB/ID812O9QMFZ4RYCKRUhS0dut3jh1LJInP1DAai03m3k+jU1nUMClFSU1WLLj/Nm+cXE9lhuu0wIKkuZDN6oBPHQIrDtPNbZr6ApdQevUBH+1nBR8gEw2MUPrvC9LXOcWDi6JL9DJ3/OFqBOZpYaxDro+JJg/PN/db8=;
X-UUID: 3595f895176f4514917db4462c8eb1a7-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 698034227; Wed, 23 Feb 2022 18:12:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 17:12:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Feb 2022 09:12:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 09:12:08 +0800
Message-ID: <8450528ae5733893bfec64918534f0ae2ec70851.camel@mediatek.com>
Subject: Re: [2/2] mtk-vcodec: Support encoder for MT8186
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 24 Feb 2022 09:12:07 +0800
In-Reply-To: <4ed2a3b20a74fe1479d68ae81a8c7fe867f89114.camel@mediatek.com>
References: <1645617086-18841-1-git-send-email-kyrie.wu@mediatek.com>
 <1645617086-18841-3-git-send-email-kyrie.wu@mediatek.com>
 <4ed2a3b20a74fe1479d68ae81a8c7fe867f89114.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_171216_157258_FCADB907 
X-CRM114-Status: GOOD (  18.37  )
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

On Wed, 2022-02-23 at 20:37 +0800, Rex-BC Chen wrote:
> Hello Kyrie,
> 
> Why not just use compatible of mt8183?
> The data of 8186 is the same with 8183.
> 
> In this case, I think we just need to add dt-binding of 8186 and no
> need for this patch.
> 
> BRs,
> Rex

Hi Rex-BC,
MT8186 has same private data as MT8183, but has different compatible,
which is used to match device tree. So the new line is added for 8186.

> 
> On Wed, 2022-02-23 at 19:51 +0800, kyrie.wu wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > Adds MT8186's compatible "mediatek,mt8186-vcodec-enc".
> > Adds MT8186's device private data.
> > 
> > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 65207f5b6c1c..e1b91ae9a164 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -437,6 +437,7 @@ static const struct of_device_id
> > mtk_vcodec_enc_match[] = {
> >  	{.compatible = "mediatek,mt8183-vcodec-enc", .data =
> > &mt8183_pdata},
> >  	{.compatible = "mediatek,mt8192-vcodec-enc", .data =
> > &mt8192_pdata},
> >  	{.compatible = "mediatek,mt8195-vcodec-enc", .data =
> > &mt8195_pdata},
> > +	{.compatible = "mediatek,mt8186-vcodec-enc", .data =
> > &mt8183_pdata},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
