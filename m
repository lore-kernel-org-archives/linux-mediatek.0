Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8FEC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72CEC61363
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72CEC61363
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jagCTZpTVyjX9pmBDlijyqZpZe+e2x4ZTiM+BKN+MOI=; b=0B/i5DTNaDhYrt
	Kat0gctOTlcAaSVEbeqXtF3OTIkpf5oI3fV7bMJgocHar+CvuKNGgKvI+T2oERUxszKc8q4//chvS
	33TUWZKA6hja27SlehDBPWy0gDCuVQohSl5qV2joqE9o1FgSekRs1n52RsSZlXdVcrqI6jHk3NXj8
	infydWVv8P9xmnNucBunJjJtCJiqiRX3Xwg6faETDwYTsjDf+rFPROlUdEU2LngJq4ihMPMuDzKr9
	Lo68Y0eGnstCuliRq7aHdhGNSNYhFwdRY0EeBqnXfDctiIdfW9o8iwLo3xPLMfUSSanvIWQM1crMN
	os5k08qc/kuUPpLsvLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ak3-00CoNt-JH; Wed, 14 Jul 2021 08:59:43 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ak0-00CoMV-23; Wed, 14 Jul 2021 08:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626253159;
 bh=2PfUJGsN5axf79lyK53KIfWRTeJoSiAoNWHeXAJAm5k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ABY8yG3fDvHwhdrriVKsu1KyjPfUEH6xW/YvrAHOvujzOyzGRKiy2dBPle0lASCBo
 FTWMIPLDMSj9FHlaeVcQrgMGGrer/+CivY/XZabcjrajrSEg47XuH1fqxYNRg+JEt2
 SiesIqzE1N5MQ+lQmUEQdMz5rxcbFOtjxgepeOng=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.136] ([217.61.152.136]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Wed, 14 Jul 2021
 10:59:18 +0200
MIME-Version: 1.0
Message-ID: <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
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
 iommu@lists.linux-foundation.org, yong.wu@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, Matthias
 Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Eizan
 Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
Subject: Aw: [PATCH v6 00/11] Clean up "mediatek,larb"
Date: Wed, 14 Jul 2021 10:59:18 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210714025626.5528-1-yong.wu@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:41hJo/XYrZUHIeMDY07beGhJR05vkLxAQITh9O1JknXiCDIPb9AnREzqsqzHICRgoA4aX
 +VAlF3wwHQHbYa/GGCgJhTDtD0i0iZcray5tchmyODDSQBszTPJ8Cg9gg9LgxbFhLS4m04MCLN53
 ePdYFNXzAkr1Xvyf64zJFgpHrtCx3fhmT3LqyYxoT0nRDwTxV6UVaYlwijr3k0aNzY44Q9GNsnWw
 Rl3go4EBz7ULxN81eHdqgXx4wZX5M3IQyIamHA+xF+0G23a388+8tJIl3y+MV5whXMki3Iq+biLW
 UE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:xahsKhf98lg=:Wfje5JxpoANcTNbcmTtKVK
 VQ+rHW0jjkDG7cM+BrzCqPqYP/W7Q1dk67RH/jENaakUoczFwa3fW3FrkGIkE8iEXSDP0y+iX
 Ldkppn4aANbjhSEDBEcwvT/JR4ia055MyjoHgIDw88+R+pZWLJS5VDabeYDqYbhwvTccliZyp
 5ZOuEK9y2I+3WEqlIALyq4H90JQRlgfv2JMXK56pxhm/7USMsR20jYWECfsusG0aKbfWKSz5l
 DweHDC9nwaC6TLxhY+erDIbE15qyYxQDlB3mCOEle1bWCQqyOpBxKxvqHPkumeUOCKawIEp+N
 wdipQ94TPhtjo1lRZS5NeaSPWtZb4TzF0NFu+y+MjaSaC9mfYnPsZ7fBDfdYIbpWV6mWQhsxD
 wLwxpA6JR7FJa8k18pWGpAdTza2yTr7xbLHQmSVtTQ6xb7z3THroUiIXpu9eKVDCgfVnNXN4k
 gXyfw7FdiODoTHjK2YhrS2kkJnqop7Ax4FkHKh6zy+U2b0n26wbcmU0Wfk40t5km0pwxw3f0q
 V4jMISUBOvceIBWVNxuZMPZoeeNJ/1lseOLpWgHlbK/WW6jpCTsRrH0JNTzxgM6S+e3jHL6IV
 qyt6ZSNcW2Itd4NQsDmMhdkCuz50nuyBKhtqniFkzqPf0W0aXDbpGcdmCtEm9oLaJ+QVfj2T0
 KXiq7AM4wtYtVBe7EGPLR23WdO5yz7fSX4QQl0Q5E8wUUwWSGuVT84nIwpQjI8mhzfj1ilUg9
 NEVw5SgEn/3reKMV4uhqInc6YYW6Lg5WwQCEP7w6nuVvmv4BZPcvE0PY02uVNxvYpTMQ79gVP
 w5SwTV/kfrKGrTloRp4qsuf31tzQ2KQVg0453IpWqKtLrpRlpM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_015940_422161_00993183 
X-CRM114-Status: UNSURE (   8.39  )
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

Hi,

sorry this (or the 2 depency-series) cause a NULL Pointer deref in iommu_group_remove_device on mt7623/bpi-r2

i wonder why on bootup a cleanup is run, but have no hint about this.

since "dts: mtk-mdp: remove mediatek, vpu property from primary MDP device" all is good, i guess problem comes up while removing larb with DT

this is backtrace

[    6.274465] PC is at iommu_group_remove_device+0x28/0x148
[    6.279877] LR is at iommu_release_device+0x4c/0x70

[    6.674347] Backtrace:
[    6.676797] [<c0c9c37c>] (iommu_group_remove_device) from [<c06bf028>] (iomm)
[    6.686221]  r7:00000000 r6:c06bf04c r5:c0d7a1ac r4:c21fc010
[    6.691883] [<c06befdc>] (iommu_release_device) from [<c06bf064>] (remove_io)
[    6.700689]  r5:00000000 r4:00000000
[    6.704265] [<c06bf04c>] (remove_iommu_group) from [<c0733434>] (bus_for_eac)
[    6.712725] [<c07333ac>] (bus_for_each_dev) from [<c06bf658>] (bus_set_iommu)
[    6.720753]  r6:c331f440 r5:c1406f58 r4:ffffffea
[    6.725370] [<c06bf5a0>] (bus_set_iommu) from [<c06c1e88>] (mtk_iommu_probe+)
[    6.733484]  r7:c32db0b8 r6:c21f9c00 r5:c331f1c0 r4:00000000
[    6.739145] [<c06c1bfc>] (mtk_iommu_probe) from [<c0738c14>] (platform_probe)
[    6.747176]  r10:c21f9c10 r9:c2496f54 r8:c14623b8 r7:c14623b8 r6:c1405b90 r50
[    6.755012]  r4:00000000
[    6.757544] [<c0738ba8>] (platform_probe) from [<c0735968>] (really_probe.pa)
[    6.766006]  r7:c14623b8 r6:c1405b90 r5:00000000 r4:c21f9c10
[    6.771667] [<c07358a0>] (really_probe.part.0) from [<c0735cec>] (really_pro)
[    6.779866]  r7:c21f9c10 r6:c2549e74 r5:c1405b90 r4:c21f9c10
[    6.785527] [<c0735ca4>] (really_probe) from [<c0735de0>] (__driver_probe_de)
[    6.793984]  r5:c1405b90 r4:c21f9c10
[    6.797560] [<c0735d30>] (__driver_probe_device) from [<c0735fa0>] (driver_p)
[    6.806543]  r9:c2496f54 r8:00000008 r7:c21f9c10 r6:c2549e74 r5:c14c6ec8 r4:4
[    6.814291] [<c0735f5c>] (driver_probe_device) from [<c0736410>] (__device_a)
[    6.823448]  r9:c2496f54 r8:00000000 r7:c21f9c10 r6:c2549e74 r5:c1405b90 r4:1
[    6.831196] [<c073635c>] (__device_attach_driver) from [<c0733540>] (bus_for)
[    6.840007]  r7:c14623b8 r6:c073635c r5:c2549e74 r4:00000000
[    6.845669] [<c07334ac>] (bus_for_each_drv) from [<c07357e8>] (__device_atta)
[    6.854044]  r6:00000001 r5:c21f9c54 r4:c21f9c10
[    6.858662] [<c07356e4>] (__device_attach) from [<c073662c>] (device_initial)
[    6.867207]  r6:c21f9c10 r5:c1406f58 r4:c1406ca0
[    6.871825] [<c0736610>] (device_initial_probe) from [<c07346dc>] (bus_probe)
[    6.880454] [<c0734648>] (bus_probe_device) from [<c0734cc8>] (deferred_prob)


bisect shows this commit as breaking:

Author: Yong Wu <yong.wu@mediatek.com>
Date:   Wed Jul 14 10:56:17 2021 +0800

    iommu/mediatek: Add probe_defer for smi-larb

    Prepare for adding device_link.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
