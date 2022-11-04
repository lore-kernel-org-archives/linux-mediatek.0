Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 04:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YficV6/27d5Ko/XmkrRhmfOs6plp6V0bvdu4M23diZ8=; b=JlFbM57YoPAVUzNCjQ6pnnvW6A
	zkgaXwUalhCnEMRohV3niKrHL/K4wFFfRjUhv/11k/1YVijLreyL53hb4LJ97qMUKh41qIsBAcyNt
	XXgh/9qYqzNs5CpOPsm9e3EXOAFOMZh+/BJPZYY14YcssvsymvvmGoKWN1eoDu60SBtJZXN/zVJY+
	T1OjZAuxPhXIwi8LsVGtvh8c6jbwrrLFCWghR8cwi/veHsRGlsfe2acryOmbR7U+/sFhUPbj7r7T4
	rlMUXrjNL6doLrZD/H+SUL7RzbtL80XoZjJhi7cL4ZM8koBIPFfwT3k37NmR/LG0wXtyLErW6OEy0
	XzrWjbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqoin-002N2C-Hi; Fri, 04 Nov 2022 04:54:25 +0000
Received: from mail-dm6nam11on2106.outbound.protection.outlook.com ([40.107.223.106] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqoh1-002MBx-Ek; Fri, 04 Nov 2022 04:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfzDJTF9mQVQ+D7XFdZl2Zct0VIQlvubQ4mnYwFfDxv4HLvfrnCvGJD5mnpXogmJggRcle0E/gHvm9MnrnHxHmu3LVTTMDay9i4D7OlOqc5PpwEXRXAgKKQy+f2ZUBVPydzqP1rxaFuJEDG/DrwnHduRsyO9yYpqnQeZEMz1d3g9hMmxzYhxTVnDmwcmk5Vn8HtfXxiVSUfYfjlAhkUZ7iygNGG2ghZJTEximmTMeZIdv9RvMirDPinHX68kcpqVd1dpp2LGF/H1WJQpsn6qEXt7WrJdStzWQxDb30hkTdMA0XaUl/iYI/+1Q7MoFPz4WZcMugz4NBrKtAI5G60w3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YficV6/27d5Ko/XmkrRhmfOs6plp6V0bvdu4M23diZ8=;
 b=WrVbnDqjLYsp9pcpAQv/RoYYTfJQAVSxrmgmBvOncewrdelxMhponuWPy4rxOzsJ2lQ1OnRng90fMzRjSv4NxnSWhk2XDEOqfMjidBmwZVtNhviQpbxYLpODmkmAvrpp8vJM7hfNDtCm9Y4+iuJ0OAHD/OgxgcyS8BNADLaia6WR/2LBrDfWHLl46pYALx+Okgejui2iKYsH6z1idwM7u/c3NzQUdVLGtpUhSfagMJ9URajSdVLOngE/ByvRpldtNOVP9LvJl0TwWiRrNnMBREv3gkQvRzDS9JD9VN76n/guM9nK6EsdNKwBN9XvARr2JXy7FaWeJqw1Dc9Qom8+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YficV6/27d5Ko/XmkrRhmfOs6plp6V0bvdu4M23diZ8=;
 b=HDJvP7y18AoUrnj9RIkV+M99vm4hlTLBO7aORUHFigm/dXEsmuDU91FLRfQavd4dWo/1qPN2ZjOodAp1wmYTPInr7E5209pyyhIx5GtBCZ3O89loWr5AJm1Oi+wyRSLlAQtOqSg7oMIFglIn+DynNpyflKSXbvxJEjsOnfwfKaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CY5PR10MB5986.namprd10.prod.outlook.com
 (2603:10b6:930:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.22; Fri, 4 Nov
 2022 04:52:26 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36%4]) with mapi id 15.20.5769.021; Fri, 4 Nov 2022
 04:52:25 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?UTF-8?q?n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 net-next 6/6] dt-bindings: net: mscc,vsc7514-switch: utilize generic ethernet-switch.yaml
