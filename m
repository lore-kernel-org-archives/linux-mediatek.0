Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86265C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 05:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibaDt4/vLPgi0HA9UZfGtoX97U4ucL3G3c+L7Wpo1l0=; b=2WqL2AT7w/v3G4TaN5YX9A11ve
	T2iBiwBODB7oK0crvH7nw08mwycrnQrwAMiPG8wGGENGDR+4sartx8QkZJf1jFnGSSpDEgHgAEHwY
	fcXL4Qclabwtsg2fZsA+5duxMkSXocSi3O7cj6EvZIdQ55KU4BS4eF0ol+YBbsQUjipp2r+BU7aYO
	gav6aC66wXCN76RWSfq5MWGwRKKJwIb9fuyxh4mKbKqBBtu6SzAqOItG+Y9Mm6ELCVDSmeJGKdk9l
	q8lhmXGEkHYgfXtw7hV77aW4NpZNG4R9NWc1mTf+7eV9wrzS+rDD4WjmwbK1++Df/mDX52ShkYlAN
	nFET8ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv75c-00000003YWf-2ffy;
	Sat, 15 Aug 2026 05:37:52 +0000
Received: from mail-northcentralusazolkn19012051.outbound.protection.outlook.com ([52.103.20.51] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv75a-00000003YW9-1whA
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 05:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlGQc3gtd3KNibjn6nW6hxz0V3IOskz0OZ5ipBp8dWrv38r+hFVpezbPKGneE3U/P9gJkryj3ViRon8eml7Poawb/9dFr4bVLx2EgH+Elz6ltvXsP8f96Xdm+0AU9n+5VO7gLsEB2JOTzAarZU34gOHJlf1mHo8JM44RMnA8C5UJ6OTv6psKsUzY8ksTqDwv6B3R6iRAUA4JmAIJdX//GXZjw+nXQ4P2MAc85+zs50yFex6YlMmDfH2T63JfMQ9jvRD7oUlDIh9tDQ3qxehHtMPZhnHNvVU6EA02XcyKdO7eKVhP7WOKrmRpuKIPRm4SSCQtys/XB3bdb9x5MNzX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibaDt4/vLPgi0HA9UZfGtoX97U4ucL3G3c+L7Wpo1l0=;
 b=g7omjHdsDiCmMTKN5xFlJGSdZP0LVs6YLmLOebPTx9d8VOWUNQD/dWuDF5WyV3aunYLttVdIEmHnFbnbPlw19My0e8jpqp6h2OcUipbZnGBtd3vmqMhPR8AXVVF+CmaZvST5gHhwQIF8AvuEgreeJlic9fdBo/M1vLHMey4PJzFlZRZ/86r9Goz2+qCsiDoq69iRgDxApAr5Iw2RVssT6T2nz85XQA5GDRf5oyKnIj9mSuTSpMu4iO8rPh/YMOEBy8yksVGjy2fsv5mOxv1/3+SU/FGU8Cj1IBimHsAqPTH8sH3QTqZTWX+E+cJozNc4V/wtc6RA8u31E+lJzfXpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibaDt4/vLPgi0HA9UZfGtoX97U4ucL3G3c+L7Wpo1l0=;
 b=K6qMMcJt9EWbS3JzzRPXGt1sJ1QrJ+dN56Xog/Xd5do4LX+cRRan/bWkmbmCBfaWD3EEQEIC7iUZ8FY3i4SmR0WAtvM6PfHxyOsfgCTaC3tVWiUQSPojUqnCf84tS5b42z9ZhoHFEiCb2vVApBtMKz7pLzUD42cWz1p2gYXmOh8PNM19VHjnb+WT0nMaOm0r4WpAqg3u3pPvQo/QYtoczUBHu44sJz/edrPlps8ksbIijt10oi/rT4v4/GEJBWpZxAGHHte5unu2SbxKh3aNpLEYsN76c/vciGPj0GerCgB03M+T149pHw4Ofl1tGRFcd3cWdWlyZVMQ6jIEPK2ysw==
Received: from CH3PR15MB6020.namprd15.prod.outlook.com (2603:10b6:610:156::20)
 by CH6PR15MB174990.namprd15.prod.outlook.com (2603:10b6:610:303::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sat, 15 Aug
 2026 05:37:46 +0000
Received: from CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1]) by CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1%6]) with mapi id 15.21.0315.014; Sat, 15 Aug 2026
 05:37:45 +0000
