Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0297C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:22:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2D5611AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2D5611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=biIYX3hdTTs1IUdHadSXrL9hFCCZpcywUlO6p28fZ1Y=; b=LkRYzkUd2ZUL8IinrNAINTZ1B
	Ut9ih6DfAdxv4Xq9FmmGV0c2CQ+cPNuxQszM505yYem9h56Hq+E1wckRsJLRQxtwn/6nsLX3AUu/U
	jRugmEUQifabVZPraUy2QcBX3ccE9wdWiJOh/UDEWfPhVureXPqNXUZ6D3Rs/RuH2gcCXv7zFZMFA
	g9z59JGi1u2bBcGSQoVI3Ts2o071+zkLv3OKVjMYFB/4+f73maDIzmJyMlxUzOPwQE0YV160GXo9X
	o5O53atKhD38nz7Qu+cA+gndbn6cM+Ho8DuMz3j4NeJhJmWkXSnSWaiddVXM21pjTZDwQmqW7Qzau
	yzTDzE9Ag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhOOZ-00738q-Pk; Fri, 14 May 2021 03:21:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOOX-00738Z-F8; Fri, 14 May 2021 03:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=i/7LXUvXctLuG2rtOnzoKkrmfu1QDx3vi151bKL+/aY=; b=3GU5uFTzofj0arCQh3pQTB+lyG
 vgqa/N6WFLp6/b3tNIvsR8HZjewPhWvqnkWL+5iOWtyAtN880z+R83s3xuJOMf+jMiFtG2hwiEpUL
 jD7b/83jCRrN3BeI1r+PqOhO/icD2uEKBNcPOgR5hl0SQnscYZzxpfQ0j3Y3z4XF4H+4S+JN/eFJE
 sFTe7yBLYiam39Q4mqZjStKLxGIhjTL2IMCpH7AwSlsKKTg9AIKzXpU+s9b6M1NAY2wt9JLNxxc4G
 tyvPGTBwtR0Sc3zPbi1YMNaQQ/GgvLOe4a95bUSwF9JVtF/X0hpo8NwwaRu5bunelfcBTFmlxVt1o
 UKaku2RQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOOS-00BgO3-Kz; Fri, 14 May 2021 03:21:43 +0000
X-UUID: 96a2df3264c34cc3af0177f62f9a6c62-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=i/7LXUvXctLuG2rtOnzoKkrmfu1QDx3vi151bKL+/aY=; 
 b=teoOWcfM2bsCDIONRDYC276QVhLbfrELdujuaJ/9U0KV37DjgeUUy7h2Qjduwryx1ESPdvpRsRHZRdFWpFDM6SKzD3CI5AaeRvyr8cCYyLLimvgpfY7yLz1n7610eA2ETPtmvAMxU8sOjdymid14Lj8WAWPtXo33PKElb8ptRWM=;
