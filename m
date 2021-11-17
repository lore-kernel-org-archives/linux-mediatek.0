Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 19:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB99260FED
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 19:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB99260FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malainey.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWT2/Xna65M+Edrl3cqy0x5Rj47KGJlx7AMMj4kyJEA=; b=vSxFvYo9PDU0fL
	3wlmyTVayIAHjtb43Q9nsDO5otu5FC/vXEfC89MuyJ2IXETU1OB6sx3651+t3kjwHVvPAVwCmzp0K
	E3IgjHnlKwn1EG4HrPzPV7IB2LJiaKICEwSia5FQcoRYRII1oRPirpNOLhg1iwTSt0hSJR3Rt+T3v
	KsA9fMY+2n6v83nBn3/GgxwxGC88ihBgCFXi/jy8k16EdzyLCWiFxclwXiYwg0e6sIWxq9tR3daaV
	eN7mJapZL9kZVUkUaVq8MHZ7FQGCi1XIHa2GfXpIm8V24hiTZFtS+L2bl7WqFEy+AwDzTl4f7q6dD
	aEBTbDyf3HylUJttYsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnQIU-0068jO-DL; Wed, 17 Nov 2021 19:08:42 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnQIR-0068iy-Ei
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 19:08:41 +0000
Received: by mail-qt1-x834.google.com with SMTP id t11so3689736qtw.3
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 11:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malainey-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOL7eE0Q3hd+mhUI/Nv+APzSnGBoeLeug1fw2QweSqs=;
 b=lTpBRs5Fko+5HFhoU48vQs6A91Aga9+/RZ3u3JMiswwTpn8u5p7dtepmKp1T/pPgba
 LtKhwXCKA9zbIWkE57tESkzODhvJ1kg/9jMvAiOM98KZrxCSsYWr4cqRzhbAo8xbomyu
 +2waHDLtiUlinGJ1MTGlwXbJIHOoizFaBEm0yrsBOv0Q6UNyEvzkio0D0tqciIHCzwtN
 BXq1B9474U4CWs6eSLVJgbD/G7TuiWw+DRL+f8gqTjNS0kaF7fNgt3PJFUarzDacd3lL
 /RxjnloLGlu+hbuIejZslZo5k2sYbykK082Ng102G0hHJHJMmLmlGOAWsVvAAKSlc69A
 pg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOL7eE0Q3hd+mhUI/Nv+APzSnGBoeLeug1fw2QweSqs=;
 b=l0ycO58AyzsgOb5C8jfiLixtRlzUVuBGp9B+pB7mJ8f2Ej3faLLM4fpuKua6mjmx7a
 ZRG/K/t1SXR9/glMwCedJPa+8mwGK0wJvSq/Ew87k31SMoUhJUl3gbeld3M4hPqkBW/E
 DDw20cuN6VeqEqxTt3XdbtzxKykM84yu+vOFHmO8xithwKxE2Q9Jf9Rz4V/CHDNiHW5G
 iiqP+1/zI7n6LcxkTg8fNCYylfIqpExB3Un7Hx0A11fwhXeMYWduXxiCAGWDMQ0PivWA
 likZ2wBZZgBW2AOj5ZnF7x//LLoOT6tqwZlBAVvmsf+DTICEciHr0wRvcoQKTcGUV331
 qn4w==
X-Gm-Message-State: AOAM5323/ePyLlM07daJIHsUBswv9gPb+V3sou8E6DG4RDVoRPQDkhoz
 2+FQBaboJ67Wytujznqz501dq080ICBo47HqWXbt4A==
X-Google-Smtp-Source: ABdhPJzUTQf2EfT3mISSLE1AKgA4ZDITTxHqjY57ZZ3iS/egKUACEDVR/p3j8oww9pvC2iWcdwpTzIcJ4zDA4qDasKg=
X-Received: by 2002:a05:622a:610:: with SMTP id
 z16mr19642336qta.184.1637176117615; 
 Wed, 17 Nov 2021 11:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-14-daniel.baluta@oss.nxp.com>
In-Reply-To: <20211117093734.17407-14-daniel.baluta@oss.nxp.com>
From: Curtis Malainey <curtis@malainey.com>
Date: Wed, 17 Nov 2021 11:08:26 -0800
Message-ID: <CABkGCGd47cq92tPgDK-m+guTSvc9BsdPaSGCPPoEHB2uczuXcQ@mail.gmail.com>
Subject: Re: [PATCH 13/21] ASoC: SOF: amd: Add support for SOF firmware
 authentication
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, 
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, 
 daniel.baluta@nxp.com, daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com, 
 Balakishore.pati@amd.com, vsreddy@amd.com, Julian.Schroeder@amd.com, 
 vishnuvardhanrao.ravulapati@amd.com, linux-kernel@vger.kernel.org, 
 yc.hung@mediatek.com, linux-mediatek@lists.infradead.org, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_110839_587857_F8A27BCE 
