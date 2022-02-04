Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F106C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehNuyuakp1x87TZQvxi9L7ktd29WC2QMd8o/+PmWShs=; b=utAbk1YqUT2W5V
	gHMGfqlRzw5EFZDBl6K7U1I+EupD08wHFOtP/XZG9leG6SrWpldWT+j/ZBGZGcugauER3j9AUa97u
	BlOjRbr0kGKUHJ7CVTY3j8soo1BeuwCfwX/mridvLYuh5XfG8zNHqQeF8zvXct8YMtauETaJ8gmdk
	R4qrj7i+UE52cYfly45GnSEuIrQylHwWjknu2Ow+vJXPKgNwr1f7WKqHv7htn8qrjenktW4Ldoova
	HHb2tuEdH1AdhHSaNWroFhpuY0dtPpph8b5GqAFT3K6VOcs5pGOSWUCGjMFnlw7/yVHMd0QsDqd2I
	6rkvIXJm1X8obH7zTDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFpAM-003NLV-Mn; Fri, 04 Feb 2022 03:21:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFpA7-003NFa-3y; Fri, 04 Feb 2022 03:21:28 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E175E404F7;
 Fri,  4 Feb 2022 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643944884; bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SdqoWGLRoa3g3Zb8W4EeO39yT9l+tuawhBo5D94Aswm8gH/80qvd7nqIiC3aIH8U8
 H7C+E4Pnk1MDPD+d9lVwbo9Pbqm3orEefgrzHuuP4b1PxZnO17Yl8NVz5XqYOw9hF8
 qJ6uyDoWj9gFg5xWOJCVrkSMI8i70rsCj/+0SBNBOKYLcOGOr5DHiBBGTXzE+D1y2w
 8zJI8HuvpM0tyIPG7zmZQKrMHmtUKWUDNEGB+IcFCCUwCRkX/jL8x2X3cNyMqQaWmp
 fyWYBb9OU/12yYk0deu0/4mhxsBMr2EApRN0lEtO/r9cvBzo3FODqwAku1cqgUPfY6
 NqUdUY40VDGkA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 42C12A0070;
 Fri,  4 Feb 2022 03:21:18 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6FA5540077;
 Fri,  4 Feb 2022 03:21:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VYRsK3AG";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np86HeyxHDt8KkxIhfZ4q3rr9EPH+bDPLN5t3zvyjHcOR7SMdWagS+IHmuYgnrcdiU1vocWvsnNkMNXhYS07N1nlU/QYiulofovCQdgV1Qb/K5kZ2pfr6ACauXahbq51QUDYly0W1g9moukuhU2qGwIA+BG6IkRZ1cjPxiZjhPjtP8cUdiGzVR7xtkRFZAGFDBjmmD8MZPtOCHTZeD90LstaqhYY35XE1UNMN0r98+jeHa3PGSnqxqQYMBm0vOSFenEX/n7WsVYhX/hab5cm8sOuxAjXYb0Hbf8RAR5H0pzV/LPZiGk0JUomww/VhjgrUmqeAQlkBT55NZEnFjsJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 b=O0yE+pjPzzbJgCWJYVnaueDCn0A43peU5+puhf9mfP6lEv0rN/gUVVtrfnwva/Z1FUE3xLlYK+ZiABJtYDCmXLSnQ73S3D90CHlkhV0vIRLvH5QrwRqD0M6/GTa1khQjzh8fVVccM/NqNOY+ONdQiAF5ceu9EpvvV2Bg5KiPFR5kpNNUiw0BqnDwHMjulTiOSPIVfF9T3gsSE0siirn8lVU/t9KvaAF2Tmw5tXI1qPcKV7vEEi8I3MQSaXEslBEXuucehjom8GsWSk6RCfBcj52amHWbm7cjlH7sjMQeTSlJKNhSR+MOhf7LOwxTHJ6Klondd4sBAkrgUPX3vFxGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 b=VYRsK3AGuRlamJlcSo2CFOYedc5anw8zt6/6gZ6VMqcolytKcEcDngB/eO+mM5hgw20sgbIpkWlyR4mjLMMsLaU8rpnqaaMIcOvn39VTXiV1egk0WaZFs7qMJgD7BKRsYRo22n+QVDjgUWjVujaozIWmAcZ4TdgoA3TtcX34Yso=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR1201MB0266.namprd12.prod.outlook.com (2603:10b6:4:57::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 4 Feb
 2022 03:21:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 03:21:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Fabio Estevam <festevam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIA
