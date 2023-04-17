Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C993FC77B76
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cZhv3s4IeX7VWzNedJye4xCLMGyQ0tECgXAHWbUkWA=; b=vKW7ild3jTdyqOBPF6oBM9dFKC
	avQiMY9GLGYzsy0Qpwif3nP46GEclTPpT6wvIFMcRrlbtXI6kLJHv5G/+0Ag4LX2HMV59b3VkuDMm
	EBpHR7157gvPtfxGAMIrsRc+tqzguGDhAMbfAI7BROFJI06F2BSIfNom5sZlq5lSNieQ4D/miVJGF
	CYk0w7wdnXUfDMFhuwMjiSbAQyAvW4RAHaQYSeSNfy2+W1dIminbV5tshzZhjHiesoedK2bovTZ5W
	y/Tsj7FQeON1W9nNiqMNeU5P4OHEJ4xgtjdB3eI5sdERAXk0RMjlj0Y5D7hjUAl/gcPagTz/t47dK
	IZ1QWEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poQST-00Gm2g-1w;
	Mon, 17 Apr 2023 15:07:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poQSO-00GlzO-1u;
	Mon, 17 Apr 2023 15:07:54 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4edc0fb9cd0so115567e87.0;
        Mon, 17 Apr 2023 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681744067; x=1684336067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cZhv3s4IeX7VWzNedJye4xCLMGyQ0tECgXAHWbUkWA=;
        b=PXjpvjkZPNfZTsxxB5vfl7XnBz9ejQyNE/uHK2jZZdub0CIdvOXWWPgRo/9pNP+kfm
         PrBb+ibn8BedGjZHoxZzbFyvxi51IYGujdkTaAKOsdY2dkHbXpi6E/8+VKETuSKKbezr
         kDUpiyTc4y2m58rOhGjbv0ESlj4vhpxZRaSxEV+dDEF3yVouG87zmILXGEVQ5E1xBoz8
         ABDlHfp01FAemN6/bGB/it5tL0TPWZZ2lnhGDxerxNy6uNMk0wLzXQzeQgNLZvB3zunu
         EqVmPAZKfO8/4QqmMI+NlVi2ql7rzWkWpcmI3OAN9ubJ2J+zCSA0/lmS4ONJkZrwA4Ro
         E83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681744067; x=1684336067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cZhv3s4IeX7VWzNedJye4xCLMGyQ0tECgXAHWbUkWA=;
        b=aWEYh0vvICoNZr8qpFrMyCvhnVYwxdnGfOR2MGgCyNMJyfqY1o5ZDS8vGe6hWhL/YL
         WwKTgsqi18W/DuM12/huI2QAOa2ZajExX896z26Bp40HOsO+IH8TamkmX00TlfgFCTKG
         0wLe0JsFqRXPEloiMLu9Dt/ehKeqKuSKdw0NiAt90fY07K8SETbRNR7KOtHIwon2esg3
         VFurYu6oFPtxjM/K1+PO7Y6fbXiHIIH4ftM8cMSL2UDkM3KPg6ojnYpFuTdN4ASpK28I
         GB0rp4JnVdUrJEQtvvRgAKnoFEnBHithsHxl5CSsXRtGf0PSRE2kH8CvODbhFvsiftQ9
         a2BQ==
X-Gm-Message-State: AAQBX9eXcVRj9JutbduGhElNZxKuFBqXyG1I9pU6d1kKlr3qg0vfdfmg
	cv2Kbza8ERiCATI3ThBhCSM=
X-Google-Smtp-Source: AKy350ZfgyCpP7uiI59f7b7qiTRRvPeClZ3nX9Bn0Ma8IhLrKvtpYFcohIXH6NB2bqSzFMdW0jx1HA==
X-Received: by 2002:ac2:46cf:0:b0:4eb:7fa:515 with SMTP id p15-20020ac246cf000000b004eb07fa0515mr2849231lfo.2.1681744066638;
        Mon, 17 Apr 2023 08:07:46 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.75])
        by smtp.gmail.com with ESMTPSA id z14-20020a19f70e000000b004eb12850c40sm2071548lfe.14.2023.04.17.08.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:07:45 -0700 (PDT)
Message-ID: <0e27f7af-8a53-7078-0949-08879aa23da8@gmail.com>
Date: Mon, 17 Apr 2023 17:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: Add common header file with JPEG marker
 definitions
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <bcb81f910f03eef4ed964d39883df0d33c762f9f.1681727493.git.geert+renesas@glider.be>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <bcb81f910f03eef4ed964d39883df0d33c762f9f.1681727493.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_080752_628348_8A0DDC99 
X-CRM114-Status: GOOD (  28.69  )
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