X-CRM114-Status: GOOD (  27.20  )
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

On Wed, Nov 17, 2021 at 1:38 AM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>
> Add callback to notify PSP after loading firmware on DSP. PSP will
> validate the loaded firmware and set qualifier bit to run firmware
> on secured AMD systems.
>
> Signed-off-by: Julian Schroeder <Julian.Schroeder@amd.com>
> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Curtis Malainey <curtis@malainey.com>

Sorry github must be attached to the wrong email, please use

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>

> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/amd/acp-dsp-offset.h |  4 ++
>  sound/soc/sof/amd/acp.c            | 66 +++++++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h            | 21 ++++++++++
>  sound/soc/sof/amd/pci-rn.c         |  5 +++
>  4 files changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
> index 1d11e9d69dce..63f13c111b24 100644
> --- a/sound/soc/sof/amd/acp-dsp-offset.h
> +++ b/sound/soc/sof/amd/acp-dsp-offset.h
> @@ -54,6 +54,9 @@
>  #define ACP_PGFSM_STATUS                       0x1420
>
>  /* Registers from ACP_INTR block */
> +#define ACP_EXTERNAL_INTR_ENB                  0x1800
> +#define ACP_EXTERNAL_INTR_CNTL                 0x1804
> +#define ACP_EXTERNAL_INTR_STAT                 0x1808
>  #define ACP_DSP_SW_INTR_CNTL                   0x1814
>  #define ACP_DSP_SW_INTR_STAT                    0x1818
>  #define ACP_SW_INTR_TRIG                        0x181C
> @@ -68,6 +71,7 @@
>  #define ACP_SHA_DMA_CMD_STS                    0x1CC0
>  #define ACP_SHA_DMA_ERR_STATUS                 0x1CC4
>  #define ACP_SHA_TRANSFER_BYTE_CNT              0x1CC8
> +#define ACP_SHA_PSP_ACK                         0x1C74
>
>  #define ACP_SCRATCH_REG_0                      0x10000
>
> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 74ede28aa8d8..4c5550e8d364 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -20,6 +20,22 @@
>  #include "acp.h"
>  #include "acp-dsp-offset.h"
>
> +static int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
> +{
> +       pci_write_config_dword(dev, 0x60, smn_addr);
> +       pci_write_config_dword(dev, 0x64, data);
> +
> +       return 0;
> +}
> +
> +static int smn_read(struct pci_dev *dev, u32 smn_addr, u32 *data)
> +{
> +       pci_write_config_dword(dev, 0x60, smn_addr);
> +       pci_read_config_dword(dev, 0x64, data);
> +
> +       return 0;
> +}
> +
>  static void configure_acp_groupregisters(struct acp_dev_data *adata)
>  {
>         struct snd_sof_dev *sdev = adata->dev;
> @@ -135,6 +151,25 @@ int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
>         return ret;
>  }
>
> +static int psp_fw_validate(struct acp_dev_data *adata)
> +{
> +       struct snd_sof_dev *sdev = adata->dev;
> +       int timeout;
> +       u32 data;
> +
> +       smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, MBOX_ACP_SHA_DMA_COMMAND);
> +
> +       for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
> +               msleep(20);
> +               smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
> +               if (data & MBOX_READY_MASK)
> +                       return 0;
> +       }
> +
> +       dev_err(sdev->dev, "FW validation timedout: status %x\n", data & MBOX_STATUS_MASK);
> +       return -ETIMEDOUT;
> +}
> +
>  int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
>                               unsigned int start_addr, unsigned int dest_addr,
>                               unsigned int image_length)
> @@ -174,7 +209,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
>                 return ret;
>         }
>
> -       snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER, DSP_FW_RUN_ENABLE);
> +       ret = psp_fw_validate(adata);
> +       if (ret)
> +               return ret;
>
>         fw_qualifier = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER);
>         if (!(fw_qualifier & DSP_FW_RUN_ENABLE)) {
> @@ -238,6 +275,13 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
>         struct snd_sof_dev *sdev = context;
>         unsigned int val;
>
> +       val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT);
> +       if (val & ACP_SHA_STAT) {
> +               /* Clear SHA interrupt raised by PSP */
> +               snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT, val);
> +               return IRQ_HANDLED;
> +       }
> +
>         val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
>         if (val & ACP_DSP_TO_HOST_IRQ) {
>                 sof_ops(sdev)->irq_thread(irq, sdev);
> @@ -326,6 +370,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
>  {
>         struct pci_dev *pci = to_pci_dev(sdev->dev);
>         struct acp_dev_data *adata;
> +       const struct sof_amd_acp_desc *chip;
>         unsigned int addr;
>         int ret;
>
> @@ -346,18 +391,32 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
>
>         sdev->pdata->hw_pdata = adata;
>
> +       chip = get_chip_info(sdev->pdata);
> +       if (!chip) {
> +               dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
> +               return -EIO;
> +       }
> +
> +       adata->smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, chip->host_bridge_id, NULL);
> +       if (!adata->smn_dev) {
> +               dev_err(sdev->dev, "Failed to get host bridge device\n");
> +               return -ENODEV;
> +       }
> +
>         sdev->ipc_irq = pci->irq;
>         ret = request_threaded_irq(sdev->ipc_irq, acp_irq_handler, acp_irq_thread,
>                                    IRQF_SHARED, "AudioDSP", sdev);
>         if (ret < 0) {
>                 dev_err(sdev->dev, "failed to register IRQ %d\n",
>                         sdev->ipc_irq);
> +               pci_dev_put(adata->smn_dev);
>                 return ret;
>         }
>
>         ret = acp_init(sdev);
>         if (ret < 0) {
>                 free_irq(sdev->ipc_irq, sdev);
> +               pci_dev_put(adata->smn_dev);
>                 return ret;
>         }
>
> @@ -371,6 +430,11 @@ EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
>
>  int amd_sof_acp_remove(struct snd_sof_dev *sdev)
>  {
> +       struct acp_dev_data *adata = sdev->pdata->hw_pdata;
> +
> +       if (adata->smn_dev)
> +               pci_dev_put(adata->smn_dev);
> +
>         if (sdev->ipc_irq)
>                 free_irq(sdev->ipc_irq, sdev);
>
> diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
> index fd923f72a01a..a2f8e4219066 100644
> --- a/sound/soc/sof/amd/acp.h
> +++ b/sound/soc/sof/amd/acp.h
> @@ -52,6 +52,15 @@
>
>  #define ACP_DSP_TO_HOST_IRQ                    0x04
>
> +#define HOST_BRIDGE_CZN                                0x1630
> +#define ACP_SHA_STAT                           0x8000
> +#define ACP_PSP_TIMEOUT_COUNTER                        5
> +#define ACP_EXT_INTR_ERROR_STAT                        0x20000000
> +#define MP0_C2PMSG_26_REG                      0x03810570
> +#define MBOX_ACP_SHA_DMA_COMMAND               0x330000
> +#define MBOX_READY_MASK                                0x80000000
> +#define MBOX_STATUS_MASK                       0xFFFF
> +
>  struct  acp_atu_grp_pte {
>         u32 low;
>         u32 high;
> @@ -140,6 +149,7 @@ struct acp_dev_data {
>         struct dma_descriptor dscr_info[ACP_MAX_DESC];
>         struct acp_dsp_stream stream_buf[ACP_MAX_STREAM];
>         struct acp_dsp_stream *dtrace_stream;
> +       struct pci_dev *smn_dev;
>  };
>
>  void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
> @@ -202,4 +212,15 @@ int snd_amd_acp_find_config(struct pci_dev *pci);
>  /* Trace */
>  int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
>  int acp_sof_trace_release(struct snd_sof_dev *sdev);
> +
> +struct sof_amd_acp_desc {
> +       unsigned int host_bridge_id;
> +};
> +
> +static inline const struct sof_amd_acp_desc *get_chip_info(struct snd_sof_pdata *pdata)
> +{
> +       const struct sof_dev_desc *desc = pdata->desc;
> +
> +       return desc->chip_info;
> +}
>  #endif
> diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
> index 3c379a5ef231..392ffbdf6417 100644
> --- a/sound/soc/sof/amd/pci-rn.c
> +++ b/sound/soc/sof/amd/pci-rn.c
> @@ -43,12 +43,17 @@ static const struct resource renoir_res[] = {
>         },
>  };
>
> +static const struct sof_amd_acp_desc renoir_chip_info = {
> +       .host_bridge_id = HOST_BRIDGE_CZN,
> +};
> +
>  static const struct sof_dev_desc renoir_desc = {
>         .machines               = snd_soc_acpi_amd_sof_machines,
>         .resindex_lpe_base      = 0,
>         .resindex_pcicfg_base   = -1,
>         .resindex_imr_base      = -1,
>         .irqindex_host_ipc      = -1,
> +       .chip_info              = &renoir_chip_info,
>         .default_fw_path        = "amd/sof",
>         .default_tplg_path      = "amd/sof-tplg",
>         .default_fw_filename    = "sof-rn.ri",
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
