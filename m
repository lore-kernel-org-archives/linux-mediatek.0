Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1BAC4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:47:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E838221EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="far2K4yJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFIxmImc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E838221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ee2IAtFooJHWjYCFK6wUT3Evh8GF1lxxUm7UUaRnWTk=; b=far2K4yJWHHyIRqD5XAixDlyR
	4QtmvI2JvIOh5ca+56VdVeUFZY/KLdC3huu/gdyL53kPEDCmjuIvxnhLCL8wqe6pN0wCkl8V9shZx
	3AwosSEZ7I0D92m/meqT/FcdSPw0AM4jxIw6+IorWnBfOjVxinzoVAPfiv/puzTzOtY4FJZsNJZFB
	+uNExAqOOPUYTRVwhEnvZE1Vjw8OmD3iCeEfgbpPdV+fC7i7yTeZITd8qiTQtK0/NKShAQVRt2Uz4
	rQB+c3W6NrA166oamW4myo0WPHzKBRa1gf0HAECJ0rPDJC5FFnjc5Tub4obb5E1dxEwGSEBtbDKZl
	bNaba3FiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKglX-0008LC-PI; Tue, 22 Sep 2020 11:47:24 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKglR-0008Jc-5E; Tue, 22 Sep 2020 11:47:17 +0000
Received: by mail-il1-x144.google.com with SMTP id x18so14497853ila.7;
 Tue, 22 Sep 2020 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ZznVRxbDUmI1MVFhhzO32PT/Ot4Fflk3jY6Lb5eXQw=;
 b=JFIxmImcctlYkp7BavAvPhTYhgZMZveYF1DxxMpZfTjLx1NdGN2l85yQ1lQNIJRd+q
 jRxrY/wwZ9axKxPGIrig54MFwdE3E7XfnOAbEejg3exGszjswdnUd3cmNKSpZoPf1HoI
 jSsuyajsXfPJNxd1edjPg0vQgoWFJZFVmCE2Ddy5R64I85pfOZ/CNBG7LBa1FoLL0q1p
 3ySrbMBp4CZD/oGpVh8o0B+Kssrzer6s609n8/opbB9S6v4o84yrqvme9enRj1Gg+68o
 4A0rPT+gyyw/OfXNQ4DPChLDr+Auwxsk0AKnJ5a7CEpEEYafdc2cWpnH5nLXbKSqAxhf
 wlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ZznVRxbDUmI1MVFhhzO32PT/Ot4Fflk3jY6Lb5eXQw=;
 b=GqNMBN5e3jTX1j1YWokt8B2LYk/R3XPtCexF5dnpC0/oGlpsmJXYX9lS8q6nJ/3Ke3
 3A7x9rzmwNedJXt7i/rrYVWB+9663WdfiwrPJRgvIeuSNd31UbTgdqel3ksL4JuR+F3W
 +SblD5hNav0E9WekVC2wCsjW7CfyG/+G8S1Ps76NKtNjG56C7iVH+fIn9GDVsGhJ1BcH
 fmaJJgJinnAskQjotsJLVQQoxs3goskVLkMLgxDhbpK4PxSX1Ohmbs0utX04dBC2sCYC
 IPDeVCYJXJgB1XUrjp2So+q6+Z4b7k1wR98h6X0q8gzT4z5xaHJLLxM1ZfESGHYdT4p9
 iOCw==
X-Gm-Message-State: AOAM5338D+1dA4U967kiHQFf64DO6IJ9DHWsRjXuz5A3sYK0VWXit22g
 mowdWQThLguUs0+q7aWk2lFtKkURo6nsAFwJY9w=
X-Google-Smtp-Source: ABdhPJw4I8/+CRAsoMH1DWvhvkqW0BE/0GGErYO1ROiQehW/d3UJh8e95INcPpCBkJvII6TGtTku5A9WAKtvT4rbhKU=
X-Received: by 2002:a92:c10c:: with SMTP id p12mr3679348ile.274.1600775235373; 
 Tue, 22 Sep 2020 04:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200922114317.2935897-1-gch981213@gmail.com>
In-Reply-To: <20200922114317.2935897-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 22 Sep 2020 19:47:04 +0800
Message-ID: <CAJsYDVJugyZQage-aWUqUoHEq6dhNdMw4J+0PmzGKrO=s9hoBw@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: fix timeout calculation overflow
To: linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_074717_291429_09C5FE1C 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?QmF5aSBDaGVuZyAo56iL5YWr5oSPKQ==?= <bayi.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 7:43 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> CLK_TO_US macro is used to calculate potential transfer time for various
> timeout handling. However it overflows on transfer bigger than 512 bytes
> because it first did (len * 8 * 1000000).
> This controller typically operates at 45MHz. This patch did 2 things:
> 1. calculate clock / 1000000 first
> 2. add a 4M transfer size cap so that the final timeout in DMA reading
>    doesn't overflow
>
> Fixes: 881d1ee9fe81f ("spi: add support for mediatek spi-nor controller")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/spi/spi-mtk-nor.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 6e6ca2b8e6c82..619313db42c0e 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -89,7 +89,7 @@
>  // Buffered page program can do one 128-byte transfer
>  #define MTK_NOR_PP_SIZE                        128
>
> -#define CLK_TO_US(sp, clkcnt)          ((clkcnt) * 1000000 / sp->spi_freq)
> +#define CLK_TO_US(sp, clkcnt)          DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
>
>  struct mtk_nor {
>         struct spi_controller *ctlr;
> @@ -177,6 +177,10 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
>                 if ((op->data.dir == SPI_MEM_DATA_IN) &&
>                     mtk_nor_match_read(op)) {
> +                       // limit size to prevent timeout calculation overflow
> +                       if (op->data.nbytes > 0x2000000)
> +                               op->data.nbytes = 0x2000000;
> +

Sorry, wrong patch. This cap should be 4M not 32M. I'll send a v2 immediately.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
