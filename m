Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2E5C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5389461362
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5389461362
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0bsRQFEnGdKIOayvH3MkKKEcrv4K6CeaKCAZDPRjF0=; b=a0Q4cXCh52jVud
	5S0Uc/jJri7UMelILZNMJ83M7IjOy8vHlfOy7Ivxwj5bqyTquE6zYKQOX/wGLvI6AyeuB2jCfzdMQ
	smnJM2+3Xe8IWIP14Egivj3EXGBf1QDJxdI7k1e8g8wrrUnU7xUzViYyY59HymRSPh2k1jDwZ6D0R
	bGs4QpwLwqdd+U8H0FHVqjJofY+gdq9YHWb/98wJEJz8Usvm38uNzQcsMHvrFYni1VkCWm1HfSPBR
	A9KVoeG/+oYGD/vf8H1Gt9uuYDIixBjPLrj2cUOaZfIhfIwJ/v2SKQxmWtSnFS2F4HCMhN8n2pNn4
	rTqMNcEfu+aiMxVCC4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ukm-00HFD2-BA; Thu, 15 Jul 2021 06:21:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3uki-00HFBv-6y
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 06:21:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id f30so7934948lfj.1
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDnZkWk4wGXBAneUQ2pO6M6fPGzr2/erew54duA0y+g=;
 b=FQeFZgGIC5DZPxcbpv+PigdW3L94WikM7o2HBJFUZLcGIvndO8tCWrqIim+CESB1uQ
 XlBda0IORHzSfIvirbM4bYZ+GL0v+pc94axE72Cq8CZgI765dpj+XaJQgCsf4riK2vmu
 9E5P+YVkM5GKGUn6nFfoojCn6v47o5K8qI9Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDnZkWk4wGXBAneUQ2pO6M6fPGzr2/erew54duA0y+g=;
 b=NDpESJHdgmBIH3WpfIpfhmoplsjH+GnmtgmEPP3p64a/ubHXEgrxVxXXbI5frEHXlb
 B/CpekS67V/cGRp/FkMDxuEvrHRL7psxD0wN2phoMz4SgONIKhRQSJyGwVwR8v8ZQMU3
 /V0yJJBn6AF9oB/8HW29KqwFRldKBUSHQ64nAHiODEZF4luqNShM/j5ENabVomQDn85h
 LRvsn4vopRANBRpbtYpaUbyWNJrwYRWFFh1IL7hBsWQXgDv4/Nuuj0a5PldzvatA8WZp
 Cge35NH/RN8BMPeifF9e1m/05+Vh64/101Ob4ClZ5xYaggfagMagoP2OiBDP1Jev9QnL
 11ug==
X-Gm-Message-State: AOAM532qiJwYjA8KpAXOz2pqS52kt1i5P//TUzDH0sTFs0S5fv2zV2hl
 Ay4NlSLuZ0SdXnRJ/b5QIpvz9QRsZIg77mOIA5yWyg==
X-Google-Smtp-Source: ABdhPJzgSd49Fp4x/b7JoIZ4W4zF8u2EyzMr1QKyp1dccSFuXtyCO+7c2sDP+12iNgZW1LhYzoFhxQLddT1EKSUMVrM=
X-Received: by 2002:a19:858b:: with SMTP id h133mr2083722lfd.656.1626330102820; 
 Wed, 14 Jul 2021 23:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-3-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-3-git-send-email-kewei.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Jul 2021 14:21:31 +0800
Message-ID: <CAGXv+5HjVaiaC5DhETNCV880aKjgfwxuVq9Rd=VhVrRNjDPOOQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, 
 qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_232144_317256_382CA7A6 
X-CRM114-Status: GOOD (  24.01  )
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

On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
>
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 95 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e..64acd96 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
>         OFFSET_HS,
>         OFFSET_SOFTRESET,
>         OFFSET_DCM_EN,
> +       OFFSET_MULTI_DMA,
>         OFFSET_PATH_DIR,
>         OFFSET_DEBUGSTAT,
>         OFFSET_DEBUGCTRL,
> @@ -192,6 +193,7 @@ enum I2C_REGS_OFFSET {
>         [OFFSET_TRANSFER_LEN_AUX] = 0x44,
>         [OFFSET_CLOCK_DIV] = 0x48,
>         [OFFSET_SOFTRESET] = 0x50,
> +       [OFFSET_MULTI_DMA] = 0x84,

On the datasheets I have, MULTI_DMA is 0x8c, while 0x84 is CHANNEL_SEC on
MT8192, and not defined on MT8183 nor MT8195.

>         [OFFSET_SCL_MIS_COMP_POINT] = 0x90,
>         [OFFSET_DEBUGSTAT] = 0xe0,
>         [OFFSET_DEBUGCTRL] = 0xe8,
> @@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>         return 0;
>  }
>
> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +       dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
> +               OFFSET_SLAVE_ADDR,
> +               (mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),

Drop the extra outer parentheses. Same goes for all the other invocations.

> +               OFFSET_INTR_MASK,
> +               (mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
> +       dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
> +               OFFSET_INTR_STAT,
> +               (mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
> +               OFFSET_CONTROL,
> +               (mtk_i2c_readw(i2c, OFFSET_CONTROL)));
> +       dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
> +               OFFSET_TRANSFER_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
> +               OFFSET_TRANSAC_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
> +       dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
> +               OFFSET_DELAY_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
> +               OFFSET_TIMING,
> +               (mtk_i2c_readw(i2c, OFFSET_TIMING)));
> +       dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
> +               OFFSET_START,
> +               mtk_i2c_readw(i2c, OFFSET_START));
> +       dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
> +               OFFSET_EXT_CONF,
> +               mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
> +       dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
> +               OFFSET_HS,
> +               mtk_i2c_readw(i2c, OFFSET_HS));
> +       dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
> +               OFFSET_IO_CONFIG,
> +               mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
> +       dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
> +               OFFSET_FIFO_ADDR_CLR,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
> +       dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
> +               OFFSET_TRANSFER_LEN_AUX,
> +               mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
> +       dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
> +               OFFSET_CLOCK_DIV,
> +               mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
> +       dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
> +               OFFSET_FIFO_STAT,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
> +               OFFSET_FIFO_THRESH,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
> +       dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
> +               OFFSET_DCM_EN,
> +               mtk_i2c_readw(i2c, OFFSET_DCM_EN));
> +       dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",

Nit: Why do some have two registers per line, and some only have one?

ChenYu


> +               OFFSET_DEBUGSTAT,
> +               (mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
> +               OFFSET_DEBUGCTRL,
> +               (mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
> +
> +       if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
> +               dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
> +                       OFFSET_LTIMING,
> +                       mtk_i2c_readw(i2c, OFFSET_LTIMING));
> +               dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
> +                       OFFSET_MULTI_DMA,
> +                       (mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
> +       }
> +
> +       dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_INT_FLAG));
> +       dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_INT_EN));
> +       dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_EN));
> +       dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RST));
> +       dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_CON));
> +       dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
> +       dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
> +       dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_LEN));
> +       dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_LEN));
> +       dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
> +       dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
> +}
> +
>  static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>                                int num, int left_num)
>  {
> @@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>         }
>
>         if (ret == 0) {
> -               dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +               dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +               i2c_dump_register(i2c);
>                 mtk_i2c_init_hw(i2c);
>                 return -ETIMEDOUT;
>         }
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
