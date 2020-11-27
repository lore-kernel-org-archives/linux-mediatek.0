Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0897C63798
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:11:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5913F20B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 16:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUFLZQjk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFq//t+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5913F20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pCHLIfZhttGE48vZXB7eANVpBnnW0J4qdyGaxmodgfk=; b=dUFLZQjkfsva7QNz/XBmqBDvS
	avDl4TLMI0Rv3yx6IPYFrTQqGt3UJOzfEXMn3/dYpztq+nioTmZopnGavywOxOdwvIw5DFGwvlbAd
	8slab2ZFXpweOJWSI8JPcije8hi2yC7MOXiQzhtiuA3PwdZjcomGGE90Trmal3x/AvoK9iNuQfPww
	C39AUcXbJJXlsp1J8FhvT2uKBE10JqCzsmH0oR4Du7pihkdwLCWH7CVfPYCaNcwVFpIvDD3szTncy
	kWSYJ1UU7CDH86LY9LQcyqOaEhYHUTnkwpOEPoLqlpUF9pnpxk1Lxlx3oZBmPiocz6mQGCIrrTY1Y
	Bq1oRzjlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kigLU-000586-FG; Fri, 27 Nov 2020 16:11:40 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kigLP-000572-5b
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 16:11:36 +0000
Received: by mail-il1-x144.google.com with SMTP id k8so5047783ilr.4
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 08:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLIVGdors/jvY1LZOdEC4pOzls30kNbhHy34iFDXeSg=;
 b=rFq//t+8IjH5diUpGLOUN7ZfRNM30YFN0twMHSpHm/UGk0MxD5+0oD354DZvb9t6zf
 8MPLulmot2rq0qHu5JOgD0pm/owtY5v0t920vRHA1CeQDmDtvHV0HHDPoayTUc0ijfz7
 KSoVlvnA9pSJQStL2Iw7QfT+0fgaSbiCNLRAZ0sBdpLIYE7LtX6s8rNbvXQMLYMP1aoK
 cdb28w51Jex/GhDyY6sFH/xyNXKoGb9qMBAYASdBG5N+rvC9IuMssVMkSiH6ypS734Cb
 2+wMGjb8UNw+3RmXWSq+Auyb7q8x6O4cu0Df8CDDnM2M5ZgKlR9OEbhg8KRwRwhXJQlK
 aSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLIVGdors/jvY1LZOdEC4pOzls30kNbhHy34iFDXeSg=;
 b=EUM1IM53StmUxyuq96ArSxSMhedlrlWE+l9CfmU6xKXQyMkECyednN22Di4T+UVwFW
 jfXKqmbY4MibRb1iyiTIWuyKCRYwA9C0gLN2951gTnSCqmCGnHvxzoIfxz3gQ+gi36bj
 tnNOOCcf0uMXjRXvf+3nw9Kpfr4VNpG3tJhzB+bGHt9gu2SKpm0hvFmXzwy8XiKj1pKl
 B8lYQ/MbEj2zCkDgitle5LjanyVVu05BHwjVp6azQ4Oy1Xj8PrvOzLbZS8g8PJIjjTxl
 EpdRZh0aVrjNcB1I8pVOHeuoG6Cn/gibszJE/l0whNFC5df+tjIdk+DzzY+IWiyVpibN
 SoVg==
X-Gm-Message-State: AOAM532X0N8nLi4+X336ikzF192gVXUiPdbAK4NMJzS/7yMLsYumDZXz
 hrFDsmd2Vne/9Orp/N4wWdique3Fl5B8bagoN8naZg==
X-Google-Smtp-Source: ABdhPJwaRqOXi6U80AZBCmE/d3ARD9FAnoZR7HmPy9JnwQSWhO1d9QbGRcR5szwcr5uw9gKmC+fNkMzV+ik2ROQT5OE=
X-Received: by 2002:a05:6e02:47:: with SMTP id i7mr7580931ilr.57.1606493491327; 
 Fri, 27 Nov 2020 08:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com>
