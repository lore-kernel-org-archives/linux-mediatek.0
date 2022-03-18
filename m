Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMpzO6zE4HVE6VR1Jp8JMtI6azl/BB9jxbTB3169DQw=; b=k9gM6my8lHFKUNNf5iN+2qfxpQ
	dK15fTKo8fN5f5fRL95TFYXg8enm1X0EfjzY8l/Jn5SllIOB0dT9RknmX9XkzCgAtxJKqNVueZ6Kl
	edKgJQCMLQcQcguxIAc6q6ZkoNbXXYABjHeLFbHaiX8cUn5Htq02pry+V9f1sKZbu7Tiiu6f5PT29
	8fp4OSgHxzOn/bWgD6afoSO3li32RlTfSKe8PiWst/4NOr7sOMFNrvRDBz7oKdn5IBnoYrau9xKfi
	l928CYsjJeFU4v0kg82Ou2O35j0CMgpr2wUSTmcd7R+x54EnVjM0VqxR474jQFWScN65nlC4i8KOM
	K3TrOguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVIsV-002lSa-I0; Fri, 18 Mar 2022 20:07:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVIsH-002lMF-Nv; Fri, 18 Mar 2022 20:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B58A61BFE;
 Fri, 18 Mar 2022 20:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71FCC340E8;
 Fri, 18 Mar 2022 20:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647634014;
 bh=rSGGClOlzviu7qkL+I7KVERK4YDLJC8pYpOpKPqJJK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Npde3rcPofiP71idHFhci+gdU0jskf1HHFMqaTG7nUDPGVTBJXr2yRTeVK4LzrM2t
 0wbUMOyas0ySPe+bdTzesvXShUi1ThNq+5vaGCDjggKeJ8UeIzIvCnPfTIMefD01L7
 IrYOwetq+KSqKIm1DgUie/oJUvHkwCriV8hvVy2fAH+CJjU+9I9JVZS2fHBPVoSAQV
 ZxBSqycloVMcYWR5MTds5BjM7ARDme8pjS22ONBeDce16Spawtl87kU8rqJknreaKF
 CSMddJ4q5wVCkX05S8PHHOpFVfIP2oOhI9sa7OzG+0JFWh/EglGiuwKGy6mG46pxPu
 WzIuvJjRko+JQ==
Date: Fri, 18 Mar 2022 20:06:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] regulator: mt6366: Add support for MT6366 regulator
Message-ID: <YjTmWR3xNOpmztew@sirena.org.uk>
References: <20220317030402.24894-1-johnson.wang@mediatek.com>
 <20220317030402.24894-2-johnson.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220317030402.24894-2-johnson.wang@mediatek.com>
X-Cookie: How do I get HOME?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_130701_893026_7919C838 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: multipart/mixed; boundary="===============0774359163161907477=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0774359163161907477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ow9NmIg9bBeggGxL"
Content-Disposition: inline


--ow9NmIg9bBeggGxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 17, 2022 at 11:04:01AM +0800, Johnson Wang wrote:
> The MT6366 is a regulator found on boards based on MediaTek MT8186 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

This doesn't build, please resend once the dependencies have been merged:

