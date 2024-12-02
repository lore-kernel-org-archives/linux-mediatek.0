Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F02D49794
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgUeSTDRRtKQxDkFtDEtcXn96ZAtqogk+cvbPeTNOcA=; b=bRh3/s9F46AcqJpXZRN0UiW0JB
	Pu290jD6VqrxKwe5CY4CvNIrswkff/YqQVRF6a1b+vieF89gvIh0UmjdajUw9GDkN/urxe/2BcQ5N
	2kEQXu5zUpmpdOfEw/dhQYuIUM3faw2WcRu2B+uzFqye2hNnTv7yK9NmiznLN3TGTz07PiClpAYq+
	HOGxHQrDlgwOTd3+hLtjBGMhWY7Q27rsi2alPIbly7jebRwmNNjm5yAeWeA0FVeg3uKngTWyx2DCK
	whmOb2nhlidtiEmuhD2kLa+T22AMwevBgWDwIHiTqbfWGOBWTsy0kZqtjb1z2dViwT383o3dCx+R4
	BQG6TZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHw23-00000004mpX-14Ee;
	Mon, 02 Dec 2024 02:19:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHw20-00000004moo-3R46
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 02:19:26 +0000
X-UUID: d64b0a98b05311ef82ff63e91e7eb18c-20241201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KgUeSTDRRtKQxDkFtDEtcXn96ZAtqogk+cvbPeTNOcA=;
	b=NwQAfMRr9Pn2qZKOrW3EDE2P5YNUxt1U7L40pPcu5lVFSCHyY6XvYL3+6OMQqmGzF4v1Y1gf3hk+eRJqVB1jHrAVPoM+Up36gpbm3TPeBaOIX19Vpd/6ukCCuj2i9p1+h1uzIBxAz5YdbfiL6n4ZU8jzF4IKhuOKbroqsTJtN0k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:f9f46de4-e7f9-4a19-806d-a08385467284,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:fef792e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d64b0a98b05311ef82ff63e91e7eb18c-20241201
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 837555807; Sun, 01 Dec 2024 19:19:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 10:19:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 10:19:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJUmYCwFbPQy4YW3RdHWpXcoJx1jVuLwXP4EakF5bvxmJcIutf8B9dhyl3gVh/B5jCcST4BTS2icr3MeaQOauBpTcbj6WaTp0jBfwWeFwF2A1nQJd3pHOUDpQjEUs2u5HrTJ0LodzA6r3iHYjtz+e5BpzMdlnLrtrKMzhwwq9SpEAaAr1k9jYFKarynTfMLdfxGafEjiYfhaAxHt9Ku7Ertk9zxRDuvptsYlY3NPxOiVpdYZWjUfSvS8mSH73Sw6c/MaujL8GAKIZ/3RFcwAoiXyO7xz8FU7URMFrHYwQpBvF2C4PulAmp3rpNDsT9kra16yB12gjku52ZCXqHNu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgUeSTDRRtKQxDkFtDEtcXn96ZAtqogk+cvbPeTNOcA=;
 b=KFD7jQAA8zokfuEaXX/jzXs8+yAtJN4M2YRK1H1+Nes5sMnZxkMXe8Ve3LCnFvw28uSc8tZuCXfvh1Q2tAwavjSnThHEqZe2WF8/oRDKKUNtjg+7ij+EGNNy0aRL9Dvo0Xe0Q6kmG+6a+nHUXjTtGCTK47j9UfDsHbKjm3OnEwTEFCTXlKe+eUibCHOBCv/6xtIjFWGL+F4CNhK7k3qONzY+PVKxx7uikkNcWgGsufx6isoHBZt8RNKfLlKf+wfVk/2tXzeNCumRdFXtVQlLXn7XLQ4OUYgdq4B2Mbl4+J8lcwAPvJXuFlYEv1QSoeQMZ0ywlTLAbmTV0SwHt5ugfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgUeSTDRRtKQxDkFtDEtcXn96ZAtqogk+cvbPeTNOcA=;
 b=tf3mvpp/QOLKoR8qGVhpBCiAzg/2MLYLXroGkLlrYWdpg2Jkxi+x8T9O+GJEqtOj7n9doe1Qa99tYMWWCDyQ1jZeYC8MwW+jCxUxw5OAtlIz7mQmsabGvxm+PnWHtU+/p3PjHczxNm6Sa+VnL6c5+WK3Sxftp2IaOIMqn/diOQ4=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEYPR03MB8529.apcprd03.prod.outlook.com (2603:1096:101:1ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:19:09 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%5]) with mapi id 15.20.8182.018; Mon, 2 Dec 2024
 02:19:09 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com"
	<2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?U2hpaC1jaGUgTGluICjmnpflo6vlk7Ip?= <Shih-che.Lin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com"
	<2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com>,
	=?utf-8?B?SmFtaWUgQ2hhbmcgKOW8teWNmueakyk=?= <Jamie.Chang@mediatek.com>,
	=?utf-8?B?RGF2aWQtWUggQ2hpdSAo6YKx6Yi657+UKQ==?= <David-YH.Chiu@mediatek.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
