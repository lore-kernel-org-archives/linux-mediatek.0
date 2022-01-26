Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C374C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6P03hTSOeM9jTpf8T9xatOsuozqzFbap/nOrrn6UxQ=; b=by9lFcVPRZbTAy
	vSumM4ccNWrDEYM3/nbQ4OtIed7LMdU0SIVuD5/mH7K2vlWdvWNujHU7AH+GrDuv+efdVD3UuSn0j
	ntwSHqmvTe7Pg5DRsiPwkVE1yoYXs+MH+6xkL/pnzZBYwZC2NrswmhwwO7Nim/KZdD5XIx9of3LP3
	ywsdXMhA5+HQ7PqF1B0c9g7ZsBIJlDDEmqZcE43J2BkKdQTn6vaVXPtumFKtv+yYU99RtHD+kMfPL
	4sMvTLi9FQaRRuHJRYFmAoW5FdYpjGH+8U2c8KDg6aHwDllataz4/k7PLS+kqqyRjKuFxquBrBI9e
	nsZgNZyGGi48gWtsbZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCd3e-00AbmY-Ns; Wed, 26 Jan 2022 07:49:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCd3R-00AblK-MT; Wed, 26 Jan 2022 07:49:23 +0000
X-UUID: 3a0ddebe6e054f37857dbb515c2ca40a-20220126
X-UUID: 3a0ddebe6e054f37857dbb515c2ca40a-20220126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 568883189; Wed, 26 Jan 2022 00:49:19 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 23:49:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 15:49:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 15:49:09 +0800
Message-ID: <bcc104a362f637d92e69045dc57dd02c17c45975.camel@mediatek.com>
Subject: Re: [PATCH v21 8/8] soc: mediatek: SVS: add mt8192 SVS GPU driver
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Wed, 26 Jan 2022 15:49:09 +0800
In-Reply-To: <2c0e89c6-6e9c-9d12-703f-d71e22023e7a@collabora.com>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-9-roger.lu@mediatek.com>
 <2c0e89c6-6e9c-9d12-703f-d71e22023e7a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_234921_784164_2AAED0FB 
X-CRM114-Status: GOOD (  34.29  )
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

Hi AngeloGioacchino,

Sorry for the late reply.

On Fri, 2022-01-07 at 15:33 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/01/22 10:52, Roger Lu ha scritto:
> > mt8192 SVS GPU uses 2-line (high/low bank) HW architecture to provide
> > bank voltages. High bank helps update higher frequency's voltage
> > and low bank helps update lower frequency's voltage.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 469 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 464 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> > index 93cdaecadd6d..bec6524ab33a 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> 
> ..snip..
> 
> > @@ -639,9 +706,11 @@ static int svs_status_debug_show(struct seq_file *m,
> > void *v)
> >   
> >   	ret = svs_get_zone_temperature(svsb->tzone_name, &tzone_temp);
> >   	if (ret)
> > -		seq_printf(m, "%s: temperature ignore\n", svsb->name);
> > +		seq_printf(m, "%s: temperature ignore, turn_pt = %u\n",
> > +			   svsb->name, svsb->turn_pt);
> >   	else
> > -		seq_printf(m, "%s: temperature = %d\n", svsb->name, tzone_temp);
> > +		seq_printf(m, "%s: temperature = %d, turn_pt = %u\n",
> > +			   svsb->name, tzone_temp, svsb->turn_pt);
> >   
> >   	for (i = 0; i < svsb->opp_count; i++) {
> >   		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
> > @@ -784,6 +853,181 @@ static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1,
> > u32 fx)
> >   	return DIV_ROUND_UP(vx, 100);
> >   }
> >   
> > +static void svs_get_bank_volts_v3(struct svs_platform *svsp)
> > +{
> > +	struct svs_bank *svsb = svsp->pbank;
> > +	u32 i, j, *vop, vop74, vop30, mask7_0 = GENMASK(7, 0);
> > +	u32 b_sft, bits8 = 8, shift_byte = 0, reg_bytes = 4;
> 
> mask7_0, bits8, reg_bytes are constants, and it's not right to declare
> constants
> as variables like you're doing here.
> 
> Please replace all usages of `mask7_0` with either a definition or with the
> call
> to the GENMASK macro;
> also, replace all usages of `bits8` with a definition, or just 8;
> finally, either make `reg_bytes` a `const u8` or a definition.
> 
> 
> In my opinion, a #define would be preferred, since the exact same comments on
> the exact same values also apply to function svs_set_bank_freq_pct_v3().
> 
> After that fix, you'll get my R-b.
> 
> I feel like v22 will be golden :)

