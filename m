Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BDDC10F04
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5OLNgZnGo/jp7wX6+DFB837YxiliGglWfGa4LcsA6c=; b=t74fC4L0O52O7sAqlT0IN0PV3M
	2PutZ0+MaXp+qsqPsZc+qXO+jGv6mRJm0tr3X9nbu+7PBzRfoEB9OvGWPTBsNxvkiJF1nWqybu6nM
	7jloJrkLayU3xuvJYgaaZPpBlH0eERtD0P7yQj0cxnUAxGxhIpXjGsLRmUordYU2SmZnPgfbMEZJ7
	VY/y1+3+8lZtoG03EGd0kbHkxnGPvgi5Nd0t6qLLsh/BoLRmwghcPMWsCYr8Q0eHulkV5CDU8lu5l
	sZ/RMxGnszy5TP7Dg0aEg0Y9G+QNHFv2yezkv39vGuX+RwSgOabdASM4guuDUMIKOX7oFfeUcnH1M
	ktQ41D9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ysR-00CyDr-2C;
	Fri, 01 Dec 2023 08:27:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ysO-00CyCF-0I;
	Fri, 01 Dec 2023 08:27:57 +0000
X-UUID: 842c2770902311ee9b7791016c24628a-20231201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=S5OLNgZnGo/jp7wX6+DFB837YxiliGglWfGa4LcsA6c=;
	b=SSXqaLXEFZtcyqFY9d3DYiUhlolFuzbJINHpQ4awaHVZAxw3nG01+4fvBDbcFlBdUqqW8c56g/y+Z68aw0Oyt8q54gLgiETeAsEA7plqcn+ABtMQN0SPO6vpyY2Krtv5FQiNCDqCj7eAYF4xo1p9R8rfteaqtu97ZcXXxSfcpng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:cd59978e-46f6-4e9e-a828-388573d591be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:3aaa0896-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 842c2770902311ee9b7791016c24628a-20231201
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1205313394; Fri, 01 Dec 2023 01:27:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Dec 2023 16:27:15 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Dec 2023 16:27:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvhfWoalEOUsnvuCfZboM+GbEhxuXlwyRCmDdlL0J8mEZS5nHyWTCyzfN8jQ/Fah6DN59iL5dT4aeeqXifOogmGQ9vMBHQoJvGSFPtmQPiQcxgMnBHg43LWquLFHAcipbPWMXDTyzqyiQfLWDsF/SfVL0fGRwiLYJB0lbOO8h0dJwCFBWucQz8GjvgvuaWBgsdcJgKa4x1lU+GV41rCw4TXT0B/JLlleCDWTppsFlVEBHUNGmt8gCB5Lg/kBRhs4VHjQdU1fHIt098P5IMJZCycmMt4KECrRIvyUNqUYhpiXwWmEGglMoPRn8vYn247n3Q4JImNXviFB2AbaQtFRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5OLNgZnGo/jp7wX6+DFB837YxiliGglWfGa4LcsA6c=;
 b=f7/rs5xZPBepGnqZ2TJ8aMxQdCLiZwTdJXfDGTyjzFPr34lL6uPrwzS4u1uhnfS/0uW+0YcoT+1edusxBDHtUDUR8uK3b8T0txZ5Y4kP0+2sI+DHft4Lef31VhKXzLh443PJc8B3KV4SoROQW6Nw5mkwCL10JtHGeorQd6AXIctudRwElatm/L8o2wut7tJm2NsRI3lIbq67QD0JCWoEyLiBV/O+zoJQIzzHi6jFJHG08wM8VSj0+4qySAsPcmXA1US3HOepxZD0wczPGEFcVFbqXA/tbruZP1/iqpVnEKXdro2izcTpZO93l6gTPV0hwF7k9I6ZMN+FV6hh48JdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5OLNgZnGo/jp7wX6+DFB837YxiliGglWfGa4LcsA6c=;
 b=VKhVqq/bly0LT35DlJMudjXv7AO/wfZhE8C+EVPTXOGooNuSBOU0Lg2udCK8WeJ+0XjS3fvKZ0OCCM+o+UcwuEYCy8gdtVynxd5vba4n6HJfD9DD2T0si3TkG4eMqHCg9UyEWM8c6LUTi5oblITFnnMJgMZv/+RX27TyONZRT4Y=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8019.apcprd03.prod.outlook.com (2603:1096:400:45b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Fri, 1 Dec
 2023 08:27:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 08:27:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrCUIvaA
Date: Fri, 1 Dec 2023 08:27:13 +0000
Message-ID: <4c15da9e5563bf6f3813f4b86421271070a286a5.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8019:EE_
x-ms-office365-filtering-correlation-id: 6d330ff6-286c-41a6-136a-08dbf247522a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMjPoxTvIeveCk0ZkKeYkm7+VLslK4+xItRt5rE2jsdtUNPhiGJ8h7UqMZrwPJyN28TKYXbwHfEbd/+InyBPvwBUwiEMKK5BrS04wFVkLYMSFas739kpk7zn2C5qoJR9a+dYftEyu7okkbJo+93Goo61xnHh4g2C51+1cr1z9j8YwAejXZrQnBW7xNRQALL3GpXA4V8cxRMUjWCF9TgAKeWWgp1Mt0ydyqZ4hRWG6huZMxFboIFtw+IRU198YWoz/kxS9c0FbCtE7YEDx8WdCXrawG4dL4OPU8UBO5i0c3jw7OIwlMljonIM+ODPC7bEMeHhpHnVjXz73kWJdmDGJ5oYm5vAD19z03CpREbd1j/gqVYRcXOP7q89LeH9o4C0FSd4Y3c9jgM83KxRS3jDWaw5SwSUM+9LUmYfUqPWdgC4fULW75Ons3+3X0GZ5zsLC+FIEM7Zn2tvXgcF8yx7Odu2UhP8duRx6feUiyeQorz+N+VexCwRCtDmsU5iUN2cOOUsXgjzkS/sOeoet7emaaaYVFUfN2c2657me6yBBZCDhtHfYtrdTfMOJL0yF5XypTFc7CEf0ww5V4XonLT2hg2ct9xYPEh7YpcqmN76KBVIHgoMOYEoi2OClfq0vFpQJyveW9zlBZV+KD2vVmskxqT87XBAh3DOZA1Qy5KrsAI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(2906002)(38070700009)(85182001)(122000001)(41300700001)(5660300002)(7416002)(86362001)(71200400001)(83380400001)(2616005)(6506007)(4001150100001)(107886003)(38100700002)(36756003)(66446008)(54906003)(6512007)(110136005)(316002)(478600001)(64756008)(66556008)(76116006)(8936002)(4326008)(66946007)(6486002)(66476007)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmFDNEtSZlluTngvcHlCZGE3QmhLOWRjSHJKQ3pYRkZiYWhkSlNRajVNWUQ1?=
 =?utf-8?B?Ump6alRnVUZ2M05TRFNSZXVzemtYVHlwNGMrZU5UOXdpc0l4UVZRWXRBTzlL?=
 =?utf-8?B?eWVEZXpjMVFmUFBhUmVLYlFWLzUyTnhvT0lBMzdvd3pscXQ1dER5SXJLenBZ?=
 =?utf-8?B?RkV3MWdCYWVkSHZqaThRZzJkbkxwZlNVRUdSVjJ1UklaekZhdTFRRHRjcHJL?=
 =?utf-8?B?STYrcnI3Mm9hYnIzMmlNYkxyR1lRMytFMncwRHZjQXZLSXVPdEpTYU9CcGky?=
 =?utf-8?B?bk5DRlNzMU1zM1RBZi9maWw0aVhaLy9WREVVbEZ4ekQxQ2xNK09HM0lMSi9L?=
 =?utf-8?B?NmNFUk5CakJETmNkLy9mdERRZUtGeld1Q1NwVU1aUzBFV3k3VEYwSVdobEJX?=
 =?utf-8?B?aWNQRkpSMlV6SjhhUFdOVmFpRnhUVDN4QVhUVURPUlVJOFlwVzZacHBOZ1V2?=
 =?utf-8?B?bEo2bnMxbmc0cmJBQTRnYlVpZlNmV25TalFBM0NKT1ZCSTUxTmk4U1poaW1T?=
 =?utf-8?B?STJFNzZhTGtiRUJod0Jzb3dXM2Y5bWpnNldlZEkwNFJCRjJZY3hrSk9DakNI?=
 =?utf-8?B?aWdxUk9Xc3JZMmdMZzMxMnJNMjdoVGlVcjFMcjNhb0tMRUwrczRXbC9PQ2xQ?=
 =?utf-8?B?T1EvWVpvSlRiMXFMNE5idWlnaWdVWEdvN3VxZ2RlOVJmNEp1ZTQ2QkNCY3Ev?=
 =?utf-8?B?ZGk0ODJMbElCdDBjMXk5ZVV0cjFBVzFsb3V6aWRDeXJPNXBrRFp3V2g1UjFW?=
 =?utf-8?B?N1ppR1hWRWhwL2loOGVUVnRzeWwzYnNsVW1xTFVDQ2crdTBhbjZ3VmhHVG94?=
 =?utf-8?B?S24rblZmZXJWMVJkSHpjOFdxMnNzZTF6NHpzYUlpYWRnQk1rTHZ4cWMyTU5s?=
 =?utf-8?B?cHF5cVUrb1Q1MzdSRU1MYjd4VFRUbi9vbGgyN0JTcE9remdsR2J5TWdKQk56?=
 =?utf-8?B?UGdGZjdndVNsVDB6T3hxTXpGRXE5eG9GNnhkVUlWcFpjVkdmTU9hTUZGNWZ1?=
 =?utf-8?B?cFZlb0tBL1Q1TDlaY1JjOTFLWTN5dGJhQzk2MlljSHNjVERtSjNMSDlJaHB0?=
 =?utf-8?B?c2w0a241QVlBR3dSNjVIVTV2WmZTSjA3ZnhGb1BnRkpvRjdhdEQ2NWkzR2pz?=
 =?utf-8?B?QWd4U0VwSU9PMWFMOHNEUENXM1YrRkRJTG1sc2ZydDBxcXY5Kys5ZkN6Z0pK?=
 =?utf-8?B?a3p5a1VwSGJsNGlGa3pXK0VEeDFZLzhyblFCUkJYNlV5SGxtbWVrMkM5c29S?=
 =?utf-8?B?eXhPdHYzYlF5UnFGcEhKcHAvRjYxcnNpekhJbGM5RmdWMGZlSm5HV2RESXBY?=
 =?utf-8?B?bDIxNFhKMkR4dFFFenl0b1lYaDhTTmluRVRVN2RDdnNCVVl2YWdSNlpIckUv?=
 =?utf-8?B?ZGp5TlIyQTZGb0JmQVplaE1udTJVQzVVNzRuL0RHeTBaUDh4WktuU2FHTmRW?=
 =?utf-8?B?aTZMdU5YdVNEZDdHbytWZFlXVzlxRkJYYWRTU2Zwc21EOG1xRlp5cklDNFRF?=
 =?utf-8?B?dmI4OEpLeUNPSk02dG9oU1dWSE5sM1dHYStCMFFVWnRDeUJTb1pDcFJCMElU?=
 =?utf-8?B?b3FLdEMvYlo3enBOUEdnbE1BclRnYjhnRE9HeEhpWTZwd0JYbW1QcmtBdG9J?=
 =?utf-8?B?NFk2QXRyZ0Z1U2dYUTVlNTVXbDZNdk5FYThPTGxGZlFsNmNuNEU1aUFVZjRy?=
 =?utf-8?B?SjgrN3lCa3UrN3RJbUIvMHl5NmJnSHVYazYvaytha1pQbFpxSUQ3SmJsTnJU?=
 =?utf-8?B?NTgvZHNhR2NESnh5YUkyai84bmN3VVdWTVNuY21DcGFCdU1TZWR2cGtFK3ZE?=
 =?utf-8?B?VkJlODkyUGdFMnlITU1lbTJKS01BNGxIQVFrNjQ1VUlyYkFlZnR4d1Yzeml3?=
 =?utf-8?B?aVdmeFNScVF6L2lwZGNHeVBLVnV5bCtIWUhyZDZzUURXSExQRHd0VGUwd3BH?=
 =?utf-8?B?Yi84bFNQeW9iNzRXSVRZcmt0SUNTbVBHa2ZwaCtlS3JaQk1GbFdUQkpibGZx?=
 =?utf-8?B?QkhGQ3hYVnRwSXlOU3JDNFZFVnZzV0JQUG9oYkxiTjNvOGNzR0NXZGg0dkpr?=
 =?utf-8?B?eExzdTNWbVhoZklzbktId25hRUx3cndjZzNtQVdEd0NaMUtoQ2dzekpKQ3l3?=
 =?utf-8?Q?2MdhepZ59TzaoJBCC/MvCoWVk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B68677E5BAFC7143BCBE42EFC49D7586@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d330ff6-286c-41a6-136a-08dbf247522a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 08:27:13.8015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWYBfe8BfZOlQUiRRTJyrkKOCV1KpfrgYHvjVaLgPrVyC42heRCwFahCRohZSAbFt9LSxVuF7clKF9RcGnDOWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8019
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.419800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdTPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxcKZwALwMGs8uj
	Rkt05a7cM2MQQW7DL3g8k4gl2fH45OhKL24lXrDJliwpJdZauwe7nrAU9KQxUU4K0IMk2m3GHGZ
	S31pD0K0vQVE0yOGFpa/wf22xUwTu9A9EfhuU0xyiAZ3zAhQYgpl/lu28zzkBp2ulO+HtPqgB1a
	3m44L+EuLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge7qymmwtxvvlwN9L
	CGATJfbxqfDd7tBN0Aix5lasa3AJpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.419800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 215E6A5031505460CE03A2E157CEA5BB437353259F6859FA9A22B5AF3B416E8D2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_002756_138994_A4807DFA 
X-CRM114-Status: GOOD (  15.57  )
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

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtpbnQgdGVlX2hkY3BfZW5hYmxlX2VuY3J5
cHQoc3RydWN0IG10a19oZGNwX2luZm8gKmhkY3BfaW5mbywgYm9vbA0KPiBlbmFibGUsIHU4IHZl
cnNpb24pDQo+ICt7DQo+ICsJaW50IHJjOw0KPiArCXN0cnVjdCBkcF90ZWVfcHJpdmF0ZSAqZHBf
dGVlX3ByaXYgPSBoZGNwX2luZm8tPmdfZHBfdGVlX3ByaXY7DQo+ICsJc3RydWN0IHRjaV90ICp0
Y2kgPSAoc3RydWN0IHRjaV90ICopZHBfdGVlX3ByaXYtPnNobS0+a2FkZHI7DQo+ICsJdTggKnNo
YXJlX2J1ZmZlciA9ICh1OCAqKWRwX3RlZV9wcml2LT5zaG0tPmthZGRyOw0KPiArDQo+ICsJLyog
Q29weSBwYXJhbWV0ZXJzICovDQo+ICsJbWVtc2V0KHRjaSwgMCwgVENJX0xFTkdUSCk7DQoNCllv
dSBkb24ndCBuZWVkIHRvIGNsZWFyIHRoaXMgc3RydWN0dXJlLiBUaGUgZmllbGQgeW91IGRvIG5v
dCB3cml0ZSBpbg0KdGhpcyBjb21tYW5kIHdvdWxkIG5vdCBiZSBhY2Nlc3MgaW4gdGVlLiBTbyBp
dCdzIG5vdCBuZWNlc3NhcnkgdG8gY2xlYXINCnRoZSBmaWVsZCB0aGF0IGRvZXMgbm90IHdyaXRl
IGluIHRoaXMgY29tbWFuZC4NCg0KPiArCXRjaS0+Y29tbWFuZF9pZCA9IENNRF9FTkFCTEVfRU5D
UllQVDsNCj4gKwlpZiAoZW5hYmxlKQ0KPiArCQl0Y2ktPmNtZF9ib2R5LmNtZF9oZGNwX3dyaXRl
X3ZhbC50eXBlID0NCj4gVFlQRV9IRENQX0VOQUJMRV9FTkNSWVBUOw0KPiArCWVsc2UNCj4gKwkJ
dGNpLT5jbWRfYm9keS5jbWRfaGRjcF93cml0ZV92YWwudHlwZSA9DQo+IFRZUEVfSERDUF9ESVNB
QkxFX0VOQ1JZUFQ7DQo+ICsNCj4gKwkvKiBTZXQgSERDUCB2ZXJzaW9uIHN1cHBvcnR0ZWQgYnkg
ZGV2aWNlICovDQo+ICsJdGNpLT5jbWRfYm9keS5jbWRfaGRjcF93cml0ZV92YWwubGVuID0gMTsN
Cj4gKwltZW1zZXQoc2hhcmVfYnVmZmVyICsgVENJX0xFTkdUSCwgdmVyc2lvbiwgMSk7DQoNCkl0
J3Mgd2VpcmQgdGhhdCBzb21lIGRhdGEgaW4gdGhlIHJhbmdlIG9mIHNoYXJlX2J1ZmZlciArIDAg
fg0Kc2hhcmVfYnVmZmVyICsgVENJX0xFTkdUSCAtIDEsIGFuZCBzb21lIGRhdGEgaXMgYWZ0ZXIg
c2hhcmVfYnVmZmVyICsNClRDSV9MRU5HVEguIERvIG5vdCBzZXBhcmF0ZSB0aGVtIGFuZCBjb2Rl
IHdvdWxkIGJlIG1vcmUgY2xlYXIuDQoNClJlZ2FyZHMsDQpDSw0KDQoNCg0KPiArDQo+ICsJcmMg
PSBkcF90ZWVfb3Bfc2VuZChkcF90ZWVfcHJpdiwgKHU4ICopdGNpLCBUQ0lfTEVOR1RIICsgMSwN
Cj4gQ01EX0VOQUJMRV9FTkNSWVBUKTsNCj4gKwlpZiAocmMgIT0gMCkgew0KPiArCQlUTENFUlIo
InRlZV9vcF9zZW5kIGZhaWxlZCwgZXJyb3I9JXhcbiIsIHJjKTsNCj4gKwkJcmV0dXJuIHJjOw0K
PiArCX0NCj4gKw0KPiArCXJldHVybiByYzsNCj4gK30NCj4gKw0K

