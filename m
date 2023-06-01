Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7989C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slspOEcEZhwvV0FaLzfI2KKvWoYkuXhN2FRLwMOQBHc=; b=efDBvgnRbgc9MYfIm98F0vGMiH
	1WA5/AeR8qYLsq39praucm0Yj8RTkkasI0M7CrcWtBs3WrhBH0p5NB5uSRCkvYWMSTjwDCIad3r6k
	y1TOP+p5o47tecubQ05gBjYDWHDO63A6UkzEbroq508af2oMS3TtrB6H57as9zWjqbqOxG7TO/kWT
	jjPGuG1j2VKqhwk9IH/h1LNa80dd9skha+lv6iHo5F76ZItdRmAVSWaDvPeLq4MlBdeygpdsCTFpF
	nzNlF0cVS9gRtmcDGBqLxHle4bG5/MSDcIPerT5cBzCVMxSDlLEymsaefT5/vFh4oyv9ohToHeBe5
	kmpL2zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f2J-002o2k-0Z;
	Thu, 01 Jun 2023 09:56:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4f2G-002o1g-18
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 09:56:01 +0000
X-UUID: 82650ee4006211ee83ed1395ce914268-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=slspOEcEZhwvV0FaLzfI2KKvWoYkuXhN2FRLwMOQBHc=;
	b=jXSVxuOVVBaeZMDjvaPnMDh3po1XTGWACnh7ZYPt8jUac93cMhVCMDDqds0SwbOKuEskcVMJnO3Ibf/r21aD4wS3mtQ7WxLf8NERgyPk6G68iqUl1abllpPiQIOvp7nSWkkYdv4iI3dkd4qKSUHLIWf3jh4026AkfTSl+Dlh3GQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:61d9b1fe-0f9c-4abe-8a23-1eda3121be73,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:10,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-META: VersionHash:d5b0ae3,CLOUDID:efa4103d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 82650ee4006211ee83ed1395ce914268-20230601
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197079173; Thu, 01 Jun 2023 02:55:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 17:45:55 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 17:45:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y03rZGgKOewSX6k8sfN4quRt6o63abqOgK/kby6fMxo4yJV1Z8XvCiY4asYD9Qy23oZdVRM/qeANLX3XsHHqmt1lbFNmtgI6VyDPnW7NEmrXA4yVaFwUHC0w6eVXgrXhziMLVLfY3hkgyZNh424C1Qzdfm7m8mD8nCQ/+Bz4jakq1462pdSqj63VeYUMFjk2tCFVHGhnzTQuMYQP41ho2MpmKi2nBDOAI3XTl2LLYSRuNwrqXe+x8gaxu3E7LXnaP2Zg7Gf5+UOpbGXUs5bHEFpFubmBosvSvcbur/bZy6SXxESmPx1nrlIJM3L+uLgu+WUgEM/hpbLHfSa3w5+v4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slspOEcEZhwvV0FaLzfI2KKvWoYkuXhN2FRLwMOQBHc=;
 b=d/d2Z0wje6yOEQ8DxMJxGwXzrcvP3XUJO1ZCvUWdlOObGJJK/OxyJkvqROfI2ovu2RcZ8ZViqcpmKOV1nfr4A/8zgy9z68Vo2s08y0FWXhDrpT2I1JP3w2Whi8WRbuHxHSxZe0psxCJolSLI+3t6aKdXGtEETDf/XmItXZZCloZL27+M1fo0chByt6+6lRmHnY8dtU2cAkwpv/vYnWq74KMzIgUPuyNIyWkOj9fdQ4jL8+RiIvb9+WTiCws5f/gpY11mZ9CWZcPUQXy1AU78psJUpPyeRX1zicwkU0oOP6pDgk/W/NvIKezyIYkuq5MqfYw/DNPkbFHyUN1lewVYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slspOEcEZhwvV0FaLzfI2KKvWoYkuXhN2FRLwMOQBHc=;
 b=EbX1W6c3LOSwPf1Af/FdAGGB76xRGjIXh/Ij1tN2HdNvqMN1oGi3FJ+uFDhrp0N61diLb/NzOKs/6DfVKPN+EPGZ7QkaPSZuBG4Smhi2gWClmkeOwbR7DW8BlAFPgM4h2WJm9PB8PvB2PeGYDRbPbbVzWl25Nld5zAUucBfKR2E=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by TYZPR03MB6956.apcprd03.prod.outlook.com (2603:1096:400:283::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 09:45:53 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 09:45:53 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] pull request: Update mt8195 SCP firmware to support hevc
