Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5679AC47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 08:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265A9208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 08:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="omDBP9VW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="J53Pnaa2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265A9208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QTX07n1RQZzJ1liDP1DqELI3V8bof9jSL1JKkDAElk=; b=omDBP9VWFRVxgP
	i7Q83hRlRu5g/J/kHWi/sLhyOmqrbNuxHx4bQ+syBSRxB44RxopmCj5gf+rpfbXvyzZjgJQwBO3ar
	mJ+I1+yXlKNAUC6dw3pqN20OWVPJO3DVIO/bhMRK3ciqRi+w+WgFNbcDsRR/+Knrub+q1VSkb0QLT
	HCTykhpdH0imhYHnc8/kd89ssVEabLq0NmuzuQo8w4SHmeiRYmknIkAJmDYESjPp9OxDhKnaQXryO
	rGU6BdjBFH0aJazzZLTxWBppjGg8+gVjDcsNieVW5yni19rmwNNHg0q9HI1uDdrzSB6kJBNn/jYjp
	FQuvuyadDJvfUcQp0LrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY3wx-0005jx-4d; Mon, 11 May 2020 08:38:11 +0000
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY3wp-0005cA-7j; Mon, 11 May 2020 08:38:04 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Y3wcj9SbXhEkrY3wdjFaWQ; Mon, 11 May 2020 10:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1589186274; bh=ZJdufNdhciwh1k1owFxPLJAjjfhKcGHDCjZ8YaoNOfw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=J53Pnaa2C8Qc8PqGr2lJIqcjRUegc4X5XjVtX0pQYKK+ujkQrn6MkrUo7Q79W7o3e
 /dCKquZ3agsORd8OgWVsh77n8+PuFWzKcyTUMCjXrDrfOKCIslAqZ3KGwLu4WF7Wbw
 kxpZkeZsmiSW9y+6G310V48QdNWOWrnNzTC42o7cj3k/Dxq40If6XKuqrIKW8pY0g7
 pYVe39htQ539V3bJscO2vlxLYL1LBmF3mZNNgkezuyCr/IjcquapXPCqy077KMuuAZ
 5CH+1WCNQYndhkWR9QoGylPlqngLG95+jZHkyYMk4mvGjCEon47JDF8tb0JJfpbjPp
 n8txd/MZy0crA==
Subject: Re: [PATCH v8 08/14] media: platform: Change case for improving code
 quality
To: Xia Jiang <xia.jiang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rick Chang <rick.chang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-9-xia.jiang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4b8cc41e-5171-0d48-f588-96e4212ab22c@xs4all.nl>
Date: Mon, 11 May 2020 10:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200403094033.8288-9-xia.jiang@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCniNJXgaQ7H+AmqfcLoiP98kKWKQEaV/jbXSnIYOkR8vskmncR5OJ/uqGJ3HFjrkBEbl7ZZZOPsIsa5suNEXos4M10ba5UpXYLPr8P+CkcQcEuy2y1m
 O+AvikV2+3xBYvhQua4+dkBeI75eMwjaIXK3+ySsRCjmhbM0PEFbaHdnsNNAm6N1DngHm3Y8D0yi/2jKVBxa1RBhNXSAyRxj5S0JWpnXQIMYaYovnMkQZo5p
 HjwrSsdHzQsJsGJs2ct4gUDz7AhGpZieipIY9Ra+r89dhM9WWcrPRlP78eBobWM/wGo7cZhfhESAs6iSZCdon/1rR5O0Oy5xH3cOD7EpcvAcbw58Lp5D9BGo
 KwSyinqY58RPVe43j1J4NMyTm+uSfbKEJtEa2TBUFArOr/EUlBRSdkSqlFFEuRP2ZY5Wc7U/PulCR4dN0Ok0ZInEL+Sv7wNbnBucivKqn2yw2n1FcvlKa7Hs
 Nipdkr/GjraGZyDNL+y/wKctU2O3LBIqYQ0alxEJf9IEShRsV5Glt4FiToHtJzqwqpXf9JaeKv/mSO7a9A9WMzevv3hX1YI4/K6gyUoTwnsKrzctoUTmTRjn
 1VbnjBLODYGklJILTxmex44HqD14pQzLjKSEAr3nADpBRxGqUZYSgnMzH6CwJAKiZ4Kv76xzM18uHWF4Uy6ouZPFfFc6B+tc94MG+j92nJEmZrsTQx6KiFWW
 yaHhqFn+Gl3/5tRvOJbS6lulowOGjwhbUsgeB2mCs2RlOpME1a8KYbj2vorhcTpcezzjiqwRYDvHFQURYUFUH06XXpRil5P0FJPIEgbKk6PMryWPNRgrduMC
 m1XwA76LVljvrt8C3l+E+WNIBRi1kcXshN+lBL4yi2RTS32T5e2jelQekik9fcqxrSztskycMooBAxTwfwDm5ErvLyLLd//tajrB0AJF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_013803_439104_571687DC 
