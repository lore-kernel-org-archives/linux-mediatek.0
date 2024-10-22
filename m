Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E19D1CDCB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=; b=TyvtCca9hRy0B00/EUU8bw7lGx
	DG9ghP9K/TZzczcROq8eKZJ2yk22w7hAkYvMVtEgAvkPmgtn/WFIUsBi+kFMOCjvNhzCo0+3PDDSu
	rUFyZ2imeDbZ4z/o1r3p7++xVHzsDrYe+i0+ObJRlyVgoC3SXNp+jmbzQEPNLKUtlqyxOaifU5nmi
	FgUZeyqdoAjNxOilmGYEyaWGZLm8gRx1ql7PNitX/ae6GIKG0XkydMUdOe1qgaMK7eLWt3WVzyRFI
	0LnKxaz0N97/6+svrbWgY/01ycTw22A0YKO6suZ2QSAKAiFhe4Z4NzbxFRsoXfHsSgZc5IIPZzC/6
	5RuagsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bmo-0000000ATPC-0ZRT;
	Tue, 22 Oct 2024 10:06:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BTF-0000000APg3-0Qam
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 09:46:34 +0000
X-UUID: 82eb047a905a11ef82ff63e91e7eb18c-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=;
	b=m9FtVDjKWQgoiqxsSndx5VEzrNLWJS3vYd8k43UrjWrwdJKUzKU+B3LfVTzmEcZKFH7d7EgoipXfE9Fusd7AwF7Briv8p50jWkfL9hZipzACbH7HScHLIxhKhwDgwLIG/RdfAW5v/ieB603VlSYbw8tXwmtsmO20OjGAPFJOVB4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:9fb32bd1-6c81-41a9-abc0-b719cedd6c16,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:3421a641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 82eb047a905a11ef82ff63e91e7eb18c-20241022
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1539976847; Tue, 22 Oct 2024 02:46:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 17:46:26 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 17:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKVa/mnAzAOC0B7/T03o2+zWvei+l3uqus2RAKZEXLTQewRGKzlgvppFeMtseWrRvOeo59Or2euILciLlkxUg7aPTW4/2dmKLGxGHdu9xatCLdj9u0z/mlZudNa+lJ5Yi3Kp8QTEn3yQm252xmJlpgztRrtaIuIzyV+Mg+n+JOwsZLY+nF8Vg2GJFlPCIkOdLse64kBxdDZmIkATe8s7m8hsE8pzOZcImIWY/r6EoFzpEDeFva7xBS5NKBjTxTMz141XJYQ7l4/2e21jAOz6YewR4/PBTKWmvysr6ZdUhcJw98AWQWJcTdJgzEFSWBucB6z6bBIVnhUMGAr4mQWbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=;
 b=SIx4Wmb0CucQJtETBXSdh07PvDR6EQmbXDNFQQ2rdfsXn4V/tYvTYIEaHkZ+olcZiaypmwlh/CjYDteZGj3ZfOSbUPb2ndi/L0hCcUWuUvw4LJBgQjeERBZwD4qAuOpxzDLDMy2R8+TZOY3U6hnKRC0sTqilcy1BtOi224RCXipKQW6NCQ/j27iriDNhsRhqVb0c7fjOPxXUIWgnyyPGfKA8ii5WbiaTJOBGBMDxkVmx6VxnXhgVQzUnGfYJmi3PQn6t4wQyxD7Qp+JU4YnvasufPcmbyN8sPdlFzzqDy7qCtkMEM3F1DEtYLbyTernqfpyPVHXzEP6nhMOH99kqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=;
 b=NVysE2Crqhn8Evozf2FKp+mqpjd+dkcKsKLFVaKkPdpiuwnQ9WMhf3YXUTXLyH8s1MarCb5LDECcSavepwYSxbqXHcfK/HKLUqwZIZTA6wQGhwkCXDaIA/ZO/bADUD4nrbMiwvVJ266jRTQvn9JikZCpNPNplN0aQcQCtqvv0Fw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6777.apcprd03.prod.outlook.com (2603:1096:4:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 09:46:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 09:46:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Topic: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Index: AQHbFYZGXQhSYURdx0Gm+WdO7yD3TbKSo3WA
Date: Tue, 22 Oct 2024 09:46:24 +0000
Message-ID: <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
	 <20241003111851.10453-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20241003111851.10453-10-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6777:EE_
x-ms-office365-filtering-correlation-id: bbdbc4ec-e2b8-4f00-58b2-08dcf27e6448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmpDd093dXFhTm41RGEwaEtuejd3MjVwMHljaXNOSTBLYWU0RWJvVWdPekw0?=
 =?utf-8?B?UUlhbXVlV2l1VUo4cUlObU51Vy8raXRHZDVhYXljTFlLTkpqVHJORmtabGVR?=
 =?utf-8?B?N29IWUtLUE9hV1lNb1ZJM3Q5ejhpbWgvYkNZaWNXckZMQ2ZqZUhOT3pYaUxh?=
 =?utf-8?B?S1FYV1lUQXhtT1pxc29OcDk0bk5oTVBmS2o3NVNTTGZjN0hiTWIyaGFqUkNM?=
 =?utf-8?B?d0hMK04zdWFLOW1sMHlCc2czTUViTWtSRWFYclFQY1N5NjZiSTNsY3lneEpp?=
 =?utf-8?B?RUt3TzVMN0lNbmtDQnEzQzRJWmVVcFJ4K29vVnlzWFl4aVI4bWgwWnBHWE5t?=
 =?utf-8?B?NDhYR0ZaSytNQ0lXMExBRkJqU1lFSjF1a0lBWnRRRFg1N3c4cEluRTQ3OTdp?=
 =?utf-8?B?ajMrcE9BZWVNdkRJWE5HSVhaY3M0OWFvR3pkSzdaazdhOENFTnJ3YmdmVS9E?=
 =?utf-8?B?ODlDMXhGMjMxNjlNR2hxc2ZMcUxyanhiN3NHNUgyblExczBGMkFjTHBHR2Jx?=
 =?utf-8?B?RTNMbTRTb21qQUdFeHVXbldrQklibzhJdjdXeUdnRE9SSnplYUI0bTRSTndI?=
 =?utf-8?B?TnpZOWVnWFdkaThWcldVbWtFYlFoWnNYSFFGTWFzRzRYZFNDWmNJMXFweXNZ?=
 =?utf-8?B?U09nSHNyQ095clRMZXVWZ2xYdVdIcURFTm9KUnRHK2VRdE9NbEZPL2NwNmo4?=
 =?utf-8?B?b3RnVFZpM25ycmZ0ZncwL0JacDlVUWhKK0M4cUZacmtSRGZNOHh6bWRFcVpL?=
 =?utf-8?B?QjRxYUFLUlcyZmw1RUVybnZCZlVwTUJtWmhreExlOG04YzU5QUFYTFBXUFp2?=
 =?utf-8?B?eXhuQlVOZnNHUWxzZTBhVFZLVWdiL2QrWTY2TVlGRDQwQklNeXEybWpzcmN5?=
 =?utf-8?B?dVdjSVRya0FJOGpyWkxFL2JPZkk4YW0zd0xtU016NWVkeFBnWU5NbCtZRUk0?=
 =?utf-8?B?a1ZVZkhpU2RPWGV2R0V0OVJRZTQ1b255eTJ3M01VckVVTFJxSUdhSzB3RVdJ?=
 =?utf-8?B?bWg1a1hCK0R3c1RURG1nN0h0dmZKbXk3MGF0dGxLd1o4NjQ0K01MVUdMMUl4?=
 =?utf-8?B?V1k2Sks0RzJna0lwYnliYTZhaE8welpnQUk5WEFVZU9ZTmJvUUx1NWpPU3RP?=
 =?utf-8?B?NlV5NEdzZlZHcDhlK2QwdUlCOWhXa1JkZ2FyUFc4RXJjNjRyTTlYOWFEMk5T?=
 =?utf-8?B?am1wY0Q4T1Vqd1FrR25JM3BIZU1NWCtVbDJTM01TN2tmR2NKcEdYQ0NCZEZV?=
 =?utf-8?B?MkUyL1g0dHUxL0JaR0tzMDRCZnczQjZobzYrd1M4aXNWZkNoVDNGOGM1LzVv?=
 =?utf-8?B?TmhIR3FrRmxyZ2Q1RkR5c1dIT2JwTnFSczA1QUtBVXFDSDg4R2lsZzRWTlVW?=
 =?utf-8?B?c2d4L2Z6eTVxdlhrbDRZcWRNSlphNXl2ZmlPdmtZUUJzZ3RsblNHOS9wZ3pE?=
 =?utf-8?B?cExBWnIvU2tLWkhnUzRNTWdJcE5FQ20yM1E3VUlHM1F2Vmg2YmdVQWlxQkpO?=
 =?utf-8?B?ZVV2V3lhcDlHOUllWnR3SXJyNzVISmtHdHlaaE9LOElUQU5RUktiOTFDRjFW?=
 =?utf-8?B?bGxMczJvR1dvVkUrYlFnRmlKc1Q3eUNRZDVIbU9aa1pFeGt6RjEwcVdhN2tP?=
 =?utf-8?B?R2doRHhsd0VreXRXSnJjNlVJRlQ2U3psL2R3Ymg5L3NZMUc3Zk93cUpsL3VM?=
 =?utf-8?B?SEJ1TmZxeWxrcTNHenFJQ3pINnBUQWJwUEtZZEkyNU1GSVhFSllwbmlPRXo2?=
 =?utf-8?B?dFp4MDRlSjRTcm1TR2FhS2FWTVY4WFlPWHRib0x3RGhhQWtaOGNKTWJuVDB3?=
 =?utf-8?Q?i33rs0OSBu8izvm+IgjJWsG119dZcnweK/J7s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVNvVjlDU2hxYmdIL2wxNXV6anBQcVBwN09iV2RTNWtSWW9tUlcwUmIwUmpX?=
 =?utf-8?B?ZFRSNHNjMEdid3phOUVKZUlERHhJL1FGLzVVanc4MUFlSlZXY1BvWEpoUnFL?=
 =?utf-8?B?SlZkMXlIQ3ZQRWNPVDZhVXQ0bEVOaU92cmlTL0VyQlVldU5KSHluSjBoaEFU?=
 =?utf-8?B?MFQwSk81YmZHMEliM21OMzNkRkdoTHZUY2ZDeldJQTcvWjlLRVRZdGU0SFlw?=
 =?utf-8?B?bjF0U3AxUTZCQ2phRzkyeGdmSGUwcW9nYzBDaDdtdFpZZzJ3bjVjZjQ1QUcr?=
 =?utf-8?B?Tk5MOHlsazd4bnpmWkdJZGFQeDA5S3hDMGNEbFZYczlnS0V3bFRQVGdMYW10?=
 =?utf-8?B?RWs5RGRkMC90QlM5aFdRR09YWElDNGVyUUg1VzJicEllYklpZ1NLTXNEbkI1?=
 =?utf-8?B?aTI1T3pncUZuOXMyN3R0VmJlTHAxQXIwUGlhNWZWejlIeUF6Q3hGRytjVTJF?=
 =?utf-8?B?dzlvOWlER0dJNVVKQ2xVYWVkSmtsanRzdUw5dDBHVUR0VHliQ2dJbjJLT3pp?=
 =?utf-8?B?OWpsZFI2dFlIUkxEakhZa0ppeDNzeWZLQXpLUFM1UDVaeSs4UlVBeUh5NzBo?=
 =?utf-8?B?YVh0OCtzcGFYKzVvZW9FTXhIRUFQY1pab3RtK0ZFTHE5MzZHWERmNmF2Z25r?=
 =?utf-8?B?Y0R3cCsySW9pdU9xRVdTbVZJMXY1N00wMXBWamhTb1BmV0ZkZHVzT2VSRlA2?=
 =?utf-8?B?bWJJSThuSFdBc1N4UndNcWxJRzArZzNnUUNqRmFNVzRBTVprVTBXc3o1R21N?=
 =?utf-8?B?YVRuRjlRcDRCbkVqK3F0ZUd4N0psK0ZPRzhQZHAremltcHdvL0hRRjY3TWky?=
 =?utf-8?B?WWZCa29HMDBscUtQbWs1RE1uY2FoSWlkaFVpYWxNMnpuSVFsSGFmQXJxQkds?=
 =?utf-8?B?dW1Ha2U0aFVzT3BaNmFFcGVLN3o1YjNLQzhrRHRnVVk0ZmFsek55dzFvb3lk?=
 =?utf-8?B?SXlJUmxoZ1l1MER4YVRYOGNZc25wRVd1WkFUQm5JSUJuaTY4RmxQU3EvUmh4?=
 =?utf-8?B?cXdrdU5LbUJvZDV1aXp5Si9Td1lOcGlMaVA3RkRwSTZwamExZ3N2Tll2SE40?=
 =?utf-8?B?TGlBS0U4dEh1V1A0ZUFTaTBOTzhIY3ltb2x2Q3drcFQxTzZmVmRlZGdnYU9S?=
 =?utf-8?B?aUJrQmNtMnF6OE5mc2VwdXZ6WTB0dFV5TVpLSDZmOVZtK0QzN1FiUVRZRXB3?=
 =?utf-8?B?VHZnci9UajVLcVJmNGxiTVpvL1lZK00xMG0rQ2pDaEZBNmg5ZHB3c3drT1Rx?=
 =?utf-8?B?Ymg2Y3IzT1I3ZnB2c0RCejNZMmdrOHFRb3NieGlLbTYwcW4vVklMLzZPZEIv?=
 =?utf-8?B?dHVBcXR5bHF5ZFJZZkQ2OHRvUWlWUHduRnhJbDEwN0pjVjQzcUVPRGQzUTVw?=
 =?utf-8?B?SW1ZSnYzMi8yVUtjbHZCcm94TTBvMXBZekszNDlVTWkxQ3NxdjNwTTBadWxY?=
 =?utf-8?B?anRwMnIrbUxEelJISTNvOUU3bWlpZW9VSUZ0cE1tZi9aNWs1ZEZkZmJDay9H?=
 =?utf-8?B?aHZCbUJ4T2l5bnlFTTNVM3c3UlI5YnVPYjh3c2dBU3IySEpxeG5FMm9ZVG5t?=
 =?utf-8?B?b3dQamJ4TmdIMjZHQnlSYVdXUkZXL1FVaEdiMkM1SU5wMjNPY0diUFZacFBk?=
 =?utf-8?B?QzgvUTRnZUgzSGMvSkpLSy8wVS9landsUDhXUzhHcDdPblo2NHVlRTZES3d6?=
 =?utf-8?B?NDB6RXhlcFBzbnNONm1iNzVrZWNydklpU1VNREtjSWlQV05VaS9FWWozOGNj?=
 =?utf-8?B?QytYelhQVWoxRFE1bjN6SStZcy80YjJLRHA0L3ZKc3g3NkJxa3ZaM3NwMzB2?=
 =?utf-8?B?NEk0SXhLd2VkRW1UMlRuYW1aSnIvZ3dIUGZmZjVzeDVMczY0WEd4aXQyb0xE?=
 =?utf-8?B?SlpPVXBJSjViaHJmM2NEMG5JeE5jZGZtbCs3VDFtaEIyeG9RZ0Vqdmg5VytR?=
 =?utf-8?B?d0w5MS9ubUtlT1hTbDdaME1HblAwOU1UVS9QQ0cydHA5aHlQMDBxSnZkSXl0?=
 =?utf-8?B?ZUxxdEtTanQwWVp2MFlqUzFoemdMRXNmdEVjYnplRERtUlNwK3VuQ2hGbFlt?=
 =?utf-8?B?YzgxNkpQRG4xN1pHNlFEYkZZLzlHMEpodWFGK2ZGZ0ZqM29NVC9yZm5oMnl6?=
 =?utf-8?B?ZUl4UURGWjI0dm0zUDk4bzRWWEM2dHN5U2lFTE50STlHcmJNVEo1Ry85VmVq?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0427130A66A69843842B08641CBCBF6A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdbc4ec-e2b8-4f00-58b2-08dcf27e6448
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 09:46:24.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c77dvrNJB8JxQc/eaSxIbBuSW0DJF4DFY7FgUt45zQI9k4LhrVZJYO5LiqaPa1o9XGh+cr1P2P85qJIZRGQpEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_024633_241780_37DF4472 
X-CRM114-Status: GOOD (  15.79  )
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

SGksIFZpbGxlOg0KDQpPbiBUaHUsIDIwMjQtMTAtMDMgYXQgMTQ6MTggKzAzMDAsIFZpbGxlIFN5
cmphbGEgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUg
c2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IEFsbG93IG1lZGlhdGVrIHRvIGJlIGJ1aWx0
IHdpdGggQ09NUElMRV9URVNUPXkgZm9yIGdyZWF0ZXINCj4gY292ZXJhZ2UuIEJ1aWxkcyBmaW5l
IG9uIHg4Ni94ODZfNjQgYXQgbGVhc3QuDQoNCkkgZG9uJ3Qga25vdyB3aHkgbmVlZCB0aGlzIGdy
ZWF0ZXIgY292ZXJhZ2U/DQpUaGlzIGRyaXZlciBhbHdheXMgZXhlY3V0ZSBvbiBBUk0uDQoNClJl
Z2FyZHMsDQpDSw0KDQo+IA0KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+DQo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBD
YzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL0tjb25maWcNCj4gaW5kZXggM2QyNDM2MjcyZmYyLi4yZTBlN2M0MDc5YjYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+IEBAIC0yLDkgKzIsOSBAQA0KPiAgY29uZmlnIERS
TV9NRURJQVRFSw0KPiAgdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZvciBNZWRpYXRlayBTb0NzIg0K
PiAgZGVwZW5kcyBvbiBEUk0NCj4gLWRlcGVuZHMgb24gQVJDSF9NRURJQVRFSyB8fCAoQVJNICYm
IENPTVBJTEVfVEVTVCkNCj4gK2RlcGVuZHMgb24gKEFSQ0hfTUVESUFURUsgJiYgQVJNKSB8fCBD
T01QSUxFX1RFU1QNCj4gIGRlcGVuZHMgb24gQ09NTU9OX0NMSw0KPiAtZGVwZW5kcyBvbiBIQVZF
X0FSTV9TTUNDQw0KPiArZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQyB8fCBDT01QSUxFX1RFU1QN
Cj4gIGRlcGVuZHMgb24gT0YNCj4gIGRlcGVuZHMgb24gTVRLX01NU1lTDQo+ICBzZWxlY3QgRFJN
X0NMSUVOVF9TRUxFQ1RJT04NCj4gLS0gDQo+IDIuNDUuMg0KPiANCg==