Date: Fri, 4 Feb 2022 03:21:09 +0000
Message-ID: <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 760acddf-240e-4efd-6071-08d9e78d6360
x-ms-traffictypediagnostic: DM5PR1201MB0266:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB026624D81946C17AA8B24469AA299@DM5PR1201MB0266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mS+TA3bYJyN1XFUzXALdkLNXGvLTGt6WDUlPMyqcaLcrdD/+b/MVdvNcacbpo6K+eOj/Cr/KkjQk3Tgf2HkQ+CwZ002sWts7mu/eJNP3t5D6MEWFEwTN9IK31Or441y7bn23qJtCr7KnWyAIVVx1eENzOJwr7OEvORDWLGBpdzAUYx4pwNFCEsiendOuKa7hExUzjKJtXIdkRpOeamIOFpRM+cYUVwey8YNt8mDOFgjDJmeLR3PlSryGSCWuVlsJ09koLL16hYmUcFvA4IrrNtgSiQvChNCyQVlCE+bTBQFMhTudx+bwNBqqpLOD8EWmmwsX9Sll9UHi2PfzGzKVG4FeEy+DzuAaYzsMO9ZkutqEOrCW8VwACigzt7YtiuE4u1nHH9/kZ49mdtTkxcuFx8to+1jVLQhG+ADFOtw1ppkNSCdiZunR2Xa1kCX2TIzyEv0cNFLdwMwC+DTSasQ25C30vhUEGPiUl3kW3RyhjePekHT2hfUabxdTuzZLB3fTk3LKg1jD0c5e3RlXU7SobcdkXCoD/eTZlj2wd1JD7QB8czMZf4ZJCLXq4IgwkZ8b7+DHrUeFzC7tDPkxjHxBkw024VOSZeFKnBJdAzbJJ7lvzhLrGzHKUrRyrF7wvVCuR0X4r4OonN7zjONwmOMBfU1ByPhlAtsNCdGFe09p+8a+k3vruPctrrq/TND93Si9VnHGmZiulMlGtj38P7uLTDCAW930L7bA44wELWQWN/cNtYauUW5rIZIbdXqdDicwUxpCv3Z/zkK7I0cxGIN7uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(8936002)(86362001)(31696002)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(122000001)(316002)(6486002)(53546011)(5660300002)(6506007)(6512007)(26005)(186003)(2616005)(2906002)(31686004)(508600001)(38070700005)(110136005)(38100700002)(36756003)(54906003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDJEOURwZ2hOY0NvWnRPMVErc2QzcmhhQ2ZlZlIxeWVBdnlXUHZ5UXlObFNm?=
 =?utf-8?B?UnRMbGZHVFdMdnpyUWJYUE5xWHo3TFFsTGFYdXBuZTlyQ29xTG1CM2NramJQ?=
 =?utf-8?B?WkV0T2JsQXFNaEJOSkxjVEZ3TUsvaDcrRUJTaDBHTHJjVlMwYXRyQU5wMFpu?=
 =?utf-8?B?dk9Nd2FCZ0lGOSs2N3hiclVVbEw3OVFnQ1A4V243cVRGU0RzOVozWVQ4UXdQ?=
 =?utf-8?B?NzZ1ZXg5aDVRenEweEJJK0RPV2Q4SjNYU1Biaytsci9EQjQ5QnRRZDh6WVl1?=
 =?utf-8?B?SDVCdjVyeUl6U1lpNzQyS3l2MzNLajZ4TGFWbC9WOENWMG1WWXk1UnFVandi?=
 =?utf-8?B?LzNOb3pUMjNCbWZxMUJKaVh2NmluYzZ4YUQ3ZjZVRm9HWlZ0WWpyMU55MEE1?=
 =?utf-8?B?M1BNWlk1QW05VEdVRXJGdWZPMFV5UlJNTkxLOWc4Zmo0UFRwUi9sdk80U0JV?=
 =?utf-8?B?K2MvZjdQSFBXUkJpa2dYVDVMZ243VFdlcmk4c2twbGFsTmRlTE1ucStYWUZk?=
 =?utf-8?B?SE1iNEd1dnBZeHBYTHpQRlZXRm4xU20weW5jWkFiSXRORzZjWXhnQ3BwL1hD?=
 =?utf-8?B?bVlUYWhXZWRuRzFKK3RXRjVrUHJ1Z2JoQlNYVURXT1ZUOWMzWXordFU4WThy?=
 =?utf-8?B?SzJGKzRqVERVN0MrQjdKOFl6KzVQZ3k4cUM2c053dDNUQlllWHlFZkxoaWxM?=
 =?utf-8?B?VWNZODh5OUw0UHRyYzlWWUQ4V3U5ZXhOUG9aaXdYKzdqMjZQVTVYeTBuOFJh?=
 =?utf-8?B?K0RjamQrNENlbzA2R2tpMHdLSTNUZTdvUVFHNGN0Zi9HendqT214R2lCYWM4?=
 =?utf-8?B?N0ZhUTdjU1BDa3VtZXF2WWEwMFFreWpNVTE1SXV4aEkzK05uTTQvMGxvbHM3?=
 =?utf-8?B?d3ZpMVRIc2dDeENFaWY5OXMxZS9JSFNyMUE3ZENNOHg4Uis4UUJnL1NPREtW?=
 =?utf-8?B?aWZ4a0VjSGMvNzFxSk1pMWZlZnJHbjNQaGpocklPUlZQTW82Y2lMdXhBQjN4?=
 =?utf-8?B?S256bnFRTzYrT0NwMVJubEltY0JpL2oxbDZjNDlHcFR6dnY2K2hzWjBaZTV3?=
 =?utf-8?B?WWtKMDJNNFpYcEFsVFFYWU12MjgycGRwRTc3SGRaTFM5Tm1OYngzRTBNZCtU?=
 =?utf-8?B?ZlFMeEdERldObE1VOWZkYzFHbEhPTEVEeFVrWG55QkUycktUUW5Ua3BlMVV2?=
 =?utf-8?B?SGlmeEFhVjlkUStpMWt6R3ZLZFB3R2VMNUh4WUlDaEhzR0xnNUZJSDdlaUpq?=
 =?utf-8?B?NkJiK2xCVGJmUkJER05xRUdiRDdkM3l4S1RrUjkrMytzbFkvbVVkdnkzUkJM?=
 =?utf-8?B?WmJYSzFMWEIvTmw5TDZLT2poVXhwSDBaWUViM0xBb0hjc1hpbFRiQkV3NEJG?=
 =?utf-8?B?NVhwY2ZtcEJVTURhMW40STB0U3FqdUVkb09yYkFXNklheWthUWMvNnhZN0pw?=
 =?utf-8?B?T3pnV3EvR0NtQkFmRDV1M2pDVElxNUJMRyswTDZwRmN3VnI4UGRsa09XWGNT?=
 =?utf-8?B?M2diSGQ0ZkJZSURrRWpBTEEzMUkzZGRXQWRpemZqVFZ6RjIxaWxKTGlZLytj?=
 =?utf-8?B?ZU1lYjNkTlk4eXZhTmQveGxOWDBRenBaUXRYMXV1bDFIY2dhMjBwU3ppR0tO?=
 =?utf-8?B?U1lDaW1iZEpVbTVSN0Y5aHAwUHlOL2g5SEQvc09WcVlWclhlVWJmZmVXY0lN?=
 =?utf-8?B?TXhKM040aGhIei9ISzhPNkdRMVJ2Z0lyZ2FycGp6U0hadEJtdG1XSldvYlox?=
 =?utf-8?B?YVd2N3pYbmRFV0xLQzhab3hqeURUUEhVeEtiM2lVbG1pNmhSZ3htMm5UMEFR?=
 =?utf-8?B?WWhyeEJTczY5TG92eDM5R0J2UmVuSCtrb0lsbUhEdkM0MklGTUNZOTlGcmhV?=
 =?utf-8?B?TG5wZ1N0Rkt3OSs0UE5XR01NRkdPVnV6UUZ3NFhMNEl0dkl5TGpUcmpRQmJP?=
 =?utf-8?B?TTU3U2Z2SzVncElzK3ZzQUczYTdpNUgvVE41U3VMaG50cUx0ZXY1aVJUZWdq?=
 =?utf-8?B?QlQrcElnTWttSDBuNExoZ0RjQk0xU1N6TDhQVEF0U29EYzJtTmVVbDFNanZw?=
 =?utf-8?B?R2JRVzJKRThxRjh1dnNOZDg4NXAxdEhaT3Vtd04yajdPbk9IckdHTERXK1M1?=
 =?utf-8?B?RkNWY3oxbG1zWFJxSWlKN0J4Z1FDeitYSE1rbTc2MXRKZVBWNDRjUExQdnNr?=
 =?utf-8?B?eUE9PQ==?=
Content-ID: <5CC459F5626E1C4FA55172EDAA14C098@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760acddf-240e-4efd-6071-08d9e78d6360
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 03:21:09.1114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9LY5kEvRwpclLAKrE6DbRK3Y2HgsXkFrKF9VgRWozInrer3RT2GXkwFaHi7/G/Ajf+jstsIVcWZbE8C/LeohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_192127_273869_F6751B8F 
X-CRM114-Status: GOOD (  35.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arnd Bergmann wrote:
> On Thu, Feb 3, 2022 at 12:55 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>> Arnd Bergmann wrote:
>>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>> Fabio Estevam wrote:
>>>
>>> CONFIG_FB should not normally be needed for booting, so unless
>>> you have a graphical application in your initramfs that requires the /dev/fb0
>>> device to work, it is not supposed to make a difference.
>>>
>>
>> I'm not sure, but it seems like the setup we have isn't the only one
>> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
>> to have CONFIG_FB set.
> 
> No, that one is different: the change for imx_v6_v7_defconfig was
> done because they actually use a framebuffer console on some devices,
> so the patch just adds the symbol to enable the drivers they are using.
> 
> This is expected with my original patch that doesn't implicitly enable
> the framebuffer layer any more. What is not expected is for the kernel
> to hang during boot as you reported for your unidentified platform.
> 
>>> Are there any other differences in your .config before and after the patch?
>>> It's possible that you use some other driver that in turn depends on
>>> CONFIG_FB. Does your machine have any graphical output device?
>>> If yes, which driver do you use?
>>
>> I don't have the answer to those questions yet. Need more investigation.
>> I'm new to this particular test setup.
> 
> Do you mean you don't know if there is a screen attached to the system?
> 

It does have a graphical output device, but I didn't check what it is or
what driver is driving it. I just notice that after the reported commit,
something stopped working.

>>>
>>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>>> fixes a minor problem with my original patch.
>>>
>>
>> The issue also occurs in mainline, which has your minor fix commit
>> above. The revert isn't clean for the latest kernel version. I also have
>> to revert some of the changes along with CONFIG_FB. The revert looks
>> more like this for the latest kernel:
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index b1f22e457fd0..7cbc733a8569 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
>>
>>  config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>> -       depends on DRM_KMS_HELPER
>> -       depends on FB=y || FB=DRM_KMS_HELPER
>> +       depends on DRM
>> +       select DRM_KMS_HELPER
>> +       select FB
>>         select FB_CFB_FILLRECT
>>         select FB_CFB_COPYAREA
>>         select FB_CFB_IMAGEBLIT
>>
>>
>>
>> I attached the configs for kernel v5.17-rc1. The "bad" config is without
>> any revert, the "good" config is with the change above.
> 
> Looking at the config, I see that this is for an x86 machine,
> and you have the FB_EFI driver and EFI_EARLYCON enabled.
> 
> What I suspec is going on is that you are looking at a screen rather
> than a serial console, and the kernel doesn't actually hang but you
> just don't see any more messages after the DRM driver takes
> over from EFI_EARLYCON because there is no console driver.
> 
> In this case, what you see is the intended behavior, not a bug.
> If you want a graphical console in your system, you need to
> enable the support for this in your config.
> 

It sounds like that's the case. Unfortunately I'm not familiar with this
subsystem to say that's what happening. If there's nothing actually
broken from review, we can ignore this email thread.

Thanks,
Thinh
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