Thread-Index: AQHbRGCSkTEGink4kEKH6qQz95YK8A==
Date: Mon, 2 Dec 2024 02:19:09 +0000
Message-ID: <b38ade853c9fa01369fe8e400c693d20e8b2256a.camel@mediatek.com>
References: <7QZPNS.0SWJEBP013RP1@nozomi.space>
In-Reply-To: <7QZPNS.0SWJEBP013RP1@nozomi.space>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEYPR03MB8529:EE_
x-ms-office365-filtering-correlation-id: ee74cd0f-7126-4003-d6c9-08dd1277b4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VDBPR1dHZkpXTjY1bkRnbm5UQkRlZXU3QVZiWGV3TysvTWRxZlFJamtMWW1W?=
 =?utf-8?B?alV5OHI1L1RmR1VVV3JmTkhLSGhHWExjTUFwaU9GSWk0QVR6clJpeHpMM2g2?=
 =?utf-8?B?bjJLa2pkOFVQMG1CaGhNdWEyUFBaS3N2NGtLa21kMnMwRU1VRGRpWUxTdEtS?=
 =?utf-8?B?THA5N3ZSQTlzRzU3RUp6ZjBhZkErakh1NkV1RFo2MWFMK3pRK0pPNWJEZ2xq?=
 =?utf-8?B?ZlFHck5ZREVHbEZHd0JJQ3ZmNjA2Q0tHb0hMSXI1N28zK0dYWkREUGFNRWNs?=
 =?utf-8?B?OG01Z0MwM3AwTm9TYnF4dnNCT2VRbVF1aDN3U0xGMXV0cDhYL2FyT2t6QnVQ?=
 =?utf-8?B?QkRWRW1tQWkvNmlwT0JMenowT0FBSG1QYlYxdUhvZjlwU2k0Qjl3RDdBU1Ev?=
 =?utf-8?B?NmdCcHplVmljM3JwQmFQZ1FEaHdKeUtWVU5zTG0rUGFXNXA1djlVT0E5ZFk5?=
 =?utf-8?B?ZUpJcGJQYVhkSnJoOEZQdGxkU3R0N25VbXNzR045MzNKV21QUUM1S2EyWWN3?=
 =?utf-8?B?YXpqSGZ2cnhsY0dLM3dTTnkwdkRQTEt6MzZNNW5VeGxUS3dnS2hUWXk5V1ZQ?=
 =?utf-8?B?Mk9tUVRTNUlXQTRPcTVMbkdsWU53ZUNCRkdxSk5VOXBmT0Z3V3VuVVllaC9y?=
 =?utf-8?B?MWN4TTFVWTZpZjJWeTBsM3Nka0MzaXRXYU5kTTFiQ0JNVWlnMU5WWUhmMldu?=
 =?utf-8?B?VStPK2dVQ29LRDcrZENDT1ZnZmZEdlJzWVNQNXlZYnYweExERHE2enRCUEV4?=
 =?utf-8?B?VFltS1d4cDlwREZTZm81M3E1dm12Y0pJd3huY0xnUzJaeVJPOGJpOGRlNzR4?=
 =?utf-8?B?a1hEZmRoQnkzbzNMc3QxSWg3QnVkMmFnNXdiMk02RXYzenFPS216UFhCWXZl?=
 =?utf-8?B?TkpFOFN0eDkwUjd2OGNnT001MWVOS3BFY1hmSWRMZ2VZQ2hJdTlJSDNQNW9v?=
 =?utf-8?B?MmFMMEdjRnBxWlB1RzZaVmxQWHRSWlFJRDkxR2hsUHgxOUdXTW9uREN2SnVX?=
 =?utf-8?B?UHhpV3RzSVJUd2pBZkpjY3pyK1RvbzRXcDR2T3pKbVF6S29aNjQxbGR2NExY?=
 =?utf-8?B?dUg3ZmlqeW94Sk9aQXRzSWtLSUdnZi8wREJlOEZnZ2RrRzkvaDB3Wll2V1N1?=
 =?utf-8?B?ZFJ5di8wOWVmOTUrdXJVUFVsK2xmcU9PUjZRTGZOanNYZWdNVXlTYU4vRU5G?=
 =?utf-8?B?cllrcjNRdWRLc2xteDZDdHZmckNwNmQrd2MvNGVDa1dpMmZXeGMyVzVMd0lC?=
 =?utf-8?B?c3ZtWDRFZ2FDR3NvNnFwcjlpMDhYU3VtaTE0TmFmVkpTZFQ0RTBMenFManIr?=
 =?utf-8?B?TW9zb2p2b1dyMUxIcEFEdUFFK0cyZSs3Z3F2ai8wVG1VSk5uajhaZlZXZU9y?=
 =?utf-8?B?S0JacDJldGtkQVlLeGgzbk5rUzUvVjdpSnBTdEVxMEVYTzBNSFRoLzVRdVhu?=
 =?utf-8?B?QjJPaG1zVjVlenBDQXhpaEJKUG1HeXNVMkpkd0xYTTJYNVAwcmpyVXZNSDdD?=
 =?utf-8?B?ZXNMY0QvQ0JrWjJ6bGQreXF6dTRyT0dRcmpkcFMzQWRiRHJ0YS9OMW9NUzZp?=
 =?utf-8?B?Y3cwY1pZaGJiVENVbzZkREpSMThhRVJDVk1wb2lJa25xeERadDFtQ0p1dEl3?=
 =?utf-8?B?WnZEQTB6NlN5KysrdmpldUdBMjNhei9UL1pDOU9TWmNwU3ZGbnJlKzNFbjhU?=
 =?utf-8?B?R0NZV2xSOXR3TElicm5qQ1NPZ3poaGJlVC9pZkZuK204QWJURy9ScUlIMmla?=
 =?utf-8?B?dkdxT05ZbzFDUTVpN1MrSDRPUWQ5Nmh5ek14K05odUF0M0xyWUZqMVA0ZTgr?=
 =?utf-8?B?RzZEbjVPNWYwQUdmSmhqTU5XRWNMVy9uWkFKM212eE5icHBYZDdoc245ZHRx?=
 =?utf-8?B?UnN6b2xzYnRyT2NpdFZmNDJLQmdNb2hlQnV4ci9mSUpPaFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6623.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEMzYW0xdnBmQWpJTmN4TWNta2REeFlRMHZkSW42cTZQU0EvTzZBZTJEanhL?=
 =?utf-8?B?RWFHMWhuRXl3MkkvclB2dEpVQ3RWRDFsZ21BeFBJRSswWEVxUVBYK1g5ZXNh?=
 =?utf-8?B?WXJyUlhaWmFBQWNlQ1grWm1mSWc5RVgyRlhndUlDaXlUTmlwMkppVElkMzBS?=
 =?utf-8?B?RlI4NXBQTXFBREtqbDFJWGdaUWN2UG5ONFVEdjdESEg1Q01ZUFpXR1JTU1l4?=
 =?utf-8?B?MS9NZnpJNUlUZ1MrcXJDaG83Ymc3SGlhSW5Dai9RTmFNRFhKRjQ3aFUwa1Zk?=
 =?utf-8?B?bXZMRDNrU2hER1diZEQ3WlV2Mys0d0R0ZXF3dXAxR1IyMlhJMjNsL1MxaWwr?=
 =?utf-8?B?K1BYN3F1cjVhdyt0eCs3ejFWbkl1RTVJS2VoV2VQU25tSysxcVllQ1NSdVJt?=
 =?utf-8?B?SG5zQ2tjb280eTNSSjBJS2t0RG5lb2N5Y0owbVNQRmw1Qkdlb3RwRnk1U1B2?=
 =?utf-8?B?dDFRWHA4QjBaYVM5TzYyOVlYbFhyMDFLYW1kVklFZmtSZ1A1anRmUHhJSUor?=
 =?utf-8?B?QTllR3VLQUtTS0x4MGE2VDlCRU5oMnJZYktCbDZXNWF3THIycFdIazRWcXBQ?=
 =?utf-8?B?MlpkcUdmdWRCb25pNlpxR2Z6aHROblhSSGhnaEJJVXFVMG84WWpJck1OUjdM?=
 =?utf-8?B?TlJZMjREb2NuK0pIR0NuYXVqdzlUTGQxNkZTU3RqVldZMHI2dXkyS1BZZERD?=
 =?utf-8?B?QnJQd2NEVU1jTk9uN1dlSWsySTA2VFVWTW5DOVJXZ2pxbmlqT1BrM0RTM0pC?=
 =?utf-8?B?ZWswSGpDbWlyaHc4T3RVVkNJck9xK1pkdVRoWndMWmFYNDNWTUoyYU9aZDFH?=
 =?utf-8?B?UURjMEIyN1kvVTdVU3dOSVI4RkZmSXhiUGl4NlZ4QVdMK3E5ZGp2S2NTRjV2?=
 =?utf-8?B?eVNINlRMYVVqMExPR2ZUN25zaE5ueEZpSjlmWk4yUDAzY1dhZTl6NFhROUVK?=
 =?utf-8?B?eWdQdEhUUHFmU05XUTQ2d0NWY1VORmViRzl0SExkRDA5Ti9uZy9PbGpGcUVJ?=
 =?utf-8?B?TEErRG9JeWdjWnQwTTZUKys5RTdNSWpUbnJrdHBtajQ5T0NnZTN6OGNOK1Zw?=
 =?utf-8?B?bUlER1BsdDRQVzJDbkZRSUNzWnJ1ZmlHU1k0cEM4MGVBcmlLNnducGIwNit5?=
 =?utf-8?B?WDZmaDNZeDRHL0o3Q2E5ZDFzMFFxWWZWUWo3ZUVnM2dHNmhTZUpNQkdEY3FV?=
 =?utf-8?B?KzJ2VmR3NzNHN2MwK0tJQzcxcEsvdFpFKzF0ZG9NbytVbXgzb2ZveFplVmFZ?=
 =?utf-8?B?dUpGY01XMWdlbk5tbUFROE9WY1FMbWRUTUFMbnZjeGxhVWVlbW5kZmNxREh3?=
 =?utf-8?B?RjdyVkVjNVhidFZHcDhTc2Z4UXVUQUJPTm44alg4M3YwNEJIek5CVGFTNVZB?=
 =?utf-8?B?bTNoZE90ZXQvbXErWDYzd2FTODBYTkpacjdqd3dKV09pdkVsbkxRQjAzZk95?=
 =?utf-8?B?RHd6TXNjS1lZNDVtbWRyRFp1TGNwZmxzM3ljWi9rUGJZM2pFSTVCTWZiMkZp?=
 =?utf-8?B?RGlzZGRaZ2tFK0h6OWdRT2pCNldGWnduQStUc3JSbzBnVjlSUzNPZENvUzdx?=
 =?utf-8?B?cTkzaDExRElRZ1VVajVCWXNjMUMwY2sva2FDOVFXVHZGaTIzWnBMRnNtdENv?=
 =?utf-8?B?T3VOcmgzb3ROQlNXdi9nT1dhZEp6NUl6NFEvOXo0eXZKckRybnNvRUdCWnRW?=
 =?utf-8?B?emNyOE0rREdkVDVadmZjSVFGNXhQZVlnTndFWFdseENUdjdSRHNtRlBmbDRD?=
 =?utf-8?B?Vm1RdE5vV29KOXpMZllqUlIwSzZOcmtKckdCTUtwKzNOcGUxZVFsdFJWbDdF?=
 =?utf-8?B?emljbHJmaG05ZHE0QTFsbFJ0L092citqODhhaWRrZklIMUtlZW1LdFFTSmRP?=
 =?utf-8?B?NGx3eWZSOUw2NkxIRUNsc2JUazhLajRPSENVUVQ1Uk9vWjR5amY3VWtjdVRw?=
 =?utf-8?B?ZzZkaDNIcjhHNTNDOStORDZ6VVQ1eUExV3pUOVBHbVFiaERVb2FRd1BhRTBt?=
 =?utf-8?B?L1RDQllXQWV3WTBrVko5cytkR0tVNXd3WlNGVmZqcWpyY1BYc3FFazhsT1g2?=
 =?utf-8?B?aHhzNEJkYVREWFF6U3ZNay93OUtpZndBTnBVcjhZSDZJMlRoQ0ozVmxOd0cx?=
 =?utf-8?B?VGFBREtUd21QZlR3S005Y0g3d01QQmdiTHdPK3BzbnhVN0xWbndLREx2MS9P?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <823B0F6DD813DE47B51E21636FE01510@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee74cd0f-7126-4003-d6c9-08dd1277b4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 02:19:09.7268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DKfFK6fZu2ATN9sDu1AJ9WE/9cdz7hMJS/RA1nr4OsfSdoEC3Ne7QOHKyqvSjITjDUi1X5U1c+osF/qdLr8gIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8529
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.308000-8.000000
X-TMASE-MatchedRID: mHCEnrG40p7lNTxB7XGo6O5i6weAmSDKLdMFOPPwnckNcckEPxfz2DEU
	xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+CwS12tj9Zvd8zMVY5itbDoDG/X
	ZnEt/VclO5VVCIzdBzRBtTTe2YAcAc3nYEydpPfdzzvm7su8EdNZKsq3DGpalRoS5c9eVHmoyJX
	WI0Qewue/spC84eMUoEeBR0w+lQgLT8bI3kykaU+7KTDtx8CggnbKbVtRsqTC7TNFTp5fwIfWnL
	2FmW8ATX/zBfaMtvA5A/KrrX2V/SQcSBA/LYDihz5CYDcN91JsxmbT6wQT2aw2G3vz8l/IEisku
	2fMtlY6IS12ZPwdmJlEr12fFZNbQT+qnHgO2MYm2FK5J1KhC+zzcxITw5DtJjkdfW0DqyOVbdtr
	MeHA27VsjFz0a8qwuPk3ir4speHdgNTke+eoi16MVgdN9w+TCKFFZAe4nyZ5EnPVDTqslHBwz72
	zDzvkOAASLFmNd0q5aMMK1sVa0lYdM1kFwmWfIde4BwMgBa9PUqhJbkmLVe2opcrAlPcxmz+QgF
	L42EMRPN9Ds5e3i45GTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIFUFJm2B6H9E=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.308000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4105A4681ED0EF53697F87A627AE251780C9896B12F85FF400A9220BEABF66422000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_181924_877747_D250E895 
