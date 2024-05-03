Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67671C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 01:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDCdZBvSR4L5sBuK9cJEwphyapgpeiYXa7qv56Q0pFs=; b=B4Eun6f+jsT7SdkDPF+7k+DMM/
	WAOzmTXmXEtnBqTs0ulA1t2xzt9RGNPQC842HniaUXirvON6VVzlpQ+WZHU0IIj0Z8489ZCENtP5E
	IZt2ujJEHM4XmzHs6uve7qaibBzqFavqb8j+Ys/7mHri8XRzv9e6xjUkLUzyFICP+BM0G+qs6lo1/
	CQk3F0EuMlw+Fyjc9MOzRwLJWyEba2ZPFnSZqWi92By/MhV5xGT9zmShCvCERN672JWS9qKMqxrYn
	zOFZdEyTvLR9xG0qQXrPby2uffFh+0kuNo3C78ZGzmRw6iDRmoPsjMcv4mfnMB6QcBdH6sSrIozQM
	HMJtKaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2hc5-0000000EYAZ-3LEl;
	Fri, 03 May 2024 01:21:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2hc0-0000000EY7d-13gO;
	Fri, 03 May 2024 01:21:21 +0000
X-UUID: 6df0bee408eb11efa8f1cd58ee6c2400-20240502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cDCdZBvSR4L5sBuK9cJEwphyapgpeiYXa7qv56Q0pFs=;
	b=hiH8iQVsVDhwSpSvu94+bUySAVMFRksMx1hboeN9RB31cRAiezJJb/j29JLmtbKQ3n8Wwjh81XQH2CBxW+WhyLmqPP6XmHtBsg16DiWFVjdYbbNkZB3zMivTFKaqirKyiCDxvATYzMma4dnFiFlvpKo9QEa4ZQqFpv49utC4/Kk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:3d4e1388-1e6d-41bf-8f68-09fbc3d90203,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:a023a0fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6df0bee408eb11efa8f1cd58ee6c2400-20240502
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1889602061; Thu, 02 May 2024 18:21:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 09:20:34 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 09:20:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUVCnzPWas8XbCUEssgns0xvkuVRKfo6sAGSH4qJCDgz7esw38eDsA0VAlkB1I20siF1TpXGCiQ6UcyrkHIfCtD4Cvex7PFmyw69zQcdrBlvInhkFCkvyj6f3g1/aDk9j28nzZhice/9KDgbYfFJ1kXh0XpS5iEW22fKvRnDkh7PxIww7ZQPPCUfjpIn3acgrBr5zsWqMwHVvcwQon06BhJ8Fn/E15HMR4tvSfivGLG156ohzZdgBwj53Q6VrrjdJJEHVu3NXEqvQCwu4TLEognV9p3lK0U95TQy5nN6f39imCS/7FLtpB2Lp2gCOkjNAWJ5mDH3NO82B64ndeIZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDCdZBvSR4L5sBuK9cJEwphyapgpeiYXa7qv56Q0pFs=;
 b=oJsj/cobYr8b+B4pQiaV0Hyayt01kAMl24NlifCJt0v+Stcz9oBwrBPfSsULeXO1Obff2UveVeczDuMzxzzZ0QOiUnVD9hbNMtQngk0RZolmtkMAGObfT19tJSU7dzlQTp6hU9DYQBhXfl/zIZzCisV1DIJSauSo64ICWdOFOMhEx05ErUjtsx9uATebHRviT96KiDPahwWItxeaejaJbVhQY0nUbQvc/pyyjOLCkw+IDA12Wgrxg8tQhnvg54dQDdVWU8/PXan0qGgBDPZEQN4uPgPhVpZwv313ZdJi/AD009wwqfshlSrUfReE4ULh9br1ZuZporiADRCVHpvtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDCdZBvSR4L5sBuK9cJEwphyapgpeiYXa7qv56Q0pFs=;
 b=G7keE/UW7l9WrpciXR2bPeYUyAZUwE2N/KTcPP3WuO4bcbGmRHdhF1zuHIMsSW0a8BCcXHGgZAddWZypAfP4Mq/Bhs7hdnZtJKMcTxDawJiLodI3EIWDFWqnLXItZtdj9VkvZX68zTg/SHnPy+pzAZDyVAqzVE/yBZN7hTUpaEo=
