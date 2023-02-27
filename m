Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057D6C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eY7yiys7COzp4kD+eaEygV3+8zds0XEzT6dHAeWHFRc=; b=XNEFVytBFxsqbH5NrgXT8Fxe2/
	uT2f0nd2coDRLDkiuK51dIP2lSVgtfrW/urmirAfWuQN4qXbV62uEkAD7UnFL+PCb0aAEEiGITuSM
	axVePuE3GcP+8NxB0pBFAH32vsBU3oeo+Qc+aMuopCaXEVyB+Xqo8GNNGsnASjeRbZIcEWii4IV1l
	XzsrPrvDnb1f8Gz3jgI1hihUdvSWEzaH8UI/Kgndp3f3sCHmolDcpCcB7CQScofejmRi2aYyLQhFA
	yA8MgJtwAVsleXQIkNdac/IrrCf/2pKkhLWq+NgKnHQ0jPFcfTE0dzyVY7DUCzs8XhAvw6FkMn0/0
	L547izww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWik1-00AqHY-BD; Mon, 27 Feb 2023 19:00:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWijy-00AqGF-Ei
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 19:00:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0DAF60DEA;
	Mon, 27 Feb 2023 19:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BBEC4339B;
	Mon, 27 Feb 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677524449;
	bh=HwzmljqOzuBkijMnmzBYp637A8GdPOQuvWFinajEoGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Do9qi4Aqw9yT2N03lqdKzOLbWdAURzY1FoAp85RpjLWWiUNFmwcZFsNkjamEhjjiy
	 L1hsDSeDKLojst44RoHt9eTsAgo90AHn1TB4lyQHVYbdkGE13GtLQ0DYB6OZP6jrt4
	 wOzJoBmRV+Zcgo3Wm7SkQUClpolLGIPWNc9aPlRLiDOeubhRhmv0VLsaO1ksVVH49V
	 ZjqqvszxmjLBEDywaQZ4OphWlyxyxfIWqw64e4Nfs0pf6+gAN0Uellj4fVREIPXO+R
	 lhd6lfglphM4od6+WExArZ7L0c28NNNzysn+lqYS6+RZI4FwZILQ/uw1YxxGu2RwGn
	 /4UaamGjQid3Q==
Date: Mon, 27 Feb 2023 11:00:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Yanchao Yang (=?UTF-8?B?5p2o5b2m6LaF?=)" <Yanchao.Yang@mediatek.com>
Cc: "Chris Feng (=?UTF-8?B?5Yav5L+d5p6X?=)" <Chris.Feng@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Mingliang Xu (=?UTF-8?B?5b6Q5piO5Lqu?=)" <mingliang.xu@mediatek.com>, "Min
 Dong (=?UTF-8?B?6JGj5pWP?=)" <min.dong@mediatek.com>, "linuxwwan@intel.com"
 <linuxwwan@intel.com>, "m.chetan.kumar@intel.com"
 <m.chetan.kumar@intel.com>, "Liang Lu (=?UTF-8?B?5ZCV5Lqu?=)"
 <liang.lu@mediatek.com>, "Haijun Liu (=?UTF-8?B?5YiY5rW35Yab?=)"
 <haijun.liu@mediatek.com>, "Haozhe Chang (=?UTF-8?B?5bi45rWp5ZOy?=)"
 <Haozhe.Chang@mediatek.com>, "Hua Yang (=?UTF-8?B?5p2o5Y2O?=)"
 <Hua.Yang@mediatek.com>, "ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
 "Xiayu Zhang (=?UTF-8?B?5byg5aSP5a6H?=)" <Xiayu.Zhang@mediatek.com>,
 "loic.poulain@linaro.org" <loic.poulain@linaro.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, "Ting
 Wang (=?UTF-8?B?546L5oy6?=)" <ting.wang@mediatek.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Aiden Wang (
 =?UTF-8?B?546L5ZKP6bqS?=)" <Aiden.Wang@mediatek.com>, "Felix Chen (
 =?UTF-8?B?6ZmI6Z2e?=)" <Felix.Chen@mediatek.com>, "Lambert Wang (
 =?UTF-8?B?546L5Lyf?=)" <Lambert.Wang@mediatek.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "Mingchuang Qiao (=?UTF-8?B?5LmU5piO6Zev?=)"
 <Mingchuang.Qiao@mediatek.com>, "Guohao Zhang (=?UTF-8?B?5byg5Zu96LGq?=)"
 <Guohao.Zhang@mediatek.com>
Subject: Re: [PATCH net-next v3 01/10] net: wwan: tmi: Add PCIe core
Message-ID: <20230227110047.224909ee@kernel.org>
In-Reply-To: <e7628b89847adda7d8302db91d48b3ff62245f43.camel@mediatek.com>
References: <20230211083732.193650-1-yanchao.yang@mediatek.com>
	<20230211083732.193650-2-yanchao.yang@mediatek.com>
	<20230214202229.50d07b89@kernel.org>
	<2e518c17bf54298a2108de75fcd35aaf2b3397d3.camel@mediatek.com>
	<d6f13d66a5ab0224f2ae424a0645d4cf29c2752b.camel@mediatek.com>
	<20230224115052.5bdcc54d@kernel.org>
	<e7628b89847adda7d8302db91d48b3ff62245f43.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_110050_587102_590F90E3 
X-CRM114-Status: GOOD (  12.91  )
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

On Mon, 27 Feb 2023 12:11:51 +0000 Yanchao Yang (=E6=9D=A8=E5=BD=A6=E8=B6=
=85) wrote:
> On Fri, 2023-02-24 at 11:50 -0800, Jakub Kicinski wrote:
> > Relative paths work, right?
> >  =20
> Okay. Change as follows, is that right?
> mtk_pci.h includes "mtk_dev.h",
> which is located in the parent folder.
> #include "../mtk_dev.h"
>=20
> mtk_fsm.c
> includes "mtk_reg.h", which is located in the child folder "pcie"
> #include "pcie/mtk_reg.h"

Yes, that's right.

> > > Any ideas or comments for this? Please help share it at your
> > > convenience. =20
> >=20
> > It's mandatory for new code. =20
> Okay. Change as follows, is that right?
> 	......
> 	ret =3D mtk_ctrl_init(mdev);
> 	if (ret)
> 		goto free_fsm;
> 	ret =3D mtk_data_init(mdev)
> 	if (ret)
> 		goto free_ctrl_plane;
>=20
> 	return 0;
> free_ctrl_plane:
>=20
> 	mtk_ctrl_exit(mdev);
> free_fsm:
> 	mtk_fsm_exit(mdev);
> exit:
> 	return ret;
> }

That's right, thanks!

