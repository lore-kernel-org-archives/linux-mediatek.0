Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E44BC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqFj2VRyjMKeT104gjJGFaFncv5CUmvRc+65GL0TWOE=; b=t1nG1O+Ie0M0wHiSV5ZZ8rSAi4
	AN9VnOZVeLWl4LyzCUS32kQUkceFPPg9NiB/SEzypWlCihditTZg6P6SpZeQOJW9WHUxJ8JxCxG++
	i3rhHpXXzn5rPhdSQDnLO2sl5q5EbWa4YLhapP99OX/cUkATizLU7p/PE03YpTS0wnTxnqKcfuh7B
	cJUxUr4o3QkB355xlZAQvXyIirx75j+M6E3h+lIM4Ucud1wyA0IhcXqJcRC+HNQ6421A7y0NlnFoO
	JhgDPNyX0O0omXos2XrHO7WcTTWGS7ira6BJbU8Fsp7EQn6r6mavSmEB/vX017cWkVJ5KS4EZhfu7
	sBQ6pITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYSH-00000008zGL-41yq;
	Fri, 08 Mar 2024 11:32:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYSE-00000008zDz-42Wz
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 11:32:00 +0000
X-UUID: 710dc73edd3f11eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vqFj2VRyjMKeT104gjJGFaFncv5CUmvRc+65GL0TWOE=;
	b=A4FkvWStFbBK15+7sJI0UVZQ21fvlIltyza8Kt6FZ4u8+SZStfI2E5iHIHCunst0pMg8uN7OSErNfFDGEiR4BQR17lLT3xmGvMwmbe5Wmzx9VnqVX2MIt/VTtSD3zC41v35awGCM7UxiRYPXNhXaemOMY3zJGGXTgO3V7SJn6Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:cb8e08fd-18eb-40b5-a69c-d78c156bbd93,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:8a7c4681-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 710dc73edd3f11eebe6b57d01cc416d2-20240308
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <flash.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 70819081; Fri, 08 Mar 2024 04:31:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 19:31:10 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 19:31:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/WGEAzUv+2lcLkrEPlDSD9bqD98IR+yL6orv2kmo17PvBpZ7CnWePeUUaHcrMhIK0y8tHk5CNPDzKEvXb/2HXJLityn6aml6PAYha/E6IbuKItjBd5joHGunDYrg4g/dmMyfd6hB7ayi98Fd5Mvz6rgxrd9pLnvnjUpBnEAYHVLmr6xx9ItW8c7YA3/tA0JlMyHIAwWes9021jw6Ao/DG67gTMqYiDqMzalAMlo3Hq2d+yvavo7gyczH3lyrblVJJFB2AXCH6e3O35j4k5APEP6IiYwWfFj4aaA82/IKoQf6BylAfnTZK5WobZAz+ZCi3A8D+Fgb30zVB8c2p1pXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqFj2VRyjMKeT104gjJGFaFncv5CUmvRc+65GL0TWOE=;
 b=iqPt1BWKJxOGESiBdLYQWAeniqapu9gHbDXXapS9pBCIoM+9AnnIeaRLLEkN52HQELmTYiC1EDOmZ1AvWB6NxDigbs5wAENSjcy1rQcceR2RsQG6JG8nTVXYTOBKp+3iI0QvXzw7FIYGUJkTBIJJsZNHM8ahINPGquW2BXcGkHgFTosGz53XmbUx0Ro8KD1bk/8VbuxOfPo4Pk+Vvsmdyv1JXOe7CjmcTA+K5OCQSWzl9uo5JvbWqyQziP2lpHzss876b1jsyGJyfmuha5jOBHmZN4p6n2Jm90nLxJi8SRAFDlL1plabvkQys7DanvvJNMPp0QWsudIb4+Y+qgxdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqFj2VRyjMKeT104gjJGFaFncv5CUmvRc+65GL0TWOE=;
 b=ehsbH7QKpaxtysoxJHEjTeMf/j8FhH6v16TgIQOVy0Q36cbqoJ5h04BrfKLPWKzRpT052rSfK/9T2cschw9A1INd+VH8TZ9/6/LjEp1vfQBHxgb10JJCWQP2jEGafoXdgNdHbsmQIwTrbuuLk5xWNxZxB/12UjYR3JNvGEhsmZA=
