Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33157C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 03:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nym3tq8XJ8WXBmUWXl8Lgt6Lwse6KYpIKi4i+kpl77M=; b=rjiACkKIt0wsBPsB9Ar8hQkffh
	q9pw1QHUwxKyUVBxVS6O4y3z/ZQB36bEyTaI8XsoBRVXVibYlzuc99Uomy6SXw7+TdQeoaR7ZYVaM
	Xp1qJun5N4+i+aL1O9dCVVblVA9uWAoaIEuoRkSTjjCC4xYECgp+eCQt8F0+rPPhXQd0y/OEVxomH
	2Mt+Urz/kEGZlSu5vyBrel4g3LorbOAlIcJuUfDkSsMTKNyQaC2jovC4pJY5l021fBlU/bmezofU2
	ZL5MuOGSyB328rUgf6fnuNxnbB3AlgiPlEtUj2YccFSPcA7+YmOFfSP8mxCPqwzph73UY6+xv3XHi
	SRVbim1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS7k8-00F1AO-2L;
	Tue, 23 Jan 2024 03:46:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS7k3-00F190-2g
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 03:46:29 +0000
X-UUID: f7541d8cb9a111ee9a263b4415211400-20240122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nym3tq8XJ8WXBmUWXl8Lgt6Lwse6KYpIKi4i+kpl77M=;
	b=lR6ncsxKD/+m6QALSMZ9qizL/3EYhT5lDHDOGCubLyRiCUTAc/uJXDuSbPLLbzoM+5Nm2XhJ9lOQFHIXMTeXC0exofJSl5QErW7rddQOvv6Vzl84QyOnf1+ebG1RUjb3eemsE2oqeDNOuKISm1ZpjBaevGHpr/1VloPSm6A9zjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:6ae95fd4-f0ec-403a-9c93-d1f4f1e4c5da,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:024d762f-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7541d8cb9a111ee9a263b4415211400-20240122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1430613151; Mon, 22 Jan 2024 20:46:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 Jan 2024 11:45:44 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 Jan 2024 11:45:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OswCXbpMayESGJ4QTUUCGq4O7Dc2SKWWa0q8M5fC478OzI+AUENprs4VBo1GJKlxIABjUcZysUYcTZVUyxym5lhcYdlX/xJbvR0fu6bh9LGw4ogzlEN2eQWzikBx1df1o6kFOb2glvK1p/hg36tBmWkIXLSRcbkT3cwB4iyQ6K47CwDU2Lulpg65ixzVStvdpVX8LlltTyLPBBA34uEJ2EbRFutdFdRjHyqITQ6jink/wcplP10bEr8CA1Iseq0JYxxbQM1qMBxztzsk9tdehKRNmvXf+UadSZP69uvtxj/TIRg7LESx/n5JUmURYgTFG+z+Qtxx82A72xjGEbt8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nym3tq8XJ8WXBmUWXl8Lgt6Lwse6KYpIKi4i+kpl77M=;
 b=NbCjbgh/vJGPgCmsno/K38isRIORRSOCrgmlcdCbGplntk7LiBD3hvMzIPv7EENHXuCq/kklCnQKnHsqfrc3fPFCR/SxylcTxq5j6DD442psOXGFLgByaZeQ8RayiuYj+hE80aTSeEhYkJCYJILq6bTfvlnNmJuZ9dlf4af+OEKe/fyfJVLMAkve3AgLP1GXZWteIKQIhD6LSMH4CRj/25FtD69Y9mPK5Tls6p1bKOiAAGVL0DlYfWQyowzVN78axnMy/bpQsJGkrouY/HNc0NmFsuKCiL6GgJCnUaUcXjpk/j+uOiIops3uOSeXWspwi23/802/q0vD0qEWqvtK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nym3tq8XJ8WXBmUWXl8Lgt6Lwse6KYpIKi4i+kpl77M=;
 b=crJn85M8OsZYW7UDbAJSvE7qFSMsGe7whosyBy5PIIYzY4PbprVI1MWc/ZLeRos8U79mxdgKTkqyVb+7oAMm1on3mhzJGpwR8igPDqbXxiuwMY+wSg1xkOo1cf3N8g0j5cUy4iJrxZEFAb1im+JF9TD9KcQN+toYaJfR3C2Saws=
