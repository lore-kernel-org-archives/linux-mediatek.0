Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FC2C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAiePlhD2FT11G9ytXJZCluq4qJviXofuly3gNPsavE=; b=hvKCZ8KGJruqi0pUdiQmZfe3qA
	tEIaXnbQgBGmoCLjlUJ/DPd2HrkHClf8xrmwZapS7Rha+BxGS4qxBNmjEa2qod+OyjnDlsZfQ/Z2v
	d1JvexyRs9gHqOqN3NQBylhc5Pf+X+pxieQ21h29C7mRynSRNwje1MCeSFPiaT0T/e+4PQXmysB+7
	3hmrebmi9y1lP4WOXQBlWv0VawU6dH20pBGL2l6ZeGVIlrxfoEEWqPlM3x0vS/8hW4vhswh6Zvywo
	LW+Pj4iv9Yu0OUC+I7dpPVhzPyeupMM8i77McGp6B/reSDI2u+achLQVwtnco64t8UyweGjdgfxi+
	JXlzHAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8HH-00000002uo9-0n3d;
	Wed, 31 Jan 2024 10:57:11 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8HE-00000002ulb-1410;
	Wed, 31 Jan 2024 10:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706698625;
	bh=0quI71Dh/TmsV6dBFjbobhxYY6YOyL2zUxoScLPgFUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R/Bapetfk1gIHl4cGuCB5qNWzBGpkccgwsINMrM5hRW8KvP8QQX2jt3+eChHsFDT7
	 ht6W5UFTWon1vq2hoGkEEDWxUGC9qfuHsnIzuEOhG9xsGVgOqZd2kv+kROmNVL/Abo
	 9sfLrOg3wb3JGSzk6Q+MTi8/WDHqb9fM5y3Lf3DB1OW+FpOIJbrweyGPAUgCLGoKlq
	 BjuLcnyKwhRVQLtwcC2J6jRTPXZmMXj98FeJhMZG5ZIDyXGRBw7oHH6FVh+y+H/UvB
	 fLbZM1DlV5EezyzzGMlSuKBm0bwF9BH/OngqC/u3yr+66fuMa9mvEcpAiLdPLnUqmA
	 Fyq0FFJTeK4pw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 03EF2378042B;
	Wed, 31 Jan 2024 10:57:04 +0000 (UTC)
Message-ID: <2e797f80-2e77-4199-beb4-c91a0be11bb5@collabora.com>
Date: Wed, 31 Jan 2024 11:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
 <20231220135722.192080-3-angelogioacchino.delregno@collabora.com>
 <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_025708_451574_65D369AE 
X-CRM114-Status: GOOD (  25.42  )
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

Il 26/12/23 11:48, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Dec 20, 2023 at 9:57 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
>> merge the two in one mtk_dsi_ps_control() function by adding one
>> function parameter `config_vact` which, when true, writes the VACT
>> related registers.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++---------------------
>>   1 file changed, 23 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 23d2c5be8dbb..b618e2e31022 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -352,40 +352,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>>          mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>>   }
>>
>> -static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
>> -{
>> -       struct videomode *vm = &dsi->vm;
>> -       u32 dsi_buf_bpp, ps_wc;
>> -       u32 ps_bpp_mode;
>> -
>> -       if (dsi->format == MIPI_DSI_FMT_RGB565)
>> -               dsi_buf_bpp = 2;
>> -       else
>> -               dsi_buf_bpp = 3;
>> -
>> -       ps_wc = vm->hactive * dsi_buf_bpp;
>> -       ps_bpp_mode = ps_wc;
>> -
>> -       switch (dsi->format) {
>> -       case MIPI_DSI_FMT_RGB888:
>> -               ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>> -               break;
>> -       case MIPI_DSI_FMT_RGB666:
>> -               ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>> -               break;
>> -       case MIPI_DSI_FMT_RGB666_PACKED:
>> -               ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
>> -               break;
>> -       case MIPI_DSI_FMT_RGB565:
>> -               ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>> -               break;
>> -       }
>> -
>> -       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> -       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>> -       writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> -}
>> -
>>   static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>   {
>>          u32 tmp_reg;
>> @@ -417,36 +383,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>          writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>>   }
>>
>> -static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
>> +static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
>>   {
>> -       u32 dsi_tmp_buf_bpp;
>> -       u32 tmp_reg;
>> +       struct videomode *vm = &dsi->vm;
>> +       u32 dsi_buf_bpp, ps_wc;
>> +       u32 ps_bpp_mode;
>> +
>> +       if (dsi->format == MIPI_DSI_FMT_RGB565)
>> +               dsi_buf_bpp = 2;
>> +       else
>> +               dsi_buf_bpp = 3;
> 
> The same is also in mtk_dsi_config_vdo_timing(). Given this is a
> cleanup series, I think it'd be a good chance to add another patch
> and integrate those usages. Just a thought.  :)

