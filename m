Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5752AC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 13:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36F42071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 13:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7Ba8CfJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="1mlsCuWQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="1mlsCuWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36F42071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7MdwgWonS+IH70MWWtTjQmDVdJB6RgHy+NDwFmp0yXI=; b=c7Ba8CfJP3Micx
	WSgqGUKjvenHW0fUSLX2FOKmxerpd/qE7gUQDRgNxeqD677FlLAZQ3EZ1NXvBeD0DJYDXoraNvrPQ
	vDbY6rztqDYeisoaDKthJW8Lnmq7oxiAHmS7Y1tWgDGKQcFWUTpKX7L6s2476kIHGvC37/ywN7y87
	KcEKpRQeIVCZ36B0ghKOFVh/10ZWq6hU11vEGTdASb2bM+/HDGfV+bkK0FWDsrrp52py0inSBmjHN
	dIbrVlS9OGWZQPYEdYhNplmj4+FHC60aMgG5Mn9ki8oSgmM29PYBIWnlX2fnKa0jR2BAqz6PQn3jT
	65zCI7gMXthv/z96ls1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZanT-0000tW-Fm; Tue, 26 Nov 2019 13:22:27 +0000
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZak9-0007f4-2V; Tue, 26 Nov 2019 13:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=1mlsCuWQf1ybGN5lEd73ShumXV5+7DlrUdzp38+AT7aCTuLW+l6SXhO2fiDipRtvLnpNa5zOD9Ht0f7WhJ0m6J6UgF/cOGKkjLMrdl6F0k56O4MKZRZwe6NNxbFpD9zEfdNMdY/p46NgbJF3pnesqSeqMZ8N8hQvDGyE2v3VP3Y=
Received: from HE1PR0802CA0012.eurprd08.prod.outlook.com (2603:10a6:3:bd::22)
 by VI1PR08MB3184.eurprd08.prod.outlook.com (2603:10a6:803:41::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:18:54 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by HE1PR0802CA0012.outlook.office365.com
 (2603:10a6:3:bd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:18:54 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.infradead.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.infradead.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:18:54 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:18:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88abe4fe9b598599
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9431D19B-8F27-4295-8303-9987175DBD7C.1; 
 Tue, 26 Nov 2019 13:16:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 687810ec6074.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loCJsxgdhnaI3BvvBmF5rP9JRxXUkv8zV8eIVQckGUE0+yRjCGLb9vg8ltcJAKLegeM6VlgcnEKDq89y50MZd5xB8i8sO498oGGSQN1UOh/uFqMehav+e2LNQD/RRK5XySY0wupx5QIIEQ/7EkYG6FAydMYOZJyPsSN1xXfuEzZM9ivlPlyw/4Oh6bTWpqk0WaPApI45oypzfdyueJpbGQI8jITAWN54EzYUL/m0xUEfxAhyasEP3LXNvjiWS0lTIm6KQhngtlJNVPegGSuLkEXlPiaIWjWq3BtCu6Jly1UeAZ2H5fKTPpO9Ep4/QKSPoXPMZeXTEsucF+Dij17nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=Dq9ed+9GO0dRnZKyAwB7BKNGhK42nlh+HJg65PpFoUjSOFsEvrlhoGKkoGtKJcbWodgRSnMtV98//lx0Dzib0ZHk/RSsWZed9Lx2NReA2QScr3+KwGa/9zLEwM3rsrDpW8fWKoywKLxBSI8sXFcWRtqmtPe49xcyhYz75KCsRpkX1ahJ+LXxab1OpjP379ffAqLPkn7Ik3RDezv6GvXDyE+6aGeMxB4Whr5mcT5SHzHtMJtTfbVgbB9roc4QaKMOJrqCCCq2e/s50DfVTvouXnx9OJN5Ghxl/MGdD+i+3Y8f32qOqv/qyENd7m4/nJ+OZLGEuowPYVccSkKPjD8riA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=1mlsCuWQf1ybGN5lEd73ShumXV5+7DlrUdzp38+AT7aCTuLW+l6SXhO2fiDipRtvLnpNa5zOD9Ht0f7WhJ0m6J6UgF/cOGKkjLMrdl6F0k56O4MKZRZwe6NNxbFpD9zEfdNMdY/p46NgbJF3pnesqSeqMZ8N8hQvDGyE2v3VP3Y=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:15:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:15:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Topic: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Index: AQHVpFukT2OcrFpfwECdPD+snGfepQ==
Date: Tue, 26 Nov 2019 13:15:58 +0000
Message-ID: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b899cb9f-338a-4668-5ad6-08d772732fd6
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|VI1PR08MB3184:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3184103F65C2619C91ED40E98F450@VI1PR08MB3184.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;OLM:1850;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(53754006)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7406005)(7736002)(6116002)(2351001)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: roUWUUtA84B28BzAX+GPfSUJxME4YomFXtXePmcbD9wqy749/gM2zjPrU+q8cZHpU5mJlGjmO3qlo3p5Ch4MYIbN9cOigoF4oARRUjO1fQQw8VB9IgfbqhOYb/9t797EpN0Ma5R3FAk4TLvSt7F33+zrRlQp0jjL2EjAQBcYiq68LoT8A4UZKRQ5od7uMBwhilfW9PVRQF7hKJP/VdZ+hWCcdbl9MyLEoqfT9EZsZ7nyQJhmd0cq02Z6UjitW5HU3CQmDZ3XmGlnJYXCvf6Ca0xJK2dM6wlcYm+35v7bqmUyc7WmoQFbl8r5MTjKWjKihczXXrAi9TyHFMSHvWFjGQ6S/ONK/RHzNLb2L/Q+dlzblv25PKmaYvOYbG1n00aHa0bN92juZovCEURADcWz5clU05yUd7mpXJ193OKplB9pqJs+XgDjFAxr8evtcKNf
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(136003)(396003)(376002)(346002)(53754006)(189003)(199004)(336012)(6512007)(6486002)(5640700003)(2616005)(36906005)(106002)(386003)(450100002)(107886003)(6862004)(102836004)(6506007)(26005)(36756003)(4326008)(25786009)(54906003)(22756006)(50466002)(86362001)(186003)(26826003)(478600001)(2501003)(1076003)(8676002)(5660300002)(47776003)(76130400001)(7736002)(305945005)(70586007)(70206006)(81156014)(356004)(8746002)(50226002)(14444005)(2351001)(8936002)(14454004)(3846002)(6116002)(66066001)(99286004)(2906002)(316002)(81166006)(23756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3184;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b4c22472-5fc7-464f-0916-08d77272c692
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YANKrUUK5aereQSPBSvLn3UimpMHL+IQ2PhU66Y1C9Gdy7OngD7B4ith+5ElMGqNX6KdVt64MnycRXSMO9HxdGBI/u1ahTYKbt3myDPWCSCTaeWR/KLHSMENShae7U9Z14Nl3tJEIAdkjlVBN7z/q8qox0rGhOfpSixHQyFAAtiifH4L3Yj2VS8cacL1y9dQxz4TlNgvu9KHl7j+vYkA+DLpga1k8KUwKk/jcJCTOfvLfZ6NUzmQVRSbtijlZ/lMaKAKrcfWF2vtC5kjkUDHByGkBzzkKRhqpvcLgAvlnm0WaCt03i0pueKRG0aR+jBObgGj6ahSlMCe+H78yhT8wbu1EK0KOh5PhjIyGJCGdQtt4m/jUTty864bLTDFOoSSRqXgVQoMoRRwmnlMarqNCpdCMGFYnsFsfiTUuUj4ZgLxtztQywrDpxAeqHezUnzH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:18:54.4135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b899cb9f-338a-4668-5ad6-08d772732fd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_051901_330963_17E1FA6F 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Clark <robdclark@chromium.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brian Masney <masneyb@onstation.org>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Daniel Vetter <daniel@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Brian Starkey <Brian.Starkey@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This series adds device links support to drm_bridge. The motivation
behind it is that a drm_bridge in a module could get removed under the
feet of the bridge user without warning, so we need a way to remove and
reprobe the client as needed to avoid peering into the void.

1: Add a drm_bridge_init() function which wraps all initialisation of
the structure prior to calling drm_bridge_add().

2-26,28: Apply the drm_bridge_init() refactor to every bridge that uses
drm_bridge_add().

27: Minor cleanup in rcar-du.

29: Add of_drm_find_bridge_devlink() which functions the same as
of_drm_find_bridge() plus adds a device device link from the owning
drm_device to the bridge device.

30: As a motivating example, convert komeda to exclusively use
drm_bridge for its pipe outputs; this isn't a regression in usability
any more since device links bring the same automatic remove/reprobe
feature as components.

Mihail Atanassov (29):
  drm: Introduce drm_bridge_init()
  drm/bridge: adv7511: Use drm_bridge_init()
  drm/bridge: anx6345: Use drm_bridge_init()
  drm/bridge: anx78xx: Use drm_bridge_init()
  drm/bridge: cdns: Use drm_bridge_init()
  drm/bridge: dumb-vga-dac: Use drm_bridge_init()
  drm/bridge: lvds-encoder: Use drm_bridge_init()
  drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use drm_bridge_init()
  drm/bridge: nxp-ptn3460: Use drm_bridge_init()
  drm/bridge: panel: Use drm_bridge_init()
  drm/bridge: ps8622: Use drm_bridge_init()
  drm/bridge: sii902x: Use drm_bridge_init()
  gpu: drm: bridge: sii9234: Use drm_bridge_init()
  drm/bridge: sil_sii8620: Use drm_bridge_init()
  drm/bridge: dw-hdmi: Use drm_bridge_init()
  drm/bridge/synopsys: dsi: Use drm_bridge_init()
  drm/bridge: tc358764: Use drm_bridge_init()
  drm/bridge: tc358767: Use drm_bridge_init()
  drm/bridge: thc63: Use drm_bridge_init()
  drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
  drm/bridge: ti-tfp410: Use drm_bridge_init()
  drm/exynos: mic: Use drm_bridge_init()
  drm/i2c: tda998x: Use drm_bridge_init()
  drm/mcde: dsi: Use drm_bridge_init()
  drm/mediatek: hdmi: Use drm_bridge_init()
  drm: rcar-du: lvds: Use drm_bridge_init()
  drm: rcar-du: lvds: Don't set drm_bridge private pointer
  drm/sti: sti_vdo: Use drm_bridge_init()
  drm/komeda: Use drm_bridge interface for pipe outputs

Russell King (1):
  drm/bridge: add support for device links to bridge

 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 54 ++++++-------
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 77 ++++++++++++++++--
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  5 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |  5 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |  8 +-
 drivers/gpu/drm/bridge/cdns-dsi.c             |  4 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c         |  6 +-
 drivers/gpu/drm/bridge/lvds-encoder.c         |  7 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  4 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |  4 +-
 drivers/gpu/drm/bridge/panel.c                |  7 +-
 drivers/gpu/drm/bridge/parade-ps8622.c        |  3 +-
 drivers/gpu/drm/bridge/sii902x.c              |  5 +-
 drivers/gpu/drm/bridge/sii9234.c              |  3 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  7 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  7 +-
 drivers/gpu/drm/bridge/tc358764.c             |  4 +-
 drivers/gpu/drm/bridge/tc358767.c             |  3 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  7 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  5 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  5 +-
 drivers/gpu/drm/drm_bridge.c                  | 78 +++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c       |  8 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |  6 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  5 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |  4 +-
 include/drm/drm_bridge.h                      |  8 ++
 31 files changed, 217 insertions(+), 134 deletions(-)

-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
