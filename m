Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FA0C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 15:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931D52071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 15:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="scJ9jHeh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="B/Q7FZmW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="B/Q7FZmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931D52071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdDgTPvpU/5p+5rDmtr+hioherZaI2XbpktTW35NFyA=; b=scJ9jHehjTsR3T
	fj3L3VE0xWS2uAyXfPvLnIqDT3ziNBmTrGPSDEcltcBQdhd5g04noejISmJ/XIG1JhrQlLmbI6eml
	0RcVOLB+KdJh8mPFk67n7SfyO4/gQ9JIu/6+yJ3FscD1aan+R5H6qXIpA4bmZvaY/yy8ENOXMBshT
	J5yfMkr4kMWX/xGoGIevNex/+3HnrcuP5cqAybt+CcXW68ztoiNtmIpRp0O3dSv1DOTiJ8Um+gvZ7
	xxnZH7ysiA6ulPdB/ZJJ3cMsTmPdehTfJ1pJf6OgxiSiD82JD3lcqcpueVNMQveN2jv6d3AFWoa+M
	oOo4hdVnLaL68dkfpR5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZdBg-0007pI-VD; Tue, 26 Nov 2019 15:55:36 +0000
Received: from mail-eopbgr40083.outbound.protection.outlook.com ([40.107.4.83]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZdBc-0007nu-Vl; Tue, 26 Nov 2019 15:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=B/Q7FZmW5quglvTc1Numvpqa4Hjg5+JmGiM5pRinIKX6NNxLgwcwt7C/Zm33Xbob6IXo+MQEfoQN+pvZUESs8bKr4amX5+LL/wPXIiOL05l1TZNQbvWtYRL3eA42eDyARWPMNdeLxL5uhySo0gN1Ou/63Hpjy8K/UXzP8724tNY=
Received: from AM6PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:20b:b2::27)
 by VE1PR08MB5261.eurprd08.prod.outlook.com (2603:10a6:803:10d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 15:55:26 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by AM6PR08CA0015.outlook.office365.com
 (2603:10a6:20b:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Tue, 26 Nov 2019 15:55:26 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.infradead.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.infradead.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 15:55:26 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 15:55:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 397163439ad1a7a2
X-CR-MTA-TID: 64aa7808
Received: from 06fdba92f32a.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 202671C2-FE55-47FA-862F-657EA1580813.1; 
 Tue, 26 Nov 2019 15:55:13 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06fdba92f32a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 15:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4Qyj9SflSM3pa1A+FJi0+QYxmdYYymfF/+8CutIdYrZCoG5wQAgyIjl7Vx3K9dEAQg23RiUsVXrPL/FgobWD5lO5me8LugSCUdXSPgB0AkKT+XfRGOPR25A/zEnC4MGpTp5BIThmdXQFHk88oRI/y9fVdFlkCECdWQjHW8nCA8/eJ1ZfyA5dXg7oq8Qa71+ruJx9UwuWMTAy9H7tiH1DxhQLTDfzrnbpuw4uEbZ53trKoh7436fS7gd6kpj4vx4AasXpQbTb//+ZU38Os5pQxMEoxa79iDblHKp1r1dnaIdA5LIyTXbC5W8doJGXlzkXEsle/2J+/NqsK817y1DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=QXQwupBGA7X7wgSwVYkfVANktoNNf7slkzlLkcUOWjlXXv8857y1ARjDG2Bq7cKhn3OUDe+oMtSSu5QRMNjy/QeCsUVG6loyWJEnZXfHtog/UkTebXOgQUbGbzDveHfX8XUVYva3K/VhoqbJFqWonVpmoTnPQrJ4v4+0TA+cT1qMlVYyW7M5pxfXUpzJRqhuO3y2wK013Cw7CROXQ2XJ8T9qr7C9suXPLurRFev6Jx8l8pUDaKo2ye7ngFIQ/yjEd08mZoxP0EhUni+KnlwiC2PbIcthvNy4c7PpgYY/CIgaLA3WoBoTynC9OFcHCASxVZal1Jvo1+1JRrjQgEOK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=B/Q7FZmW5quglvTc1Numvpqa4Hjg5+JmGiM5pRinIKX6NNxLgwcwt7C/Zm33Xbob6IXo+MQEfoQN+pvZUESs8bKr4amX5+LL/wPXIiOL05l1TZNQbvWtYRL3eA42eDyARWPMNdeLxL5uhySo0gN1Ou/63Hpjy8K/UXzP8724tNY=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2910.eurprd08.prod.outlook.com (10.175.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 15:55:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:55:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Martyn Welch
 <martyn.welch@collabora.co.uk>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Topic: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Index: AQHVpFukT2OcrFpfwECdPD+snGfepaedk0AAgAAHSYA=
Date: Tue, 26 Nov 2019 15:55:08 +0000
Message-ID: <4032989.Zq53gbr9kj@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126152716.GY25745@shell.armlinux.org.uk>
In-Reply-To: <20191126152716.GY25745@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5faee592-586e-48bb-b562-08d772890dd5
X-MS-TrafficTypeDiagnostic: VI1PR08MB2910:|VI1PR08MB2910:|VE1PR08MB5261:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5261E0B7336A5B29F94811BC8F450@VE1PR08MB5261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2331;OLM:2331;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(6246003)(86362001)(81156014)(81166006)(66946007)(8936002)(110136005)(66476007)(5660300002)(7416002)(2906002)(316002)(6116002)(3846002)(66066001)(7406005)(386003)(66446008)(6436002)(14454004)(446003)(6486002)(99286004)(11346002)(229853002)(71190400001)(26005)(8676002)(64756008)(256004)(25786009)(478600001)(71200400001)(966005)(54906003)(66556008)(6306002)(6506007)(33716001)(4326008)(76176011)(186003)(6512007)(305945005)(7736002)(102836004)(52116002)(9686003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2910;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1qsvhICN5pWgg1IhC8NEKHeXl0icZkx77p1B2HF8xkJ4NDOHSx6CTDcI25vThdw2hIKkydY2Vls0SnYMMWZiFNczc5OWUJtRqZpvW9YKAL0IsWsHKy9X++HXcxY6pp20Q4p3yI81GC+/s1kuriwkVpgYZTGIFuG4kTn9RFsFKVIkPWfwUUUs/c1Sefv95rWWAxaZvYzPTbqnpG8Dv67zCLlGXVZ6XLP8YJ7f0c6thQCzhk/vR7vZKqE7QX0GWAWaz8qOItzvjkGu0UBrkfZO/JG4qK4lMPKmtHj81aWCkZpPfgi/1358HGzZMchUp0wmrAK7sgHlBv/0EtA21nvTDg7t+vJhqKk4JZv1qEvGpMW3Bc7rtRPbwiAa2CkM32yUTwyINjLR/bBW3pmLtF8KN4W3/BEroAQeEYYR9Z36E5cagKiwKoYYylwS9+2lO1gdlEj7Aym5PgoNF9Q6zDlj+k0RfLSMGkjobxteuegjPNk=
Content-ID: <F480F6FEA28CC444BAE40C61CCA1878B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(1496009)(7916004)(4636009)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(6486002)(6512007)(6306002)(9686003)(106002)(8676002)(26005)(81166006)(81156014)(6116002)(3846002)(229853002)(8746002)(8936002)(2906002)(5660300002)(36906005)(316002)(76130400001)(25786009)(336012)(11346002)(186003)(450100002)(54906003)(6246003)(107886003)(356004)(110136005)(70206006)(4326008)(70586007)(33716001)(66066001)(26826003)(478600001)(50466002)(47776003)(102836004)(966005)(86362001)(446003)(76176011)(6506007)(305945005)(386003)(23756003)(7736002)(14454004)(22756006)(99286004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5261;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6cdd9194-e4e6-4315-34f0-08d77289034e
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9Xyh97FyQh7QXpUARFRLAW0PJqsDo3mjM+HvrdsekSr5UcKgGQFZz5ep1KmQWHzkpdBMstyIDpkC5xqJtst0VNdx6tT0ooW+bKYQwp2y+wxPbKM5A8BmeXYv7WbYqE75OkpFEOcV+OThcLA3BK5ZODcXt7JQMdCgP/dQrwrYyAk07M13cr2M5gcU/h8F8mOuGDSTsIVfTI5u2QelsnoYyT5hJt9HNXd004UHYS/8EFlPItjZN/a2UC4r8LsapkLSmTVc+Q2RtwYnMN/ioruNEvoOpUqg+2bURNBuaQ9CJhgfKzUMWaHOIvTa5N9v2BzlUO5ZZMqpbHRI7mZomFtDjoVx8JM4uvYLsGC0yO04ymOi2IVV8QvRt6LqkVZtKTyG/DL6zUCnNtVQBDW3FXF7qWAPvlqmh0sRz/2Wnp7lzh8UH9FUEKYpK9XJFQtj2podX3+6dfR4AQna52STP38ciMWsayNK3zcg8GHuCkdHw0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:55:26.3599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faee592-586e-48bb-b562-08d772890dd5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_075533_026929_68B9411D 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <treding@nvidia.com>, Icenowy Zheng <icenowy@aosc.io>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Daniel Vetter <daniel@ffwll.ch>,
 Brian Masney <masneyb@onstation.org>, Brian Starkey <Brian.Starkey@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tuesday, 26 November 2019 15:27:16 GMT Russell King - ARM Linux admin wrote:
> What happened with the patches I posted doing exactly this?

Hi Russell,

> 
> [snip]
> > 
> > Russell King (1):
> >   drm/bridge: add support for device links to bridge

^^^
Do you mean this one? It's 29/30 in the series, you're Cc'd on it.
I've kept the non-trivial part identical to
https://patchwork.freedesktop.org/patch/337181/ , which is the only
recent patch of yours that I'm aware of on the topic. I've preserved
the authorship.

> > 
> >  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 54 ++++++-------
> >  .../gpu/drm/arm/display/komeda/komeda_kms.c   | 77 ++++++++++++++++--
> >  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 +
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  5 +-
> >  .../drm/bridge/analogix/analogix-anx6345.c    |  5 +-
> >  .../drm/bridge/analogix/analogix-anx78xx.c    |  8 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c             |  4 +-
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  6 +-
> >  drivers/gpu/drm/bridge/lvds-encoder.c         |  7 +-
> >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  4 +-
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c          |  4 +-
> >  drivers/gpu/drm/bridge/panel.c                |  7 +-
> >  drivers/gpu/drm/bridge/parade-ps8622.c        |  3 +-
> >  drivers/gpu/drm/bridge/sii902x.c              |  5 +-
> >  drivers/gpu/drm/bridge/sii9234.c              |  3 +-
> >  drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  7 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  7 +-
> >  drivers/gpu/drm/bridge/tc358764.c             |  4 +-
> >  drivers/gpu/drm/bridge/tc358767.c             |  3 +-
> >  drivers/gpu/drm/bridge/thc63lvd1024.c         |  7 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  5 +-
> >  drivers/gpu/drm/bridge/ti-tfp410.c            |  5 +-
> >  drivers/gpu/drm/drm_bridge.c                  | 78 +++++++++++++++----
> >  drivers/gpu/drm/exynos/exynos_drm_mic.c       |  8 +-
> >  drivers/gpu/drm/i2c/tda998x_drv.c             |  6 +-
> >  drivers/gpu/drm/mcde/mcde_dsi.c               |  3 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  5 +-
> >  drivers/gpu/drm/sti/sti_dvo.c                 |  4 +-
> >  include/drm/drm_bridge.h                      |  8 ++
> >  31 files changed, 217 insertions(+), 134 deletions(-)
> > 
> 
> 


-- 
Mihail




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
