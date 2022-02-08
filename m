Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Isp/tFseauWTgMYDFPOfGDx65QuCC85wHodFX6h03Jk=; b=383ZAeVOZ/cc8T
	rWpSO4mTQVZLhfgbqE4N2UJBeyKR1+nfFGQIhne0merL5jC1CPpJVWeX8yIAs63h5t8eQT7yiimyI
	hufGKknAgYINxC1nnLxSuiG5yw7fvd1Y3IpzTgdPRFNwK6KPB7rEMA3Efh94xpg9tKmmx/1x7YmTl
	Op8WRpxTsHZw3K44TACHBJKL1pdDtbddyKmOt5Gft1LxXMxHjD0ML6TMyBLjrY5RRtzQcVo6XZ/Wx
	lM9Qqeg4y8U6SSUj+/wkOSF/guSgJXH7uz33/HQTaHgMeMn1lC/VrdE4ZICk++6JgDfVkH7NupxhE
	gqAT3uVAaMBpOCugui+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHWpO-00FUOp-Jm; Tue, 08 Feb 2022 20:11:06 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHWpB-00FUM8-AB; Tue, 08 Feb 2022 20:10:54 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 53423C0A66;
 Tue,  8 Feb 2022 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644351047; bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=F2hE4i2mAxe61nzquY8a1dluKuu6U3KwBV2PcVNmelraY8tLD/7rF+QTN0BGAz/dB
 QVbwwO9oSX8BumYpr5h3LqGG8QTI2uJEw1LusBSlPf6Fw9hyCa3vd40u0+ikuMR1/1
 So1F0sZuO102Uq9tZglOf+BuA879dgkzib/ZQxRPXiQkjb/k7pt6kBLM0C6dqpUMn2
 xHdoE/K8Bs9qrFT/mmm+OXE9E447U+QtraQ8zw93w0VeAaKEyNZBS+7QK3Di7wiVRd
 4Gg2wat99PUPZZZ/kKnb5F8TU3q1mJINV6U8dR0yLhSjntcM1cu9PB82jQmiNx1CXD
 aaGTH16nkZCWw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E7367A0099;
 Tue,  8 Feb 2022 20:10:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D28580362;
 Tue,  8 Feb 2022 20:10:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RR9VZ467";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHLw5dw3ODKGVJlQjnXbq3/+IAiq0LmlnAETxOPxAwHaIWuBg864pKR2JDYY3dCbC0prJz1rnynylXtNp2oY82ubtTkaOWG8WRO7JgLP545P+f/M0LJS/qI3VSAphUl4YWKsD5Ug1IepUr7seIl96NoHjVcuhNaln7vURBtDCDh/yd9BCFyvHECQR5UROKKD+uT6M2bhY6OOTCF9MSbynxvqENoJ9MqBbuqLCu7BXC8BAy4c+BJOgBOyQ6i8ZTGEtSpbt5706qSEnLIKatQ4UP/8qNTvDBep82BWRrNGX19Ftv4Y8Vn2cCag7bySocg/BAnOBC+ns2NLzzdKkKWe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 b=GIOyPJN0bTdKi348hMdLGfxosLJAFAVaDFN6jjLKDEQeHl2sthSqehxYWTXtyd0lHZ94dHQqece+pKcsrFQJsAaYpU/bVIbImMqhKvbGpaO9ckeUeCW/lZCS/1+OsCe3SUcKse3X6aDFoppfZ0uAwvvPpobR5o+1bUhu7safCBaSl9OgkdPTwLudOXtsfwrQgEC0vuFEyJTv9ouzbYK1uNvOQpADbv4ShV3c7XdGQAhSkdyXEJfU8pON8wU6EOMiCwVI9DpnJFTe/KOZY9krLuW7vYXWasP9hlycQ8Is26EnIGkV5amnEhRXEjevgaRsYI1TBKhXJkwk+uXVFqKAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 b=RR9VZ467NlCLonNxOobxMdZhzMIc63/PYvIfoDuUK3u4s3Irxk1Bm9ozd6vuXuxBV89N32MV4vhuovrya6NOz8Z74jPj749SNUOGA+YIQ8NFWeHL88v5d8enCh4LtAplW8H4IBjdzt81yPlbjwU1r6jpYvqwwj6kiGqwR+xP/Tg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 8 Feb
 2022 20:10:34 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 20:10:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIAgAALfACAB1ffgA==
