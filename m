Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27441EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtUPhCOGFbWo7hovDsb1vDGGhKo719hagHV1eTFKn9Y=; b=Ldhvtk/74QlaOLh0MVoD5hGk20
	kAxjxo5Kt/3S1yvvfxgKPwVNGjO6kde1HCDuDxr1VgAUCN1sw90G9Gn+Wa0YopkM1Br8nmpldO6qo
	wAaFkgj74hYg4pfDrR4tcadFKe3hozkdLezBAuGQXVByTSHNUJBrp0T4pgPJ/8QQzCj0vQW6bvN33
	N0Q7jQEksNmwAEvX1AnL4FBIf+xdB1CBDpC7Cyhz+geIWP+WzJKa+sKaaHnNI1mj7WI1vvs48vjyU
	285LlfkAOlKXlHFfHeuZFRre8Yw2nn+JfZhXB5SlKSxEzoEYRo1SfvCdYvx6jNjPHZhWe55wzRueo
	jQ1dIE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSd9-00B7DA-08;
	Thu, 20 Jul 2023 12:19:39 +0000
Received: from mail-sgaapc01on20726.outbound.protection.outlook.com ([2a01:111:f400:feab::726] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSd4-00B7BH-2i;
	Thu, 20 Jul 2023 12:19:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMVB5qfac34lGqwAis2a4BDLCDI2/KwwGJBGH9djC57HKxfQmcQCnBOfZhjugC1GhEUPSUIyEFJtpYmgBStr8uqx6hOJb5sIb/N45p8K1DdCtC4HbOjvhciouSzKdHnTBBC/Lai7CdRgHrv/B5SOhHvVBm2uox05PVQnGJwLd6+bMCPRbF1EzfPAuIKYiFf2HweK9by6Mn42YCfUqxNkBMpu6d+cbMvBY9DhaFDf8F7BxDe2deDy6UYEs02KlPvt6PCclgtUtFNMT1FPHLkmRxOWlV57FwTmAhMSRhzwv6kjrohAP1B/uFAL5Avz/ajj1W/Or1JsgmIfsNTzd1xQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtUPhCOGFbWo7hovDsb1vDGGhKo719hagHV1eTFKn9Y=;
 b=hDBrnPUKVMy6bE3AE+WIw4lPT6Uffb4ltwuscGkhGpHpFNLyRMCvqZZj4pqwz7/5wBpTFkPUZ61+l+FuvtBmhX7f7TxA5953eK7/hh+szr15IqX8+ij7qxOlE+LCJ6h/sZSwx1VTC8f2M+7bpTz0LZaZh9Aj9QUGRmpam015BlVMv5UInyfbf2dcf/wXWerEnMbslwC1yRSxytasNZKoKAq8xZ5DhfmBGsBImgqa4otYEzMBpwfoBCO85PY6p1Fd5tztonP10Ufr2k/xYRYVqe3aQP3JwhjdHEw4adHcBHGqaPrAVtvYtLSXBVWFZWONWQkZMjMj0/SysyXFG0DCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtUPhCOGFbWo7hovDsb1vDGGhKo719hagHV1eTFKn9Y=;
 b=WskASjO0RpiWArNxSkxegT/lnAr3zZzk2xF3gw0565kE3ea36vCVV2Z7A86fh84XeYk7TF00sygR9rT2NjM/E2aVyQHSj28I29fLnWDQQF0iwdmFXfyFMqQ+WIVRalRTzsRNC4zqT7GKBptsgphm3VH/CMB/4gdboWp2ww8F6uGkGWv3G13CRuTIQKFUsPpOAEXRd882c2TpBOubWwOO44sd4KL3XkVrJp2fuDAZFrMZb8/hq13BjvtGwKImN9lyf7LDe7BSO7BzSYOckGwDBs6ifWwzja6H8tQO9z2J74Ef3Y6knrdiZd/x5NTniHo1PhqZ5A+pRh3HSawOqV+bKw==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by SEYPR06MB5327.apcprd06.prod.outlook.com (2603:1096:101:6a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 12:19:20 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 12:19:20 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lu
 Hongfei <luhongfei@vivo.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, Arnd Bergmann
	<arnd@arndb.de>, Sun Ke <sunke32@huawei.com>, Deepak R Varma <drv@mailo.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: Re: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Index: Adm7BGixe0bJsA8wrU2evEhrVIy/sg==
Date: Thu, 20 Jul 2023 12:19:19 +0000
Message-ID: <30bf6cc7-615b-52c5-0c23-f8b4be890e5e@vivo.com>
References: <20230720062248.37906-1-luhongfei@vivo.com>
 <32ae3716-672f-cdc2-f246-d8336ed44a68@collabora.com>
In-Reply-To: <32ae3716-672f-cdc2-f246-d8336ed44a68@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|SEYPR06MB5327:EE_
x-ms-office365-filtering-correlation-id: 002b239a-c784-44e4-b266-08db891b8b2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jSKb2e4FuKcmcUJgHNTI458619hMHoD+nf/ImrnZICGItTmnwEhi1AH39cNtyZt3U4byA2bxn8Wt7mmFBMoo4+xcifpbmR6RwwuEt9XqtXcuL+QDMEIEfH8x6txUvg3gkkTTRcrA6NSoUzLMnFzXwTPwlsSn+TkK2OzeiQwAqGerXmyfEFh2cZolTH8Gffw1lEGUCWsT4cQjE1tcEdp1Ai8cD6ajzf+eU5ZC8qlTb9Goc496jYqmB8BF9KupmeaG8qiOnG6zDbuEP7/hy03mp+uQXIi7VNP90U496pTD2ZGhOXD5syMzBogYpF844NX88AleAb5gduHuJ0/XncRTWbw0XUSZu9tnGRDhwUulaXqFkYh1Mjf6u4HR2n+TWX5bkheuNfM1puwBL7fO++QnPd4ZUTHlsmf2qIwLQna7wR2PFlcHxkFKRuqjoM9mNzjVzyzUDA2+y8fJ4VvWYg32Uodx8m0yZXXe7PEYGCkuWasBeZVb34jlpuY0QFO3U1tH+BsE5hV1QR+BM8e9Ahogvgbn5JqiKBB/Rw2aLZBwC4cY+TdJ7tKFvvmPMrnN+iFeZ97ADsxA5yM2bTHgz3rckFIMYl3/ybi/248Nz8KHSj9a7BKr9buHUajtUhm3anFliZo0311uTK3L9QOE9ScNS9aQs5MazjxqR1+pFAC/LQI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(38070700005)(31686004)(31696002)(66446008)(921005)(38100700002)(86362001)(122000001)(36756003)(2906002)(66476007)(8936002)(478600001)(8676002)(7416002)(2616005)(83380400001)(71200400001)(5660300002)(966005)(6512007)(6486002)(107886003)(53546011)(186003)(26005)(6506007)(316002)(4326008)(110136005)(66946007)(76116006)(41300700001)(91956017)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzA3RzNxWFBTKzY4aUdCdFdoOTgvUWVhV0ZrOU11OGZXVG9DcS9Bb2xhcXF3?=
 =?utf-8?B?b1NabkdPUG5GcDgrWEk1bWdiaVVDbUxwbmQrWGlRT1pGa0M5aEx6di9mTGc1?=
 =?utf-8?B?NXpxYzBOMHpuUjFXb1ZMOXBIN2dSMGxDNXN2R0Ywc0FCUnVpaGp5SFB3WFpJ?=
 =?utf-8?B?Yy9TOFBKMzMwUnI3NDdvWjVZcHE5dlRCaEVSd0ZrSkVXOGRtYWRhNEJ2bm5U?=
 =?utf-8?B?SWtQM3B5bXFVOExhRGgraUFmRkx4eEkwaEgycmhNZVVDU2tNaXBmOUlkYWJS?=
 =?utf-8?B?MmRoV3I2OWI2VlNHNlNYOVR1akxGY21XTGpxL081U1BIL2VwT3dhUzBqNXZL?=
 =?utf-8?B?RmdXTVYxRytFNy82dVY3QzlRbCtLYlpqc0JuYXVSSlNrVS9YcitJdlFxT1p0?=
 =?utf-8?B?NEJVdnY1cFJaSi9kZnZRNTNQWFl1TlA4YUh2TVRBQ0w0NXlkaFFJUnRYR2hD?=
 =?utf-8?B?NVBXeWlTK3NQVlVQMDFQanhrOUtvamp1UjVLVWY0ZVhIclRZTnZKLzNHVHlD?=
 =?utf-8?B?ekRic0RiZzN6OCtvNmpNdEV1c1BPWkNqTktVSzcvaDhXOTYyT1Baa3V5ajha?=
 =?utf-8?B?MFZMWXEyUmZHcnQ0bk5VbFZoeWErcU9FOUo3eDgvVEdXM0dUOWcvS1lLMjVS?=
 =?utf-8?B?azdNS094VklOVWVlZEhUanZhQmZBQ3pqL2dJVG9JSXdrRmlaaXBhaTk2WDNY?=
 =?utf-8?B?WmQ3TUFzNlA5eDROSTZDaGNKblAyTnI0aDVYSUJmNmYyTytVaXFpYmVLYnM5?=
 =?utf-8?B?dEZwakFSMDJhMWpRemM4STg5c1ZwVGdVaG91SGxWdDBKNU5xRVBhM0ZyR2o1?=
 =?utf-8?B?WFVRejA4c2ZBV0t4c2g5Njh3Yk5ISFloYWlGdUMveHJqSGJpL01YMXBONTFs?=
 =?utf-8?B?U0k1dExkalBTdHFFc0ttaldJR0F2YUdqcTdsMU5JNjgwQm9pMldROGhOYVNn?=
 =?utf-8?B?ZzQyV2VLampsZnF5M0V6U0hHd3lyenBLbk01eWY2eks1ZjdtSXBYQTJYZEJR?=
 =?utf-8?B?UXd1ajhMc0Jmb1V1VG5DbW92MGZ0K0RmamVVNkdSTFJKcVdROFp1Y0NMNkQz?=
 =?utf-8?B?UkwrdkNXai9VMklLeWJhNkY1VXoxN2dlbFlNaEVLWGNFR2xLV2hhZVpaVE5W?=
 =?utf-8?B?VTFJRlJSNC9zbnZVbWVQejEzdDdzd1NBaGN2T1ZNdm8rbWFXcFc0bC9NK1Bl?=
 =?utf-8?B?S28rdzZ1SDUrM09MeG9KQ0pESExBL1k4TEgxMDRpYm1LWS9pRlFqbXhtUEZH?=
 =?utf-8?B?a3dweGx0dlZNSUdTMGtmdG9oWWw4djRVcmx1QkZjZ1FkUVIwZEpzQVF3cVFX?=
 =?utf-8?B?bmVkQXZHOGJ4RFpZSHN5SmtMUkY1YzNIZm56S2R1L1hJLy9rdzhQd1ZiN2JT?=
 =?utf-8?B?NysxVWZObDdGU2hIME1GVHhqRUZZRkJ4eDllYzVzRkJIWUpuYWpwOFh2WHk2?=
 =?utf-8?B?SERHdS9ZWEZjL0hUdGczcnJscHJjcTA1YXR0aGpWY21JVFkvbGF4cmdDNEZB?=
 =?utf-8?B?aEpTUzBXZTNBTDJyU0x1WUZVZ1l0dzcxeXg5aWlHbmdTQ3Q4dUlYTGVDR2FF?=
 =?utf-8?B?WmczZGJNTzU1bDdzVjBNVHBWem1GSGozNEV6UzJjem1qeHdTeXNNR2N5S0wr?=
 =?utf-8?B?S1BZd3Z6dHIrbURncWZFbnBQSUtybUVsbEREZmxnQ2RRVXR6bVBhTUQrZncx?=
 =?utf-8?B?bnNnREM0RW5RaUNvNVpUay9iZXVOZ2MybUNtd05jeWdVN3J3WXd3cS8rNisv?=
 =?utf-8?B?ZzJLYlg5dzNQR1lZTHBpUWt4ZXpraVlrc2lnOGloTlhXZy9BVW5IL3ArbndS?=
 =?utf-8?B?UE9JME96RWpxMElTcVl4YTZzT2VnSVdDWjRYQWMrZDlScWRRR0tKaWs0emlY?=
 =?utf-8?B?TGN2VnVMaXladEpvSVp6RnlCeU1BVllsK2ZBSVFZQ3E3RlFFanJKOFAyY1Bh?=
 =?utf-8?B?SCszb2liOEJXQnpvTGdJL2txb1ZKdlY1THV1Y2lDSklpRlAzdktSM0FQTGIw?=
 =?utf-8?B?Z0ExV0ZBcFdCYjhTZXVNOVJnT3JYb2NkbDNDQ1VFcGFQVUExaVJ6SytLZVls?=
 =?utf-8?B?L2cwdUZVWjBMZ3l1Um1Jcm9nTDFrcTBwNDRUblIrWHlLK1JaVVhONjlFbVBV?=
 =?utf-8?Q?bp1c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DE8AFC7199C604BB508C8630E1760E9@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002b239a-c784-44e4-b266-08db891b8b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 12:19:19.4990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9s7W4AAo65sKl81Rc77/mRyEue0QkCjU65LxQHeWTiZX1pvTEKPgTqySjRvSS34WBubxGqVt66VFYfNY1xY7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_051934_903189_0D662E20 
X-CRM114-Status: GOOD (  16.84  )
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

T24gMjAyMy83LzIwIDE1OjUxLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4g
W1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVt
YWlsIGZyb20gDQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbS4gTGVh
cm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IA0KPiBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0
U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBJbCAyMC8wNy8yMyAwODoyMywgTHUgSG9uZ2Zl
aSBoYSBzY3JpdHRvOg0KPj4gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBzaG91bGQgaGF2ZSBvZl9u
b2RlX3B1dCgpDQo+PiBpbiBlcnJvciBwYXRoIGF2b2lkIHJlc291cmNlIGxlYWtzLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEx1IEhvbmdmZWkgPGx1aG9uZ2ZlaUB2aXZvLmNvbT4NCj4+IC0tLQ0K
Pj4gQ2hhbmdlbG9nOg0KPj4gdjEtPnYyOg0KPj4gMS4gQ2hhbmdlIHRoZSBzdWJqZWN0IGxpbmUg
b2YgdGhpcyBwYXRjaCB0byBpbmNsdWRlIGRyaXZlciBuYW1lLg0KPj4gMi4gUmVtb3ZlIHRoZSB1
bm5lZWRlZCBvZl9ub2RlX3B1dC4NCj4+DQo+PiDCoCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jIHwgMSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuYyANCj4+IGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuYw0KPj4gaW5kZXggYTYwNWU4MGM3ZGMz
Li40MGM0Yjc5YTUwOTAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jDQo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jDQo+PiBAQCAtMTEzNSw2ICsxMTM1LDcg
QEAgaW50IG1kcF9jb21wX2NvbmZpZyhzdHJ1Y3QgbWRwX2RldiAqbWRwKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcCA9IG1kcF9jb21wX2NyZWF0ZShtZHAsIG5vZGUsIGlkKTsN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoY29tcCkpIHsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJSKGNv
bXApOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Zfbm9k
ZV9wdXQobm9kZSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBlcnJfaW5pdF9jb21wczsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0N
Cj4+DQo+DQo+IEluIGNhc2UgbWRwX2NvbXBfc3ViX2NyZWF0ZSgpIGZhaWxzLCB3ZSBzdGlsbCB3
YW50IHRvIGRlY3JlYXNlIHRoZSANCj4gcmVmY291bnQNCj4gb2YgYG5vZGVgLi4uLg0KPg0KPiAu
Li5zbywganVzdCBjYWxsIG9mX25vZGVfcHV0KG5vZGUpIGp1c3Qgb25jZSwgYXQgdGhlIGVycl9p
bml0X2NvbXBzIA0KPiBsYWJlbC4NCj4NCj4gZXJyX2luaXRfY29tcHM6DQo+IMKgwqDCoMKgwqDC
oCBtZHBfY29tcF9kZXN0cm95KG1kcCk7DQo+IMKgwqDCoMKgwqDCoCBvZl9ub2RlX3B1dChub2Rl
KTsNCj4gwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+DQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0K
DQptZHBfY29tcF9zdWJfY3JlYXRlKCkgZXhlY3V0ZXMgYWZ0ZXIgZm9yX2VhY2hfY2hpbGRfb2Zf
bm9kZSBsb29wIGVuZHMuDQoNClRoZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlIGxvb3AgZW5kZWQs
IG5vZGUgPT0gTlVMTCBhbmQgdGhlcmUgaXMgbm90aGluZyANCnRvIHB1dC4NCg0KU28gSSBkb24n
dCB0aGluayBpdCdzIG5lY2Vzc2FyeSB0byBkZWNyZWFzZSB0aGUgcmVmY291bnQgb2YgYG5vZGVg
IGFnYWluIA0Kd2hlbg0KDQptZHBfY29tcF9zdWJfY3JlYXRlKCkgZmFpbHMuDQoNCk9yIHlvdSBj
b3VsZCBmdXJ0aGVyIGV4cGxhaW4gdGhlIHJlYXNvbiBmb3IgZG9pbmcgc28uDQoNCk1CUiwNCg0K
SG9uZ2ZlaQ0KDQoNCg==

