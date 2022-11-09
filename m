Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE10C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74pIzbBDaHGp7+VwODr88Q8LaK6aePRBgkMlUVYS/ic=; b=fsQ58TI3FE9tSkSiEbwL+LaULK
	2sVkaH0fTKQDuEFaoMy4REofKGJeqsVPcirSdoh648NqNWPopoVGc352tsBuoXReev8mP2Hi3vDkl
	MrpFwPFcCjxRUwOG1LaDWkvCPNsj6AnG5DLbilehPTL1WWvRrbhyDMJK0RSr+9yCfDNCo/zMjDQ4H
	2YhTnatUxXGihpd4qWLlP1evj+jWYMdTZ40b+9YGPTohc4hHwNIVrPQvsqRS2ZPba8/v5/7B6Ob0D
	CpPZ7c/e1wW1/JVOJZpOnKK/huS9cishMkPA+8G0XuzkYw9Ch8P1OZAgpmFz76AQtihaOEgvJ/b1X
	7M2QwdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osknM-00Dbzg-HW; Wed, 09 Nov 2022 13:07:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osknJ-00Dbyk-Fd
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 13:07:07 +0000
X-UUID: 74d2990010c44d209a2fa899ab43fbd2-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=74pIzbBDaHGp7+VwODr88Q8LaK6aePRBgkMlUVYS/ic=;
	b=ITVPUoQ3lYO9F764qus2mC6WN1sn6VGk8wlm7ezI5zgBHTbmDPGf+18OU2CqUPqo9P47eV3G+imDygkLoxWfRhsWYTBbviPZ1M8LGz4A4gKtzfaxVIvgNSHSKtsbLkthrA/BIWquVdq7FMB9nmq8x+kOfYYfft6Zg44ysv7JJGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:81348abb-6077-4a71-82b3-4cb46af0a918,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:9ea5ca85-088c-4756-8f76-577be701e693,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 74d2990010c44d209a2fa899ab43fbd2-20221109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1366362349; Wed, 09 Nov 2022 06:06:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 9 Nov 2022 20:46:54 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 9 Nov 2022 20:46:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl+9oOPCZuCv74+vEcgFWQR7uXrpb8nSdfnF9cLocBd42pFk9gpNYNigweNerYQqZGsB6ovfrq0HIFTu/2RXq8T5a6uuEkNsOwgiQKVsauxI1qlEf700r6F/UoTuIXsCnxsu1JFq2aKgysuJANE+ezYTBl1zHRP/NsSFODZ+y/EYwzAmKzZYyQfCPrdFvq0WkPNeuufdolHw4py0V5QZIp73XRwcgv/2UQXrohcHn0GPUwz2Ecl6eFlZJlE7swH7N4MVofpp7obl2C4LHkHJcs9iT0TsePlWrs1iNhKz4/PStWO6p9AZdLEqoCdUVJP2tS7UAtGV9QkiJjqnlGCfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74pIzbBDaHGp7+VwODr88Q8LaK6aePRBgkMlUVYS/ic=;
 b=H8VFYbdh30KDpVVIeQrcSUESmRzZ1ICWPKdUW3fbDACvOGH8n5TAdBRPehu/GGg5gZ4NTqSxVdG3Ja8rJV52P0LS+NzBq1Fv0ZBFpKoTAUiQaAyQI2O5AF2CSkHYvyJZifFbtivXh8r/K1kPCNp+k4Mb/4AmsmvhweZcm18mzswsxxbwrYQiNVU96/u8QE4/e3wIP6ze6hkRnxwUH3B6zPlnpfzFYGYjlmKuXxBiQwLama2009/QizmRsoqOthvcqaCkRVBgVpK75vVAPbOwhD5nwXdeqWD+VrwvQWOlKn/i2jq+/0mrMbWJ2ngUw4+S6oZIfFmcZ7lE9OlvBkx6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74pIzbBDaHGp7+VwODr88Q8LaK6aePRBgkMlUVYS/ic=;
 b=FWdSTs4CGLnfVsNxKlRKZr8d4eGkLAhWieDB0eYSzthyln2NqkW0s3bPX5JdaXeVEP7j6xU2EbeGO9UdVYJHwbMNJnOsuGfZftO21ZPUiB1wDXPGz+GTZkYlxEwPyQOM2vFIo6Rb1pFq7dpoXDFn93jtRp/MLPb/TMSb9/txK9c=