X-Forwarded-Encrypted: i=1; AHgh+RogCuYZthd7zM4ocHrRB5voXgDSaMYHuxbKxBVDA73KUHjFBm3RfyPfy+GG0ep4oYyo3ZnBKEY3FGhd6gIxWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMkvDIGk7gNFlDD137lesu1Muw1nWUa3TW5g2Vu7rydvabs5Dl
	pSHf2fS95yZmk/6iAvtjgUNaHNfJZo87O718gZhRzPeI8xadVznT/Dy6xn2rOdwAo1Jvf1JSRVb
	xk09Xc3FDRKtsPU6UuRmUBV/yG2jou3s=
X-Received: by 2002:a05:690e:43c5:b0:665:992:8a85 with SMTP id
 956f58d0204a3-66c73ee747emr3118835d50.23.1786771934646; Fri, 14 Aug 2026
 22:32:14 -0700 (PDT)
References: <20260715044431.1207-2-mbc07@live.com> <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
 <CH3PR15MB6020E8912A56105D447332BEC8C82@CH3PR15MB6020.namprd15.prod.outlook.com>
 <a7681525-b5fd-4a34-8ba5-99e79d77a694@nbd.name>
In-Reply-To: <a7681525-b5fd-4a34-8ba5-99e79d77a694@nbd.name>
From: "Mateus B. Cassiano" <mbc07@live.com>
Date: Sat, 15 Aug 2026 01:32:02 -0400
X-Gmail-Original-Message-ID: <CAGsSZgFetjvj69w6MELzMcXyMjD76SQJRey3_UW=SpvR3arSCQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiRcWtFHy4UNYuF5CGkdG_gbNWdnFr8HDgGlno6xciFeW1F9QIWIkDAVw
Message-ID: <CH3PR15MB6020165CC394A8B2FDB1401DC8D92@CH3PR15MB6020.namprd15.prod.outlook.com>
Subject: Re: [PATCH] wifi: mt76: pass LED define via ccflags-y in driver submodules
To: Felix Fietkau <nbd@nbd.name>
Cc: lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DS1PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:8:450::13) To CH3PR15MB6020.namprd15.prod.outlook.com
 (2603:10b6:610:156::20)
