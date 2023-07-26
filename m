Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E4EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 00:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7/2DUrKz7Iwq9/8Wt5fns3e/G0Q7YvLGiP20s/SmxM=; b=zIZuZ3CBabXImMbxZe7m4SQ2dR
	eBP2pxPrdRvY7PnrfIYM5hCtoAOYBj8/n9F5k6ntOpOlQOcL4yIYoU6GJFCtf6mZC5cXdABj6EVXP
	evB/X5WITUuI3Lg0xBk/hIEKEaR/3oOr8MDqgBhYkMXhPOaM9WamNSWnuFubsaj6jIWgmOH+rNOoU
	r347O4TVhYnmDBJrdZpK02etOqX6edXzYf8uH6sgUTJz8ej1VVqKz5cp+P9KEhY25lHmiY/HWm9ih
	o1Xp3vB2udklASibr8gfVQ3VmEyVqu4uN26+XkBxBWqbKFk+aDOT99HzK40EIWnt8FV46HX6TUwqD
	jjv0Y5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOSiU-008nzb-1R;
	Wed, 26 Jul 2023 00:49:26 +0000
Received: from mail-os0jpn01olkn20812.outbound.protection.outlook.com ([2a01:111:f403:700c::812] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOSiR-008nyq-2r
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 00:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as6HyCVKXe4ZUE5tAZR5EfxB/D0uM6fuAnH52bS7hyEvsW6xs141sFh5xujfAdV6OLsZdZus28c2FhdVyMavnmDVNMZT3vJSLc0GdCH1MjplDnNCNtiG8UbnXAoiD/33JDYanFsCg+ab9M4yNloRspm/adeUBHnULySB1CRC+bIjNOH3Eu3nGFRT/Q6c2y6Gy9TTRtESot7M81AVrrt/uHzDqXXK/3gd08rjVjsTWfQI4YIYDyrygm8j1ozXiCg/8sHa3znphL6zV7bEJiGlIScQfaMgxHnSqALZLgv50tUIBsefeOc5Td7l2vKbiLPeCxfCjfGJKwEbGOTmkfTWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7/2DUrKz7Iwq9/8Wt5fns3e/G0Q7YvLGiP20s/SmxM=;
 b=ZALDm8uuAd/A9NV2rIMMCPvfIPqgEJ/X53cxDqLCchLHiQNVlCqMGLC1HBDE5jOnq5UFMdUkhhfIBUBviF2h3S+9HYdlOtJy9bOV/5pZcxc4Uff4eqxD+0Fc4eSEK3eSYunluNGFofTgPwXI3gfO2HqHW8aMAG30ulN2+JruBGpRC0NS4WJrbV6e2gQW3EDX483PhcR3tigpKgefopB7uu3q9X/ADJeCmAIKswV7yIJa3cDcfGwVUfP7Pv8KVOrwD7OqA4c40+rxCLt347gjPnHH0XtEVdP5aoPLoCAHHYfIEBxDjMrLoS/7sG5b+O/2uM+0Q6adODQvctgvqUXgFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7/2DUrKz7Iwq9/8Wt5fns3e/G0Q7YvLGiP20s/SmxM=;
 b=Tjj+5ZPNmH3NlVKwX9UEgJA+ZNqaPEBaZQ7kFM7msasSBTTZDgI2t9Tr+hrZQ3WMRFJ2ZI7wabYiDJeV9ijncYNPBhKEyKBDbF2EfWqJVXkB0JUEEjcee9Bu+mTLGdo9YPBx5gCfJ5SnDCQiRyO5nk6vSJ2mcjyyTuxQb/Ys42o5HiTunMPEheIvy9gx+6/eos5BASCaEB0EQXZEjzcfSRpK/79mukHYDJWuDMUsLNM9bz4j2Hydtg8/ADjB2J4C+y33eg4hOEzLZbrXUYcQGXkiY6JxRTRTVpTZ0s9Ze9gNhcn9MomO5BQ/KaqH8+/8ZfNbTl8gsJk2lEDhRhWkkQ==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYWP286MB2495.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:236::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 00:49:08 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 00:49:08 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] pinctrl: mtmips: support requesting different functions for same group
