Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F321EC44507
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJxlHgkWxGGHMXW0VfLZHkZS2m0ImYAVxD5wnyNAt54=; b=H6gSHtCGRaj2Ba7MFxv63S5i63
	dbvod/TyyeTNvJSB5+haRfKrOMDY+vr8XJeKFoVnGkGesNjNkkg+MOEbX0pygxCTRuz5w614gtMSd
	Rw7XLBvl4zwQHfh95l1CWG2lfYubWw/7XRCvTYa2s7Bq4SdXzUt0cUIl0N4M6ThPTgZUoVQAeBIZF
	45aDhZ3HKbSeQZMlSlKm735aSUOzTMGQp524u0PZIBluERJ1aghQU0sdYQFLIMtWBpX9LyGfAPkQr
	7QTlTncfDTTOrer3dGH18/iqLTJpqG90pMVaQXDZKDqovhqko4j2JPs8aRcGh7h5q9vqsPSUmV79w
	4kRr2zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgHx-00000002511-3MQC;
	Fri, 17 Jul 2026 10:59:29 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgHm-000000024sP-3rZO
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 10:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhA3XjDUemClJw7cmFED7KOgXS7qPkXnvi1T0ay9KD0eSzqNg0C1rrp0AqRQZM+icaK7eJp3tD6FZOvfRu3/hFJJJbz+7ntTe52PHnOsrZ3gW4sbPFnootgn6BeXzeXmUn39XBqVlD3vOlLBxZMcpwOKaruhD0Tp7h7YFS9wwD3MOk/KW6brXGjUF6g//Tu2p5HXerRiL2iW7gHS+7EARJ6uqstSl968IjRNQeh7t6PTPWtbj/sxIg0prJ9Pa1mVaxn9KAU+iOZALNrVawFij4MMyRWt3Rd50he//40Z2qnfANWBFI+v1R9UuDdoo6sJI1FDFrYbatnGgFL7BdNptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJxlHgkWxGGHMXW0VfLZHkZS2m0ImYAVxD5wnyNAt54=;
 b=hYo2P8WOaC4qOvIYB1kv86F40MGW1mnIrkC2PkHGTFq7Fy118SGzXdjVS+gl26RLez1w92Du6ifM0eWeJPxVPSVPcCJQ1h1QA6ubdd2eEZCt5miQeaYkc4QVIJBFB0BKxtULM0QapNuXCo0n9MKY5AoMqK/rfwYi7TqeA2Vmrg6b0TYzcFYCzM8rhlBqyq7l0Fc3EdYlzBKCD8ML2mXRUrQIsLNcNmUe5aeczBriKlzHs6vGmpsVQwj8bpPoHLtdxBj0iMSsIBOfZhRgpFbS+aHQSiD+ufBwr4OWBuT/nq/l2VjaCTswvBGxA0uRr16fLJWyNllpU579LaeKAZfttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJxlHgkWxGGHMXW0VfLZHkZS2m0ImYAVxD5wnyNAt54=;
 b=O9mmBdBpgXHs4Tlh08bKf7agesPlbL+ZhVK4TMCEfdrMBHQJmH9NfYje3sRHxw9Jw8gYS6aswhwn7OFciO6mrGr0oXAMw+HvunyBLbSHxL507rBpduDUkSiAE+5pkJ27XH664fl4HiGZYWWgr1R4LS00r8a1Ji0ioPMJQkuNSc+9UliSNj6vm16/M9Li673ovkY7P2t6H4BfSnva7BEJYk7cxbc37QQW7As61Z4O5VA88SCM6CZc6V4RPEJiT3p9wOEn7zYfZfHQz/WOe1qwVKxQiW1qQI1D12dazV461DR2aOlAw5Y/4pTJxq4bZo4ZoJjcxHvLfU8V//Rg1rjxDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8313.apcprd06.prod.outlook.com (2603:1096:d10:64::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:59:05 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:05 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-mediatek@lists.infradead.org (moderated list:PIN CONTROLLER - AIROHA),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/4] pinctrl: airoha: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 18:58:43 +0800