X-CRM114-Status: GOOD (  15.60  )
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

SGkgTWljaGHFgiwNCg0KT24gRnJpLCAyMDI0LTExLTI5IGF0IDE3OjEzICswMTAwLCBNaWNoYcWC
IEtvcGXEhyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNl
bmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBIaSBTaGF3biwgdGhhbmtzIGZvciByZXBs
eWluZyENCg0KVGhhbmsgeW91IGZvciBicmluZ2luZyB0aGlzIGlzc3VlIHRvIG91ciBhdHRlbnRp
b24uDQoNClNpbmNlIGV2ZXJ5IGVtYWlsIGZyb20gb3V0c2lkZSBvZiB0aGUgY29tcGFueSBpcyBm
aXJzdCBtb3ZlZCB0byBhbg0KaXNvbGF0aW9uIGZvbGRlciwgSSByZXBsaWVkIHlvdXIgbWFpbCBi
ZWZvcmUgbW92aW5nIGl0IG91dCBhbmQgbm90aWNlZA0KdGhhdCB0aGVyZSBpcyBhICJbU1BBTV0i
IHRhZyBpbiB0aGUgc3ViamVjdCBsaW5lLg0KSSBhcG9sb2dpemUgZm9yIHdoYXQgaGFwcGVuZWQg
YW5kIGhhdmUgZml4ZWQgaXQgdGhpcyB0aW1lLg0KDQo+IA0KPiAgPiBBcyB0aGUgcmVmZXJlbmNl
IG51bWJlciA4MjUwID0gNTk0MDAwIC8gNzI6DQo+ICA+IDU5NDAwMCBpcyBLSHogb2YgdGhlIGNs
b2NrIHJhdGUgaW4gbW9kZSBzZXR0aW5nDQo+ICA+IDcyIGlzIGxpbmVzIGR1cmluZyBWQlAgKFZl
cnRpY2FsIEJhY2sgUG9yY2gpDQo+ICA+IENhbiB5b3Ugc2hhcmUgeW91ciByZWZlcmVuY2UgbnVt
YmVyIG9yIHRoZSBFRElEIGluIDM0NDB4MTQ0MEAxNDQNCj4gd2l0aA0KPiAgPiB1cz8NCj4gDQo+
IFN1cmUsIGhlcmUncyB0aGUgbW9kZSBkZWZpbmVkIGluIHRoZSBFRElEOg0KPiANCj4gRFREOiAz
NDQweDE0NDAgMTQzLjkyMjc2MSBIeiAwOjAgMjE3LjMyMyBrSHogNzk5Ljc1MDAwMCBNSHogKGFz
cGVjdA0KPiB1bmRlZmluZWQsIG5vIDNEIHN0ZXJlbywgcHJlZmVycmVkKQ0KPiAgICAgICAgICAg
IEhmcm9udCA0OCBIc3luYyAzMiBIYmFjayAxNjAgSHBvbCBQDQo+ICAgICAgICAgICAgVmZyb250
IDMgVnN5bmMgMTAgVmJhY2sgNTcgVnBvbCBODQo+IA0KPiA3OTk3NTAvNTcgaXMgMTQwMzAgc28g
ZGVmaW5pdGVseSBtdWNoIGhpZ2hlciB0aGFuIHN1cHBvcnRlZA0KPiBhY2NvcmRpbmcgdG8gdGhl
IGNvZGUuDQo+IA0KPiBUaGVyZSdzIGFsc28gb3RoZXIgbW9kZXM6DQo+IA0KPiBEVEQ6IDM0NDB4
MTQ0MCAxMTkuOTk5NjQyIEh6IDA6MCAxODIuOTk5IGtIeiA2NzAuNTEwMDAwIE1IeiAoYXNwZWN0
DQo+IHVuZGVmaW5lZCwgbm8gM0Qgc3RlcmVvKQ0KPiAgICAgICAgICAgIEhmcm9udCAxNDQgSHN5
bmMgMzIgSGJhY2sgNDggSHBvbCBQDQo+ICAgICAgICAgICAgVmZyb250IDMgVnN5bmMgNCBWYmFj
ayA3OCBWcG9sIE4NCj4gDQo+IERURCAyOiAzNDQweDE0NDAgOTkuOTgxNjA0IEh6IDQzOjE4IDE1
MC45NzIga0h6IDU0My41MDAwMDAgTUh6ICg4MDANCj4gbW0NCj4geCAzMzUgbW0pDQo+ICAgICAg
ICAgICAgICBIZnJvbnQgNDggSHN5bmMgMzIgSGJhY2sgODAgSHBvbCBQDQo+ICAgICAgICAgICAg
ICBWZnJvbnQgMyBWc3luYyA0IFZiYWNrIDYzIFZwb2wgTg0KPiANCj4gNjcwNTEwLzc4ID0gODU5
Ng0KPiA1NDM1MDAvNjMgPSA4NjI2DQo+IA0KPiBTbyB0aGUgMTIwSHogYW5kIDEwMEh6IG1vZGVz
IGxvb2sgbGlrZSB0aGV5IG1pZ2h0IGFsbW9zdCB3b3JrIDopIFRoZQ0KPiBtYW51ZmFjdHVyZXIg
bmVnbGVjdGVkIHRvIGFkZCBhIDYwSHogbW9kZSB3aGljaCBJIHN1c3BlY3QgbWlnaHQgaGF2ZQ0K
PiB3b3JrZWQgd2l0aG91dCBpc3N1ZS4NCg0KWWVzLCB0aGVzZSB0d28gbnVtYmVycyBzZWVtcyB0
byB3b3JrIGFzIHRoZXkgYXJlIGp1c3QgbGVzcyB0aGFuIDUlDQphYm92ZSB0aGUgc3BlYy4NCg0K
PiANCj4gID4gVGhlIHJlZmVyZW5jZSBudW1iZXIgODI1MCBpcyBlc3RhYmxpc2hlZCBiYXNlZCBv
biBvdXIgaGFyZHdhcmUNCj4gID4gc3BlY2lmaWNhdGlvbnMuIE51bWJlcnMgaGlnaGVyIHRoYW4g
dGhhdCBtYXkgZnVuY3Rpb24sIGJ1dCBjb3VsZA0KPiBiZQ0KPiAgPiB1bnN0YWJsZS4gRm9yIGV4
YW1wbGUsIHRoZSBtb25pdG9yIG1heSBzZWVtIHRvIHdvcmsgcHJvcGVybHkgYXQNCj4gZmlyc3Qs
DQo+ICA+IGJ1dCB5b3UgY291bGQgZW5jb3VudGVyIGJsYWNrIHNjcmVlbnMgb3IgZ2xpdGNoaW5n
IGZyb20gdGltZSB0bw0KPiB0aW1lLg0KPiANCj4gVW5kZXJzdG9vZC4gSSB3YXMganVzdCB3b25k
ZXJpbmcgaWYgaXQgbWlnaHQgYmUgZGVwZW5kZW50IG9uIG90aGVyDQo+IGZhY3RvcnMgdGhhbiBW
YnAgYW5kIHBpeGVsIGNsb2NrLg0KPiANCj4gID4gTWF5IEkgY29uZmlybSBpZiB5b3UgYXJlIGdv
aW5nIHRvIGltcGxlbWVudCB0aGUgcGF0Y2gganVzdCBmb3INCj4gbG9jYWwNCj4gID4gdGVzdGlu
ZyBvciBmb3IgdXBzdHJlYW0/IEFzIDgyNTAgaXMgY2FsY3VsYXRlZCBiYXNlZCBvbiB0aGUNCj4g
ID4gc3BlY2lmaWNhdGlvbnMgYW5kIHdhcyB2ZXJpZmllZCB0aHJvdWdoIGEgc2VyaWVzIG9mIHBy
b2NlZHVyZXMuDQo+IEFueQ0KPiAgPiBjaGFuZ2VzIHRvIGl0IG1heSByZXF1aXJlIHRob3JvdWdo
IHZlcmlmaWNhdGlvbnMgYmVmb3JlIGJlaW5nDQo+IGFjY2VwdGVkLg0KPiANCj4gSSB3YXMgZ29p
bmcgdG8gaW5pdGlhbGx5IHRyeSB0byBpbXBsZW1lbnQgc29tZXRoaW5nIGZvciBwZXJzb25hbCB1
c2UNCj4gYnV0DQo+IEkgd2FudGVkIHRvIGV2ZW50dWFsbHkgdHJ5IHRvIHVwc3RyZWFtIGl0LiBI
b3dldmVyLCBmcm9tIHdoYXQgSQ0KPiB1bmRlcnN0YW5kLA0KPiBpdCBtaWdodCBub3QgYmUgZWFz
eSBvciBwb3NzaWJsZS4NCj4gDQo+IElmIEkgZGV2ZWxvcCBhIHBhdGNoIHRoYXQgd29ya3MgcmVs
aWFibHkgYXQgbGVhc3QgZm9yIG1lLCB3b3VsZCB5b3UNCj4gYmUNCj4gb3BlbiB0byBtZSBhZGRp
bmcgYSBrZXJuZWwgbW9kdWxlIHBhcmFtZXRlciB0byBhbGxvdyB1bnZlcmlmaWVkIGRhdGENCj4g
cmF0ZXMsIHdpdGggY2xlYXIgZGVzY3JpcHRpb24gdGhhdCBpdCBtYXkgY2F1c2UgdW5zdGFibGUg
YmVoYXZpb3I/DQoNCkFzIEkgYWxzbyBoYXZlIGEgaGlnaCByZWZyZXNoIHJhdGUgbW9uaXRvciwg
SSBjYW4gY29tcGxldGVseSB1bmRlcnN0YW5kDQpob3cgeW91IGZlZWwuIENvdWxkIHlvdSBwbGVh
c2UgY2hhbmdlIDgyNTAgdG8gYDgyNTAgKiAxLjA1YCBhbmQgc2VlIGlmDQppdCB3b3JrcyBpbiB5
b3VyIHNpdHVhdGlvbj8NCg0KU2luY2UgdGhlIG9mZmljaWFsIGNvbmZpZ3VyYXRpb24gdXN1YWxs
eSBwcmVmZXIgYSBtb3JlIHN0YWJsZSBzZXR0aW5nLA0Kd2UgaGF2ZSBpbml0aWF0ZWQgYW4gaW50
ZXJuYWwgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIHJlcXVlc3QuDQoNCj4gDQo+ICA+IFJlZ2FyZHMs
DQo+ICA+IFNoYXduDQo+IA0KPiBSZWdhcmRzLA0KPiBNaWNoYcWCDQo+IA0KDQpSZWdhcmRzLA0K
U2hhd24NCg0K