X-Microsoft-Original-Message-ID: <CAGsSZgFetjvj69w6MELzMcXyMjD76SQJRey3_UW=SpvR3arSCQ@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR15MB6020:EE_|CH6PR15MB174990:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea16c72-17ea-490e-25ae-08defa8f5510
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|24021099003|15080799012|8060799015|19110799012|51005399006|6090799003|5072599009|25010399006|40105399003|2607281247196008|18061999006|3412199025|440099028|19061999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHJSa1Z2MEZSdzh1SFAvZFlmRTdwMHlrM3lkWStXQldhSHJibjNrNnBJY0I4?=
 =?utf-8?B?dUxGenRrNm9hWHJnc2M0cDhCWkxIa29YWC96OXBiMkJPR2VCWDNEU0VaUXNs?=
 =?utf-8?B?NDUzUThXT3NDN25BOWUzcUtiU040MVY0Zzl2TVRyVTUreEJZVjUvcHU4ZnlG?=
 =?utf-8?B?Q3BRdFlZZWY4UjBmeUVoTmFuL3BFWnBuYWNDNzM4N0ZlRk9lbkVXeE4zOHZD?=
 =?utf-8?B?LzZHa2Y1alM0Qm9KM0Y4NGIwcDczYVJiS2hvNXFpUlpTSGRpVWFVN1loa21u?=
 =?utf-8?B?SW9hbzE4UTlmYWxjSC91ZkhRT1FORys0M01xMUU3Y1NhdTlwM3ZvQW9aYVhE?=
 =?utf-8?B?TVp1UXFScng0MEpXSUpWTTlucW1oKzVkOVZMUDBrMUwyNUp0ZkFBS2dWOE9z?=
 =?utf-8?B?UmlhOGFjVFVSWC92UjVZQ2R5UVBEQ0xrVk9GZ1lBODU0dFhZZ1RCaHduYzhV?=
 =?utf-8?B?L1pDVG12VWNuV212UUZuQmNoN1dSWWFLb1VoNzFISzJmWG1aTUxRKytlWXlr?=
 =?utf-8?B?YjJiSWtDV09QYlQ0Tzd5V2s3RFN0ZXRRdGJwYkFuMXh1dys1MUpGNy9wVHlS?=
 =?utf-8?B?cVdrZmQzOUtRTWtiUk80THBsa3NYNllpaUpDTFIzTE9kVmhNcmFBcSs1SzlR?=
 =?utf-8?B?bkQ3Y3hBV2tGUEU3Y0pHTStrc3MzQ05kM29iZDZrNlJuSDg2Z09YWk44QWJ1?=
 =?utf-8?B?a0FBT1pDYnlhM0oxa3ROKy9TVnhzYVhNVGYvQVEvYXM2QlVUMU02d1drb2RC?=
 =?utf-8?B?ZGFwN0srdlJtSkpJZW1ZeW5yeHUvLzdzTkhLZW4xVVdsRWc1bVR1eGlJaWxs?=
 =?utf-8?B?cFdTRytJWnlUK05rYzU2QUV0bzV0R3BJMG5zd3lxbWdTclFsakJxNG93MjRl?=
 =?utf-8?B?Q2lQVkZxZzhjZndQTmo3KzBuajF1ZHNIaFVtYzNkV08vUFdWeHdOOFFPRk5B?=
 =?utf-8?B?bXIwRVlvNGVYMkRlKzVjRUZyZUhoTlNIbHhCZEx0SlhhRy83OFhRdXUzYkVH?=
 =?utf-8?B?QUZUUlM3bFpBemRNWWlVWnJDMnpGLzBhYXM4VHQyZkJUVFNlTXVOcytvcUht?=
 =?utf-8?B?UklERTlsWXM2MVVDaVZ4RlRsSGhRRDVsbVFWelY3Ynpab1ZPOVM5QWRZQUVv?=
 =?utf-8?B?OVI4UnE1aTBIS25xQVplazV1MjY3cnE5dzR4RUl4YkVxNDh2blc0SVNPOGxk?=
 =?utf-8?B?NU9ySEh1aDNWbEhSbUNTS3R4cmhyQWNMTXJ5MTdCUjhmM1pnZjNFTXRVZEdG?=
 =?utf-8?B?RmR5TFdZalFkdEZ5NGQ2M200b1B3ZHdiS3dLR0IzWVpLN3FPclBZZ2NsbFRo?=
 =?utf-8?B?bFdBMExNK3RGSVA1UUdKYm15OVJmZHFsTFRxK3lrdTdjcGhNaisrQTduckxj?=
 =?utf-8?Q?WWT17CWn0oo4KUZ8vH/aCHapFTCCcLCc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFHN1ByY3FTOHlTWSsxU2RNVFJ4UnpnOFdkT2d2QzFobklBUENqTXBST2ZU?=
 =?utf-8?B?VFlVS3pSVURMM3NvMWRpR29yVVZidGFmNEhjRXFkQVNOcG5OMFB0UXh3bDJN?=
 =?utf-8?B?TVZYcW9yaHVQTGIzM0p0NGpDK0kxczZhQUZ2N3FLdEMxY1QwcnpKUGZON1Qw?=
 =?utf-8?B?ajBPRS9BOUg0dU1obWhTSXBETXN3cnhJMXkza05QR1FvMkRFUWVnM0hDSzNs?=
 =?utf-8?B?SndIMnF3YzlpQWxTL3Z0K3FSYWlOOTNxSVJrbmljWXZrbVBiTjJkeWU4Njd3?=
 =?utf-8?B?QnVZYmNOUzJKTjZxZk5BTUJlTWtiM1J2dUZCV3JuRlZGN21KZ3pZR2xDdTQr?=
 =?utf-8?B?TG5EbTNLOFI2VUVWZkltcDZ2ZUgwZks3eGRhSEFYRmhXQ0dpd2hGOXo0Y0x4?=
 =?utf-8?B?K0JpTHVoYjN5ZUkyRG1IWG5KT1F4bkxncTN1Uzh5SU5YbWx4ZDlRNDJ3Y2hj?=
 =?utf-8?B?TmdxUVkvRzRhUzNUK3FlV1AxditnK0dIRnVEUU1uV0hHMTE2RWc4ZG5kaDM3?=
 =?utf-8?B?MnFQQXRIeDh4MWdldmJOTUdSWE9lLzJIUGErcFI2SWp0dVhCV2xLYk1CcXYz?=
 =?utf-8?B?bU1YVDZYeEtPbGs0cXNxUkhNV0RhRVppZ0F5UWhrYzN0dmhzL2s1bzN3NEd2?=
 =?utf-8?B?cE5CZm9uZ1FDT00xMXNqR2c1N0lvaGVuN2xqS2IxZEZET0xwRU9CMnhEOFZl?=
 =?utf-8?B?aGEwTDVQYkJUd2RGejhPNkhIeVRubnc0YlJXUHhPL1JSY2h3TFpFMzVGZ0ZR?=
 =?utf-8?B?aEMvMWUwSWpIblE2My9ma3ZQWjlnK2ZMRnVyRjBoaThTYnJPcmsyUkhFbVFM?=
 =?utf-8?B?VHp2amtmSDgwTjVNcUtPSkdGUGxENDl5Z2RzSEFaZ1hOTHBjUDdGZUJzeFRl?=
 =?utf-8?B?SEZDeHIwYmNxdUJTLzl1Zkg4bm8xZXVrOVNCU1B3U1BsVkRPQWVYYThiTUE4?=
 =?utf-8?B?cmJuREVySFFpTWlVRTVCQTU2MlRVYWE2a2ZQL05SYkRSbVZYYlZrOWVqZTBl?=
 =?utf-8?B?dzRVdlc3dkQ3Qm5EL2FEYU1SN0xXQk92clVLTnE2aUdHWlphKzZEVVZ4UWpa?=
 =?utf-8?B?M0lFUGFiMGxSWnpRMW81UjlQcEF4bjJObGV6MjhJb0FZZXI2WXBLalZxZW4z?=
 =?utf-8?B?d2FHZE11ajJkTDBsenJqQ0pJc1cyM3l5TUtuaWVHazcrbWVIYmRKL0xkZlRk?=
 =?utf-8?B?bmNZc2hxa3IyaGRWMytLZzZyNFJHMk5vdXVMWFRTTzQ2Qlp5NG84ZVF5aFVQ?=
 =?utf-8?B?NVR6TDd0Q1cxMitVWEQveW5pcFBaL2dWNG9HekhjTHZTMkNDR3pBY3FZSmdu?=
 =?utf-8?B?VVZ5ajYyNkpSS0xNSGRRaWVYR3dPbWMwaWZib01sWlhtNGtkOFM5VUlWZ1FC?=
 =?utf-8?B?bzQxekxGTFNiU2xGWmgzdWVjejVDeExLKzVtekV6NllPYzgxOFB5MVBFNEZa?=
 =?utf-8?B?aFRwM2JRa3RLaG9kSW5uaGg2dUZwNENLeHcybW1SZkJRNk00cWRyRlB0YXI0?=
 =?utf-8?B?K0tvV0ExdGdyd0ltZUZaK3Y2ZnBmK0VrTHNScEIwNVRPaGgyUnowM3NXZytV?=
 =?utf-8?B?Q0g0bFZ4bFlEN2NFOGFlYjhKZ1M0Q3MycXFPOGFsc1BXWHBlZkxiY0ZNb0dK?=
 =?utf-8?B?OHVwV0hYWjlxeEVUMzJlak5LeG1JSHgrTWo5U1hrZGEzYkVkMWVzNzdQdTBJ?=
 =?utf-8?B?MnlFelVTOVVBbkNSME9GbTdYT3RQRENWOERRSXcrQktkRDA2UU0wTlJtNHpp?=
 =?utf-8?B?VGhiK0JJQ2g0OU1XTjU0MHR3R0ExbDM0aThwd2xPRzRib3l1NG5KL1pUUmkv?=
 =?utf-8?Q?ra7xowPps/ezn/QJ6eQZC96e2C4Y1XVaVriGQ=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d4257.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea16c72-17ea-490e-25ae-08defa8f5510