Date: Thu,  3 Nov 2022 21:52:04 -0700
Message-Id: <20221104045204.746124-7-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104045204.746124-1-colin.foster@in-advantage.com>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|CY5PR10MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b34eb9f-ca8d-42a6-3229-08dabe205e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	whJjC17Ox+ik38k32m4wwHBJyVnZNchI2Th9HiF7//QOOKsfnDeOWc2cEeIUtGSEjTX+ShibvFnFHHQ3kvOU2NST+NFhxqFZMrsnzrE5obalDZi/Ldbtj9nFcN/RMbc1VkbSOlp8hvvZAT8Dj4jaL57rQzPwOIZYhiY+O8eSHzKpOSc82JjA0JQ/xUP8em3Tq+Tbl2/zA5GfG3nBE9hipq775ZrkkeA8wV0xAmgQ8jIGFnKnGxOvqRRMKf/V2r8LCS3qMNE0Sob9taxLvWCBdj6AlKbgGNvnXvX//8aShC0+s9CzXr2nt82yUytWsF+4cS2jXFQ9GNJ7rDo33N4s3rHYlCQcQaGhDr8XCfY8sf3lXgLE5teAdGOsxh44Qzvvyxr9suNIgz9qYULZ/JCvQum19ABhAwKbDlVrbEb5qoAQF1nYtawueP2QGu7SF9MwP5zro+dTivHsnm/v1xDwXM6rw0WbPbzjiLRArk/Xi5JTY8lKHt+gZqT3XW5GG5vNk2qmTLWjYCCU5SxOh4rm5QZr6u5HZBtqk8VMIGwgW3Ijl604tRQ58YWmnzYcg07FB8+Thkw9EjNdLImepG7p/79QzCoE1gnBlz84zzPTPvRoNpuZzqPw3Csge2ebM6IIX2YWXoY5/N2/btuPJiP4mu4CXcmK0UEMtEIg6MJ+CoIBe8IjFoiqDWD9N4VqkWcWpMUxoruRlAtx21/BMTSV7SR81IA1Kal+qz9SWfQkTyozn3q822RQIEa/Q55oRSGnCH8eQRNh19yw/D9crfUwqN80NfAKoJY4JGvnav1bVMk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(136003)(39840400004)(366004)(451199015)(86362001)(36756003)(316002)(38350700002)(38100700002)(6666004)(8676002)(2616005)(6506007)(66946007)(478600001)(54906003)(52116002)(66476007)(44832011)(6486002)(2906002)(5660300002)(7416002)(186003)(8936002)(4326008)(6512007)(83380400001)(1076003)(66556008)(26005)(41300700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?T1p9KNxSGFjOkCKYz0LnIiO9oORwPtytYSGNFDjRQUFc3/Fz2X0apV0GYKiJ?=
 =?us-ascii?Q?ViqQvembxLwsW1t73kipYPrk6PjR3MTKD/fDksDT21ilSDwhj2YGOAVVDq3J?=
 =?us-ascii?Q?7QaFONG9RDn8hn4t7nKkMQV+6++YXeL6w8sAzcrhraXRDAxguLpYInHQTE0t?=
 =?us-ascii?Q?Kme+d4NcvwWwnKQc3ripFO9L2Nh+A3r+kQ2lb9pTqQ9WpAw5DzSVflAmXNmu?=
 =?us-ascii?Q?k46/qN1WsA9aK21H1BiEP0nTQcZWzkBnnk5Bo60Pqes7fNPiDIBkru4fUFcm?=
 =?us-ascii?Q?Q6ewDK5HeO/Y/ioBhc2hoqTeopQRu7P2bwkqAxIpP3RezSURjSKzt/ImB/n1?=
 =?us-ascii?Q?zKesYpHoZCl2wJozXpeisX1VMirRN4eN6igf49J8ueG65HtHZYA8rnWFzfjc?=
 =?us-ascii?Q?waXZhLRlrPz30AeIOrzx6dhI81qZaZl3Xx4LofnBiQJVQvA6qTnKdsZLZo1q?=
 =?us-ascii?Q?dCz3BD02xop5kIut6tOUcpiinRUSctKWIuUtAdSR6YH2DVfTFnVaorC8PNeT?=
 =?us-ascii?Q?PXgID2A37MHoPVGy0rTNwuQJrKXpPPl4lFxuRW4NupTHje7tUysuYF+pcXK4?=
 =?us-ascii?Q?sWu5xbiI/n2Hw9BuTxqUwtDZjlkyPtzyjmOEK/m80nZmU6O+56C7lyD5Rna4?=
 =?us-ascii?Q?sJFYaeGfXTPTf83vu2IQ9SIxe1ykCnyJacxU0nqA/MdJ/trbRpyHhykBAya6?=
 =?us-ascii?Q?2xe1Ce/ieyLo23f/rdG6PP84cQC92vrG3BgYPI9zAwmFZ9FbCUjRDXxfnG/Z?=
 =?us-ascii?Q?GhW9zAEmnFXAUBwcfUYme26U/cIgNhSHLmP5cr3wetIoXS1F3g5s1j0flTaD?=
 =?us-ascii?Q?oSGL2EayH+C81r2O/WQY5iXERtday/yx+tvhdMrLRZjxXhaIiHbeqJx9S5s3?=
 =?us-ascii?Q?8oMkT+Tc/J5OiwrOUKbFwidw7tN6mmmhjiFHF0fHaFY1gYlT7tHKUOu1yGpE?=
 =?us-ascii?Q?WVW1e73oqm4XulybBT0n7pWnnWhsR9KBIhJ2nyEu99fkYQ3mFKAZ/1nvsufx?=
 =?us-ascii?Q?nyGit6laWv/4oiG1wM8mU2odtgPAqMhb5YduTu03oR3HOWJZ/LGrUyMsW763?=
 =?us-ascii?Q?PrxNhUrdzjc/P/v+7pU/3TP29LIKzbO579wj+FVDgsIVTwjg9owhxmeGxgXm?=
 =?us-ascii?Q?aBqW1PBYumstR2wkzqFSrRD4zyMz5vx2r29tlMGLnNWdapJG0ZTX7nnH8oQF?=
 =?us-ascii?Q?a6fpkrH3wHNzsejTUCcYdOItQhQmRJTr9KCVEcQbs352gs+ElP6n/HF76aGu?=
 =?us-ascii?Q?4bgXysUwYXqphx68Dp0aN1/2ow3HxsRo/+qN2g3Y03z+EiUUZh4C3z40jG0A?=
 =?us-ascii?Q?UgUvB1icDPh3mzTjtR9bszFGHub8qtoD2aMnSjI0YeC0ZhHVmiFX3qHq5KIH?=
 =?us-ascii?Q?y3SA4zCKe37cC5s6UbrPH1LV9bZSON68CQLm1U/U1QnK23D3a59H/xLSZ7HX?=
 =?us-ascii?Q?jYefxQ0VaoNa2ECoLpy3diY89RdFReBK1ln2eRgST+HiSkgWPdc9vmRgGWui?=
 =?us-ascii?Q?c50O9sVgxG1xLpWMhOLMgMwPK2R8SmfdjnTBFXcZFGMCumpa3dP/dlHM7Qhr?=
 =?us-ascii?Q?JZmHLdqoTR2T7S9c7NLc82nTmsP0dadDmIOZyVHaZFmyfXBelM+PovKn67hu?=
 =?us-ascii?Q?qa5hL2a9tx1TWR2vSPN/SlY=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b34eb9f-ca8d-42a6-3229-08dabe205e38
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 04:52:25.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftm0SBB74TuBDYj+GgMYGfclBFvPOvdgE3CUC4eSfSKS/b1vykfBPGtQi0cqXAmN9DNAS9seXhXQcz3ncFLXP0P3B7kE8fiq0hzckMUs9vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_215235_525442_0E303A5A 
X-CRM114-Status: UNSURE (   9.67  )
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

