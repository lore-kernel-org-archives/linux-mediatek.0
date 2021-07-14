Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3914BC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8076128C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8076128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COZ0SbbnirK8fO6sQ/PjQpwYglCeUG84QHnUMm8bxFI=; b=zAtuVMcvnonLsU
	ePZkAJpZWCp8JlCKgubcb/UnW7moVqPpJL3fg6kvMf80TcQBcHu1ylE0FCzZ3O/0VAA7zXKyj8hYM
	CwNEkv9Epqlb26ytM5PQ4UkaoqGP0vT3JuFRcj0/bK9oJ2orf+COtT2ez6ClZhECjpizPwhAh2jju
	U651J6cyzN4Ci4lT1NkHfhT79a0ixMoDbNGkpS3uirnzytdNpuIty2AW8790XmJEDW/rytuj5ttw2
	CxLFZUC3O6EmAhOUBMFPvX4knVNfs+33Ymw+gdb47mp6Xn+r7JL/ke/su5XpVXrvcS8hVuz7z1K4z
	8JuY+cPrfcXg+25iHhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3czc-00DLsi-Ay; Wed, 14 Jul 2021 11:23:56 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3czY-00DLpr-Pg; Wed, 14 Jul 2021 11:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626261811;
 bh=bRr42QOU3WxiGukaiKaQo9qQhX/uefmYG0L+VFBR0cY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MH7MDNZQYjkv/8bbwBkSy/dTHjnZEPLNjx58GhW9NiKHHaEhkZIBMgl+1jheOfYNx
 sjSLqyorceUCLaV+PPaVTyVLnTnuLOwvgbv9UIdtSSouT/ugGyPoD0cnAxEyO/tBby
 KIzRPQDofNHx0bvw8YjucC6+kgI+v0FtYHZpN/kY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.136] ([217.61.152.136]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Wed, 14 Jul 2021
 13:23:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-345a7606-49c0-417a-b40a-5ff156332354-1626261811356@3c-app-gmx-bs01>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel
 <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, Will
 Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 acourbot@chromium.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Eizan
 Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
Subject: Aw: Re:  [PATCH v6 00/11] Clean up "mediatek,larb"
Date: Wed, 14 Jul 2021 13:23:31 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1626261496.14352.16.camel@mhfsdcap03>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
 <1626261496.14352.16.camel@mhfsdcap03>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:C0a90b1taoG2cfcfP1pde1q2MNu5r1lIgwNvN5NXJS81Z6XyWAFZhMImid05bZKAZUc1Z
 fSbF+ihXoQ925TRhUh/2PryeQrkBTUM6JIUaLAvZhNfmBG35Ckp7hDn2PsC6SOkInfw03TSGwAnq
 QVkUFPFGffmEj3883aNhVDGijVAV0Dj7a1YKE2SJcV1ysSSD1b5nQ6xxg4LGX+ho7QSyvTaUSA5/
 VeO3HfkSU+3+B2YcXrhadx1ynHb86Y/11K6GLOIm5WEjhoUM5E0xij5biHeSELX8yOKYJratdjjD
 DA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZIjrERjTx0=:zO1GGiDuxmWNpY4kEGNX+H
 Qsmf9C4I97mAD+wP1pU8z1eVgOesso/R5WsIidAM5D5eoNM9Jq9vra+7B0hV+BiXqHlm/N2U8
 AU3rTTheff7I21iXOz3ILBB3bGN35C3B0KptIb4TN1MAOKfCNobq+RN/zUswYDl0kZ4eUR9c0
 tQGm/bjLfNmBpNJHquyGdQvZYZNq2DH8QApwTchWdAEnpNcF+KOpKXpYjySgkTnaBYwVj27pW
 nDbtsU5XednjYl88TCAk3MdLCU/njHPVEi8eLjrm12TvLdsgmyoYJgQ3BqBfit76+TcdTzEaj
 8oSosUKEC17F7PKZVCu360ZGcAfd7x+mFySyONxorqV3I0Ge29/VKMmQCUx6U4tGyE/tedka0
 RX/CBC10tyIElacx5U7+9OoA+hRzKwTS9LRYmixBzk4cXG/5G4+j5ljnyn57NrDQp9fuMGkwH
 vk4taR0w6XvN8s45fZ+qBA/Vzfq/o2D5Jnk1CrTsYwZRGO7EH3DubSJEKxu8Q/SfXw+yPfXD2
 QcYHX3vFQ95LjF+yBhj7MDkk83UPCbZujqhgGuzFULXV9/KpR40RKpwh37QTl0x+I283hMmgo
 yZjPMs8hjkNCjgYaF3X/Y6tG+n2TFGBWh36cu9O5iTbFSEXYKv0BUaEKLtwxiEUfLEYqFZeP1
 RGJafeHCi3VQkh24Z0kvP/wCasLOFs3jsuq2je+vhXaEdZJ9NeCB9D3wVis0CVRxceZ/6F0z+
 aWWCGUHZw8ekZPLQRrauLJKsPcMo3Awj4mlBI3ggYs1VbVrpwEBT98jdeIMoiUs72pausS9ap
 BJ1DOYDL0HTAvkX8qv8ayhDVShLTwcji0NvCJczKYjZbdxnY7c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_042353_301145_2A927A1F 
X-CRM114-Status: GOOD (  10.11  )
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

> Gesendet: Mittwoch, 14. Juli 2021 um 13:18 Uhr
> Von: "Yong Wu" <yong.wu@mediatek.com>
> Hi Frank,
>
> Thanks for your report. mt7623 use mtk_iommu_v1.c.
>
> I will try to reproduce this locally.

Hi,

as far as i have debugged it dev->iommu_group is NULL, so it crashes on first access (dev_info)

drivers/iommu/iommu.c:

 923 void iommu_group_remove_device(struct device *dev)
 924 {
 925 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 926     struct iommu_group *group = dev->iommu_group;
 927     struct group_device *tmp_device, *device = NULL;
 928
 929 printk(KERN_ALERT "DEBUG: Passed %s %d 0x%08x\n",__FUNCTION__,__LINE__,(unsigned int)group);
 930     dev_info(dev, "Removing from iommu group %d\n", group->id);


regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
