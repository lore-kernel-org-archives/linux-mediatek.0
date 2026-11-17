Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40173606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 02:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0WrkFLcW;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=YKFutenI;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=nQ3c5Xvw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zF70CaridpSzf0gPFNDpUBozuhtAkOc8hvSpeap83bE=; b=0WrkFLcWSq9edKjO0BAkAC+JOU
	c48rm8lh6tuGRbnqs2U/j+F8Mo5M1qOpakM8rugZb210aML3MVd3TEmrBBXwdYggrbLqFAhyW8hK1
	xvDNFzVIzDkGnJOgF58Z91oeb2Gf98nMawNPsqYOPqLWRZYVJXfyfhryYbgwE+qn0j9oauC0gSOEM
	BSDFPCjTMRuFAyMJM+em5CwxugaY/0X1mwHXeZ/zVVazaEaiar5B0ekCruJcJ25GOX963CehedTZO
	3CIfxvvY2NEhN/XUkJ7BNrrwU2cAVDXnaPEXeAViG8PLFL7oEeLpW8HHdCS0qgAOT0Nqtze94nfXh
	HYSvgUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9IN-00000004RRV-32SN;
	Tue, 17 Nov 2026 02:51:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9IL-00000004RR8-3MuK
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 02:51:42 +0000
X-UUID: cd0b4ecce23111f1afed4741b24580c9-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zF70CaridpSzf0gPFNDpUBozuhtAkOc8hvSpeap83bE=;
	b=YKFutenIde35Wy4xnZuVb7fK3z7L/rwvQyJ8harWqrxplonHvx0OsspgVUlC4NFWPfjtY2mXzlaADyhqMU9YMZcx61BqeGVGAS+w3hqjpJmI0W2bHRbzfkwzkhwqEE6dpGzfwFpb1AjhGShBikxNisVjhuibhI5K8h3jo3dIQDA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cde4f856-ff60-4347-86e2-4d0492fc55ef,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:ed2f5e33-b2d3-41c8-8b07-c8724f80a34e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|110|111|836|865|888|898,TC:-5,Con
	tent:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd0b4ecce23111f1afed4741b24580c9-20261116
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1282298911; Mon, 16 Nov 2026 19:51:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 10:51:32 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 10:51:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCnwdo2jgW8TWBBsnW8J6TOoqJz9FQNcnRE0yQGXEVrDnxJX4naTcFlDi6Ram+UGS0eSBE3J3cbdVn3uHBNEtiIRxc8OjJYtntU7VZQ1ReJawovuHG2kUqYX66CUcXfZgJOODzyOKuXeBlA9GVrtYdDD/LfrPEiWlYWOXVTTtcmlQKYNR8BQ6Go4CpdipHaJKl21n+/ieeyDuYkYfoSpAFeTQELJrWvvY9DZ9v8/pODZt/l9XS2oPmfJDF7az29PrVx9QSMUUcu9pCEBXxRdsjme79MHrCd5VV4++MRsMHC/18lEbKjeUuqBvMPEvp2PYakBZRiA7l2+9A9E0u6Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF70CaridpSzf0gPFNDpUBozuhtAkOc8hvSpeap83bE=;
 b=avx+o9rscuV++ptb9vH2EYTMd/AxyYTEbRvHqNG6UKz+MyJp10+FH9FReqFe4f5X7VtJBvP2Z1Y4Krhty0rCyi/kdk5TD2kCdOK60lYn3kOcoUKei2fGbnojNeD7gkCNMV/rWpE0zSSIAWiTI/3Io9//lo2E6Er08wgKUCPhy8EhxfeMcwlrAxiG2rZaIHxvWUGU+rklBEkU8vK5EzCyHFqa3n4ARrX6TzNeGFaK5PcTpQL8LvCflvl2UR0H9bzCtyplCsWgrpZcKFlta0IVJwhqRxn0+gnD3qwbPqOUqg0Ty0K0dL+JES/BtlJf4MXvKRXtcoq+YYTKee+MDFheEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF70CaridpSzf0gPFNDpUBozuhtAkOc8hvSpeap83bE=;
 b=nQ3c5Xvwo5dkt7aQ9pxLvzxrMTqazgK0jIKoMv9/RaDnwsxyMGCUFoIxQZAETNz/aNyi23lvUHrVjbbfXmPmDtEJL5TXhaEJmHA7P5/GIz9Jky8uiZFMwcqVtrAyZAuTzkww8ZyU9GyOWKD7t70pbwMM86ATQT3aFzXI2V9hOOI=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SI2PR03MB6782.apcprd03.prod.outlook.com (2603:1096:4:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 02:51:29 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 02:51:29 +0000
From: =?utf-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
To: "lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>
CC: =?utf-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>,
	=?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?= <Litien.Chang@mediatek.com>,
	"hoopyfrood42@gmail.com" <hoopyfrood42@gmail.com>, "nbd@nbd.name"
	<nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
	=?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>,
	=?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Topic: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Index: AQHdcntXTSJdwG/Qc0mP6zZ1kqaFO7csGpEAgAV9jQA=
Date: Tue, 17 Nov 2026 02:51:29 +0000
Message-ID: <644ef5eaf8cf84f5760691ffe9bcf8e7ac8b9f69.camel@mediatek.com>
References: <20260831032832.83338-1-eason.lai@mediatek.com>
	 <20261112075558.1813785-1-michael.shih@mediatek.com>
	 <20261112075558.1813785-3-michael.shih@mediatek.com>
	 <20261113150048.5271-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261113150048.5271-1-lucid_duck@justthetip.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SI2PR03MB6782:EE_
x-ms-office365-filtering-correlation-id: b0139ccb-cc31-4025-a759-08df4455ae25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|11063799006|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: Vh4hLmOKzib4M8TLWvT1YIIAzGg9hjLPhfiZDUk/4v8EvjDkRdd/KICj+AxiCxe5/k27BIHdAn/QTZ81obNeQguAEhng3zwODxDc7/gkjiqEh7MmsjdjQISvFU3vO+f6to0syHPBrv4aZbmHYTt4uuaaVl2cyL2fMzUJy9JkutxvUCnOZXBT+8s+u4jEbqi0CMtfP21Pvds+7zTWj0yfzzEieSKZjHXh7qtdE/A+jmqtRnmDxn/2Nr+CnzdnT/2mhsC1w1Xste+0QsTGZOjGpp9GusY/p+aswM9Z0X7wex45/NN3juIQXaI4SSQU2e5hBY7KO7bS8gYFExVk+4ALGqLa9hjYLBB+xDFAztuyUH8Hp5jXoZjD9NOVZP7nWfdcGGQ9Qq84cfEVInDn2KIxU/v+uD9FO9CL4XmjDWA3xvfHs94ocNd4Qks84mNtBGdLcPASf6ifBK2ou3z0RJDPrWxfb+cPBKFcqHmBOhZh4Z/rVawV3qpZ/tscSWS7YC+VARLKn1mx9shqnDusWpAhMlFztve+kaO68NzkkYDcY30f8oSh4iQlWJLbyeVqMpRm7bsojGgr0eMhoER6sbi0NumQT0pEXametHG9Pc2dllBIC2FFDEflzI4/Izj4hWnn8MYpp9pXG5cOmZiGd+tUzGkLNVxkir6k3b6gR/FivAzs43+5IGfazwBfoKXzcSCT0mQIojRf7//oIbPHMkBQoHVzXHby3hwEhAQV/1jYvD8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5742.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlJzS1lSQ0VuL0RROHd6OTlZcXE0Rm83bVgveklnZGczQ2J5MWZqRkhnSGVh?=
 =?utf-8?B?YnZScDNTdEEzNUtWT1RnNDZBSk80d256TTE0d2cxMzFESXNCaHo1S3FCK01R?=
 =?utf-8?B?RWQ4S2hQUnBWUHhtWXM5dUNRQktWbGVTMzJ5VC9xZHJOUEErdVVVVW5DT0RI?=
 =?utf-8?B?MVowb0Fhc3l1TzNpQXN6cnYyd1RBN1VVU3lPWUtWUktQN3lDdTRRVUVBV21O?=
 =?utf-8?B?d0ZLMjRoelliVG0wa29kWWVSZnhvSXYycUx3REV3MUVab3FLbFZ2VGxRMFJX?=
 =?utf-8?B?WWkyWmRKTldESCtqZUFDQ3h2Mnd4K0ZkSnFaWjV1eWI0bDZNQ1NoVU9WRHBL?=
 =?utf-8?B?QTZUdm1ZM0tmaWFZdERERldNQ0NIOXNzSzBmZzdJd2lGMkJSS2JUMzRhbTBt?=
 =?utf-8?B?R2Z0b3l0STVURlBiamYwcmJVMTk3bDBqcjMvaGpML1NQeVJDelNRRDBMK1Vz?=
 =?utf-8?B?QTVvSGZINzNRUi9ucHozMm9KNmVUcUxqUnA3MmhMTEMwNDBuc29QSTE4eG9s?=
 =?utf-8?B?RTNWN2VEdXFIOWszUWpOcGo0OXIrbEt3MVZpL2EwNWxtN0RIRTJZSzNwYXVR?=
 =?utf-8?B?WHQzQVlUdTQ1SkJvK0ZEMlpPbDlIOVdhUmdrb0VRYzRtYUIwemlLbXpPTGRo?=
 =?utf-8?B?MDlVMjBQSHFpS1lGbmd4cHYvVTZZTllzR1Z1Q1BtcDF0MkJoeENZZ2pRelNy?=
 =?utf-8?B?YVhNRlBEcmw0QUtZMElnYkhyMlVUakVlUm5aL1VXMWI0YWZOZ2c5Q1IrZXlm?=
 =?utf-8?B?S3JNTnFOR1dIOUJBSVNFK0JWZFk1aFhzSlFyOVFENHl6c3RNMGkzTHNXSWhv?=
 =?utf-8?B?LzZJVVFQL0NYY0ozdnUvTlVyamJLYjdTejlPbHZrMU9Tdm1zYzQ5czJ2eUJ3?=
 =?utf-8?B?dXJEc0ZIM0E1dG81UnVwWElidmU0bzI1TE45b3ZsSFdqU1lQZ3AwSjk2Y1lC?=
 =?utf-8?B?Vy84Wkw3bUdHeHhtVXB6dTh4MG1qeFNPdUVzUTVkbVNTSVVhaGZRSkI0b1g4?=
 =?utf-8?B?a3ZIaUNmK3BrNEtadVh4TmpOa1lCQWV3ci9xc2VDa3RkOHhsUXNXbWNqOWha?=
 =?utf-8?B?QVZSL201MHI3WEZyeGVwSWNLajdieWJXa0I2SkRWbkJXZ2hzdG5sUFZsallx?=
 =?utf-8?B?QStvbVBiNExWTE4yMHlsaWpuRlJ1YnAwdkpHbjhMWkhxQkZXbmtNbHBvM2dQ?=
 =?utf-8?B?OU9jSmJZK1hPcUJwRll5YktkSnZDTlVSQWdmbDRxckd1UjZGTUlaYnA0VnZi?=
 =?utf-8?B?Q2p4RDR3ZTNFeGZPc2dPTDFzUlAvdk51U0dTRU84Q0RnbWZSWkFuZnVQZUNi?=
 =?utf-8?B?Zjc4L2ZlUHZFU0Q1bHZaWGdKSDk1dW5vNC9DM1FuZ3hFV0xXTDA3UFUyeG55?=
 =?utf-8?B?NllDMGpCVnFxZEFNbnJWc3NKc1Z1VzBEWmcxcTBZd1NLK2VjZVBUdXpuS0xL?=
 =?utf-8?B?ZGM5Tmc5eS9kODdUa0k3dGM3NjZZc0MzSkZsNE5RNWpkd2cwYmtGTFNrbFRt?=
 =?utf-8?B?WTVUSkQ4Z0ZZcFAwUjNFdHgrTG5LVjJWUUQ2cWNlZ2Y0V1l3SlJtQVVMc1Iz?=
 =?utf-8?B?Tm1WSnhyR0NMNHpaNjAya0NvbFZjUGZlbW1hNHp5NWFJTmZ1RmkvVXR4bDdP?=
 =?utf-8?B?MVltUExDYkxleXk3cDd5dUVHN3FsRFo0TWVYR1F1YVhJZ2VnSldjRjdycDlz?=
 =?utf-8?B?bGNGYUYxR2MzOTE2VVhTMVVLV0U0K1RBcDc1ckptTkN2S3EwbndKTlE2Y0tx?=
 =?utf-8?B?NFpuam8yZmRyb3piNk0zVUY4amtaVTF2Q1dZVzkwK0Rsd004cUNkaWg3bXpN?=
 =?utf-8?B?MUovSitIbnNBelNYbkwzZ2lWd1R6cmtGaDRvN1RGVkFoZGUwKzIwVytVMHZk?=
 =?utf-8?B?MThSby9SeHhqVmRVVFFxNW1sWWpFbk5JWGNoTEhDRjZIUzliM2NXc04yaGZ3?=
 =?utf-8?B?cFE0V0k2ZEVNMjR6dUhnV0tYL3JWaUJoeUJVZFhTVDl5WXk2TkN5NTdudW9t?=
 =?utf-8?B?MGRCakt6bks5SlI1YUJtSjdCVkVMcmVBTjgwQ05KSUdMRXUyK1IvdXB3QUUr?=
 =?utf-8?B?Z1VNdER4bDJtZDA4NUdsWi82ZFM1YU9rRXhXOXhwQkZZNDRicks1ZXdCYy9u?=
 =?utf-8?B?ZytKTTUvSkpMSEVnVjJTeXdxYUJVZ05lTFNlMEI4ZU5EeXV6ZGhzN2N4a1Rt?=
 =?utf-8?B?d2ltb2hLSmtBOW53YVdSSDlEVkQyOVo2ZUhaWmN0L0RDMWlpZXY3aXZwY1kz?=
 =?utf-8?B?Q2lCQmlpMmtTMXhUTjJnS3BsaWgvNW5kMkcwbnVTRDB5MnhiKzQ1cWJmRzdX?=
 =?utf-8?B?YzE0U2dvcFVCMmFjV1BrbkdOSkREM1FxaXlsK3EwMXRCTHpuNDlvdU51dUFC?=
 =?utf-8?Q?0OJkJUeyBpcWpVLs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC92CD4DB7E1342B9CA6B60185245B8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PmHCFHZEolIahvYdPZXBHojOLQnKsQF9NxRVKcS/1OoxvD3flb1yunlWPCFMajw4QuJJYvf5/4xtwWsH82BxgWGNHGlFKzufzqOsASv/WePTBFRbUdfxs8AAZjiBGCbn7aYf8NANpZn8cK57UAkaGU9NcKIswkLgLsw1L+zfM2ntorkvgAA4tcTIkmjAKdrmMRJ1al8guI7zHS9if79E4zfsjuIw2vqAX1BLkh/F3WV0OtR9M4T2ZEG2vU7lZfheq1zLOGSd+q2g6yWeXCU4tud/DzT60Fe8ZpTAli8Iu841vfHq+XsCdJB56jNUphwG3pwGfgJX16100XWKUOFr2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0139ccb-cc31-4025-a759-08df4455ae25
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 02:51:29.4142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PorbpWmKZ259Q7+tfU5Wegeei7b+8lHYbTLBL+VZNN7+WTWHoRoYF1w5LjtrdPPEBlBhxmn2luHEovQtcHKU5onkvkW6+2TSqzzPfMXivk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6782
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_185141_888114_AB705A09 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGV2aW4sDQoNClNvcnJ5IGZvciBub3QgbWVudGlvbmluZyB0aGF0IHRoaXMgRHJpdmVyIGNo
YW5nZSByZXF1aXJlcyBNVDc5MjUgIEZXDQpjaGFuZ2UgYXMgd2VsbCwgdGhpcyBpcyB0aGUgcmVh
c29uIHdoeSB0aGVyZSBpcyBubyB0cmFuc21pdCB0aW1lIHdpdGgNCnRoaXMgZHJpdmVyIGNoYW5n
ZSBvbmx5Lg0KDQpJIGFtIGFsc28gcHJlcGFyaW5nIHRoZSBGVyBjaGFuZ2Ugb24gTVRLIHNpZGUs
IGFuZCB0aGUgRlcgY2hhbmdlIHdpbGwNCmJlIHByb3ZpZGVkIHRvIHVwc3RyZWFtIG9uIE1USydz
IEZXIHByb3Zpc2lvbiBzY2hlZHVsZS4NCg0KVGhhbmtzLA0KTWljaGFlbC4NCg==

