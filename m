Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5RR5T524pV2F/sN+3N0ItzwBhnAnn3/OexJRolR/xA=; b=cGCUJ7I9Ma2LntiDlHMI+k9p3v
	omh34fMm+sVpNSWU7Wb/MSXd1jpFLOYBfzQVSvPGj8hCMOW7GkMHFEFtgcGZRj27kqV0Zpf9g2ohE
	ewu9EVbQ826z6vo0yK2LWvzFKPW6W/FWU4N54vtGXZCdyu7J94RUygmJRzOBF2Dl6xmKTeVk9PwkL
	/w7ZdFouWygMKRJjAU+Mf3fDSSipYNhxhoNxXg7CQZT2bLyKeWSHwSCoA90VwgCwP+lz0c8+sKXjO
	RZe1pg4K3WZQeYmcJEu/5bOMXLc7j64GjjdbnHZE20tHGByE61fiy0w8RtA119uZs39IuSJV2uge1
	AEnDRZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMhC-0084iT-5X; Wed, 01 Dec 2021 10:18:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMgy-0084fm-HO; Wed, 01 Dec 2021 10:18:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 39E9B1F457CA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638353901; bh=kEAk8XF0frwBFhSJkgeTipfqBQU8xnh/gkL1Zh/TtHQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PFIyyxcjqCPX5k8bM2OnskKnFA2y4ejJZeYAHovd3mnLPyhxianlnMKeJ0ylhwpNj
 5di9a4/njbq0aZWO7WLGKXfXPTYGKu2aCXOK6GvUsUlGUL7wJ4eq18lXFS0urNcpa/
 Lc61U6z6aRUocOBf92IOnPUL6hXamvDZCLaOq5cxFBCYOtCrwdShUCxmqp6L53sYMB
 SzaDTDl2TKKby9n0mhns0eVet2vTh/9UHyDEGvAd5x21g2z7aC+F9EqR1rTokSh480
 cuFhylTuVyug1LAvFge5c3Dh2SGNFScm4g6u3e2S1yd8obabDKTWtJZNMCI9bzufw0
 C/Xbvx3jays/w==
Subject: Re: [PATCH v9 0/7] media: mediatek: support mdp3 on mt8183 platform
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
References: <20211201095031.31606-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9a969056-7acc-92a6-a0a8-30d7044cea01@collabora.com>
Date: Wed, 1 Dec 2021 11:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211201095031.31606-1-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_021824_905499_D1D89092 
X-CRM114-Status: GOOD (  30.76  )
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

Il 01/12/21 10:50, Moudy Ho ha scritto:
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
> 
> Moudy Ho (7):
>    soc: mediatek: mmsys: add support for MDP
>    soc: mediatek: mmsys: add support for ISP control
>    soc: mediatek: mutex: add support for MDP
>    soc: mediatek: mutex: add functions that operate registers by CMDQ
>    dt-binding: mt8183: add Mediatek MDP3 dt-bindings
>    dts: arm64: mt8183: add Mediatek MDP3 nodes
>    media: platform: mtk-mdp3: add Mediatek MDP3 driver
> 

Hello Moudy,

I agree with your vision of mmsys and mutex patches being somewhat tied to the
MDP3 driver being present but, still, can you please split this series?

The reason for this is that the four patches related to mmsys and mutex are ok,
ready to be merged, and unlikely to get any other change during the development
of the MDP3 driver specifically.
Like that, we could at least start getting all the required base support upstream
and reduce the strain on you (and on reviewers) when releasing/rebasing any new
version of this series; this will consequently help raising the quality of this
work.

Regards,
- Angelo








_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
