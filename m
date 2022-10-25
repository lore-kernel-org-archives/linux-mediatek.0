Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4ACC04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 05:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fudBShBBk/xD0KNTerxpLoJEvQR4+BWbRR/rGO5UH/g=; b=u1iEr9K0E4uDAQMwhxMioOkiuS
	JXh6C1WY/1qCIGG+YjUSI1qnt/Vma7Qy6o2Mju4NztFm8YZ2PCpgbGlO80As1vQxsbYmu9MxNgFO3
	c8wcQtYsmo0mlIgIAPJyX//nM29+9hPszu03pMOxN4FEpF8OEj0MWPeKBKfkD1O4KR5oi6U+hItRo
	xFYgyKRfnJ+/0dUuyEG5gkIKS3wMMVbVPx9N0fDeI58Bbxv7LJA524DACnIsCbjtD/h+qBkxsCPGF
	jAkJaL8mjdfG5LsVbYca8lwWVgw0N9oLnYb7PMJHj9GGq/zv7nU9GKRQhotwMm/+3FRa+wYUQQNpP
	c1WRL5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onC9N-003rHQ-0E; Tue, 25 Oct 2022 05:06:53 +0000
Received: from mail-bn7nam10on2138.outbound.protection.outlook.com ([40.107.92.138] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onC70-003qK8-AZ; Tue, 25 Oct 2022 05:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhiJPGWCWa7BtLggjsdUDB+gOGK3y2gQVRmBld29mIQOFP/84uV+JMYTALU+hzHqhCAXE1J57Rj9Q4okVVncbfPsq1Ks4tp+MosE1rVFrcxug9tPpMLxd9b/1DDr/xzrPsGJNG5dNxUrhtgflSczuhcOUuPAYKvy4XXu8d+BAMZkrId7mm9ANkt9+i9+rmCSRuSoIC9z1/rM35O1z00Iw7nxuVfSMzB85Mpu8LzqC8On9fuI0+VU4GH9G6pHXyWn2TBVyx/TZDhEU2Gv+1YGKBgzGZTVH9GNXZ6blFUlIyYTfH+YLNu2AhavTBGuOr7/v/vNigsAejOfl+f4mjnO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fudBShBBk/xD0KNTerxpLoJEvQR4+BWbRR/rGO5UH/g=;
 b=T2FE5rnYb+oqQdpdKuNX0TfQHvwG5Rv51KTgM2g2lZBAJiKOEPec2wA1OvlMjFdTzgHj3q3bZtjd1TJeAETKLpUKd6BvdFLqnS/bXpkf5BMBBcuxbGW6MhuwSc+OIoxDm3uc/gBDOofpVYtAs3c8dHO+wfF3RI3cQYiUEFMxKLKyGpni7+6W7xpyxgUViM+qKNkdAyCKPqYmWH9fc6Mv5QjSBGlLbCs2tOXITLCSea0zkIcaB4pmEjMaIuaYsgICQz9IsRs6iQV2fTroz3PYzT9yJkJ0MRD3TFnD2DeX+FSOwE6Wji846ks3DKaqnQMFeQf8z1qPb5Yt8gWZ4H8hZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fudBShBBk/xD0KNTerxpLoJEvQR4+BWbRR/rGO5UH/g=;
 b=lMU9L2O0E7NJJjussuerUzthErRFzo3rEVoNBlKTOEPWdzzdy4cWJDtOCh037SXYt7ch4qnyYTzaiaaQgGhQJqHcUiGy3rwlW8COAYCKxZ1jeToQFFLiOnoQU0jZHJieqvm2Xmt59QlrvVAlnMOqo8W6JrZ37wFnpKwDK9E1rbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by DS7PR10MB4989.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 05:04:20 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::8eaf:edf0:dbd3:d492]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::8eaf:edf0:dbd3:d492%5]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 05:04:20 +0000
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
	Rob Herring <robh+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 net-next 7/7] dt-bindings: net: mscc,vsc7514-switch: utilize generic ethernet-switch.yaml
