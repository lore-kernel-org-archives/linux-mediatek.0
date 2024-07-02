Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B5C3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 03:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MOcSXFhGBaNUGaczUWaBnTqMDutL8/InKUymi3/47s=; b=BMvTHH/OxYzTAZLuwIiaYMTi4a
	VXQu0wmDskVp/1cLrP1FxJ1ijRw0HEgNE9DtNi1U2tVcj5mBMd2+Sh8e22XCDXSI+VK+zm96xSuEH
	4LdAw75WT1mMAfs2CY2ny8/xoz830lWZ1+4nrasNw26pbwuDM233jpe6EHE9CXqk83gwYjifvJIDK
	a0kQwl27CrukU+meiptchpPsF9j1zKaY5ZyVp7+MYGe85JMpZso3Jg9PlIKqgwNINIpz5v/WjqJ34
	TJbel/b1LZ3SJmgfmHE+G/iccNaQsaxNldZrOzK43CcFLo4eQqugwI97YVllk+4hbbs2HesUxvT/d
	dFju0MVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOUUn-00000005Reb-21mK;
	Tue, 02 Jul 2024 03:47:57 +0000
Received: from mail-sl2kor01olkn080f.outbound.protection.outlook.com ([2a01:111:f400:feac::80f] helo=KOR01-SL2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOUUk-00000005RdR-3reV
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 03:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFveNKEYc0cRo9YbIPzWXFu/gGkCO/g+dVvWQgfzE6tJtx2Etf6rUsDLLlGvKjE0FWrt5/PwJhWDJA2sX6Nf57DUxijVMRJznNruElxBRHt5Mhpzppm6YH/5E/kZ+S+PnmC7mNh4B1QN+aO5x/7RE1ly9bq40NmkU0g+IReRWhlh3jXQ8D29iw3RakNIQBFECWA34fmh+Ii+zZAFrAnTvB311s0LyIWzR9+CuABOpGVGGiS932a9NvTCWjhQYbjgyqsDk7HeNWFqc3fmKUf6KizOM4O1PAq2TuPEAWIDELDz8E2e2BDvbWq2FvkkxXhel1afno2Z8jCSJEV05+cpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MOcSXFhGBaNUGaczUWaBnTqMDutL8/InKUymi3/47s=;
 b=UzytBbjJ6TQjC/vRTHvVv0i9UdZA2OWhfP/DbBG4oDOQ7kJl0OwcXNP4DBU/4aTsj1rKtVQjMdJLxDABSE04XaxeWy09vBJBVDc8jFk/Pd3BkS15CQEWr4dzVhBDXZaX+kZX37a/mcqoWd7dFibVcZD7IZftk+BM6DGYN4j4AFsfcbROB1pg+fPqz9D560s7KdR6fNBwrXB8HOzhLLfas88lyMZzbcwqEKKSGT2oWSrwWWsT7tQvaax3g/sFy2n7xCOGKrWXtGBbXsg4snRzOHcClLtyIX7uHJmgM6cESRPKyZsR9gP2IP/DAFlYN/FIirlF4HjN6aGfoo7THv8dkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MOcSXFhGBaNUGaczUWaBnTqMDutL8/InKUymi3/47s=;
 b=GKhV9AEpmUhgzUm3TX/FwWGkAB8okzIkcrQOuWOyc1uvQAANYTUD9/9dBRQIzkdH2hPE2qqC/4j4CyBh3slsdIMwSIhBz7eF+IRdMpdaZqpxXpwMKTZ1T4dvLc6hQOxjUK3UaI1ufL2bQHN5UtR+Q5g5aB5KBu/xRFf38ddvj8Z1uZ5stnDWbbYfM+U2zxRkisBUhIFBHRM0rloXYmn8hn/hO7FO9D9NPnM5AQnTE8V7/MzYkZcH1reEhGqYV6E4WsmY9ve2HOWHaRNJJnucq5v5NgIMy+tmD3P5wQMfh42NKZRIqQ5h+1w0Dk9oQMuEm0740Xp5siKQ+egFumKSUQ==
Received: from SL2P216MB1467.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::6) by
 SE2P216MB2834.KORP216.PROD.OUTLOOK.COM (2603:1096:101:291::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Tue, 2 Jul 2024 03:47:45 +0000
Received: from SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 ([fe80::72b4:1095:3317:ae84]) by SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 ([fe80::72b4:1095:3317:ae84%5]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:47:45 +0000
From: Alistair Leslie-Hughes <leslie_alistair@hotmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Alistair Leslie-Hughes <leslie_alistair@hotmail.com>
Subject: [PATCH 1/1] Bluetooth: btmtk: Dont workout the filename twice.
Date: Tue,  2 Jul 2024 13:47:07 +1000
Message-ID: <SL2P216MB1467968E6EA1AD4BD8C8EADA93DC2@SL2P216MB1467.KORP216.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1719891559.git.leslie_alistair@hotmail.com>
References: <cover.1719891559.git.leslie_alistair@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [tgZVV1ALOg+7AZccN9cjf2X22xsmFMCmj8qNicIrLyy1lGBblQ8F2dcXScroxv0s]
X-ClientProxiedBy: MEWPR01CA0285.ausprd01.prod.outlook.com
 (2603:10c6:220:1f1::8) To SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:32::6)
X-Microsoft-Original-Message-ID: <db27490d7ab2221bb4426dd73178a3b8c27928b8.1719891559.git.leslie_alistair@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1467:EE_|SE2P216MB2834:EE_
X-MS-Office365-Filtering-Correlation-Id: 34887259-0503-432d-e670-08dc9a49bbc3
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: FmIW+M92KZtUBAeKRjy1OkbkeWhQ47Dm1CqwrBcQvR2f/hETDzF5e+EfMbR8ZxVtdb14jjKmXlLx5ncSlU/5bPTONbMODPjFQObABas6fGJaf9EWNqunTan9fTsWx8WQ/RCjg8Ie+nIamOnZ0ySphVr/dUjTzdWiApnCJPDScqmLjNBFL1VHV72SScGEViygERfrvbXgi/y4pjzEZgKK5nzOMhq+0hqbNRFN9y0frI6saR2iXE2YWpMd38wfmxjQ5KfDbjm6n+Jwqut1PsXiInestcFi0+Vb+oNE7ii+paydH6WJ87UpX7BF3GcxNHI29FV49nUf3NxBNSlqC6O8ed2T09TBWHc02tgn8MQ7CAZ2l9gWe2Vgb66ITJfRDrL6W98b8v/t+T64OE0tarDX7rIqYX0G6vgwC6F28XOUgPW+68SgFQ3zvdvMrAAHdUydCcweCBbdIbwul37lDPB1q877bOZC6tlCCVk8d5eYw3P35eZ11Yf6K/ixxeplyPFTVQnVrG+5v8hYcxZa6xDs7wsDgwYsxUfeA3ZFhlO0vwR8qgarwI9vgBq4iVUmrnY3h3SzMD1kf8B00SHPFsZD0Zw5Hj6i1YyszA0Bqn6N5ipl87v5aQbv6ZiFC6PpprkU3SFUZt1G4OWzcDEXHgoxng==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tmyr7naEBU2nxd/dhVbTYLuZ8S5AS25iZtgj+ZGlorDgLyIW0hRWXC+OBQoq?=
 =?us-ascii?Q?YBVcwDp1B2qZEXoNHElcePoVVvf89eoGHyjyTl9lo9xKeE6GlcvhsgGnKvwi?=
 =?us-ascii?Q?UL97Jm2N5Hg+2WhYfZ4lVAzU7GyOgi9weXgQwIhlZqU0KKlE3X2082KrTKHF?=
 =?us-ascii?Q?XnrFh2W/dKF3+D2nOwuEr+aYuT5NuSMzP/Po7xo3Samcx0pkBa0txzch/WYj?=
 =?us-ascii?Q?jSp92rSu7ujzbGGdZSjReb911tRn3QP6QZrrqvEa6hXPXcnuykHQkyZLyTl3?=
 =?us-ascii?Q?ZfLxksJvum29DueXXLWpGM8hBMUIKchVGI1YjMSCTwabKeiFZYnKmAnx6OzC?=
 =?us-ascii?Q?bbu3PXQ0/TsmEEvbmyLbBjuk2a2diz5JXR/HCygMy3NN1yvQCYYmGDLCgw6B?=
 =?us-ascii?Q?nmMHpzdyCLiymI8ww7Ak9ljFig0oM3R92oQhkVUCY6eH6RD40hibyuXWM7Op?=
 =?us-ascii?Q?131PfxgORoMmurErEhbB6vzKXovD6AProYTjICxL2hI2Tf5Bo4c+opYa/+t5?=
 =?us-ascii?Q?K7XfKazlRXiundPBlmERcDlirPaOI0l2JiVXEWvlL3Bd6VdW0bznFkoJQXnt?=
 =?us-ascii?Q?xl6rPlZb+mlghX7quilH+PaWmStb7XwLQc/1WmUVT5QqkVqcETYyHygJBCSB?=
 =?us-ascii?Q?z350/XLq42vNtEDbUA3HTGZM8ZMXrfTQgeF6cKdanzSSv+PkWoUsJNo0n3PV?=
 =?us-ascii?Q?MaUOEvQmdAgLIcLAARVouaePH0HJV6NyCJPZvO4to8XY2cv3fN6oGhOavJhA?=
 =?us-ascii?Q?J34aSuO0HCnSR9huP29frjt6aykaJt12OXz/DI2iDU/8UIdWidsxjSfOkwMN?=
 =?us-ascii?Q?mazrLPRcby114NHRK0BTTwklSmqgslEMEf4HL+6N1hLESoUv+kah1i3KMizz?=
 =?us-ascii?Q?DwEAmee8vUU0wsKM9geLJ7OA44GhARDzhtKklomrL8eOkl+Bnf+Qd/OeK4BQ?=
 =?us-ascii?Q?IucSs3fHUIuXTUWVafPr0OX3rxmOrdZald/uIcZNBVdZcXCIGgMWjz8jTOnY?=
 =?us-ascii?Q?jsz/LlXM/MvCp+9HmQ6BTPlR2Mizki5/NbWUgFZnI+3OsZ5hDikUzct+WTez?=
 =?us-ascii?Q?T9gKtcaIv57rg1HiT4rAk9jQkGuRDfm/7sXb4s7O4wy4eLI0OV9KSMP89unW?=
 =?us-ascii?Q?o1AiN28hW7LnoHT165QhVYtjJ+vTDPBV+dv28Pt/De/HHA5J+2PS8dfUY8kH?=
 =?us-ascii?Q?gpbN3cj3RNZ9SkSNOELEDa7vVDqRNA1w6O1oy4GePNvydM9AXDezBioyDCKT?=
 =?us-ascii?Q?uF/kfkFzOIV1LFUCOjQIbICP1X9aHffLV0wHpJuIeHPv1VZbynqJ8+ZAqcEi?=
 =?us-ascii?Q?NAprcLtULKLvh2S1vU6a7L/3?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-0555f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 34887259-0503-432d-e670-08dc9a49bbc3
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1467.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 03:47:45.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_204754_986056_60A49624 
X-CRM114-Status: UNSURE (   9.12  )
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

Introduced in cd2f22b64f0038302760cab1543b9bb1696bf968

The new function btmtk_fw_get_filename is used to get the filename but the old
code to workout the filename was left inplace.

Signed-off-by: Alistair Leslie-Hughes <leslie_alistair@hotmail.com>
---
 drivers/bluetooth/btmtksdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b4e560a17aa6..85850c4b6953 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1120,9 +1120,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
 				      fw_version, 0);
 
-		snprintf(fwname, sizeof(fwname),
-			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
-- 
2.43.0


