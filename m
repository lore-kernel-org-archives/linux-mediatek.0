Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8885610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8885610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aymabb7UDoVdKQhy9kjQz8dspEPRDlFkUfhwruyIZE=; b=ZrIW0Kt2PuQCFyvhfBybkE5Vo9
	emOO+lj/u7X+6CCaQt03ZKR1MQfDmhHjkOkQUJRfFH2mrn/gXNZKbjgV2KUyFgd6UefPsJ3IYHueP
	X/aUgTv875l10/32zxLMCxYPxPJyy6ZPec+ABc6iUPnYJsqSQ/z5F5H4+9FT34dB0j8ed11V7vLc8
	23JGf9Q/LFrB7tIZ4QnaDAb1KuZ4ZeYz0VAgBE64QO4OaOmMOVJ31JMaMoMl90aAisREkAFBipg0y
	QyTbCI11L7wBn7Ns4DcvoTGV1esuTUxCAHRwfsNR/9TlR/RqgJFIQCcCjkNEIsrP8uFZ65lVUenCI
	9g0YGl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdTpO-006vZt-0I; Thu, 21 Oct 2021 08:53:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTou-006vR0-I1; Thu, 21 Oct 2021 08:53:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E4C991F44759
Subject: Re: [PATCH v16 4/7] soc: mediatek: SVS: add debug commands
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-5-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <715c9587-825f-6c22-96a2-273fb7f07bc3@collabora.com>
Date: Thu, 21 Oct 2021 10:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210428065440.3704-5-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_015304_795242_AF603C89 
X-CRM114-Status: GOOD (  21.03  )
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

Il 28/04/21 08:54, Roger Lu ha scritto:
> The purpose of SVS is to help find the suitable voltages
> for DVFS. Therefore, if SVS bank voltages are concerned
> to be wrong, we can adjust SVS bank voltages by this patch.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 328 +++++++++++++++++++++++++++++++++
>   1 file changed, 328 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 2d2153c92373..8794a2d87baa 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -6,6 +6,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/completion.h>
> +#include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> @@ -24,6 +25,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/reset.h>
> +#include <linux/seq_file.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/thermal.h>
> @@ -62,6 +64,39 @@
>   #define SVSB_INTSTS_COMPLETE		0x1
>   #define SVSB_INTSTS_CLEAN		0x00ffffff
>   
> +#define debug_fops_ro(name)						\
> +	static int svs_##name##_debug_open(struct inode *inode,		\
> +					   struct file *filp)		\
> +	{								\
> +		return single_open(filp, svs_##name##_debug_show,	\
> +				   inode->i_private);			\
> +	}								\
> +	static const struct file_operations svs_##name##_debug_fops = {	\
> +		.owner = THIS_MODULE,					\
> +		.open = svs_##name##_debug_open,			\
> +		.read = seq_read,					\
> +		.llseek = seq_lseek,					\
> +		.release = single_release,				\
> +	}
> +
> +#define debug_fops_rw(name)						\
> +	static int svs_##name##_debug_open(struct inode *inode,		\
> +					   struct file *filp)		\
> +	{								\
> +		return single_open(filp, svs_##name##_debug_show,	\
> +				   inode->i_private);			\
> +	}								\
> +	static const struct file_operations svs_##name##_debug_fops = {	\
> +		.owner = THIS_MODULE,					\
> +		.open = svs_##name##_debug_open,			\
> +		.read = seq_read,					\
> +		.write = svs_##name##_debug_write,			\
> +		.llseek = seq_lseek,					\
> +		.release = single_release,				\
> +	}
> +
> +#define svs_dentry(name)	{__stringify(name), &svs_##name##_debug_fops}
> +
>   static DEFINE_SPINLOCK(mtk_svs_lock);
>   
>   /*
> @@ -83,6 +118,7 @@ enum svsb_phase {
>   	SVSB_PHASE_INIT01,
>   	SVSB_PHASE_INIT02,
>   	SVSB_PHASE_MON,
> +	SVSB_PHASE_NUM,

I would move the addition of these last members in the previous (3/7) patch,
where you introduce the driver in the first place.

Also, I think that using _MAX instead would be better, as it is pretty
much a common practice. So, this would become SVSB_PHASE_MAX.

>   };
>   
>   enum svs_reg_index {
> @@ -140,6 +176,7 @@ enum svs_reg_index {
>   	SPARE2,
>   	SPARE3,
>   	THSLPEVEB,
> +	SVS_REG_NUM,

... and this would become SVS_REG_MAX

>   };
>   
>   static const u32 svs_regs_v2[] = {

Apart from that,

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
