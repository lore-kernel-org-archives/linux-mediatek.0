Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341AEC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 02:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F0124655
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 02:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsTZyvmd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LtKA1lMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F0124655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFhKlFLG/BoaBH709VVpoz1R7p65UiycTjaDGLAiVx8=; b=dsTZyvmdil04/K
	0yg3Db3EZIlB68iYCCU5MlWqbrUJQYSJT89WSqXWecfwu3c5K8+GImSxTPqGnP3yTKefIOmWFUeBG
	RLyRlgQGaf/gjW8fOfIB5CXYo+7tFvFFHWJ1PWpX5DuzBnnc9qS6By6O0SXHgrRPd/h2RruaB/SFV
	82iDgyKOyspydgBpfABCXsJj0iKaQbvdki7vhPZQ5Mlw6tdD9JzbwBaLlx8C6/+CyR6+xq7Xxra9i
	adEW4WQ9UR+2k5OBFNzwYEc3fGjDG4+Eqci9qcIKngLTxSNKSLP5asBxr20y35BdVLo3C0h+UIsUu
	KBh/5wgMzrlcmP2x9w2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu5jG-0001cm-0D; Wed, 22 Jan 2020 02:26:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu5iv-0001Gq-T1; Wed, 22 Jan 2020 02:26:31 +0000
X-UUID: f25dfe8354034e38a5355a622da7b9c5-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lN1pViJIxLnb7UBsGaWmhhbnVEIdvsVPgiy5VY3Xy3Y=; 
 b=LtKA1lMx97XZv7UIK/nq3aXN6POHNFlSHf3A7TTdcuW53AvGsKjbFpJEoPrSNgOuqo7CkhKXhjyuQwFwPIM8LR6YdNs7wUiiKeV6mbdOKLiJA+v6jZKNeNe5809//Ml3vVA3iiTKVmagLo7lY35gzm11O1erNmOkMo1IRD9v+VM=;
X-UUID: f25dfe8354034e38a5355a622da7b9c5-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wen.su@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1292939656; Tue, 21 Jan 2020 18:26:27 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 18:24:34 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 22 Jan 2020 10:22:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 22 Jan 2020 10:22:09 +0800
Message-ID: <1579659806.6612.12.camel@mtkswgap22>
Subject: Re: [RESEND 3/4] regulator: mt6359: Add support for MT6359 regulator
From: Wen Su <Wen.Su@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Jan 2020 10:23:26 +0800
In-Reply-To: <20200120190427.GO6852@sirena.org.uk>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
 <1579506450-21830-4-git-send-email-Wen.Su@mediatek.com>
 <20200120190427.GO6852@sirena.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_182629_966425_2EC6BC14 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, Liam
 Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, 2020-01-20 at 19:04 +0000, Mark Brown wrote:
> On Mon, Jan 20, 2020 at 03:47:29PM +0800, Wen Su wrote:
> 
> This seems pretty good, a few comments below but they're fairly small
> and should be easy to address:
> 
> > +static int mt6359_set_voltage_sel(struct regulator_dev *rdev,
> > +				  unsigned int selector)
> > +{
> > +	int idx, ret;
> > +	const u32 *pvol;
> > +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> > +
> > +	pvol = info->index_table;
> > +
> > +	idx = pvol[selector];
> > +	ret = regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> > +				 info->desc.vsel_mask,
> > +				 idx << info->vsel_shift);
> > +
> > +	return ret;
> > +}
> 
> This looks like you should be using regulator_list_voltage_table() and
> associated functions, probably map_voltage_ascend() or _iterate() and
> just a simple set_voltage_sel_regmap().
Thanks for your suggestion.
Currently it's using regulator_list_voltage_table() and
regulator_map_voltage_iterate() as below:

static const struct regulator_ops mt6359_volt_table_ops = {
	.list_voltage = regulator_list_voltage_table,
	.map_voltage = regulator_map_voltage_iterate,
	...
The reason to use mt6359_set_voltage_sel() is to convert selector value
to hardware register index value:
	idx = pvol[selector];

To avoid using mt6359_set_voltage_sel(), the *_voltages array need to be
filled with zeros as below: 
Current:
static const u32 vemc_voltages[] = {
	2900000, 3000000, 3300000,
};
static const u32 vemc_idx[] = {
	10, 11, 13,
};

change to:
static const u32 vxo22_voltages[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2900000, 3000000, 0, 3300000,
};
> 
> > +static int mt6359_get_status(struct regulator_dev *rdev)
> > +{
> > +	int ret;
> > +	u32 regval;
> > +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> > +
> > +	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
> > +	if (ret != 0) {
> > +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
Thanks for your suggestion.
I will update it in the next patch.
> 
> Please write normal conditionl statements rather than using the ternery
> operator to improve legibility.
> 
> > +	switch (mode) {
> > +	case REGULATOR_MODE_FAST:
> > +		if (curr_mode == REGULATOR_MODE_IDLE) {
> > +			WARN_ON(1);
> > +			dev_notice(&rdev->dev,
> > +				   "BUCK %s is LP mode, can't FPWM\n",
> > +				   rdev->desc->name);
> > +			return -EIO;
> 
> I'd expect the device to go out of low power mode then into force PWM
> mode if it has to do that rather than reject the operation.
The device low power mode may control by hardware pad, so that the
reason to reject the operation is the device low power mode can not go
out by software.
Another scenario is one user set the device to low power mode, we think
it's not suitable to change device mode to _FAST mode by another user.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
