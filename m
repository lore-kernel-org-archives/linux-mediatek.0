Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D4C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSAC7BrVYK/C2RXG/RBrY9/azDKAi/htfyKc5mq7vX8=; b=0PT9Kj1ZsEZUtsdVUCuWSdXDgN
	9fvx6mIxU2gTO5MgeYqkKSbWV1fLAcSIl9oUgcEML7Pz1NKxd0MFIlWMHfT+T9YX1yt2/UKt+MXVe
	3QUMCd2KqxEv9jAoU7U74now3LVW5gw1SGwiw9c6497EP6hkSJrW79MlnQzLPRNb7CaqJsIlWWi8q
	4Mtgf2RIddfZSrlQL3JattswAGGgXkVGvnknlx0fwSXHVnXk9rGu+BFCNRvUi6+y5OvcfRUyOTTep
	GeB5veRzB4Bk//1qrA+4glWPiPZRHTxIwKRzHiHHi0iPFiAIUv9ywTApobujiE7DfrZIClrPJYH9D
	/mQ+7leA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWS-002tGh-Nk; Mon, 30 Jan 2023 09:32:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQQO-002psb-He
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 09:26:09 +0000
X-UUID: 19ac6e84a08011eda08d4d6090ec5a5c-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cSAC7BrVYK/C2RXG/RBrY9/azDKAi/htfyKc5mq7vX8=;
	b=l2s1LwfWIm8hXk8s7/FHWh7GJ+OMvcHunoVa+BbgsEOSMx4JIbyU/3FsG2dYwVOXaA7XSVgUvd4yy2NQ0UpjAiyzywKsKNeJgaCfDB4PgbvBHsEshmlUcG58mcwuwBiU67xrQcfOQRv559ahKSfKNB88GoeQxi14Gn9eZ7aDhnY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:8935121a-31d2-4df0-aef7-75f6fe073038,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:fa5ce7f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 19ac6e84a08011eda08d4d6090ec5a5c-20230130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 980749492; Mon, 30 Jan 2023 02:25:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 30 Jan 2023 17:25:54 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 30 Jan 2023 17:25:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU1EJhmPMCtXuV2HFDMVJyq98ljDvA6MN8ZxTAi+ipT6WuCh3DMoVJR4lj3ZWluawm+NXCvMNFhzDtGYh6bule7ilXYNii3HyqCmFWuVM0Ur2FOmMAHG9mjgF+cudoHZynSZavBHnrPhHvIYDdpCtFoG4OSGLbyxbJHUPGnVSumiW3Ghlo9H8rsYsjKVxdDbFGYvbqJkYlK+YVPz4OA0KZBffsuK7sHQFKqh9+JxJ4SuHBarufyBYNutdnDVi1Bo5Ny/TGi7u6m8Rjvgy2uOs3SbSg2jHYtpasgbFGbaDDUrMOEVU6gjt7knyR2Qf8A5sqHbMGtg+TAB+t7D5AQIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSAC7BrVYK/C2RXG/RBrY9/azDKAi/htfyKc5mq7vX8=;
 b=fmdMwbfExfyJiAKzf/p7AHB27WD4yLCX7yj7Msyk7tm3dWBgvVf941shu9KIW7WP9St0p2otX0TQHiGJia2//XuEuZHzg/UOciPUVkxYRf6dt8g3TqSZuy3KWwHPaZdZEFNssPHAd9wJx2hOlW6kXKcDbwmo7zd/lW1WJYoar+LedazCtv/Lt+o6nplyj75UjWAKkropgiQ++4Mq9iwp0NtzSydFr0DdHKie5y5ROk1/ecClDV9Bq5JEiwYIJwUJt0l/x9g1p7yQP3F4NDVNoZb+o4ikDU7dfj76QuZpi/JZYS0+eirr1lqXZokCWccf6KQubvFPV4W1KlYSmxkr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSAC7BrVYK/C2RXG/RBrY9/azDKAi/htfyKc5mq7vX8=;
 b=VLhQy+7wdPlkDmUKeYvY7WwLK/ApokjZN0cGm0rvdf7Aqi3uFphXSvnHBe5nqfnjTbS+NUevW0IZVPgXH1tZenWKJ1ZYqKKT/nt3sIX1LeSYK+R25sirlwmYeU2evogvlMNUjO8meMoZ+dQFNCEgjZhBLu607soMRjVKwaN0Swk=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by SI2PR03MB5659.apcprd03.prod.outlook.com (2603:1096:4:15e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:25:52 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::2ad4:ba34:1089:fc39]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::2ad4:ba34:1089:fc39%4]) with mapi id 15.20.6043.028; Mon, 30 Jan 2023
 09:25:52 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "error27@gmail.com" <error27@gmail.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] ASoC: mediatek: mt8188: support etdm in platform
 driver