Date: Tue, 8 Feb 2022 20:10:34 +0000
Message-ID: <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
In-Reply-To: <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03ecfac3-7891-423f-ae60-08d9eb3f10e5
x-ms-traffictypediagnostic: BY5PR12MB4241:EE_
x-microsoft-antispam-prvs: <BY5PR12MB4241017756CDE6427B34C361AA2D9@BY5PR12MB4241.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jqKtbdpMQ88EAgc2V/KlPRFfR6yYa5zgfq+u2iKHhlufbi8IDCsDHUu81LQ9ZkbIfCEM77Ylfbrx+UpzVNKHXt/c1VzNjeX53yVaJnd7jPkPLUEGZNllBFiE5IrGbuC1FxoYXncrzIZpl7TIGNmbJqV6A16wS9sm66cHv5YQex58NuueWYJCjbqsCgax9NDbt/5h+NLh2GEbpZ9BHoQAzWjh/lalTyQQbkfcCtfVwSdyLNS+SYzLqAmPvivdnpCYBookjaj4vpeKdJQAgoxzlh55qFouMMJnkbSNf+Mnm/WuKZbcZc3T7Yhp85N0dE+l/O71BxFGNn9m9gg0oWGE220WVGwTVrPUC5QOPK+I1/BatxF83OjT89z/4vMiBS+lY4M1LFKZKGjMvrsEgFsjY96ovpNYbSC4Bzvsl7HhJhBjUqGKcUWAIGDVtuLlamhLnsta5M4AC6YFHolrJ/DK+d0RKQMRUOec43XxutuArhyHX5c3u0XcLwVtw6Q81ot6duS5fu0dI+iuc0Xy9ulPEqY26Sd608iM/C9S3stTpfGlKFSJ0Ws+iECGyXCB9dd7RzUEU5PClrs08hpPi0Q42yu9oQbdJppBZUhbTygv3qPFnBJGlYp8Wr6Run1e62wM2WSHVlN4nMN87t32CEUDvAOrCzt5yZ9+OkRx3Tior0jf17Ro/7wtWburnjZq2WP/pc5Gl7qLmzx1hiEMhXClOt+xkpauZ/5DbXyRujD2H+LyNVzuQ29cM1iwEsNx4VcIBFIZqsXtopRMxZVNCzD/bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(316002)(53546011)(36756003)(31686004)(6506007)(6512007)(110136005)(66476007)(66446008)(5660300002)(76116006)(8936002)(66946007)(66556008)(4326008)(2906002)(38070700005)(8676002)(86362001)(38100700002)(122000001)(6486002)(186003)(26005)(2616005)(31696002)(83380400001)(64756008)(54906003)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGJ4Mm9KUE9HcUJPK1l5RERZRnl4M21HUXVUL08yeXFVakFGSFBjNnB2bGdL?=
 =?utf-8?B?NFdhV0xXek9ad1B1Mk5yd2tyTUthTlhRdGhRZFZ0VnRBRTF3QitVTjRDYjlD?=
 =?utf-8?B?Sk9oK2EvR25CWlZHQWZRY25QWFVxZExrK3k4QnlPaEZBMStwOTNTc0VoeUxC?=
 =?utf-8?B?SzVVUFhvdUFWbWs1bFM4U0EvbmI1eDk2by93QVFVSVNoVkJHNkJsKzh6U2x5?=
 =?utf-8?B?UGRWM2NocHBaTjNjVjZOaXIvclpsMi9wQ0ZZbHdEQmZaYXBnU1QyL0ZWbFF4?=
 =?utf-8?B?TGFXWDdWWUczL1UwUFFvTS93VzBLSlhuNnZLS2U2b2xIb29NcHpBbElpZUZp?=
 =?utf-8?B?em1aRjFuTk43VTYvM3I1SFZqS3NLb01YOVpXVDI4ZkpHN1dDTE51dklUNSsy?=
 =?utf-8?B?bWo0YWdYck4rV1lNMDg3NDl6SWJucHdjY0VLdGhGYXd2WGhKUzIrQmhFMUpu?=
 =?utf-8?B?bUxPRkZjUmFIRHU0UklIR00vRzNjRjVLbXlKdVBWV2tXd2VrcGsvcHNMS09y?=
 =?utf-8?B?ajMxbVZBNG9DcHhoNUV1YllDOXdUb1ZVb0haVnF4bURSc0FsbWY0c0RJeVBw?=
 =?utf-8?B?ZDdrWGJZdjVKQ0Q1aWRwSFEyTnNPZ1d1MmRhc3J6K1BXeFRxTXlERUttZXdm?=
 =?utf-8?B?TDhUbkNQbitLMnl3RnpGYW55SUsxUlVyYmphNlVwSXljTlVWUEhsbk1VOVFj?=
 =?utf-8?B?T1NGR2gzTDk1TDd1SSsvenFXcUFocS9QL01Lc0lTRnIzNFc0M1VGUkVhcG1N?=
 =?utf-8?B?OEhWeXY4Y2RzQkdYbU5MdUsyaG9TdFgvdDVJODA1UUVQVDVobytPRVZlT1dD?=
 =?utf-8?B?aGU0VW9GeVM4bU45MTJnUTBQVzB6RUVQVkU5L0drRFZrcXBzbTA4S1E2SHpr?=
 =?utf-8?B?MFBKVG5MUGF1US82MUkwRTBSR3RXTzB4ODFmaDRicVl1V05sOE5QdG1EQjZZ?=
 =?utf-8?B?aE9JUkFOQjQrRHNySlVnTHUwdHVJamhwQ2tndmxoQ2g3VmVWZjUwMVVxK3Jt?=
 =?utf-8?B?N2hRbmdUcGx5SHpEZE1YRWtVNGlTa1hUSUZDZWpZNGU4bUdsaEgwdFo4endK?=
 =?utf-8?B?N25GYTlJR0c5ak83V0htT0NkU1hwd0ZOeGd0TG83M1gyQWZJRTVhWi93UUNT?=
 =?utf-8?B?bkE0bnVLajBEY1BiWFNLc3lyOW8yRmIwZzJ0eVVKZUFNNEhhR1lRMW1vNzhF?=
 =?utf-8?B?K2Q5cVZLOEw4VHlmbzViM2R1ZDEvdmYzaWtYamJKaSt0K3I2TGxudnlEeUp3?=
 =?utf-8?B?OFpTRUdOTDlDWTBDajVEN1FXMkI5TFVFVk5SMUFSQWd3UVArUmFPUFUwRUVE?=
 =?utf-8?B?Vm96QXVNZXFGMGpNTUJGMzZEZUF1WS9ZbXFHSU1IUit0aU9EWUUyYUEwMHl6?=
 =?utf-8?B?UUZUZTI1TkxxMFNsbWZpUzdoSTRHSU9pb2xKUC9qM3AwTUJxUGh1VEY0MDNq?=
 =?utf-8?B?NVpXelZHRFIrNDE3RnVCNkZPcXN1Y2h1aytKQ3FsdGpmTjMvNUgzVXJSRE00?=
 =?utf-8?B?QmI3THVQSTZNbW9jaWZUWDFodW9PaENwZEozd3dCKzlPTnFhNVE5WjdxSHZh?=
 =?utf-8?B?cjFGS0xGcjNXWjdWZnJWa3owMldmQ2Nua2lGL0Q5MHdJMUV5T1JnYXM1VWVS?=
 =?utf-8?B?VnQ3dUlCT3FrR3N3ZWp3UTJyakdJOWIxZlQweFI3QlZyQWk1L0ROb3lEOWh5?=
 =?utf-8?B?dTV5R2tFRldRSzVrZXVwM2ptSkFSby95OE9WRWhudTMvNlo3enZOQXVYdVd0?=
 =?utf-8?B?cTh6TE9RSGdobW1jWlFra2ZVdGNiVkhFWUttSnQ1bk8xelBFR0J6anI4emY1?=
 =?utf-8?B?b3hwNDRFeERmaWllTmxnaDJsanBoY3RkOWhmSE9vZmJXSisrTWJvZGxMSHF4?=
 =?utf-8?B?MTZXRHhVTGV1SUl6dkkzUERERUhKTXY5SUhONEhVUmx0K1NHR1dtTEhCM0RJ?=
 =?utf-8?B?M2huRGtlWE9KTjlaZ1lXLzJ0MllpSmsyNCs2QlJtUFA4aTh5UXRhTDVqc2ZG?=
 =?utf-8?B?VWF5ZnlBbTJrVmM3ZmMvQ1luMTIycnBTc0NjeUxRR2FHdzJLK0UwcXF3TENO?=
 =?utf-8?B?ZDBnK0daTmVWUnhFVStkZ0pRcEthd2dwYWJpWDhST1NpTGpXdTI3ZmZxanRo?=
 =?utf-8?B?eXpSNGpMZjJDTVNmQWo0bldVRmtTdVlKY3JGOHZNdkFJcExFOWhqY1pEQkNv?=
 =?utf-8?B?NEE9PQ==?=