Received: from SG2PR03MB7279.apcprd03.prod.outlook.com (2603:1096:4:1d4::14)
 by SEYPR03MB9160.apcprd03.prod.outlook.com (2603:1096:101:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 11:31:08 +0000
Received: from SG2PR03MB7279.apcprd03.prod.outlook.com
 ([fe80::9a30:9de4:c31d:2bae]) by SG2PR03MB7279.apcprd03.prod.outlook.com
 ([fe80::9a30:9de4:c31d:2bae%7]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 11:31:07 +0000
From: =?utf-8?B?Rmxhc2ggTGl1ICjlionngrPlgrMp?= <Flash.Liu@mediatek.com>
To: "cristian.marussi@arm.com" <cristian.marussi@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?Q3lsZW4gWWFvICjlp5rnq4vkuIkp?= <cylen.yao@mediatek.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone
 on txdone_irq mode
Thread-Topic: [PATCH v2] firmware: arm_scmi: Avoid to call mbox_client_txdone
 on txdone_irq mode
Thread-Index: AQHaVPVIVsXO+7KbOka+qKoEb18oerD24yEAgAAb7gCAM3HsgIAAPC6AgABp4ICAAVWuAIAAQLAAgAFA5IA=
Date: Fri, 8 Mar 2024 11:31:07 +0000
Message-ID: <311c503006ae9f391676a826b66a316681f10ef4.camel@mediatek.com>
References: <20240201095754.25374-1-flash.liu@mediatek.com>
	 <ZbzKckIhn8HQv5pW@pluto>
	 <053cb4a2edfe576412942daed2f7055b2ba9e207.camel@mediatek.com>
	 <56e1b2f5adbca437a14b738e1c58a054f6302fcd.camel@mediatek.com>
	 <Zeg8F6VVaZtpmH8n@pluto> <ZeiU5_k7s-31A93h@pluto>
	 <c6a24e4c9b97b8a47a822fb4fcbc4b955ac5fbc5.camel@mediatek.com>
	 <ZenpykCOYjsH_sdd@pluto>
In-Reply-To: <ZenpykCOYjsH_sdd@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB7279:EE_|SEYPR03MB9160:EE_
x-ms-office365-filtering-correlation-id: 7440dd65-e086-4f0c-54c0-08dc3f633f42
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/xTw4HdapdGewOxaPNdJlUOkPQhUeCGSxt6YMISkgIU+yNkWzTetQexXbY8lVJ+OfmmfW95U+UmU0qNUQV8W5DfL9XCC+IBVRJh1VKjyWuYktlYe7rqYW2dGp48/sHsaIFkjpSN/85AZ//cG1e2YWBhEKvCI0vnqlJM/60SXuk6RjmA5SdIfksQ1DAIX6OR0E5CzXMipicoztfQ0UJbjCco/nTxqeC/F1K6RCl0MoIE53xn5to2mjju9K+s/3Dh7mAN/KuRJPnOuMB/3xH06SxS6F79NrrlWbDt7rQHdpSXdESkYQQ9GBOEVV9APKz7aTvw7+Axll1XmdLNL+S63IE3a3vHq/n+UxIQ+uOwClq75AybKNvVy4Ik7ADxcsqiWqGOinqYg/WEG7Nxio7fOUuJxBR7baetEjNLAY48Mn6oycIFxk79zYR2HowvUWuCy7MII75SzAm+ZzMQ5mLQamHlKpzWnDQ2SfFURvMmLIdW64bMqThduTECt3i61GMUMvqtZu60N4ujkXhXjNDUh9HeucvACIz/NhmrzMVHu8YxFzBh8XC+9f53BQWyy2n1dmvzh8pc3XFaGcRdA12uRC883kU/IpUKxqYEJbWK/gWBlOnufxwNpW5BN0vSSHgaFM3zXu6581R4f+TEuwp6BFAlIQR9SggHwq3T93UbIH1/FeLrShPCGv3DtJPTM+LfCvitp4rWVsY4wvriNyZz8/pIgCY0Vq5PPVwbJXj85oo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB7279.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTJWWmFUaGU4MDU4RWNNcTR1WVhwMnhiL1c2TjhBTUc3VVdsTVN6ZUx0STVC?=
 =?utf-8?B?Mmhnczg0M1VyRTRZVldOVW9lc2VXbVlYaWhJTlpzdGpnSzVWMFJLTXdERk95?=
 =?utf-8?B?LzJaZFZwU1lMdWF6ei9ldm5OVDNPdzdHMmpEUC9xZFV5Q1NhVFNYa05rcEhG?=
 =?utf-8?B?TTVOaGlKa2ZkQWJtUWFUUlR0Z1QweEhPaVpjOTZhK1g0OU1wY0U4Mk80T3NN?=
 =?utf-8?B?T29ManFmb3NrbmwyWFJPTHU5OU9GMmtaamQ2OXB1RkQ0Q1NmaUNyazJGRnRj?=
 =?utf-8?B?NEJkMlovbEFwZjgyNk8wNTZRRk56bEdmYWdRaEFiV0xWRWVoWFNVaWIrV1RH?=
 =?utf-8?B?cnFXVEtpeFpLRy9pbmV1SGdjOXE3SXRYektGM2xIWUhHQUxYUldGeWRVeDBw?=
 =?utf-8?B?VFlBU1BKekNPTjZPTTNSV0NDdmxHelJnTFFFcEVkSWhMVWFFL0VBcFNsTmhL?=
 =?utf-8?B?dlg5NmtkY2xYMk55VWxiR29QdytSWVErcHhGMGVYSkw1MkRmMG5JTjhGb2Zz?=
 =?utf-8?B?WUVjTDJIUFYrekphT1dOajVnaGg2ZVVEMlZKVlBMMjV5MFl1VUw5dkluaVFq?=
 =?utf-8?B?emlzb05mUkZnR0Izelg3RjUzREpFK09UTmo0TmhIUnFQWi9QZWI2b1lZWm9s?=
 =?utf-8?B?dXpKbE9ZKzc2alRkQ1FRTytVelIyMDdxYmlmTFF3NUdjOXN3RTd1UURiMXV3?=
 =?utf-8?B?Tlg3V1ZGRFBKbVpUQ0NSUkFrUzc5UmhhRHpCbGdzVUVESU5DYWNZOG1wbnZu?=
 =?utf-8?B?TzlFZTlvVWxVSjYvYUY3YWtPYjFpU2xnK2dJOEZjeWRWbzRUaFA5Y0FMSSsv?=
 =?utf-8?B?NFB1RlpXN1VHOWJzNjRtVTZCYVc3TXJ5N1lYNjl1eXVrYVBaMnZ4Zlc2dEFG?=
 =?utf-8?B?L3ZiRVgxZllmSmcybkEwZHJQLzNmK1l5T1BMSFVyZWpxQVJQcDJ0WEszS0RI?=
 =?utf-8?B?RzJLRm9aMTFrQ0ExckMwRnZzNnM0aTRYdEtob1ZjSEVDVWlRNWRxbjNRcHYx?=
 =?utf-8?B?WkE1SjNKMisxZ2tyMVU3eGlETzhrU05lWHVUUFQzcEYzMGZreTVGMVZocGV4?=
 =?utf-8?B?OXhVYnF2OUZXREZTUXdYYWlsQ0xpYzFJVktYQUNiQ0pJd3hJR3l5dXhFbVo1?=
 =?utf-8?B?dERlamxyRzM4L1M1L1dyYmJiVi9ibGdmcUhRVld4QUNUNk5TMDVaQkxTdHdG?=
 =?utf-8?B?NDVINTg3dkt4bTZES3hHYW1UUEpxWnI0clV5ODRnZlNQSVBpQXlNdWdWZHdh?=
 =?utf-8?B?bE9OMU5Fa0V5MTJRYS9kZ2w4RFlpSXVOQ3JhQWMwVVVGZXJ0d1UxbjFDS3FN?=
 =?utf-8?B?azdFeWRWenlDZ2hmYmFHQVJaK0E0UWRPUS9ETTVFNXJLZ0dTOXNNTFlGbzhW?=
 =?utf-8?B?YUdYK1AyWTVYd011T0pXSTVoYmthKzdsTWl5ckFSbllnQjBvTzM1c1hwRjlB?=
 =?utf-8?B?YndlSzRSNG5Gak1BK09SM2JjU09Ra1F0ajRvSmlLcmdqSFAyVFh4ZFdkdUR4?=
 =?utf-8?B?YUdhd2RLV3JOejVNYmpSMlc5ZEtnQUtwQ1dmNGdsQlhYTlpTQ3Z3azJ3ZVdI?=
 =?utf-8?B?UDZWVjJXK2p3YnFkTmpwZjl0WUVMUlVQLysvNEorUHNKUGRHOFY5bDBKM09L?=
 =?utf-8?B?RTk2eWRXazNtNnFsUVVJWDZYRDAvNmQzZEpHNi9tL0hGWHhiQ2g5Z0xZU1ZN?=
 =?utf-8?B?UEJCd2F1MzJGenE4WUtERkpSUUJveU9iYUY4R2xOcHZRTnV6eVdsdEhmUG9y?=
 =?utf-8?B?OWhLd3hFU1FoNjZCbER4TWVtVXdmaGxGSGxkTWVacGVZelJBV2N4azhNT3JL?=
 =?utf-8?B?N2Q3MElhUUs4ZERtTjMyNFNZSFhNTjViZDNzT0IvaGU3SjJrYWdXWjdsSEhz?=
 =?utf-8?B?c1FSTkpwNGwvcmkyNitac0ZNN3lPcU9jbCtlYVV6L1FMOTBhWXdKcEU4a281?=
 =?utf-8?B?US83bVZFMFd6V29JVGFSL1Z2VWFBVkdUVVhDdFlaa0N2L3FDR3BKdWhRZEFk?=
 =?utf-8?B?Q3RDdi95MnNXakZXSURTSmlyWk9VMU1wN2t0UEduL2F6eDcvWE9NcWlUejhG?=
 =?utf-8?B?RHhMMUR4VHRaaU5MWE1Udzl0dkJnRGFDenMrNUFsR1loSm5rVzU2K1IxMGw3?=
 =?utf-8?B?eU1kSWc4K01nOGcrVUVaOXRsVWlJVlhUcjVUTU1lSWdjOENTVEdISzlFdlYv?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D834A1E293B2344B7440E5C8E9D4081@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB7279.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7440dd65-e086-4f0c-54c0-08dc3f633f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:31:07.4757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoiPSjQFxFRqj1urAfd6GjEk800Y4rJqTfZWJ32kWpFIAFATCTIY/sWFPeENfNpIkv3toBs1JL4D+zFF9obA2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9160
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.124300-8.000000
X-TMASE-MatchedRID: lywBov0pR43UL3YCMmnG4lIwtTtvyT1CYM9jZ5ImeacM74Nf6tTB9ig1
	DFhgvAGAnlZVZPpwOQYUAF4uBmvRkUL9tcyTZdAsgxsfzkNRlfK4RQHJd9TWWxc1VYCQdRfIPhh
	qRWZ33iTdB/CxWTRRu+rAZ8KTspSzMUDkNN5sTYQjRBz3OQQU6Syae5a31JCII+Faks4nxbtVEe
	CSVh+O6D1cZVEz9xqDuwJbEW/0O1kKGJT5z//E/xZbWJX9wv4jQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.124300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0A110F25CF6CB43FB6EE400769A3D4AE123EF510BF6F684F10D4ACF02A0860DF2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_033159_026090_02EE20FA 
X-CRM114-Status: UNSURE (   5.11  )
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

SGkgQ3Jpc3RpYW4sIA0KDQpHb3QgaXQuIEl0IG1heSBjb250YWluIGRpZmZlcmVuY2UgYXQgTUJP
WCBkZXNpZ24sIHNob3VsZCBhY2NvbXBsaXNoIHRoZQ0KdHJhbnNhY3Rpb24gb24gU0NNSSBjbGll
bnQuIFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0KUGluLUNodWFuDQo=

