Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLjj3O26DQ2eS/tTASUNiu1mW3D0IGeyaZvV4fiF4Ac=; b=I+GrAwbndjvE0xfFFhEeLWaplm
	n3TyRpndUphOSKsvCBAEWVsCwqGyM8EzDS3cNNRo9NbASe0y9ADajpeamZnYBb8XxCCL1Sy2wjOvr
	J+T4URFNUQ8/PBXgsPA+GvBNlDUvahyc8FuDv9/74R5FXCnnjwiGDrQPR7f3yvmkX2oJ+HaoO3Pld
	SHka7XN2j89cElg/Hq3WleT3HcVAqAEc4Nh3A8OrNWe2vwIwOigD9aODk3I9EOxGq4GeLWsmV3APt
	tt+LBAAmDKEyJpxY/MhIwM5hf/9nNE/zv1eWNbOfFWsBlNkrk5NNs318RQqdBDHn5A9eY+d2JFaAI
	T/gDf1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnNO-00Ce7R-Hg; Thu, 02 Dec 2021 14:47:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnMt-00CdtL-RL; Thu, 02 Dec 2021 14:47:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3555F1F42F85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638456445; bh=MUykvhec7Q+F9BL/7BZmg4/vwqFlvV1Za/LaHrYPEZQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=OdOE84s+zI270tgBwZnMRazDnisyZnQwxoeFE7beFmkgNIs0x0ZhtHuU5rUDkeMPt
 NR+KgZY1QdEMTQJ1uTwzm0pgKLh3VFbkbunMmFb1xLrVd5fY4QU2nO+k9xl6DxZujs
 NbELgg//hXI97t3vn/VZvcihXKe8JDeFoCBtfetrfgJguarGJbtLIhsG3h8esFxAkX
 EVHJYf2hPU5QvZMadNg+Puv/4NhDtnCzMO2q3CvqJZb8avNQREfbVQGO2N19ApFQ4b
 DrMMdQwZBprc3cjX6WDvLhVirLEACqf4H30xgPqYtJp7xrKRWD95x1WuI1Hfkiidol
 Lc44APz6aaUZA==
Subject: Re: [PATCH v3 8/9] media: platform: mtk-mdp3: support mt8195
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
 <20211022022146.3577-9-roy-cw.yeh@mediatek.com>
 <59d184c6-87ee-918c-b3cb-abb923c39912@collabora.com>
Message-ID: <f85f1433-00c6-20b9-8fe0-2ab1500f8520@collabora.com>
Date: Thu, 2 Dec 2021 15:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <59d184c6-87ee-918c-b3cb-abb923c39912@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_064728_102298_546FE08F 
X-CRM114-Status: GOOD (  12.18  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/10/21 10:58, AngeloGioacchino Del Regno ha scritto:
>> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>>
>> Add mt8195 driver
>>
>> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> =

> =

> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> =

> =

> =

>> ---
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |=A0=A0 24 +
>> =A0 .../media/platform/mtk-mdp3/mdp_reg_color.h=A0=A0 |=A0=A0 29 +
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h=A0 |=A0=A0 23 +
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |=A0=A0 31 +
>> =A0 .../media/platform/mtk-mdp3/mdp_reg_merge.h=A0=A0 |=A0=A0 23 +
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |=A0=A0 24 +
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |=A0=A0 20 +
>> =A0 .../media/platform/mtk-mdp3/mdp_reg_rdma.h=A0=A0=A0 |=A0=A0 31 +
>> =A0 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |=A0=A0=A0 6 +
>> =A0 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h=A0=A0 |=A0 114 ++
>> =A0 .../media/platform/mtk-mdp3/mdp_reg_wrot.h=A0=A0=A0 |=A0=A0 18 +
>> =A0 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |=A0 215 ++-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c=A0=A0 |=A0 496 ++++++-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c=A0=A0 | 1196 +++++++++++=
+++++-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h=A0=A0 |=A0=A0 83 +-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-core.c=A0=A0 |=A0 703 +++++++++-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-core.h=A0=A0 |=A0=A0 31 +-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c=A0=A0=A0 |=A0=A0=A0 4 +
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c=A0=A0 |=A0 143 +-
>> =A0 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h=A0=A0 |=A0=A0=A0 2 +
>> =A0 20 files changed, 3020 insertions(+), 196 deletions(-)
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
>> =A0 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
>>


Hello,
this patch doesn't apply anymore against the latest MDP3 driver series [1].

Can you please rebase ASAP?

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D588=
989

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