X-UUID: 96a2df3264c34cc3af0177f62f9a6c62-20210513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yt.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409681959; Thu, 13 May 2021 20:21:36 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 20:20:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 11:20:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 11:20:33 +0800
Message-ID: <e889d847cef2fde086fac37a06c6d2d7584a6e92.camel@mediatek.com>
Subject: Re: [PATCH v16 7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver
From: YT Lee <yt.lee@mediatek.com>
To: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, "Kevin
 Hilman" <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Nicolas
 Boichat" <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 14 May 2021 11:20:33 +0800
In-Reply-To: <20210428065440.3704-8-roger.lu@mediatek.com>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-8-roger.lu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_202140_729832_DBDE65AE 
X-CRM114-Status: GOOD (  28.39  )
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

On Wed, 2021-04-28 at 14:54 +0800, Roger Lu wrote:
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-svs.c | 485
> ++++++++++++++++++++++++++++++++-
>  1 file changed, 479 insertions(+), 6 deletions(-)
> 

Reviewed-by: YT Lee <yt.lee@mediatek.com>

> diff --git a/drivers/soc/mediatek/mtk-svs.c
> b/drivers/soc/mediatek/mtk-svs.c
> index 8794a2d87baa..9a0cc9cbf679 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -36,6 +36,10 @@
>  #define SVSB_CCI			BIT(2)
>  #define SVSB_GPU			BIT(3)
>  
> +/* svs bank 2-line type */
> +#define SVSB_LOW			BIT(4)
> +#define SVSB_HIGH			BIT(5)
> +
>  /* svs bank mode support */
>  #define SVSB_MODE_ALL_DISABLE		0
>  #define SVSB_MODE_INIT01		BIT(1)
> @@ -323,6 +327,7 @@ struct svs_platform {
>   * @volts: bank voltages
>   * @reg_data: bank register data of each phase
>   * @freq_base: reference frequency for bank init
> + * @turn_freq_base: refenrece frequency for turn point
>   * @vboot: voltage request for bank init01 stage only
>   * @volt_step: bank voltage step
>   * @volt_base: bank voltage base
> @@ -343,6 +348,8 @@ struct svs_platform {
>   * @hw_id: bank hardware identification
>   * @ctl0: bank thermal sensor selection
>   * @cpu_id: cpu core id for SVS CPU only
> + * @turn_pt: turn point informs which opp_volt calculated by
> high/low bank.
> + * @type: bank type to represent it is 2-line (high/low) bank or 1-
> line bank.
>   *
>   * Other structure members which are not listed above are svs
> platform
>   * efuse data for bank init
> @@ -371,6 +378,7 @@ struct svs_bank {
>  	u32 volts[16];
>  	u32 reg_data[SVSB_PHASE_NUM][SVS_REG_NUM];
>  	u32 freq_base;
> +	u32 turn_freq_base;
>  	u32 vboot;
>  	u32 volt_step;
>  	u32 volt_base;
> @@ -410,6 +418,8 @@ struct svs_bank {
>  	u32 hw_id;
>  	u32 ctl0;
>  	u32 cpu_id;
> +	u32 turn_pt;
> +	u32 type;
>  };
>  
>  static u32 percent(u32 numerator, u32 denominator)
> @@ -445,6 +455,37 @@ static u32 svs_bank_volt_to_opp_volt(u32
> svsb_volt, u32 svsb_volt_step,
>  	return (svsb_volt * svsb_volt_step) + svsb_volt_base;
>  }
>  
> +static u32 svs_opp_volt_to_bank_volt(u32 opp_u_volt, u32
> svsb_volt_step,
> +				     u32 svsb_volt_base)
> +{
> +	return (opp_u_volt - svsb_volt_base) / svsb_volt_step;
> +}
> +
> +static int svs_sync_bank_volts_from_opp(struct svs_bank *svsb)
> +{
> +	struct dev_pm_opp *opp;
> +	u32 i, opp_u_volt;
> +
> +	for (i = 0; i < svsb->opp_count; i++) {
> +		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
> +						 svsb->opp_freqs[i],
> +						 true);
> +		if (IS_ERR(opp)) {
> +			dev_err(svsb->dev, "cannot find freq = %u
> (%ld)\n",
> +				svsb->opp_freqs[i], PTR_ERR(opp));
> +			return PTR_ERR(opp);
> +		}
> +
> +		opp_u_volt = dev_pm_opp_get_voltage(opp);
> +		svsb->volts[i] = svs_opp_volt_to_bank_volt(opp_u_volt,
> +							   svsb-
> >volt_step,
> +							   svsb-
> >volt_base);
> +		dev_pm_opp_put(opp);
> +	}
> +
> +	return 0;
> +}
> +
>  static int svs_get_bank_zone_temperature(const char *tzone_name,
>  					 int *tzone_temp)
>  {
> @@ -460,7 +501,7 @@ static int svs_get_bank_zone_temperature(const
> char *tzone_name,
>  static int svs_adjust_pm_opp_volts(struct svs_bank *svsb, bool
> force_update)
>  {
>  	int tzone_temp = 0, ret = -EPERM;
> -	u32 i, svsb_volt, opp_volt, temp_offset = 0;
> +	u32 i, svsb_volt, opp_volt, temp_offset = 0, opp_start,
> opp_stop;
>  
>  	mutex_lock(&svsb->lock);
>  
> @@ -474,6 +515,21 @@ static int svs_adjust_pm_opp_volts(struct
> svs_bank *svsb, bool force_update)
>  		goto unlock_mutex;
>  	}
>  
> +	/*
> +	 * 2-line bank updates its corresponding opp volts.
> +	 * 1-line bank updates all opp volts.
> +	 */
> +	if (svsb->type == SVSB_HIGH) {
> +		opp_start = 0;
> +		opp_stop = svsb->turn_pt;
> +	} else if (svsb->type == SVSB_LOW) {
> +		opp_start = svsb->turn_pt;
> +		opp_stop = svsb->opp_count;
> +	} else {
> +		opp_start = 0;
> +		opp_stop = svsb->opp_count;
> +	}
> +
>  	/* Get thermal effect */
>  	if (svsb->phase == SVSB_PHASE_MON) {
>  		if (svsb->temp > svsb->temp_upper_bound &&
> @@ -495,10 +551,16 @@ static int svs_adjust_pm_opp_volts(struct
> svs_bank *svsb, bool force_update)
>  			temp_offset += svsb->tzone_high_temp_offset;
>  		else if (tzone_temp <= svsb->tzone_low_temp)
>  			temp_offset += svsb->tzone_low_temp_offset;
> +
> +		/* 2-line bank takes thermal factor to update all opp
> volts */
> +		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW)
> {
> +			opp_start = 0;
> +			opp_stop = svsb->opp_count;
> +		}
>  	}
>  
>  	/* vmin <= svsb_volt (opp_volt) <= signed-off (default) voltage
> */
> -	for (i = 0; i < svsb->opp_count; i++) {
> +	for (i = opp_start; i < opp_stop; i++) {
>  		if (svsb->phase == SVSB_PHASE_MON) {
>  			svsb_volt = max(svsb->volts[i] + svsb-
> >volt_offset +
>  					temp_offset, svsb->vmin);
> @@ -549,6 +611,184 @@ static u32 interpolate(u32 f0, u32 f1, u32 v0,
> u32 v1, u32 fx)
>  	return DIV_ROUND_UP(vx, 100);
>  }
>  
> +static void svs_get_vops_v3(struct svs_platform *svsp)
> +{
> +	struct svs_bank *svsb = svsp->pbank;
> +	u32 i, vop_i, *vop, vop74, vop30, mask7_0 = GENMASK(7, 0);
> +	u32 b_sft, bits8 = 8, shift_byte = 0, reg_4bytes = 4;
> +	u32 middle_index = (svsb->opp_count / 2);
> +	u32 opp_start = 0, opp_stop = 0, turn_pt = svsb->turn_pt;
> +
> +	if (svsb->phase == SVSB_PHASE_MON &&
> +	    svsb->volt_flags & SVSB_MON_VOLT_IGNORE)
> +		return;
> +
> +	vop74 = svs_readl(svsp, VOP74);
> +	vop30 = svs_readl(svsp, VOP30);
> +
> +	if (turn_pt < middle_index) {
> +		if (svsb->type == SVSB_HIGH) {
> +			/* We attain volts[0 ~ (turn_pt - 1)] */
> +			for (i = 0; i < turn_pt; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				vop = (shift_byte < reg_4bytes) ?
> &vop30 :
> +								  &vop7
> 4;
> +				svsb->volts[i] = (*vop >> b_sft) &
> mask7_0;
> +				shift_byte++;
> +			}
> +		} else if (svsb->type == SVSB_LOW) {
> +			/*
> +			 * We attain volts[turn_pt] +
> +			 * volts[vop_i ~ (opp_count - 1)]
> +			 */
> +			vop_i = svsb->opp_count - 7;
> +			svsb->volts[turn_pt] = vop30 & mask7_0;
> +			shift_byte++;
> +			for (i = vop_i; i < svsb->opp_count; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				vop = (shift_byte < reg_4bytes) ?
> &vop30 :
> +								  &vop7
> 4;
> +				svsb->volts[i] = (*vop >> b_sft) &
> mask7_0;
> +				shift_byte++;
> +			}
> +
> +			/*
> +			 * We attain volts[turn_pt + 1 ~ (vop_i - 1)]
> +			 * by interpolate
> +			 */
> +			for (i = turn_pt + 1; i < vop_i; i++)
> +				svsb->volts[i] =
> +					interpolate(svsb-
> >freqs_pct[turn_pt],
> +						    svsb-
> >freqs_pct[vop_i],
> +						    svsb-
> >volts[turn_pt],
> +						    svsb->volts[vop_i],
> +						    svsb-
> >freqs_pct[i]);
> +		}
> +	} else {
> +		if (svsb->type == SVSB_HIGH) {
> +			/* We attain volts[0] + volts[vop_i ~ (turn_pt
> - 1)] */
> +			vop_i = turn_pt - 7;
> +			svsb->volts[0] = vop30 & mask7_0;
> +			shift_byte++;
> +			for (i = vop_i; i < turn_pt; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				vop = (shift_byte < reg_4bytes) ?
> &vop30 :
> +								  &vop7
> 4;
> +				svsb->volts[i] = (*vop >> b_sft) &
> mask7_0;
> +				shift_byte++;
> +			}
> +
> +			/* We attain volts[1 ~ (vop_i - 1)] by
> interpolate */
> +			for (i = 1; i < vop_i; i++)
> +				svsb->volts[i] =
> +					interpolate(svsb->freqs_pct[0],
> +						    svsb-
> >freqs_pct[vop_i],
> +						    svsb->volts[0],
> +						    svsb->volts[vop_i],
> +						    svsb-
> >freqs_pct[i]);
> +		} else if (svsb->type == SVSB_LOW) {
> +			/* We attain volts[turn_pt ~ (opp_count - 1)]
> */
> +			for (i = turn_pt; i < svsb->opp_count; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				vop = (shift_byte < reg_4bytes) ?
> &vop30 :
> +								  &vop7
> 4;
> +				svsb->volts[i] = (*vop >> b_sft) &
> mask7_0;
> +				shift_byte++;
> +			}
> +		}
> +	}
> +
> +	if (svsb->volt_flags & SVSB_INIT02_RM_DVTFIXED) {
> +		if (svsb->type == SVSB_HIGH) {
> +			opp_start = 0;
> +			opp_stop = svsb->turn_pt;
> +		} else if (svsb->type == SVSB_LOW) {
> +			opp_start = svsb->turn_pt;
> +			opp_stop = svsb->opp_count;
> +		}
> +
> +		for (i = opp_start; i < opp_stop; i++)
> +			svsb->volts[i] -= svsb->dvt_fixed;
> +	}
> +}
> +
> +static void svs_set_freqs_pct_v3(struct svs_platform *svsp)
> +{
> +	struct svs_bank *svsb = svsp->pbank;
> +	u32 i, freq_i, *freq_pct, freq_pct74 = 0;
> +	u32 freq_pct30 = svsb->freqs_pct[0];
> +	u32 b_sft, bits8 = 8, shift_byte = 0, reg_4bytes = 4;
> +	u32 middle_index = (svsb->opp_count / 2);
> +	u32 turn_pt = middle_index;
> +
> +	for (i = 0; i < svsb->opp_count; i++) {
> +		if (svsb->opp_freqs[i] <= svsb->turn_freq_base) {
> +			svsb->turn_pt = i;
> +			break;
> +		}
> +	}
> +
> +	turn_pt = svsb->turn_pt;
> +
> +	/* Target is to fill out freq_pct74 / freq_pct30 */
> +	if (turn_pt < middle_index) {
> +		if (svsb->type == SVSB_HIGH) {
> +			/* We select freqs_pct[0 ~ (turn_pt - 1)] */
> +			for (i = 0; i < turn_pt; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				freq_pct = (shift_byte < reg_4bytes) ?
> +					   &freq_pct30 : &freq_pct74;
> +				*freq_pct |= (svsb->freqs_pct[i] <<
> b_sft);
> +				shift_byte++;
> +			}
> +		} else if (svsb->type == SVSB_LOW) {
> +			/*
> +			 * We select freqs_pct[turn_pt] +
> +			 * freqs_pct[(opp_count - 7) ~ (opp_count -1)]
> +			 */
> +			freq_pct30 = svsb->freqs_pct[turn_pt];
> +			shift_byte++;
> +			freq_i = svsb->opp_count - 7;
> +			for (i = freq_i; i < svsb->opp_count; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				freq_pct = (shift_byte < reg_4bytes) ?
> +					   &freq_pct30 : &freq_pct74;
> +				*freq_pct |= (svsb->freqs_pct[i] <<
> b_sft);
> +				shift_byte++;
> +			}
> +		}
> +	} else {
> +		if (svsb->type == SVSB_HIGH) {
> +			/*
> +			 * We select freqs_pct[0] +
> +			 * freqs_pct[(turn_pt - 7) ~ (turn_pt - 1)]
> +			 */
> +			freq_pct30 = svsb->freqs_pct[0];
> +			shift_byte++;
> +			freq_i = turn_pt - 7;
> +			for (i = freq_i; i < turn_pt; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				freq_pct = (shift_byte < reg_4bytes) ?
> +					   &freq_pct30 : &freq_pct74;
> +				*freq_pct |= (svsb->freqs_pct[i] <<
> b_sft);
> +				shift_byte++;
> +			}
> +		} else if (svsb->type == SVSB_LOW) {
> +			/* We select freqs_pct[turn_pt ~ (opp_count -
> 1)] */
> +			for (i = turn_pt; i < svsb->opp_count; i++) {
> +				b_sft = bits8 * (shift_byte %
> reg_4bytes);
> +				freq_pct = (shift_byte < reg_4bytes) ?
> +					   &freq_pct30 : &freq_pct74;
> +				*freq_pct |= (svsb->freqs_pct[i] <<
> b_sft);
> +				shift_byte++;
> +			}
> +		}
> +	}
> +
> +	svs_writel(svsp, freq_pct74, FREQPCT74);
> +	svs_writel(svsp, freq_pct30, FREQPCT30);
> +}
> +
>  static void svs_get_vops_v2(struct svs_platform *svsp)
>  {
>  	struct svs_bank *svsb = svsp->pbank;
> @@ -868,6 +1108,25 @@ static int svs_init02(struct svs_platform
> *svsp)
>  		}
>  	}
>  
> +	/*
> +	 * 2-line high/low bank update its corresponding opp voltages
> only.
> +	 * Therefore, we sync voltages from opp for high/low bank
> voltages
> +	 * consistency.
> +	 */
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		if (!(svsb->mode_support & SVSB_MODE_INIT02))
> +			continue;
> +
> +		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW)
> {
> +			if (svs_sync_bank_volts_from_opp(svsb)) {
> +				dev_err(svsb->dev, "sync volt fail\n");
> +				return -EPERM;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1114,7 +1373,12 @@ static int svs_resource_setup(struct
> svs_platform *svsp)
>  			svsb->name = "SVSB_CCI";
>  			break;
>  		case SVSB_GPU:
> -			svsb->name = "SVSB_GPU";
> +			if (svsb->type == SVSB_HIGH)
> +				svsb->name = "SVSB_GPU_HIGH";
> +			else if (svsb->type == SVSB_LOW)
> +				svsb->name = "SVSB_GPU_LOW";
> +			else
> +				svsb->name = "SVSB_GPU";
>  			break;
>  		default:
>  			WARN_ON(1);
> @@ -1176,6 +1440,88 @@ static int svs_resource_setup(struct
> svs_platform *svsp)
>  	return 0;
>  }
>  
> +static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
> +{
> +	struct svs_bank *svsb;
> +	struct nvmem_cell *cell;
> +	u32 idx, i, ft_pgm, vmin, golden_temp;
> +
> +	for (i = 0; i < svsp->efuse_num; i++)
> +		if (svsp->efuse[i])
> +			dev_info(svsp->dev, "M_HW_RES%d: 0x%08x\n",
> +				 i, svsp->efuse[i]);
> +
> +	/* Svs efuse parsing */
> +	ft_pgm = svsp->efuse[0] & GENMASK(7, 0);
> +	vmin = (svsp->efuse[19] >> 4) & GENMASK(1, 0);
> +
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		if (svsb->sw_id != SVSB_GPU)
> +			return false;
> +
> +		if (vmin == 0x1)
> +			svsb->vmin = 0x1e;
> +
> +		if (ft_pgm == 0)
> +			svsb->volt_flags |= SVSB_INIT01_VOLT_IGNORE;
> +
> +		if (svsb->type == SVSB_LOW) {
> +			svsb->mtdes = svsp->efuse[10] & GENMASK(7, 0);
> +			svsb->bdes = (svsp->efuse[10] >> 16) &
> GENMASK(7, 0);
> +			svsb->mdes = (svsp->efuse[10] >> 24) &
> GENMASK(7, 0);
> +			svsb->dcbdet = (svsp->efuse[17]) & GENMASK(7,
> 0);
> +			svsb->dcmdet = (svsp->efuse[17] >> 8) &
> GENMASK(7, 0);
> +			svsb->vmax += svsb->dvt_fixed;
> +		} else if (svsb->type == SVSB_HIGH) {
> +			svsb->mtdes = svsp->efuse[9] & GENMASK(7, 0);
> +			svsb->bdes = (svsp->efuse[9] >> 16) &
> GENMASK(7, 0);
> +			svsb->mdes = (svsp->efuse[9] >> 24) &
> GENMASK(7, 0);
> +			svsb->dcbdet = (svsp->efuse[17] >> 16) &
> GENMASK(7, 0);
> +			svsb->dcmdet = (svsp->efuse[17] >> 24) &
> GENMASK(7, 0);
> +			svsb->vmax += svsb->dvt_fixed;
> +		}
> +	}
> +
> +	/* Thermal efuse parsing */
> +	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> +	if (IS_ERR_OR_NULL(cell)) {
> +		dev_err(svsp->dev, "no thermal cell, no mon mode\n");
> +		for (idx = 0; idx < svsp->bank_num; idx++) {
> +			svsb = &svsp->banks[idx];
> +			svsb->mode_support &= ~SVSB_MODE_MON;
> +		}
> +
> +		return true;
> +	}
> +
> +	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_num);
> +	svsp->tefuse_num /= sizeof(u32);
> +	nvmem_cell_put(cell);
> +
> +	for (i = 0; i < svsp->tefuse_num; i++)
> +		if (svsp->tefuse[i] != 0)
> +			break;
> +
> +	if (i == svsp->tefuse_num)
> +		golden_temp = 50; /* All thermal efuse data are 0 */
> +	else
> +		golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
> +
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		if (svsb->sw_id != SVSB_GPU)
> +			return false;
> +
> +		svsb->mts = 500;
> +		svsb->bts = (((500 * golden_temp + 250460) / 1000) -
> 25) * 4;
> +	}
> +
> +	return true;
> +}
> +
>  static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>  {
>  	struct thermal_parameter tp;
> @@ -1598,10 +1944,11 @@ static int svs_status_debug_show(struct
> seq_file *m, void *v)
>  
>  	ret = svs_get_bank_zone_temperature(svsb->tzone_name,
> &tzone_temp);
>  	if (ret)
> -		seq_printf(m, "%s: no \"%s\" zone?\n", svsb->name,
> -			   svsb->tzone_name);
> +		seq_printf(m, "%s: no \"%s\" zone? turn_pt = %u\n",
> +			   svsb->name, svsb->tzone_name, svsb-
> >turn_pt);
>  	else
> -		seq_printf(m, "%s: temperature = %d\n", svsb->name,
> tzone_temp);
> +		seq_printf(m, "%s: temperature = %d, turn_pt = %u\n",
> +			   svsb->name, tzone_temp, svsb->turn_pt);
>  
>  	for (i = 0; i < svsb->opp_count; i++) {
>  		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
> @@ -1734,6 +2081,89 @@ static int svs_create_svs_debug_cmds(struct
> svs_platform *svsp)
>  	return 0;
>  }
>  
> +static struct svs_bank svs_mt8192_banks[] = {
> +	{
> +		.sw_id			= SVSB_GPU,
> +		.set_freqs_pct		= svs_set_freqs_pct_v3,
> +		.get_vops		= svs_get_vops_v3,
> +		.hw_id			= 0,
> +		.tzone_name		= "gpu1",
> +		.buck_name		= "mali",
> +		.volt_flags		= SVSB_INIT02_RM_DVTFIXED |
> +					  SVSB_MON_VOLT_IGNORE,
> +		.mode_support		= SVSB_MODE_INIT02,
> +		.opp_count		= 16,
> +		.freq_base		= 688000000,
> +		.turn_freq_base		= 688000000,
> +		.vboot			= 0x38,
> +		.volt_step		= 6250,
> +		.volt_base		= 400000,
> +		.volt_offset		= 0,
> +		.vmax			= 0x60,
> +		.vmin			= 0x1a,
> +		.dthi			= 0x1,
> +		.dtlo			= 0xfe,
> +		.det_window		= 0xa28,
> +		.det_max		= 0xffff,
> +		.age_config		= 0x555555,
> +		.agem			= 0,
> +		.dc_config		= 0x1,
> +		.dvt_fixed		= 0x1,
> +		.vco			= 0x18,
> +		.chk_shift		= 0x87,
> +		.temp_upper_bound	= 0x64,
> +		.temp_lower_bound	= 0xb2,
> +		.tzone_high_temp	= 85000,
> +		.tzone_high_temp_offset	= 0,
> +		.tzone_low_temp		= 25000,
> +		.tzone_low_temp_offset	= 7,
> +		.core_sel		= 0x0fff0100,
> +		.int_st			= BIT(0),
> +		.ctl0			= 0x00540003,
> +		.type			= SVSB_LOW,
> +	},
> +	{
> +		.sw_id			= SVSB_GPU,
> +		.set_freqs_pct		= svs_set_freqs_pct_v3,
> +		.get_vops		= svs_get_vops_v3,
> +		.hw_id			= 1,
> +		.tzone_name		= "gpu1",
> +		.buck_name		= "mali",
> +		.volt_flags		= SVSB_INIT02_RM_DVTFIXED |
> +					  SVSB_MON_VOLT_IGNORE,
> +		.mode_support		= SVSB_MODE_INIT02 |
> SVSB_MODE_MON,
> +		.opp_count		= 16,
> +		.freq_base		= 902000000,
> +		.turn_freq_base		= 688000000,
> +		.vboot			= 0x38,
> +		.volt_step		= 6250,
> +		.volt_base		= 400000,
> +		.volt_offset		= 0,
> +		.vmax			= 0x60,
> +		.vmin			= 0x1a,
> +		.dthi			= 0x1,
> +		.dtlo			= 0xfe,
> +		.det_window		= 0xa28,
> +		.det_max		= 0xffff,
> +		.age_config		= 0x555555,
> +		.agem			= 0,
> +		.dc_config		= 0x1,
> +		.dvt_fixed		= 0x6,
> +		.vco			= 0x18,
> +		.chk_shift		= 0x87,
> +		.temp_upper_bound	= 0x64,
> +		.temp_lower_bound	= 0xb2,
> +		.tzone_high_temp	= 85000,
> +		.tzone_high_temp_offset	= 0,
> +		.tzone_low_temp		= 25000,
> +		.tzone_low_temp_offset	= 7,
> +		.core_sel		= 0x0fff0101,
> +		.int_st			= BIT(1),
> +		.ctl0			= 0x00540003,
> +		.type			= SVSB_HIGH,
> +	},
> +};
> +
>  static struct svs_bank svs_mt8183_banks[] = {
>  	{
>  		.sw_id			= SVSB_CPU_LITTLE,
> @@ -1888,6 +2318,46 @@ static struct svs_bank svs_mt8183_banks[] = {
>  	},
>  };
>  
> +static int svs_get_svs_mt8192_platform_data(struct svs_platform
> *svsp)
> +{
> +	struct device *dev;
> +	struct svs_bank *svsb;
> +	u32 idx;
> +
> +	svsp->name = "mt8192-svs";
> +	svsp->banks = svs_mt8192_banks;
> +	svsp->efuse_parsing = svs_mt8192_efuse_parsing;
> +	svsp->regs = svs_regs_v2;
> +	svsp->irqflags = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
> +	svsp->bank_num = ARRAY_SIZE(svs_mt8192_banks);
> +	svsp->efuse_check = 9;
> +
> +	svsp->rst = devm_reset_control_get_optional(svsp->dev,
> "svs_rst");
> +	if (IS_ERR(svsp->rst)) {
> +		dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
> +			      "cannot get svs reset control\n");
> +		return PTR_ERR(svsp->rst);
> +	}
> +
> +	dev = svs_add_device_link(svsp, "lvts");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		if (svsb->type == SVSB_HIGH)
> +			svsb->opp_dev = svs_add_device_link(svsp,
> "mali");
> +		else if (svsb->type == SVSB_LOW)
> +			svsb->opp_dev = svs_get_subsys_device(svsp,
> "mali");
> +
> +		if (IS_ERR(svsb->opp_dev))
> +			return PTR_ERR(svsb->opp_dev);
> +	}
> +
> +	return 0;
> +}
> +
>  static int svs_get_svs_mt8183_platform_data(struct svs_platform
> *svsp)
>  {
>  	struct device *dev;
> @@ -1941,6 +2411,9 @@ static const struct of_device_id
> mtk_svs_of_match[] = {
>  	{
>  		.compatible = "mediatek,mt8183-svs",
>  		.data = &svs_get_svs_mt8183_platform_data,
> +	}, {
> +		.compatible = "mediatek,mt8192-svs",
> +		.data = &svs_get_svs_mt8192_platform_data,
>  	}, {
>  		/* Sentinel */
>  	},
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
