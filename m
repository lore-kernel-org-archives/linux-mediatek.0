Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A001C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=; b=XD8aW5i0lHR2VsW+78rbiN7doV
	m8Sd0+bRMuYr2tS78NPin8QSZojeLJBkTgxQTJjRqnNXKUYCSngucPcknqBzmzMg7+lPAZZQUeNdW
	yQzj/yc1aw1B59AUZJnO8OtNvML8VNJuH+yzyOpwSCvPBUu35WqO5fDa+ClMwcko3U4Xov/k4taoi
	3nmkfQtkmWh4iocew49cr4I1LzcXbyP35jfw8IA/sETNBfkz3BiOfKiopSGYd+dsoXd5ayTB32ghU
	SEglOqHTwmnzLpqbgUpLoDS8gWmVAHTFmnz3hZGMbqVtA/QKwrwhmh91g7xV94tFfKuAwyoBJv3tH
	HaJNizcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHzIM-00000001Tc7-2vDO;
	Fri, 14 Jun 2024 05:16:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHzII-00000001TZP-2kBE;
	Fri, 14 Jun 2024 05:16:12 +0000
X-UUID: 353969c82a0d11efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=;
	b=LSuQ0LKykFHRrIS03zmv0ir4oqgJOMlSSXvRmYk/96eaLfqAmbkUbrCFdaOn7sElKlZgGWqZvh8fQA5hnw37sBlfDdUly1vldwVGaG3X1zeHOR7FYEXAK0g1ARqB7zOhRsitqxq7JkihUgbykOddvU1kdNprW3T9AgS6+uZ8WaU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:2ad98f75-f3ee-4e1a-a66b-67243b3a4687,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:ac9c1385-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 353969c82a0d11efaf04eb0598667787-20240613
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1005945915; Thu, 13 Jun 2024 22:16:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 13:06:04 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 13:06:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdETd7ks6jqQYtMln2urRI7/OIyaSieJg3DSjhOcpMN04JPZ68za2K1P2AqcO2vXraDOwh48lJIkZoWGgxpmvc8fHluhpn0Nqsk1a+aL0X76CSDbqvylwAh3UQB10VFD5L/YDrwbpFcY3Qv4vh/XlB2UsYCRcW+8wKAiVgbukQT2AncTkV9rZKujxlidOrjZj3WyXzsaGGgN2h6AI78St/NvKY7Ui9+Ic8qanjc13mM6RbLf00eRiQ5LAUBXB8+LUe9FVG2R2iODYIlldYJQ9dQVRZ3aQiOa9RBcwRKzx5tP4FJlVYX4yJ+7BqnXoqTR4Bqn9q9dcDJbJ0uUH2PnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=;
 b=XbYIHAOL3ssAGFpoVx54kmbVMtIlH58ktty9DX2leDskCZA/skObetCazhfeCUsXtz7oh2FYbfMvBpNKPzJgb2HSewTwLgry8wn3dij5peTKGWqt//Bob/lZaUiqoaroSW4kN8BYyDbtDTIpol6XXEGF1KvmPth9JidNdsKuAyQ09Z8sMsNq97eAnmv15XupGfOx6aKfuYwt8KlQ5WSssG9iRZLbvj6iCAYR3DB6K6eVfDnbwCjeXreqAw+8wa/0ZcN+WUsscnVrg4WsFMKpEyUfcsYj4vGHvbrUuV4sLOg1XIZSJ+VPPOxfQDyWXrhoaK2JTCJ4dOfHkarYV95p2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=;
 b=gK7eLwApnny3/YjNWcPLK8daIXJVLz6riDDoc3n9PfF6W8u/kUEi7HRmRBoYixYyCW/mBJkJrFm3ud7R5U8XxVTHZbXeIDjiiMTkYZNdSQPeYcqb7FXuk7eGIKPj4UIWUXY136SLwFZuN7XpicV18At2UOO96M3kd6M0hJCpF5M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7228.apcprd03.prod.outlook.com (2603:1096:400:343::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:06:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:06:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v9 12/21] drm/mediatek: Support DRM plane alpha in OVL
