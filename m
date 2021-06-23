Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C2AC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA6A61107
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA6A61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXlWyLSUHdbxfesDMZX9wnT0ak4TPWMGAKSIg5rNEdQ=; b=cw6RUdss8cRFl8
	zECf5jDTHdOZRU7HYM+KEIlXUV0pyyeGf8Re1bWVxezxp4cPYA9AXic3O1bolVMjloOL5TZTifALk
	E9YUGxLjJSiGjyF4UarKElrQQ0hyKVrRoL5Lb7llRcVZ466KugLfqGpbk2e6NBDMqUb2QWzanYYIy
	MebZy9V9AeR52tyBa7Y1nN2aiKtERbjOhGyFzM2y37S3AcQhNequwCmWc94CZQy3StHrFI0WwjaE8
	h4Zzj5ZWTwWems8VeoePKwzCfYjMh3PgIMYYffnjQ0fo+JO61R0X6YvjHlokE8rxs/UU3JLyNghCd
	WQkt1eA6O3oBIzhSWQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvv2N-009LEZ-4z; Wed, 23 Jun 2021 05:02:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvv2K-009LE6-IB
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 05:02:53 +0000
X-UUID: 72200dc64ad54f0997b7512e0c0a9b74-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Tb0D+IuavYVr+gsGbryHcedknd8az3dO6DMKG1z8G4Y=; 
 b=Q9GZe7IeUtuzYkIkc5o8yb+kWqRAGrxRb7akCrnSZ4A49cyWr6zKAQhYvg3lSzFRIPwdcxQHd3xrb/t37C0bhMcdJQJVQgRkVc+ZVC+uyjFN9SpFxNp+JrRULbci6/Shmi1kUMK1czuoTJv11CIG2OqO/x5Gy4f5uvhNPqbkmc8=;
X-UUID: 72200dc64ad54f0997b7512e0c0a9b74-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1206120098; Tue, 22 Jun 2021 22:02:50 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 22:02:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 13:02:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 13:02:47 +0800
Message-ID: <1624424567.1145.0.camel@mtksdaap41>
Subject: Re: regulator: mt6358 vdram2_idx/vsel_mask/ vsel_shift setting
 seems wrong
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Axel Lin <axel.lin@ingics.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <fan.chen@mediatek.com>
Date: Wed, 23 Jun 2021 13:02:47 +0800
In-Reply-To: <CAFRkauDjKaEmtEoUH94wkT0Xd9-XL3NOYyvB3haYVT+BrAK-Dw@mail.gmail.com>
References: <CAFRkauDjKaEmtEoUH94wkT0Xd9-XL3NOYyvB3haYVT+BrAK-Dw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_220252_649830_21AAA55D 
X-CRM114-Status: GOOD (  13.69  )
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

Hi, Axel sir
After checking the spec, the vsel_mask is wrong.
I submit a patch to fix it.
Many thanks for the correcting. :)

On Tue, 2021-06-22 at 11:20 +0800, Axel Lin wrote:
> Hi Hsin-Hsiung,
> 
> In drivers/regulator/mt6358-regulator.c:
> 
> static const u32 vdram2_idx[] = {
>         0, 12,
> };
> 
> MT6358_LDO("ldo_vdram2", VDRAM2, vdram2_voltages, vdram2_idx,
>            MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10, 0),
> 
> With current setting the vsel_mask does not match the vsel_shift setting
>    So in set_voltage_sel, it will call regmap_update_bits with
>    mask = 0x10
>    val = idx << 0
>    No matter idx is 0 (pvol[0]) or 12 (pvol[1]), it will clear vsel_mask bits
> 
> I don't have the datasheet to check, so please help to double check the
> vdram2_idx, vsel_mask and vsel_shift settings for ldo_vdram2.
> I think at least one of the settings is wrong.
> 
> Regards,
> Axel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