X-MS-Exchange-CrossTenant-AuthSource: CH3PR15MB6020.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 05:37:45.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR15MB174990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_223750_515536_36DE3CAE 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Felix,

> I will apply this to the correct tree later.

May I ask when is later?

This has been broken for about three months now. The fix is a trivial
compile-flag change, has been tested on hardware, has had an upstream
GitHub PR (#1090) open on openwrt/mt76 for two months, and a
downstream GitHub PR (#24333) open on openwrt/openwrt for a month
already.

I have to say, at this point it feels like this isn't going anywhere.
The bottleneck clearly isn't the patch, so what exactly are we waiting
for?

Thanks,
Mateus

Em sex., 31 de jul. de 2026 =C3=A0s 04:13, Felix Fietkau <nbd@nbd.name> esc=
reveu:
>
> On 31.07.26 07:43, Mateus B. Cassiano wrote:
> > Hi,
> >
> > Gentle ping on this patch.
> >
> > The mt7615 change was tested by me, and the mt7996 hunk was also
> > independently confirmed on hardware in the follow-up above.Please don't=
 send mt76 repo patches to the linux-wireless list. This
> belongs purely in the openwrt/mt76 repository, since it is out of tree.
> I will apply this to the correct tree later.
>
> - Felix



--=20
Mateus B. Cassiano
Eng. Computa=C3=A7=C3=A3o - UFMS

