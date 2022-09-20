Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E396BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kovlXwwdyK8TgrQ74NHuIiDRcKu8fdYae6Fv2QERB6E=; b=IBrGpIgdECS7QFekXP9B25I4AB
	HfQMMyEhWtHfhx6/+AJz8AI5peseBLaUv0eK1TVvR+1e9XDc/MKu5EmhkGleVPPFlcWEAlFvTMTjG
	qL6iP/Mf/bg3Mi8k1wCfPd9YosyEXjKI/pYml7+oO6ftUKdP9/RRyBvthIcf1Xr67R6udn2dLZGpO
	7MU9xvEewNhzkBBFx8UaEdTPhu/4ISA+TcAsMXIKrJn4Qfukha0ZfC/lWtLgGtZtUdongL6U+QaUN
	643eQNoudsKK6Fz6gC17/pJ1YrLFBEYFiuFX80p9rWjuMdXO/WX0gPWTl9BJDk8JZrSMmzf+Dm+OQ
	M2cNp9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYwo-0023gK-EU; Tue, 20 Sep 2022 08:49:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYwC-0023Mt-OD; Tue, 20 Sep 2022 08:49:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8237A6601F65;
	Tue, 20 Sep 2022 09:48:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663663739;
	bh=3O1gIy6Vy/Ms9LXKAt/hkcmUK5uDCj1tR4GUjf/uneA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dRhnYDPrVJMp1Ip6BavnyMePgoxD6nH+8UU9E6dMEBlah5z4aogJg2zDXvw5TyvEo
	 yXhHi6UbMEFotN6D3gsICRJZIaDMqBSyhhYTI/qkWOG3YicwF1c3JaADwp2y7MwW0p
	 My9O/LRGF77G/OK/vmZ+vHmr4bHhPv8JWt2049TVlQgd9zWzlklXlbMJ8+X5NWT4Tk
	 +Neeo7aYESSTX0mCuRMZFOJ82DA22+kNWaPo02/uBFbJ8NtNHDqSScXhthGPVgrB0N
	 Mp9E0lmXI/ITWEu+RyAbO8BLWNxFJumJByNqknWCTSDb/1ACSr9ODCK58YDvUBpiDb
	 lHAY9WVJ1Fseg==
Message-ID: <afa996b6-ee13-5add-9248-9339aa0beb02@collabora.com>
Date: Tue, 20 Sep 2022 10:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RESEND PATCH v2] mailbox: mtk-cmdq: fix gce timeout issue
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220919071238.23920-1-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919071238.23920-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_014905_106847_3DDCC73A 
X-CRM114-Status: GOOD (  30.73  )
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

Il 19/09/22 09:12, Yongqiang Niu ha scritto:
> 1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18) when gce work,
> and disable gce ddr enable when gce work job done
> 2. split cmdq clk enable/disable api, and control gce ddr enable/disable
> in clk enable/disable function to make sure it could protect when cmdq
> is multiple used by display and mdp
> 
> this is only for some SOC which has flag "control_by_sw".
> for this kind of gce, there is a handshake flow between gce and ddr
> hardware,
> if not set ddr enable flag of gce, ddr will fall into idle mode,
> then gce instructions will not process done.
> we need set this flag of gce to tell ddr when gce is idle or busy
> controlled by software flow.
> 
> ddr problem is a special case.
> when test suspend/resume case, gce sometimes will pull ddr, and ddr can
> not go to suspend.
> if we set gce register 0x48 to 0x7, will fix this gce pull ddr issue,
> as you have referred [1] and [2] (8192 and 8195)
> but for mt8186, the gce is more special, except setting of [1] and [2],
> we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
> when gce working to make sure gce could process all instructions ok.
> this case just need normal bootup, if we not set this, display cmdq
> task will timeout, and chrome homescreen will always black screen.
> 
> and with this patch, we have done these test on mt8186:
> 1.suspend/resume
> 2.boot up to home screen
> 3.playback video with youtube.
> 
> suspend issue is special gce hardware issue, gce client  driver
> command already process done, but gce still pull ddr.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 66 +++++++++++++++++++++++++++---
>   1 file changed, 61 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9465f9081515..3a1b11de84be 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -80,16 +80,60 @@ struct cmdq {
>   	bool			suspended;
>   	u8			shift_pa;
>   	bool			control_by_sw;
> +	bool			sw_ddr_en;
>   	u32			gce_num;
> +	atomic_t		usage;
> +	spinlock_t		lock;
>   };
>   
>   struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
>   	bool control_by_sw;
> +	bool sw_ddr_en;
>   	u32 gce_num;
>   };
>   
> +static s32 cmdq_clk_enable(struct cmdq *cmdq)
> +{
> +	s32 usage, ret;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cmdq->lock, flags);
> +
> +	usage = atomic_inc_return(&cmdq->usage);
> +
> +	ret = clk_bulk_enable(cmdq->gce_num, cmdq->clocks);
> +	if (usage <= 0 || ret < 0) {
> +		dev_err(cmdq->mbox.dev, "ref count %d ret %d suspend %d\n",
> +			usage, ret, cmdq->suspended);
> +	} else if (usage == 1) {
> +		if (cmdq->sw_ddr_en)
> +			writel((0x7 << 16) + 0x7, cmdq->base + GCE_GCTL_VALUE);

Can this be used on MT8192/MT8195?
If yes, you can avoid adding that sw_ddr_en, as you would be able to simply
use `control_by_sw`, which already seems to be doing most of what you're adding
here.

Also, I dislike all this locking: the point of having MTK CMDQ is to improve
performance (I know it's more than that, but there's no ISP upstream) and part
of that happens because locking is greatly reduced.

If you add it back up, we're losing part of the point.

Though, in this driver, we are already tracking the usage of the CMDQ threads
and, when there's no more usage, we're turning off the clocks: this is done
through the usage of `task_busy_list`, so you *do* have a way to avoid adding
more locks around.
Besides that, you could also add a clock notifier for the same, but since
the state is already tracked, I'd avoid using that.

Moreover, (7 << 16) == GENMASK(18, 16)

#define GCE_CMD_SOMETHING GENMASK(18, 16)

Regards,
Angelo




