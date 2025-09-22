Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D64DCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oTSZjST0q0gehpLVlMULfpc36iPsbIFsIHb8mOuzE0=; b=z12LdNIaHX6pB3wtTXdjVin0Bt
	A5eSRcnza764D2Ugbjw7K6McUYWlwPdmeavY/fVWv8ajLovKo45k//2ckGpoMK6ND0mHFH4IaygK4
	m3pk5paW84VXIJ7TbZHi4f0CnnD0JOhxW38r2/l1oxCFEPSIWuvJY8wy3PO7lIOIQQQqatqzRbMAN
	Jh5AmJp4cYBdyidOEiUtw8WO7wdcxxxsil2t0GhQ3CRLoxum8tosQyn3aw1fYsBM2t+zI6PasBhLv
	O0+cK3o8uKZAeflm0QX3/zEqulwfclQaLJQk9DH6P1nZ5aRkn+IGsZQeohqP/T3OhSnJIG1SXiLFW
	QXJUpCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0brI-00000009gdg-2yp4;
	Mon, 22 Sep 2025 08:25:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0brF-00000009gai-2obe
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 08:25:15 +0000
X-UUID: a508dc54978d11f0a52f393f94899d25-20250922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7oTSZjST0q0gehpLVlMULfpc36iPsbIFsIHb8mOuzE0=;
	b=ndP1Wr4SwHnlLYo0RMLgFRUzqUfFhMNblqQ6Ck3PYWBEPozxxQKkXPLuRNj3FJLQREiv+Bba0QrQxG/8NA3Fd4a7I0kj0LYeBhhR1r1nK28Wqq4+DQG88D/vNPe/HM+HW59n8xuYBfPBvuO0maRJX5KknoUrHrhCLAt4PcnOfwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:9504952b-a2e9-4fa3-912c-f5be11ce7075,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:08d4cf6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a508dc54978d11f0a52f393f94899d25-20250922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1938033361; Mon, 22 Sep 2025 01:25:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Sep 2025 16:25:02 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 22 Sep 2025 16:25:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkaEhtLz3JfExT2+/yFYrYudbYTMVZNEdjkIJZspdwK1KAvMGLW8WpS5dEzZt6R7myb8NTPxiaqgnAW7oPU/DcLgIzvtudhKx+R+YP1tRCK4Wda2SsVwP8eKP8EAHp0KcRMB87ks9BT/gkgmtwTyYriKpX/njyL7OTM2IdgBDTGP+tIGbD+mBb0lvn9AA5M8QPPMlwb1ITJEo9kfLLsxh0/GusVZBUtv/cpau0Xs4Zi6pGX2xlaFB7nuWktHM0oMlE+j41yLsrf982MThhUyBmH6R5QfLWx8OMXhzoMekGHh+ebG8gJqL3FHjIUu6tO68bKMzvYqVcmBaG3e3bSnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oTSZjST0q0gehpLVlMULfpc36iPsbIFsIHb8mOuzE0=;
 b=PWppaiSSW7Tr1i5Hj0YmnmZfWRmb/ig397xbZr5Qj5tHPAp8QwkLkKqiQ1Ltk+adz1cD2pLcLYD4bUVaVXAhNa00jDwnvaPMxxe2hqht3PnkXG5JoY2lbAploBe81SvDN452BCE0bjH7/Y5PFlRnFDxwXF55sf5ncnJc2I4a+/poHuKpnkDa9v+oPeKqYBENZzgU+79yl6Jh66+9ioGBpyGXBSuD8SLyj1g8Y0nn4t/onofIaW3HvfVKJr4QrQziZLnZ/YA3YiO2VCbnt+0KmNSLvKzsVXFUTv3W5DVH9D/LTI3Ia4FQf+0ymwBe/+snwhWFgBACF4QBlYfCQEEP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oTSZjST0q0gehpLVlMULfpc36iPsbIFsIHb8mOuzE0=;
 b=W8uv516N2VFe1eyKXyEpHw8x5Qd6HF+BNTxhMm9yuKANN6qyB+0C9tWblYk7uEYJACP0wbV5cZMpeGp4F2wBCjbAR6sPXupOihlodt9dVdqWEwW6aatQjxWgmYQBYh7RJpE2mV8gc1PsI+Z21g2adTByw4hmp6REVy57xR5r7vE=