In-Reply-To: <20201127092941.1646260-1-tzungbi@google.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Nov 2020 09:11:19 -0700
Message-ID: <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To: Tzung-Bi Shih <tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_111135_351780_149532D7 
X-CRM114-Status: GOOD (  25.84  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
>
> Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
> initialized only if the offset is clear.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> The patch bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next
>
> The first 2 patches in the series
> https://patchwork.kernel.org/project/linux-remoteproc/cover/20201116084413.3312631-1-tzungbi@google.com/
> have been merged to remoteproc for-next branch.
>
> Follow up the discussion in
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20201116084413.3312631-4-tzungbi@google.com/#23784483
>
> The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> aware of it and will upgrade the devices' kernel and SCP firmware
> carefully.  Other than that, AFAICT, no other devices in the wild are
> using this driver.
>
>  drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 24 deletions(-)

This is the exact same patch that you sent here [1], that I commented
on, and that you agreed with my assessment.

What do you want me to do here?  What am I missing?

[1]. https://patchwork.kernel.org/project/linux-remoteproc/patch/20201116084413.3312631-4-tzungbi@google.com/

>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 7e0f1e1a335b..4467ed646bb1 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -21,7 +21,7 @@
>  #include "remoteproc_internal.h"
>
>  #define MAX_CODE_SIZE 0x500000
> -#define SCP_FW_END 0x7C000
> +#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>
>  /**
>   * scp_get() - get a reference to SCP.
> @@ -119,16 +119,24 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>         wake_up(&scp->ack_wq);
>  }
>
> -static int scp_ipi_init(struct mtk_scp *scp)
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +                                    const struct firmware *fw,
> +                                    size_t *offset);
> +
> +static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
>  {
> -       size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
> -       size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
> +       int ret;
> +       size_t offset;
> +
> +       ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
> +       if (ret)
> +               return ret;
> +       dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
>
> -       /* shared buffer initialization */
> -       scp->recv_buf =
> -               (struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
> -       scp->send_buf =
> -               (struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> +       scp->recv_buf = (struct mtk_share_obj __iomem *)
> +                       (scp->sram_base + offset);
> +       scp->send_buf = (struct mtk_share_obj __iomem *)
> +                       (scp->sram_base + offset + sizeof(*scp->recv_buf));
>         memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
>         memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
>
> @@ -271,6 +279,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>         return ret;
>  }
>
> +static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
> +                                    const struct firmware *fw,
> +                                    size_t *offset)
> +{
> +       struct elf32_hdr *ehdr;
> +       struct elf32_shdr *shdr, *shdr_strtab;
> +       int i;
> +       const u8 *elf_data = fw->data;
> +       const char *strtab;
> +
> +       ehdr = (struct elf32_hdr *)elf_data;
> +       shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> +       shdr_strtab = shdr + ehdr->e_shstrndx;
> +       strtab = (const char *)(elf_data + shdr_strtab->sh_offset);
> +
> +       for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> +               if (strcmp(strtab + shdr->sh_name,
> +                          SECTION_NAME_IPI_BUFFER) == 0) {
> +                       *offset = shdr->sh_addr;
> +                       return 0;
> +               }
> +       }
> +
> +       return -ENOENT;
> +}
> +
>  static int mt8183_scp_before_load(struct mtk_scp *scp)
>  {
>         /* Clear SCP to host interrupt */
> @@ -350,11 +384,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>
>         ret = scp->data->scp_before_load(scp);
>         if (ret < 0)
> -               return ret;
> +               goto leave;
>
>         ret = scp_elf_load_segments(rproc, fw);
> -       clk_disable_unprepare(scp->clk);
> +       if (ret)
> +               goto leave;
>
> +       ret = scp_ipi_init(scp, fw);
> +leave:
> +       clk_disable_unprepare(scp->clk);
>         return ret;
>  }
>
> @@ -680,19 +718,6 @@ static int scp_probe(struct platform_device *pdev)
>                 goto release_dev_mem;
>         }
>
> -       ret = clk_prepare_enable(scp->clk);
> -       if (ret) {
> -               dev_err(dev, "failed to enable clocks\n");
> -               goto release_dev_mem;
> -       }
> -
> -       ret = scp_ipi_init(scp);
> -       clk_disable_unprepare(scp->clk);
> -       if (ret) {
> -               dev_err(dev, "Failed to init ipi\n");
> -               goto release_dev_mem;
> -       }
> -
>         /* register SCP initialization IPI */
>         ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
>         if (ret) {
> --
> 2.29.2.454.gaff20da3a2-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