Hi,

W dniu 17.04.2023 o 12:31, Geert Uytterhoeven pisze:
> When compile-testing on mips/RB532 with W=1:
> 
>      arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>         13 | #define RST  (1 << 15)
> 	  |
>      drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c:15: warning: "RST" redefined
>         15 | #define RST 0xd0
> 	  |
>      drivers/media/platform/renesas/rcar_jpu.c:77: warning: "RST" redefined
>         77 | #define RST 0xd0
> 	  |
> 
> "RST" is indeed a name too short to be conflict-free.
> 
> Fix this by creating a common <media/jpeg.h> header file, containing
> definitions for all JPEG markers used, prefixed by "JPEG_MARKER_", based
> on the existing private definitions in the Samsung S5P JPEG driver, and
> convert all affected drivers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304152346.hJOPxPRh-lkp@intel.com/
> Link: https://lore.kernel.org/oe-kbuild-all/202304150059.bHUyuriy-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

for the s5p-jpeg part:

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
> No change in generated code before/after.
> ---
>   .../mediatek/jpeg/mtk_jpeg_dec_parse.c        | 17 ++----
>   drivers/media/platform/renesas/rcar_jpu.c     | 55 +++++++++----------
>   .../platform/samsung/s5p-jpeg/jpeg-core.h     | 12 +---
>   include/media/jpeg.h                          | 20 +++++++
>   4 files changed, 52 insertions(+), 52 deletions(-)
>   create mode 100644 include/media/jpeg.h
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
> index b95c45791c29edc5..bb9cdc9e0e90912b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
> @@ -7,15 +7,10 @@
>   
>   #include <linux/kernel.h>
>   #include <linux/videodev2.h>
> +#include <media/jpeg.h>
>   
>   #include "mtk_jpeg_dec_parse.h"
>   
> -#define TEM	0x01
> -#define SOF0	0xc0
> -#define RST	0xd0
> -#define SOI	0xd8
> -#define EOI	0xd9
> -
>   struct mtk_jpeg_stream {
>   	u8 *addr;
>   	u32 size;
> @@ -83,7 +78,7 @@ static bool mtk_jpeg_do_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
>   
>   		length = 0;
>   		switch (byte) {
> -		case SOF0:
> +		case JPEG_MARKER_SOF0:
>   			/* length */
>   			if (read_word_be(&stream, &word))
>   				break;
> @@ -123,10 +118,10 @@ static bool mtk_jpeg_do_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
>   
>   			notfound = !(i == param->comp_num);
>   			break;
> -		case RST ... RST + 7:
> -		case SOI:
> -		case EOI:
> -		case TEM:
> +		case JPEG_MARKER_RST ... JPEG_MARKER_RST + 7:
> +		case JPEG_MARKER_SOI:
> +		case JPEG_MARKER_EOI:
> +		case JPEG_MARKER_TEM:
>   			break;
>   		default:
>   			if (read_word_be(&stream, &word))
> diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
> index d1dda68bfb5e2087..25d3f0376d6709ba 100644
> --- a/drivers/media/platform/renesas/rcar_jpu.c
> +++ b/drivers/media/platform/renesas/rcar_jpu.c
> @@ -28,6 +28,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/string.h>
>   #include <linux/videodev2.h>
> +#include <media/jpeg.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-event.h>
> @@ -71,19 +72,6 @@
>   #define JPU_JPEG_DEFAULT_422_PIX_FMT V4L2_PIX_FMT_NV16M
>   #define JPU_JPEG_DEFAULT_420_PIX_FMT V4L2_PIX_FMT_NV12M
>   
> -/* JPEG markers */
> -#define TEM	0x01
> -#define SOF0	0xc0
> -#define RST	0xd0
> -#define SOI	0xd8
> -#define EOI	0xd9
> -#define DHP	0xde
> -#define DHT	0xc4
> -#define COM	0xfe
> -#define DQT	0xdb
> -#define DRI	0xdd
> -#define APP0	0xe0
> -
>   #define JPU_RESET_TIMEOUT	100 /* ms */
>   #define JPU_JOB_TIMEOUT		300 /* ms */
>   #define JPU_MAX_QUALITY		4
> @@ -330,26 +318,32 @@ static const u8 zigzag[] = {
>    * Huffman tables; Padding with 0xff (33.3.27 R01UH0501EJ0100 Rev.1.00)
>    */
>   #define JPU_JPEG_HDR_BLOB {                                                    \
> -	0xff, SOI, 0xff, DQT, 0x00, JPU_JPEG_QTBL_SIZE + 0x3, JPU_JPEG_LUM,    \
> -	[JPU_JPEG_QTBL_LUM_OFFSET ...                                          \
> +	0xff, JPEG_MARKER_SOI, 0xff, JPEG_MARKER_DQT, 0x00,		       \
> +	JPU_JPEG_QTBL_SIZE + 0x3, JPU_JPEG_LUM,				       \
> +	[JPU_JPEG_QTBL_LUM_OFFSET ...					       \
>   		JPU_JPEG_QTBL_LUM_OFFSET + JPU_JPEG_QTBL_SIZE - 1] = 0x00,     \
> -	0xff, DQT, 0x00, JPU_JPEG_QTBL_SIZE + 0x3, JPU_JPEG_CHR,               \
> +	0xff, JPEG_MARKER_DQT, 0x00, JPU_JPEG_QTBL_SIZE + 0x3, JPU_JPEG_CHR,   \
>   	[JPU_JPEG_QTBL_CHR_OFFSET ... JPU_JPEG_QTBL_CHR_OFFSET +               \
> -		JPU_JPEG_QTBL_SIZE - 1] = 0x00, 0xff, SOF0, 0x00, 0x11, 0x08,  \
> +		JPU_JPEG_QTBL_SIZE - 1] = 0x00,				       \
> +	0xff, JPEG_MARKER_SOF0, 0x00, 0x11, 0x08,			       \
>   	[JPU_JPEG_HEIGHT_OFFSET ... JPU_JPEG_HEIGHT_OFFSET + 1] = 0x00,        \
>   	[JPU_JPEG_WIDTH_OFFSET ... JPU_JPEG_WIDTH_OFFSET + 1] = 0x00,          \
>   	0x03, 0x01, [JPU_JPEG_SUBS_OFFSET] = 0x00, JPU_JPEG_LUM,               \
>   	0x02, 0x11, JPU_JPEG_CHR, 0x03, 0x11, JPU_JPEG_CHR,                    \
> -	0xff, DHT, 0x00, JPU_JPEG_HDCTBL_SIZE + 0x3, JPU_JPEG_LUM|JPU_JPEG_DC, \
> +	0xff, JPEG_MARKER_DHT, 0x00, JPU_JPEG_HDCTBL_SIZE + 0x3,	       \
> +	JPU_JPEG_LUM | JPU_JPEG_DC,					       \
>   	[JPU_JPEG_HDCTBL_LUM_OFFSET ...                                        \
>   		JPU_JPEG_HDCTBL_LUM_OFFSET + JPU_JPEG_HDCTBL_SIZE - 1] = 0x00, \
> -	0xff, DHT, 0x00, JPU_JPEG_HACTBL_SIZE + 0x3, JPU_JPEG_LUM|JPU_JPEG_AC, \
> +	0xff, JPEG_MARKER_DHT, 0x00, JPU_JPEG_HACTBL_SIZE + 0x3,	       \
> +	JPU_JPEG_LUM | JPU_JPEG_AC,					       \
>   	[JPU_JPEG_HACTBL_LUM_OFFSET ...                                        \
>   		JPU_JPEG_HACTBL_LUM_OFFSET + JPU_JPEG_HACTBL_SIZE - 1] = 0x00, \
> -	0xff, DHT, 0x00, JPU_JPEG_HDCTBL_SIZE + 0x3, JPU_JPEG_CHR|JPU_JPEG_DC, \
> +	0xff, JPEG_MARKER_DHT, 0x00, JPU_JPEG_HDCTBL_SIZE + 0x3,	       \
> +	JPU_JPEG_CHR | JPU_JPEG_DC,					       \
>   	[JPU_JPEG_HDCTBL_CHR_OFFSET ...                                        \
>   		JPU_JPEG_HDCTBL_CHR_OFFSET + JPU_JPEG_HDCTBL_SIZE - 1] = 0x00, \
> -	0xff, DHT, 0x00, JPU_JPEG_HACTBL_SIZE + 0x3, JPU_JPEG_CHR|JPU_JPEG_AC, \
> +	0xff, JPEG_MARKER_DHT, 0x00, JPU_JPEG_HACTBL_SIZE + 0x3,	       \
> +	JPU_JPEG_CHR | JPU_JPEG_AC,					       \
>   	[JPU_JPEG_HACTBL_CHR_OFFSET ...                                        \
>   		JPU_JPEG_HACTBL_CHR_OFFSET + JPU_JPEG_HACTBL_SIZE - 1] = 0x00, \
>   	[JPU_JPEG_PADDING_OFFSET ... JPU_JPEG_HDR_SIZE - 1] = 0xff             \
> @@ -613,7 +607,8 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
>   	 * basic size check and EOI - we don't want to let JPU cross
>   	 * buffer bounds in any case. Hope it's stopping by EOI.
>   	 */
> -	if (size < JPU_JPEG_MIN_SIZE || *(u8 *)(buffer + size - 1) != EOI)
> +	if (size < JPU_JPEG_MIN_SIZE ||
> +	    *(u8 *)(buffer + size - 1) != JPEG_MARKER_EOI)
>   		return 0;
>   
>   	for (;;) {
> @@ -624,14 +619,14 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
>   			c = get_byte(&jpeg_buffer);
>   		while (c == 0xff || c == 0);
>   
> -		if (!soi && c == SOI) {
> +		if (!soi && c == JPEG_MARKER_SOI) {
>   			soi = true;
>   			continue;
> -		} else if (soi != (c != SOI))
> +		} else if (soi != (c != JPEG_MARKER_SOI))
>   			return 0;
>   
>   		switch (c) {
> -		case SOF0: /* SOF0: baseline JPEG */
> +		case JPEG_MARKER_SOF0: /* SOF0: baseline JPEG */
>   			skip(&jpeg_buffer, 3); /* segment length and bpp */
>   			if (get_word_be(&jpeg_buffer, height) ||
>   			    get_word_be(&jpeg_buffer, width) ||
> @@ -640,11 +635,11 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
>   
>   			skip(&jpeg_buffer, 1);
>   			return get_byte(&jpeg_buffer);
> -		case DHT:
> -		case DQT:
> -		case COM:
> -		case DRI:
> -		case APP0 ... APP0 + 0x0f:
> +		case JPEG_MARKER_DHT:
> +		case JPEG_MARKER_DQT:
> +		case JPEG_MARKER_COM:
> +		case JPEG_MARKER_DRI:
> +		case JPEG_MARKER_APP0 ... JPEG_MARKER_APP0 + 0x0f:
>   			if (get_word_be(&jpeg_buffer, &word))
>   				return 0;
>   			skip(&jpeg_buffer, (long)word - 2);
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.h
> index 5570c79f122f5a09..4b665a3b630f8bf9 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.h
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.h
> @@ -11,6 +11,7 @@
>   #define JPEG_CORE_H_
>   
>   #include <linux/interrupt.h>
> +#include <media/jpeg.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-fh.h>
>   #include <media/v4l2-ctrls.h>
> @@ -36,17 +37,6 @@
>   
>   #define EXYNOS3250_IRQ_TIMEOUT		0x10000000
>   
> -/* a selection of JPEG markers */
> -#define JPEG_MARKER_TEM				0x01
> -#define JPEG_MARKER_SOF0				0xc0
> -#define JPEG_MARKER_DHT				0xc4
> -#define JPEG_MARKER_RST				0xd0
> -#define JPEG_MARKER_SOI				0xd8
> -#define JPEG_MARKER_EOI				0xd9
> -#define	JPEG_MARKER_SOS				0xda
> -#define JPEG_MARKER_DQT				0xdb
> -#define JPEG_MARKER_DHP				0xde
> -
>   /* Flags that indicate a format can be used for capture/output */
>   #define SJPEG_FMT_FLAG_ENC_CAPTURE	(1 << 0)
>   #define SJPEG_FMT_FLAG_ENC_OUTPUT	(1 << 1)
> diff --git a/include/media/jpeg.h b/include/media/jpeg.h
> new file mode 100644
> index 0000000000000000..a01e142e99a7d001
> --- /dev/null
> +++ b/include/media/jpeg.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _MEDIA_JPEG_H_
> +#define _MEDIA_JPEG_H_
> +
> +/* JPEG markers */
> +#define JPEG_MARKER_TEM		0x01
> +#define JPEG_MARKER_SOF0	0xc0
> +#define JPEG_MARKER_DHT		0xc4
> +#define JPEG_MARKER_RST		0xd0
> +#define JPEG_MARKER_SOI		0xd8
> +#define JPEG_MARKER_EOI		0xd9
> +#define JPEG_MARKER_SOS		0xda
> +#define JPEG_MARKER_DQT		0xdb
> +#define JPEG_MARKER_DRI		0xdd
> +#define JPEG_MARKER_DHP		0xde
> +#define JPEG_MARKER_APP0	0xe0
> +#define JPEG_MARKER_COM		0xfe
> +
> +#endif /* _MEDIA_JPEG_H_ */


