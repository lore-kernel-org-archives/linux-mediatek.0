Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C825C44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovnF6idiY+WnEk/fVXeJf5Dry7yG6KGaaFgFxoKGzm4=; b=BDhr4cYzkfFJVO03y83QNxnZK+
	IhcSHDEmH6oSsT9czZdlv9wTMQjrduLQwu2jQe9JBr9PGy7g1353SZ2OyrGx87wAYGEx0iZQsw5u6
	Hr6xT9mzJeTv0M/db0IQuTKAgwLHtd0nTXLWNjWypOTrJQFmjKkzUtwigIJcF+5hSBvBXIkx2xdPZ
	2b05iY+WJdVH/0Sl8o49FnRh+39hmEL9JavaRV54UaqVLewuil/culNAei3C5tM8ci3IXwHfUPkpL
	mDB5W5qyx6JiWOd4NMsbjH643wwvyWeBCzQ6Q3DLFI3O6prui4AzrQYEf0iIqg2tP7Qhh+40Piu7I
	DeeevfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyge-0000000EmA9-3Fiu;
	Wed, 15 Jul 2026 12:26:04 +0000
Received: from mail-westus2azolkn19012023.outbound.protection.outlook.com ([52.103.10.23] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjygc-0000000Em9M-1Xoy
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 12:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO1TNVyf6lW+3F7m48mDwZduSbYk6EVbgB0AylbAl2WJ2Z8By7RXMqD+Fy4iIFZH5uCUd/JSGet0hcoUn2YK2B6cciegu8pZdW/6rTQSveUWzEjB6FzdlWDexZE5XEEcuddgwpDs1/ZYFNuPGtg4fL4uZust7BFc7OUU+SOIy5xNUqVu7tLLeHpZSVx4tOECzMu1CifG5V8z4U7cJe//NuUVf3OUVw/1V8s5z/ydWDm80Az0LJmEgohLT17YhZ/risMet/pZ8UnC5DOWfxmhHOqe2WKZmcpQpHG+KwpDTjWHrP0ODWcvdzS59ZQoPMbyHKjh4VuaGv4Hs2ulFIZ5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovnF6idiY+WnEk/fVXeJf5Dry7yG6KGaaFgFxoKGzm4=;
 b=bCMx0J0oS8K91GADJehqPKxt9YC5EcV0UTEb2Pd95sV8LRVAbrvvwb0VU9i4QyenMdMe9m6b+OUU0DK9D4Mq7akA0vkLUE8MaSTUsLY0TAyzmJ4tmFfQ0XkdaCWFGkjvg4g7Z3nAKaP5wQ++wOpx+Od0DzZE4dwVa8ctnmH4HkTd8N9HfKRKBRVegxBHFHSUKyseNxmIv/6eRT+o7kEz2WnfnZHla1OpWM7ZwmPGUAUm0m/6ZLiTWWLySmPj4wbOxKQgIYFEU6mFjQwoCylilX3sDLk9dgGfcXhQpUyml9Q9G4tc9ihC5dGp+VdDAhDR+vBw/8r5S/Hmzbr8NHqx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovnF6idiY+WnEk/fVXeJf5Dry7yG6KGaaFgFxoKGzm4=;
 b=e9qeB/g/AsUhNHujbmultJaF/h37iPz3DdBPlqBKv0z4Tv9ph2e9GRZreFpUsEf3OlLIignJskOcbNszUI3eOnYwhozl3NaoAmxAmrwUvFYl6DjUjw5o0pCbIUrQqYvAEdEiO7A5wPv3TwSAVKfbvM23b6zj0YNapadutd0/57Fpd3YCG3PqXG16qyhYiQYfbXySlEjP7UPjl6uWgZuZ4To17+PsBm+s/NZsqWW/SELgavqPWeAFhB4f32HewYt2Sut2fOyWrJGBRU2rmwP7xfy3q2eIYc8BPaDM6Qs8ATBpDmcvd2WZ3Vae4zDp24tCDaDdUCERIXK6s3qgpc8ayg==
Received: from CH3PR15MB6020.namprd15.prod.outlook.com (2603:10b6:610:156::20)
 by CO1PR15MB4905.namprd15.prod.outlook.com (2603:10b6:303:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:25:57 +0000
Received: from CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1]) by CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:25:57 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrRGJaupAyXKWiDAdqJb2gI3DG+KvoaoRWz1JJXBDDLthoa8dPprDybiiKfFDNWJwBZwvpWHedqBjn3UYivVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKx3qmrGoYm224tQciq/Nw3t7M770QgN4ONzsCCwEsl/2Smv4b
	kPqEXnETaNUOjxJOHSDmSXMc6xfNwJbAI8F5KLSBLCrsQ1QxeyqLD0LiGJI1HVfKh5l5T8pcneS
	S3YyXuj0bkumPUBDksI77sv0EfN6vyxI=