Received: from TYZPR03MB7183.apcprd03.prod.outlook.com (2603:1096:400:33a::11)
 by TYZPR03MB8978.apcprd03.prod.outlook.com (2603:1096:405:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 01:20:32 +0000
Received: from TYZPR03MB7183.apcprd03.prod.outlook.com
 ([fe80::343a:d17a:5383:4b1a]) by TYZPR03MB7183.apcprd03.prod.outlook.com
 ([fe80::343a:d17a:5383:4b1a%7]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 01:20:32 +0000
From: =?utf-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>
To: "rostedt@goodmis.org" <rostedt@goodmis.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2hlbmctSnVpIFdhbmcgKOeOi+ato+edvyk=?=
	<Cheng-Jui.Wang@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
	=?utf-8?B?Qm9idWxlIENoYW5nICjlvLXlvJjnvqkp?= <bobule.chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Thread-Topic: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Thread-Index: AQHal6xCZTDOyK83d0m4QJA7T219GbF+aQGAgAEyugCAA7F4AIAAC0UAgAAx4gCAAHrtAIAAu48A
Date: Fri, 3 May 2024 01:20:32 +0000
Message-ID: <31a1af01d40db7b6c5a248e884f57e6f8a839d4d.camel@mediatek.com>
References: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
	 <20240428202837.0cabca17@rorschach.local.home>
	 <20240429144626.7d868ad3@gandalf.local.home>
	 <661f101456506db945ccbd94700a0f47b95f91e5.camel@mediatek.com>
	 <20240501235044.12fa3297@gandalf.local.home>
	 <aac0a4cc0a12fc9593ab7de6c34836757e6814f3.camel@mediatek.com>
	 <20240502100914.33d6aa83@gandalf.local.home>
In-Reply-To: <20240502100914.33d6aa83@gandalf.local.home>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7183:EE_|TYZPR03MB8978:EE_
x-ms-office365-filtering-correlation-id: 8627e5ae-0b4a-468a-799f-08dc6b0f3a65
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dVNldHZGVVZXL0ZBMk9JcGlvUTJ0YUY3WGliYk54M2xCQXpBUlFSRVRzWGtB?=
 =?utf-8?B?ZGt4L0JwTCtuSTRYOU96bW1KM2NMRldibGFYWGZ0aE1abE5jYWhVOGVIdjFJ?=
 =?utf-8?B?Z01RNy9LK3RiSlJHQ2FUd2JwVGk4TnZMVW1nQUs4bWQvNmhGajF3OG1YVGtE?=
 =?utf-8?B?VHpvc24rK1NUYStueHZaRkVnclZRMVRWMks1cEc0MEo4Vm9lMlMyTzJMKzli?=
 =?utf-8?B?U0pKUU5WRlA1WVNuaDRNQTM5bGhBdVI3bEFDdTdJalVBU2dQNFpOWmNINmxC?=
 =?utf-8?B?SGFqTEZRZFJRakpYanV1dmpKOTFhV2k0K3RxQU93RU9hNU1SdjB2QzZ5MHAy?=
 =?utf-8?B?aHdRM0pWUW43TnFwdDVDNFBjRjBrK21oWmNJUzFoWGhGT0xLOHZsL2ZwWEtG?=
 =?utf-8?B?bVRpRUZEaFNlM3VIbVFXNXFVRVBkWURnMkVDNjZuUkFGbmhqUmg1b1BKbXFC?=
 =?utf-8?B?dWpDWVlpcWpibVpxekx1VFpJLzN5eHdtL2E3S1FqNlozc2dOOHEzWTkwNXlz?=
 =?utf-8?B?VU9IOUxTMmd1UTh5eUphYmo0RVovMFpSMjZoN2hWSDJNR3J3K0dMUk5zaVpz?=
 =?utf-8?B?MytqOUhWTktFWldZWDNORno1dnB1cDVsWjE3ZUdFUmt2dkNJaHhsOXF4SU1H?=
 =?utf-8?B?THpaUksrTVQ1ckZhc3JGUVl4WVRHZ2J2OHQzWWl4MERKWHZLMmR5Q1dPd0Ja?=
 =?utf-8?B?U0NwcmRldjN3d1dhejdlSXFseXVFMDJPQWxuSXgxZWNiOG1zcDlINkVsWHcx?=
 =?utf-8?B?STllRDhod20xeVA3OEFiTU44bEMxdExOL0tqOUF5Zm4wOHZLQXRHaVNDeXFR?=
 =?utf-8?B?R3UrbXJTV1NDWmNpVk1LNW43b0FrcGx1aFl3T3Zicy9ycGZ1TXVBQTNPdXNW?=
 =?utf-8?B?amp2b2g2cG1acHM1bWdSZHJiSmxldUhCaWRHaWZoeU5Ed3pGU3hQZEppaFZY?=
 =?utf-8?B?aEppRkM5bUdJaHI5UWhrbVQrYnIwZ2ltMG1Ja1B0cmcwbUhkWE5RbmJIQmV2?=
 =?utf-8?B?K25KNkJSSlo4dXU2dkMrSTJkT0F6Tko5bEcxUFo2L2xRNmFoZHcwNkZIVU9C?=
 =?utf-8?B?d0xsNHhESy9sNXhoYnVjckVac2NTUVRLb1ZNTWprNm9OeTUzQ0hVWGFtcW1D?=
 =?utf-8?B?NUg2eGhNZmRSZ0wwa2oxZ0pxa1hEMEcwSTJzeHhSRmJzTVFiOTRYZFcxdTBl?=
 =?utf-8?B?RkdSdStRQUM1QTYxcXFRVXVsd2NLNDRqMWZ4VVZheUhaRnFLdFdZOWcxZENH?=
 =?utf-8?B?SUNmbFJ6a0l0Qy9GZXZnTjlvNGVMZUFOQ3lSNy96a3dPNjM5SmZobll5L0Ix?=
 =?utf-8?B?Y0NZUWZhSjRiVThDTnErTlprM1NFdUJmR3B6OEF2US9nS29memlWVmtCL0o0?=
 =?utf-8?B?KzJ5MHZRNDBVRm85V1B3WmxQWjlVQm5KalNaT2VKeFNUQUYzNXRlcVo1TTNF?=
 =?utf-8?B?a1EvandVN0VFNUdiLzZIR2xPZEpEaEhGS0dVQkIyYVhZaG1zV0pVZ2JrZGFp?=
 =?utf-8?B?UHdWZEhsUjlHVHZER0dla1ltN0tLTUd5T2FMWDRRR1BYUmszTHZJRVFvbllq?=
 =?utf-8?B?L2FNVmFQNWVIa3U1TkpETWdRK21pb3ZtbUI1MWVIdFRSR21SNEkxYkJRRHRX?=
 =?utf-8?B?enpxcmF5ZlA5MzJiYzhjZW9PeUtsVzNzWkFmTWs5ZVFtMFJvVVNnZ3hRVGRK?=
 =?utf-8?B?VlI3eFF2QVVMU2pTbjZLam9MZDJTZE9wSTRGZ0FBT0dkamJtQ1B2UGNZbUVF?=
 =?utf-8?B?bnZGa0NKb0NPRU45TXZUa1p2YnhVOFd3ZHpoeGNKRmEwNEVMSnQyOEdpZXNq?=
 =?utf-8?B?eGpSZ0RoVVdkR3lBYXRYZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7183.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2thOUhnNU5mSGN3aGhsN283Skl1UGN4VzZFRmE5U0xyT2hKODZNQUhFWmpx?=
 =?utf-8?B?YjY1akhOQXFpdmRPMEg1R1dOU2VHS2hjOFpuOUYrUEVmL0dMV3ZpZFZKZVBG?=
 =?utf-8?B?YWM4eDZ0Yy9EZVgwdGZMenpGZ2cveGpOZU0xOWhqSHg2UWc5a2ZIZVNyYysw?=
 =?utf-8?B?RVZ6ZGI0RVdTUWlzYlliNGdXUzJEYVdSc2VjbnE0QzYzcFRPMVNWSWNJMGNR?=
 =?utf-8?B?dG9ncDBCZ2RHTUN0OXlEVVFzR1ZYb2ZucVdmMUM2UkJOOWFPdFI2SGJDa3lw?=
 =?utf-8?B?aTJHSS9JUmVLMnFjTWh0a3dlMFBBci8zanJTRzRWaU9OSVZmSG5JVGlxNkhn?=
 =?utf-8?B?RHpuT0FuSk5mSTIrVzhDNE5ETEE0TndkK2d5RUJHRDdYMjJ1TlNXemdYK3BU?=
 =?utf-8?B?cjNyY2MwVDhidU9rdGhBWG9tUy9CVm5JS2QrZlAyVFduTGk1akpZNTFYRC9s?=
 =?utf-8?B?MDFqRGFGN3J5bUJtNXE3V2RxTHhKVzZWdnYvVEVnM0tJbjJPVmg0U2M0N21m?=
 =?utf-8?B?cExmM2V4SXdybUZiVGhSdGpZYWxjTlV6WCtGU1ZMYTM2OFBSVXVFbXBycWRR?=
 =?utf-8?B?b2pwaDhvOFZ0WDIzTVkwdXdDUWc0Qjd3RmsyVFozQ2o4bkJmb1BqYnIrd1h6?=
 =?utf-8?B?OWYvckxXcmtwSmZueThXc2FpODkwelZGQzZPcGpabDhCQzUvZzlndmRja1lr?=
 =?utf-8?B?QnlVQXd6VzNZbW1mMGJHUVFHSFN6NkZpUDRFU0RROC8zOGFkTUV3M09BaGZP?=
 =?utf-8?B?blF5TlcrdlRwSS9IWFVHd3hyZTBPdE0yQ3g0U3VsNi90QUFKekNkR1JvTU9F?=
 =?utf-8?B?MTRLdlVNd3JsQjhBSUVTWmlTSGZlNDVRUWhwU0RsVVFLVzBhNWdzQWFCQkpi?=
 =?utf-8?B?MHlOZTA2MUt3MFB4VnQ1OHhKYmcxaS9ZV1Q0Y04wWFNQeklrS0JuZzJYZzJW?=
 =?utf-8?B?YXVUNm40U2hsTk5sOWErY2tVaTZ6M0xGTzVtVXBxN09mMGlpeWhWZGx0YVpP?=
 =?utf-8?B?MUdEakd3cEpVNTBDWEE4TGRWV3kycTF5VTNFTm1sZmFnRitFL1NtbEJlZ0Rq?=
 =?utf-8?B?OTVNZXR1Z2cydHpHOVM0cVB2VnU4a2MvSWtuZ0hTWW9WUTN6U1FXOVhDZ1RB?=
 =?utf-8?B?VGlocjd3OVIxVVVFV0VDOWJ1UHdONUVBeCsxeXBaMlhmMUhXM2pIL2gxYUN0?=
 =?utf-8?B?MndrcW8xYTV0MzBTeWRCL2tiODZOb05YZ1JMRmQ5bjBjNk80c3pzL0t5REUz?=
 =?utf-8?B?NW5sSFIzVFZ4cE5iaWkwMXdkUlhHUk0zYnlNTzkrMmtwc1drVEZOOHc5SEU3?=
 =?utf-8?B?bTJndnA5ZUl4UllhVWd4ZG05U3QwRk5nbGlCVVFYMmhmNU5QK1dsZHdBZklI?=
 =?utf-8?B?TlhyYTdSa0hIcDgxM2hpQ2VCMWZWRzhPRHl3TVlQY3VrZ1lqOXZka1NBT0Z4?=
 =?utf-8?B?V2FUMnpoczFDbUkrbG1sZ3hTbU4vUFBkd1IxNmQ2SHJlbTg0MHloVGpVUVJj?=
 =?utf-8?B?amtGSWFhb2MrU3RDTG80Yzk5Tjl4RkUrUStwTzA4ejFqRWdaKzhNUWxZV2NJ?=
 =?utf-8?B?ZE5mdUxqckVMQXJLbTdPQlAxUXNLZk16TDN3WWFiOWo1QVlIR2pnMkFNUy9j?=
 =?utf-8?B?V0tybU4raWY0b3ZodjdONmxOWmJWSEpSajNpMjFMWllmNGhhT3dncWQ5Tmph?=
 =?utf-8?B?bGowckF2OFQvcVhIUDh5emFFamdHcmtQOU9adWhtTnFSYkF1WUFpbUxxNUpO?=
 =?utf-8?B?VnZNZkV2WTM1cWN0bWZxSmV3ZUtQTnM2TVdCaUd6V3hsUmMxQ1pSNUFrSHlw?=
 =?utf-8?B?d0Q1Q2g2dVJqYkVFc0Fmck9ZTjlPUndKZnY2WjREV1BKbmVGaDdwYkh4Y2hU?=
 =?utf-8?B?dytBVVNBU29ZQ1ppeDdJbTM1SVYrNkxGWUd6N2tIbS9LQ3RjdFlKNFZIZm9Q?=
 =?utf-8?B?WG5nV21MNStCMUkwQVFGVm9lV2k1b1oybVh1OWhiUmRlRm5KWHE0U2lJc1dl?=
 =?utf-8?B?ZVJ4T3NwbEsvRXNJMHVHcjloeUUxSDQzcDUxVVFKbzR5cDVoOVRUZE9tNzN3?=
 =?utf-8?B?N2JFRnZlb0ZCdG83aVRnMFNJNXQ0Vk5XdTVidHNQTDQ5QjZwOTd3V3pKdmhM?=
 =?utf-8?B?eXZuQ1hPK01CTktMaVhpcGhLUys4MGdQK3h2eHFCa0lCMnloa1FYSVdKaFpV?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9884BB893CBA54459A1E922D5C5A4E1A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7183.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8627e5ae-0b4a-468a-799f-08dc6b0f3a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 01:20:32.7594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 48+KPmQgqqzM5fei7EeLumQPXV2tWwU8z+ib8R+ljVuy4+mE/W725f8vqWJ0ZZhy5VfXdXJEFOUfn3Bm7mxhDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8978
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.195500-8.000000
X-TMASE-MatchedRID: h20DFeLkM8/UL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tiERuhGw0JUBdymZBcuGGRGHZ+cd7VyKXooR
	FoM4jwoXCa34dA3O5+oU04ZN3CTJGXHEPHmpuRH3SBVVc2BozSpwhktVkBBrQgqm22sIY9Fzakj
	6FuUTADwtuKBGekqUpPjKoPgsq7cA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.195500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F410ACD67D7774D69C27DD0D887D739DBE5A49B3EDC782CCEEC44DBC6A5FCF4A2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_182120_304281_0CCFBB58 
X-CRM114-Status: GOOD (  13.34  )
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

T24gVGh1LCAyMDI0LTA1LTAyIGF0IDEwOjA5IC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICBPbiBUaHUsIDIgTWF5IDIwMjQgMDY6NDk6MTggKzAwMDANCj4gVHpl
LW5hbiBXdSAo5ZCz5r6k5Y2XKSA8VHplLW5hbi5XdUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiAN
Cj4gPiBHb29kIG5ld3MsIHRoaXMgcGF0Y2ggd29ya3MsIHRoZSB0ZXN0IGhhcyBwYXNzZWQsIG5v
IG1vcmUgS2FzYW4NCj4gcmVwb3J0DQo+ID4gaW4gbXkgZW52aXJvbm1lbnQuDQo+IA0KPiBHcmVh
dCB0byBoZWFyIQ0KPiANCj4gPiANCj4gPiBteSBlbnZpcm9ubWVudDoNCj4gPiAgYXJtNjQgKyBr
YXNhbiArIHN3dGFnIGJhc2VkIGthc2FuICsga2VybmVsLTYuNi4xOA0KPiA+IA0KPiA+IFJlYWxs
eSBhcHByZWNpYXRlLCBhbmQgbGVhcm4gYSBsb3QgZnJvbSB0aGUgcGF0Y2guDQo+IA0KPiBDYW4g
SSBhZGQ6DQo+IA0KPiBUZXN0ZWQtYnk6IFR6ZS1uYW4gV3UgKOWQs+a+pOWNlykgPFR6ZS1uYW4u
V3VAbWVkaWF0ZWsuY29tPg0KPiANCj4gPw0KPiANCj4gLS0gU3RldmUNCg0KQ2VydGFpbmx5LCBn
bGFkIHRvIGJlIGxpc3QgYXMgYSB0ZXN0ZXIuDQoNCi0tIFR6ZS1uYW4NCg==

