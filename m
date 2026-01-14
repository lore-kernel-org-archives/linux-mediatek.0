Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E445D30CF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 01:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9VgNVTqQ+9TK521ZdtMpwXcz69MUDg0p/Q9hbwqkOk=; b=atdySfd88xH8idgAYBjQuyd4Ql
	Ov2aaSs2ovTnYzZ2Rbdf1kV8rbSkk7MxY0IiXpwV88MJGVnRt2i7RIZHwRQdFRm3wFmBX4K1FhtLB
	UzWP73Tmi+cZpCQIcBAZXIx/uSxeD03hakAabygGBKE0CYUkGiMNl3Nec4Zk0bbwV7/kAiKn+b3r/
	4Owv3Gb4Nz6OIi24X/vIuiwsP0XjZNQYlVQf8UxneeTRx0j2o6/enL90QQSvZjOOhkRA8xlfdcSb5
	w/9xXwORsx4J8AtyIu9G1fql1Xmh8Nmbee6QH+kESYiEdg31tlFd4CsCzRKR7BlRX4IxlkI/Dtn3y
	tu3S1ftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpb2-00000007wKn-08wJ;
	Wed, 14 Jan 2026 01:22:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpad-00000007wJZ-2LHD
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 01:22:50 +0000
X-UUID: 79322d0cf0e711f09f706fa2197c6ceb-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+9VgNVTqQ+9TK521ZdtMpwXcz69MUDg0p/Q9hbwqkOk=;
	b=oIeOBk+WwKSGdWzKk4meOZHgzhOORSb7LxUKnUhdGIPJmomEzfryAE8vC6yFg8WvBoXaQYb1DrV4Hwfr5bfgwGEh0St2rKy8/mLu1xR3YtQV57/ZHoCc4ZTOXYnDQCQuQeRLJ2tCnh2R0DHW2DIiGLuxXw9GkD8REh58RtFt8r8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:57c4b8dc-dd20-48a3-8c90-11a5f248f1c7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:ed77c179-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79322d0cf0e711f09f706fa2197c6ceb-20260113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 234438128; Tue, 13 Jan 2026 18:22:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 09:22:18 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 09:22:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpfqZ/+LscuenBlLis4UseE1cGvTRi2wnxsG5nClcKLHMAID4hJdrQAWEcSNQketyFo8QrK0hxZ+KCDnmlM0jbNIeP28b8eA0bplHWDHmdsSyiukiIyXW3KpfZa5Mf32vwSnutWOLnsig+DnF/JdjC9wfYfcnPgSIyM9IdIuTzW1bx5eKrZb6BCK6Za1InbKg9oAigWhmdsdnLEvpQSl1m4kWNByjXhPzSl3J/VFfjDVf1LUf8Q8XT1xdr40GCuuaySQVNcIryX1qfxy4cpgMFHkHuNLGwAiSlLdNIB9MQWWdjW1y8wrkOg66JhnxN3Yxl7M2DxZXl32KzZstZ5SEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9VgNVTqQ+9TK521ZdtMpwXcz69MUDg0p/Q9hbwqkOk=;
 b=NbkDx/c2OpNzSq6gi+tgMBOcB5bYhuDANTXhuodmg9KLgisBC4i3fNQzxqQyqsSoeqSVuo46p/LrrZuKVa0PpLV93jsqRXZF/KfVt2lP7L3qEFnoTEesHh18Rely9hUq5I3HVDYYPCKUeTvHV1JT3cXQFjSWmNivrNslepIKg7q1eKKKbGWhOLip8MQpgXObLdn9tXa5LjBO/ShVOizLALwNojxgAkKKtLTtVg/jb+TOk4i2KC6SO8pab9KjKx7hReg3N3KN/XZPxax0Nhy9zGtygmhOA1ScNaNn0SJfrNoT/TCD0H6ne8xT5O4wC4e0KJczDNasmPZKlbqx4qHfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9VgNVTqQ+9TK521ZdtMpwXcz69MUDg0p/Q9hbwqkOk=;
 b=lwiDFmV6L3WN5+fyBZ0NovhDxDwKr8/3OXtvUp1Hd85bZ7JBpTf27SzY+0U2NOsgPdJIdSasNMA1Go3B6bKljUmltH0SD3HRMv5m3xCawznRjhlZxVt7EYiD9abU7O9VukJUnjt8goojIa7c0cVvvLqcGqE/13Bz3Os+ppu95f8=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SG2PR03MB6478.apcprd03.prod.outlook.com (2603:1096:4:1c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 01:22:15 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 01:22:15 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, Nicolas Prado <nfraprado@collabora.com>
Subject: Re: rename MT8188 SCP firmware and add symlink
Thread-Topic: rename MT8188 SCP firmware and add symlink
Thread-Index: AQHchHnJSkBErJw3aES0SciK09YKILVQ33GA
Date: Wed, 14 Jan 2026 01:22:15 +0000
Message-ID: <a0c1684baaeae4283f559cdcc544d7bc0314305e.camel@mediatek.com>
References: <20260113094541.2528905-1-moudy.ho@mediatek.com>
	 <3imlk7gitfiazewwrlottwnewfn255othxe64ui6jvusz5akjs@r2tmsrx3y3xx>
In-Reply-To: <3imlk7gitfiazewwrlottwnewfn255othxe64ui6jvusz5akjs@r2tmsrx3y3xx>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SG2PR03MB6478:EE_
x-ms-office365-filtering-correlation-id: 690cedcd-68ff-4741-bdb9-08de530b5a3b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YVBhTWNDQko1cXIvNWRmTHZBRHQ3M1R1bk9HazZhMHNvMlcrRnNhbnF4Y0ls?=
 =?utf-8?B?QW00dTBSNUVWM0orMkc0M1F2ODFXRGNuQ01ZcU1rd3hiTllrcTc3UlZtQ0JH?=
 =?utf-8?B?SG5GWHpGMGI5bjVFbHlXc3c4T0hZcmxsbGRjaFdqbjhWRUtVcDhBenNUSzVv?=
 =?utf-8?B?MTY2TWErcVZrRnR5V0xEb012SWhCMkpDdVNUdDYxblAvdWxMbld2cWNDN20v?=
 =?utf-8?B?Zmc2eUFZSWxRUlFWSzJ1YkJEd3RmeGdObnc4TTJqVmVWVmdocEh6TWIxWHBt?=
 =?utf-8?B?NERQb2pjVUxEaWpMYjFoQVFZVjYwZnpRbXE5WHFFZ2dHbm5LbFBQZXpPWlU2?=
 =?utf-8?B?bWdkZjgvelcvektOVWJHTHc5UTg0U3pKMXgxTWJTYi82WlpNQ0REek9hSmpw?=
 =?utf-8?B?VDFSb3E1NmtYSlFkRk1hVVNWU0I2U2wzQzVqN1l5QjljdGcva3BBRFgxY0JT?=
 =?utf-8?B?ZzYrckVMNkNVNmIrMlJGc2dwZGpPekl1OXNmNlUrRjRTdVFGZHdkYjRJeUVD?=
 =?utf-8?B?ZFNwdU9mV2dLL2VKZ1VFU1ZhN2FlL2MwK0dqNS9PS0lQbEdtUUthRDNsWWxD?=
 =?utf-8?B?bUlCaVJHeFEvdmErcHZ6VkhoQ1FnMGpTc3V4a04vdFI5dEJXM0FtQXVZaWJL?=
 =?utf-8?B?QjU4N25UeUtYNllpTllEY2pBbi9BM1UxeGkrT2cyckc1TWlkNldOWUxCcHc5?=
 =?utf-8?B?WWkxekVLMWFlTXdTOUlsaFl6a3NSRGR1b0hDZS9qejNLU2N2Vzdncmc1TVN2?=
 =?utf-8?B?bllNMDRyc2x0YUNhMG9pcy9vT2RGMEIzNHp4WEo3dUJZS1VCTU44SlpveGtG?=
 =?utf-8?B?amVjQkNkSVN2QUZlYVoySHpLdUJyc3VpL3FNdndlTEhEQjJzS05WQ21JeTd2?=
 =?utf-8?B?V21wK3I5YWZGNVFLKzRraWZtVHJFU2Z6SlptL3g1cUFUTnptK0hnZFBGaVM5?=
 =?utf-8?B?Wk9YMnl5YU8zWG1UeDBPZFN0V1RHaEY4ZTBTSXRieEN2VlY2eUhHNVZmNjRq?=
 =?utf-8?B?M3N5VVZhZG5UakhFMzNQM0dXWkdkMUkrb2c4N2twS2N3UHdvWUNGSWVvMmZh?=
 =?utf-8?B?MEdOU0hNeU9wWWVZaXVuOEN0RzBYYnNnNG9DcnlnZTJOMXBZYXorZklaRGVU?=
 =?utf-8?B?OEczZjQ5V1RMdXBxQ2piOXdudWNtYUtNU2JmdEljMHFRQWVIeXUzLzJyeXZM?=
 =?utf-8?B?N1hVeDdSNTcxS3c1dTJreDBDeTNKejlxL045SzJBSjBncmpGN29Sb2FnQnpJ?=
 =?utf-8?B?bGNMTEFkM1Y0MUdTUU9lcTlpZUZVbkY1TkxoM3hxN3VaRDczeUdkNkQzMDZG?=
 =?utf-8?B?aERZMGlDU1VRdVRNcnVZdk82ZHFRa21QWE8vRzgzOFJ2bFdWRkd6dnVxV2dN?=
 =?utf-8?B?SzJ3RngvS3A2bjkwZnVHUitmckM5M2hGME5HTjBJZW44UndXbzRxS0RjTDBj?=
 =?utf-8?B?WjBPa0Z2OG1DdldKNjJlQU9kRWhJNTJpZ01QKytVcm4yK0JhNEpleG4wMDdU?=
 =?utf-8?B?R1gydGtVVXYzQ3NjdUNONVNSdlVwa2lWcW1rL3k0cE4yKzB6S0swQ09tRlJ6?=
 =?utf-8?B?cDZReTJuTDdnbWVPVkl6NU5Jd0hkNEd2OGJJQzgyNU9SaXVRdU8rUzZoTFFm?=
 =?utf-8?B?ZG1NTXdWVWl4dmRUTUdRNEcxTkw2MXZCbEgrcDF0Vnl5VDA5dEc2L0hyWkZJ?=
 =?utf-8?B?bnp2R1c2YStKeEczYmJOa2VhbHNiRjJvV0ZKVnhSV1FOSnB6WWpneHVPZWNt?=
 =?utf-8?B?NW9jYUE3TTkxaThMS1EwSGxTbS9CWWZ0NUl5OHVQL1V5RmNyZUkyZm8wLytp?=
 =?utf-8?B?aVJ3enhTWnBXVHlVa3BuSzB3UHpRTThjVUg4MWcxb0tadGR6ZGlHZW9OVE14?=
 =?utf-8?B?bkkxVUZOUnlHWU82Y1UvQkRxUmJlYmx6Qi9GdlI4b1RnclllRERHendxdWZp?=
 =?utf-8?B?QVQ4V1Q0Tzl4VkxscjRpOXJ3OGdpc3dlQkZCQWd1MXNkekw4ZHBRTmhuZzVj?=
 =?utf-8?B?SjZlbDVwbjJiRDRjM2krTksrV1JJeDNQRjJ0NWM3cXNPRTd5YnhsSGZ1cEZy?=
 =?utf-8?Q?H2JutO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZOS1JHRXRESmxyWjhyZFIxTm9NTEpoYzlRMzk1aEpVYklwdWRTZVBIQUxj?=
 =?utf-8?B?eWhGaE9Obm40dTltOWM0d3JqaUNWZlFvYmh3Y3FEZzgrTFhtYmlRR0FrS0ty?=
 =?utf-8?B?eWJFMzNSVnFYV0JCNXpzRlE1dmFSMzV5eW01amRGcUo0VWhHNE5qU3dRQXRF?=
 =?utf-8?B?NC8xQVRiUHNwcFgvbkpOWURCNGVDOS9PdGdPemh3QlVEcmFJVUJJRkVvbURR?=
 =?utf-8?B?b3ZKTjZ5VlVrUkRwWnpKLzV3SDRwOTZacmJwTVVSdEo3T1I2d1pEV2tSazZa?=
 =?utf-8?B?Q2k0bEV3NjJDWmowNExXQ3RxNCszRFAwYlgyUFVWUkhNYlhDVCt6V2YxK1Ji?=
 =?utf-8?B?YWdzNWFDNG1qdCthOUU2bXpBRC9PQkQ2ejk0a1RmSFQ4MWhaMy8vZUs0Z00w?=
 =?utf-8?B?VkxYcjNHZ0NMRnpodG4rVWl0L2VlMkVlSEIyaUFaU01IMXRLNXhpakFOcU82?=
 =?utf-8?B?RVpnVGpDQ2ZVeXJVcm43MmlVNTdPUFpwd0c1RkFKMm1EbytGb3hsYk9Ia1RR?=
 =?utf-8?B?WFIvcGRwUll3aGNoT2IrUm81a1VJTERoSUdTalFpTmpZR2l3dGxNc1VBS1RV?=
 =?utf-8?B?bnkvZUpoZDlKb0NsT2hWd2M5RjVPU05BSFgvWmFqaEZoZGtvRjB3YmR6VTRj?=
 =?utf-8?B?L2FBb2owZlJkWEp4ZmRxN05weFM4RkJOVzhKWitpeXMrazVxTVBKcVhNdjJ1?=
 =?utf-8?B?cTVNNGU5ck5HL3VKSTR3QWRRQ0ZhTUJGSjdTaUhOVVlKYUR1bi96WHBMN2h2?=
 =?utf-8?B?RUpkZmlEbFdnNEtzWjFHajZVUjZUMUIxR1ltK0dFVWlwNStrelV3Yjd3NlRE?=
 =?utf-8?B?MVRRcWVldEtSZkZRdnpYWXorbEJmWUFtSlRZYWJrcDBSZnk4b3ZMYnowUEZs?=
 =?utf-8?B?ZmMydTgrTE9ZOGZvQjUrenBXTWQ0YVlNeFJMU2Fkek05b0I5elRiMWQxM1k2?=
 =?utf-8?B?ZDlyVG0zZmxnWmgycFpUVGwxdUdiSUM0bjdLaDR4QktRdFRYK2pvdHAyRlBz?=
 =?utf-8?B?aytJczI0VEFNS2F3c2VWanYvdkxGelRTNStKenAvQ1BGYzdUc0d6cW9ybFY1?=
 =?utf-8?B?S21panlXNFRNVDB1TkkrVEZxSTBrUVZmRk54UGovRFZQdklUSkpmWUY0djlu?=
 =?utf-8?B?OU9Odmx2OUFzMFNDaW0vUTBNZ2hOODhBcXJMZjhYa1hNcnZzNnRQcU1jcXZZ?=
 =?utf-8?B?NnJJYnFpa1QxZTNReHh0Wkp4MWJ2K25ETFNldFJzeXJNZTB4ZXhLM3BzVnky?=
 =?utf-8?B?anU5WFNHdFFPM05WbWJ5K0Y3NldRZDRjU0l4OXYvNERXeFJVTmVSdmppVmxG?=
 =?utf-8?B?SDQ1Yk5pcGZ3QW91cnM1Q2JkODlFMi9DbzJxZlZDemd2UWRHclpMY21sZG5t?=
 =?utf-8?B?VHdKVWZUdTIzY3R6bU4rR1RFTE5iVTQxblgvL2NOd2d3NFRLLzFiVVpHZG5y?=
 =?utf-8?B?anVSMEFPaU40NmFTSFc3QXNUSXdMTG10enNQK1lZVmMwYU5wUnJtNFoxZFY0?=
 =?utf-8?B?d3d0ZjlibkVFR3RkWGNyOWRGSXJQSFB4QUk2SkJLR2dSNkVLVXhJZ09JdEZO?=
 =?utf-8?B?a1BvaW9semROWlBaakNDcERqK2tUWnRPeG5VaEhCOGFkYkFXU1hoSWJzTTlp?=
 =?utf-8?B?Z1pXT1M3RmtMbXgySnNqODlON0VWQk94SGdFak1HcCs3cXBPczJmTnRaa216?=
 =?utf-8?B?M2UwS09GYXNTTFZKMXN6Z2hGamUzVHArTGhGTXVHalhmT3pKQ1h5eTlpSmRx?=
 =?utf-8?B?VndpRmkxSE5wTENISVB2b0p4QUdiWVNaOThkSXN5RmRES2dOM05CdEw4TDFn?=
 =?utf-8?B?YUk0RlR2WjdpYVlZNk9WWmRSUnFWWDZTeVkyVmJoUjBOREdpU2cwMU5rR3ZB?=
 =?utf-8?B?dXRWUmh5ZXFGdm5ZYllSOEdHYkd6UTMvUm82OVdBNDlDMTN3djI0VXd3alhu?=
 =?utf-8?B?aWloV2RraXdMTUtQS3dKZVpVWlV2bWdFaHhZbnpLbzBlR1haeDRNOER0cElv?=
 =?utf-8?B?cGlBejhRRjV2a0ZwZXlRQ3FLeDRXdVM1WW1OMUcwVC94Z3U5S2VGYkRrREdp?=
 =?utf-8?B?a1VtVm1EblV6ejlNMEpiWFhmOHhPNlpoWnIycTg3OEN4am1MZkNrcWtOM2Jw?=
 =?utf-8?B?U3FHQlhpWWNHMnpBV3Z2dTNLUjRtL25KcE1OWVFyOVVYTnVPckJveHFRLy8y?=
 =?utf-8?B?QVFTOEpDdzBza0lGUVNTQmZCZ2J1NzhYWmUrQmZOVTVzTjRFbEZRaWpuK0lH?=
 =?utf-8?B?SmxmVSt2OURvemduS2V1N1NlV3M1SnFZTCtmbTlzcCtxbVRxY21OSlJKSmM5?=
 =?utf-8?B?K3IxaURuZWc0M2F5TVBST1phK0tyMW1XbW5IVW5OTlBoalZXLzJiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E669F997B4046147BC3FBB0B9CCEBC2B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690cedcd-68ff-4741-bdb9-08de530b5a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 01:22:15.6283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gy2FOli5wflL8GmD1C94yv0ox2DZQMWfbuQQtXGA1R4t5BjgkgAoezeYi/Nxdfjbg2Vw7ivPTpcLPSCWOVQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6478
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_172227_644130_DD40685E 
X-CRM114-Status: GOOD (  19.06  )
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

SGkgRG1pdHJ5LA0KDQoNCk9uIFR1ZSwgMjAyNi0wMS0xMyBhdCAxMjo0NSArMDIwMCwgRG1pdHJ5
IEJhcnlzaGtvdiB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gT24gVHVlLCBKYW4gMTMsIDIw
MjYgYXQgMDU6NDU6MDRQTSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IDQ4NmFjOGY5YWRiNGQ3N2I5NTFiNTUxNzk5ODVj
NmIzYzIwYjY5NTc6DQo+ID4gDQo+ID4gwqAgTWVyZ2UgYnJhbmNoICdyb2JvdC9wci0wLTE3Njgx
OTgzNDInIGludG8gJ21haW4nICgyMDI2LTAxLTEyDQo+ID4gMDc6MTQ6NDAgKzAwMDApDQo+ID4g
DQo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4gDQo+ID4g
wqANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL01v
dWR5SG8vbGludXhfZndfc2NwX187ISFDVFJOS0E5d01nMEFSYnchbk1ueEJCMk1ydXFwVUEwR25F
cmRQQjdIZmVsMEY5RGFBYzd0MGhlUVVnZWJfM2lqal9nUnB0YVZ2WDFRNzE4clZYVUlESmN0VEEt
UGRzWTJabkM5RXFvWTl5YVhmY2lyNFEkDQo+ID4gwqAgdjI3NzQ4LjAzDQo+ID4gDQo+ID4gZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+ID4gZmRhZTA2ZTYzZWQ3NWZhM2E5MWM4ZmFi
N2E4OGM3YjIyYzEyZWMzZjoNCj4gPiANCj4gPiDCoCBtZWRpYXRlazogcmVuYW1lIE1UODE4OCBT
Q1AgZmlybXdhcmUgYW5kIGFkZCBzeW1saW5rICgyMDI2LTAxLTEzDQo+ID4gMTc6MTM6MjYgKzA4
MDApDQo+ID4gDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IE1vdWR5IEhvICgxKToNCj4gPiDCoMKgwqDCoMKg
IG1lZGlhdGVrOiByZW5hbWUgTVQ4MTg4IFNDUCBmaXJtd2FyZSBhbmQgYWRkIHN5bWxpbmsNCj4g
PiANCj4gPiDCoFdIRU5DRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMyArKy0NCj4gPiDCoG1lZGlhdGVrL210ODE4OC9zY3AuaW1nwqDCoMKgIHwgQmluIDYz
NjU0OCAtPiAxMCBieXRlcw0KPiANCj4gSWYgeW91IGhhdmUgTGluazogaW4gV0hFTkNFLCB5b3Ug
ZG9uJ3QgbmVlZCB0aGlzIGZpbGUuDQo+IA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBtaXN1bmRlcnN0
YW5kaW5nIHJlZ2FyZGluZyB5b3VyIGNvbW1lbnRzLiBJJ2xsIHJlbW92ZQ0KdGhlIHBvaW50IHlv
dSBtZW50aW9uZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiA+IMKgbWVkaWF0ZWsvbXQ4MTg4
L3NjcF9jMC5pbWcgfCBCaW4gMCAtPiA2MzY1NDggYnl0ZXMNCj4gPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gwqBtb2RlIGNoYW5nZSAxMDA2
NDQgPT4gMTIwMDAwIG1lZGlhdGVrL210ODE4OC9zY3AuaW1nDQo+ID4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgbWVkaWF0ZWsvbXQ4MTg4L3NjcF9jMC5pbWcNCj4gPiANCj4gDQo+IC0tDQo+IFdpdGgg
YmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoNClRoYW5rcyAmIFJlZ2FyZHMsDQpNb3VkeSBIbw0K

