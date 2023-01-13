Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6722BC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYbeQh7Rgw1KknPgPEBf6Uxnq0LgTEYU6DiZQiPCXTw=; b=iike2IdpEnTrca2N0nbVbv1s+B
	WTbe116LH1ZNAtnSAm9KH3OerqSphNj67cz3qT3rJ6tXrzQfZkAhpdlRP51xJKPLCDLFtdWiSzsmt
	MYFLAV+FNJCXcGN2xHU77Jrbs6XVawIA+bLAoaX4zao7vZ3oef0XeiqVwqxqC5y4iQw63OS5jkNni
	zvUC3ah1ldEYw+inDxB97IVJF96ffY5efGZ0N9P6BJ+0iLHQ5nBa1LyMcj5pSqZmDCdVB9PM/iMsc
	C8fJxtPvUU19yV1VR58hbCaXCq4PTvY8WcKnoqzVGRxysEngZwbLM26hZJuy2s8SyfarChG2gokki
	NfcBz1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD7u-000dzV-Qu; Fri, 13 Jan 2023 06:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD7e-000dxK-NJ; Fri, 13 Jan 2023 06:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=NYbeQh7Rgw1KknPgPEBf6Uxnq0LgTEYU6DiZQiPCXTw=; b=quk0wLx0A5VUvqFA2vOVuqh07E
	r18pkNCf5xZn7T3bc2L4XJswpGKnvB0GxIiprZbs+GNSK0q6ozC/2EzzrIuWrtgoW9FMbHrfDkZvG
	jjCFFq+XQxXfUPAJwyDqq203GrKOTBdgqjZCAMJdYJMA+gWRzRL3b3aVS2z5n6hpRdJZvrpvSekTi
	w5LcLIDSvh/E1CM4QR/bnuZpgB7ApeHHUArh586RtHf1FTPpKFksqmIFbPLf7oo288ra8bq4B/VkH
	GVYxaWvYAykDtYcCSEY0nnb8WB9rtyBi565FapN4xGg80znJnXAwS99wAIINW02TYe+0VCUsoT5XN
	nXYp0NCg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGD7P-004FMZ-1s;
	Fri, 13 Jan 2023 06:00:51 +0000
X-UUID: 9f6e3542930711eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NYbeQh7Rgw1KknPgPEBf6Uxnq0LgTEYU6DiZQiPCXTw=;
	b=PwWmZf7LpqsdSAKthP5lAa08228STm5VEK0ShPH7eZ4MGtDuZagdGnPyW6VibYs7G5h4jcwibuPX+gnNve7sWC0QPhFeDwnAGrJJiqOCkC/qwbEgPAZg/SacqmMpNIOnriOCKNXFAB99vV/UhIqnWgdZ75WJ9KBIrd8Tyn24CWE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f9258bbb-4d6d-482c-88a1-4816d88d7eba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:46e18a54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: 9f6e3542930711eda08d4d6090ec5a5c-20230112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <lixiong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 933430989; Thu, 12 Jan 2023 23:00:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 13:40:11 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 13:40:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hb0ZEHVrNiGQl3dwi1l0PV+s5TXR6YiP6egbLVXI+dgS12W+G+AoDDb313HF6+CvHmyJHsygOa/OIoAkRElIwxg54+Ikiwpd7BE2UJzRdIrIZ6nQn31mpu3yqU33Ar6R1CklPSIYQeZw6ug3VskA0xhoDJ1ri6AKfTGk0o5uHGvcHZQCdof0OAfCdnrdg/ozVRAnN+3PRYOqFc9P2c0E797c/i3D63KbiqqMc7OaKtYcF2fvcoqiczhclfmrPur9eA5UyEBsqZ8YHl+E/eo4JUrRSmjbbLuLzo+jZgzmNmlFxpjRqvGtFt2Pk2hmBB+M2AGBn812Zrs5mDHHARJt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYbeQh7Rgw1KknPgPEBf6Uxnq0LgTEYU6DiZQiPCXTw=;
 b=eatEf4lstLzvnOnMrnOlOpFLCjryOdC1CyuM01SVKZ8GP7Hrmq2K6kTllxnuneQlgms8Y19R7J15A4slIlH+/blEeH4x0Cw8Z6jBWyRkqKFYORgGyMpWTtYZ1+DKLMjp21i/Tkc62liaSACMw3UAxdkHp/FPorlKEYPs0eiwDuNNg8Z25xyw+O0vGtGnQ4GeclME2B8PhI8+J/oLtSE7+IQCm7WCy7pEBBEl5vqxvFWFiHHR5w5dzyuPbj6FkeCEEj0dm/fbwPU5D+9Fyc1AClpZhKprGHYOQrT+LCW0IF5QwC7iKY6JVLuDRmkgPuoA4nuwd8egT6aC6grqPqNu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYbeQh7Rgw1KknPgPEBf6Uxnq0LgTEYU6DiZQiPCXTw=;
 b=RFUNMO/2x0xxQwk7dIg92fvy2RcTSDXoBFmNhOidXkEcnwpRAffSdx2RXl29oNaz3rN05h7HrAxg1UB6WFlIl+2WXLlwNhEj8u7eFaW6OxTWFX6b7TTRHmq9TYtTzSEJZLxlhjq138LSjZszbuLpSEWUz3/DZ99msWtTGdaBDqY=
