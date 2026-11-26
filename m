Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96278606A330
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfI6Zmuy;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AMIhVdFM;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=IuOnmvp/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=; b=cfI6ZmuyN8fY1vq2i3osKHYzA8
	txP2aBviFt9xXNWvKLC0C4qBLJRE7rt/KDXrlCveYw5/sef68bi0vKmOUeOaz8X4wFVjU8FGBifat
	ZBA2PYYVi/pam2/lcyVA+WcwYl0aYCRL0bDAq5fpZIq0/YhH3mA842WuuqLuCf8L7X/vCmFOKAOxV
	RfyAuWAg9E5Ildsf0DSOpu/fhU9iV52rhRynqHOInoPW0crSgqJqhorOObHughJIpu0qxY4vhs1Ou
	eHihTTFUa/pHylJXMCm5i83pM7NAYm34Yfit8mvBTLYKMJKcXl5ohng4KAe9TX3z2j1hf6KbYDSpb
	DXt4/xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVAG-0000000CR0r-1C9M;
	Thu, 26 Nov 2026 08:49:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVAA-0000000CQze-3hpd;
	Thu, 26 Nov 2026 08:49:11 +0000
X-UUID: 3a559b72e97611f1a36277631523a8d6-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
	b=AMIhVdFMGPiDnRaELNvIcge0xTVIL5rHr5qlnkJiSRbpS97UwegyxtRifTs6T4oktwfwGJuAbH0MZbIg6fFqn8hicAMciSRHc+LhdCHqcNjb0ed5LlnTryIh374YXzbz2EUzOpAHp1/oNzf3/IgvQxVQkGC7o+w8VvW3ZY+gQ5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:be0bf4ae-5a93-4024-988e-d9798f9f1447,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:6744d066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a559b72e97611f1a36277631523a8d6-20261126
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 694896574; Thu, 26 Nov 2026 01:49:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 16:48:59 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 16:48:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFsEPzBksNTY7VnYlo9kN+fcwlJOjoDNzl3Pjt5w0xqCmNG3fqrucJY8kcgOa/tph4MNFian1SG4zNod8jrxGCTtckNMRosDTJWOpWgYIFXtb4dhU/1iFx/vTMutU2CCBaGkxdh/8jEH8JagmcMYV+egzHYX+tszzH4RLIa22wMgeolXRVmHRcjEZayVIKevXVk8CTubHs1GqeOnCbdxUaSC8/sVNRP7Z3Pd9OotEQhQAEB0kmUxyNV1kX7MpTmHM537IsAcMSaB6H3+tzYvvVx/pxyxFVQKLdPg8J5FvaPOj6u5nNiIlDjs0jiBI9UbSidHS4ZdY9IGcljgbELLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
 b=vuVr+5j1sN/D6e6d9gD4EBCFiCCqNge1uSnNP4vmZawU0LOzjdvymXBdEUVBNJEKmF5lSKVOC1l5Pxc0RXna7o/D3tx3fkdDd9CnS9dJ7y3VnkxQ/heoVva3iQehWgjWtWLeYlC8jALdH1M/RvqmJdfxR9VMLfC56V9GdxfFF6D4p6eDZmLyRgq9dpHl91vbAhZdxRTOK70WD0OkGAO6Er50V6cK3ZA/+tOdjGW9mQw6Zj4vb3j4F9g7QdLIzcGsm2zunrwGWi+aEoXOvefcd0mBkg/3h1bzvYhr6WBYIclxzvMP7qUsB84fU2sEUadPfcEFLuscioFjqI1s0OwBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5KZo0HEDNK5vZgeq+e06P4IYLVDMv+p6GFWj3amkyc=;
 b=IuOnmvp/ReIpATOrABg1kxUodSuLLh8UTL87cjMNridcuDit0N/b9vDu0SH5H5ngyLtbb7zuU8ztS1L3Kx57vRAlY5/pLHhKa4YIInZEp25Hgm6Z+60Ap+ieNUym2mD7pFCQe1HXfjKZusXulXexfxSqRy5C+DQ8PnRdZM7bmTs=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEZPR03MB7810.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 08:48:54 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:48:54 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Topic: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Thread-Index: AQHdez8S+840qKfXnUKIxOccMp4Itbc9Y2YAgAKsCAA=
