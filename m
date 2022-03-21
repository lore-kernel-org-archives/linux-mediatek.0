Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B995C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 03:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p82fDbs71qoZuifcedL8MC9PV51xAMEO7nfRLPwNBhc=; b=pCwB2sQBYV6WCE
	r0wRuQqCMp2+0R/zknJXwq5zAu+OkCHkfAP5yBu+yrevVcyWHjPRyaPj4JV5hyXwPnsXvXUj6HJ75
	r0KeGGzfk4Pe71Ur62ZesxtIiAvbSlLG0Xfy5exhVJjleZTXHJFAvt4ZjHdPRpgMx+R3RjzIiBDsl
	NFOsVADO8aCR6khKBLOEnXc294kGYadfJbJg919rV5Eevi96vnILBcK/JOhL+msEz0EwONwoCnENg
	gf8CRijXYoJm9CBzE7+SVw2xSvIZengZQZx3je6uyRyUQiLRLxfvevgS/TRuq6CI6F/zNlvaU7HOC
	EsBpaOuHuWtH0Fw+nEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW994-006Ph3-28; Mon, 21 Mar 2022 03:55:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW98o-006Pfd-ES; Mon, 21 Mar 2022 03:55:39 +0000
X-UUID: 5cdbc04b0e654d29b9a35fe52e612504-20220320
X-UUID: 5cdbc04b0e654d29b9a35fe52e612504-20220320
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1649737847; Sun, 20 Mar 2022 20:55:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Mar 2022 20:51:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 11:51:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 11:51:14 +0800
Message-ID: <8b08fff02623d04998ccdde2a15fab9c75386886.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] regulator: mt6366: Add support for MT6366 regulator
From: Johnson Wang <johnson.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 21 Mar 2022 11:51:14 +0800
In-Reply-To: <YjTmWR3xNOpmztew@sirena.org.uk>
References: <20220317030402.24894-1-johnson.wang@mediatek.com>
 <20220317030402.24894-2-johnson.wang@mediatek.com>
 <YjTmWR3xNOpmztew@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_205534_512773_5FCEBC32 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Mark,

On Fri, 2022-03-18 at 20:06 +0000, Mark Brown wrote:
> On Thu, Mar 17, 2022 at 11:04:01AM +0800, Johnson Wang wrote:
> > The MT6366 is a regulator found on boards based on MediaTek MT8186
> > and
> > probably other SoCs. It is a so called pmic and connects as a slave
> > to
> > SoC using SPI, wrapped inside the pmic-wrapper.
> 
> This doesn't build, please resend once the dependencies have been
> merged:

This patch depends on [1], it use MARCO defined from [1].
[1] has been merged into linux-next and isn't merged into mainline yet.

I will resend this once the dependencies have been merged.
If you have any other suggestion, please let me know.

Thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/linux/mfd?id=c47383f849097c2b3547e28365578cd9e5811378

BRs,
Johnson Wang