Thread-Topic: [PATCH v9 12/21] drm/mediatek: Support DRM plane alpha in OVL
Thread-Index: AQHavgUwUjWmf4SgFkWk/4MtihynnLHGtQ+A
Date: Fri, 14 Jun 2024 05:06:01 +0000
Message-ID: <efd946d5d2670e5f71175cb2c8179998e769fa7e.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
	 <20240614024620.19011-13-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-13-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7228:EE_
x-ms-office365-filtering-correlation-id: f3478bbe-4aa5-423b-8b44-08dc8c2fafb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?dEJwZ1RyM3pickdScUZFUC80ZDRMSkVtckR6ZGwwTjhTeEdnaDVQQy9MM3ZY?=
 =?utf-8?B?VTFldEJzRG9uc01nT3BQRFJ2T3RRNTNtYlVXVWZpNm1aWHdFZzZPZytySkY1?=
 =?utf-8?B?N0NCdjJ2Q01IWk9yZnBjcTdReFYxeFliNkFTeWdnaG9uZnRLR2MwZ0JYRG4r?=
 =?utf-8?B?NGZLM2xoa2JVdHUwZC9HN3V6S1RaeitzKzZmVkI3ZHZtK2Qrekk5WXF6dUtn?=
 =?utf-8?B?N0gwL0pDbUNZZzFBS3RpVzVNVExGU01wYmhrc2p5eW9wZWEyT0RhcithNVNh?=
 =?utf-8?B?MVd6RnZiUWZqYWJJbXlZU21ITjEzdkl1QnJpSHg1eGJIZTJqbFZ2NXRmZW1E?=
 =?utf-8?B?d084eDJYRkdNTXBZeU1IaXo2eE44QzByQ0tqdzVubXJBN3JCQzcweHRhN01u?=
 =?utf-8?B?elByNElQdC9nY09LTEYwTE5NNDQ4aitrUFoyd0pYSE5SY0Q0REpORWR3TE1S?=
 =?utf-8?B?cUNGbUpyQnVBSjFERHR5RG9lbUNncGZRaFZtVUh4aUdwWkRlNkx0RW92K203?=
 =?utf-8?B?NnVoZWFza01Ic2pNN1Z6QmM3R0pmU2o2cGlsM0puODFvR1A2SXRsandjSC9L?=
 =?utf-8?B?YzZvT2dadGtWWXNpbDRlVDhYcUNUM3BTYmxNVVBIYkdMbktGNGwyR1FjZ3J2?=
 =?utf-8?B?V1dOWVZ3N1RGRjBmRmwzcUZtcm1XYTFndTJRNzluTlZScGorcWlpbWh0dXl6?=
 =?utf-8?B?UmlNdERCaEUvNUoyT3FhNHprRExma1pMUWhpWWx5RThtekErYWFMcStxK3hn?=
 =?utf-8?B?RTNMYlE3WkJCbmlvNXc4ZDFrTU4wbkptTXFDN2lnNzcxcGNKdVNCYWRnZzdD?=
 =?utf-8?B?ZzBoNFQyb3BxWXZqamZxTjNnVnJBdmk5VjJRY3FOSjFmcHZtZ3JReU5sZVp4?=
 =?utf-8?B?V1VyZlpuL3Ezd0RGbHAwbGdVaDVwYng0ZG5BVkhIZGZSSzZndHNnbms2aFV5?=
 =?utf-8?B?aFp3eDN2SElpR2dPdG9Kc3ViSE1qVTB2V2hlMjNwbnkwMEcrL2tla2JKR2Nu?=
 =?utf-8?B?WlMrV0ttSHFwaUZXc1lWUWJia000UW9LRTBpVkVGMWRYWHBGQjF4c3RuZmE3?=
 =?utf-8?B?eDYyUk9IVTZweUJwY0lZMzdWclVsK3o0YmQ4S2NHb2t1cXlmNTJQcTN1Slk4?=
 =?utf-8?B?UEh0RG50ZWJmS05GRlNNTW9BN1N2NnB5WFo2U3d4NEl2WVZ4cjcxRnhFUUlB?=
 =?utf-8?B?TVBOWDZ2d2FaZmxEbGo5dVBDQURlRGZwY2tlSjROWFJxU0RZbjJ4bVlwdjV6?=
 =?utf-8?B?b0E3Ylp4MWNJUER4MXgxeFlWQUdtSnNBRmNyM2x6WUk1cXhsblRYQ3lCNjZx?=
 =?utf-8?B?QjhiclBEZWdyOHFHbW96YzFzNVJEdzhVWjdFcGJnNkRhM3RERERMZkx1WU93?=
 =?utf-8?B?ci85Z2d0R3l0NDMxdi9zOWtIeXlaQXlKcklRKzVmSkR3YVVVSWVMNnE3alEz?=
 =?utf-8?B?a01yUzBRdjJKR1VWNmNBU05pSWFHbUhLR3JCeGdOeDZFRzNHUUhxZk9aU29F?=
 =?utf-8?B?VVdwWTE1SlZkVE1KY0cvK2dYODZUc0JUTXdGVFV5MHNsM2Q0MkJrRmx3QWlu?=
 =?utf-8?B?bENjenVoM0g3N2FJaGd3d1B1a1FYQmUycS9Wd2lHSm04Vy9sVUhVNEQvcGJh?=
 =?utf-8?B?U3ZxQjlVMnlmYkQvWmNUa0h2WFFlRWZwb2hUUXRDczQ3dml2ejdkTVF0YWwx?=
 =?utf-8?B?UC8vZ2FPT3FpblFNbXFpR3hoMnFyWldFd1JzcHpsdWFpSVovTGxhemc4OU96?=
 =?utf-8?B?QXZNQzlTTzNDNDZiSjRhK3hnTzh6ZEFiVStkQVU3aW1zdUNIMzYxODRKMHdu?=
 =?utf-8?Q?PFIceQaANcOesRGxwEMlStpVvDCJWJlIm+Xgw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGxBamNiTi9CeGJwUytTWkY4UTlROUlZeVhpWkticmJ5RWEvTVF3K0RuSndN?=
 =?utf-8?B?K2M5cGhLbkxWYW94c200U29vWTlSamd5SXVnTktJZU9Kckx5VnpUWFJhcCtI?=
 =?utf-8?B?QytMMk40MWpTcXFNV0grVmZHeXFzbGpiNXZWdVNLTDcycHpUSmhhOWdQYnd3?=
 =?utf-8?B?MGZxU0dFSW5lWTNITnRvanZiWTJxbjRwY0lxRi9Od1hzU0VFbjNTaDJPL0Z4?=
 =?utf-8?B?L2R0MkNXb2QwZkhSaG84TU1aZXRlbnpyb3FrdG95YTU0a0hvSGVDY2pjY3BK?=
 =?utf-8?B?RWFWQ3dQdGJPRVhUaTZlR1BMWit0WWVOWTJGQ2FZTVlqcTZSUnNMRWZFMWJs?=
 =?utf-8?B?QkNMNTJvV05Kc1BOU0ZKZHVmNTMrOXBJNFVKc1RjTTBaQ0RjN1IxT0VKbzFr?=
 =?utf-8?B?U3JpQWlJWElyWU1CT3ZwTnFQc3Vrc0ttejlZbXRpc1VWQWpXTm45SUZRYmZE?=
 =?utf-8?B?emowaUFSVkdLRVRTTU5pQklVbjVhTjAyWUo1dnFOUGpQaGM1b1ZlRGhsY3Rq?=
 =?utf-8?B?TkhnY3NGdHZHTERsRkxaci9lY2NmMlJwdUxlZXB5WFh0NVBKdXl0SktUUDRu?=
 =?utf-8?B?NUhTUUFhQXNzMmp5d0xhb05Xb1Buekw1R0hDVHFTZ1dkeWh4bmxJUEZqd0Vn?=
 =?utf-8?B?U2VKODhlRlpOWms0LzFCVU5KbVpJbFgrc3Q1cklyQnR2WVQ5eVBLb2JGa3dZ?=
 =?utf-8?B?MXNPbGdUQnZmZklQdzlPdnNpS2hlVS9jZ3BBendmWEpFTFJHQ0xoSkJyS0xr?=
 =?utf-8?B?bURLMTByTkkybU9ZMldUNFB5T1lIV3dsQm8vVzFDbzdnWnJ0amZTOFhuNVFO?=
 =?utf-8?B?bmpNZ1NRcHp4ZzlsaGo4YUxIZUlYUjdwMnRUNHp4UmdncE90enZUVDNqZmpm?=
 =?utf-8?B?aEtnMFZJQkFobklGdXJ2cTJzRzBKdzM5czlVUHhyQ1ZmT2JnRkExUnRGUjM4?=
 =?utf-8?B?RG9RTXYxeGxlSUtjR1Z4dkp6NFlodDhFcXRlNVZWTkJsQVZxajNldkY4SndO?=
 =?utf-8?B?U2ZTdWk4bnRKWi9jOHhabkY3T3B1bVFZMTJ6aGcrdWdZTWJvMTZXV1hSRDVM?=
 =?utf-8?B?K3c4dHl6YnlBQ1JhaVlmREN1VHVXMEw4ZzNCaGYxb2JvdEFsY2dKcUlOcDBP?=
 =?utf-8?B?MFNDdXh5MnNPMUhscFBoQkpEc1ZFWU9RT01zZnlHcmcvN1JiU0JGV0N6VFZ5?=
 =?utf-8?B?YXlkY01UUkRycUpRbm56VThGdkU0bzd3MXd2WWRzYXo4UTlwVzZpNGRWQm1u?=
 =?utf-8?B?RXZ0U0tTVTlLZE1HMGZKclNPSWVIMTlSLzhqZmVLYTMzaXpmTU9nY1pnalBs?=
 =?utf-8?B?R0xMQUZ4MTNmbkNnZmNxRXNnMUVxVFVBNW9LOHJvcmZqQXp2SWg0N0hHYUJD?=
 =?utf-8?B?Uk9MUVRQaXc4OHArbmFadHg3Skc0Y1l3Rmxja1djWExGNDY5S1VwV1JvVW5m?=
 =?utf-8?B?UGFycGZ5QVJNZ2JOaHZqT1Eva2tLM2hSdXNHYVdhSVJiYXBRR0l5dWxVNWdE?=
 =?utf-8?B?ajhqQ0dsL1VZcTRHWFRjYlIzK3p1TGQwNCtqUVRpa0xZU05pZTlhTEllOTJt?=
 =?utf-8?B?UmdMWXZCOTI5U1NnVDA1RnNSb09tblJNQXlvRTVra2UvaG5vam1jZFVPQ05W?=
 =?utf-8?B?TzFOTmhkMDNCM3FGTG9hVXhIZmMrU2VBblNEY1JJemNVbE40OEVXS2wwNnpR?=
 =?utf-8?B?bFgzQmxHQUpMbE5wWHkvc2FRQ3RhZnFKeUZHRnJmUXRDQlRhU2Z5c05LV0pz?=
 =?utf-8?B?WEt2REN5ZnZ3WDMyVHhFZ1RZZ2lIL2V2bHROdVFPYmZFL3hDZFNFNVdlRWhq?=
 =?utf-8?B?OVZmY28yTE1BU29sNVBudGszY1hwdFRhWjd5eUxRQXM3dnR0ZzN2T0daTHFu?=
 =?utf-8?B?Z0x5TVZwdGtURll0WEs5eUUwcnl0NDBZSmpkK0llT29WdFlOTEhxVzYzaUN6?=
 =?utf-8?B?T0hlcXozVmlZelRrWTFmR2ZXWkhuSFJKby9la29xYjJlaUJlYkhiT01GcE9D?=
 =?utf-8?B?M0dva0YvWDhKMzA5L25sOHZvTEx2dnVqTk00ajZwZkxrWEQwZ2NHRUFrZU9s?=
 =?utf-8?B?MDIzenZNWDJYcXljMktHT2s0VnJzNnEwT2QrNXpRbEs3OEJnaEJMb21oMDFS?=
 =?utf-8?Q?D8uZu9IpP0ObR7Pcvzp67pHg7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <030FFF7829F79043BA590BA7E4CB0057@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3478bbe-4aa5-423b-8b44-08dc8c2fafb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:06:01.8581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0jOHmWoO5iSekMMTmvDwUjqhPEXgaG5SNjwUba7axTW7zYv6e7xTaUzesy8cpMK2ARQnIXKv+fWvNQX5O7mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7228
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.296000-8.000000
X-TMASE-MatchedRID: fgYTp5XatxYOwH4pD14DsPHkpkyUphL9X4GSJGyYc34E6M1YtcX6vHIu
	7Bbf4TXto5qw/iFKtvbzrL9jlOCHAYpsQeZV7e/esTcWkxuDrdIcZR50t08gUZsoi2XrUn/J+ZL
	5o+vRV7yhMIDkR/KfwI2j49Ftap9EOwBXM346/+zk7A0hRZdfWcWnLlSjL7qOayhrqw8PUufJ6D
	qCXQNFPA0c8VMY8DaU
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.296000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 85EA8A7E6AC1D591D1959A3A946056B5D117D9572B3094056252CE9887CF68E92000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_221610_716039_76539700 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, "sean@poorly.run" <sean@poorly.run>, "jason-ch.chen@mediatek.corp-partner.google.com" <jason-ch.chen@mediatek.corp-partner.google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU2V0IHRoZSBwbGFuZSBhbHBoYSBhY2NvcmRpbmcgdG8gRFJNIHBsYW5lIHBy
b3BlcnR5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwg
NiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4
IDE5MjNiYmQ5NjAxNC4uMjMxNmQ0YTZkY2E3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+IEBAIC00NTAsOCArNDUwLDEwIEBAIHZvaWQgbXRrX292bF9s
YXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCX0N
Cj4gIA0KPiAgCWNvbiA9IG92bF9mbXRfY29udmVydChvdmwsIGZtdCk7DQo+IC0JaWYgKHN0YXRl
LT5iYXNlLmZiICYmIHN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gLQkJY29u
IHw9IE9WTF9DT05fQUVOIHwgT1ZMX0NPTl9BTFBIQTsNCj4gKwlpZiAoc3RhdGUtPmJhc2UuZmIp
IHsNCj4gKwkJY29uIHw9IE9WTF9DT05fQUVOOw0KPiArCQljb24gfD0gc3RhdGUtPmJhc2UuYWxw
aGEgJiBPVkxfQ09OX0FMUEhBOw0KPiArCX0NCj4gIA0KPiAgCS8qIENPTlNUX0JMRCBtdXN0IGJl
IGVuYWJsZWQgZm9yIFhSR0IgZm9ybWF0cyBhbHRob3VnaCB0aGUgYWxwaGEgY2hhbm5lbA0KPiAg
CSAqIGNhbiBiZSBpZ25vcmVkLCBvciBPVkwgd2lsbCBzdGlsbCByZWFkIHRoZSB2YWx1ZSBmcm9t
IG1lbW9yeS4NCg==