X-CRM114-Status: GOOD (  11.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/04/2020 11:40, Xia Jiang wrote:
> Change register offset hex numberals from upercase to lowercase.

Typos:

numberals -> numerals

upercase -> uppercase

Regards,

	Hans

> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> index 94db04e9cdb6..2945da842dfa 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
> @@ -20,29 +20,29 @@
>  #define BIT_INQST_MASK_ALLIRQ		0x37
>  
>  #define JPGDEC_REG_RESET		0x0090
> -#define JPGDEC_REG_BRZ_FACTOR		0x00F8
> -#define JPGDEC_REG_DU_NUM		0x00FC
> +#define JPGDEC_REG_BRZ_FACTOR		0x00f8
> +#define JPGDEC_REG_DU_NUM		0x00fc
>  #define JPGDEC_REG_DEST_ADDR0_Y		0x0140
>  #define JPGDEC_REG_DEST_ADDR0_U		0x0144
>  #define JPGDEC_REG_DEST_ADDR0_V		0x0148
> -#define JPGDEC_REG_DEST_ADDR1_Y		0x014C
> +#define JPGDEC_REG_DEST_ADDR1_Y		0x014c
>  #define JPGDEC_REG_DEST_ADDR1_U		0x0150
>  #define JPGDEC_REG_DEST_ADDR1_V		0x0154
>  #define JPGDEC_REG_STRIDE_Y		0x0158
> -#define JPGDEC_REG_STRIDE_UV		0x015C
> +#define JPGDEC_REG_STRIDE_UV		0x015c
>  #define JPGDEC_REG_IMG_STRIDE_Y		0x0160
>  #define JPGDEC_REG_IMG_STRIDE_UV	0x0164
> -#define JPGDEC_REG_WDMA_CTRL		0x016C
> +#define JPGDEC_REG_WDMA_CTRL		0x016c
>  #define JPGDEC_REG_PAUSE_MCU_NUM	0x0170
> -#define JPGDEC_REG_OPERATION_MODE	0x017C
> +#define JPGDEC_REG_OPERATION_MODE	0x017c
>  #define JPGDEC_REG_FILE_ADDR		0x0200
> -#define JPGDEC_REG_COMP_ID		0x020C
> +#define JPGDEC_REG_COMP_ID		0x020c
>  #define JPGDEC_REG_TOTAL_MCU_NUM	0x0210
>  #define JPGDEC_REG_COMP0_DATA_UNIT_NUM	0x0224
> -#define JPGDEC_REG_DU_CTRL		0x023C
> +#define JPGDEC_REG_DU_CTRL		0x023c
>  #define JPGDEC_REG_TRIG			0x0240
>  #define JPGDEC_REG_FILE_BRP		0x0248
> -#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024C
> +#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024c
>  #define JPGDEC_REG_QT_ID		0x0270
>  #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
>  #define JPGDEC_REG_STATUS		0x0278
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
