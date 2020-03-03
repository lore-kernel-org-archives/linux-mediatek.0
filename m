Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F75AC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 14:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401DE2083E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 14:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTO3qGfG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Jyu1whJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 401DE2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ+igY3vrEUABN2q9XBVBauLLl+UjfGUKg/3QFScU70=; b=DTO3qGfGrRrLCU
	aVWvTm3IXGQTD54UqDP2ONi4Kmqs/raprJYeXL1u7EPTI0hudy9T5Hugr1/lm8PX4d3d3cszFVAIh
	DPl2CjbSOpKB1J3PR8BV93yIrw5OJ7URLN56KOXM8QlORCSSTIKH+kwIB4KEs6MZho7H5Ow5B7io6
	e6ZOlIC+U1lmZlu8pUzfbeJeuaT4adbxpJdGVPuuNceo1geUa+HQM6LnMzATxvoAEyLew0cgYmZ73
	rNih+QwGwtE77YC9XcqVi0LbsdlpVLyj72E12zaVLFkgWyAlpS6M/VQVqo6NRn65zjLDvsyB56wBi
	+5PcThSu6LqnjCwe4YOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98TF-0007QU-N4; Tue, 03 Mar 2020 14:24:29 +0000
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98T0-0007D8-Pf; Tue, 03 Mar 2020 14:24:17 +0000
Received: from [IPv6:2001:983:e9a7:1:8c14:57ad:bac0:273b]
 ([IPv6:2001:983:e9a7:1:8c14:57ad:bac0:273b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 98ScjVEzW9Im298SdjzuTx; Tue, 03 Mar 2020 15:24:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1583245446; bh=jS4ZxNmoD4GaWSXQE5OZus/wUWGTloTdylSEFmJJoA0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Jyu1whJcyO4vZ62Zisw/p+qhwKGGm+8ESbBbUTvzNENtTeqXlKjSiuRP6ngiOf05d
 HkF8csghsgLmCjAuKEn1X+sDvJlBX0sr9fWqfwhNeMdCJAvMCHr+GPYee1GMe/d3RB
 LHAo2VCrC3WHwGsivDGedpkOqy46oQFJr5+UqWqluRkFE+5xbHJTXZ0UhFDdq21J+f
 q9o5NXFg/r/9UhFD9PO4/HADhvlvghsEv6pD0ITmQTW2Q31KWMy/E1RwYpImtVBLeS
 HIL8G/CctpvrQ4VzAjLDyphZzABMAu3fpYDPxA++YGBEgeFCTsjGAYssMSq5ItnMmY
 C9rGkZiPJ4FnQ==
Subject: Re: [PATCH v4] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200302044021.97415-1-hsinyi@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <46f27a3b-de4c-8d43-d6d7-d6332ee30451@xs4all.nl>
Date: Tue, 3 Mar 2020 15:23:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302044021.97415-1-hsinyi@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOAPE1IN/cClyfoWL2QQFp0l8HqJGt1VbIXw4OS692YQI0LpaIy9p8tkRVqKdufrFX8q+ovnpamg9y5ayLzmkC7rguOgttrMKxhxUNq2xFE8/WwbIvLt
 7cPaRqSzRfFqog0jM/Me69vKU2L23wU8mqqZxo5Olok5RliChOW0EI2u3jIsVv0kCDiP5eLMdt8TdcYlDayUgzIwf8MKeJ+qc8pm7R3j1UxHQU4FJP+bLaEI
 VmLCeKuA3l59ukrlGg9SdYJyL7+KleJvwD1Jn0QUo/1/Px7/7Dy0orezSJvCDNiXz/s88/xsbGZpoVfVH4MUZt6R6ZFKQr5eH7HvDDJh1n9LOn//+gykRonU
 W6Isw26uPrM2YoGet961vuDDD8XuUL4sHiMUbJsnilyJpWuYTqey4cR5jxjxm6A+u7sp34MnRiCHMMi67XAUMVzkXaUJHiuc3AcbPdH0bnZCGSjBmXW80zNj
 ou1UUE9jbZre6dO3Oel38u9NI8OBlti0emSVwqc2w868ywS9UiMe7XMsvbxkCple0UuvweRGbr6sv10LcrNJVkUwPEdn8a9kWLL7m7sIwwyGykzLxJNG7D9r
 9VS6MHerAY/J230B9d0tZUL3af6g3FfFMG4mNjyam1/o2zucpm16kM/NvTP6UwAqWhZ9LGswB4mcd0/trIFwQLilkmKlZJZdE6S1fUQHryowJ79r2WPK0eby
 gLld5fFnNpFRRa3+MHq1Ry8Am7QdRU7O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_062415_000750_0D3C6E66 
X-CRM114-Status: GOOD (  23.77  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/03/2020 05:40, Hsin-Yi Wang wrote:
> media: mtk-vpu: avoid unaligned access to DTCM buffer.
> 
> Previously, vpu->recv_buf and send_buf are forced cast from
> void __iomem *tcm. vpu->recv_buf->share_buf is passed to
> vpu_ipi_desc.handler(). It's not able to do unaligned access. Otherwise
> kernel would crash due to unable to handle kernel paging request.
> 
> struct vpu_run {
> 	u32 signaled;
> 	char fw_ver[VPU_FW_VER_LEN];
> 	unsigned int	dec_capability;
> 	unsigned int	enc_capability;
> 	wait_queue_head_t wq;
> };
> 
> fw_ver starts at 4 byte boundary. If system enables
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> 
> vpu_init_ipi_handler() calls strscpy(), which would lead to crash.
> 
> vpu_init_ipi_handler() and several other handlers (eg.
> vpu_dec_ipi_handler) only do read access to this data, so they can be
> const, and we can use memcpy_fromio() to copy the buf to another non iomem
> buffer then pass to handler.
> 
> Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change in v4:
> - Remove forced casting recv_buf from tcm. Copy iomem data before passing
>   to handler.
> Change in v2, v3:
> - fix sparse warnings.
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c  |  9 ++--
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  6 +--
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 12 ++---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c      | 45 ++++++++++---------
>  drivers/media/platform/mtk-vpu/mtk_vpu.h      |  2 +-
>  5 files changed, 38 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> index 6720d11f50cf..dc95b8a44759 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> @@ -15,7 +15,7 @@ static inline struct mtk_mdp_ctx *vpu_to_ctx(struct mtk_mdp_vpu *vpu)
>  	return container_of(vpu, struct mtk_mdp_ctx, vpu);
>  }
>  
> -static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
> +static void mtk_mdp_vpu_handle_init_ack(const struct mdp_ipi_comm_ack *msg)
>  {
>  	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
>  					(unsigned long)msg->ap_inst;
> @@ -26,10 +26,11 @@ static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
>  	vpu->inst_addr = msg->vpu_inst_addr;
>  }
>  
> -static void mtk_mdp_vpu_ipi_handler(void *data, unsigned int len, void *priv)
> +static void mtk_mdp_vpu_ipi_handler(const void *data, unsigned int len,
> +				    void *priv)
>  {
> -	unsigned int msg_id = *(unsigned int *)data;
> -	struct mdp_ipi_comm_ack *msg = (struct mdp_ipi_comm_ack *)data;
> +	unsigned int msg_id = *(const unsigned int *)data;
> +	const struct mdp_ipi_comm_ack *msg = data;

Why not just do:

	const struct mdp_ipi_comm_ack *msg = data;
	unsigned int msg_id = msg->msg_id;

Much cleaner.

Other than this small issue this patch looks nice. No more sparse/smatch warnings
and no more weird casts :-)

Regards,

	Hans

>  	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
>  					(unsigned long)msg->ap_inst;
>  	struct mtk_mdp_ctx *ctx;
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> index 70abfd4cd4b9..948a12fd9d46 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> @@ -9,7 +9,7 @@
>  #include "vdec_ipi_msg.h"
>  #include "vdec_vpu_if.h"
>  
> -static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
> +static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
>  {
>  	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
>  					(unsigned long)msg->ap_inst_addr;
> @@ -34,9 +34,9 @@ static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
>   * This function runs in interrupt context and it means there's an IPI MSG
>   * from VPU.
>   */
> -static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
> +static void vpu_dec_ipi_handler(const void *data, unsigned int len, void *priv)
>  {
> -	struct vdec_vpu_ipi_ack *msg = data;
> +	const struct vdec_vpu_ipi_ack *msg = data;
>  	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
>  					(unsigned long)msg->ap_inst_addr;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index 3e931b0ed096..9540709c1905 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -8,26 +8,26 @@
>  #include "venc_ipi_msg.h"
>  #include "venc_vpu_if.h"
>  
> -static void handle_enc_init_msg(struct venc_vpu_inst *vpu, void *data)
> +static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
>  {
> -	struct venc_vpu_ipi_msg_init *msg = data;
> +	const struct venc_vpu_ipi_msg_init *msg = data;
>  
>  	vpu->inst_addr = msg->vpu_inst_addr;
>  	vpu->vsi = vpu_mapping_dm_addr(vpu->dev, msg->vpu_inst_addr);
>  }
>  
> -static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, void *data)
> +static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
>  {
> -	struct venc_vpu_ipi_msg_enc *msg = data;
> +	const struct venc_vpu_ipi_msg_enc *msg = data;
>  
>  	vpu->state = msg->state;
>  	vpu->bs_size = msg->bs_size;
>  	vpu->is_key_frm = msg->is_key_frm;
>  }
>  
> -static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
> +static void vpu_enc_ipi_handler(const void *data, unsigned int len, void *priv)
>  {
> -	struct venc_vpu_ipi_msg_common *msg = data;
> +	const struct venc_vpu_ipi_msg_common *msg = data;
>  	struct venc_vpu_inst *vpu =
>  		(struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
>  
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index a768707abb94..2fbccc9b247b 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -203,8 +203,8 @@ struct mtk_vpu {
>  	struct vpu_run run;
>  	struct vpu_wdt wdt;
>  	struct vpu_ipi_desc ipi_desc[IPI_MAX];
> -	struct share_obj *recv_buf;
> -	struct share_obj *send_buf;
> +	struct share_obj __iomem *recv_buf;
> +	struct share_obj __iomem *send_buf;
>  	struct device *dev;
>  	struct clk *clk;
>  	bool fw_loaded;
> @@ -292,7 +292,7 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		 unsigned int len)
>  {
>  	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
> -	struct share_obj *send_obj = vpu->send_buf;
> +	struct share_obj __iomem *send_obj = vpu->send_buf;
>  	unsigned long timeout;
>  	int ret = 0;
>  
> @@ -325,9 +325,9 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy((void *)send_obj->share_buf, buf, len);
> -	send_obj->len = len;
> -	send_obj->id = id;
> +	memcpy_toio(send_obj->share_buf, buf, len);
> +	writel(len, &send_obj->len);
> +	writel(id, &send_obj->id);
>  
>  	vpu->ipi_id_ack[id] = false;
>  	/* send the command to VPU */
> @@ -600,10 +600,10 @@ int vpu_load_firmware(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(vpu_load_firmware);
>  
> -static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
> +static void vpu_init_ipi_handler(const void *data, unsigned int len, void *priv)
>  {
> -	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> -	struct vpu_run *run = (struct vpu_run *)data;
> +	struct mtk_vpu *vpu = priv;
> +	const struct vpu_run *run = data;
>  
>  	vpu->run.signaled = run->signaled;
>  	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> @@ -700,19 +700,21 @@ static int vpu_alloc_ext_mem(struct mtk_vpu *vpu, u32 fw_type)
>  
>  static void vpu_ipi_handler(struct mtk_vpu *vpu)
>  {
> -	struct share_obj *rcv_obj = vpu->recv_buf;
> +	struct share_obj __iomem *rcv_obj = vpu->recv_buf;
>  	struct vpu_ipi_desc *ipi_desc = vpu->ipi_desc;
> -
> -	if (rcv_obj->id < IPI_MAX && ipi_desc[rcv_obj->id].handler) {
> -		ipi_desc[rcv_obj->id].handler(rcv_obj->share_buf,
> -					      rcv_obj->len,
> -					      ipi_desc[rcv_obj->id].priv);
> -		if (rcv_obj->id > IPI_VPU_INIT) {
> -			vpu->ipi_id_ack[rcv_obj->id] = true;
> +	unsigned char data[SHARE_BUF_SIZE];
> +	s32 id = readl(&rcv_obj->id);
> +
> +	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
> +	if (id < IPI_MAX && ipi_desc[id].handler) {
> +		ipi_desc[id].handler(data, readl(&rcv_obj->len),
> +				     ipi_desc[id].priv);
> +		if (id > IPI_VPU_INIT) {
> +			vpu->ipi_id_ack[id] = true;
>  			wake_up(&vpu->ack_wq);
>  		}
>  	} else {
> -		dev_err(vpu->dev, "No such ipi id = %d\n", rcv_obj->id);
> +		dev_err(vpu->dev, "No such ipi id = %d\n", id);
>  	}
>  }
>  
> @@ -722,11 +724,10 @@ static int vpu_ipi_init(struct mtk_vpu *vpu)
>  	vpu_cfg_writel(vpu, 0x0, VPU_TO_HOST);
>  
>  	/* shared buffer initialization */
> -	vpu->recv_buf = (__force struct share_obj *)(vpu->reg.tcm +
> -						     VPU_DTCM_OFFSET);
> +	vpu->recv_buf = vpu->reg.tcm + VPU_DTCM_OFFSET;
>  	vpu->send_buf = vpu->recv_buf + 1;
> -	memset(vpu->recv_buf, 0, sizeof(struct share_obj));
> -	memset(vpu->send_buf, 0, sizeof(struct share_obj));
> +	memset_io(vpu->recv_buf, 0, sizeof(struct share_obj));
> +	memset_io(vpu->send_buf, 0, sizeof(struct share_obj));
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mtk-vpu/mtk_vpu.h
> index d4453b4bcee9..ee7c552ce928 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.h
> @@ -15,7 +15,7 @@
>   * VPU interfaces with other blocks by share memory and interrupt.
>   **/
>  
> -typedef void (*ipi_handler_t) (void *data,
> +typedef void (*ipi_handler_t) (const void *data,
>  			       unsigned int len,
>  			       void *priv);
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
