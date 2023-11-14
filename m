Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7FFin8rpFrowu9bWACjUo3oZH7qAEuMvwUzNC7+1D4=; b=Ptq+DfYPE0Xm4RIxuEvfxhb4qB
	aR/221/Kf3dZao+OCG/Spo5W6M059xI4qAnduWaVytdvZVHBFIWvCAQZ+bUGboG9deNKdqyS8FykX
	sn+0F4SiQIIESEuyYiL1N5cZMrn987Iulh82sX3CaQ8G8CGNWv/O6vXGfbsYqnz3qKv+fN94lBZCh
	na0SiD0C0f77eV1h2IdJoYBLPlZY+NgFu2iPPmXtiyzrWSVTNh6HFVIZaGh2Y7wi8ZQwi1rh3EjHh
	ZywIqsMlESnT+4zvZg9gLo/hrwneG4S1soT8riGuYLPs9FT2X0YU2Z2LAHKWnrCNln4LLgzAafTUY
	FfKGU21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2phS-00FVI4-1v;
	Tue, 14 Nov 2023 09:27:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2phO-00FVFn-1y;
	Tue, 14 Nov 2023 09:27:12 +0000
X-UUID: f85c1d3282cf11ee86758d4a7c00f3a0-20231114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=S7FFin8rpFrowu9bWACjUo3oZH7qAEuMvwUzNC7+1D4=;
	b=qEJVC4vNBskrUUDtTk6U6efQShJbpBXOCG0B4xsY0hD3osaRE34700lO17QJz9LBQJBWFqsyc+m32njnLOvx8eeMji1B0Ucmo1Em2JtZQb1OwLNWORK/SdDMlbnMU5CjwPnj3KXr2e0r1GgnpacRarGjwrImgxcPjsRI18RzaKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:41167f03-1ea8-4d9d-8d88-4486570eaea8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:a6076095-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f85c1d3282cf11ee86758d4a7c00f3a0-20231114
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 401793198; Tue, 14 Nov 2023 02:27:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 14 Nov 2023 17:16:59 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 14 Nov 2023 17:16:50 +0800
Message-ID: <a6268eb1-0136-7d13-5aae-f8e2a864f090@mediatek.com>
Date: Tue, 14 Nov 2023 17:16:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Content-Language: en-US
To: Stuart Lee <stuart.lee@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Lancelot Wu
	<lancelot.wu@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>, <stable@vger.kernel.org>, Bear.Wang
	<bear.wang@mediatek.com>
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
 <20231110012914.14884-2-stuart.lee@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.518000-8.000000
X-TMASE-MatchedRID: fE0JoqABJp06yy6RAAEPcya1MaKuob8PC/ExpXrHizz8rSaNLblw6tno
	quRwHY3Bj7Wc8+5sjRThpAulFEAvQ/+rTYoF7KeerK1919cGzDIrHkgIan9a0Wd6vNuG6Cqy0pM
	6y4hp8eqORmg3vGx7V9sIe/TXUbL1kKjL2IOi2LAVglQa/gMvfJdPjWZp9Ce4W+jwVKpqvlKW1/
	3TtIf0zi6l7Me4lYYaavSkNIv6dWMC8/gH0ZUaBws9VkfCh3uAkKAa/khZ3iSM2ehTV+imixSli
	qFp8m5g80gC5XNpZoW7thdnLNxB1Ea2DXGqwZmfDOL14/DRHdBA8JZETQujwvt592eq2xoT8R2R
	sKRNAl3KcczIzww8nRoRu3pmdZfHok7b0Yft8KGeAiCmPx4NwLTrdaH1ZWqC1B0Hk1Q1KyLgfCf
	WlnNb/1cppCzPq+1Uymsk/wUE4hpizLd1CYz0L/CAl/12j+ZfYQi/5pFZJQ2XgQHfq3IbwLkmA0
	dUQbLZPYY2Oko2eT6jXcTK0di+6+7BuoRxOBASO0Hxo74EaE+uqM9Je4eg9TjEr02BXMZhzb1EI
	PuPmESrQbSvtjL8dVIwYPm973ce
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.518000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0BC2E4DADE089477D0E3BDFE917D5AC397BF7328650D6F38882ADC7E086DB5162000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_012710_664029_FE1E66EA 
X-CRM114-Status: GOOD (  21.62  )
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

On 11/10/23 09:29, Stuart Lee wrote:
> Add error handling to check NULL input in
> mtk_drm_crtc_dma_dev_get function.
> 
> While display path is not configured correctly, none of crtc is
> established. So the caller of mtk_drm_crtc_dma_dev_get may pass
> input parameter *crtc as NULL, Which may cause coredump when
> we try to get the container of NULL pointer.
> 
> Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
> Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index c277b9fae950..047c9a31d306 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -921,7 +921,14 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>   
>   struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>   {
> -	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_drm_crtc *mtk_crtc = NULL;
> +
> +	if (!crtc)
> +		return NULL;
> +
> +	mtk_crtc = to_mtk_crtc(crtc);
> +	if (!mtk_crtc)
> +		return NULL;
>   
>   	return mtk_crtc->dma_dev;
>   }

Maybe you could attach the stack dump log in commit message next time.

I've tested this patch with 6.7-rc1 on mt8395-genio-1200-evk.

