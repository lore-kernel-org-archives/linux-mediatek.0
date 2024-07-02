Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D0C41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 03:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZRyBkHNQ3c622jNhIPsNvvYiwbX7ApzX2B3ZH/W09sY=; b=oaD5oaaO7m0ObskbasKf9X8Y3w
	Htj7vL1iqOoocL8+rulQx3pL1H0l/9eiPGboxq8x0uO5qpYIWnO2kWyuvtUyRgaGt+dlD2uNpRUPy
	kT9Qj/t3bLU7QiWFbr3DG2YOn0ErgnjYm7Qk5lRuBVGGn+mx+AKcv++qSuj7ktsIe1V/TYV07z34A
	hy19+RgLR05PKWGiNVMHS8b2vculSx7VBuO0sB6W3EBwKGBXXNX2iu3pcVsIVUW+yXJ/zyKUBzF+p
	AeeiK9LplwIqyc5dtS3w0H1bgSD+nGLsbb92BLsCUWHTViUWLrkRSG9ZnqbL0NfmPqgvyKsTBNn87
	dxWrD/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOUUm-00000005ReR-0RyD;
	Tue, 02 Jul 2024 03:47:56 +0000
Received: from mail-se1kor01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2800::800] helo=KOR01-SE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOUUj-00000005Rd4-3qED
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 03:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVGIm2PFTrv2fyNums1ex7IedOKK9yLRrJN1khjameXBeqpuR/J7OQ8Vtc1kTtL2IO2SlB4AjPU6uyLW6EfsCOByKpX4N4ElEtj+GlwabCfaMsZ/aYqyB047xfClmuFf3m9aAp/xTaDeXxgIVWnSCLMBeHlEdyvzTjEfkupQJdr0/yEKd2P7pbwKa4q9sX4djda0L/M2gGzMy/PoyBgDaik/BrOXCwJ3xuGw9Ml9G9nbjdlszI7LPyMDzk+yjGYqq2oZxJOh1WQNUXlCVuxFt0a10xaT4YY9cHLx6ffA2tGkXP+pVWJO2+iVZ5m0TlRcE5rgBpfTZ4vU73tnRTxHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRyBkHNQ3c622jNhIPsNvvYiwbX7ApzX2B3ZH/W09sY=;
 b=BtFjfTVj9pZKNXKO/ixF4Gh8Sq7iO9l+82E4P/CGlA+NQaWSdmAWo4pJ/bhlB4qJS8O+TG2XKTnqgl6marh/GPdnLRQE+iCQFwrv/IWtQakrd4QkCDJMrCCx6dJKyRby32zk+b7rMhHibv7xg9/qEUk1Lv88lU538t1jvRD0u1l560d88wvToLURFa76a/zsbDDHRoGbRazwLNHPprZYoSRBqbFrm+Ya2GxnVH/IiikEKNmh5uEpl8pnu2yYnL8hc2YNsiZkHrZEypwBC3erz81YGPj80NSfH3lzcv7Naldjyu0JjcGyvMDxbnTM9/b/DMbiLWNYISta8a3hzS3B3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRyBkHNQ3c622jNhIPsNvvYiwbX7ApzX2B3ZH/W09sY=;
 b=Tp4pSQa0q4SLtLOekouUzqyR+c4QB1hBIA854lhxIFznLdueiJp5QZn4XFNs7JMP4okHy3qh0ZLpH3Z8rogyQD6FDbCzAyTr5EMH4B3QAOYCvF8rQ+s+37SoRMiRlNoTfVxneXtaAd459U24rHs/5TpTOoRqGLrJrNYx6BTBVtMKJHo552b8qrZYzyxSF0IUp8OEat8aj2XJXTG1bpbaREc25rksZXC6JcEQ4uW+RGMag/DWKQFCd6P/p5r8DR6l6jlxEyIAiu6xHeCwjj2VhhMIQiCqxDVUfLmii/BIJoefPyyaRPkfaM3x/UC14Oc28KWRenOu6u2SUr3VNsSkAA==
Received: from SL2P216MB1467.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::6) by
 PU4P216MB1566.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.34; Tue, 2 Jul 2024 03:47:24 +0000
Received: from SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 ([fe80::72b4:1095:3317:ae84]) by SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 ([fe80::72b4:1095:3317:ae84%5]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:47:24 +0000
From: Alistair Leslie-Hughes <leslie_alistair@hotmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Alistair Leslie-Hughes <leslie_alistair@hotmail.com>
Subject: [PATCH 0/1] Dont workout the filename twice
Date: Tue,  2 Jul 2024 13:47:06 +1000
Message-ID: <SL2P216MB14674B320D951C20063052B393DC2@SL2P216MB1467.KORP216.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [NNpN46HNchI8NaUYchTWjsSys8Ai9lDYHTS/veYanKVSJSwkLF92c6AJK7VfddL4]
X-ClientProxiedBy: MEWPR01CA0285.ausprd01.prod.outlook.com
 (2603:10c6:220:1f1::8) To SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:32::6)