/mnt/kernel/drivers/regulator/mt6358-regulator.c:51:15: error: 'MT6358_BUCK_VCORE_SSHUB_ELR0' undeclared here (not in a function); did you mean 'MT6358_BUCK_VCORE_ELR0'?
   51 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
      |               ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in expansion of macro 'MT6358_BUCK'
  508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:53:17: error: 'MT6358_BUCK_VCORE_SSHUB_CON0' undeclared here (not in a function); did you mean 'MT6358_BUCK_VCORE_CON0'?
   53 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in expansion of macro 'MT6358_BUCK'
  508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:57:16: error: 'MT6358_BUCK_VCORE_SSHUB_DBG1' undeclared here (not in a function); did you mean 'MT6358_BUCK_VCORE_DBG1'?
   57 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
      |                ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:508:2: note: in expansion of macro 'MT6358_BUCK'
  508 |  MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:593:7: error: 'MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1' undeclared here (not in a function); did you mean 'MT6358_ID_VSRAM_OTHERS_SSHUB'?
  593 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:103:15: note: in definition of macro 'MT6358_LDO1'
  103 |   .vsel_reg = vosel, \
      |               ^~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:105:17: error: 'MT6358_LDO_VSRAM_OTHERS_SSHUB_CON0' undeclared here (not in a function); did you mean 'MT6358_LDO_VSRAM_OTHERS_CON0'?
  105 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
      |                 ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:590:2: note: in expansion of macro 'MT6358_LDO1'
  590 |  MT6358_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:110:16: error: 'MT6358_LDO_VSRAM_OTHERS_SSHUB_DBG1' undeclared here (not in a function); did you mean 'MT6358_LDO_VSRAM_OTHERS_DBG1'?
  110 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
      |                ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:590:2: note: in expansion of macro 'MT6358_LDO1'
  590 |  MT6358_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
      |               ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: note: (near initialization for 'mt6366_regulators[36].desc.vsel_reg')
  147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
      |               ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: error: initializer element is not constant
  147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
      |               ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:147:15: note: (near initialization for 'mt6366_regulators[36].desc.vsel_reg')
  147 |   .vsel_reg = MT6358_BUCK_##vreg##_ELR0, \
      |               ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: note: (near initialization for 'mt6366_regulators[36].desc.enable_reg')
  149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: error: initializer element is not constant
  149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:149:17: note: (near initialization for 'mt6366_regulators[36].desc.enable_reg')
  149 |   .enable_reg = MT6358_BUCK_##vreg##_CON0, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
      |                ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: note: (near initialization for 'mt6366_regulators[36].status_reg')
  153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
      |                ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: error: initializer element is not constant
  153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
      |                ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:153:16: note: (near initialization for 'mt6366_regulators[36].status_reg')
  153 |  .status_reg = MT6358_BUCK_##vreg##_DBG1, \
      |                ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:610:2: note: in expansion of macro 'MT6366_BUCK'
  610 |  MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in definition of macro 'MT6366_BUCK'
  155 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: note: (near initialization for 'mt6366_regulators[36].da_vsel_reg')
  611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in definition of macro 'MT6366_BUCK'
  155 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: error: initializer element is not constant
  611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in definition of macro 'MT6366_BUCK'
  155 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:611:31: note: (near initialization for 'mt6366_regulators[36].da_vsel_reg')
  611 |       buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:155:17: note: in definition of macro 'MT6366_BUCK'
  155 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in definition of macro 'MT6366_LDO1'
  199 |   .vsel_reg = vosel, \
      |               ^~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: note: (near initialization for 'mt6366_regulators[37].desc.vsel_reg')
  684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in definition of macro 'MT6366_LDO1'
  199 |   .vsel_reg = vosel, \
      |               ^~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: error: initializer element is not constant
  684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in definition of macro 'MT6366_LDO1'
  199 |   .vsel_reg = vosel, \
      |               ^~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:684:7: note: (near initialization for 'mt6366_regulators[37].desc.vsel_reg')
  684 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:199:15: note: in definition of macro 'MT6366_LDO1'
  199 |   .vsel_reg = vosel, \
      |               ^~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
      |                 ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: note: (near initialization for 'mt6366_regulators[37].desc.enable_reg')
  201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
      |                 ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: error: initializer element is not constant
  201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
      |                 ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:201:17: note: (near initialization for 'mt6366_regulators[37].desc.enable_reg')
  201 |   .enable_reg = MT6358_LDO_##vreg##_CON0, \
      |                 ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in definition of macro 'MT6366_LDO1'
  204 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: note: (near initialization for 'mt6366_regulators[37].da_vsel_reg')
  683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in definition of macro 'MT6366_LDO1'
  204 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: error: initializer element is not constant
  683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in definition of macro 'MT6366_LDO1'
  204 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:683:7: note: (near initialization for 'mt6366_regulators[37].da_vsel_reg')
  683 |       MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:204:17: note: in definition of macro 'MT6366_LDO1'
  204 |  .da_vsel_reg = _da_vsel_reg, \
      |                 ^~~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: warning: initialization of 'unsigned int' from 'struct mt6358_regulator_info *' makes integer from pointer without a cast [-Wint-conversion]
  206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
      |                ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: note: (near initialization for 'mt6366_regulators[37].status_reg')
  206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
      |                ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: error: initializer element is not constant
  206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
      |                ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:206:16: note: (near initialization for 'mt6366_regulators[37].status_reg')
  206 |  .status_reg = MT6358_LDO_##vreg##_DBG1, \
      |                ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c:681:2: note: in expansion of macro 'MT6366_LDO1'
  681 |  MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
      |  ^~~~~~~~~~~
/mnt/kernel/drivers/regulator/mt6358-regulator.c: In function 'mt6358_regulator_probe':
/mnt/kernel/drivers/regulator/mt6358-regulator.c:701:25: error: 'MT6366_CHIP_ID' undeclared (first use in this function); did you mean 'MT6397_CHIP_ID'?
  701 |  if (mt6397->chip_id == MT6366_CHIP_ID) {
      |                         ^~~~~~~~~~~~~~
      |                         MT6397_CHIP_ID
/mnt/kernel/drivers/regulator/mt6358-regulator.c:701:25: note: each undeclared identifier is reported only once for each function it appears in
/mnt/kernel/drivers/regulator/mt6358-regulator.c:701:22: warning: comparison between pointer and integer
  701 |  if (mt6397->chip_id == MT6366_CHIP_ID) {
      |                      ^~


--ow9NmIg9bBeggGxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI05lgACgkQJNaLcl1U
h9B/6gf/Y+634iYDE/CByhWCn2OxcMgMgLKyHFYVUPjJF2M6YE78HyOi2AGK8A1t
IjGD7gay4LDgNuUUHAXEf/q/g7rks1Fhr4h99fILg+aVXjsJxoRnFUTnviqKH8kb
kvGNxQ4Y44EiDCrCWh85dTl2XMVkqBW870NCGteY8QswisyDdV77tgn9jPpQnrZ6
77eojWk3bOEUT4tIYzVV/2PsuXsod5DdJq3R9a7YZK9PUJmt7ltITlyLME2wModn
APveEV6LYt2jgvAgyvKGXXTaDBnJtooQvqVKAjrenPsvxDz3H0YOBKd/I1JGxKdr
W2c1w2/0KuXPQ4rM2C0bDAGgVcksYw==
=MQ6X
-----END PGP SIGNATURE-----

--ow9NmIg9bBeggGxL--


--===============0774359163161907477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0774359163161907477==--

