Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16EC54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoR8uwiWiRoKN0tyLWKB5yOJcQiMzch1QH1DDMtzRME=; b=tfw+Ym9SFENuddLPLT0Sja1yiA
	QMgUXAykMTV4jMzir4y2I06Jgn+4ZRTva+xckvBmWwNC5xpSnuQsVXFSoOFCMsAnsKmmGLxnY4E05
	HycWY0310DOmK75KtJJl7mZ8hKJpzwaxrFXqo2RczuHlOoYHHoRwA3vttFhKtGcRPSkCwXBgD4Da+
	70dczrSnNa3nVyHE05/SQQ+jGRECNJVruTCt/mtnWBga7KHMhC8xoPZp0Q48sIoWw0kDXWL0du2nx
	P0fb3BaKhLsqFDnDObYpg0CncgLTTYQq3RVcEehog/oQepRzV6q10AeSyaSnT5nuNrFeCKLxmIDtf
	dsMkjGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofNA-0000000G4Tq-0bjQ;
	Mon, 25 Mar 2024 08:08:00 +0000
Received: from mout-u-107.mailbox.org ([80.241.59.207])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofN4-0000000G4QY-1u63;
	Mon, 25 Mar 2024 08:07:56 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4V35C525S3z9sTP;
	Mon, 25 Mar 2024 09:07:45 +0100 (CET)
Message-ID: <7da930c8-d6d1-47e3-b346-b0e9e75edb54@denx.de>
Date: Mon, 25 Mar 2024 09:07:43 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 37/64] i2c: mt7621: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_010754_894819_79AB3B02 
X-CRM114-Status: GOOD (  21.76  )
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

On 3/22/24 14:25, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 81d46169bc1f..c567a2cf4a90 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -117,26 +117,26 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
>   	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
>   }
>   
> -static int mtk_i2c_master_start(struct mtk_i2c *i2c)
> +static int mtk_i2c_host_start(struct mtk_i2c *i2c)
>   {
>   	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
> +static int mtk_i2c_host_stop(struct mtk_i2c *i2c)
>   {
>   	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
> +static int mtk_i2c_host_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
>   {
>   	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
>   		  i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			       int num)
>   {
>   	struct mtk_i2c *i2c;
> @@ -157,7 +157,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			goto err_timeout;
>   
>   		/* start sequence */
> -		ret = mtk_i2c_master_start(i2c);
> +		ret = mtk_i2c_host_start(i2c);
>   		if (ret)
>   			goto err_timeout;
>   
> @@ -169,14 +169,14 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			if (pmsg->flags & I2C_M_RD)
>   				addr |= 1;
>   			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
> +			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 2);
>   			if (ret)
>   				goto err_timeout;
>   		} else {
>   			/* 7 bits address */
>   			addr = i2c_8bit_addr_from_msg(pmsg);
>   			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
> +			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 1);
>   			if (ret)
>   				goto err_timeout;
>   		}
> @@ -202,7 +202,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   				cmd = SM0CTL1_WRITE;
>   			}
>   
> -			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
> +			ret = mtk_i2c_host_cmd(i2c, cmd, page_len);
>   			if (ret)
>   				goto err_timeout;
>   
> @@ -222,7 +222,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		}
>   	}
>   
> -	ret = mtk_i2c_master_stop(i2c);
> +	ret = mtk_i2c_host_stop(i2c);
>   	if (ret)
>   		goto err_timeout;
>   
> @@ -230,7 +230,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	return i;
>   
>   err_ack:
> -	ret = mtk_i2c_master_stop(i2c);
> +	ret = mtk_i2c_host_stop(i2c);
>   	if (ret)
>   		goto err_timeout;
>   	return -ENXIO;
> @@ -247,7 +247,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
>   }
>   
>   static const struct i2c_algorithm mtk_i2c_algo = {
> -	.master_xfer	= mtk_i2c_master_xfer,
> +	.xfer	= mtk_i2c_xfer,
>   	.functionality	= mtk_i2c_func,
>   };
>   

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de

