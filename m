Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1744DC79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 04:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39IVWoW8poll1iX7g8Emdh39hH9DGH5Jf7lggLo0mYA=; b=0mX6P7Xsv4KGWTHRZgh7MoCxtP
	8/i2Uw/CLATWwf+GTyJ8KRj4Gf0EM1pve72jnxeoCV6WLkX8W6cSXFO4Hx36nF8n2vdMr7HzMjsLD
	GfjseXxxtrFgTKoqKgfvsc82VKsPGjLNrRKZ7ZUwvIR2s2kR13mMIq/1net5DUC9Lqo2Sg16CNy6L
	/e2lPNADAgcn2CyFAz+y4NlLgtqiZAFYQP/RXmb6oFhVEBV3A2oHBdWqHIX4C95TqS87HPAPKR31H
	GtjQ8ocb0OrTQ7RjzQ8XKnm7DhMRtCzgUlAzVtNLDiBOF76ZxBySM5f6rYN5q2R0Gck3xYfVzAnoX
	gwLfxDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Liq-000000010Km-1DFN;
	Fri, 04 Sep 2026 04:40:16 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Lin-000000010Jv-1qkR;
	Fri, 04 Sep 2026 04:40:14 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842sd6o2738017;
	Thu, 3 Sep 2026 23:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=39IVWoW8poll1iX7g8Emdh39hH9DGH5Jf7lggLo0m
	YA=; b=Q5djlp8Mnqfo7iqIWHu9Igfg41+Hrgc4G1pYW55zN+KygNNqru2XwlOML
	cnGggQ+Ze0GBVl51MZCQ+4/HrrghXAV1Q1SpAy+EOg8PCfwsY/PNVFBGPEyNRWvs
	su94pcsh4l0EFCgIrmolK6ud7dSGAIdLTStJVFg7nZ4LM6+zUJUw4113oAuGyhsN
	1R3GtMjC/ruhMo4Kc6/CzzsnK2+7CaD3clZfLKtUxBLnT2QD3SE7rEKmZGCAqqAA
	D8trE0hq7oK5QZVYNL+pK73uLD41wlSfstq9oPKfAZE/MlVOyA9putl1pbHgfi27
	EsSAvVbxzXUf/HIFGgneGnB6/m4rw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfdfq3n89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 23:39:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1N6ZM+c9TdwmeVMW7MCZhr1lUlKWJvzTSmTMl01JH+z4oRJCHsUJ3AxojqeUTlq7l7veVTFuNkLYCRK+adyU6Fjl37CB3IiWWu/SVjgk61kHIe1GknUJEp2Tce3cnAI59iKe8w6O+A7ojTSbRU5mSZwFj6hhJolWijbQzsQ3u+YZTqJ9mzX6SLh190gi7/XRZIxPSGbi+O55TrCQ+j4nR7SkZ8d+MURmrPM3LLrvbSvmgRUbXNmJTCeE+2z2UO8bu2zBlVZv4uETx/a5hDiMpBuywal10OICACRTBK6fSYj4uy8HcEVQBHqWWHKyoZ0wqN+Fn+XeBaiucbmMqkEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39IVWoW8poll1iX7g8Emdh39hH9DGH5Jf7lggLo0mYA=;
 b=FNKQ9deqZ8f+NAgu2bDvuLDcsxfBl4tHp8qByKMIndhgt03qcSPEW7ChydSjKZhvwY5ApzNsVRO0ehGLcPbneMvWYytJpaTb9xDvajsnrrFT54POhAdqhC5zkLEhQD7dIyjaAroz+WsOALh6oUFO7FN2zWtfJRZrM62uLqMT6n3eGMd93a4mGCUkI1wS5OXM2hcz31b7nB4mJ2WFOVQQUp0JFVBoHxIABiuGLCh8HE2LC46whPXL2cGQpXcMY3XuBDHVt2AiJ1E7wqSan8f1Girfn2R+dLnVeldC72xBjWMTRSxHlbOaD3H/HHwqZqhMrUr2aAjPUGToMlQfEjADDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39IVWoW8poll1iX7g8Emdh39hH9DGH5Jf7lggLo0mYA=;
 b=WebxJJa24NNpJT8FVSKpUfZ/EHeP5fi2fBiopPA6nFyG/7jGEeHOcdOf9FnT1VlUZYGUd+oVUbgwu/Ib05NZ7+s9ljko54Lx9/cYQqubV3Fd7MLuGHZ0jhFxgeXmOrZ25bTp5+E+NA9ad4fqpIWyVMtVU1FGr2GQL8mL0/Hw8yc=
