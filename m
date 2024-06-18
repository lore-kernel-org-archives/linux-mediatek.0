Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E3C2BA15
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ClcbjiW50KUPerQkLT+/XXaEPmUphYgFhHDgh5jp1o=; b=t7L+uO9zL+qvuFmQIg+SnH6aQp
	trxTxA8j10tpYSXlfG5bceVrj0ypu7oKkxAoH9iPZHuxzec1dJ4HFRaOxq4SvPMj9ZGyZETD6iMlw
	FVnYJ6yr6TKLLfjAwK1A+T0guDpLBjMMU1doHjwjj0iWA/6QnqgFoinQm3S5IKMNtwAuVciISxUa5
	PApuJR8mwptIieYxtItAcWZzSnUauDpou63eRNv2KGW0/2z2RpAfVJ7+MqzQpBE7G8cGzEQSgJ2fv
	kD3eVIjRWlfvN9yxjCNtSykOox0oR+uXrR0iloh33G9UQWDm21f6Ag351ojQ8LO1sa55nENYtoI1f
	iciHMVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUQR-0000000E6fv-2HFu;
	Tue, 18 Jun 2024 08:42:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUQN-0000000E6ee-01jB;
	Tue, 18 Jun 2024 08:42:44 +0000
X-UUID: b7411da02d4e11efba8bfb22b0451c12-20240618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4ClcbjiW50KUPerQkLT+/XXaEPmUphYgFhHDgh5jp1o=;
	b=JDa4KDa4nauFfXHE+yXoNUgkG1m5WfKUS4aEuBxvvduNaPBtaG3k/5P0U8Xf8Tx2bmzkQiS8eJtJApfTF/RPFajod1KhRLy7otCVD6nK9E8Fa8XjX9WmsFcwyUFdb1U01OIfYDDSV2FsM8TKv5ea7ZlihSUYwMljzYglQgovAgg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:a9a1a679-1fb5-428e-a4e8-0578c7ea0e67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:0974b744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b7411da02d4e11efba8bfb22b0451c12-20240618
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 996552672; Tue, 18 Jun 2024 01:42:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 18 Jun 2024 16:42:35 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Jun 2024 16:42:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkVZh2AFztb0aSZUzq4okW7aaCID1V8AaWZsqRAbKZ3UaImhutIte5v3IL5fKjhHuaW6ZodbBNdUVwpBb8A9ejkpu6Qzqq2CBmgy8mxzMQQwcbgXdw3U0Ohef0/0KyLNBgEU027BrWEU+6JIemWfDjViCffnfcVBDeRo+LyTJ68XIVfJ987YLYPBY3d6gRLv2BDpbLejDojJ+5PWHv3KFmOsgZOfrFYJSAkQraOckt+sN/oeIHDKJvdYgtGNXKmMKfcK8HjMzHkl7D3poAPpRO3/CDjXZaj2ImV7AW4durN4XUZc5nKeGP4hSSrNH7uMSvJZVt9QOm9HKiLuK5qcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ClcbjiW50KUPerQkLT+/XXaEPmUphYgFhHDgh5jp1o=;
 b=F9+fMLNGciWcNt8ZAMm0KOlOfKQxKMuk1DQMjMByW/slRv33KJu6RUkEXd+/JQaRZBEhFWic9CHmuVfez+DTA6LhcmnZkaUiLPj8SdTFTz2b3HzteWTZZdMj1FOV5LE3tD5gBMiduyL7SgrgIkHY3FDA7Ob+mL54qubFHwMrjAd6YV/QIFN9aqhr662VQTktppEnbDBUl36x7jHmexbjhBr96b5LakbAWqKyfjcitun98hi/qZdxJcjiGJmCep2ivL4GaQ/V5cvRSNasa4/uCcb7ExI8JtNf+KEGOoAbkR0foNhvLX0TFs3UOeHRbpSiNmXGs+KPG5JLY/VnGyYICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ClcbjiW50KUPerQkLT+/XXaEPmUphYgFhHDgh5jp1o=;
 b=jO0c8YDM3BUf+Zv6DQJKxrFdFSR8qaMq9dzgk8TC5xaywO0vQZGMThKMhcJbn7xOac+262VSBX+smMmehbFeCviiQO1oDo5lSw2nqo3JWucCamdlStQdZ915n/LOV5fhMEVaCfzjrlLgbyjQFj4ySueXnBedLcoz9x3r0hwYoTM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB8255.apcprd03.prod.outlook.com (2603:1096:990:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 08:42:31 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:42:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
Thread-Topic: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
Thread-Index: AQHavg+NdbRKcT+3skGSUl4IqMicy7HMSVSAgADxdQA=
Date: Tue, 18 Jun 2024 08:42:31 +0000
Message-ID: <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
	 <20240614040133.24967-3-jason-jh.lin@mediatek.com>
	 <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
In-Reply-To: <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB8255:EE_
x-ms-office365-filtering-correlation-id: b66e5a41-813c-4f25-0064-08dc8f7297a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?RHBqZGI3MDAycEZ1bG9QQkdxcUhKaWl6eHBxVUNEblVJRE85TjhUSnFTRFNs?=
 =?utf-8?B?VWYyZ2VaR3E1ZysxcG1GYmUvZWxRK0JJeW9zeEgyTDBHUGZhNzlzZEFZNm9n?=
 =?utf-8?B?ZnhFUm1HdEtDSnFuTDhBQmM3cU9wcXpnVTUyZFBYMlEvTXEwMUhtS1F4S0dI?=
 =?utf-8?B?L3g2ejBPd1VweStHZjBwU3RtdmR1VlB6UTJQQkExUTRhWGgxeEovYjFlRy9a?=
 =?utf-8?B?aGxzQWV1WWpYaVFLVXB6Ri95dTR5VUZKclV6dXJtNlN4eWFJVTFmWkkzUUFq?=
 =?utf-8?B?MW1PUUtkR1dJdDU3ajhRVVQwb3czcmcvN05ja1F2VkNON2x3RWNzRGo4RytP?=
 =?utf-8?B?RjZleDZBRlZUaDB0d3pEc0VUOFFlZ2NvTit1anVaenUvWVhtODlRR2Q3a21C?=
 =?utf-8?B?ekZmVWh3V3ZKcXl4Q2JxRTZVZVZxSTcrSDJIci9VRWdPWWpEVDU3Ly8xMmN4?=
 =?utf-8?B?ODB1dFFDVVV6WmRiZm1rQ1RSMktGWU5uTU5CQlRwQ3Y2am1ybHZLUm9hRDNJ?=
 =?utf-8?B?YUl1RnVkem12clVNaFJscHZjMjRiRkRza0hnckJlRG4wY0R3QWxPcFozMjNK?=
 =?utf-8?B?QjVEekxUcVlQR1FNaXBqdzhCOXdDZW42TndHSTcrQXJMV1drK081Q2hETloz?=
 =?utf-8?B?N3J0WVVucjdnbFh5NWVRT0UxbXVTTVZ6djZjaVQ2Yms0bDNlUW15dVMzMDBI?=
 =?utf-8?B?Nnl0amxDTXU2cTRFLzZtaDZNdlZTR2VZL1N0TmdXbnlvUnNNNEdRbEpEc3l2?=
 =?utf-8?B?OEpldk9BbUhRVDR5Vzg4Qy9yazByN3JXb0JyMGJOVkFQazlFL1VvcnRUMjBh?=
 =?utf-8?B?Q0RmeFJobCswL1pIRG52eGR3Q0E2T0JiSm1aQmk1c1oyMnlBTVdlbnZ5RzVY?=
 =?utf-8?B?blhHYWZGNDY0SnNLN1YzaVU3NnBUdmYvM3pRaHliSGJsRzJYRENPbmd4UHVi?=
 =?utf-8?B?Z21BRHNJeDQrN0I4M1lIMDA4S25WaTAvRFVJUFc0NnZGZU1pYmlud1BmWjQw?=
 =?utf-8?B?YUx5K1RHMnZ3NytmUWxVOEcvYm5MT0JuaHcvTHprY3NKRzJrdVNwZ2JLV3dR?=
 =?utf-8?B?c1ZycFU4RTFRb2RUSHdaVzJrTDlOeXBhZGhIQkV5RTN4T1Q5OHNjRThIaHI2?=
 =?utf-8?B?U0Z6QmhDMGc3QWxsK3NEQ015SmphVWJTWU1KSC9JeE9aUzExbWtIMHdsY3lU?=
 =?utf-8?B?K291YWtnOVNVZE90ci92OGUvdHNoTlVpV3NBcWFrVnkwekxZSkM4RDQ0T1Va?=
 =?utf-8?B?Q3NEWnpPZGV4Zi9vcU1OTklvZmxsdlE1S28weFFRS2RBcmVaaFdPQVE2UHgy?=
 =?utf-8?B?WHBvNHA4cWRSZHp4VGYwclpmNTA0R1ExbGNxQVpVWEZNWE9qZWdiL2J0STMx?=
 =?utf-8?B?cGg2Y3lHMlMvWmF1cTlHcW42L3dCNGtsVGRRK1FvZjBNUFlCenc2bExGekVr?=
 =?utf-8?B?KzlNMTZQbzI2eE5Lc2tOT2RkajVOZm0zL2hNME4yTWU4eVlUd3VZOUxCRzUx?=
 =?utf-8?B?MGNENmhGbWhPNXdMK1BZWSthYzAvSTM3b2psK3ZpOWVad3lMY09pM3ZqelJZ?=
 =?utf-8?B?eGRtMjc5c3lTeHlBb3VGcy9CZ3kwWXlBOStxQndCSXQremRqWnFqRjB5d241?=
 =?utf-8?B?MWc0YXZtMXNPZ2cvVTBJSTBVamtiR1gwZFJzQlNzOXdGQjBTQmVaWGl6cmxm?=
 =?utf-8?B?OTZ3dzJrSS9wOWkvT0NYNExsMW5oS0VHWU9WdXphQmt2Y1pUcGw0V3NNdVVG?=
 =?utf-8?B?T0ZDNmF1OENCMGxvbjZNNUFpeTQ1MkNBOGxJemFXS092NGpLU1FlM1d6YjRw?=
 =?utf-8?Q?3gR57SweE4XwGERjWSucMkWG4REhLXxO2uIeE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkoyTkd5bXJ6aGNjbjRCN3hPYzBhSlJYWjNhRCs1NlRtelFGTEtveXdPQ2oy?=
 =?utf-8?B?NGZ6K2FqT0F6T3dzdU9pTGVkcEhNZnUvR0UwbVcycmk2VENXNmQ1UXlGMEh1?=
 =?utf-8?B?eE0rUFRUS3JscVl3VmRCdE82VlNvMzN3dFVaalZSb2tuQnRZb0hFcUZMUHhX?=
 =?utf-8?B?Rk9yZDN5WjFXQmdsSWtSLzlhbHNxTGxTaWc4eDg2NktPQ3ZHbDF1L1ozRCs1?=
 =?utf-8?B?ZHFPSWd5V3NSd2hiNS9VYTdkVlE2dStzb2tSQkxSVDFXczJkeHRmQ0JXWEgx?=
 =?utf-8?B?Y3gyVStNNnVZVHhPMnZ4NDFpa2FFL0srd1paQVlQZXlXcTE5ZGJtVElmMERp?=
 =?utf-8?B?dFJWcmRUSFphL2dEclFleVkyNVk3TlQvZmQ1cDFQbFVEQjAyOHBzSFVKSVFG?=
 =?utf-8?B?SjVQOEoxckpCWXVGWndEdEtXU3JrakVtYW5GREcxY3k1U3lpTU5CWUJlS3ZO?=
 =?utf-8?B?M3BpNmg0SDY2RHhheGtwNXdJRUNHUEpWMThpOHVmVVpJdlhRdGtuZUpnZ2t1?=
 =?utf-8?B?LzhPc01pOG5EU055RkNPWmZCVWMwbGgvMWViNnd5T05ydFpvQUxOQjQ5SVV3?=
 =?utf-8?B?cjhpRVZZb0w4Q3hGOHY0c1ZpVEp1ZEoxS3lncFo2SUhJUHFweklMR3A0SVJ3?=
 =?utf-8?B?Z1JQbWtvZVNTbjJHVlQzSzRlbDFuVDhnckxPemM2OHhPdzNIbi9FSUhpVG1v?=
 =?utf-8?B?VjJjZityWkEzRTBxS3dURXJ3Y3AweERHWmx0bGFIUE41aGZvT1N3RWsrdjEw?=
 =?utf-8?B?VjdrRDVxZThnRjMxUVJ5K0VvdU1iTTU1YmxZdW9CS3RqbWthKzF1TVp3NnJC?=
 =?utf-8?B?QWM4Mk5nWWpITm1aMnZzbUx0VzF5K1ZUQlljbjl5dThmem5QaWdSOVR3ZC95?=
 =?utf-8?B?WkZHNDhIL3RoVVRGMk9HRnJFYytSUmtmQTZnWGV1SUVXL1V2OVpFWmRJeE9U?=
 =?utf-8?B?UWZmTzFBcFNJY204UGp6QXYrWXJaVVJIWXRaTkFFM0xVT2RadmhuMzc3elBl?=
 =?utf-8?B?WXRucjZLakZER1k1dHo1M3NNNmx5N0hnWDAvM09UNTJSYXZzUHlleE5neUVp?=
 =?utf-8?B?NXFKN0NEWGZWRVJTVC9CSDd3a1JsUVgzeGlFNjBKb0NpcWFadkVlRlBhUzcx?=
 =?utf-8?B?T3hSUHNJckJnU2JhVUdaUkJ2K2QvVXYyaHV6QmpYYkY0a2NJdXk5bXAxeXBs?=
 =?utf-8?B?dUtQNUlTU0ZuaURlVXBwa3EzSXFDUys0NjZ3Q0l6REZIeWN3Sjg3eGFLakdy?=
 =?utf-8?B?T25IcGoyQUpJTjNrY1RvMDVxQ3pZMkV6RHY0M0RGNU90ejVMUzRML2t0cVNp?=
 =?utf-8?B?MTVvdFJxYzNxQTVWMmNia2RYK0JoVGFqYXpMZ3FQT3k3T1ZWZFROakJ5NmU3?=
 =?utf-8?B?WXluaGtQTUt5Rm0xRmRMalBTV2FONVQrNlkzTko1ZHZhUTF2N2hDQ1R1K1ZN?=
 =?utf-8?B?Z1F5cEFxZnpUR3EvWDAzYnhMYWQveWYvclU3UWRuNUlTTjc1QU1IajJwSnNu?=
 =?utf-8?B?Y3hRZmJlZWhPOWNubHI4Y3RvNytJcEhna0FVNjE2RkNBcGdHMjg3WXJZZnVW?=
 =?utf-8?B?UWk4Q3VnWE8xSDBETk44ZDNoK1NjMnkzTTdMVnh6U2d2TlVuSDVGVjJnQWxl?=
 =?utf-8?B?bmppRXd2eVBZTnJranFmbnZRUTQ2anJ0UWZyL3pKTDNDdkVvUW5MaUpTWWg3?=
 =?utf-8?B?L3ZiMmlRRThHb1FqV1ZtY1BMRVgxVlJiV25EbmlWK1loUFNTSXNncGtEc0dF?=
 =?utf-8?B?ektoZVlibjhxOTNhamtBbUczNHAvYzZ3dkREblozOFZVSjh4ZExDY2I5Z1JL?=
 =?utf-8?B?cUR1bEJPTDJIdUFGMFg5OG5FaFFpcy9zQ2dzcER1ZUlPSVZRMTFmbTFUOVhp?=
 =?utf-8?B?Zlp0QWdUYTRTYmZiVlBiNmdIWlpLS0h1S25XMVJqNGFFQVdsRTBlM0RoS0ZJ?=
 =?utf-8?B?V2VsaVVSV0dvSHpwTWRSaGJCUXpwWUVlM3Azd0ViR3o0TmRWWG1MTDdNdmM5?=
 =?utf-8?B?MHZOMkhxWlZ6YTVzaER5VlEyaW1rZmcyMGsvejJBamV0eHFkcmQzV0JVVHBH?=
 =?utf-8?B?UU52VW9aVys5bmttZWhUQ3ZWaHh5djIrb2NjS09iOHBXNmdwaWtnYlBkNEgx?=
 =?utf-8?B?OUpUbTZqaEdhS2prd0JqSEVuazQ5bG01dUlzQ3I2SjlzcDNvTkZVM0lKYlFs?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30D55564FB8CB449954CE625D3E91F44@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66e5a41-813c-4f25-0064-08dc8f7297a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 08:42:31.2702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srDOsaBMbIxSZ428TSTz0YZT851dA2+xEeFzqudQh49Y1IS2ZN3YMDRkkieUlEK9mXfdwOYDVzZHuVAGQEyK9hXeHNTjJJVsBKDNGurK5bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_014243_178211_C8107764 
X-CRM114-Status: GOOD (  19.33  )
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

SGkgSmFzc2ksDQoNCk9uIE1vbiwgMjAyNC0wNi0xNyBhdCAxMzoxOCAtMDUwMCwgSmFzc2kgQnJh
ciB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAxMTowMeKA
r1BNIEphc29uLUpILkxpbiA8DQo+IGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gV2hlbiB3ZSBydW4ga2VybmVsIHdpdGggbG9ja2RlYnVnIG9wdGlvbiwgd2Ugd2ls
bCBnZXQgdGhlIEJVRw0KPiBiZWxvdzoNCj4gPiAgIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2Fs
bGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0DQo+IGRyaXZlcnMvYmFzZS9wb3dlci9ydW50aW1l
LmM6MTE2NA0KPiA+ICAgaW5fYXRvbWljKCk6IDEsIGlycXNfZGlzYWJsZWQoKTogMTI4LCBub25f
YmxvY2s6IDAsIHBpZDogMzYxNiwNCj4gbmFtZToga3dvcmtlci91MTc6Mw0KPiA+ICAgICBwcmVl
bXB0X2NvdW50OiAxLCBleHBlY3RlZDogMA0KPiA+ICAgICBSQ1UgbmVzdCBkZXB0aDogMCwgZXhw
ZWN0ZWQ6IDANCj4gPiAgICAgSU5GTzogbG9ja2RlcCBpcyB0dXJuZWQgb2ZmLg0KPiA+ICAgICBp
cnEgZXZlbnQgc3RhbXA6IDANCj4gPiAgICAgQ1BVOiAxIFBJRDogMzYxNiBDb21tOiBrd29ya2Vy
L3UxNzozIE5vdCB0YWludGVkIDYuMS44Ny0NCj4gbG9ja2RlcC0xNDEzMy1nMjZlOTMzYWNhNzg1
ICMxDQo+ID4gICAgIEhhcmR3YXJlIG5hbWU6IEdvb2dsZSBDaXJpIHNrdTAvdW5wcm92aXNpb25l
ZCBib2FyZCAoRFQpDQo+ID4gICAgIFdvcmtxdWV1ZTogaW1nc3lzX3J1bm5lciBpbWdzeXNfcnVu
bmVyX2Z1bmMNCj4gPiAgICAgQ2FsbCB0cmFjZToNCj4gPiAgICAgIGR1bXBfYmFja3RyYWNlKzB4
MTAwLzB4MTIwDQo+ID4gICAgICBzaG93X3N0YWNrKzB4MjAvMHgyYw0KPiA+ICAgICAgZHVtcF9z
dGFja19sdmwrMHg4NC8weGI0DQo+ID4gICAgICBkdW1wX3N0YWNrKzB4MTgvMHg0OA0KPiA+ICAg
ICAgX19taWdodF9yZXNjaGVkKzB4MzU0LzB4NGMwDQo+ID4gICAgICBfX21pZ2h0X3NsZWVwKzB4
OTgvMHhlNA0KPiA+ICAgICAgX19wbV9ydW50aW1lX3Jlc3VtZSsweDcwLzB4MTI0DQo+ID4gICAg
ICBjbWRxX21ib3hfc2VuZF9kYXRhKzB4ZTQvMHhiMWMNCj4gPiAgICAgIG1zZ19zdWJtaXQrMHgx
OTQvMHgyZGMNCj4gPiAgICAgIG1ib3hfc2VuZF9tZXNzYWdlKzB4MTkwLzB4MzMwDQo+ID4gICAg
ICBpbWdzeXNfY21kcV9zZW5kdGFzaysweDE2MTgvMHgyMjI0DQo+ID4gICAgICBpbWdzeXNfcnVu
bmVyX2Z1bmMrMHhhYy8weDExYw0KPiA+ICAgICAgcHJvY2Vzc19vbmVfd29yaysweDYzOC8weGY4
NA0KPiA+ICAgICAgd29ya2VyX3RocmVhZCsweDgwOC8weGNkMA0KPiA+ICAgICAga3RocmVhZCsw
eDI0Yy8weDMyNA0KPiA+ICAgICAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjANCj4gPg0KPiA+IFdl
IGZvdW5kIHRoYXQgdGhlcmUgaXMgYSBzcGluX2xvY2tfaXJxc2F2ZSBwcm90ZWN0aW9uIGluDQo+
IG1zZ19zdWJtaXQoKQ0KPiA+IG9mIG1haWxib3guYyBhbmQgaXQgaXMgaW4gdGhlIGF0b21pYyBj
b250ZXh0Lg0KPiA+IFNvIHdoZW4gY21kcSBkcml2ZXIgY2FsbHMgcG1fcnVudGltZV9nZXRfc3lu
YygpIGluDQo+IGNtZHFfbWJveF9zZW5kX2RhdGEoKSwNCj4gPiBpdCB3aWxsIGdldCB0aGlzIEJV
RyByZXBvcnQuDQo+ID4NCj4gPiBUbyBhdm9pZCB1c2luZyBzbGVlcCBpbiBhdG9taWMgY29udGV4
dCwgbW92ZSBwbV9ydW50aW1lX2dldF9zeW5jIHRvDQo+ID4gbWJveF9jaGFuX29wcy0+cG93ZXJf
Z2V0IGFuZCBhbHNvIG1vdmUgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQNCj4gdG8NCj4gPiBt
Ym94X2NoYW5fb3BzLT5wb3dlcl9wdXQuDQo+ID4NCj4gPiBGaXhlczogOGFmZTgxNmIwYzk5ICgi
bWFpbGJveDogbXRrLWNtZHEtbWFpbGJveDogSW1wbGVtZW50IFJ1bnRpbWUNCj4gUE0gd2l0aCBh
dXRvc3VzcGVuZCIpDQo+IA0KPiBDYW4geW91IHBsZWFzZSBzaGFyZSB0aGUgcGF0dGVybiBvZiBt
YWlsYm94IHRyYW5zZmVycyBvbiB5b3VyDQo+IHBsYXRmb3JtPw0KDQpJJ20gbm90IGZhbWlsaWFy
IHdpdGggaW1nc3lzIGRyaXZlciwgc28gSSBwcm92aWRlIHRoZSBtYm94IHRyYW5zZmVyDQpwYXR0
ZXJuIG9mIERSTSBkcml2ZXIgaW4gdGhpcyBzY2VuYXJpbzoNCg0KMS4gbWJveF9yZXF1ZXN0X2No
YW5uZWwoKSBpbiBtdGtfY3J0Yy5jOiBtdGtfY3J0Y19jcmVhdGUoKQ0KICAgIG10a19jcnRjLT5j
bWRxX2NsaWVudC5jbGllbnQuZGV2ID0gbXRrX2NydGMtPm1tc3lzX2RldjsNCiAgICBtdGtfY3J0
Yy0+Y21kcV9jbGllbnQuY2xpZW50LnR4X2Jsb2NrID0gZmFsc2U7DQogICAgbXRrX2NydGMtPmNt
ZHFfY2xpZW50LmNsaWVudC5rbm93c190eGRvbmUgPSB0cnVlOw0KICAgIG10a19jcnRjLT5jbWRx
X2NsaWVudC5jbGllbnQucnhfY2FsbGJhY2sgPSBkZHBfY21kcV9jYjsNCiAgICBtdGtfY3J0Yy0+
Y21kcV9jbGllbnQuY2hhbiA9IG1ib3hfcmVxdWVzdF9jaGFubmVsKCZjbGllbnQsIGkpOw0KDQoy
LiBtYm94X3NlbmRfbWVzc2FnZSgpIGluIG10a19jcnRjLmM6IG10a19jcnRjX3VwZGF0ZV9jb25m
aWcoKQ0KICAgIG1ib3hfZmx1c2goY21kcV9jbGllbnQuY2hhbiwgMjAwMCk7DQogICAgLy8gcHJl
cGFyZSBjbWQgdG8gYSBidWZmZXIgaW4gY21kcV9oYW5kbGUgc3RydWN0dXJlDQogICAgbWJveF9z
ZW5kX21lc3NhZ2UoY21kcV9jbGllbnQuY2hhbiwgY21kcV9oYW5kbGUpOw0KICAgIG1ib3hfY2xp
ZW50X3R4ZG9uZShjbWRxX2NsaWVudC5jaGFuLCAwKTsNCg0KMy4gbWJveF9jaGFuX3JlY2VpdmVk
X2RhdGEoKSBpbiBtdGstY21kcS1tYWlsYm94LmM6IGNtZHFfdGFza19kb25lKCkNCiAgIC8vIFdo
ZW4gQ01EUSBkcml2ZXIgZ2V0IGFuIEdDRSBJUlEgZnJvbSBoYXJkd2FyZSBtZWFucyBhbGwgY21k
IGluDQpjbWQgYnVmZmVyIGFyZSBleGVjdXRlZA0KDQo+IEFzIGluLCBob3cgb2Z0ZW4gYW5kIGxv
bmcgYXJlIHRoZSAiY2hhbm5lbCBpZGxlIiBwZXJpb2RzPyBBbmQgd2hlbg0KPiBhY3RpdmUsIGhv
dyBtYW55IHRyYW5zZmVycy9zZWMgPw0KSXMgdGhlcmUgYW55IGRlYnVnIGxvZ3MgaW4gbWFpbGJv
eCBjYW4gbWVhc3VyZSB0aGlzPw0KDQpUaGlzIG1haWxib3ggY2hhbm5lbCBpcyB1c2UgdG8gY29u
ZmlndXJlIGRpc3BsYXkgaGFyZHdhcmUgaW4gZXZlcnkNClZTWU5DLCBzbyB0aGUgY2hhbm5lbCBp
ZGxlIHBlcmlvZHMgbWF5IGJlIGxlc3MgdGhhbiAxNi42Nm1zLg0KDQpJdCBzaG91bGQgY2FsbCBy
eF9jYWxsYmFjaygpIGJlZm9yZSBWQUNUSVZFLCBidXQgc29tZXRpbWVzIGl0IHdpbGwgYmUNCmRy
b3BwZWQgYnkgbWJveF9mbHVzaCgpIGlmIHRoZSBuZXcgbWVzc2FnZSBpcyBjb21pbmcuDQoNCj4g
SSBzZWUgZXZlcnkgVFggaXMgYWNrZWQgYnkgb25lIFJYIHBhY2tldC4gSG93IGxvbmcgaXMgdGhl
IHR5cGljYWwgZ2FwDQo+IGJldHdlZW4gYSBUWCBhbmQgaXRzIGFjaz8NCg0KVHlwaWNhbCBnYXAg
YmV0d2VlbiBhIFRYIGFuZCBpdHMgYWNrIGlzIGxlc3MgdGhhbiAxNi42Nm1zLg0KDQoNCkknbGwg
YWRkcmVzcyB0byBpbWdzeXMgcGFydCBhZnRlciBjb25maXJtaW5nIHdpdGggaW1nc3lzIG93bmVy
Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQo+IA0KPiBUaGFua3MNCg==

