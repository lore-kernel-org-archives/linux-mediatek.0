Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AACC63797
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DrvsQ/tz3r/k7xNTF5Z49aZdUaQ4DAq1eAb2foYGT0=; b=NBZUEEW1lZ/X8q+9/QGCtyFGnb
	db9Fa80kZ4NIUAJ/i5AK2xYYPFxXmNvfgVAFibH/8HeuXA8hstR73YQYa+h8UGKeGkytGSACUi/N1
	Aveu92GOyy90sdIezWCvC4VFpTIiiRYF4GZIgRuXNEbURzS2+AUhw7Cy7sezB2/c2TFmoK/YriAWR
	oiZwUACG+67t/T5pxOdzDLoc3acnttUxuCUNeWIkdxtTsrLvUrA1F+D4IKbme9EgBMZwCmvA1/p0v
	V984BpmTDdCipnsTE/YS4qMdbycIEtm0IEqHqT8wAaxE85Kb8svJOE0PdsuFNMg4RyhlXn9iqCL8Q
	h7+6tzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1s8-00GAZv-1r; Thu, 12 Jan 2023 18:00:16 +0000
Received: from mail-bn8nam11on2100.outbound.protection.outlook.com ([40.107.236.100] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1oi-00G9Dv-7y; Thu, 12 Jan 2023 17:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3uAQTj4UtZnVqtmduYd/t+dGQYG88XKuut7PXX41/TLwsus4ZgvhlaEf8B+9lkzw/WVV5y87/L3u/LmURswL2zBx49FnUBzZSA1cRSWsUlr1/8TAoKfj3o9j/w2sK29esv0U6PBYWJJ4jSrfMYb0EyEa9hA3nUqeWjO39nov1H/2hJjmWQGIRN7Lq+KVncQIunOa6o5C2Y/8G2VzNgMyg8qBug3zg3jyE6kEkrce4k6+hgmkMYURw5kmYSqyUFhjP53eT0JQ4Il/uGcJNYy62vVfCeGuidCL8ZT2GEXoC0ep2E8WuaDDhg2bA5rpjJhhUNUfweiTsM7doNBtqirMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DrvsQ/tz3r/k7xNTF5Z49aZdUaQ4DAq1eAb2foYGT0=;
 b=drZB0i7/BnMej2rTGcFbyZ1kuwKlMuy1xeXcD85Lj8sWn77g2LZwetFrV4odwjmg2E8iyx/Xoz40TZt5nBFL3sGg0BKU6AGuwLPwvsOQDjKH3TIdm16qneAj4ZnqwvrwBJCsh3iSn9/6kLP9inPwpww3Pz0ZmnUCEdyEVCR6On44f4/DxZ0pt4+Q9qHxJXtdBJbO++8ZET2oEkAptFHrZNkaomGhP50XCr92m/yvUGInlX2HKTDdiNrN9q425Df8fIu3d/h1dFZkOP4T5fAnwzlQsNHt+eHXliT//TMZUri7s0RptvtLy3wHe8Nc439FmZxSdsWLOkbDtEmyy5x8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DrvsQ/tz3r/k7xNTF5Z49aZdUaQ4DAq1eAb2foYGT0=;
 b=E70MmB79gepBI/2N7qb2Fmzh5du8MWVq5mDLJWmY1SGYH1VK1Qv/5rTGvGooRf0OJfRDj09nXVlHvAZX6fnAG26321y2+V+IxFZlrvOfTwc3uTACQ1E23yPF78fNFazA5MNMUR8gdN6FAizZUorhSMZaV7uZz7RujNIpjkX0q04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SN7PR10MB6548.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 17:56:39 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2015:3589:3e96:2acd]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2015:3589:3e96:2acd%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 17:56:39 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?UTF-8?q?n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 net-next 03/10] dt-bindings: net: dsa: qca8k: remove address-cells and size-cells from switch node