Thread-Topic: [PATCH v3] pull request: Update mt8195 SCP firmware to support
 hevc
Thread-Index: AQHZlG3bTW3Ew5I/jEqX/cjI2IEkKQ==
Date: Thu, 1 Jun 2023 09:45:53 +0000
Message-ID: <eb84a05b47272bd97e08fbe9373c45a78b39e1bc.camel@mediatek.com>
References: <39201cca692b6fad77749bdc56d551c3aab9bc64.camel@mediatek.com>
In-Reply-To: <39201cca692b6fad77749bdc56d551c3aab9bc64.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|TYZPR03MB6956:EE_
x-ms-office365-filtering-correlation-id: 1616a99c-c8b8-48c6-8ee0-08db6284fd94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xhODjA5V5H62ThxgGm+BsfMFIIUQIyg3s7XllIf16t3/XYhyVEfAcsAgFxEJDnzAk1D8O84SgJkZn84LdAAd5hAsaw19XbktIJ+U87z1q9dKVqDaSxZQhGGBwOE9tmbibodlQrHyFGjjbKzS+38JOEecae3V1sPkJynW7EIBgf0Rck/uXwKJlU92075JEOX5Nky2UGuRcBJ4wOdu/wBSorIr91NuSWpu9o4RWXGhQmKRAcHAP3Uda2Tv4Qrq48a7wkm3d6mqGojy2WYG+4uSJOavd5SowBG7r75x03z5VC1NyCcpNQrF0wgeAHxH5wx9bndwaTZ61d1atddZz/SBUo/rRLjtCD2s8jGCLWqFGd4jlDCNWngO+9c3REfDmT8V/eQiEgbG3B061wYAYxgvLiZgCAnc6mWNr2JLVb6HCQy5xlwtzYo19/eUf8hIhj4a5LGjR6KQOp7D0dNfVE4P/Tjxw8ItG/5ibRLSe5E92dcStWC8EugrE/o5xA9VAUZt8VVS3Rd8iZsJeTNc0rcEzznC/b/6qgJaQhSlqqzW18gS51p3r+2WH3nq0+BrnTkrbqTIy1FV2/nRYv3GjPZNqPacjj0HpKX33MAGSbEK+Xdtd/TE6wdyvxxfu852zXMb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(54906003)(316002)(71200400001)(186003)(15650500001)(6486002)(2616005)(86362001)(41300700001)(83380400001)(478600001)(38070700005)(2906002)(4744005)(26005)(91956017)(66556008)(66476007)(66446008)(64756008)(966005)(66946007)(6916009)(76116006)(6506007)(6512007)(8676002)(85182001)(8936002)(122000001)(38100700002)(36756003)(5660300002)(4326008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWxoWXorWHZCTlhoWlg5Q25HZDVYMWgyQ2Z1UGNERVc5MGQwVStQcDFZN3pw?=
 =?utf-8?B?eHZIK3RMbDJGMTFQa0ZSQWl5Um9QYjk4dGlQRUJ5MG03WnNpL0lWSTFLeEM5?=
 =?utf-8?B?T2NCWkx2NFBSZ2swVlBaUlN4NHJvRUs1NlFKdkVtUGY2dzU1YTVJU2ZQd0Uv?=
 =?utf-8?B?dmNXVERoNktmT3JWTStUcmNESENJNTZpcTlMY29RZmJRZUZKanZkZEJpaC9K?=
 =?utf-8?B?SDFEd3RJSmtCdWJXT0RJMXN4Z2V5anU3UE5iVmJITFRRY2NCeDhuS2ozVWo5?=
 =?utf-8?B?RjN0aFZ1RUVGMVBFOVoyNXlILzd5dlBaY3RVTmV1czc2R3RQbnZMWldPc240?=
 =?utf-8?B?V2hmOVNGcGNsUC9xaXIzRUJxSHJqRmhONWJtRTFMSVpPYmJlWDhqK3lxUjY3?=
 =?utf-8?B?OUs5ck15MnZPaENGc2hPQkRoWUlUWklrajU0bVpHOGVhRnBCbzNNam9RQXNy?=
 =?utf-8?B?S3hrNSt4RVBHQ2c2UFpIdUFETmE2SFNOSEx5RkVUR25teFpYejBWalFhVDhw?=
 =?utf-8?B?Rkh5bm1wZHRSU1czTEp0bjFNWFVTbW1Ld1FNMkprTXVsYXNQeHBlSVkzODF4?=
 =?utf-8?B?Qy84c1JBYXR1NGk1U1dXMUltMXJyOE5tSEF1QXB3Uk41OTY2UnZlRnpwdits?=
 =?utf-8?B?ZjBnaC9Xc3NmWHlUeGFHQkFJeWV3WEN3RmtGck5EdUI3UmI0WmJVSFQvYUZu?=
 =?utf-8?B?UmtUVlp2MjJabjQ0anRKWUxEZ0xiNXVBcS8vS09vYnZseis0SGJtdFhLY0xG?=
 =?utf-8?B?ZjJha082NkIvMlA1bWdsclptQVBSRWtsTEo3UTNtTWpUNjNpRmFZQTJiUVVj?=
 =?utf-8?B?cXFVdUhBb3VHTnUzcFZwU2tHQ0F3c2psUWJ1dHBaRlNHekllYkd4c1JmbzBO?=
 =?utf-8?B?TDZ1Ykdnelhsdnk4K3NqYVVnU2EzNU1vdXhaMTNYRzN4Sk1GcHJpRExTNE11?=
 =?utf-8?B?QURxWXVEVVU3bm5Ma2JVbzlyOGhVUkJHWFpuV1BTTytQWDE3TWF5aERudjhD?=
 =?utf-8?B?VjFPMTNrUmVoOGlmd01CNWlDakQwZU1Vbk1qNVZpRlFlM2NEczNRMGc5dGQ0?=
 =?utf-8?B?Zkd0VVhOUlRqL2FFMkZ2V00rR1RGaVFwSnlYdHQrM2lkTFZzUjdWbGs3VXlX?=
 =?utf-8?B?bk9yMFUwUklZQXozQjZVQTVXZi96MVBudHBpR3poajREdFoxNlZpcGxVSnY4?=
 =?utf-8?B?MGJIM2d5THVGR0dxNWUxdlpNU3hRWWdGOHdrTnZyZm5SdkdoMkNHV3dTbmxM?=
 =?utf-8?B?dlpKU2dERzlPZEFpWG1pK2dvek9OcU54d2wzaENOa1V2YlBaKy80QzltQUJs?=
 =?utf-8?B?KzAvd0FrK0w0VE5CTmpJTXlkK3JZVGNuZE9iZ2V5TUYxQ1RyU0tvZzJWVmFW?=
 =?utf-8?B?dEJ4eTVQQzdGVGw2bzhlcDlKaENjdjBka2FGWnJzb1RXbStRdGRZTk81UnlF?=
 =?utf-8?B?bkFlTjJJNEs5RW1aeWpkWUt0RWQ0c1ExUUhWSmlhMWRNdGZ1SWtXQXRlaWVp?=
 =?utf-8?B?MTRNeVRUU2NVVUo4OUVOT3N5aXcxaEN1MUNiM2VLYUJidHpLZXVoR3lrZFFO?=
 =?utf-8?B?NTRMTzM4MUJvL3dQdkxxNlFtQUhrekhjQ05RTlpNYjNESy9pVHdJc3cyYzJX?=
 =?utf-8?B?SjdxNXdpeE10dkNIdXhrUmYzcjAvdXZaSXFQdmQ4Vi9aWWVnV3NOYnh6aWM0?=
 =?utf-8?B?elY3T1JkU2FPVzM2MTMweXZPZG9aSko0a21HMUlYbUNWaXBRV2tmYWZvSEZr?=
 =?utf-8?B?bFM4bzh6cll0M01oZ085VG92OGJ3TDdxRVlCcHFVanV1Ujcxc1JBZFpEOWNJ?=
 =?utf-8?B?MWx5UFJRTHBOVU5mSzVoczZsbEVJS2NMMHZoajI1SDFwOU5zWTVINnFZUmR0?=
 =?utf-8?B?MlhTeTFJbk1ldDdTYWIyNHd4Nk1WMUJKSjlJTEdkeU5YTVh5UFd1eDQrNm5L?=
 =?utf-8?B?UTFuMEVWNTJtamJWWk9FUHNaZnA3bFZpVXF4b2pFUS9MaXpFWitQNzVvU3pF?=
 =?utf-8?B?YXdWNVNxRVlQNkZJa3pMUGtQQzJIcWxoWEtqUjRaME10TWJRV21Zd2dJUFFm?=
 =?utf-8?B?R0lzQ3B5bWZlWG9LNDZUZW1GZ2ZVNFpuNWFGcTRQVjVQeHhSeEZ6cGtvQmtn?=
 =?utf-8?B?UUxDWHRxR1FyNmw0MzJjZSt0dVR3ZnloZTRHRmFFSzcrUFdFYVptNGN0ci94?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1C2DC2FB77C2F4EA8C0B1A5F31282BE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1616a99c-c8b8-48c6-8ee0-08db6284fd94
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 09:45:53.2584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFnZQKSvnYJWdY9aeJrDMiEMPdVfUfx1CqqsAuwGOz3+1YtQD63aJ0zvbmLArkFxh2kvb9a7ObDoaN8lAaJAu9YTVmiy6O001lH+sg4NfmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6956
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_025600_393564_AB2CCE77 
X-CRM114-Status: UNSURE (   8.83  )
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

SGksDQoNClRoaXMgaXMgdXNlZCB0byBhZGp1c3QgaGV2YyBoYXJkd2FyZSBkZWNvZGVyLg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55IGlzc3VlLCB0aGFuayB5b3UuDQoNCi0t
LQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQoxZjk2NjdlYmQ4ZTZhYWMy
M2JhYjhlOTViMGQ1NTUxODFkZDQzMmJhOg0KDQogIE1lcmdlIGJyYW5jaCAnZm9yLXVwc3RyZWFt
JyBvZiANCmh0dHA6Ly9naXQuY2hlbHNpby5uZXQvcHViL2dpdC9saW51eC1maXJtd2FyZSAoMjAy
My0wNS0zMCAwNzo0NjoyMA0KLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS95dW5mZWktbXRrL2xpbnV4X2Z3X3Nj
cCB2Mi4wLjIxNDc4DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KNzk1YWVhOTEx
ZjIyN2VjYmY4NDgxZDIyM2YzOWE1YjI4NTZkNDY2ZjoNCg0KICBtZWRpYXRlazogVXBkYXRlIG10
ODE5NSBTQ1AgZmlybXdhcmUgdG8gc3VwcG9ydCBoZXZjICgyMDIzLTA2LTAxDQoxNzo0MDo0MiAr
MDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWXVuZmVpIERvbmcgKDEpOg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0
ZSBtdDgxOTUgU0NQIGZpcm13YXJlIHRvIHN1cHBvcnQgaGV2Yw0KDQogV0hFTkNFICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0NCiBtZWRpYXRlay9tdDgxOTUvc2NwLmltZyB8IEJpbiA1ODc4Mjgg
LT4gNjM5NzAwIGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KDQotLS0NCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo=

