Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA2606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FSOBDCZx;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ac+tri2W;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=MLqSCkQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T+2N1ZvLZH3MJQPCqGLDOh7K8OnQUxf8ez89fT9NbJI=; b=FSOBDCZxRDjfDp0oqWd4fHx0MC
	dQiCnLwQ6kiSOORU6sY6IZJc88kWzVse9cq7VbR5A28QBD3bAYxbQHIwBIIjNy6L01X7bPBEfDqDZ
	CwwE3xdbiO1cnwtMIBmLDqpWxUw75O8LKIcXghMx8hvv6O2tmEObxefWyE+QVA0be08d8+o6jbtvb
	rRV3e5/50K+j1vGmBCCzoJQHOgZlND5AIPuoxgW9VmcIQTnLcyHQOpiwVZVIsisVRH4Mk6mYq8oCi
	XOpjf5jrrR3HAMcFjk0gDbt6mhmvVOi0Xp8AIvTOQf44xul8Q0YcpCFvAtGewuOEJ/Cdd0szrg2bI
	jTYRxK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTa19-00000007zwd-2kCT;
	Wed, 18 Nov 2026 07:23:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTa16-00000007zw0-3wf6
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 07:23:42 +0000
X-UUID: f6f81e8ce32011f1afed4741b24580c9-20261118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=T+2N1ZvLZH3MJQPCqGLDOh7K8OnQUxf8ez89fT9NbJI=;
	b=ac+tri2WroGHBNi/uyq8/idr97vRrizYq3C4WUhaVHmBFH5qXTo3OtLQdhGefFuSa21PQZfViq584J0IjUmah5dmFvmO8jxmGoBNglPJ93BaMnf5iRAndZ7Lw3JVa4YQJM5sR/n/Avmupttw2KofT3cZjgjwN+qiqvxsBMHQpzo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f5fbe48c-9e2c-4e91-9619-90b60cfb41dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:7f987466-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|110|111|836|865|888|898,TC:-5,Con
	tent:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6f81e8ce32011f1afed4741b24580c9-20261118
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 902015758; Wed, 18 Nov 2026 00:23:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 18 Nov 2026 15:23:32 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 18 Nov 2026 15:23:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4QccaFk+LS8gmycoSruJrZwHsy0t67SSNd6A96iu3/m3Bs7fEnKh4PY4LE7IaX37pIHNvtLoCgdK9JMnW17dqIuRfJpJvOOWLFrPz2NbNIZfUYnUyXQ1/84v/h63YpE7/9F2e2F60JsdThJiGvxpEPlMHoJ1C71qxmkTeJMDhFVBHocYmYZegmTc9s3QedavmIUzcMasqXneuK6FpUVBj26xfT/5H+qEII+2+jkCnyjpf/KTLzhQ182acodxq5hyXXhRt4YE+gSEQEfxBYVO2XX49FQjxwgaAFXiySOjfTv7Z1h3mmsKx5+BmKpYRVh8rT1cEGWsRUF2ETuHsXniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+2N1ZvLZH3MJQPCqGLDOh7K8OnQUxf8ez89fT9NbJI=;
 b=WolFvkWhdJ8mOfln9z+HT2ibb9ZwlrSXngYfNpEz4Rgd2+kcHkgIeEGrBd+bkhYJ3YyUdN5GYbsRnnxU4tLnXIoYc13SsbWmFV/mDAh+4fZXAq08ljJ/oVxt/quqOcW5BGcBCKfLLNpkXoK7zU87yesFHGjlyefW8s84qOt4KUuD0oepuTw03yT0t9HPVHoz9rYPTwQQtvLD3vGNajVOD/DLuEr5hrkl4SBmT6XUDkGhU9zUu/cC/sBDYjv0iMS8+cAUEVrn5IIA4B3tFZMs2MjAGKnYEHIElYaHkt6ks3ZJpCWhkzwkgQjsu4U4NKL0RJTvg+yuFp25/2r7fjqZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+2N1ZvLZH3MJQPCqGLDOh7K8OnQUxf8ez89fT9NbJI=;
 b=MLqSCkQD1h/2z0AKwby2wlrP0eo/Wj27k3fjNOk2P42smvvbZ7Yj1frgUfuu4Mk+83ivUFLS5BmbWpkVUwpWYCpF2KXJAiNSEE/uPKRzRJgdImjKoceLgj2ySZ2pPoguQ5xFipqLGorf97TPzOiJz0odqAm70zXviTSe9KrPCMk=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SEZPR03MB7470.apcprd03.prod.outlook.com (2603:1096:101:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:23:28 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:23:28 +0000
From: =?utf-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
To: "hoopyfrood42@gmail.com" <hoopyfrood42@gmail.com>,
	"lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>
CC: =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>, Ryder Lee <Ryder.Lee@mediatek.com>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	"floss@jetm.me" <floss@jetm.me>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
	"stable+noautosel@kernel.org" <stable+noautosel@kernel.org>
Subject: Re: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
Thread-Topic: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
Thread-Index: AQHddK0AK8hkGcGwvE6BAU0mBGtAXrcvswcAgAO/B4A=
Date: Wed, 18 Nov 2026 07:23:28 +0000
Message-ID: <173fc5e8010e9f01a9a11f0d98d0934c8b8ccc09.camel@mediatek.com>
References: <20261115025635.40010-1-lucid_duck@justthetip.ca>
	 <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com>
In-Reply-To: <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SEZPR03MB7470:EE_
x-ms-office365-filtering-correlation-id: cad6b667-409c-4f8c-025d-08df4544d76b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|38070700021|261021121427099003|4143699003|11063799006|10067099003|261026121527099003|261102123227099003|18002099003|6133799003|22082099003;
x-microsoft-antispam-message-info: Cz0oMdZeT9sYUaElZrkwVnbz+u2IrvUcR4UOWwu5AdtRidpwiOLeDA0SXSr4lQOrq8JKIzlkFz2wDvSmIwrKIUgG2FloulRmsYXd3rpA6i2VcS4CVxHEg0qDDt9LwByG4NYr/v/C4h41QoQCYbFowOEnwv0g341tOWrkTpgZn7JxBEM0lP2SBvMl9RGMZkkgar6CRPBClyo7AcXQDZAm+F/N5J4om/NrIt2zyOOKMf7xN3+yrZixxAtoOXjyoGlc4gzzS8WiLC91VUx7OuVb8Ikab/KK+hwUB+GkLMmE5t/inkc2oG8gcjlGIA73YPlVHYvOQ7NH46iXSWL6+lBxX5rhbo/Jq3rzVDdHrOUIlFIlmcDChASkH09nv/xDJms1/kqNHpXBH89bEwllId6OKBuYVmIyKZLpjyYHyteFHyazq0Iqx2B+LJTfBtKjJsd++Tictoa1NEKAkG+8YhZsbQzh3tq2+YKPiKA0pChB6Zzr9qXZ089AYqOq5kCkJXKocJfFXsT6wr4m7h37w5sNB8Yi75cSZL8FRckoax2O844RuG1Ev7PwUP+KmBy8rP0458oZ0kVbxOWOoOW7UdqHkblZzdZl6IXfaonK1jCAOU9m0xihTxRG60qZpnBaraMuzEOWds56GAm6bU9pdlRyeLMD2TUxclT5bTKxhGuWV73opsy5fTHibfhJmJ4LKrEGlCjoVlFnEGSRjszLCDb7oHcWw7hSIwFV4/i4uAIfslw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5742.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(38070700021)(261021121427099003)(4143699003)(11063799006)(10067099003)(261026121527099003)(261102123227099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTVaWTF2aEUzV2NpWTBWS1FrYmtqejVJUHZsdUw4Q1pCU2tNVWhqT3gvTytQ?=
 =?utf-8?B?UDVxZ21sN205ck85MkJMNm9jc3pMU0lPdkFoZmFGZFRGcFZGNDZtVlUzVmla?=
 =?utf-8?B?Sk93Q1NyVXdGV0Y2Wkt6SVdVYWN0SElKUmRtQ0pjc2NuVUNRd2lDU2M1dW5k?=
 =?utf-8?B?RDRsaXZIUmJ1Tzk2cUhHbmFrdThvUkdMTTJndGdjMDBHcUtuUWRxbG5QV0tq?=
 =?utf-8?B?cWhTUWdzYVNwSHlnSWEzNHdZMmhSUXhYVWUyMnlETzdDQks0SnZUREpjc01Q?=
 =?utf-8?B?dmNvaEZxampFNG1URzg3b2hxTHJQVGlUSExUanhpZElpY3BHc1A3bXFsc3h2?=
 =?utf-8?B?TktRQzB1YVp3VDNWbzdnQ3pQODZZMjFoN2NhNDBRQkpXL0huN1YrWEhkUjV3?=
 =?utf-8?B?eUt0WmEvb1NpbmxienZmWlc3T2l3dnZsOHFFUjV2c09tL1pYUUhFRG9EZU0y?=
 =?utf-8?B?MWtsWWI5aXN5T3Qzalg2MHFYT3BhVDRUYnhwMkVqVzlJSW9rM2lWazBDSkpk?=
 =?utf-8?B?N2M3d3lmMjBDdUJ4YWd2OU9iSWJrWVlkZCtrYjlYZ0JVd2NOeDR5OXBwVWx0?=
 =?utf-8?B?SUNIalZMNDBQQlFPVmVjTVhXNWt4ZUU4czNOdHpFQi8ybVlkWEszUmE0OVc4?=
 =?utf-8?B?QS9TNW1MVmVsZEVjV1BsTUxjbXRjZVhFTGZZMlZWZGl1azh6RXIrTWhvQTFQ?=
 =?utf-8?B?dGtDR0Q4QXFjVHMwL3VQbStsM1BVNlQvSG5Uck1UTnErd0F4SVdvRnJvcUFK?=
 =?utf-8?B?ek1PeWh5UDdWUWE5V1l2ZzIva2JmbEFOWVNmSUpOTTBTZ3QrY2tMN3pibmo3?=
 =?utf-8?B?cC9XVS9DdStsdUdUUDg1U0x5M1k0VEdkZERrRXoxTnAyUmwzcU8wbGZvdkQ2?=
 =?utf-8?B?MjczMGdXN0NPOW10WCtCSUsrQlh3NlJET0wxMG9UQlhQRUhQZENyUzdaeEd5?=
 =?utf-8?B?WWR2OVBUa29PUU50VWZFZUdiMkQ0cG9jWC93SjNOcjNBMkFIdk1zNmdCeWVk?=
 =?utf-8?B?b0lhNXF5YXBwc0JuTVlFaWM0dHBONENaTy8wNVAwWmU3RDM1Z2lzeEY3cE1p?=
 =?utf-8?B?ZHhmMTRBR1NBY3ZGUHNPbGI0TW5aMm0vZ3VLSlpQTmI5bVBscUF4RUZjSDJa?=
 =?utf-8?B?MHBJMHN0VitCRytsY2laZmlQMitHekpLSVNROFdJOUVGd29XdU1nU0xvbzZT?=
 =?utf-8?B?U3hidTM1a1FaTEVscm1pRGFEdEFTT0x4S29weTNwdXJpUGRnMFk2elFsRlVy?=
 =?utf-8?B?bGlMKzIzVmpBTjBMVVdXejdYMjVnWWxqYkJmbUhjUWVhUTRKbnRHZ3ZmaDla?=
 =?utf-8?B?bWZKcXFORmd5SzJLL1R6WE8wTjA2bnZhNUZhRG5SKzNCTXg5ZWtRRlBhRUUv?=
 =?utf-8?B?V2JicEhXTTFqZ2pWNkdScTJBZjlGWnZydy9KZlhHK3hxQWdXbExuelVINmQ1?=
 =?utf-8?B?azY0M3o2eW5ySkVwUHI4RWNnNWg5TmNqMHl0aGdFd0VhTUNiSXhHZzNSY2cw?=
 =?utf-8?B?N29WWnQvWnhhdm5XcDUwTENMdmFhbkxnREVucjZDWVJmMHBOamp1WEZuc1ll?=
 =?utf-8?B?eFlQUzlEZ1V6cGErT29QdERiMzhPd3pReDVURVlqcmdHZU5adnp4L0E5dm9q?=
 =?utf-8?B?cXNJQm5ud25oTGFyTDlEVkwzLzBkckI0VTEyamlpelQvM0pOSEtxZUlWNWVm?=
 =?utf-8?B?V3dRTWsvZUdneUVxaGpURkdKQXZ2ZHQvSGF1a2R3dlEvRzk1U0JBMGc1Qysy?=
 =?utf-8?B?RzZBVW5wVEpidld3SzRkUDgwQVhrVkRVMkkzeXF0Tnh0ekVBTitmejNkVGFI?=
 =?utf-8?B?L1dNaVl0TmM3Ump5MWFaeE5vMTlYQTd5VU5nWDFJZmMwMy9PbGdrNDBHMjJ2?=
 =?utf-8?B?UU5Rc3hvMUZJcmtUK2JXSk9HODA2YlBEb3RQNEI1aHJBaDBiazd1NngxVHQ0?=
 =?utf-8?B?WTBJWU5PZjk3cVVSUXlqelNYazBUbmZVaE1CazMraUczalp3b2NQaWhpVGZj?=
 =?utf-8?B?cFJyS003a2Jqc0d0VXNTNnZWVWFVS0NwS1pkZll0QWtiVkdMM0dZSmh3ZmNU?=
 =?utf-8?B?ZUdYZmtjUHNqeWtPRzVieEY3K3hPSjNHVjJoSUJsMGlxT2pxZ1VnVWw2eUFM?=
 =?utf-8?B?VUp3ZFNLbDg2TjFrSmYveWxHSFZiRXRmZWZ2eDNMVVZxVVprb0NrQ2tWRUFX?=
 =?utf-8?B?WGF2dFNTcW5oREJuN3NsejJjWHNWKy9rS0xST1BiUFRTRDhOK1ZoQytKMUhN?=
 =?utf-8?B?anFLc2l1WEt3R3JHT2JoNWs5SnhjWndDaUtjaGYrVXNLamp0SWFuNFl4cFRZ?=
 =?utf-8?B?YTB0eE1NcE9STjJ1SWM4RVR2RWNsK1gxdjJJN0xXQlptQXRaMk10akZidjR2?=
 =?utf-8?Q?kLQ81ZHfQX/6/7jw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4F80CCE06116E429714FBC33A064203@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lVXGTcEAkV9rIZWOvZ2UDtZkrvrz5Ldmjrw9LuDpcV8ejXrDH75GCIwypV2Q9YI70Fvya8RUCApxMtoq9vneRjmeXOE9EmdGNOPQDUKP+PMZWL+pmLK0LwEqzfpp2oleo3/P2wXZ4T1ntGHQOrhjumiSrQlPkYQwahZZazq/itnPSDXhRFRdWKz7iQ6ULzH60OqZcobL4GeeUKuCuQ+H4bPnRBWcLbSTfltFVkEqVo2Ec1tPW5mk6jKiUaijfZCZ39J1tnR9NsSnIBqc9IVqjH8IFwESVs5ssKWiEohqg6jb2N5YWovzQ8zWe1vYjvNhzRGKG0hkJozu7nhrCrBIzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad6b667-409c-4f8c-025d-08df4544d76b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 07:23:28.4002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hG6EcIFcZc1P9ANgjvBnwG5YpeDkGa2K1MlFMj8vugenfkGcr4PgY8drYUqA6rZ//qNHV6xoi35vf2XiIVdCczBKl/L4QNNwSIH+MuTZ1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7470
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_232341_001125_21ADCFBA 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hyaXMsDQpUaGFua3MgZm9yIGRpZ2dpbmcgaW50byB0aGlzLsKgDQpTaG9ydCBhbnN3ZXI6
IG9uIE1UNzkyNSB0aGUgbm9pc2UgZmxvb3IgaXMgbm90IGV4cG9zZWQgdG8gdGhlIGhvc3QNCnRv
ZGF5Lg0KDQpGb3IgYWRkaXRpb25hbCBpbmZvLCB0aGUgTVQ3OTE1IGFuZCBNVDc5OTYgY2hpcHMg
YXJlIGZvciBBUC4gV2hpbGUNCk1UNzkyNS9NVDc5MjggYXJlIFNUQSByb2xlcy4NCg0KSSd2ZSBh
bHNvIGNoZWNrZWQgb24gb3VyIE1UNzkyNS9NVDc5MjggY2hpcCdzIEZXLCBhbmQgaGVyZSBpcyB3
aGF0IEkNCmtub3c6DQoNCjEuIEl0J3Mgbm90IGluIEdFVF9NSUJfSU5GTy4NCk5laXRoZXIgdGhl
IE1JQl9JTkZPIHJlc3BvbnNlIG5vciB0aGUgVU5JIE1JQiBjb3VudGVyIHNldCBjYXJyaWVzIGEN
Cm5vaXNlIC8gTkYgLyBJUEkgZmllbGQg4oCUIHRoZXkncmUgQ0NBL0VEL2NoYW5uZWwtaWRsZSB0
aW1lIGNvdW50ZXJzDQpvbmx5LiBUaGF0J3MgY29uc2lzdGVudCB3aXRoIHdoYXQgeW91IHNhdzog
bXQ3OTJ4X3BoeV9nZXRfbmYoKQ0KcmV0dXJuaW5nIDAgaXMgYWNjdXJhdGUsIHRoZXJlJ3Mgc2lt
cGx5IG5vIE1JQiBmaWVsZCB0byByZWFkLg0KDQoyLiBXaHkgcmVhZGluZyBJUlBJIGRpcmVjdGx5
IGdpdmVzIHplcm9zLCBhbmQgd2h5IElQSV9FTiAiZGlkbid0IHN0aWNrIg0KKyBjYXVzZWQgTUNV
IHRpbWVvdXRzLg0KVGhlIElSUEkgaGlzdG9ncmFtIHJlZ2lzdGVycyBhbmQgdGhlIElQSV9FTiBj
b250cm9sIGRvIGV4aXN0IG9uIHRoaXMNCmNoaXAuDQoNClRoYW5rcy4NCg==