Date: Wed, 26 Jul 2023 08:48:40 +0800
Message-ID: <TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [XDoQORCWmggWX/cq3TVGE5sspykPz5d2]
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230726004840.17286-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYWP286MB2495:EE_
X-MS-Office365-Filtering-Correlation-Id: cc692db0-4a06-48d9-bc57-08db8d721eaa
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrMmSJLg90fG+icJLcQjnepnrPruS2jts7y5aLSRhe97cFludTtQKFn9j1xUfgx44yLeEhwmW7vfzHf2ECavxSEGx9BzjE1RTbI52kgU0xTcIbwM/xUWjs/EuCUtmLt2nHW1swlSenlcv9lh/KMAVJBWhIMFlTx6zSs3BkFMZESXwgygADqsAx08tV/XWjnDmFux2NgWsNBi+8drEWXWWnVjxA+E/+DQqFBKEy3kDZ7/ID7YPFKEgFdHUTI005iMmaK0DTL85PP8eVUD8ditxvk+WRmZuZJn7pI2RO9lC5EfBrIbEya9opXzFBJf2XmkUbEkkVGMrB2vjkN2VGnkInfuF1gy1a+kg3gNnStuMMqYKmHPsCHNsauSQn7mcV/+Pt9UOt9wSEmmHwEFrBlZdPKEeWjapCNX9/3J8uqArMXNXkgKeqsLgAB7rjhuXJH5WjT6rLtU3Gw2qLEp+SxtSegDo3y2I3+yx7Wjyx+TiI71XagKymv68UbGJGyySu+3W+Eo0Dnp59Vks4x8ow0hP9vrJJ9Azfibsps65D8e/ewpSQ7R41OR38Zx/GhlfwSpbW549G9jXdV09OajKdLg3H33l33PPQthbEZmWbHYL1P6e9Zpz5s05WFvTVveH3iW7/CTK38m7+nu7VJBsjWNyIiBAZ9JBqc7fR+gLNdWcmgvh8Et4DvP4slkyBTjWsV0sHXj0+3AQ+DkFL604px1xODu5m+RBbrEM2k9aWD8uFo0IoQzaeWGhv5Ft+rU3ixvhcQ=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oS9h4PH7gr4WgM3nI2i/dU59HW9lAVsOHh+U1iBW5Yh8Ei/kaNA4XaXNPsM06b6yNxGnSpBX8wZ3aoXLtlUGH4fCglJqbg2SG/YLbgq9w/h8WFxRjoGIfiEUegRgo0kOmzaWm05YQm7fPOmXD9G2Qsnu+QoiwnrKCWWjrXem/+hxl9kk9Cjj4jcdEcFfcXwmpyC72eVM3f08EmahlpOEJt4XPQRWFAibzOsjCrOeCdRPvS15AGvkMgfpzjU5N8ind3LdDOQJlCjVMR01vEq6YecZUXt3Sc8i6GHJNXJMFM3HH7D/pn0MrAfs2U6Xtit1acbQ1S0qQdCv0jotkK9K7O9eFYtfqx6VQVs6GH5niM+AIlScYrJhO2KEqdbdvWx+YkFUiYp8PmbolUQh95oHK5IoooQdNX0w6+7OddPvZAQ3XTqtgUlb+LNDf5h/1/efvPDB9jYulPNjB0xzFlcsqVG6vNfIQGQn5l4ZzAjHgAnG0aniUxKw0igQSE3+7SBrxVaODfu1xfGngy3SPB+KKsFLTy9It9WW7JUZDe+OhD+z5/a9FnCQnLuNPJW9Bze4LPkZ2VmzeEWU3eZqq6OkwRBFLXcJ5xyur1n0+hkEIc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VD9/lwHVd9tyy4CL+46eujtazpVwO7rY4iACbDT4Jhutzru6IysId0CWShLm?=
 =?us-ascii?Q?5o7LvWgs9oxaoqgAwuVUpY2qt663Twsl2bAwqvi9i+VY5fN4y7ZF77GqvNDc?=
 =?us-ascii?Q?QiBELldh2M5yQxd241y7b6cw93DwEOMjbqAXWdlknvMfIshKuuV3v0L17pCI?=
 =?us-ascii?Q?uP9qfYBPrW5FyqfyvdxAeq5SdeNMiX01NIZOS8A9sduHZ47REYzMTdqzLdru?=
 =?us-ascii?Q?ZC+bLXF3oShxw5tZelJI/ljgxY2JSJnFb3h4yd3LQ+JpJU/hjdYAovRGOGw6?=
 =?us-ascii?Q?HpG9WrstJyqPkn9dusbkJ1LSpQjgUkn7z1adGk2cy0LKe6FZH9+p+99OIqwK?=
 =?us-ascii?Q?U9ZmsnYekVdytaj32p7EK4eYz2E4ycpBWXq2bBBiFaKMQdzvzphTTNwQbXru?=
 =?us-ascii?Q?0qzoj1i9rOp0LUvUFLvnyWXuJddZ1OSOP7v+Qb2ZOCvM0sOyh+2uw2u1S2lk?=
 =?us-ascii?Q?CCtKiinDsVA6uD0O4UDfHf96ZemqkYDomVDCcUESGZhNUpbKkp9v661r8Amo?=
 =?us-ascii?Q?ROuuVXG0IlTCtMUnbjZzsCuD/Di8PjeRHUrxqDz0EUjm//rrRnPaDYzYusQH?=
 =?us-ascii?Q?mSfoFc/GNZZ5bZTEcwM4W+nrutJnjwzwsnaiLYt4b1+ift+psE3gKhytkDeC?=
 =?us-ascii?Q?GzjSy8/vbBrG1e9GgyH160VDAExHPPECtBr75dtiRY9+KCEcBVfLgkRV3yQl?=
 =?us-ascii?Q?85GSKwciT81+bibeuDHXOSfpkkRkBM3dzIAjvU2ljFwe4EUV275VlFOPw+OT?=
 =?us-ascii?Q?Nx4J7/KgQEWsfUMp2SwMaDG2ZSq4Ad9M2Paa4SUHxNvZF2zaodfIEV1shYaR?=
 =?us-ascii?Q?rgR5O3XDpODhx4Udr7YBgX05jbdbJhb7YhqfC/uMuaY9iA5QqbVrMxop0NGz?=
 =?us-ascii?Q?MVqVGe2V7H4e60SVwg/ax9ZSKWk66I44FerfvRFw/H5xRsWUF6FicKUpQSlM?=
 =?us-ascii?Q?cYvXT4ySbhhjr+huKwfMWiZChXQT6vYJIRvXf14DG0KdYi69+32igg11AZ0E?=
 =?us-ascii?Q?QSHZ5ea+GxhO4pt01ZL8e6o/8gzDURQ7/+VxfrhvpRLPs9v/33YHKIiTbVyn?=
 =?us-ascii?Q?39hk1DXVBfik2UmQhRk15pP1ZIKW7lZcJCZhSSIcIQnTAv/PBckdPh7s+R9/?=
 =?us-ascii?Q?wnjBNwga6AdAUWURaqzFkOawdy7SWaR9hd1sBuAf7/qWEFOdRF5h4AnkuyGB?=
 =?us-ascii?Q?WKe92m56MoVtZ+qfRwL0kgwgNPty8dDcfx3eHUxPcLHUayMBm5BzvBAa6LE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc692db0-4a06-48d9-bc57-08db8d721eaa
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 00:49:08.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_174923_960650_87F3B6D6 
X-CRM114-Status: GOOD (  15.39  )
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

Sometimes pinctrl consumers may request different functions for the
same pin group in different situations. This patch can help to reset
the group function flag when requesting a different function.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
index efd77b6c5..e5e085915 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -123,11 +123,24 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	int i;
 	int shift;
 
-	/* dont allow double use */
+	/*
+	 * for the same pin group, if request a different function,
+	 * then clear the group function flag and continue, else exit.
+	 */
 	if (p->groups[group].enabled) {
-		dev_err(p->dev, "%s is already enabled\n",
-			p->groups[group].name);
-		return 0;
+		for (i = 0; i < p->groups[group].func_count; i++) {
+			if (p->groups[group].func[i].enabled == 1) {
+				if (!strcmp(p->func[func]->name,
+					p->groups[group].func[i].name))
+					return 0;
+				p->groups[group].func[i].enabled = 0;
+				break;
+			}
+		}
+
+		/* exit if request the "gpio" function again */
+		if (i == p->groups[group].func_count && func == 0)
+			return 0;
 	}
 
 	p->groups[group].enabled = 1;
-- 
2.39.2


