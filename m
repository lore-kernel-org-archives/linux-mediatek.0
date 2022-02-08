Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kljCvzlhXRfbJoQDIyNioSx0Delc67MnBRyZZToDB4o=; b=z4BUbrYW2/uzWz
	ornzRhVUmE6xuMppEd9OqWwU2XwxoqdeD0gAfecy7Ux1nsCAdnfY5H4M0pefo8h6YznKSMaqtOY5V
	xXrfqNEOYwOikIl08xvRLYkOBvm8FUDQ1TZtFWU7dvLl5lp9x+bN/B9GYzTaxi5cOYm7yda4B1ZdD
	cFPj+7Qtc87VtqlYHa6CTiN5NR/bgnD31c6CcOo7R2vIHYtyUcdeCGsiyi0P9FYV7SRHt1fmEnYEv
	qalN7drSc5sFxli2A5C2L09KnOzPgYNYmIvSPSSFmht053YDVq1VDZr/pfEiMh5aa0CTVQefySzIx
	AKeLNf5RCkq6eaNGULSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHZCO-00FjRX-36; Tue, 08 Feb 2022 22:43:00 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHZCA-00FjOR-UL; Tue, 08 Feb 2022 22:42:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C73E8C0AC7;
 Tue,  8 Feb 2022 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644360165; bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jgOeShQ1wCFXwYdUl7T725H/S6hZRlD3E9a6JCTeyeR1Mq2RexEy7pFsXHyltePGS
 1kC5J+UjMIf14oSpdSzJu4z/4CiHjM+cmmJ9r52y1EnaaRFetlyWWsFzYjMFqYGeHt
 uPfHSBuTEH3f0zISw/E8bgmsvMAFpLi2kXPpiIuCsyZ4rfNvASh6dxKBf9i1Ge0MbO
 89DD5f7q3qk/fOK8bd0z6pvRHquCxdkvXu05PZXt4ebGKbi5XIIiTx2Z0Ee4bYUhG/
 MeMYr4PvxSdkbplT5PTHotUGjgF5kH6JKi2NOb5vZdP5umXc903UE1x7g/qUmqrL5z
 OySEBzy5jijxw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A2AD8A005C;
 Tue,  8 Feb 2022 22:42:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1141C80362;
 Tue,  8 Feb 2022 22:42:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="P67yM5KA";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyQ/46fEvokVEyGDr8fCHAHC95ZpkyqhMCiLTzKuE0z3yRpBqAda4tnitgcsbriUbsfZDSna1YmlAvc4CyBEf/Rwfso0AdX2Q6KS09RdPmY9tCnLmilNUEXsxj3LKUmCwqrQaNpEsT4UM3ftUXzZWvF0tTreMzcKBlAr7y4C9v4xC6/uGSFdS9HY1sIJc3axgSSsVCTeqqPCIV3KnEJp2otaLY76CviWwdCBAtZD7v+otsNZlx5uYKktULRhLBmIFRehWBEIgzLA79cm9FL3ivMFRjf4PIIGsdfT5a5z8FvVzJTdRiiELOspPDKvnhQKtxF9P5OVnBCuQVcGI6rD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 b=DSEFAknLwyEpocJzx/IgA2ZYa+4GuIY9nvwof4XD1RWpl0mFSadKVek8VYCmWMLfk5hkd4shMSo+bg4jwDwaKTWv1JU8+X+4ov4J6sGEMUCEY6WVNlQZsVHDgYRPWsyKEJUBOQOSI6xvq0dv7n3S9FdkAbcMcTonSg2JQ0ZrMmD8EiDT3slb7vNg9RccL32KBPeYWHCsBtizzpBQWTrRTB0x49091EL/qCdDDY18vs2nk6Wpg25C6kQAJ/QG3xXz6pTBDqfGDrkKCjxfN6Ak20BHxYbxOwgDRAq0rrOwroWqMHcbk6JutSD4nqh/mJ3hKGWBN1keVLsYIGtzv77KXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omCzGAwbtqtMaP54dgtuiZxcHPEGIRmXNRVNpVCU9RA=;
 b=P67yM5KABaHocnM6e/j2UjJhsHcT+bopteCt7L/iORTlBrhyo9EM/J6EiohTkDcHU+G1NMsM3At4R+lW23MlQqNNYGoN4XpqUTlQR07ycHWfItHqo8RDGwkrXHaMzJAJmVmVuNsVfOtmaF/z8g2o6fPZHNZUGzc384Mg16ywA+4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR1201MB0147.namprd12.prod.outlook.com (2603:10b6:405:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 8 Feb
 2022 22:42:37 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 22:42:37 +0000
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
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIAgAALfACAB1ffgIAACc0AgAAgrgA=
Date: Tue, 8 Feb 2022 22:42:36 +0000
Message-ID: <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
 <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
 <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
In-Reply-To: <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11a370f5-4295-48b4-944e-08d9eb544e27
x-ms-traffictypediagnostic: BN6PR1201MB0147:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB01470F4D840ACE884F9ECB78AA2D9@BN6PR1201MB0147.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S8RpvdyKwmTYvpBzL6oiAHcjZUADm5yFFIMD6KfdaiAXTjB8R30oLex669QmWc/eXKkQLIMcA93Lf3FBF7yeEQOYRUAMjplZvjagJL6s8g4ZjePoGLeG2P2UVUwqurhKa2LPUY5yzb+7eKOdNlXc/6SbsdKrMd2iXnS8rdWXw09gkltH7bydvKHzaBtJtWNYwCpEnfzZmqzmPysBpyvx8L28U4aPtcPjDqmS/0GKKWCsA4uqwlat5xQfbDwvQE5crrwWuhRhUBJWQB39WorCY9BUwvm+Rdryi55tebjplUuyqhreiNKI9hVAkHp61FqV/sjXQ7JehIYMSPCSYIuOkALGLcMkcHV2v3c8kCo+tFEMgcqgJ5maSco4g1IweOGdapbGTmzjzMdXVPeUrfbSFOmCDTnyaVHEzEKKQePKu1QorrxJSOWoa0/ed4C29tBySzBRpyE8p8OM1qTZWVSya30FMAPeXuhKrR0c9gdKNkmXRmDXL3QDP5+ULEYjyUHdjWIN9fM2ghRAycXImAjGGyNUcRdqeVwqAcpvqE71cn/x/uFG70A+9K1c2DMFWTGeF7lvUi/BFTywWOhIPFYHtQ27sohdkKnJi+RAitEbljFT5lsHVIcrUpx2shHz34+AxY6TUKv5AVg9EX9YbX7Z6ib2/WhHC8HKkUkYSnlwqAcGpsXPByxVvTeg2ACFNXYCUWD6OLCd5ruI9i+5H8qn9XdprNc7IkLe84s07HBcCR10iBKfBB9XmZfcI0+10gV9nK9tvF30RSp+ld34IVtaQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(86362001)(31696002)(38100700002)(122000001)(71200400001)(8936002)(5660300002)(6512007)(508600001)(53546011)(6506007)(316002)(54906003)(110136005)(6486002)(4326008)(64756008)(66446008)(66476007)(66556008)(8676002)(66946007)(76116006)(83380400001)(31686004)(186003)(26005)(36756003)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3pxZXNWS1lFSCtRMzBIcHVsd0dNVmFFbEFmd1Fid1FieVlZbnRpTU9PMStq?=
 =?utf-8?B?NWxaalRnb3lxSC9pWWErWDUwTkVOVFVYNlJLOVYvdFYrcDhVVWJOdzBXWnhW?=
 =?utf-8?B?N2NYd0tLd2RuMURNbFl0SWZxQUZST0NNUUxuWlZzOEVQKytRMUY3Y3hpWmpB?=
 =?utf-8?B?RmpjT3UyeTVkdFNwZE1ORE1adDdrYmo4U3JmRUdNejV3VVE3bGh2ekNKL0NK?=
 =?utf-8?B?Q3RNVTdudTc3amdqdis1NFdqWnV3MEg2c3RvYU5SRFRlQy94OFNPOTlBb1lL?=
 =?utf-8?B?bFpjQndBTmxNWHpVVnNPYkxwSmpzSmJweDhIMWNualY4QXlPTGQyZzhBc0JV?=
 =?utf-8?B?NmVudDNOMXd5UlhFUENFdkN2NHlCSll2M3lVYit3bDdESmFlYlVxaElKc0RV?=
 =?utf-8?B?RGk0TkovRFMvMjM1cCtMNEROd05KRmpmamI5YmN4eThQN1VrUzhmR3JxeGs1?=
 =?utf-8?B?NmFNdm43ZDE4RmZKZmJENGx2SkxiV2xDTVZRcnZiOTNsSjlXMTJHbjNVU0NR?=
 =?utf-8?B?elhWUXVlMEg5cENsTUVwdjlVaTVMQWhIb093akFrUnVjV1piODltWjdZT3Iv?=
 =?utf-8?B?eE45eWM3VVN6QzhQd2hCcVUwNnN0VVFiRlZ2STNmaGpRbXpmRkY0SnJlK2dj?=
 =?utf-8?B?cnI1T1BjeGpuZ3lCSWVOcWIwUFBUeDBNWDhXRFY4aTgwY3gzZGkzUi83dXVI?=
 =?utf-8?B?bGdhaHFtaVNHaGptNHZUYjIwc3J4YnBCRWNRQnlKRlVNMWVYRTA3WXd4SjY4?=
 =?utf-8?B?K29SRnpMbGdPTjZEZXlaNklycjk1b2ZnN0hGN0Z3d1BYOS9DOGhjRXkySmRy?=
 =?utf-8?B?L1pUT0lYU2FaR2lFRmFwKzFNUlF5bjdYczJSbmUwY01qY1Rna2cyeklrMmdM?=
 =?utf-8?B?UE9mY25JNWp1YlhhWnpjaHExLzZlZzRaN1NOOW13Yk5tMG1NV09OZ2d3ZW5H?=
 =?utf-8?B?d3FMZ2RZWmU5YzdtVTE4K1R4R1c0aTI1aWsyYXNvU2xTNjJhNnhUSFhIdktO?=
 =?utf-8?B?NnNiRGVBNUI3YTlpWUZPTFdoMHErVFNTSXZya1A5bDRub2UxdWY2bk9XRTVi?=
 =?utf-8?B?VWhYZ1ppSDhqL1R6a0g3ZE10b2xudG9nZ0NINTFDYXFCRDhiN2Z5N0FPWkI2?=
 =?utf-8?B?dlZvMjJuZHpiTGFpRHBpN1Rqejc4Q29sS3A1cGZNSGhyZzFYRDhING5aOFJv?=
 =?utf-8?B?SFFlY3RaVHVxSnlPeWxTTmhLcDA4TmRGSFpsZFFDSXExRGRyc1FqN1JvbEhF?=
 =?utf-8?B?Y2kxZ1NLTkFIeXlpSkx6N1JLeUlVQUlKNU95R1dmdnZIN0k2NWpHZkRDdmdY?=
 =?utf-8?B?YlVUTGtCeWlJZmFweExsWlBGNVVIL0QzU0dqbzI5WWtMMUJEWlI5VHlZV25o?=
 =?utf-8?B?NlZMTWFnamJBWmJEaW9XbXFzT2ZaWlJnVnFsWnc0VDY5WG5kL3pTa0pUazA0?=
 =?utf-8?B?eXRSRE1LekxEZjMwb1dnNHhUdVhIMm9ubHlUU2Y5MUpKcXNJcGo0SlhTd3kx?=
 =?utf-8?B?TU83SjF4N244K0xzRjlxekpIVUJnWkw3QkFneGZBOURmUHpXRCtBM1lsVS9q?=
 =?utf-8?B?Sjl5WGd1U3lzdjNxSmJUU0x0QmViT0V2c1gvbUgwWjd3cWtLYThBVzZnQ2dK?=
 =?utf-8?B?NGxzcW5tLzY1c1NReW5MdlMvU3k5SFd4bU1INmYxZ3lUUjExVndRNUlYVWEw?=
 =?utf-8?B?YUwrSHZUMWZlUmFRRjBBOTNYUFpkK3BkSTlWaXlzZGVrYVFzRDU1RXFGMnE4?=
 =?utf-8?B?bEJiSkJwZzBJNzB2L2tmZTYrdW5hS3pmUVJMTlF4ZkszeVR2TXNRejNsWFdj?=
 =?utf-8?B?VkV1NHdBNGQ2WDVuK1hISmVoSVlOaEZQRGptSmpUZ3Z1dlVsb0JCa3J2Q0Yv?=
 =?utf-8?B?b0tIZHhoUXZkU3JkcEpCd2lmalprUjlkZ2IxZU12a0FXTWhCSzQ4OU5uS1JR?=
 =?utf-8?B?cmdsNnpBbHJNb2ZXTXBQL3c4ZXQ5K042Rm5uditjM3BhNzNZOGV2NlF2M21Z?=
 =?utf-8?B?ZzBjOVRQVG5uelVWb0FtT1pqcEhTYjN5UUVEUTV6QzVYelJGd2s5OU9ScEw2?=
 =?utf-8?B?cmpvNVRVMDdTQ0JmTk44WnZxSWw0RGluSUtBK0RFY0FYMnFPbjV3V0N4anBz?=
 =?utf-8?B?cFl3NU1JVGVTT0tpR1ljTFk2R3BtNUMzN0FXQXZGa2tkb1NpNEN4SWR6VmJz?=
 =?utf-8?B?VFE9PQ==?=
Content-ID: <A46C770B7ED3354597845BF5FA0AA3AC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a370f5-4295-48b4-944e-08d9eb544e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 22:42:37.0007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv0LYmCujQvI/9nkI9tHuWSZ0GffUUG07gKqiZwkC58s8FkGg1dd6CyBylKVTQEqTNhnq0haHha5ydqWxhZlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_144247_074539_6037AE8E 
X-CRM114-Status: GOOD (  25.09  )
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
> Hi--
> 
> On 2/8/22 12:10, Thinh Nguyen wrote:
>> Randy Dunlap wrote:
>>>
>>>
>>> On 2/3/22 19:21, Thinh Nguyen wrote:
>>>> Arnd Bergmann wrote:
>>>>> On Thu, Feb 3, 2022 at 12:55 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>>>> Arnd Bergmann wrote:
>>>>>>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>>>>>> Fabio Estevam wrote:
>>>>>>>
>>>>>>> CONFIG_FB should not normally be needed for booting, so unless
>>>>>>> you have a graphical application in your initramfs that requires the /dev/fb0
>>>>>>> device to work, it is not supposed to make a difference.
>>>>>>>
>>>>>>
>>>>>> I'm not sure, but it seems like the setup we have isn't the only one
>>>>>> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
>>>>>> to have CONFIG_FB set.
>>>>>
>>>>> No, that one is different: the change for imx_v6_v7_defconfig was
>>>>> done because they actually use a framebuffer console on some devices,
>>>>> so the patch just adds the symbol to enable the drivers they are using.
>>>>>
>>>>> This is expected with my original patch that doesn't implicitly enable
>>>>> the framebuffer layer any more. What is not expected is for the kernel
>>>>> to hang during boot as you reported for your unidentified platform.
>>>>>
>>>>>>> Are there any other differences in your .config before and after the patch?
>>>>>>> It's possible that you use some other driver that in turn depends on
>>>>>>> CONFIG_FB. Does your machine have any graphical output device?
>>>>>>> If yes, which driver do you use?
>>>>>>
>>>>>> I don't have the answer to those questions yet. Need more investigation.
>>>>>> I'm new to this particular test setup.
>>>>>
>>>>> Do you mean you don't know if there is a screen attached to the system?
>>>>>
>>>>
>>>> It does have a graphical output device, but I didn't check what it is or
>>>> what driver is driving it. I just notice that after the reported commit,
>>>> something stopped working.
>>>>
>>>>>>>
>>>>>>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>>>>>>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>>>>>>> fixes a minor problem with my original patch.
>>>>>>>
>>>>>>
>>>>>> The issue also occurs in mainline, which has your minor fix commit
>>>>>> above. The revert isn't clean for the latest kernel version. I also have
>>>>>> to revert some of the changes along with CONFIG_FB. The revert looks
>>>>>> more like this for the latest kernel:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>>> index b1f22e457fd0..7cbc733a8569 100644
>>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>>> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
>>>>>>
>>>>>>  config DRM_FBDEV_EMULATION
>>>>>>         bool "Enable legacy fbdev support for your modesetting driver"
>>>>>> -       depends on DRM_KMS_HELPER
>>>>>> -       depends on FB=y || FB=DRM_KMS_HELPER
>>>>>> +       depends on DRM
>>>>>> +       select DRM_KMS_HELPER
>>>>>> +       select FB
>>>>>>         select FB_CFB_FILLRECT
>>>>>>         select FB_CFB_COPYAREA
>>>>>>         select FB_CFB_IMAGEBLIT
>>>>>>
>>>>>>
>>>>>>
>>>>>> I attached the configs for kernel v5.17-rc1. The "bad" config is without
>>>>>> any revert, the "good" config is with the change above.
>>>>>
>>>>> Looking at the config, I see that this is for an x86 machine,
>>>>> and you have the FB_EFI driver and EFI_EARLYCON enabled.
>>>>>
>>>>> What I suspec is going on is that you are looking at a screen rather
>>>>> than a serial console, and the kernel doesn't actually hang but you
>>>>> just don't see any more messages after the DRM driver takes
>>>>> over from EFI_EARLYCON because there is no console driver.
>>>>>
>>>>> In this case, what you see is the intended behavior, not a bug.
>>>>> If you want a graphical console in your system, you need to
>>>>> enable the support for this in your config.
>>>>>
>>>>
>>>> It sounds like that's the case. Unfortunately I'm not familiar with this
>>>> subsystem to say that's what happening. If there's nothing actually
>>>> broken from review, we can ignore this email thread.
>>>
>>> Hi,
>>> I don't know of anything that is broken...
>>>
>>> I am curious how CONFIG_FB_EFI came to be set when going from bad.config to
>>> good.config.  Can you explain that?
>>>
>>
>> I just use the change above and "make" with olddefconfig option. Is it
>> not expected?
> 
> Maybe I am not doing the same as you. If I take your previous bad.config
> with kernel v5.17-rc2 and use your Kconfig patch:
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b1f22e457fd0..7cbc733a8569 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
> 
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
> -       depends on DRM_KMS_HELPER
> -       depends on FB=y || FB=DRM_KMS_HELPER
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select FB
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
> 
> and then run
> 'make olddefconfig', I see:
> 
> # CONFIG_FB_EFI is not set
> 
> which is what I would expect to see.
> 

Ah.. It's because I don't use old.config as the base config. I use
x86_64_defconfig as the base plus some additional configs I need, and it
has CONFIG_FB_EFI set by default.

BR,
Thinh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