Date: Thu, 12 Jan 2023 07:56:06 -1000
Message-Id: <20230112175613.18211-4-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112175613.18211-1-colin.foster@in-advantage.com>
References: <20230112175613.18211-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|SN7PR10MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: a71aff7e-689e-481b-a7bc-08daf4c65ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sV5nYhmSmJT5SngEM2g+tTD/3SQ42b5riFWvzczZ5jFkT/xvP3+4v2zOLuZ3Og1tZY33H44o6npJkPe0a3EeBT43mWiwEC4ozP6Ga2fOUtGmk+JLEhHEGbn92A+9F5VcKzjvYlK5ts/kiwC2QaOYdDLxz6U9OHIbFElfRWa9jnrwSiB4k8nAxSk/xA3G4medZW+jlw/Z6ln+k0Ll1M1x7fnFogtRATCrtLJc5kFQlTk909BJYyWztQMifD9MbAWOjJQuOt6mUAtZTs3A4I+YyqWzl8l3549TFS8NV05CraomSDvOiWa1h//v4r/0DlArC+kwVwurCuv5F/UiutOdpY+0+x3QxoJG16KJWSvZy1wBk1BBLSS1lV7SNliqEqg7MBM7FONscVmKLBfKBjL/C7CI25+0+FAgQjMezYAY4eLlYxlraCAcghlhcfanpDSuoYxy8Igdqi5c5ULpOm3YjhHgNjepOrbRVzKcaNzSzh1BYygrYS602yPyflEBuhXttqaBtSTscSBbl6pmMLEhiHDKBt3ULcpDfWxmcLL+f8b5DJ9vQXZpwIUOkYR3rqFdurWrdtOMunEINgIvomuD6u1fdQeIIBBc5WPTN8w3FBzLhWvxDpSsd5028Y1zHDQ6GShzDQJaNSbNAjQ6szhh52lg1zMhjJtYkd3FVVJTABGsXycHfMY+H/YcmLL30ObX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(39840400004)(366004)(346002)(451199015)(66476007)(41300700001)(66556008)(66946007)(8676002)(7406005)(5660300002)(7416002)(316002)(44832011)(54906003)(4326008)(8936002)(2906002)(86362001)(38100700002)(478600001)(36756003)(6486002)(52116002)(6666004)(186003)(6506007)(1076003)(2616005)(6512007)(83380400001)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?26KlAV0yhJ19g1+oRvWYvpyIlRywRxUMP/7NJ9CCQRx7zE8sDYE/jI5DmYXL?=
 =?us-ascii?Q?FQiYdxpXy0//gTpN5RUOmR/Jw3qYE20YHUGJGOTYXcPRn96ij5DrRNKP/8Gm?=
 =?us-ascii?Q?nXP4DeHU3ufXHjggb2jzjrXzTcnG+9lj23ojpbVahINzktGxgn9BnmcGc40Z?=
 =?us-ascii?Q?2jAkMmYPh5/YIWqUlXZaUuByXu130UcjHV3U0l8HoWwXBIrT3+ZJyG7zSgi4?=
 =?us-ascii?Q?5XFUKma+mPaC9okAqfy7P9pqqlcXvJu0T4HJay5wAFYt0Z6iG+jODGULe9RS?=
 =?us-ascii?Q?kvuyEa7h4g03yI+WtOrBaRf51F2vDI3ZIuOjF9pUVWJ+o/EHIODkfZHsOanB?=
 =?us-ascii?Q?v158z1kvznkTP1XSeIIYI4EpJnrmCvYqSnGgKUFhroQ9I5zlT3BG+oLhAt8S?=
 =?us-ascii?Q?0xMoql46u3zDIbBwJ+gdJmo7BiJ3fSzOV+hwoEkyT6r40abNinRLk6orW089?=
 =?us-ascii?Q?Q07nM3x6qJvpTRIN/RA9qTvHLG4g2aSiF5esAEqK+tyFNzbT9gzukNz9vTv6?=
 =?us-ascii?Q?F79qqAxLy1DwANNOxN9zwe9PCEQYK2SD8ETj89xzwOWz2ebvhfslcRuQY1LP?=
 =?us-ascii?Q?qwG5h0pBR1c37LepOqnMFQd1pSG3qSx0QF16fTt/w9zCK6Dsv/UU2W2E0sEr?=
 =?us-ascii?Q?lVqNSKzx0qaP7D5FJpwRKhwyrH+1v9fB+2EcKtKXVI/CoCOuDuVZ56nu/zzf?=
 =?us-ascii?Q?wE8HCdZ64GwaDX/AEfuvAfKnAdmZlrSARy7wq9WSSlp8N9ZtjadKhfRuPeHn?=
 =?us-ascii?Q?Ou1qn8GqSYdeplxD8pHkhqaZq4hcXt2R+jA2qGTKAyO+75nR7qwQS+AOOZbP?=
 =?us-ascii?Q?ww0LoT7/EjEwM3gj/QBV77y5LA/1j+djx94ENhoOKwb9MYpJibTS99B2XMUQ?=
 =?us-ascii?Q?eW2EpgjxkVAsOCCq8dWl7PybtO6I/s0l1xnklwnSuvb4LJ0epToLLh65LGAT?=
 =?us-ascii?Q?7sCaHWN7/V2qozfUduFiBnSOaLgM+HetIqGlw1vwaGyWUh7kL+WFnVX/3e4q?=
 =?us-ascii?Q?nmTzfWHqvEV9UfksQI3VG5KJOOFmkB72dnURSyGHrabNmhrG6dy3uHh9T1CC?=
 =?us-ascii?Q?M/NNxsKpADsmELG5kEFF2Ff1iK1BfQDSOORuLzJ+BKB8pzUOJlVgwjLNTmOs?=
 =?us-ascii?Q?JGQ3JClOmgYvn6dmwM97/oqzHmQGr6ANwGyUKiv8FyUJ9gGtUFX2tHqq3WUE?=
 =?us-ascii?Q?pxKHo08jkWFiJZpvpWGzrKKznDH4DrSoqNpMUjJ8pkg3NI5E0gPArmmWoTZV?=
 =?us-ascii?Q?pDlc8VtJG0dChWQhk9n3PZ5FrlA3peut2jDOJjArnQhAeUrdsu1ndqsVFti7?=
 =?us-ascii?Q?569rAT1fy4OhUol1wxOP4L/Wc+JVhFiuNyOy1MrzwGaX7kKJwu2wD4V1GSJ7?=
 =?us-ascii?Q?QgaiOjJ2dW6e6hkH+DYeDsuH4VswpndfhsetsNyH3DapBCwegDaRtUvBximr?=
 =?us-ascii?Q?zYRRN+PoV/8zztq35ZjJwzipE93BSBnwYwaQJQefDA8LaLLxYncyDKKYTQ9T?=
 =?us-ascii?Q?OkUbq2oyN8pus0r+rvyToxN4NywGX27gmql3fSZmllToY5aRB/T/c+g/jfHI?=
 =?us-ascii?Q?WbQUHNyOJ6rskpPAFUgOE4GsaH+fsWzAbEABR44kY3r+idmnTElsuvhqg1OX?=
 =?us-ascii?Q?xlGQ5zpSJP/NiyJGzuQeg/Zk5491E5YNVqLo5u5DMArxMT5DXKvWqqU5OHBj?=
 =?us-ascii?Q?OqYSrwfkodJ9tIf1qzLWDtMzNUE=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71aff7e-689e-481b-a7bc-08daf4c65ae5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 17:56:39.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOkqZQvnuhY+L7ODjCFQ1/1ply2fXF+l64ctgeONfXXZjUsCWcgHbzBYbYCMrYLxwrZQxF5CcSqrBNj43VYODjVju0hC4enODUI/jsVV+mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_095644_425357_0EF0C63D 
X-CRM114-Status: GOOD (  10.83  )
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

The children of the switch node don't have a unit address, and therefore
should not need the #address-cells or #size-cells entries. Fix the example
schemas accordingly.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v4 -> v7
  * No change

v3 -> v4
  * Add Reviewed tags

v3
  * New patch

---
 Documentation/devicetree/bindings/net/dsa/qca8k.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
index 978162df51f7..6fc9bc985726 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
@@ -148,8 +148,6 @@ examples:
 
         switch@10 {
             compatible = "qca,qca8337";
-            #address-cells = <1>;
-            #size-cells = <0>;
             reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
             reg = <0x10>;
 
@@ -209,8 +207,6 @@ examples:
 
         switch@10 {
             compatible = "qca,qca8337";
-            #address-cells = <1>;
-            #size-cells = <0>;
             reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
             reg = <0x10>;
 
-- 
2.25.1


