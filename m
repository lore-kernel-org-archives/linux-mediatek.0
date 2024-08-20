Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CEC531DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p1QoCnJp5CI97oSdNLoMGPxC/GIgRAcgi/5ggtL1yvc=; b=0PmEbz0LIMGw/x7ANekmkGEDxN
	Q73XR1smUI6B1tx9ndyeuJy9O3ybK9lMBr8IjMWvhDrXwfeMdhx6JBLdA8TQqbIfGeX/9urSLWA8A
	TJWBxxwN9pem7hqgaKEUye/peJ8AteE6bb3Gz3pA70IetH7LLG2UeK2PXO1UDSmrFm3C0tFEWq3Gz
	Ap7fWn7onRRnfR5/7+9F74SsTpRlvyaToGjMgPZMxjqJevzD5b16S7ilDWKClBeb926p8nWgK6uDa
	1VnSPiy8+2EzZYGeQp18B0Qj6kYvq36z5UXmmqvPD1m+KRkp5w+i5YN3vjfns6tKE3sclHWTOsgQx
	sS+uCRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgO53-00000005Dm0-1YpE;
	Tue, 20 Aug 2024 12:35:21 +0000
Received: from mail-tyzapc01on20613.outbound.protection.outlook.com ([2a01:111:f403:2011::613] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgO4a-00000005DcT-2tuW;
	Tue, 20 Aug 2024 12:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+s0JSjk89eOlV2gUAwiOqcjEsUXWCDcSCvgfQOngDV0gOexBxMiuKj0yaLvurtNIZRRFoWwjMGG3o6i2S0gQF6DbysFAGSsTwC5DIcKXOxnH0xHZn/OWNlUHI2dkq4FUPeJB+kEtuNEUKSgO6fFhwbhRvdAiNuMXJbJPOS1jnqJO89o/JhHjKFfqHpgDyHhxrKCnhNzKkrihckSvim2TJdJyfJtG8gGmXWPh5dcBAMt9xYGCOH5cNnCdvGdi4tzQ9a8a1ywoupOlq12R4TQc+FQVnF+w7ve/ayMLcH15rQT5wJ+MgiM8q1i2xiiTXkcjCjcwa+B8cSBHHSU9qyDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1QoCnJp5CI97oSdNLoMGPxC/GIgRAcgi/5ggtL1yvc=;
 b=EHrdk6u3w6FRYAlK8K9bNozPxohY6WO6bvZOL+UNZqNPJego13en893+yNxwj72Hbic83NyfOB+aqkSFGqBXhyOOalyF94lAoWUNv3LuD8o5OpvvMibOb/WCLLXSLbJN+bKUqu3RF4EVAIVEjHyWkP84jUgg5VXaJn/LgtjHoUXDwecuMYscA1Zx2W4gnx1bIRX4QSEGSVp1aXWCCrfrliE6vRI0KZBbwH4D08B8f9OIYB6jBo9poQfTAkw9qa7rhWEv3YOmrhqYdDWld8vYI3JDvTYR/gkxsQw1jP1ZdykeX5d8Rg6RyrXw8jbEcFA8s8APSPuPHxZD5oOh3r/XYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1QoCnJp5CI97oSdNLoMGPxC/GIgRAcgi/5ggtL1yvc=;
 b=mk15cGLnbSg9WayGcWpSDslVy9lRUu3ukmTKFIyOiEaNJmPwYkHCQi2rnEoq8I20LU72GuQeAY/onR9zI9TfS8NFXbbf3MQPY+dkad69MbBcb0kIPzJKqhcYvlsxIS7pkcnOEp/sSVps4pKn/RH5VRH0uAUHx0EsRnR9fB5fzMfY2Sb0rla5SBjTURdV1wygsfQQ4u5iBCyhS5rdlP3AQfD161InU6v5cWLuJHhm4ljnDhSUrNAfHSkqwIX6bi5HcseRkH6DasS4cPBBUb9z7v9FKE4QoqyFq6oOtVQUu0gRD+hGUctrNlQkARI0K6mGxHgrfDhXIdu5CX1sCP1eag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5730.apcprd06.prod.outlook.com (2603:1096:400:272::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 12:34:38 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:34:38 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH] memory: mtk-smi: Simplify using devm_clk_get_enabled()
Date: Tue, 20 Aug 2024 20:34:26 +0800
Message-Id: <20240820123426.48694-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 659e90cf-65e2-4ad7-df28-08dcc11474c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dxtU2950kklcuY+5j0TZvNJKM/ujxpH4ePpxWTnr/p3dIqtSwHbs3/lkG+uY?=
 =?us-ascii?Q?3WnTgaoGsXQizijoeZBlGYV356uLeGDC/8Lu/LCmbPCdyhu1LxLg1wN7ZCYH?=
 =?us-ascii?Q?jQDD5XkHJvf3ddzAvoO+hiydNWvbTKTOk9fPeIPXE6MOGCKss7eDzlvqwnTS?=
 =?us-ascii?Q?CtS+zHEv2k1mryUgmrixV+DkSBltVj79q6YUJoSvVwAttJV5pIQ6DSd1rIf4?=
 =?us-ascii?Q?5ZYogtLqsU4WEAVIgbGr5/1VY2P6c9W951FsjQmrKmdjKFO6MNrlmaMiKLK9?=
 =?us-ascii?Q?lOuHAI+81whrUa28SWA+7LiQHP+HFFcLelWJQY6mPFTCKBLNDlTyrplMHmAa?=
 =?us-ascii?Q?nrUGyuNqjDO0kEfFHRisnp2k0rp4iaAYegSG1VlBiKxJDo30ns8AigddY1Bc?=
 =?us-ascii?Q?hKwCpxiHJy/avHT1cKfiXxun61xC6aclhUkpsctfJ1mF7Fdn1b58wybaTCWs?=
 =?us-ascii?Q?dTVNYJpPBJeSn3ANQVvyC+ZY8s4fqv8dTRrKYX9110uk9+ZnwKL93ZeH6rNb?=
 =?us-ascii?Q?RLtfJX0y7ZqR2fdYOuUy+KTnU4F8rbhh5NCKETnyM3/UCAf9WZDYZKKpXPJ/?=
 =?us-ascii?Q?Tzi+Pav+V76Ze/WgBRez34Ygbai5nbWP4ehh5MA3kzVp8wfn4BVBHbxmC1X3?=
 =?us-ascii?Q?FgUTazjbS2CKz1ll7Eh1UzzupoVso1yCeHZo1s8P03EWzdmvKtSjESZ9E/4r?=
 =?us-ascii?Q?ejO84E374dA3MdoyMF/gfBrNiPxRPeRrt82o92oBwcgLEENNhflA+40E60fX?=
 =?us-ascii?Q?nZ4zC2rn5C0UX/JA7BLZoVWF0LGAmOkcFR+S0cJU3fCb3B7FqNhly2mtPMHK?=
 =?us-ascii?Q?dj8K/uTeoY9qiTPrYswtbPafZWmFFGTeWMZt+sav0gKMtXOTq0Wnd/QbdSYj?=
 =?us-ascii?Q?UEHFEJbF/ibhiR4QhHnuTYOr9//zK1R+JsS9kYqSjvlKVqb9DDGjJS4bVcY3?=
 =?us-ascii?Q?xp8x6ELg0f3kQ38cTfjnl/umTHMhFgnAQ+0hZu8hAFOxD/2/E6MgkG+UhWwx?=
 =?us-ascii?Q?6afIGcNrI2SCA2u7PZErby1uRmpyONoFVygD3vJBiEOKNoz9zTngNvn+4Qs5?=
 =?us-ascii?Q?3wgTLcxYmCAZJaUktVWmeJkgW7zVd9qEWGSg/F4TNd1Hj+g+aawu59RHSBkZ?=
 =?us-ascii?Q?g9207/Kzh6gvv6MdUopEYjU4qu6f4QabI5fagkeA1kMu/I560qt2JXmVqBQ+?=
 =?us-ascii?Q?SzYZtvRNqPjtYyocW7LfW1Bk+XVbjXKagdsF7706rvEdl8nS5T4beJHQFy6O?=
 =?us-ascii?Q?FtqB3az/iTt6uZBcIWR3mBC39+e7JZfXsfvm4nuNaKX3DNDeoWY3mU9CjAqS?=
 =?us-ascii?Q?DiAuFag15rAnnluyGzM/Fmcb7ZDrokgYYLu/6sO0goWCY4jNwcUbypTy6CAZ?=
 =?us-ascii?Q?NUH7d5hRB/EbBQoZY2BDBgcJcSs2BUiBr89tDzgplxJ2Enfr8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AZ5QPhkAMojrxbOb/o5/IO4mEzEOL8j7LgihNr93tanRZqUyNEl9UR8fmW/?=
 =?us-ascii?Q?1Y8MhAMIu8VJ85ijI/E4dh7oWm12g5KSBWB3C9fpOb30CBLGA9Z96SjcDE19?=
 =?us-ascii?Q?m4S2PvJGF/BV4pYNYPBbZW4AFtIbPtPVbPZ94wPI3oH9fKqJ1/bQ7ISkBNa8?=
 =?us-ascii?Q?R1w7ydXElm+dJYdbyDNxtU81NnlhSt3Zt+31vo0CbS6mvMkutD/CQHf9YKl0?=
 =?us-ascii?Q?yNjtkrJHRv3gl0hDTCUIPApO8PzNdNLb7Ddb+fMbfEkGFok+i7sNMW62Xueq?=
 =?us-ascii?Q?C7DUZEusSVOy9RrijSZ+8FsWIYAIQZkbydI8Ft+l92972QKxghf4eRqv0LvR?=
 =?us-ascii?Q?n0bsPuqlgAlfVnZLtXXTZcMwNEl0NUfZ9GVQHp46laEpHERgw+W/xEC2IID7?=
 =?us-ascii?Q?Iu+VDBqpF2AHp7g97vcYsTCCaVDE/ipk6BPi0Pz7aQvaIcPl0mV1Z6ixesX1?=
 =?us-ascii?Q?Gj2xFC4FzjSbtCC2EDvzQ7MoY0wbXhkJmcMu++Ua8aCLAknr1jiyecXbEkn9?=
 =?us-ascii?Q?BVf5gWIVmojKKR/0XesaPbx2qYOJ2WBelkog5v9KrUy0RV9UCCGVXUhLUHw2?=
 =?us-ascii?Q?qKkbyM4igRvIPVmHsv4zqqP5RS0TFHdemFb2WmRTTffaV6DS/cak/+GKqUGW?=
 =?us-ascii?Q?t+Y+oBkKftcZ5DbN7fPi+82Evu2khZD3/bhhDF964+U3fEVCGEia4QfsgInC?=
 =?us-ascii?Q?6/LbG2g4sTvC1xgyypbuEooRxB3OK+9px19MIXGelVh0v51jXvUPGFX7tqlv?=
 =?us-ascii?Q?tQGxt3WFbatuQnYSXzZSJOxcXxJrT1lENNdLH7VcO14I3ox2aLr6mPG6nEPA?=
 =?us-ascii?Q?pjCaWO6TGk1h6BDTgjsT+AyOuqUDFu6mPW0F2iz3qcFMfMj9hQxrNz9p6Jr6?=
 =?us-ascii?Q?FhI1Nx/mn8ULTrGPdd8Es7PjgaqSe5etRfuzFEYIE+e7+qPbuRWhQUJzdUVP?=
 =?us-ascii?Q?cQfYH5Z9OZ0SapzJBocmCaVrlZ2RnNsKIONY2jCO+1ktCfkJNgUUXUbiLEoW?=
 =?us-ascii?Q?wUVMgC1aCZzBnAxgaJVd4/xeI/WXLD0yb5ZvEVXKNXMoUjnjg2AKJxtgt7cZ?=
 =?us-ascii?Q?ExJukAaIvNAWGCoiNEtWbLTEOL5HXV6CX/zbB6/8NF67w6JLwspRwS6eWz0M?=
 =?us-ascii?Q?pFyz2wFBg5FHd7Rsrr2VkReCFb59Yq9SCR3TuoXRrw7TmT5YOfzpy7TsSE+V?=
 =?us-ascii?Q?VdEA3BACPcn3enRe2aU7PBlL6zt+yJF9g1D3EprjyAUBfOJDd/S6jYAHJsoV?=
 =?us-ascii?Q?0iM7lbEyJQgIwwtfmQ8+weRj+BL1R4qOLtkih/RwB7o5zl3wqWmNwYbeftsH?=
 =?us-ascii?Q?I12DnSyr6EAPCYPZpnclPJ50U/e5NPjHmz5Yoj//qZ5iTG245MWzJd+5koEp?=
 =?us-ascii?Q?hNXTycgf5pdLKZWpmyMp5Kh6xCrFUoxG4wsvvu5TVSFgnEEqonNOB2CfgzhH?=
 =?us-ascii?Q?XT7nKF0k274Rk1dbilx0zxwFZOJ/1Bue6DNHU0KP1afNmtmp09eGx32dIsYs?=
 =?us-ascii?Q?ox0kAfVLnmISIl6AHD6WrzwqzcwPrSEwfPlVU3/4ifL9xA7A859NgWJ/4gPO?=
 =?us-ascii?Q?vZ/f1mP3eD/c1GaD3nUsE6gV1ZAwqT0UQgpyeO/K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659e90cf-65e2-4ad7-df28-08dcc11474c9
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:34:38.4633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJdyhNUx+bG5Voz6EGblt/YAGKTTAqrZ0QMVLJjk1Ere4Njcffb4kr4B+Nyx92kQ/MnT9Y+SL0FYaUSZ89nrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_053452_766321_A5802DF9 
X-CRM114-Status: UNSURE (   9.30  )
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

devm_clk_get_enabled() will call devm_clk_get() + clk_prepare_enable()=0D
and the clock will automatically be disabled, unprepared and freed when=0D
the device is unbound from the bus. So simplify mtk_smi_common_probe()=0D
accordingly.=0D

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/memory/mtk-smi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index fbe52ecc0eca..2bc034dff691 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -771,13 +771,9 @@ static int mtk_smi_common_probe(struct platform_device=
 *pdev)
 		if (IS_ERR(common->smi_ao_base))
 			return PTR_ERR(common->smi_ao_base);
=20
-		common->clk_async =3D devm_clk_get(dev, "async");
+		common->clk_async =3D devm_clk_get_enabled(dev, "async");
 		if (IS_ERR(common->clk_async))
 			return PTR_ERR(common->clk_async);
-
-		ret =3D clk_prepare_enable(common->clk_async);
-		if (ret)
-			return ret;
 	} else {
 		common->base =3D devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->base))
--=20
2.39.0