Received: from KL1PR03MB6170.apcprd03.prod.outlook.com (2603:1096:820:91::12)
 by TYSPR03MB7979.apcprd03.prod.outlook.com (2603:1096:400:477::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:24:58 +0000
Received: from KL1PR03MB6170.apcprd03.prod.outlook.com
 ([fe80::7b0c:45ca:7525:93bf]) by KL1PR03MB6170.apcprd03.prod.outlook.com
 ([fe80::7b0c:45ca:7525:93bf%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 08:24:58 +0000
From: =?utf-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"sam@gentoo.org" <sam@gentoo.org>,
	=?utf-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
CC: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
Thread-Topic: Regression in linux-firmware-20250917 for mt7921e driver
Thread-Index: AQHcKyLcjPQJGij6EUOIlPHmgT+8QrSe3nsA
Date: Mon, 22 Sep 2025 08:24:58 +0000
Message-ID: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
In-Reply-To: <87a52n1xvv.fsf@gentoo.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6170:EE_|TYSPR03MB7979:EE_
x-ms-office365-filtering-correlation-id: 7388535a-760b-4757-9e02-08ddf9b184a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dlh4cWRoNlNxaHNyZlV3Y3JoUDZONDBRVkJCWUoxcGVFbUZKRGNncDQ4a2ht?=
 =?utf-8?B?MXZUMGZPWUhhQkpqT3I3ZkJTdHZqVzJPOFB1QUR5V3paaFBPS2tGRFk0Ylpm?=
 =?utf-8?B?Rngzc1ZlR0k0U21BT1BRMjUySEVnOUJ3VTZjWDZpdm5yazFkK2JLc0JyM3ZK?=
 =?utf-8?B?RytDNURoWWJzUWZFYks1T1N5a0hMQkhEUkExem4yMHRuN2drT2c4SkkrK1dF?=
 =?utf-8?B?RjJwd0IzT1g1V0J2NlliZDRmWnBjbEhFUGd0U3JZTXdJMjhtSkJIdTY0ZGJY?=
 =?utf-8?B?UGF4NkRtbE1GSjBmM0h6SXNnNEdWeGVjckJXWXl5VFZ5ZkFCNHBERjcrYkVW?=
 =?utf-8?B?WUVDem9lWjFhb3JYNW54eTUwQ2VEMG1XQXNDL1JRcFJyTVRVMWJDVENjaTYr?=
 =?utf-8?B?Q1grR1dwSFRTczZRL3k5VysvdER2RHZVQmtueTB1NEtJT2tnYVZ2M1ZUWXFt?=
 =?utf-8?B?UVN6REhQNzUxaGxKVUpOY0t4NXc3NHoyS0xaakRGQmpNcnVoZlRMQUtzSnFz?=
 =?utf-8?B?K1diNW1ZajVkbGVaK1hNdFI5Q3hwVlhlTkxWem5rOWM0enY3NEtEbTlSY2p4?=
 =?utf-8?B?dEcvbzJnWFFyeWFqK3JZZk82WVlsM2QrZHoyeE1zM3pGVFI0ekNuY050ekhu?=
 =?utf-8?B?dHBPZDRCQzE5VjhENkI2c2VJVGdpdXNBdUkwZE12RHNPMC9vQWU2RytrcjN4?=
 =?utf-8?B?S014YXUrMitmbmdMMlBtREpJVzNIOVRQak9SZW9aYjQraHVCcW5BUk15WVFx?=
 =?utf-8?B?Q2YrQTgwcmg1T200NU1ueHBOWHNGcEIwVEFveDNPby9iN3Ruc09hbFBxc3Rk?=
 =?utf-8?B?M3VHcFR4aUVEWTJwbDh3Mmd5eVRvdmxqMnZicmY5TTV6ei91Y1VaaWF4WEl2?=
 =?utf-8?B?RktRTEthK2ZEN01TMGtzTy8wVk4yVWJlNHN3UXd3VkJQNFZrNDllQWNnWDEz?=
 =?utf-8?B?ZVVQTzEyQUh3Z24wTWJFQmJCVS9JVE1WQ1VXUXV3WHV4cTFWK0hMcnZwNmNH?=
 =?utf-8?B?amhXeVo5Z21WS3F5bkpnNWEwQWNmS1E1L0p4b25rYTVtUmJtM01LOFpENmYw?=
 =?utf-8?B?YmlWUkxJVUhFdFNSNUJ6OGlvTlhEZkVGWndyTU1VQWMzVlBqaGVhL3NHOTZj?=
 =?utf-8?B?dTM3b29ZT3dDa0xOci9rZk9zVnpRNVRaRkppV3ZJZDF6aHl1ek53MmFWQk9j?=
 =?utf-8?B?Q2pJQ0pUMGV2VFNCbmFuQzRKekJQMHJpcFhacTRvUlU4WVdPMnZHWWwxV0o4?=
 =?utf-8?B?eHkzWExwZm94Q0pqNXlENUJNdTk0ZjlEZUkzcjZ2WFpkQnBvZlZ6a1lvOFNV?=
 =?utf-8?B?djFBU2ExRDJPc2psclBGRi9CdzJZUmFybTdydUFlQkdaMkdBTFdrUXpkcW1q?=
 =?utf-8?B?Y3JoYlN4WWE5MVh3SlVWQS9GMFhJc0JmWmEwU2ZrODVlaWxTbzBrK3RFVUNP?=
 =?utf-8?B?Tkxzczc0bjBLSzVzYXVDMlNWMU4zMm84NHpkcElzdG1FczBzUUN2WnBwS1J0?=
 =?utf-8?B?cHVDbHZQK2pYd2k2bVlqbVA1SUoxZ2pqbHZCRE5JM3BXbDVMT2FNaGVrK2tm?=
 =?utf-8?B?UUQ2RllqaW9JMVRmWUFrRXUrbEtHbTFiTzFFWWtJd3p1UjNyaWxwTTA1RllI?=
 =?utf-8?B?a005VS90Z0plTVRybnFsVE95TUVUOXQ3MFpJb0RxamhuNXhIRlhaZ2lCNjR2?=
 =?utf-8?B?U3hTS1hoUVNnWFIzUHlPR29uVjRhK1NkWVVGYXQ2VnlNdC9ob2M0Ni9pa3pT?=
 =?utf-8?B?dDA3NjBNL1F5akg1UlJaRmRBdUNsY2Vlbzlmc1hJNTNqNU1vV0lRcWR2bnlE?=
 =?utf-8?B?b2NWZFBrUmF3Z0pGZnMwNjBYbXJ0SlBqdkxIL1M5V2I5WlVaenVjSEVVaHB0?=
 =?utf-8?B?WnlPQnNmeVRiRlJzWGFHMVJDYS91SlpyYWRvWU9XT1kwUTZka2dmcUQvN1hm?=
 =?utf-8?Q?VRhzSO6TyBk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6170.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG5UeFE1OFpCelVlR1BYV05aVXIzeDhJNko0YWtQdk0rWXJxL2dnYjBpR01Y?=
 =?utf-8?B?ckhUWTFxZ3VyY1Jtd3BCblE5V0tmbzhEUk55TzN3azRLdlNkbFYrMUsyQnZw?=
 =?utf-8?B?b2gzVzgwT3Q1Z1pudWhrZVNHTmFUVi85NlVwd1RsTHZzNTRUY0lXalpNSjdD?=
 =?utf-8?B?Y0QzRFp3NkJzME5Jd0VaOE1ockg5SXg2OVV6QXU5RHNJdVFMdWl5WTAzSHd5?=
 =?utf-8?B?ZHRIUnZHVnhmZlh6MkJVTmlIMmhvQkhPS3l6ZlBJRk1iV2hSb2pvcHpNeDNa?=
 =?utf-8?B?UnI5VnBuSittQlhEd0RFN1RCSHRzSER5UzA0SVU4ZFpUdlhqY3FET1AvTGxw?=
 =?utf-8?B?M2FVakoyOUtDdmRzajhSU0lVdWcvcWJXUFoxdjRkNEtnZU8zMzdzTU14aXBS?=
 =?utf-8?B?S3FFMVRkSlJQdmZJQWtJelA2c3kvU1I1SUtEelNvQWtqeThLYmdWRGtLeVZM?=
 =?utf-8?B?TVhrQUpqRlJjWmY4L3JBVDBydEM2VFBzTm56TjlrUUhQRWdOaUQ4amdBV1oy?=
 =?utf-8?B?UWFmdWFrRVZvSC8xTG9NM0UrTnFLYVJlTDNKdXhsR0hrRUZaZjV2SXNwaTB5?=
 =?utf-8?B?bXFEMW1YeU1GSC9WSnRHVENuM3FQVkVZSStDcnkwUnA4RnpoM3lxUng2ZVZr?=
 =?utf-8?B?MnI2SnIzWkl2cVZybis2ZFY2SmJEZUNZVHhVK0hyUnhKcWh6VjRCVTc0cURC?=
 =?utf-8?B?Q0dSNlBTcnk3aTJYYlRYYXRSMkdBMG56WndUZ3VhcVg4RSsyam1VVmIrLzdF?=
 =?utf-8?B?VlBGRHkvUTJLQWIwL2RlWm1ZSTVqaWQrWWpBRXBtU3B2WEFmb1RBNnRFS3JQ?=
 =?utf-8?B?MjNDZW13SFAyYm85SXhCcDZDRGk4L01nYTJmK3I4MGtUNnplcys4RE1vb2VT?=
 =?utf-8?B?YUNGRzhlaEpMMm04N1E4ZlM5ZStKbXNsMFlZWVI2Q2wvOTVDU0QrMnRDbUoz?=
 =?utf-8?B?d1lweExLcGx5Rk5CNDNQdjU3UEhmRGtWb0RTUzNubGp5N1NjK21lOHBHcXRr?=
 =?utf-8?B?K1NLTFIzK1JRckp4Q1ljaUhZUmxBVXVnRUhMNktKQkR3eDZZS3RaQ21XQ1VX?=
 =?utf-8?B?MHZ0ODB6aXAxNzgyNlQrbXRwVDU0YzJ4ejdlNmdvbzFXU0pQM2l0K3dyOGlK?=
 =?utf-8?B?NVJOVjR3cnNZWC9OV3hVV0hlQzNEeGVDODE5M0tNdE1vZm15S3plTlh3N054?=
 =?utf-8?B?WnRzNjdZK0hUYmpNZjVuZE1QZnJBczk4ZFhmMTE5ZkZ5WnIzVFdsODRUcjd6?=
 =?utf-8?B?dTF5Q3EzY3FTRFpUYS92cVlJVXBtREJMZzh4V0JKK3c3Z3o5U0FhcEVOZzQ5?=
 =?utf-8?B?T3BHaHNXN0k0dm1VSUIwQlBNTDJFVG9ySjlhdVRzVTJrcDBCcWt6dkZ5Ymlr?=
 =?utf-8?B?bk1qWjd4bTlhZ3l6UVNGMkduQzZ4SVpTVXMwck10cHg3M3RxaGpocThXY0tL?=
 =?utf-8?B?MzQ5R1NLUjlGV3BNaVZOa2RSUElOVW0rQVhPTVVHUWV0VFRnOUplVzlibWNF?=
 =?utf-8?B?R0hXdVNVc2xEQktmZy8wSnUxQStMWnpnWVFBK01aR052OGRPMkhLR0hxRWxy?=
 =?utf-8?B?dGs3SWVHNGYvNkFoLzVWeFNoOUJ2MmFTQWljQUJSRkMyMVFlbTA5VVhoUTZM?=
 =?utf-8?B?a1lzY2ZjazhIRXZvQWhWdE1jWUFJTDNCbnMxWkpndUdXMEN6T3psVThpV2Rm?=
 =?utf-8?B?R080V21OTnpWODQ4c0o0SGJkLzRzYyt6d3BhM0ZaRlNQcGorRXZqVk9SSmZo?=
 =?utf-8?B?SmluMjNlV25uZm95TEdYMnI0YWYwclUzclFZZXpPdkVzSjNxSUtSczVlU1Vv?=
 =?utf-8?B?WjFadktaZHE5V0xnb2IzOVBuZndIaE5tb1RSRlhDSTBpMnMxeThwcHpkRzlS?=
 =?utf-8?B?YW9ldXZZQ3ViYUg3Q2t4QWw1Y25IT2tIVmxYM2tnL3AvU2luUG1tVnhUZkds?=
 =?utf-8?B?cnVuTk5sUjNiOUYvUDMrRUpUaThNbVQydlE4a3UwTlpHTlRNSVhDVGM4NWJh?=
 =?utf-8?B?Y3dCRTdNMm93Z3BjM0NkMUZNbFdLTS9OSFFhaVpRZVl6bmg2dFZISXVnNHBm?=
 =?utf-8?B?SVdocS9WRkZCOHFDN0Z2dW1tWkNoV2ZvaW01WEs1SjNOaW5ibmcwdWcwcmhD?=
 =?utf-8?B?RU9MY1pBTXh3WkZQMTRydWRoYmZNYklTK1A5NUV5NDRVK3FzenVCa0pJYzNL?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14D1527F9B5E254DBEDA391DB9C4FCA5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6170.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7388535a-760b-4757-9e02-08ddf9b184a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 08:24:58.5897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUGo2YXFy3NX79H44/py3RTa1f89+JAVzOzr4UHobbx61fe+YSUH2y+Abxn3FNxoTBcXg3hv9LJIs/cioJKG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012513_737173_1E377C0F 
X-CRM114-Status: GOOD (  17.80  )
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

SGkgU2FtLA0KDQpXb3VsZCB5b3UgcGxlYXNlIHRyeSAiaW5zbW9kIG10NzkyMV9jb21tb24gZGlz
YWJsZV9jbGM9MSIgDQp0byBoZWxwIHVzIGNsYXJpZnlpbmcgdGhpcyBpc3N1ZSA/DQoNCg0KT24g
U3VuLCAyMDI1LTA5LTIxIGF0IDE5OjA4ICswMTAwLCBTYW0gSmFtZXMgd3JvdGU6DQo+IA0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IFNhbSBKYW1lcyA8c2FtQGdlbnRvby5vcmc+IHdyaXRlczoNCj4gDQo+ID4g
SGksDQo+ID4gDQo+ID4gSSdtIGZvcndhcmRpbmcgYSBkb3duc3RyZWFtIHJlcG9ydCBpbiBHZW50
b28gZnJvbQ0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2J1Z3MuZ2Vu
dG9vLm9yZy85NjMxMDZfXzshIUNUUk5LQTl3TWcwQVJidyFoaHlQTjhLUlZSRU9VWmFUbndEVXI2
TFJ4ZGVZdHA0R25mNFhqd1U3aU1Xa1RhNjhrREpocW43OUh3Yzd3Vkx2ZXVzWlg1NWppTVNnU3ck
DQo+ID4gwqAgd2hpY2ggYWxzbyBjYW1lIHVwIGluIEFyY2ggYXQNCj4gPiBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRsYWIuYXJjaGxpbnV4Lm9yZy9hcmNobGludXgvcGFj
a2FnaW5nL3BhY2thZ2VzL2xpbnV4LWZpcm13YXJlLy0vaXNzdWVzLzI5X187ISFDVFJOS0E5d01n
MEFSYnchaGh5UE44S1JWUkVPVVphVG53RFVyNkxSeGRlWXRwNEduZjRYandVN2lNV2tUYTY4a0RK
aHFuNzlId2M3d1ZMdmV1c1pYNTVrQ0NSalh3JA0KPiA+IGFuZCBvbiB0aGUgbGludXgtZmlybXdh
cmUgZ2l0bGFiIGF0DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0
bGFiLmNvbS9rZXJuZWwtZmlybXdhcmUvbGludXgtZmlybXdhcmUvLS9tZXJnZV9yZXF1ZXN0cy82
ODRfXzshIUNUUk5LQTl3TWcwQVJidyFoaHlQTjhLUlZSRU9VWmFUbndEVXI2TFJ4ZGVZdHA0R25m
NFhqd1U3aU1Xa1RhNjhrREpocW43OUh3Yzd3Vkx2ZXVzWlg1NzcwWmR2WGckDQo+ID4gwqAuDQo+
ID4gDQo+ID4gVGhlIHVzZXIgZGVzY3JpYmVzIGl0IG9uIHRoZSBBcmNoIGJ1ZyBhczoNCj4gPiAi
IiINCj4gPiBjb3JlL2xpbnV4LWZpcm13YXJlLW1lZGlhdGVrQDIwMjUwOTE3LTEgY2F1c2VzIG5l
dHdvcmsgdG8gZmFpbA0KPiA+IHN0YXJ0dXANCj4gPiBhbmQgZHJhbWF0aWNhbGx5IHNsb3dzIGRv
d24gYmFzaWNhbGx5IGV2ZXJ5IG9wZXJhdGlvbiBpbiB0aGUNCj4gPiBrZXJuZWwuDQo+ID4gDQo+
ID4gc3ltcHRvbXMgYXJlIGEgcGVnZ2VkIGt3b3JrZXIgdGhyZWFkIGF0IDEwMCUgY3B1IHV0aWws
IHNodXRkb3duDQo+ID4gYmVpbmcNCj4gPiBwcmV2ZW50ZWQsIGV4dHJlbWVseSBzbG93IGNvbW1h
bmRzIGxpa2Ugc3VkbywgZmlsZXN5c3RlbSBhY2Nlc3MuIEkNCj4gPiBzdXNwZWN0IGEgaW50ZXJy
dXB0IHN0b3JtIG9mIHNvbWUgc29ydC4NCj4gPiAiIiINCj4gPiANCj4gPiBBbmQgYW5vdGhlciBt
ZW50aW9ucyB0aGF0IHJlbW92aW5nIHRoZSBtb2R1bGUgdy8gbW9kcHJvYmUgLXINCj4gPiBtdDc5
MjFlIGhhbmdzLg0KPiANCj4gSXQgdHVybnMgb3V0IHRoYXQgSSBteXNlbGYgZG8gaGF2ZSBzdWNo
IGEgbWFjaGluZSwgYW5kIGhlcmUncyB0aGUNCj4gc3BsYXQNCj4gSSBnb3QgaW4gZG1lc2c6DQo+
IA0KPiBbwqDCoCAyOS42NDczNDVdIG10NzkyMWUgMDAwMDowNDowMC4wOiBNZXNzYWdlIDAwMDQw
MDVjIChzZXEgMTIpDQo+IHRpbWVvdXQNCj4gW8KgwqAgMjkuNjQ4MDI5XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gW8KgwqAgMjkuNjQ4MDMzXSBXQVJOSU5HOiBDUFU6
IDggUElEOiAxNDkgYXQgZHJpdmVycy9pb21tdS9kbWEtDQo+IGlvbW11LmM6ODIzIF9faW9tbXVf
ZG1hX3VubWFwKzB4MTNlLzB4MTUwDQo+IFvCoMKgIDI5LjY0ODA0Nl0gTW9kdWxlcyBsaW5rZWQg
aW46IHJmY29tbSBzbmRfc2VxX2R1bW15IHNuZF9ocnRpbWVyDQo+IHNuZF9zZXEgc25kX3NlcV9k
ZXZpY2UgZGVzM19lZGVfeDg2XzY0IGRlc19nZW5lcmljIGxpYmRlcyBtZDQNCj4gbmZ0X2ZpYl9p
bmV0IG5mdF9maWJfaXB2NCBuZnRfZmliX2lwdjYgbmZ0X2ZpYiBuZnRfcmVqZWN0X2luZXQNCj4g
bmZfcmVqZWN0X2lwdjQgbmZfcmVqZWN0X2lwdjYgbmZ0X3JlamVjdCBuZnRfY3QgbmZ0X2NoYWlu
X25hdA0KPiBlYnRhYmxlX25hdCBlYnRhYmxlX2Jyb3V0ZSBpcDZ0YWJsZV9uYXQgaXA2dGFibGVf
bWFuZ2xlIGlwNnRhYmxlX3Jhdw0KPiBpcDZ0YWJsZV9zZWN1cml0eSBpcHRhYmxlX25hdCBuZl9u
YXQgbmZfY29ubnRyYWNrIG5mX2RlZnJhZ19pcHY2DQo+IG5mX2RlZnJhZ19pcHY0IGlwdGFibGVf
bWFuZ2xlIGlwdGFibGVfcmF3IGlwdGFibGVfc2VjdXJpdHkgbmZfdGFibGVzDQo+IGVidGFibGVf
ZmlsdGVyIGVidGFibGVzIGlwNnRhYmxlX2ZpbHRlciBpcDZfdGFibGVzIGlwdGFibGVfZmlsdGVy
DQo+IGlwX3RhYmxlcyBibmVwIGN1c2UgdXZjdmlkZW8gdXZjIHZpZGVvYnVmMl92bWFsbG9jIHZp
ZGVvYnVmMl9tZW1vcHMNCj4gdmlkZW9idWYyX3Y0bDIgYnR1c2IgdmlkZW9idWYyX2NvbW1vbiBi
dHJ0bCBidGludGVsIHZpZGVvZGV2IGJ0YmNtDQo+IGJ0bXRrIGJsdWV0b290aCBtYyBhbWRncHUg
YW1kX2F0bCBpbnRlbF9yYXBsX21zciBpbnRlbF9yYXBsX2NvbW1vbg0KPiBzbmRfc29jX2RtaWMg
c25kX3NvY19wc19tYWNoIHNuZF9wc19wZG1fZG1hIHNuZF9zb2ZfYW1kX2FjcDcwDQo+IHNuZF9z
b2ZfYW1kX2FjcDYzIHNuZF9zb2ZfYW1kX3ZhbmdvZ2ggc25kX3NvZl9hbWRfcmVtYnJhbmR0DQo+
IHNuZF9zb2ZfYW1kX3Jlbm9pciBzbmRfc29mX2FtZF9hY3Agc25kX3NvZl9wY2kgc25kX3NvZl94
dGVuc2FfZHNwDQo+IHNuZF9zb2Ygc25kX3NvZl91dGlscyBlZGFjX21jZV9hbWQgc25kX3BjaV9w
cyBzbmRfc29jX2FjcGlfYW1kX21hdGNoDQo+IHZmYXQgc25kX2FtZF9zZHdfYWNwaSBzb3VuZHdp
cmVfYW1kIGZhdA0KPiBbwqDCoCAyOS42NDgyMDVdwqAgc291bmR3aXJlX2dlbmVyaWNfYWxsb2Nh
dGlvbiBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsNCj4gbXQ3OTIxZSBrdm1fYW1kIHNvdW5kd2lyZV9i
dXMgbXQ3OTIxX2NvbW1vbiBzbmRfaGRhX2NvZGVjX2dlbmVyaWMNCj4gc25kX2N0bF9sZWQgc25k
X3NvY19zZGNhIHNuZF9oZGFfc2NvZGVjX2NvbXBvbmVudCBtdDc5MnhfbGliDQo+IHNuZF9oZGFf
Y29kZWNfaGRtaSBzbmRfaGRhX3Njb2RlY19jczM1bDQxX3NwaSBrdm0gbXQ3Nl9jb25uYWNfbGli
DQo+IHJlZ21hcF9zcGkgc25kX3NvY19jb3JlIGFtZHhjcCBkcm1fcGFuZWxfYmFja2xpZ2h0X3F1
aXJrcyBtdDc2DQo+IGRybV90dG1faGVscGVyIHNuZF9oZGFfaW50ZWwgdHRtIHNuZF9pbnRlbF9k
c3BjZmcgc25kX2NvbXByZXNzDQo+IGFjOTdfYnVzIGkyY19hbGdvX2JpdCBzbmRfcGNtX2RtYWVu
Z2luZSBpcnFieXBhc3Mgc25kX2ludGVsX3Nkd19hY3BpDQo+IHNuZF9ycGxfcGNpX2FjcDZ4IHNw
ZDUxMTggbWFjODAyMTEgZHJtX3N1YmFsbG9jX2hlbHBlciBzbmRfaGRhX2NvZGVjDQo+IHNuZF9h
Y3BfcGNpIHNuZF9oZGFfc2NvZGVjX2NzMzVsNDFfaTJjIHJhcGwgc25kX2FtZF9hY3BpX21hY2gN
Cj4gc25kX2FjcF9sZWdhY3lfY29tbW9uIGxpYmFyYzQgZHJtX2NsaWVudF9saWIgc25kX2hkYV9z
Y29kZWNfY3MzNWw0MQ0KPiBzbmRfaGRhX2NvcmUgZHJtX2V4ZWMgc25kX3NvY19jc19hbXBfbGli
IGFtZHhkbmEgZHJtX2J1ZGR5DQo+IHNuZF9wY2lfYWNwNnggc25kX3NvY19jczM1bDQxX2xpYiB0
aGlua3BhZF9hY3BpIHRoaW5rX2xtaQ0KPiBzbmRfcGNpX2FjcDV4IGRybV9kaXNwbGF5X2hlbHBl
ciBzbmRfaHdkZXAgY3NfZHNwIGdwdV9zY2hlZCBjZmc4MDIxMQ0KPiBwY3Nwa3Igc25kX3BjbSBj
ZWMgZHJtX3NobWVtX2hlbHBlciBzcGFyc2Vfa2V5bWFwIHNuZF90aW1lcg0KPiBzbmRfcm5fcGNp
X2FjcDN4IHBsYXRmb3JtX3Byb2ZpbGUgc25kX2FjcF9jb25maWcgc25kIHNuZF9zb2NfYWNwaQ0K
PiByZmtpbGwgZHJtX2ttc19oZWxwZXIgaTJjX3BpaXg0IGFtZF9wbWMgc291bmRjb3JlDQo+IFvC
oMKgIDI5LjY0ODM0MV3CoCBzZXJpYWxfbXVsdGlfaW5zdGFudGlhdGUgZmlybXdhcmVfYXR0cmli
dXRlc19jbGFzcw0KPiBzbmRfcGNpX2FjcDN4IGsxMHRlbXAgaTJjX3NtYnVzIGpveWRldiB3bWlf
Ym1vZiBmdXNlIGxvb3AgbmZuZXRsaW5rDQo+IHpzdGQgenJhbSBsejRoY19jb21wcmVzcyBsejRf
Y29tcHJlc3MgZG1fY3J5cHQgdHlwZWNfZGlzcGxheXBvcnQNCj4gdWNzaV9hY3BpIHR5cGVjX3Vj
c2kgdHlwZWMgbnZtZSBydHN4X3BjaV9zZG1tYyBudm1lX2NvcmUNCj4gcG9seXZhbF9jbG11bG5p
IG1tY19jb3JlIGdoYXNoX2NsbXVsbmlfaW50ZWwgdmlkZW8gc2hhNTEyX3Nzc2UzDQo+IG52bWVf
a2V5cmluZyB3YWNvbSBoaWRfbXVsdGl0b3VjaCB0aHVuZGVyYm9sdCBzaGExX3Nzc2UzIHJ0c3hf
cGNpDQo+IG52bWVfYXV0aCBzcDUxMDBfdGNvIHdtaSBpMmNfaGlkX2FjcGkgaTJjX2hpZCBzZXJp
b19yYXcNCj4gcGtjczhfa2V5X3BhcnNlcg0KPiBbwqDCoCAyOS42NDg0MTVdIENQVTogOCBVSUQ6
IDAgUElEOiAxNDkgQ29tbToga3dvcmtlci84OjEgTm90IHRhaW50ZWQNCj4gNi4xNi43LWdlbnRv
by1kaXN0ICMxIFBSRUVNUFQobGF6eSkNCj4gW8KgwqAgMjkuNjQ4NDIxXSBIYXJkd2FyZSBuYW1l
OiBMRU5PVk8gMjFKWENUTzFXVy8yMUpYQ1RPMVdXLCBCSU9TDQo+IE40MUVUNThXICgxLjM1ICkg
MDMvMTkvMjAyNQ0KPiBbwqDCoCAyOS42NDg0MjZdIFdvcmtxdWV1ZTogZXZlbnRzIG10NzkyMV9t
YWNfaW5pdCBbbXQ3OTIxX2NvbW1vbl0NCj4gW8KgwqAgMjkuNjQ4NDM5XSBSSVA6IDAwMTA6X19p
b21tdV9kbWFfdW5tYXArMHgxM2UvMHgxNTANCj4gW8KgwqAgMjkuNjQ4NDQ2XSBDb2RlOiAwMCAw
MCAwMCAwMCA0OCBjNyA0NCAyNCAxMCAwMCAwMCAwMCAwMCA0OCBjNyA0NA0KPiAyNCAyOCAwMCAw
MCAwMCAwMCA0OCBjNyAwNCAyNCBmZiBmZiBmZiBmZiA0YyA4OSA3NCAyNCAxOCA0YyA4OSA3NCAy
NA0KPiAyMCBlYiA4NyA8MGY+IDBiIGU5IDc5IGZmIGZmIGZmIGU4IGE2IDlkIDVlIDAwIDY2IDBm
IDFmIDQ0IDAwIDAwIDkwDQo+IDkwIDkwIDkwDQo+IFvCoMKgIDI5LjY0ODQ1MF0gUlNQOiAwMDE4
OmZmZmZjYmM4NDA5MWZjOTggRUZMQUdTOiAwMDAxMDIwNg0KPiBbwqDCoCAyOS42NDg0NTVdIFJB
WDogMDAwMDAwMDAwMDAwODAwMCBSQlg6IDAwMDAwMDAwZmZhMDAwMDAgUkNYOg0KPiBmZmZmZmZm
ZmZmZmZmZmZmDQo+IFvCoMKgIDI5LjY0ODQ1OV0gUkRYOiAwMDAwMDAwMGZmYTA3ZmZmIFJTSTog
MDAwMDAwMDAwMDAwODAwMCBSREk6DQo+IGZmZmY4OTQwZGE0N2IwNDANCj4gW8KgwqAgMjkuNjQ4
NDYyXSBSQlA6IDAwMDAwMDAwMDAwMDMwMDAgUjA4OiBmZmZmZmZmZmZmZmZmZmY4IFIwOToNCj4g
MDAwMDAwMDAwMDAwMjAwMA0KPiBbwqDCoCAyOS42NDg0NjVdIFIxMDogMDAwMDAwMDAwMDA0MDAw
MCBSMTE6IDIwNjUzMTMyMzkzNzc0NmQgUjEyOg0KPiBmZmZmODk0MDgyOTc2ODEwDQo+IFvCoMKg
IDI5LjY0ODQ2N10gUjEzOiBmZmZmY2JjODQwOTFmYzk4IFIxNDogZmZmZmNiYzg0MDkxZmNiMCBS
MTU6DQo+IDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgwqAgMjkuNjQ4NDcxXSBGUzrCoCAwMDAwMDAw
MDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4OTRmZjU4YTQwMDAoMDAwMCkNCj4ga25sR1M6MDAwMDAw
MDAwMDAwMDAwMA0KPiBbwqDCoCAyOS42NDg0NzRdIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IFvCoMKgIDI5LjY0ODQ3OF0gQ1IyOiAwMDAwN2Zi
Y2M0MGU0MDEwIENSMzogMDAwMDAwMGUzMjAyYzAwMCBDUjQ6DQo+IDAwMDAwMDAwMDBmNTBlZjAN
Cj4gW8KgwqAgMjkuNjQ4NDgxXSBQS1JVOiA1NTU1NTU1NA0KPiBbwqDCoCAyOS42NDg0ODRdIENh
bGwgVHJhY2U6DQo+IFvCoMKgIDI5LjY0ODQ5MF3CoCA8VEFTSz4NCj4gW8KgwqAgMjkuNjQ4NTAw
XcKgIGlvbW11X2RtYV91bm1hcF9wYWdlKzB4NDgvMHg5MA0KPiBbwqDCoCAyOS42NDg1MDldwqAg
ZG1hX3VubWFwX3BhZ2VfYXR0cnMrMHgyM2IvMHgyNjANCj4gW8KgwqAgMjkuNjQ4NTE4XcKgIG10
NzZfZG1hX3F1ZXVlX3Jlc2V0KzB4MzA0LzB4NGUwIFttdDc2XQ0KPiBbwqDCoCAyOS42NDg1MzNd
wqAgPyBtdDc2X2RtYV9xdWV1ZV9yZXNldCsweDFhMC8weDRlMCBbbXQ3Nl0NCj4gW8KgwqAgMjku
NjQ4NTQxXcKgIG10NzkyeF93cGRtYV9yZXNldCsweDg1LzB4MmQwIFttdDc5MnhfbGliXQ0KPiBb
wqDCoCAyOS42NDg1NTFdwqAgbXQ3OTIxX21hY19pbml0KzB4MjQ4LzB4NDAwIFttdDc5MjFfY29t
bW9uXQ0KPiBbwqDCoCAyOS42NDg1NThdwqAgcHJvY2Vzc19vbmVfd29yaysweDE4YS8weDM0MA0K
PiBbwqDCoCAyOS42NDg1NjZdwqAgd29ya2VyX3RocmVhZCsweDI1Ni8weDNhMA0KPiBbwqDCoCAy
OS42NDg1NzFdwqAgPyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0KPiBbwqDCoCAyOS42
NDg1NzZdwqAga3RocmVhZCsweGY5LzB4MjQwDQo+IFvCoMKgIDI5LjY0ODU4Ml3CoCA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQo+IFvCoMKgIDI5LjY0ODU4N13CoCA/IF9fcGZ4X2t0aHJlYWQr
MHgxMC8weDEwDQo+IFvCoMKgIDI5LjY0ODU5Ml3CoCByZXRfZnJvbV9mb3JrKzB4ZjIvMHgxMTAN
Cj4gW8KgwqAgMjkuNjQ4NjAwXcKgID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gW8KgwqAg
MjkuNjQ4NjA0XcKgIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWEvMHgzMA0KPiBbwqDCoCAyOS42NDg2
MTZdwqAgPC9UQVNLPg0KPiBbwqDCoCAyOS42NDg2MThdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAw
MDAwMDAwMDAgXS0tLQ0KPiBbwqDCoCAzMi44NDc1ODFdIG10NzkyMWUgMDAwMDowNDowMC4wOiBN
ZXNzYWdlIDAwMDAwMDEwIChzZXEgMTMpDQo+IHRpbWVvdXQNCj4gW8KgwqAgMzIuODQ3NjAwXSBt
dDc5MjFlIDAwMDA6MDQ6MDAuMDogRmFpbGVkIHRvIGdldCBwYXRjaCBzZW1hcGhvcmUNCj4gW8Kg
wqAgMzYuMDQ3MzQ0XSBtdDc5MjFlIDAwMDA6MDQ6MDAuMDogTWVzc2FnZSAwMDAwMDAxMCAoc2Vx
IDE0KQ0KPiB0aW1lb3V0DQo+IFvCoMKgIDM2LjA0NzM2N10gbXQ3OTIxZSAwMDAwOjA0OjAwLjA6
IEZhaWxlZCB0byBnZXQgcGF0Y2ggc2VtYXBob3JlDQo+IFvCoMKgIDM5LjI0NzQxNV0gbXQ3OTIx
ZSAwMDAwOjA0OjAwLjA6IE1lc3NhZ2UgMDAwMDAwMTAgKHNlcSAxNSkNCj4gdGltZW91dA0KPiBb
wqDCoCAzOS4yNDc0MzNdIG10NzkyMWUgMDAwMDowNDowMC4wOiBGYWlsZWQgdG8gZ2V0IHBhdGNo
IHNlbWFwaG9yZQ0KPiBbwqDCoCA0Mi40NDc0MjhdIG10NzkyMWUgMDAwMDowNDowMC4wOiBNZXNz
YWdlIDAwMDAwMDEwIChzZXEgMSkgdGltZW91dA0KPiBbwqDCoCA0Mi40NDc0NTJdIG10NzkyMWUg
MDAwMDowNDowMC4wOiBGYWlsZWQgdG8gZ2V0IHBhdGNoIHNlbWFwaG9yZQ0KPiANCj4gc2FtDQoN
Cg==