The following error dump can be solved with this patch, thanks.

Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>


[    2.804652] mediatek-drm mediatek-drm.6.auto: bound 
1c110000.vpp-merge (ops mtk_disp_merge_component_ops [mediatek_drm])
[    2.804660] mediatek-drm mediatek-drm.4.auto: Not creating crtc 0 
because component 8 is disabled or missing
[    2.804662] mediatek-drm mediatek-drm.4.auto: Not creating crtc 0 
because component 9 is disabled or missing
[    2.804666] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000000004a0
[    2.804668] Mem abort info:
[    2.804669]   ESR = 0x0000000096000004
[    2.804670]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.804671]   SET = 0, FnV = 0
[    2.804672]   EA = 0, S1PTW = 0
[    2.804673]   FSC = 0x04: level 0 translation fault
[    2.804674] Data abort info:
[    2.804674]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.804676]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.804677]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.804678] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107380000
[    2.804680] [00000000000004a0] pgd=0000000000000000, p4d=0000000000000000
[    2.804683] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.804684] Modules linked in: mt6315_regulator mtk_jpeg 
mtk_jpeg_enc_hw crct10dif_ce mtk_jpeg_dec_hw btusb btrtl mtk_vcodec_dec 
btintel btmtk v4l2_vp9 mtk_vcodec_enc btbcm v4l2_h264 mtk_vcodec_dbgfs 
mediatek_drm bluetooth mtk_vcodec_common v4l2_mem2mem ecdh_generic 
videobuf2_dma_contig ecc videobuf2_memops videobuf2_v4l2 rfkill 
goodix_ts videodev videobuf2_common mc drm_kms_helper mtk_mmsys 
mtk_mutex mtk_cmdq_helper mcp251xfd mtk_cmdq_mailbox pcie_mediatek_gen3 
can_dev mtk_scp pwm_mtk_disp mtk_rpmsg rtc_mt6397 mtk_scp_ipi 
snd_soc_dmic spmi_mtk_pmif mediatek_cpufreq_hw pwm_bl fuse drm backlight 
ipv6
[    2.828100] CPU: 7 PID: 56 Comm: kworker/u16:1 Not tainted 
6.7.0-rc1-mtk+modified #1
[    2.829073] Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
[    2.829838] Workqueue: events_unbound deferred_probe_work_func
[    2.830578] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.831452] pc : mtk_drm_crtc_dma_dev_get+0x0/0x8 [mediatek_drm]
[    2.832212] lr : mtk_drm_bind+0x418/0x5e8 [mediatek_drm]
[    2.832885] sp : ffff800082d93a20
[    2.833301] x29: ffff800082d93a40 x28: ffff8000824379c0 x27: 
ffff80007acc8c10
[    2.834197] x26: ffff0000c7e3e080 x25: 0000000000000002 x24: 
0000000000000000
[    2.835093] x23: ffff0000c7e3e080 x22: 0000000000000002 x21: 
0000000000000000
[    2.835989] x20: ffff0000ca5a2800 x19: ffff0000c7e3e080 x18: 
ffffffffffffffff
[    2.836884] x17: 69645f6b746d2073 x16: 706f28206c61612e x15: 
ffff80008288a5aa
[    2.837779] x14: ffffffffffffffff x13: 0a676e697373696d x12: 
20726f2064656c62
[    2.838676] x11: fffffffffffe0000 x10: 0000000000000020 x9 : 
ffff800082d93900
[    2.839572] x8 : 0000000000000020 x7 : 20726f2064656c62 x6 : 
000000000000000c
[    2.840468] x5 : ffff0001fef70d08 x4 : 0000000000000000 x3 : 
ffff0000ca5a2ae0
[    2.841363] x2 : ffff0000ca5a2ae0 x1 : 0000000000000000 x0 : 
0000000000000000
[    2.842259] Call trace:
[    2.842568]  mtk_drm_crtc_dma_dev_get+0x0/0x8 [mediatek_drm]
[    2.843285]  try_to_bring_up_aggregate_device+0x168/0x1d4
[    2.843965]  __component_add+0xa4/0x170
[    2.844448]  component_add+0x14/0x20
[    2.844898]  mtk_disp_rdma_probe+0x178/0x268 [mediatek_drm]
[    2.845602]  platform_probe+0x68/0xdc
[    2.846064]  really_probe+0x148/0x2ac
[    2.846525]  __driver_probe_device+0x78/0x12c
[    2.847074]  driver_probe_device+0x40/0x160
[    2.847600]  __device_attach_driver+0xb8/0x134
[    2.848158]  bus_for_each_drv+0x84/0xe4
[    2.848641]  __device_attach+0xac/0x1b8
[    2.849124]  device_initial_probe+0x14/0x20
[    2.849651]  bus_probe_device+0xa8/0xac
[    2.850133]  deferred_probe_work_func+0x88/0xc0
[    2.850702]  process_one_work+0x138/0x260
[    2.851209]  worker_thread+0x32c/0x438
[    2.851681]  kthread+0x118/0x11c
[    2.852088]  ret_from_fork+0x10/0x20
[    2.852540] Code: 97fffdec a8c17bfd d50323bf d65f03c0 (f9425000)
[    2.853305] ---[ end trace 0000000000000000 ]---
[    4.102725] random: crng init done

Best regards,
Macpaul Lin