Date: Thu, 26 Nov 2026 08:48:54 +0000
Message-ID: <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
	 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
	 <20261124160038.GR229695@black.igk.intel.com>
In-Reply-To: <20261124160038.GR229695@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEZPR03MB7810:EE_
x-ms-publictraffictype: Email
client-request-id: e390b6a8-9939-431a-b461-71481c7c3318
request-id: b40f6963-4704-40f5-9d01-08df4b9a19df
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|4143699003|10067099003|56012099006|261026140227099003|261021123027099003|261022105027099003|261028144727099003|261102123227099003|11063799006|261021121427099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: ++I8Sx1nOc9hVcmmHe3K8s9Ho4oHC4nd3c2lmoP2FhR7ZmVoVmESbAoIN47EEoM27dG0nO990KBtVOJG6hUugPOe2tBMEcRyr2b6piCCNGNLyEOyEZdEE2r+qerYcplw5XR18E0n0KiGFT213TuMSERC9s93znshjduP9eRjOTXQi1a7afuet5Ajb9NBRFLC2iqdrTQfhhzBUlXfYbDupusPScyh7Yh80PKtz3WkP6sSAvz/O6SUM6OvBoR4Ul7NxTX5uxBIBMzq9uxc5bTED6EHRXbOTVhhYMHMmRHnhp3Ms5JkqJTOiYVzA2IrCkhpGZFR1wzhNdAAfZGVIdTvsjkVQQUCgt9dJ4Pv2Huv3odBjp5vz1vZiV3BKspi7wGRCAsO7Zux3vd+Pjn0XmtyNiKJNhqWl5sZccUaHE3hq8Jj2qUDrnBJKRjgCCnKmiY0PyMGGoLXnz2GxtT5VUa6LP9RgogXfrkEmIzJT0qqQ0fRBPobl8xCDltLjA9B8FL3Swe9Rz1UuhJoJ1Bpc96prbamEmr/Ml8DR3Ht73Khprcp+WYMcHKVfPf4prcjHqcczlVtGZL73/Nv5ZluAB+2fV90MZ7nuD5qSUTvU9oyVjwk36BQGmiwaQLrRWiuHfeZrdpfTmy2U92bT3pWfZozQGGmrycLbkAWxR/kXGB9J0Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4143699003)(10067099003)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261028144727099003)(261102123227099003)(11063799006)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU1wQnk5Q3hPRW0yTjl2bno2bWt6YjFIRUROclFkUGtDMDMxL0dRb01rTWsy?=
 =?utf-8?B?eTVIaEdTM2tvNitieC85N28xK0MvbkowU0NxNXFsS3l4ZTdieDRnRUtmMEs3?=
 =?utf-8?B?R1BGQUVlanhPcjZvVytpaFVpYmRycis5OXA2c1pvdVVSK20rZDFxSzg2YStY?=
 =?utf-8?B?WVJTclhWOEFFRXAzWVk2bG5sU0t2Z296UUpGL3F5Z2UzV0lDaS8zQWpkdTlZ?=
 =?utf-8?B?U3ZCQVY0K1M4aUFJd3ZGY3hHL2xkeWxoNjg5OXcwYmVnKzBIQnk1WUNHMjA2?=
 =?utf-8?B?elQyb0lNNkI5c2RkWlBDVjJWV0RQcVlYTURjK0t2THE3MWVyZHBuejR2Q2o1?=
 =?utf-8?B?MkVpbWdUK1BtTmJwdTRoMEE4RVQ3QjdQUk1KaTBRM05LQ05PTHg4aUdoOW9p?=
 =?utf-8?B?RFI4SWJ0MVhibXZKTXZsNC85S2NzZ1pONWxIMmpxb1RZeUxONGYxOU9rQWdI?=
 =?utf-8?B?VnJLeHZxOWpCaTdxQ2xCbXNjSVFmd3pvWkdMZE0vVjJvNGZPbERMRDBKK1BN?=
 =?utf-8?B?WUYybklFdUJra2MyTEhVQUlEY3JtZU0xVW5Ec1RGZnUvL2hEUTZyVHY5L3ha?=
 =?utf-8?B?S3JBdFdCV1dPZ3ZSZXo5Z2w2ckpCamVra05XRlJEYmJPQkNVOXRlYzQ3SEI1?=
 =?utf-8?B?VitEN1VKVWFMRXhkQ3g2di9hREtpRUY5VFZIaE5pVHJlZkMrdFR4cExLejdn?=
 =?utf-8?B?cVpXSmJNajNybmVYb29rZGxudW1NSUhaY3dDMkI3SGIrYTVTRkNsSGw4a0pD?=
 =?utf-8?B?RkJCVFBwWnBTOEovSHhCTFR6eDdTSE5XYUxwSXlYbFBYdFpqQ2h6UGlUYith?=
 =?utf-8?B?SnRQVVhjSFVSQTdNbGJ1SytKMWgrWlRNa2M2TTVRZDBPZ2lwNkhOT0JmeWJ1?=
 =?utf-8?B?YlBCQzExT0tzYnY1Tkd1WnpnZmhQS21vK1k1N3FEcXdpS2RmdkNRMisyZnlj?=
 =?utf-8?B?Nkk3aXZwMUlNcnVDSks2RlFaRkhmNGpiOUdrWUpSc3BYQlk5N2VJUlFQR2xJ?=
 =?utf-8?B?SzBCK3BXY3o0U3VWcWVEVlFJSThmVVJ6emFIcVcrK3dTMzlrUlRnbmpPUFFZ?=
 =?utf-8?B?cSsybE5NeDRrT3ZHWVZkUmZTckhoQXpkZkRqemt1QzhjWTQzbWY5MkF1WFNl?=
 =?utf-8?B?M1JwTzFJd2h5UFMrNVI3WDFhT0E3bGVSVXA4UlhhaTZFS0tVdzFQNml6dlNT?=
 =?utf-8?B?OE5xaVhyaUE1WjYySFN2Ymd5RVJaRzYrNlZLZitBbE50STB3ZW5oWStjOGE0?=
 =?utf-8?B?b2NKcFdVNTBwWngzNUdIaFUvcFo0YTRnK3VtSzRFODdrUng3ZWM1T2Vjekdk?=
 =?utf-8?B?ZUJLTVBTbi9UK0pCYU41bTdRUGRyS3RZQ0hVWVdkL0ZqT0Q2d3N4eVVjQnNS?=
 =?utf-8?B?YTFHY0g1aithaGhCeWQxYkJpamZxY00rN1JIMDBmUGt2K05nYzR2WGJJNjdU?=
 =?utf-8?B?RDdLK3UrVHcrczBQb0h0OUtQZEk5UitZN2toR2tyQyt4aC9uaDhhcUpDMmhD?=
 =?utf-8?B?dkFIdzFyQnY5akRoa0JaTTRMYVQ5SURHR0dvc21uZmxHN05WZEJQeEo5QkZZ?=
 =?utf-8?B?T3ZYcUR2anRlL2hLSWt3aHFZc3NtNHVHWHo5NEtzS3VTZ2xiZFEzU3ZIdEtu?=
 =?utf-8?B?R20rQXY1SmRmWGdwTk1XZEtkeklLU0FKdjE4TmdQWEY4dXZpUm82VktPZjJn?=
 =?utf-8?B?Rm9SVUgwR0d0eG1zUHEvd1V1dmRSazB5RjJrUUtvbGpVMHFwMUdpVlRJanV6?=
 =?utf-8?B?b1BNK0k5TTRHbTBjT0FjOCtONEwyVktCQ3l2L29nS1lhWEI1UlM1TjBMRjBW?=
 =?utf-8?B?K21JQWdZeHlnZFQxWUJ0VlJ0OUR3KzhSb2pYYWdidVovQmdOS1BEYXRhMzE5?=
 =?utf-8?B?WDFCQ2g5WEh5VDZpdHpBa3BGbkhDbkY3KzNINFhic0hKYm1zdG40Sy9vZW9S?=
 =?utf-8?B?c0J5SkF1OXk1TlpxWjFrd29scERjbDRxeCtwMG1hVjJYSjVJUXhHNmZ1ZmhO?=
 =?utf-8?B?cExjZFRuYklsOHlNZTlTb20yWlM4WHZjZExlWnlKNmVHcmowR2kvcy8va0J6?=
 =?utf-8?B?c0lHVENnai93NDNtVEtTSHFoemJ3bUpsQWFncnBobXJXeDNlVkpHSXFFZmJ0?=
 =?utf-8?B?Zi9FdDFJbXhEbkJxUHcyYmtVb2NtMS9mRVBwY3hUNGFHY0FVMzVybWtVUkVB?=
 =?utf-8?B?VjNVeTVYdUwybkNzaFVwN1F1NVlSNERRU3V5QUFXbjEyVjdrTHFxZnlsTSt1?=
 =?utf-8?B?a3Vlcm5sS0xkU2VTOGNaRmkxOEEwaHRTcFdUMjRXNE41a3pNRWtVVlNZRnNB?=
 =?utf-8?B?TURYZ2o5N0VXOEhCWlBtUVJqL0xGNGFnK1hTSmtCMDRrMFlHV0syMnVEV0hn?=
 =?utf-8?Q?g7SXCaWJ2Owi4tQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F37EFDD2DA0294B9EA2CA5BEAAA69A5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k9r1C4QBiTcYFDvMtfFoOq8yK9nMjUmPF0Qh7/rrLMaRHX4oKfKhIcycfvX1Ed2qoU43kyGQPLn2WjcuowbOwX1hRZEl1Vaw94wBQla77biRPuqhxH8qerEkmBXBvxGtYmn9UjGIVJIQe730mKkWTYdgUXtQQKrVOLWh2dB9W58dxvOL14lBmsObgQ/vkyOP058W6PKIUqeP+LDC8Zy7hMKBThIPgIMx9Sb1lkrDZ0fJSbma4/FveuPxdI/c+XR+rjylHQwu1iR4c95swyqmJF1zdatosQC5aV6M7Ink9zi/nx2IlLK4yJGSNQ0RowtEGNstPE7E09IZ/fwJ/49a7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40f6963-4704-40f5-9d01-08df4b9a19df
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:48:54.0461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wh9weYsx7e8P728F3RH1ckANKNZ+1Mv+IBOekfyMft72nL4UivzONR6FgqflSaYygFU8TAJBtdVQrBQPZ0QZJ4+v0pz6K8daBIYENI/LZ9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7810
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_004908_630920_4818679F 
X-CRM114-Status: GOOD (  17.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24g5LqMLCAyMDI2LTExLTI0IGF0IDE3OjAwICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIzLCAyMDI2IGF0IDA3OjM2OjU0UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBXaGVuIFVTQjQgaXMgd29rZSB1cCBieSBkZXZpY2UgZGlzY29ubmVjdCwg
bm8gbmVlZCB3YWl0IGZvciAycywNCj4gPiB1c3VhbGx5IHRoZSBwaGFzZTJ+NCB0YWtlcyBhdCBt
b3N0IGFib3V0IDIwMG1zLCBhbmQgZW50ZXJzIHRvDQo+IA0KPiB1c3VhbGx5IHBoYXNlcyAyLTQg
dGFrZSBhdCBtb3N0Li4NCj4gDQo+IFRoZSAyMDBtcyBpcyBub3QgZnJvbSB0aGUgc3BlYyB0aG91
Z2g/IEl0J3MgZW1waXJpY2FsIHJpZ2h0IG9uIHlvdXINCj4gaGFyZGh3YXJlPw0KDQpZZXMsIHlv
dSBhcmUgcmlnaHQuIFRoZSB+MjAwbXMgaXMgZW1waXJpY2FsIGJhc2VkIG9uIHRlc3Rpbmcgb24g
b3VyDQpoYXJkd2FyZSB3aXRoIHZhcmlvdXMgVVNCNCBkb2NrcyBhbmQgZGV2aWNlcywgcmF0aGVy
IHRoYW4gYSBoYXJkIGxpbWl0DQpmcm9tIHRoZSBzcGVjLg0KDQpJbiB0aGUgVVNCNCBzcGVjLCB0
aGUgbGFuZSBhZGFwdGVyIHN0YXlzIGluIENMZCAoVEJfUE9SVF9VTlBMVUdHRUQpDQp0aHJvdWdo
b3V0IFBoYXNlcyAyLTQgdW50aWwgaXQgc2VuZHMgTFRfUmVzdW1lIGF0IHRoZSBlbmQgb2YgUGhh
c2UgNCB0bw0KZW50ZXIgVHJhaW5pbmcgKFRCX1BPUlRfQ09OTkVDVElORyksIGFuZCB0aGUgc3Bl
YyBkb2VzIG5vdCBkZWZpbmUgYW4NCm92ZXJhbGwgbWF4aW11bSB0aW1lb3V0IGZvciBQaGFzZXMg
Mi00LiBBdCB0aGUgcHJvdG9jb2wgbGV2ZWwsIFBoYXNlIDINCih0Q29ubmVjdFJ4KSwgUGhhc2Ug
MyAoQVQgdHJhbnNhY3Rpb25zKSwgYW5kIFBoYXNlIDQgKHRMVFBoYXNlNCBhbmQNCkJyb2FkY2Fz
dCBSVCB0cmFuc2FjdGlvbnMpIG9ubHkgdGFrZSB0ZW5zIG9mIG1pbGxpc2Vjb25kczsgaW4gcHJh
Y3RpY2UsDQp0aGUgfjEwMC0yMDBtcyBkZWxheSBtYWlubHkgY29tZXMgZnJvbSBwYXJ0bmVyIHJv
dXRlciB3YWtlLXVwLCByZS10aW1lcg0KaW5pdGlhbGl6YXRpb24sIGV0Yy4NCg0KU28gSSBkb3Vi
bGVkIHRoYXQgZW1waXJpY2FsIH4yMDBtcyB0byA0MDBtcyBhcyBhIHNhZmV0eSBtYXJnaW4uDQoN
Ckkgd2lsbCBjbGFyaWZ5IGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHRoaXMgaXMgYW4gZW1w
aXJpY2FsIHZhbHVlIGluDQp2NC4gRG8geW91IHRoaW5rIDQwMG1zIGlzIGZpbmUgaGVyZSwgb3Ig
d291bGQgeW91IHByZWZlciA1MDBtcyB0byBsZWF2ZQ0KYSBiaXQgbW9yZSBtYXJnaW4gZm9yIGFj
dGl2ZSBjYWJsZXMgYW5kIG9sZGVyIFRodW5kZXJib2x0IHN3aXRjaGVzPw0KDQpUaGFua3MNCg0K
PiANCj4gPiBUQl9QT1JUX0NPTk5FQ1RJTkcsIGlmIGl0IGlzIHN0aWxsIGluIFRCX1BPUlRfVU5Q
TFVHR0VEIGFmdGVyDQo+ID4gNDAwbXMsDQo+ID4gdHJlYXQgaXQgYXMgZGlzY29ubmVjdGVkLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlh
dGVrLmNvbT4NCg0K