X-Microsoft-Original-Message-ID: <cover.1719891559.git.leslie_alistair@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1467:EE_|PU4P216MB1566:EE_
X-MS-Office365-Filtering-Correlation-Id: e0924c17-0073-4255-59d4-08dc9a49af33
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: SIAvCK4niq2Qv39PE+PbuOHcelYrxwvBDZ+eT66MRgSXt3i9aVZenAntOC4OFipLPlz/WybSHN71TgWkKfylMFktuei7XX9exaGF7pWgNpP2jtRw7Wn+36Dh/cLiJdDA9M87LXqKIwmOiITB0SYfab2kmsFx/pfOD9PvPQlXEWRYKp8yzdOk76zShxV0AjKxS0kkx3fiFha5QF/Iq+5TDod5SJdMySCC2D54JqB8DyNcxdSYAR6H7Zq5YrYsPg4et4L4E35bqLx3v+oNBZUrgyjNMK7K+Dt4ySe5jmyxK5svntJ7F/qQngSTVMKbzhikeLzU8EBCqW3h3XhUq2s9SpuFOTw1cKNld7IJqD8Yg64XVpjk/TkEInz1V09a4SW1ZCKSsasm22OydMz0K0sJvJGTKorZOWh8+zy+u6MPH3kDYTjMCMrYBvcXIc5awn9ZkjgfeIR18wpm09uCQZZ5C27bYiQTYfS02Ro/hRHv8BAljWeGIuZ8wQS8dOeqFZBu3bC5zrjyJMrX/6AODsajR62qJ8QJDS+tMjD1WfZlNlYqMmvjYIasW60ybK/49wfWi24wT4dliv6RFfxMUiiNjs90mYGbl47pBrxbtsYZKWSq8ue+4HS8eng8eO47FHf2+fRRrWITBOe/J95FV+OHfA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NPO7TlliFb6x6eQ11Pg9TyEMPvQ0Cu4dP6LHdVpUSx9lmaOMXVmypvcu0D1t?=
 =?us-ascii?Q?+oHk/BsIrDm0dMsMlXEyEr+RGglqaGmyONRsRSxXeex67BrUmc8aqUhJE0ki?=
 =?us-ascii?Q?cIqMyuyXQQQUOLAux2yDfAS+XxnGff6ioWTlLmbXvkRgACsJuKoXhIeUp7H8?=
 =?us-ascii?Q?PF5T3OeCEOYfDD1NW+dgw6N8VMI/ouU72pfy52XS+4x9iwMaBO+p7aiFAGyZ?=
 =?us-ascii?Q?qGNpRxB1ss230Eyb25LuUCQrqskOK1Q0tTm+tFXAvnD/U51qxerjUxN8fCpD?=
 =?us-ascii?Q?Bloz7/AVfD5pleLMvFI94yqVK3gvO6eSx7Hi43VEgCQ9z9Nkr96qugEolSZQ?=
 =?us-ascii?Q?pv1cQ9jYTccHycIfpmzuNgfYPGHwkrQenlwreSPZU5BN0Ar1Bgt0Q13w47IK?=
 =?us-ascii?Q?zBvPO9phsvMsrx3YdFqAKQKGhCRaEYxU4N1lg6Vmdf5zwPj4z4P8qTIXI9cf?=
 =?us-ascii?Q?jLLfqJLfNzX06pjPLfBBcdNtCL3mYLstK80i1+jLECRkWVzobp71IS26934w?=
 =?us-ascii?Q?lxfA9uaXo4V54QNdwkllzSZ8yy29Mvb50+2EFJb3BOtHBYNbN58cGh07sY4D?=
 =?us-ascii?Q?7P4Q+caSleqwnvNmNleDRXLCTgUVQmXS3/xvaWLj1o0OFaR6pUgHxWn7luQs?=
 =?us-ascii?Q?OEN8Uz1jbKo1/JZX3c4H8VK1xHyMgmlJHHkrhxsxM4NxnYkTg7EFbjNLzqLB?=
 =?us-ascii?Q?F9nZLR9IFaIfMcDReSVsAijDbfGd8nvs1x+T6QhS7WmsaDhNzKJevQvr/Y68?=
 =?us-ascii?Q?fIGulmTmR+C5kGhjytsg5CdGu9i8Pamf/QVeS+UPBNZvP65oKY9ztmaL+OsG?=
 =?us-ascii?Q?qPFo7CCiOWtebQHF2slyjPXKd5ngzO+POPEr/3TcW10Z62FR+RcsnUxmrcgM?=
 =?us-ascii?Q?YNPVQYz18cQEFXert6LfzmAIkECtR/HvSfzJwfwguOBua5c0ktoOqu9AEldD?=
 =?us-ascii?Q?nN7er2mXWpu/U0C5tG4ARPO3rRFdIfqBgI5MM0/d9ZQS7ccgpjQBOuYs5JVA?=
 =?us-ascii?Q?r7E/EnoIyCTrUTKwvlwh8+iP+/cYMGwc3p3WRrMizRqglAGdmXH9uaNMnmoi?=
 =?us-ascii?Q?IvxBdChAnlhqSscVNG7xyf6KsarmpyyULeSfmd7P6wWkuZmgVCTJ3OuYXnco?=
 =?us-ascii?Q?frSB17kFq0546hg4uitqGpzdSg04HDC1Ypgup20LG8rzM6N/YzmuqrSwtPDz?=
 =?us-ascii?Q?hwWqRghhFWmKdePtM6fp35ADW6puTM0aiwTATprLnaCz2+WeQFi6UMQTh0mI?=
 =?us-ascii?Q?XV2ZHIW7L8iW73LmeJpsLaLRCLw6KfNLYMneQUNDfXHj+Y7us0UcnoIgfXkF?=
 =?us-ascii?Q?kzY2kiIHCJDg35ZuPyO9M2RX?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-0555f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e0924c17-0073-4255-59d4-08dc9a49af33
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 03:47:24.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_204754_050937_E01CFCF7 
X-CRM114-Status: UNSURE (   5.93  )
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

This is on top of bluetooth-next.

There is a chance the filename is calculated twice which just appears
to be an oversight in the original patch.

Alistair Leslie-Hughes (1):
  Bluetooth: btmtk: Dont workout the filename twice.

 drivers/bluetooth/btmtksdio.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.43.0