Thread-Topic: [bug report] ASoC: mediatek: mt8188: support etdm in platform
 driver
Thread-Index: AQHZMLaNbJKt2CxKSkytZPUwYIwyyK62uEEA
Date: Mon, 30 Jan 2023 09:25:52 +0000
Message-ID: <8260fa7da639c118ec6757e6d3e25320924dcbca.camel@mediatek.com>
References: <Y9EdBg641tJDDrt/@kili>
In-Reply-To: <Y9EdBg641tJDDrt/@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|SI2PR03MB5659:EE_
x-ms-office365-filtering-correlation-id: 3086732b-9f6a-48b9-42af-08db02a3fb58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2W6FqmgahY3MNtqo2eHNQjpGh+DGWOY3/JQqT+YwbsRCRbDNdp8LttYMuJob5fsfx5tB4ZhDwK6DwP3xw3axSKJOXjxGkpVzQWBuvYukGe8Msfsxcx6QJN2ZjZJZS4/mUVdg41Fw2WR8UjIn6HoESxZC7CDNwXj4xzfg9IiaQCVn4ZkNeAjFGygio4JxKr7ztbqnZbkjVg5rPeS3ngMtFHvh8YgKWOWeAJqr37f4S/Tdndq8c9gvZFtS1VvBIL5T7CXHMZhMJx6c85cQrJKUkYX2SRt3SSNQYC6GP6iQfht6Kp0q4NVjyziDJE3t7HH2grd0IK8VxiKPBPNvfRKtVIyjNQH9khNYS6PoYyEnPVWTP2vGHk7h/0AHP9Mg9TesIu0nuiZu1DajbKKCe9qnVPgqMIyO6fAyROdr7ATJop/vSogdyJ+Ix50hwm+YqvJmd17EZnsuKrlYgKnv0JmNhUmkItq6aMvqQNsHSf8owh1wH1hxMLHS6cqOz7L7AWZGt9oT92XduIeEh9pKpyR8r/zxX05KDgCDmJzxQVtAw/7QaOBJWLmRVdG3krdCJD2Lk2f9Ic8HsNsSFY4Etn5+raZ0XkhmalBFUoHOiFiVdahY4Im5/QgcxEdSVwdqW4a+yaNiOUhpC3TKhw5JE7b54n9l1T/mcYtOZ6ZFV2IWfVs7stH024uziLAJ4vCJvG+YpIxs1GiRdf8sGnBWSoH4ovs05xdMkdJzZ1n0YCltNHI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(83380400001)(38070700005)(2616005)(86362001)(122000001)(38100700002)(2906002)(85182001)(36756003)(71200400001)(6506007)(26005)(186003)(6512007)(478600001)(8676002)(66476007)(6916009)(66446008)(64756008)(66556008)(8936002)(4326008)(91956017)(41300700001)(76116006)(66946007)(6486002)(5660300002)(316002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDZYclZWck82Y0JIN2JNYnNGcWhHMm9SK2I5OHpVa2hMMklXTld2OXR0cWw2?=
 =?utf-8?B?c0RTL09KWjFhQzUyRGN0V1c3V0Rpc1RFMFp1RkJkZ205SDBmUVY5OXROREVH?=
 =?utf-8?B?QVdOVXcxRXl5T05GQ3FHbTFaNmUyN2lpdytXM21zajZpdlpyY0wyZFJ0Zmdr?=
 =?utf-8?B?V25PdkJmenN1RGZHVWZxK1BGNkVUUmRRK0FxVG9nM0tuSzdYdSsyWFJHNmdU?=
 =?utf-8?B?RDRPNXkrNGFaMW1ZcERFaFdGclUyZHVocmJoUWpiM1FsN25aTkVhV0kzUXF3?=
 =?utf-8?B?dEg5bDJGWExFMWNkM0w5QmZ6Lzh4bWUrSDNiOS9tbUtSZVNjZ21kVENFWkVO?=
 =?utf-8?B?Rm5xUVJiQVVTbVU5UCtOUERHR2FwVUxUd3lGQ0J3T1VTclpIdG1oR0Uyb0F2?=
 =?utf-8?B?VXAxdCtIa3ladzFCZDJMV0d3Q25hZ0IybkdwVm0wcFJXSTk2TnkwWndoaGZ4?=
 =?utf-8?B?QjNiMEhsSG5sM2M2UFVwM1AxSllFbjZjb3ZqYmxyTk52QnBsNFIraS9ZK1hs?=
 =?utf-8?B?TXg0TnJ5eGR2WjJaOXA1SHV2Z0E4K29CUVU5WDFuTVNtTTc1cnhJdnlZbzhr?=
 =?utf-8?B?Ynkra0s4SmpBWG14Q29VSXdwM2JBNHlrSEtCNk9oQXQrMGJkeW9qWFdlcHds?=
 =?utf-8?B?TTRwWjlxdXFtWDl6Y1FxZWFWZDF0SnZ3Zm5hMDNaQ0lrWGV2ZHo4aXFPWmNy?=
 =?utf-8?B?SkFvcTBvaFArbUEyMCtVVkllOHF3aW0rWnpmREhpZW9YYnVEMFVYcE4rc0p3?=
 =?utf-8?B?MHNzRmhiWTRqbDBFbUZVY0JNUGtZNlphTlN5V1dIcnc5eGplcElYVlRnQmdL?=
 =?utf-8?B?ajBaaFVQcWEzenhmaFJmMXpDRURtTDdObGcrVkhYLzNPajBUVWEvSzF5UUxw?=
 =?utf-8?B?bjVFbGZ0UEVGbk5DUU51d2xqT0d2ZFFpYTNoZnRINWludHFpOWVJa1pmNm1X?=
 =?utf-8?B?M0N1bnQ1QW9wNHg4Y0FKMGlVUmk0YnhWMzYydHNURTVKdm94Zi9XdGxIWm9x?=
 =?utf-8?B?SElnWjc5cDNOSzNrZmIwMjJ5dW1hSFVKakRHSWNYTHpjNmhnWE91RWxLMStn?=
 =?utf-8?B?NVdzUVkzaG16cGNvM3BHWW5GREpTeUFMODV1aUtycW5HblJsWHc2WkE1ODVv?=
 =?utf-8?B?dFNHeTJGckFyeVVheGhabWhjRlhuc0FEOEZGa25hdklpczZtMDdQdmV3U3VD?=
 =?utf-8?B?WDA3VnY0Y20wQnVqMGovLzRUUnB4UXB4VTM4K3NlTFFSNmtLM3FGZGREZU9v?=
 =?utf-8?B?eENPRmI2bisxY0NOSDJ1a1N3N2xXWmd1R243UWJGMzkwSG1lZlpRVkREaE83?=
 =?utf-8?B?bEwxTmx5c2FHR280SFkvRSt1YldzUDduUkswbkJTTTVGdTIyUjEwM1Y1S3BN?=
 =?utf-8?B?L29rOXI2aUpOUU1DSHlLOHVydy9IQ053L0czczRDS1E0dGNJY0d6ZW9CSVBW?=
 =?utf-8?B?dit1ZCtFWkNCdkhlWDVyN0FMNmlPT25kYTRrQXBVNnY0R1RkV3AySG95UlEr?=
 =?utf-8?B?VzVpSDhrR1E3VXhBekVLRi90N1lvT01objRPRFB0MGN5Q0Fsa0lnTUp1cklK?=
 =?utf-8?B?WGxJUkVuSUhoRFkzOXdhMUZ3UTdJUXM0bXBKV3lFeDBlVlJmLy9OdFRKMmp3?=
 =?utf-8?B?WW94MVhLNjdHVWNrOWNmNW5QT1BzTVNrcjJhWkFCZWdOYy94eDdlendYcGFw?=
 =?utf-8?B?RlZ4MVhwUnhzS2lVVFNaTW5rWFNCeHdMQUpKNENsMGtSb2d1N0lJWlNVbEJH?=
 =?utf-8?B?RUtrTDZwb2ZBYm5KcWtCWjJjREFnU05iSHErMGhQbHZDR2hRbmhVcGlyemgw?=
 =?utf-8?B?QTI5dWZKVHBnazFHOHpGbnZBcHlzcVRPNXBsYVJKRjQrbElwOTczV0k1Q3Vv?=
 =?utf-8?B?dHRWWTl0b3lWQUFRa2xzb2R2ZTZYcktMSE9lN3g4V2x0ZWxocFhYOWk5TTlx?=
 =?utf-8?B?OGR3dHdCVS82Uk5uNFFTdDlKMlZWNk9MMFpsN2VDaGRIS0JLbVFmYVExejRC?=
 =?utf-8?B?bmJBUnVMbXFFNWdvcUhWVGhSVXpHTitrUkxhUzVCOGswSlVPLy9oaGxaRjZJ?=
 =?utf-8?B?ZG5DKytJaGZCc1gyNUVwaFRKRTRsWG9TeXErTXUvb0hVbTZYb1o0WExMN3N1?=
 =?utf-8?B?ZjN2NTBReHFOR0NhcDJ0ZFYzSXg0Q3Z3Y2o5cFZkcjlGZkJuUkJXcGExSU5j?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BC27FC230F6A04DB294C19CF6A4AA13@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3086732b-9f6a-48b9-42af-08db02a3fb58
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 09:25:52.2691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: er3fH9WTIXZPfzQ2Jpkn2hTnSfyr1NiD5bwpL8UpcOrvQHRiHygEna0X3/+HllJoLTFsqz7PudGvDQSfj7pfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5659
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_012604_646768_77392DA5 
X-CRM114-Status: GOOD (  22.54  )
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

SGkgRGFuLA0KDQpUaGFuayB5b3UgZm9yIGNhdGNoaW5nIHRoYXQuDQpJIGRpZG4ndCBub3RpY2Ug
dGhhdCBzbnByaW50ZigpIG5ldmVyIHJldHVybnMgYSBuZWdhdGl2ZSB2YWx1ZSBpbg0Ka2VybmVs
IGNvZGUuDQpJdCBpcyBwb3NzaWJsZSB0aGF0IEkgbWlzdW5kZXJzdG9vZCB0aGUgY292ZXJpdHkg
ZXJyb3IgbWVzc2FnZSwgYnV0IEkNCmNhbid0IGZpbmQgdGhlIG9yaWdpbmFsIGNvdmVyaXR5IHNj
YW4gcmVzdWx0Lg0KDQpJZiBJIGp1c3QgcmVtb3ZlIHRoZSBkZWFkIGNvZGUsIGNvdmVyaXR5IHdp
bGwgcmVwb3J0IHNvbWUgZXJyb3JzIGluIHRoZQ0KZnV0dXJlLg0KQXMgYSByZXN1bHQsIEkgcHJl
ZmVyIHRvIGtlZXAgdGhlIGxpbmUgYW5kIGFkZCBhbm90aGVyIGNoZWNrICJyZXQgPj0NCnNpemVv
Zihwcm9wKSIsIHNvIHRoYXQgd2UgY2FuIGF2b2lkIHRoZSBwcm9ibGVtIHJlcG9ydGVkIGJ5IGNv
dmVyaXR5DQphbmQgU21hdGNoLg0KDQoNClRoYW5rcywNClRyZXZvcg0KDQoNCk9uIFdlZCwgMjAy
My0wMS0yNSBhdCAxNToxMyArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gVHJl
dm9yIFd1LA0KPiANCj4gVGhlIHBhdGNoIDJiYWJiNDc3NzQ4OTogIkFTb0M6IG1lZGlhdGVrOiBt
dDgxODg6IHN1cHBvcnQgZXRkbSBpbg0KPiBwbGF0Zm9ybSBkcml2ZXIiIGZyb20gSmFuIDE2LCAy
MDIzLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaA0KPiBzdGF0aWMgY2hlY2tlciB3YXJu
aW5nOg0KPiANCj4gCXNvdW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LWRhaS1ldGRtLmM6
MjQ4Nw0KPiBtdDgxODhfZGFpX2V0ZG1fcGFyc2Vfb2YoKQ0KPiAJd2FybjogJ3JldCcgcmV0dXJu
ZWQgZnJvbSBzbnByaW50ZigpIG1pZ2h0IGJlIGxhcmdlciB0aGFuIDQ4DQo+IA0KPiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTg4L210ODE4OC1kYWktZXRkbS5jDQo+ICAgICAyNDU1IHN0YXRpYyB2
b2lkIG10ODE4OF9kYWlfZXRkbV9wYXJzZV9vZihzdHJ1Y3QgbXRrX2Jhc2VfYWZlDQo+ICphZmUp
DQo+ICAgICAyNDU2IHsNCj4gICAgIDI0NTcgICAgICAgICBjb25zdCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm9mX25vZGUgPSBhZmUtPmRldi0NCj4gPm9mX25vZGU7DQo+ICAgICAyNDU4ICAgICAgICAg
c3RydWN0IG10ODE4OF9hZmVfcHJpdmF0ZSAqYWZlX3ByaXYgPSBhZmUtDQo+ID5wbGF0Zm9ybV9w
cml2Ow0KPiAgICAgMjQ1OSAgICAgICAgIHN0cnVjdCBtdGtfZGFpX2V0ZG1fcHJpdiAqZXRkbV9k
YXRhOw0KPiAgICAgMjQ2MCAgICAgICAgIGNoYXIgcHJvcFs0OF07DQo+ICAgICAyNDYxICAgICAg
ICAgdTggZGlzYWJsZV9jaG5bTVQ4MTg4X0VURE1fTUFYX0NIQU5ORUxTXTsNCj4gICAgIDI0NjIg
ICAgICAgICBpbnQgbWF4X2NobiA9IE1UODE4OF9FVERNX01BWF9DSEFOTkVMUzsNCj4gICAgIDI0
NjMgICAgICAgICB1bnNpZ25lZCBpbnQgc3luY19pZDsNCj4gICAgIDI0NjQgICAgICAgICB1MzIg
c2VsOw0KPiAgICAgMjQ2NSAgICAgICAgIGludCByZXQ7DQo+ICAgICAyNDY2ICAgICAgICAgaW50
IGRhaV9pZDsNCj4gICAgIDI0NjcgICAgICAgICBpbnQgaSwgajsNCj4gICAgIDI0NjggICAgICAg
ICBzdHJ1Y3Qgew0KPiAgICAgMjQ2OSAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZTsN
Cj4gICAgIDI0NzAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBzeW5jX2lkOw0K
PiAgICAgMjQ3MSAgICAgICAgIH0gb2ZfYWZlX2V0ZG1zW01UODE4OF9BRkVfSU9fRVRETV9OVU1d
ID0gew0KPiAgICAgMjQ3MiAgICAgICAgICAgICAgICAgeyJldGRtLWluMSIsIEVURE1fU1lOQ19G
Uk9NX0lOMX0sDQo+ICAgICAyNDczICAgICAgICAgICAgICAgICB7ImV0ZG0taW4yIiwgRVRETV9T
WU5DX0ZST01fSU4yfSwNCj4gICAgIDI0NzQgICAgICAgICAgICAgICAgIHsiZXRkbS1vdXQxIiwg
RVRETV9TWU5DX0ZST01fT1VUMX0sDQo+ICAgICAyNDc1ICAgICAgICAgICAgICAgICB7ImV0ZG0t
b3V0MiIsIEVURE1fU1lOQ19GUk9NX09VVDJ9LA0KPiAgICAgMjQ3NiAgICAgICAgICAgICAgICAg
eyJldGRtLW91dDMiLCBFVERNX1NZTkNfRlJPTV9PVVQzfSwNCj4gICAgIDI0NzcgICAgICAgICB9
Ow0KPiAgICAgMjQ3OCANCj4gICAgIDI0NzkgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTVQ4MTg4
X0FGRV9JT19FVERNX05VTTsgaSsrKSB7DQo+ICAgICAyNDgwICAgICAgICAgICAgICAgICBkYWlf
aWQgPSBFVERNX1RPX0RBSV9JRChpKTsNCj4gICAgIDI0ODEgICAgICAgICAgICAgICAgIGV0ZG1f
ZGF0YSA9IGFmZV9wcml2LT5kYWlfcHJpdltkYWlfaWRdOw0KPiAgICAgMjQ4MiANCj4gICAgIDI0
ODMgICAgICAgICAgICAgICAgIHJldCA9IHNucHJpbnRmKHByb3AsIHNpemVvZihwcm9wKSwNCj4g
ICAgIDI0ODQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRlaywlcy1tdWx0
aS1waW4tbW9kZSIsDQo+ICAgICAyNDg1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBv
Zl9hZmVfZXRkbXNbaV0ubmFtZSk7DQo+ICAgICAyNDg2ICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkgew0KPiAtLT4gMjQ4NyAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGFmZS0+
ZGV2LCAiJXMgc25wcmludGYNCj4gZXJyPSVkXG4iLA0KPiAgICAgMjQ4OCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCByZXQpOw0KPiANCj4gDQo+IEkgZ3Vlc3MgdGhl
IHJlYXNvbiBiZWhpbmQgdGhpcyB3YXJuaW5nIGlzIHRoYXQgd2UgY2hlY2tlZCBzb21ldGhpbmcN
Cj4gYnV0DQo+IHdlIGRpZG4ndCBjaGVjayBpZiAicmV0ID49IHNpemVvZihwcm9wKSIgYXMgb25l
IHdvdWxkIG5vcm1hbGx5DQo+IHN1c3BlY3QuDQo+IA0KPiBJbiB1c2VyIHNwYWNlIHNucHJpbnRm
KCkgY2FuIHJldHVybiBuZWdhdGl2ZXMgYnV0IGluIHRoZSBrZXJuZWwgaXQNCj4gbmV2ZXINCj4g
ZG9lcy4gIENoYW5naW5nIHRoYXQgaW4gdGhlIGZ1dHVyZSBpcyBpbXBvc3NpYmxlIGJlY2F1c2Ug
aXQgd291bGQNCj4gaW50cm9kdWNlIGEgdG9uIG9mIHNlY3VyaXR5IGlzc3Vlcywgc28gaXQgbmV2
ZXIgd2lsbC4NCj4gDQo+IEkgZ3Vlc3MgSSBzdWdnZXN0IGp1c3QgcmVtb3ZpbmcgdGhlIGRlYWQg
Y29kZS4NCj4gDQo+ICAgICAyNDg5ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4g
ICAgIDI0OTAgICAgICAgICAgICAgICAgIH0NCj4gICAgIDI0OTEgICAgICAgICAgICAgICAgIGV0
ZG1fZGF0YS0+ZGF0YV9tb2RlID0NCj4gb2ZfcHJvcGVydHlfcmVhZF9ib29sKG9mX25vZGUsIHBy
b3ApOw0KPiAgICAgMjQ5MiANCj4gICAgIDI0OTMgICAgICAgICAgICAgICAgIHJldCA9IHNucHJp
bnRmKHByb3AsIHNpemVvZihwcm9wKSwNCj4gICAgIDI0OTQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJtZWRpYXRlaywlcy1jb3dvcmstc291cmNlIiwNCj4gICAgIDI0OTUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9mX2FmZV9ldGRtc1tpXS5uYW1lKTsNCj4gICAgIDI0
OTYgICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+IA0KPiBTYW1lDQo+IA0KPiAgICAg
MjQ5NyAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGFmZS0+ZGV2LCAiJXMgc25wcmlu
dGYNCj4gZXJyPSVkXG4iLA0KPiAgICAgMjQ5OCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF9fZnVuY19fLCByZXQpOw0KPiAgICAgMjQ5OSAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm47DQo+ICAgICAyNTAwICAgICAgICAgICAgICAgICB9DQo+ICAgICAyNTAxICAgICAgICAg
ICAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihvZl9ub2RlLCBwcm9wLA0KPiAmc2Vs
KTsNCj4gICAgIDI1MDIgICAgICAgICAgICAgICAgIGlmIChyZXQgPT0gMCkgew0KPiAgICAgMjUw
MyAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2VsID49IE1UODE4OF9BRkVfSU9fRVRETV9O
VU0pIHsNCj4gICAgIDI1MDQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJy
KGFmZS0+ZGV2LCAiJXMNCj4gaW52YWxpZCBpZD0lZFxuIiwNCj4gICAgIDI1MDUgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBzZWwpOw0KPiAgICAgMjUw
NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV0ZG1fZGF0YS0+Y293b3JrX3NvdXJj
ZV9pZA0KPiA9IENPV09SS19FVERNX05PTkU7DQo+ICAgICAyNTA3ICAgICAgICAgICAgICAgICAg
ICAgICAgIH0gZWxzZSB7DQo+ICAgICAyNTA4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3luY19pZCA9DQo+IG9mX2FmZV9ldGRtc1tzZWxdLnN5bmNfaWQ7DQo+ICAgICAyNTA5ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXRkbV9kYXRhLT5jb3dvcmtfc291cmNlX2lk
DQo+ID0NCj4gICAgIDI1MTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN5bmNfdG9fZGFpX2lkKHN5bmNfDQo+IGlkKTsNCj4gICAgIDI1MTEgICAgICAgICAgICAgICAg
ICAgICAgICAgfQ0KPiAgICAgMjUxMiAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gICAgIDI1
MTMgICAgICAgICAgICAgICAgICAgICAgICAgZXRkbV9kYXRhLT5jb3dvcmtfc291cmNlX2lkID0N
Cj4gQ09XT1JLX0VURE1fTk9ORTsNCj4gICAgIDI1MTQgICAgICAgICAgICAgICAgIH0NCj4gICAg
IDI1MTUgICAgICAgICB9DQo+ICAgICAyNTE2IA0KPiAgICAgMjUxNyAgICAgICAgIC8qIGV0ZG0g
aW4gb25seSAqLw0KPiAgICAgMjUxOCAgICAgICAgIGZvciAoaSA9IDA7IGkgPCAyOyBpKyspIHsN
Cj4gICAgIDI1MTkgICAgICAgICAgICAgICAgIHJldCA9IHNucHJpbnRmKHByb3AsIHNpemVvZihw
cm9wKSwNCj4gICAgIDI1MjAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRl
aywlcy1jaG4tZGlzYWJsZWQiLA0KPiAgICAgMjUyMSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgb2ZfYWZlX2V0ZG1zW2ldLm5hbWUpOw0KPiAgICAgMjUyMiAgICAgICAgICAgICAgICAg
aWYgKHJldCA8IDApIHsNCj4gDQo+IFNhbWUuDQo+IA0KPiAgICAgMjUyMyAgICAgICAgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGFmZS0+ZGV2LCAiJXMgc25wcmludGYNCj4gZXJyPSVkXG4iLA0K
PiAgICAgMjUyNCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCByZXQp
Ow0KPiAgICAgMjUyNSAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ICAgICAyNTI2
ICAgICAgICAgICAgICAgICB9DQo+ICAgICAyNTI3ICAgICAgICAgICAgICAgICByZXQgPQ0KPiBv
Zl9wcm9wZXJ0eV9yZWFkX3ZhcmlhYmxlX3U4X2FycmF5KG9mX25vZGUsIHByb3AsDQo+ICAgICAy
NTI4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRpcw0KPiBhYmxlX2NobiwNCj4gICAgIDI1MjkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSwNCj4gbWF4X2Nobik7DQo+ICAgICAy
NTMwICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gICAgIDI1MzEgICAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+ICAgICAyNTMyIA0KPiAgICAgMjUzMyAgICAgICAgICAg
ICAgICAgZm9yIChqID0gMDsgaiA8IHJldDsgaisrKSB7DQo+ICAgICAyNTM0ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChkaXNhYmxlX2NobltqXSA+PQ0KPiBNVDgxODhfRVRETV9NQVhfQ0hB
Tk5FTFMpDQo+ICAgICAyNTM1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vy
cihhZmUtPmRldiwgIiVzIFslZF0NCj4gaW52YWxpZCBjaG4gJXVcbiIsDQo+ICAgICAyNTM2ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaiwNCj4gZGlz
YWJsZV9jaG5bal0pOw0KPiAgICAgMjUzNyAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlDQo+
ICAgICAyNTM4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXRkbV9kYXRhLQ0KPiA+
aW5fZGlzYWJsZV9jaFtkaXNhYmxlX2NobltqXV0gPSB0cnVlOw0KPiAgICAgMjUzOSAgICAgICAg
ICAgICAgICAgfQ0KPiAgICAgMjU0MCAgICAgICAgIH0NCj4gICAgIDI1NDEgICAgICAgICBtdDgx
ODhfZXRkbV91cGRhdGVfc3luY19pbmZvKGFmZSk7DQo+ICAgICAyNTQyIH0NCj4gDQo+IHJlZ2Fy
ZHMsDQo+IGRhbiBjYXJwZW50ZXINCg==