X-Received: by 2002:a05:690e:4846:b0:664:db84:ed3d with SMTP id
 956f58d0204a3-667d7ba119dmr8564735d50.34.1784117869457; Wed, 15 Jul 2026
 05:17:49 -0700 (PDT)
References: <20260715044431.1207-2-mbc07@live.com>
In-Reply-To: <20260715044431.1207-2-mbc07@live.com>
From: "Mateus B. Cassiano" <mbc07@live.com>
Date: Wed, 15 Jul 2026 08:17:38 -0400
X-Gmail-Original-Message-ID: <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
X-Gm-Features: AUfX_mxOOoY9ApWBCAUqz59WbsS2BJPtu3vHRvHFhz_-iHIEJl9CYAM8tfkxSs0
Message-ID: <CH3PR15MB60206FBB8BB23F530BC5BB60C8F82@CH3PR15MB6020.namprd15.prod.outlook.com>
Subject: Re: [PATCH] wifi: mt76: pass LED define via ccflags-y in driver submodules
To: nbd@nbd.name
Cc: lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: DS7PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::16) To CH3PR15MB6020.namprd15.prod.outlook.com
 (2603:10b6:610:156::20)
X-Microsoft-Original-Message-ID: <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR15MB6020:EE_|CO1PR15MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 234eeec5-c352-4205-80be-08dee26c387f
X-MS-Exchange-SLBlob-MailProps: zBrA8FKYimgH16ycykJ01TX0wxFqAOtIYhiNbohRJtMwNBliQkLzvs+5fWO7/AQuEbLGjfshje4k1FX+LkPHI5RJQmSsX1M910BUqnnK58aVHNaYfl+RZM85ETogc+goLT9S+i0DE7rWmm+TTYHcSQzTkqAGTKACUVZrp8/hzQcUHv07gTM+dtZ0MzFOT1WsYn7MLDTFnrEsZw54y1ZRN/sfOGGSeWslOVgsNHDtC1scIORydeub0tmS1jd+RlMHuRrUkoeSUjEBoYTjcQzVglfXHEHZGBz6QXPxzvT7XR0NePpZrNKVU29I2NM6PsZeNN/j0hV+ApdZjSfth0r72PKdKEq3twTkPc8hzg+Cc4R49XwWFsMj8DnSY4odcwD0Q558CUTtpTA3ix02lwkrWFEYeQlzyF3J5eUzi0Xsd152EkCTpJFv9HCLVRP0my4SuE1HqwIwS4fHtKQ+oAjcup2CadDP76rr7Ig39hgQBJw6u1kyG2itnZu4Wcp32xZjEEYa2pWGHKiYjH70iFKK096NlGzIznuRSxYvf+OMsQ1qXZjVFez2v+6y228plcTcbyOUtk9HKVqxOB9+BT2tphdHLMVePxv4NoNXPBpdmFSLT7B+A8eOSNVZ00xBcprwB2jz+XIYqcWpnsRrFuNyKp2I6xtx+9nKmKnC3Nl7mqP2pX1Dz7dQGe7HDRBFAYZZ2AF7YEkL/tqAkPDvBjFT8OTymtPl/sAcqxJIjnga9chhKLzGb4zxvuhyZi8+T2Sj5Os83STG8EyL/Zebp52RKHcIIPj3HAL7nf7cl0xQ0DNV9AQRIJJwuw==
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|5072599009|15080799012|25010399006|24021099003|8060799015|23021999003|19110799012|6090799003|3412199025|4302099013|440099028|19061999003|10035399007|40105399003|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0wzWEJKS3RVb2lZcklrZ1dHWHZiSUl2c3ZaNnh3T0tncUIya3ZFWE5mb3h5?=
 =?utf-8?B?MGozS1hsUDI3SHhNaFBGbldlTHMrU1BKdDFacVZkYXNieG1nZ0hBbXN5V3pF?=
 =?utf-8?B?eERtV0JMZmd1aHNmQWk3R0RXcVA5bGtGQndQVDNjZzg3cnFzTVV3MVhCRTRT?=
 =?utf-8?B?d1dNa0ljRFNwdzNxNXJ3QlNyc21hT2RmYzhGZlJsa1FSTjRXd1Q0OW5vQ0Z3?=
 =?utf-8?B?U0JRaHF4ZGpkY2t5VkwwQTA0ZjV3dVZJenpoTWQ3T2VKcUx1MHJETVJoZ3N5?=
 =?utf-8?B?SHF4cnQ0eFkrMHB4c2JJNklFbVVaZTM5bGxEN1NUeVp5TnBNRmNDeE9TVlpH?=
 =?utf-8?B?Z0FoWUNxNnhJdU9iYVAwcEVZaUQxV0tjV1hwY29pcXFndHJXZHhWTG5sN0Nj?=
 =?utf-8?B?R1dtMjlqR3BjL3p3V0xkTnhyWFlZN01EMDFoSUR1WmxUeVdyb0NMd2N0cmh6?=
 =?utf-8?B?bSswd3pSTzdrSDdkYU1Pb3ZTWjhSVjZaMEZkUU1iVHcrVFN4eVRpWnp1N1J3?=
 =?utf-8?B?bFJOOUZpQXZMeStqRythTDBWTUpJUThzRDloUmJWMUdVYnAzKzdsNEU4U0xN?=
 =?utf-8?B?S1dHaXRGdDM4cmJsamRjcDY3azdaaVBoWW1oWjZrcTdaWVpFSmtCL2dJYVA5?=
 =?utf-8?B?bzJKZHN3MnVGR2RlUCtGM2F2SDAvaXF3b3VxQTYxTFo3Q1M4WlNueXp0ZUNV?=
 =?utf-8?B?SEJoVTZKU2tCUWltd0lndkNqRDhDZHg5Rmx4b2lZNW9uNmJlSzJVVDE2M1dy?=
 =?utf-8?B?bXRwWW5URmFGVi8wK0Zkc2VGMzM5NDlCVFA5WWFETW1LYlFQTmRnUVovWVJZ?=
 =?utf-8?B?U1NhbmtDemFLNXZxWjJ0RHQzbmd1VFoyYkFtcHlIdHpqaTJ3aEw2bm15NlZj?=
 =?utf-8?B?VndCbFNNVFhCOUZRS2JTTDg0VnJnMVNkazBnSkpFNWZ3TElsOXZiSDZPY1RS?=
 =?utf-8?B?SmV2Q05XVVFGUGp0allieDZnN2dIZllkNkJCZUpKZmpSV0VqalE3OGxEWi8w?=
 =?utf-8?B?SGcvMW1UZGNkc0hXcEJIVTE4ZXlOZ0RDQUkxbDVPSlRDaGQxNk05U3dNd240?=
 =?utf-8?B?QWM3N3JoVEJvclZJNWlaRzZDLzBVOXpFU1pXcDkwUWdBZ0MvWTJSODNUYlhZ?=
 =?utf-8?B?a3hKNHZpeW9xcTNoSVY4eEx1UUMvMjc2eFgwcVc1R3AvM0phMFliVUE5QTFn?=
 =?utf-8?B?R3VCM1ROTFFPa2NnaTBpbGpMaUx3UVhGaDdFUDBuN1B0eE54b1BiamgweFlt?=
 =?utf-8?B?RlhyZm84ZG5UU1lONkV2QS9JMFdMd2F6VzBkeG5KMGVUbHF6dlRRWk0wajZS?=
 =?utf-8?B?LzFwalkvWUk4eTZXV0k3d01IazdYdHF3Qldnc0ZOaW8vQjVhcDhhZWJ4TndX?=
 =?utf-8?B?WGMySk04RVJ4MUcvMGVweXozaGo1U1FsaTFMYktaZWxLK3N4WjB5WG81Vk55?=
 =?utf-8?B?UFNlL1ZVOXVIaTdLeWpHakltWDRrenlaYWRwREN3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNFT2gycmExamxZZjVhMzdDV0NZUzlCMERZdUVvOGNuZGZYMmFTMC9ndGdj?=
 =?utf-8?B?SndIbDBFbnR3MFVWSGYrV3k1cEdRYyt3eVVpYlVyVEN3NGJ2Wm9DeWdFYTJx?=
 =?utf-8?B?cVlHQ3dNSVRiUUJRbVlZRkRmMXZnSzlGK3AwMGwyaFQyVzl0bmhWWkc3VXBW?=
 =?utf-8?B?dzQ2MXM3dDBNdFRBbmxaQm8rVm53Z1JwbUdKMSsybTVzRnhRS2h4cks4WDZM?=
 =?utf-8?B?VVNxMVUzR3FSQmovb28ybmhRMGVyOWg4cmUyVEMwenRVeDdocDB3QjA1VG5k?=
 =?utf-8?B?cmhDeXE2aXVLcFhhaFc4RnBKL0ZaYTBCQlc3KzlYcStvZ0YrVnlCWGFIU3hN?=
 =?utf-8?B?bDJjd01iR0w1NUhIZGZUdVVXV3JuVXI2U01nTmdqeFFwdW9GRXhpQjhBNVBz?=
 =?utf-8?B?SHZGbDNRd2cxQ2RHcXRJQUtoakl4NVQvZnZxQjVWRnlBRlNPNWNUUFVpbGkz?=
 =?utf-8?B?V24xUmxJTU9rTE12cHdPaW1XQklrRTJ3WWJFS0lwM2FlWFNmYUUxekFqWVJF?=
 =?utf-8?B?SFFTK243WExjTlZnQ000SnFjTlk3Nkh0RE5aZXI0aThBckJYSTU1NkVzQ0s1?=
 =?utf-8?B?VTk2QkZGTFVEbjNucEJ4dlh1c1FxREs0alRTbURSNzN6SXV2RFJqd2JlOWFa?=
 =?utf-8?B?VEdQQ0pacFY2THN4dy91dkhyQlBhc2NyMXFBTFdVSys4N3RESTMySUNIbUxt?=
 =?utf-8?B?YlRPeDF1NXJ5eUoweEs5U0U1bEdlNVV0VDVXNy93ZjdMSU10WG9sMlpVa256?=
 =?utf-8?B?QjZwNitjek9aQm9qdDhHOThKa3RHdTVuZlk3cHJRTHF3eTE4UWpXZ3lFS3FT?=
 =?utf-8?B?TE9ldWhVNjZkR3I5NW5ia0JoNTlXYnlXS2RXeUVtRzJPdHVnSm9FTm1kVlln?=
 =?utf-8?B?MEw5dEVzVXJqNThtYTdkdWJVdzJ5cTBnalNYaXJ1bzcxckxZRGs2RXFjY1ZH?=
 =?utf-8?B?TmxkeU1vdHJNS1pqams2MzdpcEt0QWJ5V3hBZjY2NzJ1WXNzTzR1RzFyRDAy?=
 =?utf-8?B?empQVmJ1YWZtbm1jenhrVFFoSEFQZzVWS1VVTkN2ckQ3ZW1RVHRYZ29lem9j?=
 =?utf-8?B?ZS9TcGl0RFBiUS9QaEpqK0lBdzA3TDgwMDJJeWlicHVjbWsxTjNzWEJNR1l5?=
 =?utf-8?B?TS9hR0ljYm45Qms1N0FiUDMyLytQUlhyNmVINHhpK0VqVHd4OElabHlUNlNV?=
 =?utf-8?B?akRHTjJUOXVnQXZPSkcvcXZybWRBSFZFVStTNngzcHNYeDUrbUk0bmV6TDVT?=
 =?utf-8?B?OURrYUxvN3FrNERVT2pUbEhnUDhiL0FSbjNaaFkvNjFjN25WejVwWnpUa2Nw?=
 =?utf-8?B?RmFsZmFoWWUrMWNESENzb2FQeU9KUGNJclBQMHAzemRhZExUUXJ3dnFQRVor?=
 =?utf-8?B?WnlOQ1grcFFYUC9RVXZBQTJlRkg3cFNkZmZtWC9sMnQ3a2cwVFFVd2ZaRGdW?=
 =?utf-8?B?aUEwcTg3dnpEeDVRT0R5V2RPYnByaXczc2NkUDhFb0srampSRk0wU1hWb2pr?=
 =?utf-8?B?NjE3a1UyZmlTanFYZ0hYQ3JCNzZWcXlUR3lnWFRKeXBVT3lXN1JuekZid0FJ?=
 =?utf-8?B?VXRlTVluY0ZZTVNEdTRaRFZOMVIzNElBaExtUXRMbnRDNEJ0RThYZEMreWg0?=
 =?utf-8?B?dzczQlhRQ1BDamJEVXhaVHYxRUVBVVFxL28yZzlqdVhoQU9WWk1CYXd4VDdJ?=
 =?utf-8?B?S1E4ZFpadjhYbTVqNkdPWWdWVlFNeTNTaGF1emJsMitQR1hGcVNmU012NEor?=
 =?utf-8?B?RW90aTFOV1pGbXl2OFd2S1JVSkZWNENhRExRcFRyOWRIZEkyQjl5OUNIQXU5?=
 =?utf-8?Q?7SEGXTdKF6HRqQV5VYBiY4Ue9QxGy7n3+EvbU=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d4257.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 234eeec5-c352-4205-80be-08dee26c387f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR15MB6020.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:25:57.0070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR15MB4905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_052602_417924_28B674F1 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, 15 Jul 2026 00:44:32 -0400, Mateus B. Cassiano wrote:
> mt7996 in particular enables IS_ENABLED(CONFIG_MT76_LEDS) code paths
> that appear to have never been built with the define before, so it
> would be good if someone with mt7996 hardware could confirm nothing
> regresses. I'm happy to drop the mt7996 hunk and keep only the others
> if preferred.

A user has since confirmed on the closed GitHub PR that the patch also
works as expected on mt7996 hardware:

https://github.com/openwrt/mt76/pull/1090#issuecomment-4979596316
https://forum.banana-pi.org/t/bpi-r4-mt7996-be14-per-band-wifi-7-leds-now-work-incl-mlo/27574/11?u=avbohemen

