Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D91C54EFC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+izv+NV8NzfC+vgdWavwgNERaqTGQVkWWTFSoHMFXJ8=; b=maWuMG4VWtOvUl9JC21ZeeEYyO
	+lQHNcwmBMNELrrLVecZA0MM6ky1wRoEhBggmP/V82SIkkRlYs/I/UkKI64fbpn0qfnWq353KOAeB
	jjg1d+PZFwo7yhxI1f4seU4AXuXY684q4VnGz3F1SU2eDdtDDvzNwq45JFeo8jTyRVdCyz73GI9Xi
	W5ZyQyHXD+JuJVm/LE9XpkF8icMzggOwAMXSb9uNm9WxaTuVZFWeRxCbhEd38nG0oGlKF/fv782Cb
	9ha22qusA0s1AkAvD0bubgaueCrOzmjjja/xuDhl3emrCqzyzJfunTCk99v8BoP2dmaaKvRPK/E1j
	TsqjRYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLX-00000003YVi-0b4l;
	Mon, 27 Jul 2026 17:42:35 +0000
Received: from mail-francecentralazon11023082.outbound.protection.outlook.com ([40.107.162.82] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLS-00000003Y2N-39mC
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/TZ0K6B7jiCB1pqE0LnT5pG+1aWiqDnzEtqvts4Xj3YVRQqs6Wxim5ny/aPC+9mGpMV0ySBVln8dkE6iPZFTJB/MBSGXT6Plku6zQhGyrIr8+vbxzXrRAJYuCmPegnPGuFVfc1IHywVAxGU5oMKbcj69alBCawU6kWrXKNrAXASp7951YgVMH4SNBliopwqKoNR754Y5tgb/82w8hG5p5wD/jVAxkj/bJ2qeu2tNq2Gtz4P1n1yGHP4k0J3AygwfG7hrakCac2PbxzlsDmc8g/T1VLChWXuDrzK1jaMLVMVlMLagl/XMWGxKWLZzVNF51IRnPoyQkj1o7ZbOcdd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+izv+NV8NzfC+vgdWavwgNERaqTGQVkWWTFSoHMFXJ8=;
 b=gjGvmvVLjl1E5OqPDVWBTVyzWXstncQ0znXP1NhsKR0gvGLrP3qGKOyoo+FoNcYbClN6zFMp0AcI5xgm8+79b+jxPrzsBdiNUalPjkUMEFmxkHfQQDKaFEYX5el68o145x9VdGkkyXHjALgENF/oYn3F8zVrgaRvZFZt7DTAKCnWdx0xbmNo7lge2/5SAlcUia+jB4bquRZnzsNOb1sP0P8cGBt9z/A2G7omTWiwDGzqxYPnQDVyg/kqclrB4U1HcVzz28uHZ48SuAqu7jl7dRKCunJmtW6NTshoeDL6vgQT2ngKwkdNkxJgf9PUGRaM9rV2dg6sW00PYInFtKY+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+izv+NV8NzfC+vgdWavwgNERaqTGQVkWWTFSoHMFXJ8=;
 b=uwsPOUVdYGVEaAsVD4ItHLEa0iSgRgO9LRhreDn3z253F6iH+dE6aeuOrkRO1g+B25VeG8swHK0S6tuzMvTUs+50SjTDdrZZHlel3o4AuPvPlmmYBzY4ZSLnIJIFfeTrnvyHHEmc4lamFnP/htkHQuk0FmwmLxKlPhv3eFjaCeDVr6g14sd05c7KkrOyI50E82YP0RvWPYXPbvxiCV4l2PYUCWG83FLf8dISR+c16sCXXciYtKRoMrOSmUdBKXZyVvit+qvZj1EsTUs1LIjKFHPvza7UOs8tKCJ700rZcHrGLUo03FTeXWB3s97OIoahYUj+O4KGDtOGw7/+aXENCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:22 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:22 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v8 17/35] pinctrl: airoha: add missed IRQ resource helpers