Received: from SJ0PR03CA0390.namprd03.prod.outlook.com (2603:10b6:a03:3a1::35)
 by MW6PR10MB7687.namprd10.prod.outlook.com (2603:10b6:303:244::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 04:39:21 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::9c) by SJ0PR03CA0390.outlook.office365.com
 (2603:10b6:a03:3a1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 04:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 04:39:18 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 23:38:35 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 23:38:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 23:38:35 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6844Xh1Z3831572;
	Thu, 3 Sep 2026 23:38:21 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
        <mailhol@kernel.org>, <msp@baylibre.com>,
        <florian.fainelli@broadcom.com>, <jonas.gorski@gmail.com>,
        <andrew@lunn.ch>, <olteanv@gmail.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <kurt@linutronix.de>, <hauke@hauke-m.de>, <chester.a.unal@arinc9.com>,
        <daniel@makrotopia.org>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <ansuelsmth@gmail.com>,
        <linusw@kernel.org>, <luizluca@gmail.com>, <alvin.sipraga@analog.com>,
        <clement.leger@bootlin.com>, <justin.chen@broadcom.com>,
        <dlan@kernel.org>, <rogerq@kernel.org>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <opendmb@gmail.com>,
        <andrei.botila@oss.nxp.com>, <wangruikang@iscas.ac.cn>,
        <amadeus@jmu.edu.cn>, <kees@kernel.org>, <tmshlvck@gmail.com>,
        <c-vankar@ti.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
        <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
        <v-singh1@ti.com>, <oss@vassilevski.com>, <haokexin@gmail.com>,
        <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
        <lgs201920130244@gmail.com>
CC: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <spacemit@lists.linux.dev>, <linux-omap@vger.kernel.org>,
        <s-vadapalli@ti.com>
Subject: [PATCH net-next 19/33] net: dsa: qca8k: Remove comma after sentinel-entry in match-table
Date: Fri, 4 Sep 2026 10:06:25 +0530
Message-ID: <20260904043724.2955444-20-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260904043724.2955444-1-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|MW6PR10MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c556f4f-dd58-4cbf-ae34-08df0a3e7b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|921020|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: E5cc8uDDbJsebjBl5fPN35zhfaFj1XEL6P3Evs3qyv6QPb5daXGUJUpBnwNjlwGu6yWzBqOvFlReSmAPEnaHVZrfFmlLoHWmiZoHdink0LHcMaqsXW5jJYROZDDe0W934gQ/ivjtBESH4tkuMkUsDKlcd4zfWJYilP8S2IdK5ghHWtNPSw55heMkbs5JPhxPjy7l7XPGgQPzy38ZjlsQQqv2m8WHXDD73RkKAI5E/MNg+Ww4guoqdx5i7uiol53gzsKoLW59EhGjAJiUyQEvfC4UGzfkhIfegC0DMMkVNAsy/QS3r5T6srL8KpQHGhqTfpk+Vdkuhcn6hCTAh5wxwTbjwO8JAIBoMHXUh0r/6OYs4BS+IDS/DiKe4uvnj0dEyVlIcyrW0L860VaYrF50DnG6274De9q6wr2JihQOxt59wqsoYeZlx70qghhRsjAWf90wXQJLh85URIFDcwiHqc1HL0wJ8p0urz6bHkpK/6zPkHrW+p9mV7MZDAEFbxpdbI27a/vg1d4x601QPFyEcCV5rFp5AJMYfsKElD7xjhrflBNqxC6xFIJwTKyJpqwRKe19a6aKFKbq0he2kMkb455LjBFzk9Sk+FeUJCgwBuZjRWR21YNsCNVS/5TYk0vpIJkdfcvT7s2SAU0Rwo3fnaUsbCRnGOgpCE4kCEskVM/gp8JaTC4WDT84g+s394lYcLBZpoMWupdsqvyh9t8c1CATgQFAwAq2Itp6i/IzK8KjLyUANu6lqUXnhpa0fDnk
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(921020)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V8V+usb6XEM5AH46szCdEYujn2dN4wfniINIw4rpA7AqguMoDfTkFioXyAeLnzK5AYtnpSpLizXAkYXWrnoejAcDJgL9qdp1E8hDms9b/9d09iwfVj/O0FppIakXld6nbvxkMe4yHsJZCBVSw0TOo1m42XmM5sv6+YEJ6Lzp7nOVLHzXIVs3/LIoDd1qWBVEQM0+SxBuGF02nw4W9ubU3HyzFi0j4CV7fk2AtLA29L+pehOrCiHtMgsRqykEQKJGKtcHyfJ5Wce4OtpSCsanI5OLwAco2znDte6Fk0ioemr+PC94How38h6gHBY1oyKTJTeAuvF3uj/zzEDsd9tCgE3mTtkDC2V2OWNOhEd0bE7mVDGA0NFTuwPGc8XNQvqa1Ixat7ti+hYoOrJha8zUsXn8yiiUWKRYenel2CQ/7qRDmwWVo6kuKCN2VlAU0XT8
X-Exchange-RoutingPolicyChecked: iEANCRefKH9Bboxmamd705qct1AbbT19/w0zJ/6wJ050QV8FkamzxD1Z7zXGDbRn/jaMQoF9GHbOPE7KouvpNrknic/+Xo4sunBWjgJbmHJSa8w/J2TkqZqYEucZl1U3tEe/gmw25Gdar9UG6mistjaUh3qqh9xmCwSLjFO2HMyayGD1SF0nLiS1oK8SiL48S3r8/d6ivb3UyKz9yQlJUj5XQvLGZmWj0X8TvkYfbk21sb+VvBX/bE024u0DO19ZeNEndTQT1rd3GMsCCivQAjrS0QIeqHLKYjwmsTS4wFrKh7xEiemo+C+L7nYBKjo3+P70piw42ud/W3U4/JGuOQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:39:18.5792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c556f4f-dd58-4cbf-ae34-08df0a3e7b89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7687
X-Proofpoint-GUID: BsarlVcxkXX3f_wl0AhRhtTSLdAj51x5
X-Authority-Analysis: v=2.4 cv=K8YS2SWI c=1 sm=1 tr=0 ts=6a9a4b7c cx=c_pps
 a=SWHM+P2JNiUeaYpOZLdr7w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=YpTJUd8zm14dbW4r80wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA0MSBTYWx0ZWRfXzgaUp9rj8QrW
 1S1+iayMvdvbNbv+105VfNB2qJO62fVZ27w5Qk8koj4JgmuC/swpWa5WxeHfpMMqiWrYavfXscH
 yd0zZY+aU2cG5Ew5NVy0W4ttWyMol+ZSXA6l/5GESEaFYhecWcZPFThkexP+m1EmY2H6aSxRgTT
 +dF7THEV1ez1tmOEvv7+cBIdFNHfH0L4cXTruWqTIgcPOyUCvMuwBICAtiQ1iNFB70bej6GfvsC
 0PdiDtZ2Blabm89PzhHgzRa3JBGFgEZiym0lC5gQEGGvC+kMA+hNdBOeWt6ItichSRqSVjhyiWT
 IHOc0fhHjs9wAdd7ZFAcVKEnwaFONFUhEn1eP+ElqvI1qyUJBRSUpGDC6Mv0LigSBd6ozFwV0Mz
 kyJu0Merl+NIgCRnVsj609eKR9B+2+gX3ig60PuX7gIWrd06Hsbi4pUZSxRKLHW0Cx/enUHd8Do
 qQ6rj8e/VbeMsjWk9rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA0MSBTYWx0ZWRfX/rhYLo1imydQ
 4jcDiH2a3Rxvnug8LtuByMMiV83AZnZiN8YSUHD1PZgfsoWWFlDouRpVe1sB7D3xWpNjrYj/fQO
 vSdCHunOitHBd8JPYT997MR/my35CaQ=
X-Proofpoint-ORIG-GUID: BsarlVcxkXX3f_wl0AhRhtTSLdAj51x5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214013_590702_EC2F604D 
X-CRM114-Status: GOOD (  13.38  )
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

Since sentinel is the last entry and we do not expect further entries
following it, remove the comma.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4c928983b862..60f2a615a5cc 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -2215,7 +2215,7 @@ static const struct of_device_id qca8k_of_match[] = {
 	{ .compatible = "qca,qca8328", .data = &qca8328 },
 	{ .compatible = "qca,qca8334", .data = &qca833x },
 	{ .compatible = "qca,qca8337", .data = &qca833x },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static struct mdio_driver qca8kmdio_driver = {
-- 
2.51.1


