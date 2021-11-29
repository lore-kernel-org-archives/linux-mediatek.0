Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbyLHHZ22l2PQIVKdRTFdlAAkfimcZQ7olwF+SW8Uko=; b=TTS/AXRAfYIiYm
	/qaoV916zEkVe+IU8tdFaSqQY8cFj5TSjsVeq+mjyHVNqJH295rbbJe1ASsPNcafvFIm+iT0dC+Ln
	YvcdzVXiZSfDQYyYkDwTy1N1/cHP3iMSQMbhySEGWC7QiLLkgxx8MmzM1jm7dcaWuo2F6SJDpi9Bc
	ENJRpxhyK0iiaKeYEwMgsNLzEZFcQhlC5h3unLWi1YBTIe3+6TDqgh4k2kDmOt/HP/lh0W2JAOq9N
	Tgj3wTflbilGc7xxgrXpPTY0B7azFkRrtixQ9WUfuK8cNlwxHdDGbYacDljX65p+aSkdWbTSUtHPD
	OSXJuZUMgcFzN8orbYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrapp-00Ha0a-SD; Mon, 29 Nov 2021 07:12:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrapU-00HZtE-5N
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 07:12:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id y8so11450747plg.1
 for <linux-mediatek@lists.infradead.org>; Sun, 28 Nov 2021 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gqKVeAmtJ28Ij4ESFKCTCEHmSmtmFX8yHUJYwywb7ag=;
 b=byknp2pQnyhSxsju+3ZYpfkAC1hcQDQqoJqM760EFq6VNOQv8X+BnqYuiplE689ts2
 mbKbxp+vvTN9i4N+Z16OHd7gaftw1X7rpCkl4Rr6TO3V4XICotc3njsV/SqwM3URK95c
 GZ8Bq/+u5/FGSuAg+IFHZD8ArKWluJyoXUoFFSqkXIoF9LrYjGuBe2adhZor6ZVeyAYF
 5egiGwxvxHOPve0HLQFzORfNbY+kjK/vsEVgd9eZyy3RbAWfktUHUhJEDiZfIj0YGhH3
 G7yND1SrWGgF3CDV7IxPqpIhPLKebVFGskbf2PIL0cgkXRx/65PdswFRiBMr5w+U7F31
 T+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqKVeAmtJ28Ij4ESFKCTCEHmSmtmFX8yHUJYwywb7ag=;
 b=LTGse8VHa0WjeWweV3xaQvWC2e0lPzUOxb4hDZCh6AAwUW2cu2zXdEvRNu2Sdn+eOm
 5gTbV42IQxmEtY36GHw2cq+Sw8f1Igzz49SBD2LBazBlgRlmqqH4MDajoaI99Q1XNIMF
 rtsgUHBnzMm1BayKWg2+HwarwLvnNGE3dUhn2XvFdtkGfSzoO2PYZvKDn7KX/Mf+/MCb
 ib8bV+B91NibOxWxMTSujs+dX73jZ0+gvNlGjhcc/ug8JK/2AG7zxI7lDeqIYfXlp+sN
 e5BEbyzo9soQTbwlR8/Q/J0vchO5OUEtQbR7axuWOgakbrIBYujLRnczOa3/gY9obXDJ
 2/8Q==
X-Gm-Message-State: AOAM531Wbn03vmKxjurUkuCjVnJSndLSGLHH0n7qu9DvE/ZLsJr5Aw7k
 xx1PrbnD5WHOVT8gmouLK6iZBw==
X-Google-Smtp-Source: ABdhPJxrgJOD/gmN8VFUGDa5VdyygIRYVYL060w2qQSdMuiLI7ClSzvocpOzoXnhLbFDwTtBCLNHLg==
X-Received: by 2002:a17:90b:17c4:: with SMTP id
 me4mr36397983pjb.15.1638169919135; 
 Sun, 28 Nov 2021 23:11:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id g20sm17607742pfj.12.2021.11.28.23.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:11:58 -0800 (PST)
Date: Mon, 29 Nov 2021 15:11:54 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v7 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <CA+Px+wV8opw7vzuvb5cPJtWFxBO0jdahOqK1jOQZnGLr7MKojA@mail.gmail.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_231200_257377_B9708378 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Nov 29, 2021 at 02:39:53PM +0800, allen-kh.cheng wrote:
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Please double check again if you use the R-b tags correctly.  I have provided my R-b tag before but have some more minor comments below.

With the minor comments:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op)
> +{
> +     struct mtk_adsp_chan *dsp_chan;
> +     struct adsp_mbox_ch_info *ch_info;
> +     int ret;
> +
> +     if (idx >= MTK_ADSP_MBOX_NUM)
> +             return -EINVAL;
> +
> +     dsp_chan = &ipc->chans[idx];
> +     ch_info = dsp_chan->ch->con_priv;
> +     ch_info->ipc_op_val = op;
> +     ret = mbox_send_message(dsp_chan->ch, NULL);
> +     if (ret < 0)
> +             return ret;
> +
> +     return 0;
> +}
> +EXPORT_SYMBOL(adsp_ipc_send);

To be neat, I think use mtk_adsp for all names looks better.  I.e. s/adsp_ipc_send/mtk_adsp_ipc_send/.

> +static void adsp_ipc_recv(struct mbox_client *c, void *msg)
> +{

Ditto, mtk_adsp_ipc_recv looks better to me.

> diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
[...]
> +struct adsp_mbox_ch_info {
> +     u32 ipc_op_val;
> +     void __iomem *va_reg;
> +};

Ditto, mtk_adsp_mbox_ch_info.

> +static inline void adsp_ipc_set_data(struct mtk_adsp_ipc *ipc, void *data)
> +{

mtk_adsp_ipc_set_data, although there is no use case yet.

> +static inline void *adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
> +{

mtk_adsp_ipc_get_data, although there is no use case yet.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
