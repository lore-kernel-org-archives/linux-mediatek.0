Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C871C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 06:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s1F9jnCckxVnqNpipYEVxZnhOjgWx+/G+VbNuI17pY=; b=Y94W1P+tAwkvERnwNTKXGYWGOg
	bOLE+9vCR5e5KHVMwcHgw6axrPOk9Q2UP532C7E+5vlmUZqEtEb+ceKcYEmcpq/LIlEBhHgfwYRK6
	vQ0FxhXV6sYtUfbmlm4fOhJEz1ptPVmDzvtYfnzczfo+ggParxDYnjR5B82rTaUWdCG/v+TNFKL8X
	wFHn3uaXzCBtJtT0KQGZCco7qcrAtHlV4GMPefPx6uhverlsAA4mzfDDaxSFnvnCvJ6JUq19otuZd
	o55MtiSr8Qdh/PpZ5/41dW9LR61rJqMEAFbw3aKhGrjYteHpUaQAlXjrZVYxMNaLcUCE9Or/D0vMD
	I+MroKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoXo-00000000oFV-0GY8;
	Wed, 01 Jul 2026 06:35:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoXl-00000000oF5-2Ba2
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 06:35:34 +0000
X-UUID: 0cede29e751711f1acbe4559397dec65-20260630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9s1F9jnCckxVnqNpipYEVxZnhOjgWx+/G+VbNuI17pY=;
	b=oQkb3koUwv/VT61urN2DnEUj8G+KbNg0bnqcXhDk8h0gUZc/EVbK/jrm8UgFbhcF9j07g/j/uEhBvvfoMkT9rKAirTKXJ03P1S+iST4yQ8RBvEKBP355Hrs8jkIy2eoKr7H34zxNJs3fkJgQuaA/9jcojJ65qHib1m16gypV24I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:d7ac8b23-d85d-4c45-bf2a-603531e0c870,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:d497b38,CLOUDID:a076ad0b-cc5c-4c79-a965-86c83a4d1523,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:4|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
	EC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0cede29e751711f1acbe4559397dec65-20260630
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447933415; Tue, 30 Jun 2026 23:35:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Jul 2026 14:35:26 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Jul 2026 14:35:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDChcVsYFygRvBzosZp2G2Bkj4zii4zAVrjOq5sTFcb0rSIgP08ZgjrMgrGTiJYwjCY9MHRWkZK6D3nuAogwm4a5yxwGB4vYp1//+x/m1OL60qTmz/HP3QwDRKgRBZVftkDbM1p9dYCMowPB/XsKKC0AeHr2Xb3kKNi2q4/fqyRxqRzXrKX/lrE5lg87W2qhhkWz9dG8bEWMyfon/QPM2KhFsDw6nWgZW0McX0XDnoiMDrl5uwksDCYydQkDWpMDGEDhkH7FVYCvKsgPO/Z1iCX1biH2IKJGJk9toquepN/PZCAVpm67+FUgDmVP9adw0CxOpUtQpiglO4HDSHk4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s1F9jnCckxVnqNpipYEVxZnhOjgWx+/G+VbNuI17pY=;
 b=As9DB7YLnnUK/FQzl8N7gHQO5RTD4W2wOIkaMN6CKpZCzaycIOcMxOMyYPDmeRpX/aTGbTcdAOkg2nOcAxchJQazp0a0nSJ5yC3aqejsPNzSw1uWcHPZBd9x3TrOzAVuN76x0QSolMPDufF4vEzXwnEkZLt6NqXIAleOJBVBeAywbTYVqzZIJOUFXrAr+onqw4ZQ0gUXDBTzCB14Imv8/9Kk6UPk0MV5buSUhbZbc6bsS9foJbizNqyZdH/XEtr1wA/FC9ujF1Kn3IX+nT2Bjt6pzCTc6q+ipFfejl2KUeokPPwBwSIKEqghOoabVqTwqaYWfpf4i888nHjNHwZr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s1F9jnCckxVnqNpipYEVxZnhOjgWx+/G+VbNuI17pY=;
 b=I5FZ1OZx5GqoxadO70m5+qf+gWjf2dODvRJu9q4WZ9VmrymboxKwwG1TCJWT19MPG2v0O+A1iKvxgT0E9gx8LTtgSPsR6WU+qyMQn6oNLiErUpGi7a8thGYJJWJWZbv9+oaRQ+BCpd+davGfCZU/QMw5s4S5PtJuloCmBbthvBk=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEZPR03MB6515.apcprd03.prod.outlook.com (2603:1096:101:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:35:21 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:35:21 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, "linux-devicetree@vger.kernel.org"
	<linux-devicetree@vger.kernel.org>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Topic: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Thread-Index: AQHdBUBFkhMTBcaOR0CLIaZtsVPeSrZQgmIAgAe6r4A=
Date: Wed, 1 Jul 2026 06:35:20 +0000
Message-ID: <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
	 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
In-Reply-To: <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEZPR03MB6515:EE_
x-ms-office365-filtering-correlation-id: 0099da02-cac2-4d9d-e7d0-08ded73aec76
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|22082099003|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info: j0fhIJHzG0ef4nGrUJFRkQULH+sUnsqVbo/EnUtOBTWSkFUVU+hvNWwSNtbLOfBV8cx2lVOR3P7yDwZQtHJ3UP9rjcLoTHsNPczIt947NPrBsWRJ0yiG4aPu7ZIWgwyymo+eWdM0xtGi9l0V5q1d95JIYE2SWrjy/MiLwN6Gu9psxX3BtQrTuXwcejq2N9VAIjQwzkCrlzp8VXgKJtjNPjXsNekhekZDhKKbqGW9IjVSUVkcQSIaCqhKbK3+R5gkmWsq0kMLtskAWRvoQ1QyupxSS002l6Q/pCocf2iCWV/lb9te7hLSmTNJU/qgwFQcI/SG3dqj1gON95J196n9Yeo0GTfAfgQAfp2xHm3u19j5hgbQ6u7oT+/4/R463lJW86EXwADh43TwFk+7G4zQfa783J+RnjFbF65UFdX2reKICOCxvD1r/4B0FEAkmbzAms6YhP1el1fgf5LyLMAAiK/wHLckAqhUWLOj+Ldf07lZX0im1fsW4Fwe/sUtpsK8xn6UUSN08JLXaEf/9po2fqpJ5h/bzNE2NfTp/z0tdknTZIH8K27aZVk8UqKqmkpp2gAMXri+mv7Ef7pYZnh6cf/kMrmF3sW37XmHKKUrivETdG4vR6Nzv4DHe1rmPHLeAoK2znj5cC8PYQRYc8g90VoEyhG6BmRmH8e3npLNq+8EIImlyGc/idzktYsX1kVAXGkwPUrbZcly0cbf+9MezPy3KIgziW6b881u+RBQ3Ak=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjJ0aHZ1eFdGdXZMNnkrckkvcnpUbFZ0dzVjVWVmQmcycWxDSUhnSDVhaHRY?=
 =?utf-8?B?MmNKU1ZFVlNaRDFPM0Jmek1qV0kxNVdrK3NGcXpNRGdKTTVNSkI3SE5vK1Jn?=
 =?utf-8?B?cXpLVkk1RTB4enRJcDdpaGc5cUJWL0N2d3VVQjF0ckxybWZhSGVnSWJqVmxI?=
 =?utf-8?B?bG5zck04ODlDNSsxdXp0by9XQUZ1R1BEeEtHZjVPUWw1a05md093emJ2alEx?=
 =?utf-8?B?QnJFSU8rNjNDYlh5ZldGZzhiWnZYdkNiL1ZLaTZSS3dMblU5cVlSc2R4N0Q1?=
 =?utf-8?B?SVhRQlZkUWF5dzl1Y2Z2Ym9XY3lOOEw4aHdScm5RZ0orT2NqZ1B1YXl0SXVl?=
 =?utf-8?B?TFBaK1AyOTBVY1lXZWZjRTdrTkpKZGhrRGJVTmhlNVNEUHpuZldzOHZzSVBX?=
 =?utf-8?B?OWhVR09xenJvSjNrZlVkSUJqSXVTdGVmL1FIOGw2cXdtSmpyOTRVK21tVGhL?=
 =?utf-8?B?dU1ISk9qTE9sK29PQ1dZMDVVeDFtSFRrSEd6UUgxWUpYNHlHTW9qbk41UU1k?=
 =?utf-8?B?YlY5SVA3eS8ydnFTU3RJalh1cWdGYUtkUWtsM3l4RkFTUW1saWo3YW9oMnhR?=
 =?utf-8?B?aXZ4RGJXOW1JUWJzN2xDSXBBZUl6TkN4TEV2UzZXOEVlanJmZDE3NjkzZS9q?=
 =?utf-8?B?eVRsQ2U4N244bW5JNkxkdmhoQmxpdXZJUnFweXNUR2tEaHpyUU1HLzJ3enhx?=
 =?utf-8?B?YnVYNTQ5cENSQzRoWWJuZzVoVW8rN053ZDhJZHlobkh6Q1VKanZ6blhEOTFY?=
 =?utf-8?B?bm0wclhES3diNUdDTlE0M2RtL0VYK2ZSaGpZOENGMEM2ZGI3Y2FwLzNtN3Vy?=
 =?utf-8?B?L0tSeEJlVWhyOGY5NE1sR3g5YjNXd1J5SUtWYTlseDZJcmpWdldheiswZjNB?=
 =?utf-8?B?aUIvRmR3N0dOdkZXcXQ1QVYzbWpKU0JmV05kV2FLVngwZFFGb01Nc0t0YnRN?=
 =?utf-8?B?QnRKNHFDM2ZPdk1MWnZBcVQwNno2ZDF6WDlzREYvY2d4ZG5keTVlUCtOeFdr?=
 =?utf-8?B?T2pwcXpYbEE1U1ZoOSs5UlF0K1Rabm9LeW1nSGVjMWR0ekFrQldySVlBdjBk?=
 =?utf-8?B?bS9pT3M0UEhJaExOdVo3ZTRjOUtWQ2l6aCt2VmJVTDJxc0MzVC9jQnRabzJP?=
 =?utf-8?B?dVY4NXlJNVZsRkxtRHZYc0J6ZHZpM0JZQnFrN1dDa0tvQWRiQVY2ZkVDdE1L?=
 =?utf-8?B?dWNZUExqaWpYNlkwd1lMT2VkYTFpRUlZMEwyZGxaSGJBNHAyVXVJMjMvaE5Y?=
 =?utf-8?B?N0tySmlINUh6NVpzak5XVnRKQWlnNm05QVFHaVdQNEdmZ28wc2xyaURocjB6?=
 =?utf-8?B?ckVUQnFQZlBBblhzZDR3OUJYMmo4WDJVWDlTR2JIS1kzeldycm4wOFhxT0xs?=
 =?utf-8?B?SHpDaWZhOTh1azVTMmVmc1BGR2QyUEk5b0NQcWZOTll6QVdDZkR6anc4UGpG?=
 =?utf-8?B?Q3JYbURUcnpERElLdmQzK251bzBQUzVsNEpLbTR1TW1CZUhiT005RHlrb3Np?=
 =?utf-8?B?WnBVNXNrTDBLR2wvSFBESHVoZDJDYTV6aURFSkZWK1dnQ1NHZmNtaDk1dDVI?=
 =?utf-8?B?MnhGVFJUN1FEVGFwWDdaYm1SOXJIQzRabDVaYjZRc2FQellmSjEwVXdmaWY5?=
 =?utf-8?B?T3NLNms5c25MbTIxTWpEUWhwaGIzZ0dhclJhWGRSUC81eENHcmNCY1RoSXdX?=
 =?utf-8?B?d1pPaWViR0haeHRwbkVVRTVHcjQyc2FQanpMUE5aVUx2ZzZpdldmeVBqZ0dD?=
 =?utf-8?B?dDFZYmpjT2lhWlFpc0pjR2RURDdibEV0SVBzdFhFMjR3bzJQaVFVTzZEZWgx?=
 =?utf-8?B?eDhXSk1BejR4RWlZMjlDeFlMVVdzWHd3Sk44WG0yTThYUE93NGtZVFBieU1E?=
 =?utf-8?B?WWt5MkxKalo2dFJsZzVYckxBamE3RzJRRXBlSHBSRFFSTFFnVXFTK3VCRWtj?=
 =?utf-8?B?czJhakVPRUtFNDBTTGZXN0lnZ3VLbjdoVTE5bHRFNkYzUUtKdzJOZWNwWmdN?=
 =?utf-8?B?TVowNGhVTnJBWDZlQW8ydDNxREY5YU5JK2JQWEFsOEhZMTV4emhpVjVRSTZu?=
 =?utf-8?B?VytBTHpPVHdrSWVsaWpEU3dTbDYrZ09hVDJZVSs2WGFUcHhnSFlHS0JZaUhx?=
 =?utf-8?B?RUkzdHdiTVdUWDlrdmFzKzFKUDdreVhFWklCQnBxZ3d0TDdkS25uL0RJSHNv?=
 =?utf-8?B?RGx4N2NCUjk0dUxwb2hzWWVWYWZ4ZHdSd25qMmZoZmVTQWRvdEorYUgwcHhs?=
 =?utf-8?B?dEVQZG9WMGtncFE1RTZaVFlLc3NqOG9UTDRIM2RINTN1UmhoSXlTL0RRc3Q0?=
 =?utf-8?B?RDBhUUVjK3dSdXlyLzRzZU1LQTVIRGhvVWl1YUQrd1c2TDVXQ0RZVHdodmh5?=
 =?utf-8?Q?4JEksJAItqq3ywVg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <718C351732F2EF4BAFAEEB8F3A64D743@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jhj60M81Px1dGL7jBIRMSg4vqckx71PYk2nPGVbP/Mx9d05j8gQmhIb//oVW4JMjHrc1tjvDmvteRlF5Q5L35+Li41wlEx0M2Wkmda8Uiq/TTABYnUh7iVg7zTSZnPKtuSg3/5LUQBMV56V19CPVoq6ebBiNS60OYwO3BTwy9RkqS1H+jkxXpNBNaErBoQMOzINBIo1f2RGCnc962OQlEUhmYUFwHPZCqRFCG5c6xjuFmqAvUUi/+79+SzR/kBacSbZj4GB6FEnCU/9bid3HZ6sw4ABCX/6fbbATdVS1nbc0Vg78KjAjcZQHkLt5Sq4+8sbb+dG5+gn4nfa62aReUg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0099da02-cac2-4d9d-e7d0-08ded73aec76
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:35:20.7766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtsZG/vRZ8zeJR3VDqQA69mEcM7EhQBLPvfZUneLFXodtuJzaTE8mZYpHXSVJzpJeuhfBMr1oBiC5nYwSv/bcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6515
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_233533_576198_C788D4CA 
X-CRM114-Status: GOOD (  17.09  )
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

T24gRnJpLCAyMDI2LTA2LTI2IGF0IDEwOjMzICswMjAwLCBQaGlsaXBwIFphYmVsIHdyb3RlDQo+
IA0KPiBXaGVyZSBpcyB0aGUgYmluZGluZyBkb2MgZm9yIG1lZGlhdGVrLG10ODE4My11ZnMwY2Zn
X2FvPyBJcyB0aGlzDQo+IHNpbXBsZS1tZmQganVzdCB0byBsb2FkIHRoZSByZXNldCBkcml2ZXI/
DQo+IA0KDQpIaSBQaGlsaXBwLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcsIGFuZCBzb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHkuDQpZZXMsICJtZWRpYXRlayxtdDgxODMtdWZzMGNmZ19hbyIgc2hv
dWxkIGJlIHJlbW92ZWQuDQpJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoN
Cj4gPiArwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MTY4NDAwMDAgMHgxMDAwPjsNCj4gPiArwqDC
oMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gK8KgwqDCoMKgwqDCoMKgICNz
aXplLWNlbGxzID0gPDE+Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgdWZzMGNmZ2FvX3Jz
dDogcmVzZXQtY29udHJvbGxlciB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxzeXNjb24tcmVzZXQiOw0KPiANCj4gSXQgbG9va3MgdG8gbWUgbGlr
ZSB0aGlzIGlzIGp1c3QgdHdvIHJlZ2lzdGVycyBpbnNpZGUgdWZzMGNmZ19hbywgbm90DQo+IGEN
Cj4gc2VwYXJhdGUgZGV2aWNlLiBXaHkgZG9uJ3QgeW91IGp1c3QgYWRkICNyZXNldC1jZWxscyB0
byB0aGUgcGFyZW50DQo+IG5vZGU/DQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNy
ZXNldC1jZWxscyA9IDwxPjsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZWRpYXRlayxy
ZXNldC1iaXRzID0NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwweDQ4wqAg
M8KgIDB4NGPCoCAzwqAgMTAwPiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDwweDE0OCAwwqAgMHgxNGMgMMKgIDEwMD4sDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8MHgxNDggMcKgIDB4MTRjIDHCoCAxMDA+LA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPDB4MTQ4IDLCoCAweDE0YyAywqAgMD47DQo+ID4gK8KgwqDCoMKgwqDC
oMKgIH07DQo+IA0KPiBXaHkgaXMgdGhpcyBpbiBEVD8gVGhpcyBzaG91bGQgYmUgYSB0YWJsZSBp
biB0aGUgcmVzZXQgZHJpdmVyLg0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQoNClJlZ2FyZGlu
ZyB0aGUgY2hpbGQgbm9kZSBhbmQgcmVzZXQtYml0cyBpbiBEVCwNCldlIGNob3NlIHRoZSBjaGls
ZCBub2RlIGFwcHJvYWNoIHdpdGggJ21lZGlhdGVrLHJlc2V0LWJpdHMnIGRlZmluZWQgDQppbiBE
VCB0byBrZWVwIHRoZSByZXNldCBsaW5lIGRlc2NyaXB0aW9ucyBzZWxmLWNvbnRhaW5lZCBhbmQg
cmV1c2FibGUgDQphY3Jvc3MgZGlmZmVyZW50IFNvQyB2YXJpYW50cy4gTWVkaWFUZWsgaGFzIG1h
bnkgU29DcyAobXQ4MTgzLCBtdDY5ODUsIA0KbXQ2OTg5LCAuLi4pIHdoZXJlIHRoZSBzYW1lIFVG
UyBzdWJzeXN0ZW0gbWF5IGhhdmUgZGlmZmVyZW50IHJlZ2lzdGVyIA0Kb2Zmc2V0cyBmb3IgcmVz
ZXQgbGluZXMuIEJ5IGRlc2NyaWJpbmcgdGhlbSBpbiBEVCwgd2UgY2FuIHN1cHBvcnQgbmV3IA0K
U29DIHZhcmlhbnRzIGJ5IHVwZGF0aW5nIHRoZSBEVCBhbG9uZSwgd2l0aG91dCByZXF1aXJpbmcg
YSBuZXcgZHJpdmVyIA0KcGF0Y2ggZm9yIGV2ZXJ5IG5ldyBTb0MuDQoNClRoaXMgYXBwcm9hY2gg
aXMgYWxzbyBjb25zaXN0ZW50IHdpdGggdGhlIGV4aXN0aW5nICd0aSxzeXNjb24tcmVzZXQnIA0K
YmluZGluZywgd2hpY2ggdXNlcyBhIHNpbWlsYXIgcGVyLWVudHJ5IHRhYmxlIHByb3BlcnR5ICd0
aSxyZXNldC1iaXRzJyANCnRvIGRlc2NyaWJlIHJlc2V0IGxpbmVzIHdpdGhpbiBhIHN5c2NvbiBi
bG9jay4NCg0KVGhhbmtzDQpQZXRlcg0KDQo=