Received: from SL2PR03MB3947.apcprd03.prod.outlook.com (2603:1096:100:45::15)
 by SI2PR03MB5243.apcprd03.prod.outlook.com (2603:1096:4:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 05:40:09 +0000
Received: from SL2PR03MB3947.apcprd03.prod.outlook.com
 ([fe80::ecdc:147a:dee8:be1c]) by SL2PR03MB3947.apcprd03.prod.outlook.com
 ([fe80::ecdc:147a:dee8:be1c%7]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 05:40:09 +0000
From: =?utf-8?B?TGl4aW9uZyBMaXUgKOWImOWIqembhCk=?= <Lixiong.Liu@mediatek.com>
To: "tj@kernel.org" <tj@kernel.org>
CC: "lizefan@huawei.com" <lizefan@huawei.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "cgroups@vger.kernel.org"
	<cgroups@vger.kernel.org>, =?utf-8?B?V2VuanUgWHUgKOiuuOaWh+S4vik=?=
	<Wenju.Xu@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?SmluZy1UaW5nIFd1ICjlkLPpnZzlqbcp?= <Jing-Ting.Wu@mediatek.com>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	=?utf-8?B?V0ogV2FuZyAo546L5YabKQ==?= <wj.wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?QW5kcmVzcyBLdW8gKOmDreWtn+S/rik=?= <Andress.Kuo@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: cgroup user-after-free
Thread-Topic: cgroup user-after-free
Thread-Index: AQHZJmsW9ZxsTkmTF0qxxstxXHzhsq6bi+8AgABKN4A=
Date: Fri, 13 Jan 2023 05:40:08 +0000
Message-ID: <f8b24df3bd009d112479e9d5db36ec4afff9bb71.camel@mediatek.com>
References: <697032f2331a92eec0e03e85e46cb78bd975a788.camel@mediatek.com>
	 <Y8Cwdsk5pYNd8fX8@slm.duckdns.org>
In-Reply-To: <Y8Cwdsk5pYNd8fX8@slm.duckdns.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB3947:EE_|SI2PR03MB5243:EE_
x-ms-office365-filtering-correlation-id: a602c7e0-50ad-401b-61d0-08daf528a1ec
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /JOb0ainymwvjQKiVTnUKMacCUZwV3s0P8S/k6xngk/BNPyQQBngcfUoAGziP6casM+WCPPWedN0fB+F67UTik1CUvqUXPEZL363aw80jbEdDxqjKDtq3xlIfO15u0Oevy5JjZZW6zxTMVLXEYI/iemvXoHpGfkiaJVaZDWnJTkLlFVvrnoJBKBWb+2Zqhjo5P1qo84gQY4K65rCRaBMChbEit5JJD0t/SrMYeCllE85dMiT0ebcMhCOQhe/tdo49kB18ecwFCIDiIxmN/Iz4CYb4uovD1sXWvGGUBq03T6Cw9ih+o+5ZiBiGLK7Bbd1xZXn4f5EULFbIwKRC1HdthsUGZ3ObEyE//ssurGiBEbn0Ro+t2pc+biO7eprU2/o/Fy+TsQQCcSRjOXMqsox4qy21J7Sj7R7YDoCGPwrlmocyfmm6FXVtaiIiSQeLO4lZKibn01L/nWaTdeLGi114PeXDRlmUNBOXTPxpjUjkXw02/e7QT+Fu9Go0AY+w+gHrIML89RqoH89hJRflgH2ZCe0Ja+JIZE6Tv8ltcPEA5wV6BT8LrJ3gzJB9RsioWnRFJve6SFtlPJcoW3EIIJrB0YB8JsG/F+K1WBwWSImRu4aVGgILG4BgzxnaJYi8lWpgjiHRsn8ICKZqg8XkYO9kPFq9t9okYOYvLujKvI6AeOZGOANjUwZ8ujpRdRNgeY+nZB0ggTjhamwlxQf3H9hlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB3947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(316002)(2616005)(54906003)(26005)(5660300002)(41300700001)(66946007)(3480700007)(8936002)(64756008)(76116006)(66476007)(8676002)(6916009)(4326008)(66556008)(91956017)(66446008)(4744005)(2906002)(122000001)(71200400001)(6512007)(38070700005)(186003)(6506007)(85182001)(86362001)(36756003)(38100700002)(478600001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkpUdld5QVJvS0dTVDBhZTV0alByai9CL1FXZUd2cVMrempiek43elkvTEpq?=
 =?utf-8?B?akQwclJsMVIrNjZWaTZYUDY0T0kzMGVQVXdJYUxQcWFuMDViSzBmanlUek9J?=
 =?utf-8?B?d3l4RWNiOWRYWUdzMldwWWd1LzFxSTBUR1lPT2lEdXNuMDJ3YVNSNlpLNHUr?=
 =?utf-8?B?Yi9IT2MzUS8xNm95cjlFMGx3eGU2MkZkWmJZZzQ5NUxKM2pGaXVBVlY2R0N6?=
 =?utf-8?B?WXdUU1ZZQkgvN1JCVXJLL1ZRR0ZSL29lSTc4VFRqT1lXTVh6azFTMlRoeVAy?=
 =?utf-8?B?MllJejd4UUMyM2k0SmVrMUhEbXp6RUFpZ1R2V1RuMi9HSW55aEdnVUVXVkk3?=
 =?utf-8?B?UERGR2x4OU1rVHVIVHYrVUt2eHA4VEVmUDhBZjJTcFp3Qm1CMUR5MXRvQ1A3?=
 =?utf-8?B?NXJTem81QW8ybDcvZy8vM0szR003bkFlNGw0SmM5V2VlSDJtVTlMdWhWTWRp?=
 =?utf-8?B?Z0hJSkVta3lmLzhmV0NzS3doeVZPVGl3SUNWTFNKbVhKY3R3aGcrUXYwTVJJ?=
 =?utf-8?B?S3VheVNsYmlZY1o2QzJDeHZObnREWHJuVnVJUnU4SU5TU1Z1ZzhuUk9lSU9G?=
 =?utf-8?B?bUMreXFFYVF4alZmd1ltSlpNNkE0aEd1cWFWRGlrU2Z1STVaYjBaTXJ4aFNs?=
 =?utf-8?B?WDU2dlErcGpGNlZxQ21XbTlBTE5HcUJiWXhzS3hYQ3NjUDJqamJCY2VxVmxx?=
 =?utf-8?B?UXVBUkJFdlFnRVlaVHlIZzh0TXdZOTNoRVJCek5BTE40TS8vTGtqNnZXZ0ZT?=
 =?utf-8?B?OHFNUktETU9Rcm5PaGdoejBNWCt6TTJDbmNKcnZQUk4yeEZDWVJHZFg4UjJ6?=
 =?utf-8?B?LzZCRDllUXkzWGZ2K1lueHU2azRlenh1cVBZNDJlbXZCdW9LQUZmdkhkN0gx?=
 =?utf-8?B?UkUvY2dCZTVPZkUrUHM2ZllqYW1FVUVwV2x1MkRUV0JIRlpyZmgyOG5VQjEv?=
 =?utf-8?B?RmVGNTg0bVZjK05QYnpIK0tCRWt2d1pHYm1SMXdzSExzNlNsdUNzTkVsOUlu?=
 =?utf-8?B?NHhkQVFERzladDVWVkQ2Sm94RGF4em9uOWhhN2FBeWNSZzRZSW5OQjQ2dU9t?=
 =?utf-8?B?bkNSYWxGN000RTdzeENWWTF5UFo4N0FUbjl2WmpGQzVVUGpkVUpUazFucW5B?=
 =?utf-8?B?OHlqTnhGYWc3SjMwcmNJdmNPaVBPTDFBQ0oxNTdYV3JJeUg0UTljZno1eXpY?=
 =?utf-8?B?a1RORWRENUpxeHdodW4vc3JXQ0hVRmhYTlBpeVNSSjJkaEg1dkU2TitjblR1?=
 =?utf-8?B?UW0wa3FLQjVuRnhSNlZGTXVmUXgySW9OTmVWV29KQUlyWURDeUdYSVd2K3JQ?=
 =?utf-8?B?eWdmWlp1c3lVMFZEZjBpdXprYWZtNWYrZHZnTWl0WnF1R3lYUzRuWWVYeUsy?=
 =?utf-8?B?QUZnMTg4UGx5SjJRZmFYR205QzBDSjE4cHp5Yk9kMzljTDltcmFZa3ZpRXlS?=
 =?utf-8?B?K2VqU3dlVnlCcUpOVE5najVvMjNQRDZ3Y2lIUCsxb1hJc09lRGhPTVRNeTd6?=
 =?utf-8?B?bzBWWHBWdDJzMThDU1ZGSFliYVZCZW93UTdCc0s5eGVpS3dTcmI3L2FWc250?=
 =?utf-8?B?QXloVzJpNWZneWk1TEh1azBpdXFOaU1rQzBNVEFnUHp4dnIzVHNDMmVPNjJ4?=
 =?utf-8?B?NDNsYy82TnNTQVBTbytNREN5cEUvcnNBaEpoY1pOamxQcXZnRHRDYi9YL1R6?=
 =?utf-8?B?L0tWc0puZlFLTWYzUUhtUEpuWkFEcUVpbG1wVzV0TFdsVG05YlphcXp4Y3hR?=
 =?utf-8?B?NTBqMjc5RzlDdWpPcU1pbDJIa3ZtYVYyWGdwS3MzaXFYOGZOeVhlaThLRjg2?=
 =?utf-8?B?aTlvZzF1dC9pY0dHeHRHaGxPaWRmK0tEL2s3S3NZbk1UVjVxc0NNaHM5ZldC?=
 =?utf-8?B?ZTFRclhxWGZHSFdvVXVNK0s5aGFkWk9CQnNiaVlEOGpEYUJTU2VEcCtCUitW?=
 =?utf-8?B?OEZ1bWxDMDVibGwwUXE3d3dpNjR1eWF3dFBzeW1menhiK2hhZy9hTmptTDVw?=
 =?utf-8?B?OXJlWEpWbnN1eXVyN1RqL0dnTW01RW43SVp4Q2NFeDBRVGNCd3NsVWl5MndI?=
 =?utf-8?B?SEE1Qm5JOTB5U0ZOUlRvY1I0RTF6ZHJDbk0rUGt1VDdlYWk2SmRvbGcyakNr?=
 =?utf-8?B?Uno0MFprbDBPaVdDVk1JSzZ2QXAwWkRkWUVtM01XQ2dxTjg3ZXNKSzI3RHNB?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0A90EC1935DAD4A9CBB0ED17B719D39@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB3947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a602c7e0-50ad-401b-61d0-08daf528a1ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 05:40:08.9841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPmLOuN3YaYTKmLyIZv64VkI2+c+9sce5UO1CviXJawcQ4+W/Nt+FWsCsTBhbjIwsXCDZ7deLvdT3HRV2UkVY2/uG4KpisfjehI4WgodCrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_060049_732684_4C98F77F 
X-CRM114-Status: UNSURE (   9.52  )
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

PiA+IFJvb3QgY2F1c2U6IA0KPiA+IGNncm91cF9taWdyYXRlX2ZpbmlzaCBmcmVlIGNzZXTigJlz
IGNncm91cCwNCj4gPiANCj4gPiBidXQgY2dyb3VwX3NrX2FsbG9jIHVzZSB0aGUgZnJlZWQgY2dy
b3VwLA0KPiA+IA0KPiA+IHRoZW4gdXNlLWFmdGVyLWZyZWUgaGFwcGVuZWQuDQo+IA0KPiBTb3Vu
ZHMgc2ltaWxhciB0byB0aGUgcHJvYmxlbSBmaXhlZCBieSAwN2ZkNWI2Y2RmM2MgKCJjZ3JvdXA6
IFVzZQ0KPiBzZXBhcmF0ZQ0KPiBzcmMvZHN0IG5vZGVzIHdoZW4gcHJlbG9hZGluZyBjc3Nfc2V0
cyBmb3IgbWlncmF0aW9uIikuIENhbiB5b3UgdHJ5DQo+IGl0IG91dD8NCj4gDQo+IFRoYW5rcy4N
Cj4gDQoNCg0KVGhhbmtzIGZvciB5b3VyIHF1aWNrIGZlZWRiYWNrLg0KDQoNCiAgDQpCdXQgd2Ug
ZW5jb3VudGVyZWQgdXNlLWFmdGVyLWZyZWUgdmVyc2lvbg0KDQphbHJlYWR5IGNvbnRhaW5zIHRo
aXMgcGF0Y2guDQoNCg0KDQpTbywgd2l0aCB0aGlzIHBhdGNoIHdpbGwgYWxzbyBlbmNvdW50ZXIN
Cg0KdGhpcyB1c2UtYWZ0ZXItZnJlZS4NCg0KVGhhbmtzIQ0KDQoNCg0KQmVzdCByZWdhcmRzLA0K
TGl4aW9uZyBMaXUNCg==