Content-ID: <1C78DCE788E9C847BCDE3906394636D0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ecfac3-7891-423f-ae60-08d9eb3f10e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 20:10:34.4997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zI0COjSS9DCOecZ0SE08yD4Lr5p0MmFF9PwknipctUJ/mKtWoM2R1fgFxJoOaW2KVL0YOFPMoscLw/HgUGHDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_121053_426844_C829E520 
X-CRM114-Status: GOOD (  26.24  )
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

Randy Dunlap wrote:
> 
> 
> On 2/3/22 19:21, Thinh Nguyen wrote:
>> Arnd Bergmann wrote:
>>> On Thu, Feb 3, 2022 at 12:55 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>> Arnd Bergmann wrote:
>>>>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>>>> Fabio Estevam wrote:
>>>>>
>>>>> CONFIG_FB should not normally be needed for booting, so unless
>>>>> you have a graphical application in your initramfs that requires the /dev/fb0
>>>>> device to work, it is not supposed to make a difference.
>>>>>
>>>>
>>>> I'm not sure, but it seems like the setup we have isn't the only one
>>>> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
>>>> to have CONFIG_FB set.
>>>
>>> No, that one is different: the change for imx_v6_v7_defconfig was
>>> done because they actually use a framebuffer console on some devices,
>>> so the patch just adds the symbol to enable the drivers they are using.
>>>
>>> This is expected with my original patch that doesn't implicitly enable
>>> the framebuffer layer any more. What is not expected is for the kernel
>>> to hang during boot as you reported for your unidentified platform.
>>>
>>>>> Are there any other differences in your .config before and after the patch?
>>>>> It's possible that you use some other driver that in turn depends on
>>>>> CONFIG_FB. Does your machine have any graphical output device?
>>>>> If yes, which driver do you use?
>>>>
>>>> I don't have the answer to those questions yet. Need more investigation.
>>>> I'm new to this particular test setup.
>>>
>>> Do you mean you don't know if there is a screen attached to the system?
>>>
>>
>> It does have a graphical output device, but I didn't check what it is or
>> what driver is driving it. I just notice that after the reported commit,
>> something stopped working.
>>
>>>>>
>>>>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>>>>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>>>>> fixes a minor problem with my original patch.
>>>>>
>>>>
>>>> The issue also occurs in mainline, which has your minor fix commit
>>>> above. The revert isn't clean for the latest kernel version. I also have
>>>> to revert some of the changes along with CONFIG_FB. The revert looks
>>>> more like this for the latest kernel:
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index b1f22e457fd0..7cbc733a8569 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
>>>>
>>>>  config DRM_FBDEV_EMULATION
>>>>         bool "Enable legacy fbdev support for your modesetting driver"
>>>> -       depends on DRM_KMS_HELPER
>>>> -       depends on FB=y || FB=DRM_KMS_HELPER
>>>> +       depends on DRM
>>>> +       select DRM_KMS_HELPER
>>>> +       select FB
>>>>         select FB_CFB_FILLRECT
>>>>         select FB_CFB_COPYAREA
>>>>         select FB_CFB_IMAGEBLIT
>>>>
>>>>
>>>>
>>>> I attached the configs for kernel v5.17-rc1. The "bad" config is without
>>>> any revert, the "good" config is with the change above.
>>>
>>> Looking at the config, I see that this is for an x86 machine,
>>> and you have the FB_EFI driver and EFI_EARLYCON enabled.
>>>
>>> What I suspec is going on is that you are looking at a screen rather
>>> than a serial console, and the kernel doesn't actually hang but you
>>> just don't see any more messages after the DRM driver takes
>>> over from EFI_EARLYCON because there is no console driver.
>>>
>>> In this case, what you see is the intended behavior, not a bug.
>>> If you want a graphical console in your system, you need to
>>> enable the support for this in your config.
>>>
>>
>> It sounds like that's the case. Unfortunately I'm not familiar with this
>> subsystem to say that's what happening. If there's nothing actually
>> broken from review, we can ignore this email thread.
> 
> Hi,
> I don't know of anything that is broken...
> 
> I am curious how CONFIG_FB_EFI came to be set when going from bad.config to
> good.config.  Can you explain that?
> 

I just use the change above and "make" with olddefconfig option. Is it
not expected?

Thanks,
Thinh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