No problem. I'll use GENMASK macro and replace bits8/reg_bytes with 
definition. Thanks for the tutorial a lot. :)

> 
> Regards,
> - Angelo
> 
> > +	u32 middle_index = (svsb->opp_count / 2);
> > +	u32 opp_start = 0, opp_stop = 0, turn_pt = svsb->turn_pt;
> > +
> > +	if (svsb->phase == SVSB_PHASE_MON &&
> > +	    svsb->volt_flags & SVSB_MON_VOLT_IGNORE)
> > +		return;
> > +
> > +	vop74 = svs_readl_relaxed(svsp, VOP74);
> > +	vop30 = svs_readl_relaxed(svsp, VOP30);
> > +
> > +	/* Target is to set svsb->volt[] by algorithm */
> > +	if (turn_pt < middle_index) {
> > +		if (svsb->type == SVSB_HIGH) {
> > +			/* volt[0] ~ volt[turn_pt - 1] */
> > +			for (i = 0; i < turn_pt; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				vop = (shift_byte < reg_bytes) ? &vop30 :
> > +								 &vop74;
> > +				svsb->volt[i] = (*vop >> b_sft) & mask7_0;
> > +				shift_byte++;
> > +			}
> > +		} else if (svsb->type == SVSB_LOW) {
> > +			/* volt[turn_pt] + volt[j] ~ volt[opp_count - 1] */
> > +			j = svsb->opp_count - 7;
> > +			svsb->volt[turn_pt] = vop30 & mask7_0;
> > +			shift_byte++;
> > +			for (i = j; i < svsb->opp_count; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				vop = (shift_byte < reg_bytes) ? &vop30 :
> > +								 &vop74;
> > +				svsb->volt[i] = (*vop >> b_sft) & mask7_0;
> > +				shift_byte++;
> > +			}
> > +
> > +			/* volt[turn_pt + 1] ~ volt[j - 1] by interpolate */
> > +			for (i = turn_pt + 1; i < j; i++)
> > +				svsb->volt[i] =
> > +					interpolate(svsb->freq_pct[turn_pt],
> > +						    svsb->freq_pct[j],
> > +						    svsb->volt[turn_pt],
> > +						    svsb->volt[j],
> > +						    svsb->freq_pct[i]);
> > +		}
> > +	} else {
> > +		if (svsb->type == SVSB_HIGH) {
> > +			/* volt[0] + volt[j] ~ volt[turn_pt - 1] */
> > +			j = turn_pt - 7;
> > +			svsb->volt[0] = vop30 & mask7_0;
> > +			shift_byte++;
> > +			for (i = j; i < turn_pt; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				vop = (shift_byte < reg_bytes) ? &vop30 :
> > +								 &vop74;
> > +				svsb->volt[i] = (*vop >> b_sft) & mask7_0;
> > +				shift_byte++;
> > +			}
> > +
> > +			/* volt[1] ~ volt[j - 1] by interpolate */
> > +			for (i = 1; i < j; i++)
> > +				svsb->volt[i] =
> > +					interpolate(svsb->freq_pct[0],
> > +						    svsb->freq_pct[j],
> > +						    svsb->volt[0],
> > +						    svsb->volt[j],
> > +						    svsb->freq_pct[i]);
> > +		} else if (svsb->type == SVSB_LOW) {
> > +			/* volt[turn_pt] ~ volt[opp_count - 1] */
> > +			for (i = turn_pt; i < svsb->opp_count; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				vop = (shift_byte < reg_bytes) ? &vop30 :
> > +								 &vop74;
> > +				svsb->volt[i] = (*vop >> b_sft) & mask7_0;
> > +				shift_byte++;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (svsb->type == SVSB_HIGH) {
> > +		opp_start = 0;
> > +		opp_stop = svsb->turn_pt;
> > +	} else if (svsb->type == SVSB_LOW) {
> > +		opp_start = svsb->turn_pt;
> > +		opp_stop = svsb->opp_count;
> > +	}
> > +
> > +	for (i = opp_start; i < opp_stop; i++)
> > +		if (svsb->volt_flags & SVSB_REMOVE_DVTFIXED_VOLT)
> > +			svsb->volt[i] -= svsb->dvt_fixed;
> > +}
> > +
> > +static void svs_set_bank_freq_pct_v3(struct svs_platform *svsp)
> > +{
> > +	struct svs_bank *svsb = svsp->pbank;
> > +	u32 i, j, *freq_pct, freq_pct74 = 0, freq_pct30 = 0;
> > +	u32 b_sft, bits8 = 8, shift_byte = 0, reg_bytes = 4;
> > +	u32 middle_index = (svsb->opp_count / 2);
> > +	u32 turn_pt = middle_index;
> > +
> > +	for (i = 0; i < svsb->opp_count; i++) {
> > +		if (svsb->opp_dfreq[i] <= svsb->turn_freq_base) {
> > +			svsb->turn_pt = i;
> > +			break;
> > +		}
> > +	}
> > +
> > +	turn_pt = svsb->turn_pt;
> > +
> > +	/* Target is to fill out freq_pct74 / freq_pct30 by algorithm */
> > +	if (turn_pt < middle_index) {
> > +		if (svsb->type == SVSB_HIGH) {
> > +			/* Edge case for preventing freq_pct30 from being 0 */
> > +			if (turn_pt == 0)
> > +				freq_pct30 = svsb->freq_pct[0];
> > +
> > +			/* freq_pct[0] ~ freq_pct[turn_pt - 1] */
> > +			for (i = 0; i < turn_pt; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				freq_pct = (shift_byte < reg_bytes) ?
> > +					   &freq_pct30 : &freq_pct74;
> > +				*freq_pct |= (svsb->freq_pct[i] << b_sft);
> > +				shift_byte++;
> > +			}
> > +		} else if (svsb->type == SVSB_LOW) {
> > +			/*
> > +			 * freq_pct[turn_pt] +
> > +			 * freq_pct[opp_count - 7] ~ freq_pct[opp_count -1]
> > +			 */
> > +			freq_pct30 = svsb->freq_pct[turn_pt];
> > +			shift_byte++;
> > +			j = svsb->opp_count - 7;
> > +			for (i = j; i < svsb->opp_count; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				freq_pct = (shift_byte < reg_bytes) ?
> > +					   &freq_pct30 : &freq_pct74;
> > +				*freq_pct |= (svsb->freq_pct[i] << b_sft);
> > +				shift_byte++;
> > +			}
> > +		}
> > +	} else {
> > +		if (svsb->type == SVSB_HIGH) {
> > +			/*
> > +			 * freq_pct[0] +
> > +			 * freq_pct[turn_pt - 7] ~ freq_pct[turn_pt - 1]
> > +			 */
> > +			freq_pct30 = svsb->freq_pct[0];
> > +			shift_byte++;
> > +			j = turn_pt - 7;
> > +			for (i = j; i < turn_pt; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				freq_pct = (shift_byte < reg_bytes) ?
> > +					   &freq_pct30 : &freq_pct74;
> > +				*freq_pct |= (svsb->freq_pct[i] << b_sft);
> > +				shift_byte++;
> > +			}
> > +		} else if (svsb->type == SVSB_LOW) {
> > +			/* freq_pct[turn_pt] ~ freq_pct[opp_count - 1] */
> > +			for (i = turn_pt; i < svsb->opp_count; i++) {
> > +				b_sft = bits8 * (shift_byte % reg_bytes);
> > +				freq_pct = (shift_byte < reg_bytes) ?
> > +					   &freq_pct30 : &freq_pct74;
> > +				*freq_pct |= (svsb->freq_pct[i] << b_sft);
> > +				shift_byte++;
> > +			}
> > +		}
> > +	}
> > +
> > +	svs_writel_relaxed(svsp, freq_pct74, FREQPCT74);
> > +	svs_writel_relaxed(svsp, freq_pct30, FREQPCT30);
> > +}
> > +
> >   static void svs_get_bank_volts_v2(struct svs_platform *svsp)
> >   {
> >   	struct svs_bank *svsb = svsp->pbank;
> 
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!2hHinI997WLSwDhGwMLxsnPzZMt8US0HmcDwqKvo2yvyiHuJ7AR4BSd7C_Z2haFK$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
