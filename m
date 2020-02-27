Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69804C4BA3B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 09:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAF0222C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 09:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/qDo/jt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="jAldvDjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AAF0222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksGo7qjfBgpbs/YxP91di8tvDhmAi9Rce/oekP4SaKY=; b=n/qDo/jtBjIW9+
	lXC/4lBD4bBOdaDWGu9Pd0KGIkOXde5XDXs8s4wRBLkT7rJG1wLMto3CFYRU+iRdDigJ8HloT4/TR
	whpc+7wtkZXv45jTXY6Rle2TNTsFFHF++BVmG5KJBelIBOdvsnrZWxQLA2mqdT29eBP+/KQbWYKqF
	kUdn3+rqrM3pGlxkOa5s2faXEihjCWFCWrBw2svt2545A8CZ2Bg3gkABuAOvdAknJw09hRoJkaN6J
	gmVNaJqeDSKqKOufA/HDbE321BdBud7CBhZOcgnM1gjAcZoOiXrF/6IuahOqnJ4DFdGyti3zCvQRX
	vLckUZ0yXqhOgwKajzbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Fp9-0006CH-3Q; Thu, 27 Feb 2020 09:51:19 +0000
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Fok-0005kl-66; Thu, 27 Feb 2020 09:50:56 +0000
Received: from [IPv6:2001:420:44c1:2577:f10e:c7d:8cc0:4dc1]
 ([IPv6:2001:420:44c1:2577:f10e:c7d:8cc0:4dc1])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 7FoQjCsjZjmHT7FoTjhgWE; Thu, 27 Feb 2020 10:50:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1582797044; bh=ByJVUEPLZ7tIhy2q8vr9cuIU5zHaJVyikWn1UOZGCH0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=jAldvDjUP+2sch8FAjl3tRgQbtP30TxMccHRfBTx0AG7qcuIATR+YS9Nz2VyI7z6b
 2bdvHiX6Z/L6mJI7b4nv54bKnRliMEVQM7ySwyQNAkoDNchfxN8t4CYHzfevXfB9f8
 LybufA3No+1VRB5FQcWflrscC6WbERot2gpInO67/M0n6IFDADfiZx2PIF3g4pSwHx
 z/7p8fhwJ085la0RM6nw3Uw2TbL/on46LEYh1L4i8LFEemmBCgZg8m8lvoTBW42kTb
 lmP1Ema0sJ4YMTnvpQQV7+hlWMN1SEz349s++ZvojelgkPLdmfbl7iI+GBcwETKL68
 d1DrVrZF7v6fw==
Subject: Re: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200225172437.106679-1-hsinyi@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
Date: Thu, 27 Feb 2020 10:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225172437.106679-1-hsinyi@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEmWyewWtYOmHee0wLG9KVhzvdC+vZ2Yn3M5QK7toJOjegKaoNuwTebMFlNUkX4g5ubItYRWYyIhs9fGxCf8cD1rUEnuEdF4lkw2Txy5JZSTdCcXpB5B
 pzO5NkIdXaxs9P+pVHBrmJIkOsU5Eroa9DV8ZTMnglUWubr8LP9y9m4lrANhiZiELvr2vgtUaNnUrH/z4wjpIQouugabPCkx5QqnrCnfi2V6tgsdVHr8zOA8
 mskhshBV7XjDMTd5xLYZ0Sm9OpE9a0gr0ElTGRjFT+FJQNuLIVgUwDTN961nhIssd25SFvemCatJXt34OY1tWo5jOU+tteyyXulpyXgchGIMPBQTTaJL4Ji/
 BDZeOQ+aZfeJoA0ppicA6MUd7/lCyKg6hL1KWvDnx/ZLDMY6VT1KNZ9+CVD6Y4XoIfaYgurc68lAMRXyukwMzOUhuDJ/fXoZyVy7cakzf2yVCHIFr1MQkom2
 6uXVTJbJJ2ntKSdMcuzDzxxLVI/BioY4HHz9HrFB0kvsXSZ85OlEwY/El9R2R4b62kVs1vAMd79qJR06ewzsBO5vcefSk/KCV3UTXq0dtsHArbHy35bC8iLR
 Rah4L33UxuNXea6VawerW38hGGj3VKbG0GGWnNC73+Jstfp45IVOhkAtbTCX7EpKdn0ZIfFxhHTwpxpDIZAvShcQMHLyEncijo0icB4e/D51NB9J3TYHYJbP
 PGwtJwvHsA+s8xkxnt2oMOeUDgII1xG2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_015054_416803_6E4CBD26 
X-CRM114-Status: GOOD (  16.75  )
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

On 2/25/20 6:24 PM, Hsin-Yi Wang wrote:
> struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> unaligned access. Otherwise kernel would crash due to unable to handle
> kernel paging request.
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
> Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> access.
> 
> Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change in v3:
> - fix sparse warnings.
> Change in v2:
> - fix sparse warnings.
> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index a768707abb94..e3fd2d1814f3 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
>  static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
>  {
>  	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> -	struct vpu_run *run = (struct vpu_run *)data;
> -
> -	vpu->run.signaled = run->signaled;
> -	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> -	vpu->run.dec_capability = run->dec_capability;
> -	vpu->run.enc_capability = run->enc_capability;
> +	struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;

The use of __force is generally a bad sign. Shouldn't the 'void *data' be a
'void __iomem *data'? And vpu->recv_buf should be 'struct share_obj __iomem *recv_buf;'.
Probably send_buf as well.

In other words, the __iomem attribute should be wired up correctly throughout the
driver code, and not forcibly applied in one place. That is asking for trouble in
the future. Also, sparse only works well in detecting problems if such attributes
are applied at the right level.

Regards,

	Hans

> +
> +	vpu->run.signaled = readl(&run->signaled);
> +	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> +	/* Make sure the string is NUL-terminated */
> +	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
> +	vpu->run.dec_capability = readl(&run->dec_capability);
> +	vpu->run.enc_capability = readl(&run->enc_capability);
>  	wake_up_interruptible(&vpu->run.wq);
>  }
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