Date: Mon, 24 Oct 2022 22:03:55 -0700
Message-Id: <20221025050355.3979380-8-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025050355.3979380-1-colin.foster@in-advantage.com>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|DS7PR10MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: daab393b-7e06-42a9-ee82-08dab6465ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pPM/BZ3dsxkXEeP0mK+9cC1HL3QKxw2osbzkwwGvW4GN609wP++e5o3yZmDE/263aNqn4kzmOzuLPiqsr85oP0BTPllDbQq8bcCLyt0F1dDGZ936yhPrvlmuk9Bx3JGmlz9PbWqAgUp6ILWLw2g3m4l/40JeIIVZ4M2AUihJ/MCkdKBuaJ9RLJFFcQyPH2PHjB/pnDnUgFfRwn6WAucUu+5Ykgi7JE7OEDPx5wwBkIgV0JBwviBARP+FX4aQ43MvnwzCJDJu+2m86VSVtIG1cvbpAlh3z0TLlz8dNbgjVVYkCbiM0aUx1oQ9pMrzppWVcs6BDOVBSdmEiRdZVfvVacK2vosF+Ea2xGFxq8YX473DDeJ15iBu+FU0OKLbahjzEvd/Q25xTu1GMRyjfU0tgcPgr14WZcEZX9kEhsVLcK+WVygjnW6C5savzjSbjeGQ59oCJtHt2fi7VwVFQl1JcqgIIrb2jchmcmNR0Z5TvkhJFTA5zuumrXEhRFeEROV1pKhMePe3G9/fVPJ2QPFAJwKlFn8C6AJAG6TPJJL/uBC/kcitxpELBxgXBorrpY4/xWpiJkoR2xGG5Jdq0BrAvGUj1io0BNxN7ZHXRrS48vuEVSftMHhnMUn3THvxoJLwnqBmo5zh2XdlTRnwBiYN6gl2eHy/0cZmlAODQ20Cn8aVt/GpOV7lLnAZIISWLvNzVjVdBiFjDkaY2UcEmSew2wdKr3CMT2jdLdCVsN0RBVc9qrLfPFoCZQy9MXF/FFzNjRPFsCfy6CkADxf1/0AMEVsXXEf68QYR2/QoBPjWLZ8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(316002)(52116002)(66476007)(6512007)(26005)(54906003)(44832011)(36756003)(7416002)(66556008)(4326008)(41300700001)(8676002)(66946007)(86362001)(8936002)(5660300002)(2906002)(6666004)(478600001)(6486002)(83380400001)(6506007)(1076003)(38100700002)(186003)(38350700002)(2616005)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WwMDwQQHFBqkAalY5dg3+elGEauzzZ0z6L9/F9K0CB7NemFlhqPWJ6udd9rr?=
 =?us-ascii?Q?nFcUJCM+dTQmsQKjBIiZl4dQqMTFJHruFWhTL+S6BoQatOZhcbpwD3rTmwW+?=
 =?us-ascii?Q?QM8BlK0VsM6zGlqMZ5sz0V75ZYQ3//WC4FizoPxbjPMeeqMA583/wtgiWyho?=
 =?us-ascii?Q?PdDets72Uz2u+k8pVbxhbUHMHl893fQ6hTjXJ8DWiMe+xFqwm5KGTXAEew7B?=
 =?us-ascii?Q?2TzE6peQQ5+fBiBdDhqtoHVjMqU9tQQsREOAXr4+Enym/svUrcR1DtD8AL5b?=
 =?us-ascii?Q?O7IfbubN7ALPj/JZFw9RHYBp7GAabrRR72bL06V21ED1BhcIlbPPRettGXjo?=
 =?us-ascii?Q?BF3kGyaUywEjJyBBUOimSBtBLRkfCBuG7xlKBfOpAhNVe/emii0j6lSJQxQN?=
 =?us-ascii?Q?3/kl/D6yw+BUWLTx+pRnoi58YJTby3ij3c+dQ6ifFVillH6vAfXHYVjavnPX?=
 =?us-ascii?Q?xHV64VDN5j4UYZxdeqmW5b14mN8au0Lud0H7YPhdM6rR3b+UMJpG5B7ytNgc?=
 =?us-ascii?Q?Mz0K+rxsVoOU5h/Ym9GfRR5ILvPw9gmnrl7gb/9V7CA6h9E2GFDex5Y74elf?=
 =?us-ascii?Q?9TGz3OPZ8TXe5jUKdPJsIOKJPKpVk5ZaUFjnYLjOifJc0JMmh0V1xJ9XTggu?=
 =?us-ascii?Q?8Fy7MApQmc8pqtrmzPaKerAy3sh1KbIjy7km1bgdEkX7KU/LoaNBESHzFXqX?=
 =?us-ascii?Q?jPKJ2HOI5ILcCHwHSzY7ZYCfP9D7SjXLzMypIzR9ENyq6en5Z1B5ZlWqeSp1?=
 =?us-ascii?Q?vnn+d+uX4876ruCaLxH5A78BkJR6g8k6c9HWX+9Mhk1CtTzQQOOa2yKZrQsc?=
 =?us-ascii?Q?1wWFbbXiMXuhXnAAFEL8uxpBSqjIdVtukzSQdNEmdp+JR2nmB03jyeERX18o?=
 =?us-ascii?Q?8Q0kUb5Xsgahle+e7hv+eQPRJo0a7l2wANZsm2i4omnl8HI9MKV0oR/ENZNV?=
 =?us-ascii?Q?AsYLgVeqfdjze/UOBZlKMBYAtro/uRfBXU5lqSE89n+K1u3j1tJRsf6DV4Ll?=
 =?us-ascii?Q?bpy3LiUvPizH87AjyBxtuGnrsmgVpTnbENbMMkgBcg3wmXT/kdk2nMLs5bVM?=
 =?us-ascii?Q?XOKK7TD1NizHM4WhOKnUVckrx7/I/27v2DwN3s3lj0+Yn878+Ob2PqBFtmn6?=
 =?us-ascii?Q?g8oV3Xp1AsGc7bfRpMUuGxU94z+T+jgRBZQke+lJkhWGOivTtVh2+ygM341t?=
 =?us-ascii?Q?7hADcxenYjCCcZvkfxcp6pCIIRWtpJnVJk8e4sM3y2XTqRve23yja922BELU?=
 =?us-ascii?Q?c4/rpK6SlWjCkXj9+91fUynzmvg81ZzjS7htf4fMQmq/f7y3yLune1zX5jlK?=
 =?us-ascii?Q?p9/2WN1u2KUtw1HX3I5QdMFqs1/47Z8cMECu1h/2tFRsgGKmgn9QJZbtqo5A?=
 =?us-ascii?Q?cWKK5onDXYjCeaBJfGejVfsVW3hv78zLvDpa8TpxTAWat+c31R9PprTBc5kd?=
 =?us-ascii?Q?1mrQRZjmJODB8XZExzonDpRVSYLytYhd3XyOszQj1YFmDi8bT59OdyqaOiGZ?=
 =?us-ascii?Q?kG/PFFbL0slH3xuuRWlOy5NYf2e01ZDESrZWOwnu7vwHhPk5g+TZ2glndmqA?=
 =?us-ascii?Q?11PwEw8Ef1oAG3NOqCzRjQa0GiKe/8BErGYkFs6MEZC0gUzzU/xkfiBhU4LT?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daab393b-7e06-42a9-ee82-08dab6465ff1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 05:04:20.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5o/c1a5lfNJetzDBObcKJ43SfdUHFSBUvmO+POQ9bHbhth3b7MqHFSCAQaHQR37RZtzTEFHeN5HapZ3zwktx10cPCPu9R1yAKWokXDgDgXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_220426_442024_C0990D5D 
X-CRM114-Status: UNSURE (   8.98  )
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
 .../bindings/net/mscc,vsc7514-switch.yaml     | 36 +------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index ee0a504bdb24..1703bd46c3ca 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -19,11 +19,8 @@ description: |
   packet extraction/injection.
 
 properties:
-  $nodename:
-    pattern: "^switch@[0-9a-f]+$"
-
   compatible:
-    const: mscc,vsc7514-switch
+    $ref: ethernet-switch.yaml#
 
   reg:
     items:
@@ -88,47 +85,16 @@ properties:
       - const: fdma
 
   ethernet-ports:
-    type: object
-
-    properties:
-      '#address-cells':
-        const: 1
-      '#size-cells':
-        const: 0
 
     additionalProperties: false
 
     patternProperties:
       "^port@[0-9a-f]+$":
-        type: object
-        description: Ethernet ports handled by the switch
 
         $ref: ethernet-controller.yaml#
 
         unevaluatedProperties: false
 
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
-
 required:
   - compatible
   - reg
-- 
2.25.1


