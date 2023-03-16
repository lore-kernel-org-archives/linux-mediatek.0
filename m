Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C2DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BjG0unmHyNBM85QqFq6NarT1MLGi5gtab+KCWB65Uk=; b=XXrwyKF8elddz59y2NWkEXgQ/v
	9H7MQ3aVVT50mSNTRHTf2X5hmYPVpqIWcaBNBMFqInip2lMpz3+0bu+qW6f0L99FtdIDZ/OscT2BF
	5kzVYqYo7GrYw+5xSXPlOFI3F/gtAnMiVPrRTvAYg0sYOmbj8rzzpiAL/hbdCXdzafn+bY1sKjXQ9
	TdejNWWoIj3ANeElXNh3kfoLLn7ecuRxpzw+IWjZ74A0sFaQv95Yi6E0jS+Iq9ghMXiwUDVsy+XVp
	MGehQtmJNuJLPKucA76tzVbQGQQcL4fxdQX0ddEpoL4hY4dUz/fFvdO2xdHwhNiWP76lOmIuaN7Cw
	+q6UVxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pccFT-00Esoz-1P;
	Thu, 16 Mar 2023 01:17:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pccFP-00EsnX-2K;
	Thu, 16 Mar 2023 01:17:41 +0000
X-UUID: 53592c40c39811edb5598346aad47b14-20230315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9BjG0unmHyNBM85QqFq6NarT1MLGi5gtab+KCWB65Uk=;
	b=e49BQbz562Wp4guoMwC6ndrnRqC9IKFVeLquuD19LSaqpg5uuidQfdvxISaFD2CWSU7FufJuj5hDL3fDn5EJEn5R+lwccymJcJZjlCkixlC9KXv8RYoL8yPICKOWdMgmY/Sm74y3XXBS8ah94u57aFneBCvFRSlsSUR8qzOgoD4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:fb47ebbf-8d74-4334-a4cc-b82cc0fd45dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:d863eff5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 53592c40c39811edb5598346aad47b14-20230315
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <haozhe.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1585689306; Wed, 15 Mar 2023 18:17:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 16 Mar 2023 09:17:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 09:17:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/PfEgnYdpkjZBMbqhKr6MeAbcWrNzZqAVLqocdujYkVCl97exFQEWs91KuHciFyJkd859rzMIwJ/ZFYzg+qkh4tnHCKMVSJpA7wwcNfmmN0hyG6O8/I6OgzsgGdqv4YfagqywqwdEmppgxnXPKWAXtUeP6tZDwtPekjiRX2WkZcnVWMXBagmOprNmUya1ytQHYOTQDjlVJifTilGeLmrozjfnWuacnMm9GnUfrfF9ACt0anC/OIvY5XJ2s+MlJEvoXc2OShFYzoGNsFY1S4qomLqSfZAFKbMJmAjRtgX1Wtg6Y+193csyYQnG5KhRM6dsn/my9JNQln/0IMyq6Ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BjG0unmHyNBM85QqFq6NarT1MLGi5gtab+KCWB65Uk=;
 b=AAhIPLJKm01FkQDucjFGLsE7BV7h7Qf826P7ABgeVS2onCeSuQq9XgxrEmYBTlsNUYbR+uh2c6+r5pVWIOvoRu1UQNQHZMHjZRjF6dEkf5zTFjq+uZTZlu20XfQwSw9n5INdN0AMwdKkSR1nRwq8409+5rxahV5sEZUUZ8ttqqoJ4MzrDrZ0W8rFdS09/x5t6tQ/Lu0wOIzcEAhD2wwEpODPFkb064wnQRVZyeqTa1raxbOuVCTBUSWjj+kLyls9RNZnEprEZq536WMUIfsQVau72NjCh3bL0eKy+qoL7o5Anq1+7cXSpfixmBGBDn/N5WDTlXpSYWj8kVWXnNy4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BjG0unmHyNBM85QqFq6NarT1MLGi5gtab+KCWB65Uk=;
 b=uWQbpmJ0QT3i/HYkIZ6gmn3QiYFey/6nl35mrlcu0sqSgvI61bQTxPrbhsOCP2FRp/mMOOXKN3XGfLYgmYAo9LMz/sxbC8DnWXod4z04lHddmSHOyOh80I9xgqbc00Ykdvz/J+ect0GiWxgyB8vemKfKJyzXNd5xeGroylTs61c=