Received: from TYZPR03MB6446.apcprd03.prod.outlook.com (2603:1096:400:1cd::8)
 by SI2PR03MB6027.apcprd03.prod.outlook.com (2603:1096:4:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 12:46:52 +0000
Received: from TYZPR03MB6446.apcprd03.prod.outlook.com
 ([fe80::af61:69c8:1d2f:c704]) by TYZPR03MB6446.apcprd03.prod.outlook.com
 ([fe80::af61:69c8:1d2f:c704%7]) with mapi id 15.20.5791.026; Wed, 9 Nov 2022
 12:46:52 +0000
From: =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nbd@nbd.name" <nbd@nbd.name>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
	=?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH 08/10] wifi: mt76: connac: add more starec command tags
Thread-Topic: [PATCH 08/10] wifi: mt76: connac: add more starec command tags
Thread-Index: AQHY7UeQ6lIqbgbHwkaYEMs76OSVfq42jBkAgAAFaoCAAAaagA==
Date: Wed, 9 Nov 2022 12:46:52 +0000
Message-ID: <4784536a9626c4c25a431f5ecd535568fb30e538.camel@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
	 <20221031164000.17063-9-shayne.chen@mediatek.com>
	 <Y2uXJh5rFm9uocvz@localhost.localdomain>
	 <Y2ubscudOqgM6KVz@localhost.localdomain>