Received: from KL1PR03MB5777.apcprd03.prod.outlook.com (2603:1096:820:64::14)
 by SEYPR03MB7272.apcprd03.prod.outlook.com (2603:1096:101:88::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 02:40:40 +0000
Received: from KL1PR03MB5777.apcprd03.prod.outlook.com
 ([fe80::e2ac:4b70:8ac3:ba3d]) by KL1PR03MB5777.apcprd03.prod.outlook.com
 ([fe80::e2ac:4b70:8ac3:ba3d%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 02:40:40 +0000
From: =?utf-8?B?V2FsdGVyIENoYW5nICjlvLXntq3lk7Ip?= <Walter.Chang@mediatek.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jstultz@google.com" <jstultz@google.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "macro@orcam.me.uk"
	<macro@orcam.me.uk>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
	=?utf-8?B?RnJlZGR5IEhzaW4gKOi+m+aBkuixkCk=?= <Freddy.Hsin@mediatek.com>
Subject: Re: [PATCH v5 0/4] Support timer drivers as loadable modules
Thread-Topic: [PATCH v5 0/4] Support timer drivers as loadable modules
Thread-Index: AQHZiGcAlWtFKUKClEylT3CLdkSqYK+SicEAgVWwiQA=
Date: Tue, 23 Jan 2024 02:40:40 +0000
Message-ID: <6c49a9cd98e9ae2c0e81cfd51d88b5ce6c02c607.camel@mediatek.com>
References: <20230517022557.24388-1-walter.chang@mediatek.com>
	 <4c2f66f1-2623-306f-f1d3-83a32a0c2885@linaro.org>
In-Reply-To: <4c2f66f1-2623-306f-f1d3-83a32a0c2885@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5777:EE_|SEYPR03MB7272:EE_
x-ms-office365-filtering-correlation-id: 8a7442d7-d234-4ba6-6e02-08dc1bbcb02e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GMs5Fmsvho+KYLH/trmMGKhcaQrWu+RdvwYuFc4oaOZF9PyPmLcYn+uA1lgGru5topO0sYXnLgGUVm4/msZMgjD/2srziCp52nr7Nop8UY7+NkRa6r1jvfuDLCtE7DqdOsI8s+TngXEx/657idbnnhFDVL1wQPUPS106YuV7DtbuMAw41xX+00s1uxN7u+ICBm3/Hnjc4712LmkwNR5juAx3Yd8Myy8vaj/YAnMicdovp6J/C8mX54F32C/CCjLjfItpvWqyU3Bnyq/idmYLrlhb9MiIA0qhOM1UwrCLkHgrMvpd5d4UiaaI72TlVlxbeuLYz+PBR2Zzp6iPyzwptxZimKN9Qk8JXJYw1/y0tPldUXUWlFBYGPAZgrdG9JdKfwnHVK2nGkRhm/yuUibU6okDzeRkIwzZHYfVBJQHG+YACNYcij2vgoeKzXu8NkwAlDm6SxAXsRN2zp87o/ZZnP+SAjct4zrA55uPLgE8/YtmBCDnP2uA1VEYfeMHbfhC7l9brLuELYelYngPrtD/+gACPuofsuPUtsG8ePEQgV2Sw8nrKZNQoZyPWkytjajhNu50A3oXBQrqm+Er+PU6a6fuvrfZrV75Ul+wxry9/knH3lWo6l3Bcd7KB8UFgETC5PzUMBbSMHdbSaG++IkOBdU+rkQfp8qmRmHVEhXlRCQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5777.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(71200400001)(478600001)(6486002)(36756003)(85182001)(38070700009)(2616005)(107886003)(26005)(83380400001)(4744005)(110136005)(2906002)(316002)(54906003)(64756008)(6512007)(6506007)(5660300002)(8936002)(8676002)(4326008)(66446008)(41300700001)(38100700002)(66946007)(66556008)(66476007)(76116006)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THEzMTducFBlZmUwbHVSM3FpUWUvTkoxbEdqMmJ0Y1ZwN3RSRnF6bUpBV3Zv?=
 =?utf-8?B?cU1FeURzYVFITUhyUklPWFdxMFU3bVhkVFpONnlHelRaclNQYzR2c0NHZGVB?=
 =?utf-8?B?b2YrWDlyTjVXd3NUSk0wMDZMQ21RSTk0bkUrLzVWR3ZmdTBHWmt1clRWNUtH?=
 =?utf-8?B?S05KanpLdHhtRVoreUhEQy8zZTBPdmtCb2M1Y1RvNVF1d2ZFaUdrTlU4MnV1?=
 =?utf-8?B?WHNRWWJhb3kvaE5RcU03NUlhc05LSThycUZ6amQzSzZmdnNFZ0E1VFhueFh1?=
 =?utf-8?B?S3pMQWszV1l3WE5tMWt5NjJYQ2VVZllWTnA3dEZCOG9MZVpoYithbXNNMG1s?=
 =?utf-8?B?dlpzbm45dHp6TnNvRk1DanlTNWVuYUtjSW5VZmV5V1c3QUE4NkVBVXozdnQz?=
 =?utf-8?B?MEFjbTVFbzZXd255WUlId1d6YUhZeWcxOXZQdSs3MHJBZzhDRVBLUjE1N3p6?=
 =?utf-8?B?Q0tDRmRGN1MweHpHV3MwcEJhQ1JDS1NybXI5cWZaSjN6U0lXMzF6ZXdlenpU?=
 =?utf-8?B?enQvYm9RNUduVGFzMFU3b1dPdCtyVDFFRTlHNmxMZXA0TS9scHFEY1FvT0cy?=
 =?utf-8?B?M3JuK0x4ZXY2TUcvbzY2em10WnRRWTNoRTdhbFdITU5ZemtCb2hjRzlKZ3dO?=
 =?utf-8?B?Y0JCOEozemdrNkh2RjZ1RDNGMk9ZdHo0dmRNbEtHYWo4YnNHcGFSTi9QRk52?=
 =?utf-8?B?L1k5azNwR0h5U2tiM1JtVE9kMy9DQkFiWWRqVm5hTGJhK0JxS0hjMU54Z3hk?=
 =?utf-8?B?bjl3R1lyL2JPWU02MkxlTndXRVkva3VhcUt0WFhHbmFpdk5GQ2FweUxFTjBh?=
 =?utf-8?B?WnJUODVjWERVL0EzUVZVR2RUK0x2MVNLRW5Hd1FWVEVYTm1lTU5lczRrOXRw?=
 =?utf-8?B?elNwdUNxWG1uUDFIZmpEK3NtdHFWSHpoSlhLaEpwaWtKRTV1cnlwQlBja0Rz?=
 =?utf-8?B?emV4UEN5N08vb0xlc0VwNHpNQ3NrWWpHKytMSWhMU1pwVEpCNWQ4SVg1Z2xC?=
 =?utf-8?B?YzRwMU1pOFJVem0vRit6REF6RkpjOEM3a0VILzNOeWlER3dnTmtTSG85d1JQ?=
 =?utf-8?B?aWNGUkpMOGJjU0I3dHc2UmhqQXJpSGhkVmZlY0JjSmxBeHVuRnBLR2xXS0dT?=
 =?utf-8?B?cG9sY3d3MFdyZ0pVcGtaWlJKUVM3UFpoWHR3MzNVYXF0SEl5SVRsSVZ6aU1z?=
 =?utf-8?B?YkMvdzdpSFdtNk8xQ3NzOEsyZjJ6Q2xzeXJlVkttQjIyZUgrNjdRdEpWaFhX?=
 =?utf-8?B?TmovZHM2M2pubTFaVllRQk5GTitZU2VHdXdGcGlWY3o0K3N4aDg4VE91YVh4?=
 =?utf-8?B?M3RUOXpLUnQreXpiZzJBOHhqS2pSTWJMdGdKRE44SkZCM3BpWlZORXlNNWpi?=
 =?utf-8?B?VmVHeE1hN3NpaWMzTXY4V09uemt4dURuRTE2TFcyaEEwN0d0Uzh1OWQ1WE54?=
 =?utf-8?B?UEtRNWkvVGdvQlh5Y2NBNWVIUGRkQnRTRHRqaWxCTDE1K1d0Zlo4RDRleFIy?=
 =?utf-8?B?MXJLMXpnR1FpM0RkbzNRNEZMYkVNTHVXRno5K2tkT2pXaEIxMkVVZVZicFUx?=
 =?utf-8?B?TmN5WGJiTEhadHNzdzQxc2VTZFpOMkF5d3VYd0M0YU5ESnVHT0JDaUlkSzBV?=
 =?utf-8?B?Q2M4SGNaM2N3Y205WHdjSzhpSEJrN2ErV2dsQW1RS2dMaitsUGdDRmhLS3dn?=
 =?utf-8?B?aDBKeVpYZ21IeGpnRXZTWXdTSCtPY1pUWVdlRTVTdGFEYi9BckpaYjNneGds?=
 =?utf-8?B?eWZqaUNYdkNZOVFRUmtqZkZyaExZWFlnUnFBcEUwNk85RWVPRUV3UlFxT2o3?=
 =?utf-8?B?eEg3eVdFZWJNUm1Ic0dUSlNodGVtSm91dUtJM0o0dEFNN1ZkVVROcGF4NEVH?=
 =?utf-8?B?blNLV0llNGFYKzJaYzVCR05yemJleXBxYlpYazAxNi9KV0wxTU9vdHV6Qmhz?=
 =?utf-8?B?c1lZSjhZSHdtckxBT0g5aTM3UlpITm1uZ2s5TWVQS01tZ0VrbElRMGFxOTBm?=
 =?utf-8?B?NWRKUjVlNHVlZ0VxVDY5YXBzb0oxeGdxcnRyK1F5UGdmVnZPaWs5TzJ1NE9v?=
 =?utf-8?B?ek1nazVsQ2ZhN2VIV21YMUY4NVhTSUNpSFJsdFJyQ1lQUHVLZmx0YWhiRXhK?=
 =?utf-8?B?dUFsZ3JpelV6dzFBekVjc3FtcVFGcHlMYUZKWU5rQk41d3h2cTBKMldsNU85?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <809029198396F84A85E56542583462C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5777.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7442d7-d234-4ba6-6e02-08dc1bbcb02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 02:40:40.3262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nARzXdGa0UwAFlz+fxYU8MyHIYbnT7135e9sWHh8/We+zHL+A429YRHaYAZQzesqBqyaMvm77jimaHLS9HOyP0DkDHk+yrRp496bFHmnM6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_194627_947470_24D62445 
X-CRM114-Status: GOOD (  11.32  )
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

T24gTW9uLCAyMDIzLTA2LTE5IGF0IDE4OjQ0ICswMjAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICANCj4gQXMgSSBhbHJlYWR5IHNhaWQsIEknbSBub3QgdmVyeSBjb21m
b3J0YWJsZSB3aXRoIHRoZXNlIGNoYW5nZXMgYW5kDQo+IHRoZSANCj4gcG90ZW50aWFsIGltcGFj
dCBpdCBjYW4gaGF2ZSBvbiB0aGUgb3ZlcmFsbCB0aW1lIGZyYW1ld29yay4NCj4gDQo+IEkgd2ls
bCBwaWNrIHRoZSBzZXJpZXMgaWYgVGhvbWFzIGdpdmVzIGl0cyBBY2tlZC1ieQ0KPiANCj4gVGhh
bmtzDQo+IA0KDQpIaSBUaG9tYXMsDQoNCkdlbnRsZSBwaW5nIGZvciB0aGlzIHNlcmllcy4NCg0K
V2Ugd291bGQgbGlrZSB0byBrbm93IHlvdXIgb3BpbmlvbiBvbiB0aGUgdGltZSBmcmFtZXdvcmsg
Y2hhbmdlcyB3ZSd2ZQ0KZGlzY3Vzc2VkLg0KDQpUaGFua3MsDQpXYWx0ZXIgQ2hhbmcNCg==