Date: Mon, 27 Jul 2026 20:41:23 +0300
Message-ID: <20260727174141.664933-18-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9ca443-a1fc-4997-86d7-08deec066958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: H0F4nGLi8CmcgHRnyLuOw6JketUoyGKIKPKVeUA/d6+LV2NCKTmFf3dijruO/sqerM+G0630tGlBW+3yIkjzBwkhSjnljqBw7W8rgajCAszh6/KRMIlZGLv9Wp19YXdMat53X3Hj1CL/ezf3Awq8bpPABLV8OS+67L1+vZn+gI33hKRn5gEnu7y81zFXgFhxnx/GOqQp7kJ6muXwSX0tL7oJNE0GcKpxs1361kLIA8Y4B+qVvUDi7j+eEsHFN0cqNCq2ir9SMJHCnVvLOyajsc9Prc57OMXpxEYdriqcFfIrRHta8yq75ES8iS6LkZXgObfw6R8A0RzpFf2GMdzCCsOQ+6AWqF5NF0Hre+/s+21T6qRyC13uwdYqoAWSNxzt/t/6Hd55u0xtgc1L4ObWaaxINbV0G71Ryj8szNk3j0s5YS46ZjQb1v2V5QJ9V0jIwYHWxXDUHlgoboagl10egoBMgfR/G6i8zXBBgajNFjBTUDnyw4slez78zbWfYxd8rPBjzu7cWwfLk/J5Ygfz/g3sMPnK1/wXUV2h+DtJMFymLV0zUJZWMS3DQNJfqAVJxemYYCnbu9tt3zmQqqvJnc0JltDSZZXEFOilOXVDH2jUTS1tjjWOEfXrVLN0B0b0cmHZ5XDhDuyX/pErTzkZCQ9QMM3QOyeGF1BmzaZENRg5EOZa/flPbOKlRn+I0buWpTpATxTGimVCCMjF9LN7FXnrkz2tQIpObRdlQOK3w6TtFP/zEgR6IDmdyi6Ccnmm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XbbZUEtQBMgS/grUXFdvx1S/xfrF1pbQfVsxfzJ0cOdFRSACLyfEMv9SDxgR?=
 =?us-ascii?Q?1CL/fdSRhdFZZq3Ap/uPLSrtwoIAhKuFB/FMsRKQaVdoye+6xyx+FbUQjfj+?=
 =?us-ascii?Q?TJis8u9Xhvl/BMpw0yOwOkYKb8FgNwciezGUniS/hYr/osysy27wmGTLVF4F?=
 =?us-ascii?Q?1c+EAVzrWqH2pZpOSq8Lc5Vnxx6XEaUH6hbAeyQ4TQKJhblANsqT35jaNm1x?=
 =?us-ascii?Q?579xlMW5YUkdAA417cZkLo7z1VmumCRZ6A4e9qRmTSwV16HG7SHSw0RPCfJi?=
 =?us-ascii?Q?mO6aToVjmlkRU8CsecwH5bpRbdu7IzpPmdaU/FpzVir7Lkv2jJNBfk3CGQrl?=
 =?us-ascii?Q?KUdXpTiEp/hJBMoF0xemU3i+kBrJzFU6+me6RH3Xfm2SwuAnAsrgLGj2SQrC?=
 =?us-ascii?Q?lWxHmpWsw8p9wfL+YUxpujLLkjJeL7w0ZIFIJjIxGaUu+CwKVHRjffdBBsIB?=
 =?us-ascii?Q?UL6DllKpwd9u6pNNJT+6+HPhqTSzESLQXNxzMXk4DqyhjQqBcNbk2w+zlQd2?=
 =?us-ascii?Q?IO1d3+h7/ZpPIJrPX1BNkLi56ZWLA1RM4rT3+IkxQEH/qERuei32wfN4DMWg?=
 =?us-ascii?Q?9ooTgpoMdwE5AQ+bdynxQJPi1JqcZfjk6TMH0LtjrFhfxQLoYu/YHSC1cM9B?=
 =?us-ascii?Q?+RfTbWRc2T8Xwb/4kaFgpPs6RNptz0TbzbtmMvB8m7NoDyga2BJs/14nItrW?=
 =?us-ascii?Q?pcqBHRuP4bxSKiByMwlzFLapgib1BaxNSPjDmKRrXAvznNHWk93NRVYbdOdz?=
 =?us-ascii?Q?owCaz+FXXCsP7CzWqdf+JqIfn3OgUdlIe8pyhsatWNPItpruUvczvoV5t66t?=
 =?us-ascii?Q?PeAZtqEaChLwvco3yzGPUiP3su+0VBtuKdLgAYhqkko+QEuw2epF5SVWf5Zb?=
 =?us-ascii?Q?sgyt91UhdUHHRfdfATE0YmXd2MuoPCx/xF3LYZa2mOwJJ28wjON9ADo1Y0JJ?=
 =?us-ascii?Q?RiQv1HipbdZJ6tvO6rFI4syTiro5ANhm/hBHmJc23pqA2xFMxlh76XUSimLH?=
 =?us-ascii?Q?QPdbkAOUdwJvld8RZRoSKwBj2MhGSQF+DIBG8X0faFywqHnakM7v9uG9MAqz?=
 =?us-ascii?Q?Y7Xi+3QPSFOFPXTyY/7CJ9OtLUbct741XTK1NWMZCbp1eMHt3GhJT8nGs2DQ?=
 =?us-ascii?Q?Fg5NvstqbtnM5OEkFuSDA8l539dPnEdNUY//SF2+Fcz3kBVYtr2EhYcqhXtc?=
 =?us-ascii?Q?BCwcJ9dT8pH5NO0fF4r1WoYUcnjw+7nWjUOksyegWm8Xtr5Q/AmqvwLv6Lw4?=
 =?us-ascii?Q?XJ11unLskAOlSV+3eoMX3HLVwlG8mFetne9kwAw12I/ml0VdZFIrZmpRQvNW?=
 =?us-ascii?Q?I9p8V575sAFveLEQxSGST4VGmKgD2meSRmTBQLBMSjUos/Go2lZzK8iDFrbf?=
 =?us-ascii?Q?A1xMvSpQo8RmGN6aS7nRxcUDX4A3A+uo+ForuABydYz6uXd0ddHpFKvAWolr?=
 =?us-ascii?Q?b0k9O56hkE9PaJOkeDr3vWxIsL9hkyOhlXjjyH9N4qGeUiBy7TO0liCKvNrT?=
 =?us-ascii?Q?Uiw5cEgA7d5kj9h1xiaxBSByTJ/15CQWpdsq82SRXyNEb7AnozH7Y/FS1j54?=
 =?us-ascii?Q?m6evxzjMpuBC69qV/bit4phgejApZxOTb/6sK5wM3EalGwLKpAz2VsHWx9s4?=
 =?us-ascii?Q?u6GFgbR4rBJ3b546m72fJkzTpe6GJ+OoHBIKH9ERrWjB3Bp5BHac1N5vwaUJ?=
 =?us-ascii?Q?SCMytegltPjjXCk93LzKoJgOlPG6TH0cCR463zSMHUM0k+IsdR0Js0tF89ji?=
 =?us-ascii?Q?WjKR4sfXeR/OlaysYKI+oQobTEuwxNk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9ca443-a1fc-4997-86d7-08deec066958
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:21.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TkyPogdLoAC9alTlNFz+eLMwSjdua9twNHEKjkGII+mXxSTgPGnq/pY5OWv7F8XlFdoKBcDiBn4dpSWqv1nsfdnP5aSTdiPaeGABMsRedM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104230_795041_A23E2EBD 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d58829da6465c..011a4d447e250 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2671,6 +2671,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.irq_mask_ack = airoha_irq_mask,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
-- 
2.53.0