Received: from PSAPR03MB5653.apcprd03.prod.outlook.com (2603:1096:301:8f::9)
 by SI2PR03MB5260.apcprd03.prod.outlook.com (2603:1096:4:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 01:17:20 +0000
Received: from PSAPR03MB5653.apcprd03.prod.outlook.com
 ([fe80::2559:136d:352e:705f]) by PSAPR03MB5653.apcprd03.prod.outlook.com
 ([fe80::2559:136d:352e:705f%8]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 01:17:20 +0000
From: =?utf-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>
To: "kuba@kernel.org" <kuba@kernel.org>
CC: "stephan@gerhold.net" <stephan@gerhold.net>, "oneukum@suse.com"
	<oneukum@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "linuxwwan@intel.com"
	<linuxwwan@intel.com>, "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>,
	"chiranjeevi.rapolu@linux.intel.com" <chiranjeevi.rapolu@linux.intel.com>,
	=?utf-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "ryazanov.s.a@gmail.com"
	<ryazanov.s.a@gmail.com>, =?utf-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?=
	<Xiayu.Zhang@mediatek.com>, "loic.poulain@linaro.org"
	<loic.poulain@linaro.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"chandrashekar.devegowda@intel.com" <chandrashekar.devegowda@intel.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shangxiaojing@huawei.com" <shangxiaojing@huawei.com>,
	=?utf-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "ricardo.martinez@linux.intel.com"
	<ricardo.martinez@linux.intel.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND net-next v7] wwan: core: Support slicing in port TX
 flow of WWAN subsystem
Thread-Topic: [PATCH RESEND net-next v7] wwan: core: Support slicing in port
 TX flow of WWAN subsystem
Thread-Index: AQHZUZbXkLjj8v+2+kGQRHUTLVBySq75Xk6AgANIn4A=
Date: Thu, 16 Mar 2023 01:17:20 +0000
Message-ID: <be70562aa153e8de2446dcb3b8052c027e50b0cb.camel@mediatek.com>
References: <20230308081939.5512-1-haozhe.chang@mediatek.com>
	 <20230313160837.77f4ced0@kernel.org>
In-Reply-To: <20230313160837.77f4ced0@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5653:EE_|SI2PR03MB5260:EE_
x-ms-office365-filtering-correlation-id: 425dbf83-96f6-4e81-ffc6-08db25bc30be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aWwqz7GO01ktC9ay4PEp0P3cOA91pplVN82Yl5VM4A+MLR5r9qU7KNvfxkKzRFBTwzB2lRbjrvo+8VKpBRpXgYjb+sBlFt9oNYE+aX8IDX8LwU8B6AJRLuK9FBd7xN874Xeti9Y+PR+HgIDmitK9wDm29SeCSzBk0SaWT1qW2OmyiqWd+Mv2hKRcyFbD3tPUojfNna3jRcQWVF8+X5K6B94iZcj05lInnFllPe+eZb1opvVPx3oB3ySMYUl+LUxkG7zuHUEYcXAEukQDS2aj+EWq68b15dIC31stBHgJDhJ5BcfaemFMSeHpaoEuEz4cdKpdr10daw59oqjKr2wsZxXKUamS6Tmhnl5QUpAj6Axh9bEvQ1Sc1cIlkOhXrsVj9IHbq6elX0FauB1AAbEbxJgazTBfEr/pbhA0Jas5Vloiw+iu8LFqPBlanRnXF3uCpbI0IVgb4HujmfrlrNJEk4Ryee5fgHB66awejQFqJ/b/w/6jIOfSkvVKXtp6irHKmLxh4XJUXApBfbjiF4/z0frgFqosXDSjgAjXg0rtjLF7QtGEMz//wnJy5hBRt/0UN6FzMRhKiz5vR9qUSn1n37DpqMNKA+KS3aPxn48j8Uj38W0sFlwdyg8Gr3NgTofOOTOvnFgGajiEATeEeVyeGswlW+59SYbogKDhzpRc8lhO/5M89fcJOy8w65xldaftBaf0mX8oDITdnT5uWTMjvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5653.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(36756003)(85182001)(4326008)(7416002)(8936002)(5660300002)(41300700001)(2906002)(38070700005)(38100700002)(86362001)(122000001)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(8676002)(91956017)(64756008)(6486002)(966005)(71200400001)(6916009)(54906003)(316002)(6506007)(186003)(6512007)(2616005)(26005)(83380400001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTVFRjlmN0hsVVNzM1RoSDU4YTROUGVod0VydkJoc2k3d21xcDVBd1loU3Bu?=
 =?utf-8?B?VEdnWll4cStwY2laZ01BZllNWTY5T29SSWt5c2xjbGdsTDhsWnhUVTBqSXZQ?=
 =?utf-8?B?YlJMZUYycTdMcEx5eXNzOWFUSjNTbThYMTRhbk9wZ2dUZkN2bFlLRkN6clZu?=
 =?utf-8?B?NDhoNkFZRTVkeFFYREh4UmJqUmtRN2lnK1lQRC90RlZncENBdDRHbXB1QklB?=
 =?utf-8?B?MGEyN0c4ZnpsSnZsYVJuZXZYd3RTdC9DTHJnT2p2dXV4OWFHOG5uRGdXTm9h?=
 =?utf-8?B?UjhFdW53L3BwQWp6OFg2cE1PT0VRSEhZSE9xYWlSM3VBTVVoa1VxbXpOWGF0?=
 =?utf-8?B?cFhPZHEyQU9TMHF2ejF6c1NDVmN3LzFldnV1QWpYZlVwK1B1QzZkSS9WS2tj?=
 =?utf-8?B?R2V4eVdGU2dWa09yQ2VSd2NYSVI4NzZCd2p5VGVnZnZzYTI3T3ZTaGc1Z3p5?=
 =?utf-8?B?NmdJSmhuUG9FTmoxZkIxaDhaeEpjL1A1WVBvMXk2R0REbGxXVENkKzdjQS9h?=
 =?utf-8?B?dCswb3NJRnpPWjVqU0lNcjhMT1RPQUlzWTdUUVMrckJEQUEzQ1B0anBKYUdi?=
 =?utf-8?B?NmU2ay9pVnBvNEk5c0EzRWFyaVljbGVFdGhGdjFYakhVVHU4c1RxZXc5cmRY?=
 =?utf-8?B?bUE5a3ArZG0xcSthVHliQ253b2dTZzlKcjVvZlY1aDFlUUtXcVAvb2NBZDh1?=
 =?utf-8?B?ay94WWx4OW9PSndCRUF6SmlGcVBBUStmY25qMXBLbkpFOUc3V1JBejJOS2pK?=
 =?utf-8?B?ZWM3YkFVb3hsRHNlVWJxcFN0VTRRdWIyeGpGb0NaaFNqYzVtN1BIVWhibVNj?=
 =?utf-8?B?UG9EcUZJbkc4NEI1VnI1cUoxQ0R1SGc3N2wxQWVHYWduNlNENHFnRGdrd3JM?=
 =?utf-8?B?cjdKbnQ4QkFkZlNpWnNlcE9iTDRnSVR4cXNHNjVCMjRlNHVjeDIwczZUb0c2?=
 =?utf-8?B?SzVyL3J4cGgrQXFpTytzOGZMc3I3UE1VbUd3c3ZsR1dJS2JGUDR5bld1M3Qx?=
 =?utf-8?B?dXN4KzVxaE5wSDd3QWVoOU1EL3VxZmNtZ3hRdDh1RVNPMVZIejZyNURVYVV0?=
 =?utf-8?B?ZjVJU0FmSFNUQkRxOWxadGFkbTRXSmRMZHYrLytXNVEzbmFtbzdlaEM1MThu?=
 =?utf-8?B?c3ZBU25wNGhKNWdORWtWZWJyUDg1YUJhdm1ISkp0NWNQU0ZQWmc2c1dCdmNU?=
 =?utf-8?B?eUJkbElZazZDcnBlSmNVQ3lYRmRLajZNZ1ltbjhRVWFXYS92T1Fxb0lGdmtB?=
 =?utf-8?B?V0c0WVlDTHFhcnZrWGtFVzhDNjRLODB2dGVpU1NCeXNJY0Q1SXlZVmFmamtY?=
 =?utf-8?B?L0RwQWR2ZERtNjArYXVHSVdZalk3VGVBT2lvOW5nUzdNbEVTeXlXZk4xMUh1?=
 =?utf-8?B?ajl2WlFOSmVFNm44RTdITUpKenRDYmZ3dUsyMmdNejNYSEdzcnZ4dmo0YWM5?=
 =?utf-8?B?Z0FFQ0RoYUp4S1pUM3dXNkpGWnBra3ZSaXM4R3ZlcWlKRUNtS1M2aGFNcWFV?=
 =?utf-8?B?elArMEFSbitnNFVJekg0djBSbXB2QmQ3OGV4NnFmVHhmQ1FDckxQYzZ1V2tZ?=
 =?utf-8?B?YXIvMm1BWlEvV2NndUZTb08vc1BaZ0hXSGo0bmhlZjZMRXRrQ0ljUUV1S0M5?=
 =?utf-8?B?N2tmdmtBL2xROEs0aWwvdlYzcVJrUkV5bnZHYmZoU2c5NDd6WFo1cWF0c3BG?=
 =?utf-8?B?ampzM0ozVm5YbzdTTjA4UWFVOG5WWkZqTmljY0x6YS9SNEFnc2NrbDgxRGlh?=
 =?utf-8?B?Z2labkIxaVNGa3FPZjloUlBTWDlpTGw1UHNzRDFjYmUwMFI3dTFGQit2NjNv?=
 =?utf-8?B?Ym9BSXNYNmZhbmhxcFFBZUorZFF5VmhodU80cXMrZ1puK01mSXdhc3VoQkRK?=
 =?utf-8?B?M3RjMUx6RzdnWE5JK21MZ1RnUkFGOFRBRERncDBXSTIySkF1Z2h6M1Q3cnRS?=
 =?utf-8?B?TkhhNnBQcFZXdkU2OGxKV29WWmlMUk84UnVQTTNuQ1dJemFHcjVCT2RDcTlY?=
 =?utf-8?B?VCtHb2FQOXk4TFZCbjc0SXlvZWptUnV1ZTk2aC9Qd2Fzc0hVTDdWM01wckM0?=
 =?utf-8?B?eWt6RmJVaVJPWlA2RDNjRmp6aEMvLzhxaGZyb0cyY3VoaUQ3Nnlvd21MZXJx?=
 =?utf-8?B?YWE4UHpwVkd0bzJxYlQxQlAwL0VlWHB4VDJwS3F3WUgzcjRyQm1QUFd5TjhZ?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D5A9F082CC1E468A105B52A682B008@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5653.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425dbf83-96f6-4e81-ffc6-08db25bc30be
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 01:17:20.4491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XFdGwXYtJzJ+0JwwjBj0lZs2eJ11BIeeZlPUE8Ur7GspoTYwgvsmYALg0bGN3sLkRaAS7BGVk4ElCWhXU86AfInO6c/o6kKmS+Cb2pouUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5260
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_181739_988046_D1D25369 
X-CRM114-Status: GOOD (  18.84  )
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

RGVhciBKYWt1YiBLaWNpbnNraQ0KDQpPbiBNb24sIDIwMjMtMDMtMTMgYXQgMTY6MDggLTA3MDAs
IEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPiBPbiBXZWQsIDggTWFyIDIwMjMgMTY6MTk6MzUgKzA4
MDAgaGFvemhlLmNoYW5nQG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gPiAgLyoqDQo+ID4gICAqIHd3
YW5fY3JlYXRlX3BvcnQgLSBBZGQgYSBuZXcgV1dBTiBwb3J0DQo+ID4gICAqIEBwYXJlbnQ6IERl
dmljZSB0byB1c2UgYXMgcGFyZW50IGFuZCBzaGFyZWQgYnkgYWxsIFdXQU4gcG9ydHMNCj4gPiAg
ICogQHR5cGU6IFdXQU4gcG9ydCB0eXBlDQo+ID4gICAqIEBvcHM6IFdXQU4gcG9ydCBvcGVyYXRp
b25zDQo+ID4gKyAqIEBmcmFnX2xlbjogV1dBTiBwb3J0IFRYIGZyYWdtZW50cyBsZW5ndGgsIGlm
IFdXQU5fTk9fRlJBR01FTlQNCj4gPiBpcyBzZXQsDQo+ID4gKyAqICAgICAgICAgICAgdGhlIFdX
QU4gY29yZSBkb24ndCBmcmFnbWVudCBjb250cm9sIHBhY2thZ2VzLg0KPiA+ICsgKiBAaGVhZHJv
b21fbGVuOiBXV0FOIHBvcnQgVFggZnJhZ21lbnRzIHJlc2VydmVkIGhlYWRyb29tIGxlbmd0aCwN
Cj4gPiBpZiBXV0FOX05PX0hFQURST09NDQo+ID4gKyAqICAgICAgICAgICAgICAgIGlzIHNldCwg
dGhlIFdXQU4gY29yZSBkb24ndCByZXNlcnZlIGhlYWRyb29tIGluDQo+ID4gY29udHJvbCBwYWNr
YWdlcy4NCj4gPiAgICogQGRydmRhdGE6IFBvaW50ZXIgdG8gY2FsbGVyIGRyaXZlciBkYXRhDQo+
ID4gICAqDQo+ID4gICAqIEFsbG9jYXRlIGFuZCByZWdpc3RlciBhIG5ldyBXV0FOIHBvcnQuIFRo
ZSBwb3J0IHdpbGwgYmUNCj4gPiBhdXRvbWF0aWNhbGx5IGV4cG9zZWQNCj4gPiBAQCAtODYsNiAr
MTAwLDggQEAgc3RydWN0IHd3YW5fcG9ydF9vcHMgew0KPiA+ICBzdHJ1Y3Qgd3dhbl9wb3J0ICp3
d2FuX2NyZWF0ZV9wb3J0KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwNCj4gPiAgCQkJCSAgIGVudW0g
d3dhbl9wb3J0X3R5cGUgdHlwZSwNCj4gPiAgCQkJCSAgIGNvbnN0IHN0cnVjdCB3d2FuX3BvcnRf
b3BzICpvcHMsDQo+ID4gKwkJCQkgICBzaXplX3QgZnJhZ19sZW4sDQo+ID4gKwkJCQkgICB1bnNp
Z25lZCBpbnQgaGVhZHJvb21fbGVuLA0KPiA+ICAJCQkJICAgdm9pZCAqZHJ2ZGF0YSk7DQo+ID4g
IA0KPiANCj4gVG9vIG1hbnkgYXJndW1lbnRzLCBhbmQgcG9vciBleHRlbnNpYmlsaXR5Lg0KPiBQ
bGVhc2Ugd3JhcCB0aGUgbmV3IHBhcmFtcyBpbnRvIGEgY2FwYWJpbGl0eSBzdHJ1Y3Q6DQo+IA0K
PiBzdHJ1Y3Qgd3dhbl9wb3J0X2NhcHMgew0KPiAJdW5zaWduZWQgaW50IGZyYWdfbGVuOw0KPiAJ
dW5zaWduZWQgaW50IGhlYWRyb29tX2xlbjsNCj4gfTsNCj4gDQo+IHBhc3MgYSBwb2ludGVyIHRv
IHRoaXMga2luZCBvZiBzdHJ1Y3R1cmUgaW4uDQo+IA0KPiBOZXh0IHRpbWUgc29tZW9uZSBuZWVk
cyB0byBhZGQgYSBxdWlyayB0aGV5IGNhbiBqdXN0IGFkZCBhIGZpZWxkIGFuZA0KPiB3b24ndCBu
ZWVkIHRvIGNoYW5nZSBhbGwgdGhlIGRyaXZlcnMuDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0
aW9uLiBCdXQgdGhlIHNhbWUgc3VnZ2VzdGlvbiBoYXMgYmVlbiBkaXNjdXNzZWQNCmluIHByZXZp
b3VzIHBhdGNoIHYyOiANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRk
ZXZicGYvcGF0Y2gvMjAyMjExMDgxMDUzNTIuODk4MDEtMS1oYW96aGUuY2hhbmdAbWVkaWF0ZWsu
Y29tLw0KDQpUaGUgb3BpbmlvbiBmcm9tIExvaWM6ICJJIHRoaW5rIDYgaXMgc3RpbGwgZmluZSwg
aWYgd2UgbmVlZCBtb3JlIGZpZWxkcw0KaW4gdGhlIGZ1dHVyZSB3ZSBjYW4gYWx3YXlzIGhhdmUg
YSBwb3J0X2NvbmZpZyBzdHJ1Y3QgYXMgYSBwYXJhbWV0ZXINCmluc3RlYWQuIg0KDQpCUg0KDQo=

