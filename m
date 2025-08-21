Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D96ACA0EEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uwQkN8EY2x64KSncDN4LHHADme5IdWFatLYHbW8sHA=; b=1Hj8M1mQcrr2k938pPEEJH8qoN
	do2YqVBnWghd+pREt3JHEjX0P4amXM2A8BB6eyAVJtSADh2+RnC7O4OX3PakMfK+dRgLEyD7cS5nm
	MNCuphftVUPQvkCsp4xxmW4JxitRBIrpemhqz3NSduNPJg0E5rirt6/DsgzTnLF/VgO1yoyI+gUij
	kQdwnnvbXabwBgMAujbK5zOZ1MujdrZ79sg/i2NA2h9GYRAGvY1b6yS4/PFIJ11o3XoNu/eg/nNRF
	6ujZN8KsivrF0EElQ6dTMtZtkQW69yq0dUl7Ub6N18SA1jAeIXlZQ1M8hkexuCVsaJPtJUg/yHPTE
	+5aGMJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Gk-0000000HOrJ-2Znr;
	Thu, 21 Aug 2025 15:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4V4-0000000Guyy-1oXO;
	Thu, 21 Aug 2025 12:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+uwQkN8EY2x64KSncDN4LHHADme5IdWFatLYHbW8sHA=; b=HeE57fDUZFHMKSyv8yK88IPP0z
	6BgiV9xXMGW1UU6XCgXlkvlFu0JXYSkitY405K9vuaixFxIciXCtOMuBros1zZentRjc520m+l7fW
	UH8CM6tCEZ/sALOeyrBAb44SnO2lxsPokJsc0PsoJR0R+V26WF5tjVHFHWbsOwwtcsJ0/9FVW2X1H
	YzZVAey8ny3Jg2UHL+TTaWO1Ii3xxigdvcVvAaq1d1RH2xmF7I1DedKa079M3O9U/OY9/90+dK3IT
	Aeh3nfUbCHtLV2S64mMsvAPhdBq4/0PhYm9JVoUAlluFGdQBURaXo7AUrCTSvwGM89kW7S8ZC2qQt
	axPjcSxA==;
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4Uy-00000000Xz2-1u3n;
	Thu, 21 Aug 2025 12:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STJto9blANpb2zUt4SEzb00tOkrDZ1BXLoTIVQ4ca8fJU4jgPr4gO4BXkom4FnL3V1wCSBsDi1OjaiOtihfmBSZYSBqvkS8qi+u1r4iFmPEfBafCF0xxBkA+kPCNkKR0jwqICHeh70wo98cVpo6jIgxCSUYrkv+MMTl1+UI4FWjEgq3ixBbkCVmToHlG3DVvvrA12BjOlhbIbccz5R12r3Al80DKwN+xKteUAvgkVwCEHycPSzGvkASFeWW7EhdPNQnhKFC7KnEaVFwvZHn50m4ujWTSyGu9OLkYwssGbQYP53oD8qcdMJQJX6NePbG6kiRnAZHorIWoKNJyCy2bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uwQkN8EY2x64KSncDN4LHHADme5IdWFatLYHbW8sHA=;
 b=OLrZTf+p2CPlaGjbQUlSPGP1FKlan0tRU2RV091zd4umF9q8n4zEUgXpC9p2So3dY/gZVSMO41cxYgIBQFCwKg+ITV+me+FDcX7n72BE8FY/tPB1eZxjtTUh853SyUicFC2p8Ecv3cLLmdHhylerYdOyyP4zubJCf654JS1L4BwDIHDuVGOglqxeuuqOXYCqEf1VK9SFzT70Z7+DrJIb0XbO5MqaQTDMKEWglPY7nclqdMhia8kVPpgi9raE9oiWv5GXNNvkxf4Ml94Wwd8ufFXCkqBtyWFF7kbtFf7W8WBuGfayXY5XRAjrMoX0rMgPk7Mm2GRvDIs2T9YY8UK3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uwQkN8EY2x64KSncDN4LHHADme5IdWFatLYHbW8sHA=;
 b=Ql6+yB/gEhJH/7Im1GVsdcqRoAUjWZ+0m50ApzitDHpnJNndiqcoGBdrYlvVvM1IKRN3JIbrKa6hWx+vQqBkmdsK04kpr391asg9lVzPijDYvNQDTtDfbQJy9PYPwJl16FwjYIqSMU8/U7H+ubajrmIonIziXD+/qhQOcxHzrEQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15518.jpnprd01.prod.outlook.com (2603:1096:405:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 12:34:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 12:34:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	geert <geert@linux-m68k.org>, tomi.valkeinen
	<tomi.valkeinen@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Thread-Topic: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Thread-Index: AQHcEnS9RPzKheS8DUq4xJ6ExVmpC7Rs+CdAgAAIDYCAAAp/AA==
Date: Thu, 21 Aug 2025 12:34:14 +0000
Message-ID: <TY3PR01MB113464DACE314621FDF1BCECF8632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-19-tzimmermann@suse.de>
 <TY3PR01MB11346A4F40CE555D24C093F278632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7918ea7e-8914-4c0f-97be-d660043a4aab@suse.de>
In-Reply-To: <7918ea7e-8914-4c0f-97be-d660043a4aab@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15518:EE_
x-ms-office365-filtering-correlation-id: 46f772d9-b98a-407e-fe32-08dde0af09ea
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NFBzVGdNc0VjTnMwd1hzbEFuak9hSytLSjdsazdSdVNzd1B6c1N3YVZoZGhv?=
 =?utf-8?B?RXB5VFJMUVFJT2lEMSs5OStOZzVqQzZKMjRZOG1IR1I2VEpvRmsxWE5yeE1O?=
 =?utf-8?B?dHlmeXgvdFI5aG1PU1o0ZXFkWEtCVXJoSkw0MVZ5WC9BZXhUNWV5dldaUmZL?=
 =?utf-8?B?RExSVzhvTklLbk9NWUJxOG5OMUdabG92b3lsQUFCR0tFa2RDditGWXhkQmxK?=
 =?utf-8?B?a1Q5YUkvQ0ozbVErNFcySy9YWjE3alc2VzdWOXU3K0g0eFBWbXU0TTJuZDhz?=
 =?utf-8?B?TUpmM2VpUGdsUnZsUXNxY1hUUDhGZ1JHUjRNUjE2SnlEbkp4b0gyZkx2OE9a?=
 =?utf-8?B?Rndhd29VMDQvZGVQRjlFbitYSHdWcVM4Y3htRzE1NkJWZUkrbWtOdjNqWXBa?=
 =?utf-8?B?QS9vMXlpUmdiam1lRGhqRHpJZlp5M09RY2tLMXZwd1NkTFQ5YVpVdGpDZTFO?=
 =?utf-8?B?OWNjVkE5TEYwaUlPaUlQWWhVem5KOFV5amVBa2NSdnljY3pSVnUxODlFTHpW?=
 =?utf-8?B?bFJKTWt4bUI2RHA1NGJjMC9UR3llc3YvdVE4cUdCRkt6c1JVelpzenU4cnBT?=
 =?utf-8?B?VXlUYzM5cE1GKzJrUHpLYVBYSXQ5dE1nSHRrbFY2N1liZ3hEV3E2UmtsU2I2?=
 =?utf-8?B?Y1BCd3JqOGpEeWlvMlVWbi9rWU1iYldyZU52dUhXYTJKWWJJbTRyRUhvbDRM?=
 =?utf-8?B?Ui9RTXIwRWJJZlhEQUJhMER5d3dISlNVdFg4TnVNa3NYYnpOdm9zeE91MDNS?=
 =?utf-8?B?dkVMZmhEdTJLbWFNTWZOQW5VVnRTbmZab2YydUhyMDJqakg4VnE2b0VhQnNo?=
 =?utf-8?B?WnNBZW5kNkZPRjhIc3FvdjArMm44czRnUFlmaitlMlJSVVE0eThxMmhkRmk2?=
 =?utf-8?B?S2tMZ3haUlBPaFA0UWZOWmp4SmIyK0RWRHZ5Mmloc1dreFBXdXhkdStDcEVy?=
 =?utf-8?B?NElIVEtIRmx5amxlQ0d1WmJiRDFURFB3RlJOc2JHZTNscTJsZVpGa1dRaDlo?=
 =?utf-8?B?bWxxU2xQZis2anllMVZIUG5VM1F1aXZvbHZNZlZCcUdlNWRzZVFkcDhYTHlj?=
 =?utf-8?B?UlhyWGR1WnZTd1V6YVliNU9RTVdjN0FFdlFDM014WWxiT05MV0RwcWZTb0M0?=
 =?utf-8?B?eVlNMC9QLzFYYVEzckxuV0xyV1dnd2pjUTEwdThLenM3V2xRcThzRzUvWUpk?=
 =?utf-8?B?ZzhpRm1wWTRjZXM1c3gyZTl1NlQybTh4VWdwV0t3SGxYWTVXQ1k0N0pGVlVw?=
 =?utf-8?B?TUNyR1E4SnFNM0F5N25RaEovOWMvWjRFbXZRaWhlOUZmd2E1aDZCYit3S0ln?=
 =?utf-8?B?N3h2Yk9iZndYaHVMb2Z5THNITTJtOEhuMWlnOEM4Qk83NUpWQThERlhLSzZ2?=
 =?utf-8?B?RkJrMGZRcUdaYU9XaTFQNG1aZmhZTHBDRlVUbDF5c0JHMzVBSlFDRnEvYkZ1?=
 =?utf-8?B?dTlMLzdmVi96bnNyWXJJQ2FpcWNLUWxnWTZGSExNYUt6bHVwdGlVdUNMQllr?=
 =?utf-8?B?OElsZUJhZkJHRjVkaFdETlIzWmw4Zm9MRzZUTTlGSmJkQ05XaC8vUGJKZVJT?=
 =?utf-8?B?VzZzb01DVWZRYlNyaGFNOXMyWlpRK0l2MWxieUxVSnprM25RUFA0NlBTUlo1?=
 =?utf-8?B?NkplRHFTYndoR3lZZjYwYlRYdVlUREZzZ1VtZnRIZmRsdlpIYkF5R0ZyazU3?=
 =?utf-8?B?Wi9Za1NJS3pwZTlVcHhIbzQ4aTdzWDMxS0h2Mm9RSVBaZzNwcjhmVWZiZm1i?=
 =?utf-8?B?NHUzZ280a2QvcnBQaXR3Snk3eEVTWndVVFRJdkMreDJwRm9BY1E2ekZYWG1m?=
 =?utf-8?B?NnlleFFsMzU3ajlrUjN2RVlsSVVkNDF6cVZXcG1PV29WVDVHSmp2WE9lRVZ5?=
 =?utf-8?B?UUczYnJtWVRmZUxsSTJybVBnNm9YeGZTdVB6aTNCd2g3N0Z3WEpsYWcvY2Zy?=
 =?utf-8?B?WGUxQlVxc2pxVFpNeTZvc2p5T2piRGZzd0t1MHRVT2VzWWQ1b0Vpb2dXaUJL?=
 =?utf-8?B?N1B2Vzc2KzZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akloL0RPcytxQTlZTFR6RkU2VGltRjdwamNJNW0ybGcvWmJldFFuQkwrL3Fx?=
 =?utf-8?B?TmR5WmVQOHBianFsMi8wQVJjMkdpb2VWblhGYUdsNzFDNnkvS0xlSjhlalBL?=
 =?utf-8?B?UGJTZUZJZlpEcDNRalh4MFk4bUtLN3l2SDZUY20xak1peWZFbmtLbGJ2bWQ2?=
 =?utf-8?B?cFQ3ZWRoUU12WjFwalhRVjY2TjQ0ZHdDRWFPdXhFalp5LzJnblFJZlZidTdS?=
 =?utf-8?B?VVRwYUVhMlJJVWcxbFdKWEQ3MUd1dTJ2YzRwclF6RWUwNzZqTGY5M0s3bnNr?=
 =?utf-8?B?bmFjdi9iRVBtd3VPWXE5a01XdGQrQkxSWlNOWEVvZ2l2ZjJGUHB1MmJtbCtH?=
 =?utf-8?B?RzZPOC9Bc2k4a2ZuZFI5RjVXWnA5eXdtZ1RsTkdBVDgrMFp0aFRQOVBreGRo?=
 =?utf-8?B?ZDJ5aG9UcFoyNGJGaWJwNW92ZktEdTAzZnN6YzVtTU43bzA5b2xhdThlN1Bj?=
 =?utf-8?B?L2o0RW5hcEU4alg1MTU5YkpZWU5odVcwVDJFZHFaM2FnOWw5QjZFbHEyVVp1?=
 =?utf-8?B?S3RmaHJodTMyREhqeGd4b09lYjMzK29JaHpFRjFIVU10TkpIQm5lK2ljL0d2?=
 =?utf-8?B?b3YzQnFlTmhtYXBpZ01wZFI5Q0VFdWpaNHltZ3FjRjhLYk5oSGpzMEovdjNq?=
 =?utf-8?B?YTk4SnZidk9qNDNRQkY3dW9tOVYrV1cxcGx3VlFlTmowOVJaTGR3V0Y2dUFp?=
 =?utf-8?B?WFVPNmU0TWxWSFZCbW1SRmQ3bTdaU2tuYlh4dWhqZWdNTkhMcVZpVXN1OXB0?=
 =?utf-8?B?YjNQaVBKMzRHT2d0eDMvcnVldmkwZDdzNnZnTEpGbnFTbXVHamRrZjRaOW8x?=
 =?utf-8?B?RkNWc2grbm5WKzNoQjgveHF0VFdHSU9rTGF1VlBNYkluSFQ5eXR4cXRNbkZJ?=
 =?utf-8?B?VW0rZ1k3TXdua0d1VXhJRWJ3aFVVYktaQ3ZxVnpYMGJhSHJySzdjRUN4WUlC?=
 =?utf-8?B?aDJVVWF0d1ZMeXdydlErNVBaVWYrdHh3Q09rMWljTGNSbGR5SUZTYTVPN3R3?=
 =?utf-8?B?ZmRWa0xyZGJDNlAvai96Tm1GS1E0YzExWmlJeXQwSEhuM3VlZkVONnhTOE9a?=
 =?utf-8?B?TXZjRFEza0hQNVZlMm80bFozblVsMm1zR1JXcUNrMEkvcUpNWndxcFMvdDFS?=
 =?utf-8?B?REt5UDV5VTNMTDdaWDBjak9ZeFBUc1VIaWhMSTEwVENSVHE0MEZRYUt6ZjVI?=
 =?utf-8?B?aUU2dklUcGZ5Vmp1L3YzSk1ZMlFtcGZkVU1zYWFGci96YVlLSFJUdUJTam5k?=
 =?utf-8?B?MURNYjVJVCtZY2N4M2V5NVpzVUtCeXhCeDVOTVd3MEJBMUJ4ZnFEMUsrT2Rl?=
 =?utf-8?B?ajZnZlc2RE5SZncrTzBnV21SMHUzcUE4c3lJQmVKemhRNjk4SlJOWDZZN3A0?=
 =?utf-8?B?WEpmWTRGeUdXK25KMnB2bzl6VVBySWdEMk5pUGRCUUhHREo0bnNoYlgrUHpv?=
 =?utf-8?B?THNRUkxWeFJzQXJiOE1vRUcwMUNYdUcydDFzNjZydVRpamJuUUNDUGkzNVhq?=
 =?utf-8?B?VlFrM2lqOFVFU296YjllK3BrcUtNUDAxa1B2ODBwYlZ2dEJEUjVRWVd1eitG?=
 =?utf-8?B?emdWZEUzbUJ5WGhGZEpIbnROdWhvYUhnQUxkQ2QvSVVaMUpaMGZjeEthcGdv?=
 =?utf-8?B?YUxpM1ErelBrQkk2eHdzNTlGWGx2K3hHTVVxd1NxNTgzalVBcTNGSGJmeHdl?=
 =?utf-8?B?c1FlWitjb1dxY3Z5VjN2SXgrV0lFbUlQU2NzL2hEZExZZHE1Kzk4VmQ1b09o?=
 =?utf-8?B?SjF6UWJ1dVU3NFA4dzM4Qk5JOWQ4YnAwTVZvQjBtNWdZMTdHcDBvTWQwemVY?=
 =?utf-8?B?cVI0Y1ptVlJvQVFkUTVpbGdNNGhtbDNBNEx2aW5BQW9HWlljNzFjU0RsRUtG?=
 =?utf-8?B?ajh5a3RMcG1hNG10Q1ZtK0xwNS8rS1RzSWttbEJOOUptNk9RNXNrb0FOSVdM?=
 =?utf-8?B?TTU0NkdaVnE1MEp1SGRSaWlLUUc4aks5SVNLalhaUkJLaGdEZEoxcGVqbWts?=
 =?utf-8?B?cjZKcC9KSVVLc1FoTnNCU3Vka1hCR1VNM0dwYUZNTlkwdjFtakJ1OFRnUm9X?=
 =?utf-8?B?SEJYQVY1TmsrRmpyS0lhTFkvaWFpbDkyQndaU0RxYklNWlY4YXppNVJaQXM2?=
 =?utf-8?B?ZEJXVC9JQzNTaDNibmZZemlCaUN2WWN0UFpQWkpJWTY3T3UrYURSdUJURUlL?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f772d9-b98a-407e-fe32-08dde0af09ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 12:34:14.6684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3p5zy4tFrWLWNGLwHjTD2CfJSSxCYOJtTKv/OPtuSpu9OGrTBCK/W1llSn5EipwI2SZuaKxY9nPGHTpmkHnUhyGVpOVY/9yzxgiI4pbfL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_133432_602791_6EDE658F 
X-CRM114-Status: GOOD (  14.03  )
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

SGkgVGhvbWFzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTZW50OiAyMSBBdWd1c3QgMjAy
NSAxMjo1Ng0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDE4LzI1XSBkcm0vcmVuZXNhcy9yei1k
dTogQ29tcHV0ZSBkdW1iLWJ1ZmZlciBzaXplcyB3aXRoIGRybV9tb2RlX3NpemVfZHVtYigpDQo+
IA0KPiBIaQ0KPiANCj4gQW0gMjEuMDguMjUgdW0gMTM6Mjggc2NocmllYiBCaWp1IERhczoNCj4g
PiBIaSBUaG9tYXMgWmltbWVybWFubiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiA+PiBTZW50OiAyMSBBdWd1c3QgMjAy
NSAwOToxNw0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMTgvMjVdIGRybS9yZW5lc2FzL3J6LWR1
OiBDb21wdXRlIGR1bWItYnVmZmVyDQo+ID4+IHNpemVzIHdpdGggZHJtX21vZGVfc2l6ZV9kdW1i
KCkNCj4gPj4NCj4gPj4gQ2FsbCBkcm1fbW9kZV9zaXplX2R1bWIoKSB0byBjb21wdXRlIGR1bWIt
YnVmZmVyIHNjYW5saW5lIHBpdGNoIGFuZA0KPiA+PiBidWZmZXIgc2l6ZS4gQWxpZ24gdGhlIHBp
dGNoIGFjY29yZGluZyB0byBoYXJkd2FyZSByZXF1aXJlbWVudHMuDQo+ID4+DQo+ID4+IHY1Og0K
PiA+PiAtIGluY2x1ZGUgZHVtYi1idWZmZXJzIGhlYWRlciBmb3IgZHJtX21vZGVfc2l6ZV9kdW1i
KCkgKGtlcm5lbCB0ZXN0DQo+ID4+IHJvYm90KQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gPj4gQ2M6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGVzdGluZy4gQ291
bGQgeW91IGFsc28gcmV2aWV3IHRoZSBwYXRjaCwgcGxlYXNlPw0KDQpTdXJlLCB3aWxsIGRvLg0K
DQpDaGVlcnMsDQpCaWp1DQo=