> /mnt/kernel/drivers/regulator/mt6358-regulator.c:51:15: error:
> 'MT6358_BUCK_VCORE_SSHUB_ELR0' undeclared here (not in a function);
> did you mean 'MT6358_BUCK_VCORE_ELR0'?
>    51 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
>       |               ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in
> expansion of macro 'MT6358_BUCK'
>   508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:53:17: error:
> 'MT6358_BUCK_VCORE_SSHUB_CON0' undeclared here (not in a function);
> did you mean 'MT6358_BUCK_VCORE_CON0'?
>    53 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in
> expansion of macro 'MT6358_BUCK'
>   508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:57:16: error:
> 'MT6358_BUCK_VCORE_SSHUB_DBG1' undeclared here (not in a function);
> did you mean 'MT6358_BUCK_VCORE_DBG1'?
>    57 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in
> expansion of macro 'MT6358_BUCK'
>   508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:593:7: error:
> 'MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1' undeclared here (not in a
> function); did you mean 'MT6358_ID_VSRAM_OTHERS_SSHUB'?
>   593 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:103:15: note: in
> definition of macro 'MT6358_LDO1'
>   103 |   .vsel_reg = vosel, \
>       |               ^~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:105:17: error:
> 'MT6358_LDO_VSRAM_OTHERS_SSHUB_CON0' undeclared here (not in a
> function); did you mean 'MT6358_LDO_VSRAM_OTHERS_CON0'?
>   105 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:590:2: note: in
> expansion of macro 'MT6358_LDO1'
>   590 |  MT6358_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:110:16: error:
> 'MT6358_LDO_VSRAM_OTHERS_SSHUB_DBG1' undeclared here (not in a
> function); did you mean 'MT6358_LDO_VSRAM_OTHERS_DBG1'?
>   110 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:590:2: note: in
> expansion of macro 'MT6358_LDO1'
>   590 |  MT6358_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
>       |               ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: note: (near
> initialization for 'mt6366_regulators[36].desc.vsel_reg')
>   147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
>       |               ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: error:
> initializer element is not constant
>   147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
>       |               ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: note: (near
> initialization for 'mt6366_regulators[36].desc.vsel_reg')
>   147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
>       |               ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: note: (near
> initialization for 'mt6366_regulators[36].desc.enable_reg')
>   149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: error:
> initializer element is not constant
>   149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: note: (near
> initialization for 'mt6366_regulators[36].desc.enable_reg')
>   149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: note: (near
> initialization for 'mt6366_regulators[36].status_reg')
>   153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: error:
> initializer element is not constant
>   153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: note: (near
> initialization for 'mt6366_regulators[36].status_reg')
>   153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in
> expansion of macro 'MT6366_BUCK'
>   610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000,
> 1293750, 6250,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0,
> 0x7f,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in
> definition of macro 'MT6366_BUCK'
>   155 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: note: (near
> initialization for 'mt6366_regulators[36].da_vsel_reg')
>   611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0,
> 0x7f,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in
> definition of macro 'MT6366_BUCK'
>   155 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: error:
> initializer element is not constant
>   611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0,
> 0x7f,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in
> definition of macro 'MT6366_BUCK'
>   155 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: note: (near
> initialization for 'mt6366_regulators[36].da_vsel_reg')
>   611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0,
> 0x7f,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in
> definition of macro 'MT6366_BUCK'
>   155 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in
> definition of macro 'MT6366_LDO1'
>   199 |   .vsel_reg = vosel, \
>       |               ^~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: note: (near
> initialization for 'mt6366_regulators[37].desc.vsel_reg')
>   684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in
> definition of macro 'MT6366_LDO1'
>   199 |   .vsel_reg = vosel, \
>       |               ^~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: error:
> initializer element is not constant
>   684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in
> definition of macro 'MT6366_LDO1'
>   199 |   .vsel_reg = vosel, \
>       |               ^~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: note: (near
> initialization for 'mt6366_regulators[37].desc.vsel_reg')
>   684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in
> definition of macro 'MT6366_LDO1'
>   199 |   .vsel_reg = vosel, \
>       |               ^~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: note: (near
> initialization for 'mt6366_regulators[37].desc.enable_reg')
>   201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: error:
> initializer element is not constant
>   201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: note: (near
> initialization for 'mt6366_regulators[37].desc.enable_reg')
>   201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
>       |                 ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in
> definition of macro 'MT6366_LDO1'
>   204 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: note: (near
> initialization for 'mt6366_regulators[37].da_vsel_reg')
>   683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in
> definition of macro 'MT6366_LDO1'
>   204 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: error:
> initializer element is not constant
>   683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in
> definition of macro 'MT6366_LDO1'
>   204 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: note: (near
> initialization for 'mt6366_regulators[37].da_vsel_reg')
>   683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in
> definition of macro 'MT6366_LDO1'
>   204 |  .da_vsel_reg = _da_vsel_reg, \
>       |                 ^~~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: warning:
> initialization of 'unsigned int' from 'struct mt6358_regulator_info
> *' makes integer from pointer without a cast [-Wint-conversion]
>   206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: note: (near
> initialization for 'mt6366_regulators[37].status_reg')
>   206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: error:
> initializer element is not constant
>   206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: note: (near
> initialization for 'mt6366_regulators[37].status_reg')
>   206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
>       |                ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in
> expansion of macro 'MT6366_LDO1'
>   681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB,
> 500000,
>       |  ^~~~~~~~~~~
> /mnt/kernel/drivers/regulator/mt6358-regulator.c: In function
> 'mt6358_regulator_probe':
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:701:25: error:
> 'MT6366_CHIP_ID' undeclared (first use in this function); did you
> mean 'MT6397_CHIP_ID'?
>   701 |  if (mt6397->chip_id == MT6366_CHIP_ID) {
>       |                         ^~~~~~~~~~~~~~
>       |                         MT6397_CHIP_ID
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:701:25: note: each
> undeclared identifier is reported only once for each function it
> appears in
> /mnt/kernel/drivers/regulator/mt6358-regulator.c:701:22: warning:
> comparison between pointer and integer
>   701 |  if (mt6397->chip_id == MT6366_CHIP_ID) {
>       |                      ^~
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
