Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2E1C2BBCD
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 09:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A1D522512
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 09:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A1D522512
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LR66szMBKs1+SYlYXbwTYqru8LtbarOLnYfGSNAcOUE=; b=LsXRmlMBQuo1Tbo2KiwN6P4KS
	2m2DQ02cjQvaR7Wvgtb1R85VMPxPVcWy4ldz7QHKJTM5OC4k2pKqxFfJTSTNrKj6y+7ofGyzqPeYK
	rKc71MeFUtUc74wx6u6M61gT4q/sAjoXM5c/NSpltgCm7fODiuJ4ykx+cvZYA68VDdX3EpK2uWkfM
	8d7IGyu0RLUFSlky/eH3A0fkwdXW+qGVnHf9putrZIjg8Fb/KBZBZCZCzyXXUAs3dLStl1m+3wGFs
	DzeKaOndoDEqEj4igo9Kah0Wfw7wny1FpLwXGpCKsdsYTcNm++MQ3PuWmh59oTf7GwUEc2T7uu0Do
	V+fWYZGYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp6YE-0007qZ-4S; Tue, 15 Dec 2020 09:23:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp6Y8-0007ot-9o; Tue, 15 Dec 2020 09:23:17 +0000
X-UUID: 0d8d0ef90af34a4f9c88662353f20095-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3A3MDRQZ+3g3GIYPtsPrmJUDA8Vs0qbcwBwsyH9jWRw=; 
 b=Xe0po7REhhl9W0OPImOn0FvTHGSiHutY+EqJzZ2OMInDTitQe30QloVxAyGSdfBFWbxvNTHu1FE6olsusZXi/HRKmrmcyEzCn6kv3lzrTeHEF+e/od/FDEFJLNZOQl4T9d3+0hlpS/QsILOljB2b9cc1j38vsu4WIg5jEJKV8a4=;
X-UUID: 0d8d0ef90af34a4f9c88662353f20095-20201215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1511908777; Tue, 15 Dec 2020 01:23:11 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 01:23:10 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 17:23:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Dec 2020 17:23:08 +0800
Message-ID: <1608024188.29527.2.camel@mtksdaap41>
Subject: Re: [PATCH v3 5/8] regulator: mt6359: Add support for MT6359 regulator
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Dec 2020 17:23:08 +0800
In-Reply-To: <20201124170732.GI4933@sirena.org.uk>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20201124170732.GI4933@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_042316_531352_A72A0892 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 2020-11-24 at 17:07 +0000, Mark Brown wrote:
> On Mon, Nov 23, 2020 at 11:48:07AM +0800, Hsin-Hsiung Wang wrote:
> 
> > +static int mt6359_get_linear_voltage_sel(struct regulator_dev *rdev)
> > +{
> > +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> > +	int ret, regval;
> > +
> > +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> > +	if (ret != 0) {
> > +		dev_err(&rdev->dev,
> > +			"Failed to get mt6359 Buck %s vsel reg: %d\n",
> > +			info->desc.name, ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> > +
> > +	return ret;
> > +}
> 
> This looks like it could just be regmap_get_voltage_sel_regmap()?
> Otherwise the driver looks good.

Thanks for the review.
MT6359 regulator has sel_reg and status_reg, so we use
mt6359_get_linear_voltage_sel for status_reg instead of
regmap_get_voltage_sel_regmap() which uses sel_reg.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
