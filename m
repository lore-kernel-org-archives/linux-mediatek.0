Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E874C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC7UA9mftHdkkMMQIkwVhKskvNJ8tSYmrl1feSalOcU=; b=uxuP+wy31tPbG8kcrOekh3zrWi
	c+Z6nTegPuT4hyeEB+qg8p5U8GFsl8nOrhiUWfTfdpZeHTBoN5VrwFZMK3vzKfafqoewb10GFvLxW
	Lxi6okzfWySzQ2lh4PL/wodKGoljRXSQu8j8/UbqPD1/8nhUGTTD3S/GFImtkq4EIx80oUUeVrRZ6
	0IYw11e4/koXk6aMF1C5JbI+g8HMIYcp3y8YyNIpRH9ZIvtpVQlkrAfQu5csxpTG+rPsTB3vPJxSO
	sfBZynypN28GiQbzhkxwcsEpf6OQYKElnsXgt4C8lMe0jhZuQ4akjNRgoc3G0MSx9SudFEAYv3iOm
	+Ay+eITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3qae-00DptY-Io; Sat, 10 Dec 2022 03:31:52 +0000
Received: from mail-dm6nam11on2114.outbound.protection.outlook.com ([40.107.223.114] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3qZq-00DpXH-Va; Sat, 10 Dec 2022 03:31:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghE+q91EoCOxQSMLFD073DftC8mwvVxgvHA62c3d/eJqD3mrSwqO6+bQ27r+3HtVWAk5bD/MWYDOajRxJDzaAfCU2SNWSIvwhrDVwTbr3hXr890tWpOphw/P95ajaECDpp/tEjMIzLZxb6sg0zw8IgNvCvG++khn3C/m7BVa+FuToBk26RAGlaQLAXpkTCawa0N3Tr2jYBaA7XmiP4k2+71O9gzpK+KItP9E9vJyBpzeefL8azSOggww2YYR68fWJJw5ev3dkAKSryPUlFnyQTTEUryAjbFHw/23z0vnCou1lDc52Up1l54+e8pHjzjR3sTNnlxhr0VKpqUUZLIpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC7UA9mftHdkkMMQIkwVhKskvNJ8tSYmrl1feSalOcU=;
 b=ftH5yG0J+pmIjAzmtku4j+NudqSKqaTp7SQ/pDxRDabnxfq7ylu5lw4TDrZ0Hy/mn6nTZtITVac+mRYrZ3WxEi3yl2MRVZhrMsYvFXWW8snhsYl93OFGC86Xv0BCtsDALhcwaGiqAJJ7Yme3qYZXRNOIFHhAZVv0l9jHp7Rd6RbA4VcesAghm8c2100qQNq/SrN9NGFhpY0LJGQL23m18DTIoHg3LjjWDGAMNv9z36tSgy/0bKuaKjI8C69sURW6Ekn3vZT6rj2446mrPIotTws09zR04JscPf3oXxlRTd/IxE4DA1K3naHm/yN9JWuVEHTz5fh7dt1RoG7SasoNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC7UA9mftHdkkMMQIkwVhKskvNJ8tSYmrl1feSalOcU=;
 b=HV7W6j8W7c6qm8OUVTQ4e+3H1xNNkY51GM2JEUnN4xlZEybgmm4Y5O++9uSfIZIJDw5PQSHBHD0U8TW1www0vXxWi9bF96y8osWZGBrKzPyTmPSnbN+ntHQxUUS4f6f7CQH/DxRKF36pFa9CDYvjxNP+lIHaqecRhtE6uJ0ONUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SA2PR10MB4779.namprd10.prod.outlook.com
 (2603:10b6:806:11f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sat, 10 Dec
 2022 03:30:54 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c%4]) with mapi id 15.20.5880.014; Sat, 10 Dec 2022
 03:30:54 +0000
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Subject: [PATCH v5 net-next 03/10] dt-bindings: net: dsa: qca8k: remove address-cells and size-cells from switch node
Date: Fri,  9 Dec 2022 19:30:26 -0800
Message-Id: <20221210033033.662553-4-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221210033033.662553-1-colin.foster@in-advantage.com>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|SA2PR10MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c83f9e-27e4-4034-aed4-08dada5ef1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Rhiza1CseAdrpYpVCuJO/4Mo5vRW+jI/A1p8ETH7ZOL4os0/Dz4F4INdJPa/jxkY0NoJQnn7HTBBRkiuzQOZss57uT+GIyiw7KbhWlFZfEnWvRNcZoM9lrxcgzFOY3SngIO+HIRY+C45Mu83j9uwNQbCuPBXiOg5JvEqjKnilIgghMU7zyOEyifwDwrlxENBJ1PUnU7k1myHAwIsrt+NHKlUQd6jm04DUx6XZpVdrD2bQfs/kjr7oOjzJFW7sqnpQRCJhWqnIRY/qXv6Ih0MolYxAL8o02KAsv6lyOaEhpU0SpkbDnbxdVJ5VIki02Nle6YCfKoaUpjOS0TYjXdBWiLZKi43WMQcSGevDfSkkQR2Nqdch2ah1qiHvOqUQ2uvGPj+Ws5EQ4ZhttGqoW9vTFLLHpx5JHT57s2KWG48NbLrGuOmHEMs8ncC3yMGK3EdcgSFgLwge6JC7ykZnv8rjSSK3nnSGYtdRsDCEQXGqe3x2RmiLXiGDmTGkBRbh8DuuTMSF3XpD4mDQF1fZB4ITPR2lDrNI9lYn4qxgLM9H3AqxWEb7NnExs8iMOEUEcbMvYtcGgHAFkiAfpGdjUYqwMh9qiEJeMlXA9dKiz3Me7ZmZ8PbiO+3m6onMTu05H/M2WBfzIoQhGEmdryZjUTr7hpzbAf7pckkvKObm6UQA+umF+1oX/A2qsNYpmS1yDo6GbA6jRjTx7qvIqRKWDuVPQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(346002)(396003)(39830400003)(451199015)(6486002)(478600001)(52116002)(2906002)(6506007)(6666004)(86362001)(36756003)(6512007)(26005)(44832011)(186003)(7406005)(7416002)(8936002)(5660300002)(38100700002)(1076003)(38350700002)(2616005)(4326008)(41300700001)(83380400001)(54906003)(66476007)(66556008)(8676002)(66946007)(316002)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Jeytx8NlBhMcP4+dlDAtnVLRQKFkes2KfN41e/SEEtCK6BqEMZHX0+6rnTeV?=
 =?us-ascii?Q?3ojuX7aQbEihGjv8JuRPVe5GyOaAPm9k9W/n+Z9vY4g/OzGAP5hnzV0HDq+a?=
 =?us-ascii?Q?xNQhFQospg5BlnVIJFFhOP+6C4EgQjBzQ2quFEh53BolAl6/BBrPf2mXLArX?=
 =?us-ascii?Q?yh76ro2ujltcQJ9gU30ks1mu1kkZ8c9Bn8CZZr8igi22kgw5uXhdSAKE1+XF?=
 =?us-ascii?Q?U3SJrZKwWM/dYWFo32jjBGQwGVS9Pu/Qa9WAQN2BIBhqQZMwxBP36wLx2tqn?=
 =?us-ascii?Q?3KYS9bV0P6gIX4Has0ttSmQk/Ea+uxmBEIuloYPUk9cnxjNA1e1gYlrV7+DS?=
 =?us-ascii?Q?fv3+Jyn/PhqyYxxxviPO+A/N4hwjTGzBFHXuAh4XbRkr0jhf6GC5ADPIvRQV?=
 =?us-ascii?Q?G+PbKIU29RxkgfOmSLeYE5f+gWEI5QSAd+fEH37XO3t7aw962jzmsUz0VuPO?=
 =?us-ascii?Q?cYa4iQZ3YNALxTTWmp31B3QChUHhePMTpAu2K8gnT6O+MtYgPQnMrTgGdhUG?=
 =?us-ascii?Q?x5KKvpOMg8J0+aM6S7JqKGbmDRTfHYMQEUB9OPJjb8EfTQ3Ecw8n6v4PkKh7?=
 =?us-ascii?Q?jPFDhd0FSKs5tLsjbOrtpL1WNIFeAxBvdvD0dpt++y91oTjN5OSA9kq6+R75?=
 =?us-ascii?Q?CF1zxXmW5jU0pHhGOn8C5Ka7PaowLp8E2/XI/E52eLEBGtBgA+PL+XwL1/p1?=
 =?us-ascii?Q?AUBKpvQacI3wHYyyOMz9EPvAOYIYSB4x5eoeEMwSZs7Kqljr+00+rlGRKUQK?=
 =?us-ascii?Q?dq63p4u2fu+MaRekp+vq8MI5IU+BCZnqgpiejpICpZKVsk/FkNMkqImdB6YY?=
 =?us-ascii?Q?cm9zUnjW4v2YOtA+PBYvXBwFFPcIwTG+QUX52BPU6E2s47jqgoKTYlKw96sf?=
 =?us-ascii?Q?dHtE9+2dk58WHcPtMr4ROzWCmwTijK6webSO5WE0AAlQdbPeh741WYjWR2bH?=
 =?us-ascii?Q?7RUltYFShHVWa/355d7iigJmLliE1A7ybwQnw8U3hbbB/7t8hHtBROp9xDrj?=
 =?us-ascii?Q?kYUd0kVboXT4lniGxx2gOd5kIsLaxtz8oZ7f/pchhCl1zWdGvvOfGlp/QQ0T?=
 =?us-ascii?Q?ElbBr8xw4Yg0yejsZPnoDszWUiyWE2m9zz6V2GV4g/4cnDIYFsz2O3Kd7UPL?=
 =?us-ascii?Q?IlD3Wpg1dfbKSd0YBNdR0K/2VqK6W6oW1SXOeYB2e/K+959utoIcmb1oL9pF?=
 =?us-ascii?Q?DAqH82unTWKnVIXNgNMDklu69trqBjX3m4T70b8gSVrTv+TUBkyO9mUnkn/S?=
 =?us-ascii?Q?0oRDOh2t3EVYwZ6ccIm10xUOVMMvxUCrFrgfWscArmXatMbZXuPCMErcy50n?=
 =?us-ascii?Q?s7hJOO2pClUVj30oWJui69oldxYC8+seKK3Ec4iTvgKgoLH4aL/dAJewNvWW?=
 =?us-ascii?Q?2g3P5Nr2bUdknkqbWQ4PYnbhv8iWw9/bwA2UtrWKt2jVIRk47L1aX0ek7W/Z?=
 =?us-ascii?Q?7fZLBuEvXrchWFdh1TZ7KNfnDKHCxeDRk+u2v6CuOMYRObWayOU+Vnj/+V/v?=
 =?us-ascii?Q?8HVWdquYmRbP/O5aAypfPPanvzrrLPRpPHD8RFy1wGxxagskB0upIMdtfPpC?=
 =?us-ascii?Q?nO/iZlmJivUpyCgszlKrLTzeeANInqmpcBA6RifenKOcoj2jWZiXOCawQITE?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c83f9e-27e4-4034-aed4-08dada5ef1af
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2022 03:30:54.4512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWMNuB2pvB8iPljWuCVcir2fPjyKN5FOG9W34rbPUgS6V5BnlfLunwlyl+pdGUdGPtNae+XxknHD5bRO+G7xxkX6IHG+jUbFhhsCsC8lAAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_193103_054948_07B974C4 
X-CRM114-Status: UNSURE (   9.73  )
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

The children of the switch node don't have a unit address, and therefore
should not need the #address-cells or #size-cells entries. Fix the example
schemas accordingly.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v4 -> v5
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