Several bindings for ethernet switches are available for non-dsa switches
by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
the common bindings for the VSC7514.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Suggested-by: Vladimir Oltean <olteanv@gmail.com>
---

v1 -> v2:
  * Fix "$ref: ethernet-switch.yaml" placement. Oops.
  * Add "unevaluatedProperties: true" to ethernet-ports layer so it
    can correctly read into ethernet-switch.yaml
  * Add "unevaluatedProperties: true" to ethernet-port layer so it can
    correctly read into ethernet-controller.yaml

---
 .../bindings/net/mscc,vsc7514-switch.yaml     | 40 ++-----------------
 1 file changed, 4 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index ee0a504bdb24..3f3f9fd548cf 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -18,10 +18,9 @@ description: |
   packets using CPU. Additionally, PTP is supported as well as FDMA for faster
   packet extraction/injection.
 
-properties:
-  $nodename:
-    pattern: "^switch@[0-9a-f]+$"
+$ref: ethernet-switch.yaml#
 
+properties:
   compatible:
     const: mscc,vsc7514-switch
 
@@ -88,46 +87,15 @@ properties:
       - const: fdma
 
   ethernet-ports:
-    type: object
-
-    properties:
-      '#address-cells':
-        const: 1
-      '#size-cells':
-        const: 0
 
-    additionalProperties: false
+    unevaluatedProperties: true
 
     patternProperties:
       "^port@[0-9a-f]+$":
-        type: object
-        description: Ethernet ports handled by the switch
 
         $ref: ethernet-controller.yaml#
 
-        unevaluatedProperties: false
-
-        properties:
-          reg:
-            description: Switch port number
-
-          phy-handle: true
-
-          phy-mode: true
-
-          fixed-link: true
-
-          mac-address: true
-
-        required:
-          - reg
-          - phy-mode
-
-        oneOf:
-          - required:
-              - phy-handle
-          - required:
-              - fixed-link
+        unevaluatedProperties: true
 
 required:
   - compatible
-- 
2.25.1


