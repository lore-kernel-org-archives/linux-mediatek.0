Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96472CF6499
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5zW54ooWy1rzEvUmWc/Abw9fZ2rONHH1cpeo+9sLDY=; b=KnqbkOmoMCVPa4mjr4Hh8bT4c9
	LAQFzflk8JPr2w8v4dbaLoplL0+MxtlLNSG+AHuOL5mSInpBsxH33IH8MX3bcYMI4IBNCQkRQH3EE
	pmBjPDDEnvGEHzcIcvjJl5G4y0HXjKEuBoFKyScteRds0vWp3ic451kRPpLy4DaTZ2OFXSOud2kkn
	zNas4P2Qo/sZPddoHlAly6jpDgGnKGv7Uxv1iN7G3AhXsnF1gZKCzNI5g+U7oIe+P7SbI+st1fb8V
	HGLU56Cgg/Gl3z/9x2XsjjlaogYAdzgeiOpTTaMTtIcGaCpVPXIABUD1KoVt5gC4vD4bHqdL2zJ+v
	HP0MgOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sur0X-0000000Eb8H-1pFA;
	Sun, 29 Sep 2024 10:18:29 +0000
Received: from mail-tyzapc01on20628.outbound.protection.outlook.com ([2a01:111:f403:2011::628] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suqsV-0000000EaE1-3ywZ;
	Sun, 29 Sep 2024 10:10:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRxGgC2LCm+B0w1nYSnSAM0ya8xWGCKvYS2E6fsWwsG2454eKaFGHi135TBCfmnbanW9GUPEqtq7IQ3IGSA/pLG9IE3g2kAv4LKrsb83bSisHcJKVo6TOSn1Q2jHRpHokbtFBrbwaKNFT6d+wpvd0QgqTulMn+wvM1/8xrPXIT7YYM/wZBdlsiYR+5F16IRIw8WLqZ/qs8nl2I+8FSBK71YMRBaE1kIeYpH9sdRyC7oWRm/B0RuQqWGNhyqeqHugUfLZk8jQTABO5n1B/HrceCk9P3YaazGN5PVyPJb+h3/+YKR7OsqY3Jv64Pg6UvW5XteKLgIJ+igLdpTYOavDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5zW54ooWy1rzEvUmWc/Abw9fZ2rONHH1cpeo+9sLDY=;
 b=bmWKv75pm4WMOn6tCY1nzkl2R2XJhjKtM9jOkcAuTaxu6eUJ+oqBo9gLvhBj15WzjfA9oK5QSCVD194AqzsF6njUO6VvgtuUgdcte4JuNaR9KOBkirMjM7JtHJZ5J8OrWj55OxiBww/qkS/+5JBTsFyrEgF5+2HCu7rmfinyV99IJyT5LWdjXAmgcB4IE9W7H4Z0lm4vP5u6NTJnn3upnUJxhoLqI0zTyh7Y4/C4BFEZHLbwLJgZ79Lih9PMQ9bgOBnC4mY2O5EiaVdI7g42ugp4QnOwYSeJ3ocof37yfIRjHPEqwvcdHGqeNh1nfsjr44ZJdttwsM3v4xEB3MuwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5zW54ooWy1rzEvUmWc/Abw9fZ2rONHH1cpeo+9sLDY=;
 b=SUER4kpFAE3akMiz4JsrJnCOkf7phTPdg63R4i1q8J9jlDekMThOUizVXU1G4jJcXE+Qviho6pcGlntGuCatsYt3dn38UpyBJsjmMgn4hXnApQ5vFzUCrMS0p6q44ISZar900PWeaI5Uf1IxB25hfI1vVPCNSJNnneSOpAF1rWiJiIekuR7Kn2e1e4JJLbLrjlEMWzaOckFdo1DKO02ZNq2t4bsByrzwt/6mMjM8opm4wlTTTJnhbu358MoSPCv8eUN6JYqsix29aNPpAsTUQ9ByzJ+59Zq5XkzGwNd2aJTb0BYXJ7jDEuFiz0Cvj5rdy7eVDrOZJILbu5Dc+IbfVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SG2PR06MB5261.apcprd06.prod.outlook.com (2603:1096:4:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 10:09:55 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 10:09:55 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] serial: 8250: Fix typos in comments across various files
Date: Sun, 29 Sep 2024 18:09:31 +0800
Message-Id: <20240929100931.530620-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SG2PR06MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac3178f-e548-441e-60bf-08dce06edda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HfZcCHP8/ve0IxhD2/ZFnTfI+qypt9I/Fh8yqNVtYjWNpdEx7+C35BPkDWDt?=
 =?us-ascii?Q?E6KcGejuJdwdqTC0+VLtmk0M8RIfKFk87P4FHyqzCXs74zNzbMwoh3x3gkKJ?=
 =?us-ascii?Q?0tw8lk6nLWcD62/dpzcOIbsYheZxpshCvV4dfHrFzq65aNaIX7JS9ELUPY7e?=
 =?us-ascii?Q?rHupHa6Pc6VpLkhPu/Hw2R7JzKm8ggrWtIXT1HJV92Iypl6jbkkOZeJ0TEx0?=
 =?us-ascii?Q?wiR6P87rWomrRZR8niFgabEEd55mjXTjQ4puSTkrnkvRgeZxwdARpB6LtvqR?=
 =?us-ascii?Q?YjaYtXE3OmLEVWpbs9oZHYTuXC5wlZKlBMMdE3bZR5vtFzM1aOAhRqXQgw2H?=
 =?us-ascii?Q?MrPSv8lJvqBSGC5yk/Xv/FflXeQPMT3eYXnrKzQHiIdBAZLTn2jrUwTT02D2?=
 =?us-ascii?Q?YeAYvGvx32nd4OcvNIFfRTasWowDA9SYKeW2/i96+sR5Ct4GKiBfTM4Pu4FH?=
 =?us-ascii?Q?KOlFjdy7rHWwmY1EKFepwwjOM1w6wSOK7iiW6ZcKrHOvY2V58SwooZbvfo6e?=
 =?us-ascii?Q?csrXDnloMWNgExdvl+N7e8OjShGghhFRK7BTXWv3VBYRvxdWtWIbBuMtGBWL?=
 =?us-ascii?Q?9Us9Er9n5wnstj2NtIjuGgI8/Y95ZrlksgkDdZ6RaSh83WTAM+BxUauH70DO?=
 =?us-ascii?Q?aOAxNJCurLbW2lqGwfNdZIIvuLB4RW73xiKZ1AWhBgMaazU1+sdWbMqwujfx?=
 =?us-ascii?Q?HOmKF74KlzwWHjKJe/0jFQq3NhV9j4WX6B4vSR98/ENE5/SMHrsxO2WfbXL3?=
 =?us-ascii?Q?/JRDpE+GoxnKSYYzecJBnpuZI2JaxuCav3mnAM9r4Auu9GcgFrk86CT7kZ/v?=
 =?us-ascii?Q?IgennYbwMjP6weUk6c0tDxEBmJ07UQQMYfXbg9r3Vsy8rR47JXvnqShtZnIK?=
 =?us-ascii?Q?3uPV+vz6UXV+TxKbJIN5OMIR4CTPsojyqMvWtO7sjiaduQ0HYAlLCMo6zFq1?=
 =?us-ascii?Q?LYq3Sy4Pc94n7BZkqftBCFiOPQOeonHBPpHQ6duvpQRR4SUpNpSW9Kd7s9hc?=
 =?us-ascii?Q?ev9W+Z3MZ77v0DU1wUU/iGlcZ0zEZzxGPeJNpOCbUsAwXUsPjoeHssYb05TL?=
 =?us-ascii?Q?yc/5ZmoNZy1z293RxQ01HYlV7Mg8lC1a9qRk4fj/aAamrQ02bBfViAJ5M81G?=
 =?us-ascii?Q?0UqYsUX177LP7CLDcs0wCL2GEg0N8MmL3w6lrr+U6W9YBnsZh8krTKxfhoMM?=
 =?us-ascii?Q?VQL6eundOGPjEy6NgRrHm6qS4Yiwlq0nld9YLeubX2xPk+p3dzFlb6ZuLmay?=
 =?us-ascii?Q?38Lf24m0WkyqsNQiEzctxt0K8WsLtALyJN8rqBJpLspzW2Sts5Jw8kxw1+kJ?=
 =?us-ascii?Q?vHnyZOBuPYPO68ejMa8RZU/GhBVQtavv/ilfMXsnojRhjOul2iu3Mz88Ytf3?=
 =?us-ascii?Q?7sP4p1ZeGIj5/1rmYSsxaR3YZ56ld4EpRl426ujlt7g+w5+VgumuaKt4kOKS?=
 =?us-ascii?Q?Q8hjQ7LwnKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+N/JZGSjUcou34uhu8R4emzlQ775Mq3CTTLix/xidNfqIUQuCo8bygoqgi9?=
 =?us-ascii?Q?OacaZXFcEPZB5P378aSc+FuFNOgrSvabToYCCg3ZyZlF4BAhHABHYYOvxGJ5?=
 =?us-ascii?Q?BVgvGLtAFCMxpmpC6xvdYrK2gisZh6Oyt7wGkNxHg4YTvRFTFZpHNxEOxw0t?=
 =?us-ascii?Q?cKbZcpfEhFev0bqSqCdqvX43X/2PhZUwr4uOxOTIcL5CFZPCrEGnZdTAV7Kd?=
 =?us-ascii?Q?Zq1BZepAnMdYvGxfXpeXPG7orQznIr4Q2+w4WFlwdcmOx3NOfSWNhSepoR2r?=
 =?us-ascii?Q?Nv6n8UDVrdyQhcm+cPvQ43pQkkcZCdg7F/Hu2HXsOz0+NlaG2EqXGVOlHgJW?=
 =?us-ascii?Q?hm0wvwhE1NxquqGE1LxzCovgU3fj2DGOZIs6RXrg0+gncwM+MOH/nzY5ywlj?=
 =?us-ascii?Q?30RKUaxTAfuV5vrTMCVVPk5batj0igbA3dyWGEYb++5oiLHDLwlmgaAjZQFD?=
 =?us-ascii?Q?WKYEaUk3yRLEbzm9a9iZe3DFxHW2DXvOt3fHsJ64HCzb5dSUeJi20TSQfgz9?=
 =?us-ascii?Q?Ps2R1Gyq9sgf6mXNzuUVaiV3m0DfCDHk57VIAFp2PTCnPAohESkMvI2rHfhP?=
 =?us-ascii?Q?FuFkuLJ+t2rK3NWMs4DbN55WZPqvDg98f+EyY8sGa4nnEdAUdVjqxRhgk/wQ?=
 =?us-ascii?Q?v79nte0NtuRPJgaUV39JtCefciJY3oDmC1p25tAmCzxMbhvUA5bp8JmQQM+n?=
 =?us-ascii?Q?LDTnVDJEJ3iY0kkT3k2q6iHN73CK8bsi8FmK73qSDnQB19Dm8A+Wmfd2Vct3?=
 =?us-ascii?Q?aJpG5kEe2ZFIa/C2PPAD76cA6LUJciB1iATS5KXklIPwJtdcpx7Kiv1zWHvl?=
 =?us-ascii?Q?0Q8fXiBUuSS5nIHR4KnEEuVSOK3V6TISpi1JvUH+WHw1yB/dEy7Fyw41P68c?=
 =?us-ascii?Q?SPd3r35alt78Kbvs+7hYmx2d6nPvFVs75VgSM2ffvUxEi/Kn6BAjJzM780sL?=
 =?us-ascii?Q?sfm6PJpgvvbg5i7Lkuf6WCNkLaRD2U/w05fU7g4YbKKgGWOlsgaUmEtAu200?=
 =?us-ascii?Q?isICpX7CIhppBqFrmggf6ppO2gDBmQKf+IYZWJ+pQmgaf+CrvC5z20GvvakB?=
 =?us-ascii?Q?7kBuuhaLuzsyWSD+QwlYeW0F/QX5ylmDx2GrJ3yBwcPwCMG20QTYRfwx67/X?=
 =?us-ascii?Q?GD/xNG2prWtpmMt8zSs29IboDBcZlZI5qwfcGLmkFK4O5ep+BuHK0ta5tC1c?=
 =?us-ascii?Q?e7eggWrmUZCUZ2FdYR4e83kVD/G/wyJUDL4AZWDL8352sE/m/Q3EXo4PPJVS?=
 =?us-ascii?Q?K7p0dyBLQl2JhZkQ1ZhP2qufm5D/y1mlG1Q+3fJss8Jq7EU0HR8DOxES08/L?=
 =?us-ascii?Q?zxzb0HBSbNTWp8ZDEKI72Tc74HRUi6Os/ZFzqgguVrNYv6NSYJlXs/oJ4oZj?=
 =?us-ascii?Q?eIGHZtl393BO45OXYq1ruwj/1Df/JlvlNY4MIn1LwIcMku1iA0e5H/war2r0?=
 =?us-ascii?Q?6iW5c1CJUahe6ZToR1dyQVhQJfR3Z1sFwhq6jUbeoSqqoeKzHA2NVqN6S0m2?=
 =?us-ascii?Q?76hrJyxZKhmdgXHPeoZ1Tdsse6HWbhIgz7l1ZGut9k2F/B4xtkPKsLVnsK7T?=
 =?us-ascii?Q?Z+mQAXSOxApxJEnylaU+RYNyjln4DVaHcZOim1iV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac3178f-e548-441e-60bf-08dce06edda3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 10:09:55.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvKJJBarvKM+rEQ8LiVJCb2wv05tld2w/hRa45rechongw+gcFHZaxDpQlDOWUq0+Ib1p3Q9x78M/41GvTt9HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_031012_619142_A4CE69D3 
X-CRM114-Status: GOOD (  18.82  )
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

This patch fixes several typos in the comments within the tty/8250
directory to improve readability and code documentation.

Detected using codespell.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/tty/serial/8250/8250_bcm7271.c | 2 +-
 drivers/tty/serial/8250/8250_exar.c    | 4 ++--
 drivers/tty/serial/8250/8250_fintek.c  | 2 +-
 drivers/tty/serial/8250/8250_mtk.c     | 4 ++--
 drivers/tty/serial/8250/8250_omap.c    | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm7271.c b/drivers/tty/serial/8250/8250_bcm7271.c
index 2569ca69223f..431d560375d2 100644
--- a/drivers/tty/serial/8250/8250_bcm7271.c
+++ b/drivers/tty/serial/8250/8250_bcm7271.c
@@ -812,7 +812,7 @@ static int brcmuart_handle_irq(struct uart_port *p)
 			/*
 			 * if Receive Data Interrupt is enabled and
 			 * we're uing hardware flow control, deassert
-			 * RTS and wait for any chars in the pipline to
+			 * RTS and wait for any chars in the pipeline to
 			 * arrive and then check for DR again.
 			 */
 			if ((ier & UART_IER_RDI) && (up->mcr & UART_MCR_AFE)) {
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index b7a75db15249..5f8933537728 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -360,7 +360,7 @@ static u16 exar_ee_read(struct exar8250 *priv, u8 ee_addr)
  * @priv: Device's private structure
  * @mpio_num: MPIO number/offset to configure
  *
- * Configure a single MPIO as an output and disable tristate. It is reccomended
+ * Configure a single MPIO as an output and disable tristate. It is recommended
  * to set the level with exar_mpio_set_high()/exar_mpio_set_low() prior to
  * calling this function to ensure default MPIO pin state.
  *
@@ -516,7 +516,7 @@ static int xr17v35x_startup(struct uart_port *port)
 	serial_port_out(port, UART_XR_EFR, UART_EFR_ECB);
 
 	/*
-	 * Make sure all interrups are masked until initialization is
+	 * Make sure all interrupts are masked until initialization is
 	 * complete and the FIFOs are cleared
 	 *
 	 * Synchronize UART_IER access against the console.
diff --git a/drivers/tty/serial/8250/8250_fintek.c b/drivers/tty/serial/8250/8250_fintek.c
index e2aa2a1a02dd..f59c01f48480 100644
--- a/drivers/tty/serial/8250/8250_fintek.c
+++ b/drivers/tty/serial/8250/8250_fintek.c
@@ -125,7 +125,7 @@ static int fintek_8250_enter_key(u16 base_port, u8 key)
 	if (!request_muxed_region(base_port, 2, "8250_fintek"))
 		return -EBUSY;
 
-	/* Force to deactive all SuperIO in this base_port */
+	/* Force to deactivate all SuperIO in this base_port */
 	outb(EXIT_KEY, base_port + ADDR_PORT);
 
 	outb(key, base_port + ADDR_PORT);
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index b9cca210e171..2b8e6bfc7d81 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -346,8 +346,8 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	/*
 	 * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
 	 *
-	 * We need to recalcualte the quot register, as the claculation depends
-	 * on the vaule in the highspeed register.
+	 * We need to recalculate the quot register, as the calculation depends
+	 * on the value in the highspeed register.
 	 *
 	 * Some baudrates are not supported by the chip, so we use the next
 	 * lower rate supported and update termios c_flag.
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 88b58f44e4e9..f967d09482d5 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1304,7 +1304,7 @@ static void am654_8250_handle_rx_dma(struct uart_8250_port *up, u8 iir,
 
 /*
  * This is mostly serial8250_handle_irq(). We have a slightly different DMA
- * hoook for RX/TX and need different logic for them in the ISR. Therefore we
+ * hook for RX/TX and need different logic for them in the ISR. Therefore we
  * use the default routine in the non-DMA case and this one for with DMA.
  */
 static int omap_8250_dma_handle_irq(struct uart_port *port)
@@ -1338,7 +1338,7 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 			serial8250_tx_chars(up);
 		} else  {
 			/*
-			 * try again due to an earlier failer which
+			 * try again due to an earlier failure which
 			 * might have been resolved by now.
 			 */
 			if (omap_8250_tx_dma(up))
-- 
2.34.1