In-Reply-To: <Y2ubscudOqgM6KVz@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6446:EE_|SI2PR03MB6027:EE_
x-ms-office365-filtering-correlation-id: a248a0f0-b6db-466a-84db-08dac25079d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jnlJ4C3d6D95HJRfqsncp4BDi4VC91myqwsCzxduXklMHU4E1RDjbypYsLevZV2f2pFHis7HUOBodWZAx3zj9q8owN4URWGKhCphOSviox/5h08aMNG8WosCLv/t4Ie6Se51Svpc3FLcxEVmfV+oAjhHC67iYpVpDDM+HSHbV0A5TCkTrJdx2zPS3e4Z/5gMgGIjwKigl21K4JPh171jU/rBWUb1RuTOu6oJwlpOzrA19omrOpll+JyMGN2Y0HGqES9mdtORDiGN7Y1XxPbsB+98gHwB1an1XUOdeEf89HnonED/NDaY85bwPfdVoVkk1+DOBr1FzeZD1XKPCaGwX2O4gT4ip53XOZ8VzkgyUXk1oZcp1+0U9rqXtF49keQeUZPSrCAXZL59z+z7hJf6135Lr1jTy0NIAqU8T4tv+URZTNHfI42YvDXpdKwKXM7q2EDztdnrzwLNk5/Xpas0rSe4WuLMeYgPnjXUrRp0LTnPqxTiY7hcXp/So/CO8bXe+kNX/UPydEEajgbR/zCHZa8fHQ+IR3bN4OMoOnrfR3Fm37si8amnCuHmhjvPmlqJrrqMZvIX+Nfd3zWvChT3Q/fdCZXCgjHux2uqn24QlLed8VrtFwXpS3LfoG12xMkJukMMEkcz14rpeSiVFPiDiR8xEsWhGJLDvpGqqjP9+TuweUlvFrs59rqbpuZVR/uFC5c3ZsNYFJ2rHahF30NloTX/b0KWhyZpLMxiDam+IfvL4+FSSTmWiuk6sDVGe+H6uhd9PZhN/IJ6fPsE7NUoUtS89V48aZauVphxFJ36oI1+F/sZoV/siXUwCdtGeVxn02viDcmAZR5eY59zECF7PKUiH0uiDDBd0WYqTNO99tSc1afAjAQ6FypzTe68d31H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6446.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(41300700001)(4326008)(8676002)(8936002)(2906002)(86362001)(5660300002)(2616005)(66476007)(38100700002)(122000001)(64756008)(6486002)(71200400001)(6512007)(54906003)(6916009)(316002)(66556008)(66946007)(38070700005)(76116006)(66446008)(966005)(107886003)(26005)(478600001)(6506007)(186003)(36756003)(85182001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2lGN0YrUHQ5S1hFZnMrSW1zdDVlaWd6T3lOazRjNzhJc0xKUk1XNmExaHVZ?=
 =?utf-8?B?YUoxS1Q5Mnp1bnRXb1ladC9BRWNjVXYzbU1KWW5YSCtVQ3dSeVYzR3dNKzRV?=
 =?utf-8?B?VUpFcU91QWNoRmk0RGd5NUxGeDNLWnBIbjhFMUdnM2tnQjB1NXpyMjA3Y3V2?=
 =?utf-8?B?Y2VWMUhjQWFYczBONDBZeEFWak5LWkF3OG80Umt6VU5TNmliblhqSHRKWlUr?=
 =?utf-8?B?eHp0YVhVYjNmRG91bUhhWVlzMEIwNjcrejVtQ3M5S3lzbmdadFZXVFIzNlIz?=
 =?utf-8?B?eUFFb0NNOU5QM1BGV3Y0SFVaSUQ1aW1OMTBnMnZNelRCOFRnRHRSaDZVUnBK?=
 =?utf-8?B?cTVZREV2UmNnc216UzIvK1d0M0tSVEovQnpmVjJlZ3ExMkcycmZSa1RZTUtU?=
 =?utf-8?B?aEVEaE9sc2MrT1lKTTBmRWVrUFQwSTlXQzBlS2g5a01mRE1JL2xHYnQxT1I4?=
 =?utf-8?B?bEZKOEhlRFFJY08xbDkvcDhTM1ZVdUZpQ0t0UER2Tnc0TTBOT0NmUU4xQlZn?=
 =?utf-8?B?Y0lGM1RiT09XMmNETnpsWS9iMG5qRURZWWROaTY1ZytVeTBIQ2JxSUxOWndT?=
 =?utf-8?B?aFA3YlFFNG5HZ3Q1NTliaWxPdWN2K0xtelVRSTRKOXR1cytQNzVKWnYrazhv?=
 =?utf-8?B?L0xiZ3FocU43SGNzOXNmT204WUQyMzM4TXpEWkVJdHh2bGw0RTc0eHZnUWwy?=
 =?utf-8?B?OEVxaVkvbDY0N2xiWmFHOVJzeFNNQWFDZlIxLytpWlh2ekVEOUl6a1cyM0Z0?=
 =?utf-8?B?SDM2ZjQ5RGpRTjUrUk96OHJoc1B1MDhjU093UWdLY0tJUHRnOXZ6bGlYNDdx?=
 =?utf-8?B?c0ZYbkJNSEJpV3Z0YzdkV2lLS3BzbFJqdWJLbi9LWTJwZDdwU3JwVHJ6eUZR?=
 =?utf-8?B?aXkrdVZsZ0ovNzdQSHF5bkpPcm5LRTVQMU1lNDd3c2EyaEdUSVlFdTI3YXh5?=
 =?utf-8?B?cGQ2V2ZMak4relFIbkVuSlBPaU1hSjNnOGNZTDI2TENaSGlCaUkwalpZVCtZ?=
 =?utf-8?B?Z2dPVUg4aEpBK2hsN1F1TzM3QTJwY1RDT3JwTTJmOSt3d1JCUEEyVlFQc3lt?=
 =?utf-8?B?L0ZEWitsaFhvcEdxUTgrcGd1YVJackliOStVTE81TVR5dmJ5M2hSalhhQ3dC?=
 =?utf-8?B?RXNUZHhaMEJFdjBxU1gvV1dBWWpMNTMyUlRYYUZpN2t1cVRGYlBjWGtaK2wz?=
 =?utf-8?B?ZVJCV0luMjZHVU5TMjN1Y1NHSGJrZjNNM29jS1FLTEJWMVBNOGRSV09tTVBV?=
 =?utf-8?B?ZGNRTFQzeUl0eXNvWXZQVHNuZk53UG5xQjV5TCtSeDltK2pGYUtsWEprMTJM?=
 =?utf-8?B?OFMzK2o0L043SHFTeGRiSnlKMG4vaWpScjdaMy9Sa2FtL0NQeUZ6WTFWN3Vp?=
 =?utf-8?B?dVQ5cjJ4OGQvSVVtMnlENitLOEV1SysySno4V0VobVJIVzBiMU0vTHh3K0Fw?=
 =?utf-8?B?Znh1NTMxSmcxS3N0QTlvSzZ5ZVFzcXR6QS8xd3lZb2lFYnlhc1NYSkZlWnda?=
 =?utf-8?B?NjE2eHMvemhZekVuTWsvQTRWL1JRNUw1aUs4SWF0ZzlBL1NRRkZMN0Y3SjV2?=
 =?utf-8?B?czNlNjZYeHA4R3RmRkRMZkphK3dNU2Eyd2VXbWtNeVkwR2w0RGtjTG85SFVr?=
 =?utf-8?B?WWozeVBkZlV4SE9DNkp5ek1JdTU5aWpoaUIvOGM5QzhJK3pQcDlHUXhNclFK?=
 =?utf-8?B?TmhTM0JhZlBSMFdLZEJ3V1IrdXMwQklZVTR0bWxuN3ZVQ3dIaGxObXl4VDVN?=
 =?utf-8?B?clYzYk13UXpTL1VUcEtkd09mVEtnV1M2R3QrUXEvQ0xoT3ZmenZhNHFkVXc3?=
 =?utf-8?B?NkVVTXJ3eDFhNzZkOWJHY3V1ZU1EakltZEF5NFByeXFjcytUUHd6TmpzekpN?=
 =?utf-8?B?dE5PZ080bGQxMUFFM2VBTzdyQTFwY2pvVnk3KzIwNldrRnRDOTkyZnhCSTRP?=
 =?utf-8?B?dENnVkc5UDB3M1l5R0RWeTNiMkNFSnhBTUNFQnljRUZPVkgyU2RxK0VCcVZ2?=
 =?utf-8?B?WVZOV2k1c2V2Qm1IaXhiU2ZhSXZMMjFRZmZFdFZIUmZWY2JETlNzVy9XWURl?=
 =?utf-8?B?bk4zbjB2aVZQaWlzZmV1Rnl3TnRYL0QwQVdTVHN1RFBkeGdyeVduVTJLM3J5?=
 =?utf-8?B?YTY5c09STjQ5N0tUSE42L3J6N1VTRlNNRFJtN3ZBNHJsK2dleitGR29wL3g5?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05C230F74F06904386B72AB3144E1563@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6446.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a248a0f0-b6db-466a-84db-08dac25079d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 12:46:52.2864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKj1vtbkzo7F3ExmHVXyvi0IhKUnEG3yQkMIbg0WiLmbzgls26pmXf8fy5h+p2avSFLnHlc8mpx64tval0KQKnuCBiVYVq1T3RwKR74amuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6027
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_050705_557458_C8BD7FDF 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCAyMDIyLTExLTA5IGF0IDEzOjIzICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiA+ID4gQWRkIHN0YXJlYyB0YWdzIHdoaWNoIHdpbGwgYmUgdXNlZCBpbiBuZXcgY2hpcHNl
dC4NCj4gPiA+IFRoaXMgaXMgYSBwcmVsaW1pbmFyeSBwYXRjaCB0byBhZGQgbXQ3OTk2IGNoaXBz
ZXQgc3VwcG9ydC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2hheW5lIENoZW4gPHNo
YXluZS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvbmV0L3dp
cmVsZXNzL21lZGlhdGVrL210NzYvbXQ3Nl9jb25uYWNfbWN1LmggfCAyICsrDQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2X2Nvbm5hY19tY3UuaA0KPiA+
ID4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzZfY29ubmFjX21jdS5o
DQo+ID4gPiBpbmRleCBlZDFkMjQ4MjJjMzcuLjMzNmMyMGZjYzhkYyAxMDA2NDQNCj4gPiA+IC0t
LSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3Nl9jb25uYWNfbWN1LmgN
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3Nl9jb25u
YWNfbWN1LmgNCj4gPiA+IEBAIC03OTEsNiArNzkxLDggQEAgZW51bSB7DQo+ID4gPiAgCVNUQV9S
RUNfUEhZID0gMHgxNSwNCj4gPiA+ICAJU1RBX1JFQ19IRV82RyA9IDB4MTcsDQo+ID4gPiAgCVNU
QV9SRUNfSEVfVjIgPSAweDE5LA0KPiA+ID4gKwlTVEFfUkVDX0hEUlQgPSAweDI4LA0KPiA+ID4g
KwlTVEFfUkVDX0hEUl9UUkFOUyA9IDB4MkIsDQo+ID4gPiAgCVNUQV9SRUNfTUFYX05VTQ0KPiA+
ID4gIH07DQo+ID4gDQo+ID4gSSBndWVzcyB0aGlzIHBhdGNoIGRvZXMgbm90IGFwcGx5IGNsZWFu
bHkuDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBMb3JlbnpvDQo+ID4gDQpIaSBMb3JlLA0KDQpU
aGUgc2VyaWVzIGlzIGFscmVhZHkgcmViYXNlZCBvbiB0b3Agb2YgdGhpcyBwYXRjaDoNCg0KaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzg1
YjVlODM3NGZjOWI4NmZiOTU1MDYwYzE4NDBmM2IyYTFkMTg3ZTQuMTY2NjYxNDYxNi5naXQuZGVy
ZW4ud3VAbWVkaWF0ZWsuY29tLw0KDQpJJ2xsIG1lbnRpb24gdGhpcyBpbiB2Mi4NCg0KVGhhbmtz
LA0KU2hheW5lDQo+ID4gPiAgDQo+ID4gPiAtLSANCj4gPiA+IDIuMjUuMQ0KPiA+ID4gDQo+IA0K
PiBJIGd1ZXNzIEkgYW0gbWlzc2luZyBzdGFfcmVjX2hlX3YyIHN0cnVjdHVyZSBkZWZpbml0aW9u
LiBJcyBpdA0KPiBhbHJlYWR5IHVwc3RyZWFtDQo+IG9yIGhhdmUgeW91IG1pc3NlZCBpdD8NCj4g
DQo+IFJlZ2FyZHMsDQo+IExvcmVuem8NCg==