Checking that right now.

>>
>> +
>> +       ps_wc = vm->hactive * dsi_buf_bpp;
> 
> I noticed the "& DSI_PS_WC" part was dropped (but perhaps with awareness?).
> 
> While the outcome seems to always fall within the range of
> DSI_PS_WC so we should be fine in practice, I think it doesn't hurt to
> keep the value masked to save readers some time to check if this would
> ever be possible to overflow and write undesired bits down the line.
> WDYT?
> 

Masking a pre-masked value doesn't look right.

Besides, as for the concern of overflowing, if we masked that we'd still end up
with broken functionality, as if the value is invalid... well, it's invalid.
Masked or not. :-)

Thanks for the R-b, sending a v3 soon with some fixes.

Regards,
Angelo


> Regardless of that, I didn't find obvious issue in this patch, so
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 
> Regards,
> Fei
> 
> 
> 
> 
>>
>> +       ps_bpp_mode = ps_wc;
>>
>>          switch (dsi->format) {
>>          case MIPI_DSI_FMT_RGB888:
>> -               tmp_reg = PACKED_PS_24BIT_RGB888;
>> -               dsi_tmp_buf_bpp = 3;
>> +               ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>>                  break;
>>          case MIPI_DSI_FMT_RGB666:
>> -               tmp_reg = LOOSELY_PS_18BIT_RGB666;
>> -               dsi_tmp_buf_bpp = 3;
>> +               ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>>                  break;
>>          case MIPI_DSI_FMT_RGB666_PACKED:
>> -               tmp_reg = PACKED_PS_18BIT_RGB666;
>> -               dsi_tmp_buf_bpp = 3;
>> +               ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
>>                  break;
>>          case MIPI_DSI_FMT_RGB565:
>> -               tmp_reg = PACKED_PS_16BIT_RGB565;
>> -               dsi_tmp_buf_bpp = 2;
>> -               break;
>> -       default:
>>
>> -               tmp_reg = PACKED_PS_24BIT_RGB888;
>> -               dsi_tmp_buf_bpp = 3;
>> +               ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>>                  break;
>>          }
>>
>> -       tmp_reg += dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
>>
>> -       writel(tmp_reg, dsi->regs + DSI_PSCTRL);
>> +       if (config_vact) {
>> +               writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> +               writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> +       }
>> +       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>>   }
>>
>>   static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>> @@ -522,7 +492,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>>          writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>>          writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>>
>> -       mtk_dsi_ps_control(dsi);
>> +       mtk_dsi_ps_control(dsi, false);
>>   }
>>
>>   static void mtk_dsi_start(struct mtk_dsi *dsi)
>> @@ -667,7 +637,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>          mtk_dsi_reset_engine(dsi);
>>          mtk_dsi_phy_timconfig(dsi);
>>
>> -       mtk_dsi_ps_control_vact(dsi);
>> +       mtk_dsi_ps_control(dsi, true);
>>          mtk_dsi_set_vm_cmd(dsi);
>>          mtk_dsi_config_vdo_timing(dsi);
>>          mtk_dsi_set_interrupt_enable(dsi);
>> --
>> 2.43.0
>>
>>

