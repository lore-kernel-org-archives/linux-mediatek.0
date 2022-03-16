Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgO5Pebnxa5PuajTVxaIlnROe+HzKNQ6/WAMMNwJDI4=; b=mOUK1OoYEajNft
	Ad5Vl4wOKoLl955/ZyNsOyFdGzYvvuiYQeewkpw4ttNTA5ZMzlps6g7NT6HF9xcWOAEm3LIieQ3r0
	khsaIqwcxuz8dlVdmN5e89ORO45QJuWVAna9VRYSsrPUsp3lvUUgEMc4AcvmJMNunVnuWlwTZ2aXv
	QbPvB8+fzThUtbV9EUa+KJz2cHG12gGDY/RGrAk648Gn0h3eaAUMwIVirc8/we9R6QDR3/D33QGlN
	oesl6LLo0mfi6JZ3amLoxkTE7Q1ARZP6R/wtspN5ekhDAVtPfspAtY5dpWvEQu/wpLNzluIqTdkhV
	qEHvV5s0wha1YbMPWj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUP8l-00C8mr-7p; Wed, 16 Mar 2022 08:36:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUP8U-00C8iR-6h; Wed, 16 Mar 2022 08:36:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EFC5B1F42B80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647419760;
 bh=efJeF6dJBeqxwFUqrdFttfn3nFeJx5A/SlouGiahdVs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I4ANDCEjwel37JTQn85VKIWejFYOpyQ5k4f5gxx8UpCivaB4pcanORinaev9dBjN/
 5x4jXs0nGSy1KyAbqbwM+LMileTZEeTh2gUVZHbwJ6IytFNfV9XnUlVo0pD9IcAapl
 sD73bvhIEs8AiyWZPFmh5TvrXFBcGdbq2LAEgn+5Uli4H9z6DO5/kz8nW6nhJo2/6L
 wTPA0/LwuXnlUBTWX0VO2gqvRlABO9+n3qLIsQpqm3hopPpi2KranGBQTq2sGMwNvj
 dcNniQhl0bV0aTz5ZjSi1J4FA9E2BWWPzRQ6pfWWeOZl6XqgWEvj1zCMjJZQzrYnOi
 11/z8ZMpkPUlQ==
Message-ID: <fb2f47a9-49ca-b7d1-64a3-c1bada0519f5@collabora.com>
Date: Wed, 16 Mar 2022 09:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v11 0/3] media: mediatek: support mdp3 on mt8183 platform
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20220105093758.6850-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220105093758.6850-1-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013602_591729_6E2652DC 
X-CRM114-Status: GOOD (  30.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/01/22 10:37, Moudy Ho ha scritto:
> Change since v10:
> - The routing table needs to be discarded, and the calculation result
>    on the SCP side is used to write a suitable mux setting for
>    1 input port and 2 output ports.
> - Adjust dts parsing flow to remove redundant HW IDs.
> - Fix memory leak caused by no free path information in function "mdp_cmdq_send".
> 
> Change since v9:
> - Keep only the MDP3 driver patches and split the remaining mmsys and
>    mutex patches into another mail.
> - Move mutex mod settings to corresponding driver and make relevant adjustments
>    for this in MDP3 driver.
> - Fix compile warning reported by kernel test robot.
> 
> Change since v8:
> - Rebase on v5.16-rc2.
> - Refer to Angelo's suggestion, adjust the register writing format to increase
>    readability and significance.
> - Refer to Angelo's suggestion, adjust or reduce inappropriate debugging
>    messages.
> - Refer to Rob Herring's suggestion to correct the the binding file
>    to make it with the specification.
> - Fix compile warning reported by kernel test robot.
> 
> Change since v7:
> - Rebase on v5.15-rc6.
> - Revise several V4L2 M2M settings to pass v4l2-compliance test.
> - Integrate those same component dt-binding documents of DRM and MDP, and
>    move them under the MMSYS domain.
> - Split MMSYS and MUTEX into two different files according to
>    their functional properties.
> 
> Changes since v6:
> - Refactor GCE event to corresponding node.
> - Fix dt_binding_check fail.
> - Fix compilation errors.
> 
> Changes since v5:
> - Rebase on v5.14-rc6.
> - Move MMSYS/Mutex settings to corresponding driver.
> - Revise the software license description and copyright.
> - Remove unnecessary enum. or definitions.
> - Optimize platform/chip definition conditions.
> - Use general printing functions instead of MDP3 private ones.
> - Fix compile warning.
> 
> Changes since v4:
> - Rebase on v5.13-rc1.
> - Remove the CMDQ flush flow to match the CMDQ API change.
> - Integrate four of MDP's direct-link subcomponents into MDP controller node
>    from syscon node to avoid illegal clock usage.
> - Rewrite dt-binding in a JSON compatible subset of YAML
> - Fix a bit of macro argument precedence.
> 
> Changes since v3:
> - Rebase on v5.9-rc1.
> - modify code for review comment from Rob Herring, cancel multiple nodes using
>    same register base situation.
> - control IOMMU port through pm runtime get/put to DMA components' device.
> - SCP(VPU) driver revision.
> - stop queuing jobs(remove flush_workqueue()) after mdp_m2m_release().
> - add computation of plane address with data_offset.
> - fix scale ratio check issue.
> - add default v4l2_format setting.
> 
> Changes since v2:
> - modify code for review comment from Tomasz Figa & Alexandre Courbot
> - review comment from Rob Herring will offer code revision in v4, due to
>    it's related to device node modification, will need to modify code
>    architecture
> 
> Changes since v1:
> - modify code for CMDQ v3 API support
> - EC ipi cmd migration
> - fix compliance test fail item (m2m cmd with -f) due to there is two problem in runing all format(-f) cmd:
> 1. out of memory before test complete
>          Due to capture buffer mmap (refcount + 1) after reqbuf but seems
>          no corresponding munmap called before device close.
>          There are total 12XX items(formats) in format test and each format
>          alloc 8 capture/output buffers.
> 2. unceasingly captureBufs() (randomly)
>          Seems the break statement didn't catch the count == 0 situation:
>          In v4l2-test-buffers.cpp, function: captureBufs()
>                          ...
>                          count--;
>                          if (!node->is_m2m && !count)
>                                  break;
>          Log is as attachment
> 
> I will paste the test result with problem part in another e-mail
> 
> Hi,
> 
> This is the first version of RFC patch for Media Data Path 3 (MDP3),
> MDP3 is used for scaling and color format conversion.
> support using GCE to write register in critical time limitation.
> support V4L2 m2m device control.
> 
> Moudy Ho (3):
>    dt-binding: mt8183: add Mediatek MDP3 dt-bindings
>    dts: arm64: mt8183: add Mediatek MDP3 nodes
>    media: platform: mtk-mdp3: add Mediatek MDP3 driver
> 

Hello Moudy,

In next-20220315, all MediaTek media drivers have been moved in a different
subdirectory. Now they are all in drivers/media/platform/mediatek/.

Can you please rebase this series, placing the MDP3 driver in
drivers/media/platform/mediatek/mdp3 ?

While at it, also please include the additional documentation and address the
rdma/rsz (etc) suggestions about using one compatible and a instance-id property
to express the multiple instances (remember: "mediatek,mt8183-mdp3-rdma",
mediatek,instance-id = <0>).... and all the other constructive suggestions that
were given during the extensive review of patch 1/3 of this series.

Looking forward to see a new version!

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
