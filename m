Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0577C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMuSIovC0TQDC5tESwQBOqtOTzgm9yBMAEYcJCiItUM=; b=CTvhWDnaahPmNW
	lJrPjA6ZUf3HgosT4CNue5FstSefCCVCM8ILNdGoci52L9FPF4tyxdac/aoArpkzs8dljdEElJBSt
	45Eun+WGL8lBd1gF6RJHcVHhXNY+vVex+4gSwXWjJ0njNxpBOWqnVLt9uZ/SaxddxjilpwKAxAIfT
	A3MI/EUqaiDHKiyhRKqPbVagRyJLl193cuBDlWjWzUoJcaDdFRm50vGS4VbNS5XSViNSDkRv37tbI
	FlSSpdKdk4d7VoZyi5J1KUBMtPhrskZTryY1VR30p4h+U7o1uZ05iyoNqNxRsFnH94WB9u6bI77mS
	/924aVu13Vce0BNvWc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7V9-004HFY-D0; Mon, 23 May 2022 12:49:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt7Ux-004HBz-UD; Mon, 23 May 2022 12:49:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BD9A41F42F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653310162;
 bh=s97rWWbc/m/oI+hUShZa6zXrVCJ0ZgxpFAi04DJsT8Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mUO2Rnn5MUHx5GKdBszSmgbjorsWmooPNI+svWc9VXtYozCsvNStD5OcVJ9LiG4dT
 dFzsK1NhRoPIEXFm7qs8H3bekLzXXMwePpLXkolhdyTrw2yhtUW9cpSBR74jmYk9zM
 dQigSeiodRGHWtWx1wNPv/Xz6zL49vKkAdaWzDAkmtXY8pTgflz/86+X/17RgxEcuC
 qcqj5J7dJNpqLIC8IqHfemjndlkhGjdeC7QJ3KPTHuI5eO27KFr7ShIWTZLsRQKV8M
 kbaeIAyCzxCuicVsvBki3KlxirKKGviw+0P/VxXbJienRCrwUnewQNwcsba32jibrA
 ZzoHqv30Ln5Vg==
Message-ID: <6cc68be9-e509-eae4-801d-997fdc01dcf2@collabora.com>
Date: Mon, 23 May 2022 14:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/4] regulator: Add driver for MT6331 PMIC regulators
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
 <YoepiTUfdhkYByo7@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YoepiTUfdhkYByo7@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_054924_152935_D5FBEBDC 
X-CRM114-Status: GOOD (  22.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/05/22 16:45, Mark Brown ha scritto:
> On Fri, May 20, 2022 at 03:33:03PM +0200, AngeloGioacchino Del Regno wrote:
> 
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022 Collabora Ltd.
>> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + *
> 
> Please make the entire comment a C++ one so things look more
> intentional.
> 

Will do.

>> +static const unsigned int ldo_volt_table10[] = {
>> +	1200000, 1300000, 1500000, 1800000,
>> +	1200000, 1300000, 1500000, 1800000,
>> +	1200000, 1300000, 1500000, 1800000,
>> +	1200000, 1300000, 1500000, 1800000,
>> +};
> 
> So the top bits of the voltate selection field just get ignored?  Might
> be easier to just write the code to not include the top bits.
> 

No, they're all valid values for real... but I guess that I can simplify
this voltage table by simply modifying the bitmask that we use for the
regulators that are using this table....

Example:

MT6331_LDO_S("ldo-vcamio", VCAM_IO,  ldo_volt_table10, MT6331_SYSLDO_CON3, 10,

	MT6331_SYSLDO_CON11, GENMASK(6, 3), MT6331_SYSLDO_CON3, GENMASK(1, 0),

	MT6331_EN_STATUS1, BIT(13)),

So for VCAM_IO it's CON11... we have VGP2, VGP3 using CON14, CON15, then there
are no more users for this table.
If I use GENMASK(4, 3), I can effectively leave only four voltage values in
ldo_volt_table10.

Also, I've just noticed a mistake on ldo-vmipi: that's supposed to have a mask
of GENMASK(5, 3), not (6, 3) - which is in turn also making me able to remove
the ldo_volt_table_3a.

Alright, will fix in the next one :))

>> +static int mt6331_get_status(struct regulator_dev *rdev)
>> +{
>> +	struct mt6331_regulator_info *info = rdev_get_drvdata(rdev);
>> +	u32 reg, en_mask, regval;
>> +	int ret;
>> +
>> +	if (info->qi > 0) {
>> +		reg = info->desc.enable_reg;
>> +		en_mask = info->qi;
> 
> If the regulator doesn't have status readback it shouldn't provide a
> get_status() operation.
> 

What I've understood is that when there's no "QI" flag, the enable register
will provide the regulator status (EN/DIS) acting like QI, that's why I've
added that if branch...

Anyway, I'll recheck this part before sending the next version!

>> +static int mt6331_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
>> +{
>> +	int ret, val = 0;
>> +	struct mt6331_regulator_info *info = rdev_get_drvdata(rdev);
>> +
>> +	if (!info->modeset_mask) {
>> +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
>> +			info->desc.name);
>> +		return -EINVAL;
>> +	}
> 
> Just don't provide the operation for these regulators then.  That'll
> mean a separate ops struct but that's fine.

Oki, I'll add new ops then.

Thanks for the review!
P.S.: I'll obviously apply the same suggestions on mt6332-regulator as well.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