Message-Id: <20260717105847.131359-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
References: <20260717105847.131359-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 31162a34-0c59-4860-956e-08dee3f26adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|6133799003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: et9auvwrMZM+xa9KQa2cbKKiVeZ+Eum+CIVronsJZQQDIC/zYGMM+nB55wGlWOy/03iPIUtT2vUuA94b4UAKHQ1FV2mvZWC9pSJSJHpZYbVbkSRFdc6tKin6djRTAQOc2PVwbq0OMynLg5rJIUQMrNjGUt27dfJd5urM7Wi9MXI79w3mXm2rXIR5zvmiizIS7DL2Tsd/Ovb0OT52hSBtGNwU6Yaanbeti4PEhsqiKaAT5042pMuDlp0mr44ndtkdeR4/WNqtvoALWIuIZNy2FVotUqJUnYVeOqZATs+PxttCmEqVd0zd6r3F2xwQwNijLuBmrXxLbtvCaRh50ucslaFErkaWUR59MwRxgteIwRHfeFl2lnd3uWdu4e+PDX2h2PxTp7mhGNI+xT1XtquAu2F4vSauUVdCQ7b/XmzZ2fZkz2lRv6dmt2PN9JeB6UZ+CxrpJh96M6VKmQlfXO6jxfSpo+rulQxvMyjzVpKc1LK1qcteFUXVXtTfABY6wM5S0i3aH2DwZ2Iz1kCFsbVFuLW+/SEcTo7VPNaLnxsgYjuVj05EwPvstm7UQq3Yf9MVuGPu7ETjswK6OZTVl1lIS78U++jB/G305H1AVySwqQhsAWiOwkijZlZK3q/+RDcSPG8o0BYQ2/9lJdzBqhYyJS6/1eg0b14IEC1wB+ATx9EUwPCVJIR8u+M/k0ZXOPIhoB4JwWY7xobFNBQV7PW0w9p9qb772CN0K3NWp+76uYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(6133799003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bQ68eJEgo3wt3RS8J9EDC0FNNbzFhWRuEjZvJ+Sal69mA3AQjmQvS5xLWWe?=
 =?us-ascii?Q?x7fWy0BheAw4L9TiWPqMibB5sL0Fmh7/yfTa5S95s+Tnz2JYLFMn5Ev5mxk4?=
 =?us-ascii?Q?DoqrA4DBChIlFLVpkrPN9WBiHkxAmq2X/26TEcEdD7cNFsd+6cSfnUq/AjMj?=
 =?us-ascii?Q?Hxi+0m4nRfHVtzhM8lHu41ftbHak2NbrZIV652zbbS5tkdQfElKWIN5b+TWI?=
 =?us-ascii?Q?kqa0kme/X7jAfnwo/jBLiwvbUDvBh811/WiR64EhvomxPsBljHddhXLYBtKh?=
 =?us-ascii?Q?zFb5YBnYwIM9EZkc3niiBO+vtbb19ClkLBnofPQEJSjJ8k8fAmwqKTPibWHm?=
 =?us-ascii?Q?+Dhe9sL7GLl8VNTjlNTAsUKk4YfYnNvbfsYMVatKupYW5AOLarxu7hQFVDfH?=
 =?us-ascii?Q?0xXjtXIa/cMMCrUxYeWRkwM5nZyJ4LuwCMTP6OhVoFZe8Vg+V7ki0YleD/NJ?=
 =?us-ascii?Q?YMtjMYNZ5QUTClGHQHNGfbbgU07ZM0hbKLTyXcJaSZE6IpYkXtx5l7wvicPS?=
 =?us-ascii?Q?nZmklYcNp6bX4yGXpHhl42CDV9ZNgkykd5/S2/8MlmouCg+uiPiKnoThV/Ki?=
 =?us-ascii?Q?7ozjRmtDZ5zTaoickJtBC1ulkDTc0Pn4nqkFbngb0V1tMDwsx6gryX0/UlOv?=
 =?us-ascii?Q?/X8cEt5ZOJxMYirBpUNylq64NHmAdWljueMx2f+eKV7gQ+yGPoVBXEmfpB2a?=
 =?us-ascii?Q?mBHFkeCRUslWUGKHsy3VugeS87N3TMyqyk1vJuOdq9zwpn8K+jMpNwMbUKJ0?=
 =?us-ascii?Q?eg5G9RW0Az6KyK1s4amLgZacB60agTPlgUndZw4J+15MeuOJMxO4W27YtDUW?=
 =?us-ascii?Q?S+ChDoYSpOKrQojjVqdL3d97j/g0Oix/5hbukVgVPSNmziBXyWLv5TqXxwTz?=
 =?us-ascii?Q?f5AlBMIckG2XWb2Ln/f2ef98C++Hz098VBjN5FLiFJp2cuvHEal3q7eLPhzH?=
 =?us-ascii?Q?ja24ouN73QI33Bee5x3nQA92bgSaottrUP3kTC971L/G4i8UudwOenrv+26L?=
 =?us-ascii?Q?vLkRpdLNUDC0YjnSpxJamTwOu5tBzdGAwsIDLrIFQwQ9YarHodu+YxEu8WLi?=
 =?us-ascii?Q?GADOy6o7pwdlU4N0MhdSmpgR77sZRhx+FDEDeEdfyg6PR4e25s+ANWSX8WRb?=
 =?us-ascii?Q?7q0m1aFnTfAWMywDIpaQ5VH4C2BQ+Z6+fieshNht9iIfhk6Gzqw+7YYWUI38?=
 =?us-ascii?Q?T9m60sB3j5bP2CQhonZXTufrjetINFKQepnYilMlnyTZLQhQCoziN9EmJGlM?=
 =?us-ascii?Q?GjEDfdbROLSoo3y3ydSp2ZpzqGjbdOXVAJwoj7Ua8u8zil+JOInUEtyoZrVW?=
 =?us-ascii?Q?bnI5RwFz1Lu107WsGD8GhGXes5AzTGSFQWE7gQy1uNQUXOWVUIA3XkY/REun?=
 =?us-ascii?Q?wvepxIKhxe0TIay79TOu9ClsXdi2HQDPQy1TQdz7DjKPFAl5EbIyNJprQOEY?=
 =?us-ascii?Q?kUmV7XLcEoaB1Ve5O2J4rbjmFSvEhFoIv/T6nQ8WN9XOrhUagaPCVQk9Y7JR?=
 =?us-ascii?Q?s1blLoAWM90y3pCLV7DEMLtCEpHe+JH90GSETe4ojb87Q5hsaCZlmryHivTc?=
 =?us-ascii?Q?gSaLX9Rs00IXp8QSeXyIMYZTlvSwXCSwGkEZUNiXPhOV5s+az5XVglDJ6rgR?=
 =?us-ascii?Q?t0NkBKg4hWmsKc2uqZmtc/6uztr7lBNj9cLmfHraw6BWp8CN/M7ScwNauDkN?=
 =?us-ascii?Q?VYRZcZR385pF+QGEg0bXyWFG7P6PPJi+pnePxqL8DAMkDGvGz2uqowdiFdSC?=
 =?us-ascii?Q?BBy7g64kcg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31162a34-0c59-4860-956e-08dee3f26adb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:04.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrbf09KgGbP8O0BNzUGGcDoWEhTT5Wu30VdHaQz9gzIrggNgbx7k+GIhiqYT+yzi4zjuLjWYx5A+h1W9218+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_035918_981427_FB984E67 
X-CRM114-Status: UNSURE (   7.66  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..abfb018f207e 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2519,10 +2519,8 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 
 	err = devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
 				dev_name(dev), pinctrl);
-	if (err) {
-		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
+	if (err)
 		return err;
-	}
 
 	return devm_gpiochip_add_data(dev, gc, pinctrl);
 }
-- 
2.34.1


