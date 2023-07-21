Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1448BC71155
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d16GYNK2ME3I1IkoAjIvpYoAqq25OrecW0k6Zd6hQkc=; b=5Bj/gPr+aAyR3x6JI88wINZLFT
	Xa6j4RPbNXERT3H0WN208YYuOt0MXp5fGCl2+apKkX0yb5p+cCe8pV1x+w2PO0sRE6muHbN4i+s/R
	Qa9E+taQRZCjZwS8jsPsTTrPWADBszNqzxjjkwtZZxz2qPOwBllMoXY32gSzLO29JJ/7ILVFrfAbj
	ptSYJjfGCoFOurTX/oZplUqKAhNhQlj16z1H3zzuCE8yW2W+kVyj0v8/z0g+9zRooJ0hNDLzjLaB+
	5OAK/pUQgRKbnQtnrhANpDUD4iLJs+DT3G83YgqHI/dHBOG3BxPxJeDH0alcWBHhiPkkAiW9vYjcS
	e/yz6XeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX1ti-009d7a-2q;
	Fri, 18 Aug 2023 16:00:27 +0000
Received: from mail-sgaapc01on20725.outbound.protection.outlook.com ([2a01:111:f400:feab::725] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnYz-00Dnvk-2l;
	Fri, 21 Jul 2023 10:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJQA8vC8IWTrMbkcRwcALWFFd8PkkqkmjK77mKYcmi/VvZFzx3jcYmPbxt5E2j3CXIGOj4JMAtA0QeA+U2WH/jDnoXPQVgJpBoWnuWSSuLAlK9tXre5FmFOB/ryLAIZoa3wfRUwt0tPmFpQy9XJdUY/PJZL8IrBKbfeKsvh03NQPgQwStYnLaS+v4qQyM4p0pKbHq+GqAB66i5gHBZyiXjvjWFpF0V5gWddz7hiLJCXrTOC9ft1x+pWs8k2u2Uq5mI5DZnzruJoQqygWZAZ3gIz/mibkPzlOg8gA2AEvYzziy8w+/boZKb48VMiZMOEbtAkdpAbfOFzsQtFTPOHp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d16GYNK2ME3I1IkoAjIvpYoAqq25OrecW0k6Zd6hQkc=;
 b=W4evsPV6QR34QzfROBt+OKLz+bPUKfXTBlXWJvhKhqbqC/USEB4BsUtLz1Ozhh3bUblURFH+LEyxKGTaRumLofB+pS5be4Jf01C6gguLcEn7KwarLH7y2NXsDGsIw/2FPZQLkR7wvWzq6B8ymfdmYxSMq1tGUOEzAJN/EAEwpYJukaNv2ayMLZk5ufeaQdmVCnuRvcN4fiwHtMG2EPHObYwyu/m6glZt9RORlcabgpenqbDrOmKdZ9vRKTT4LWqBlAIpnuoDBS9t4LiWz62M8ErpkYLyLKWyrpWieq161g6xuM8RjBQ6dtPwEL2IPjTNzX6OgE+LAFBgWFUG7iaD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d16GYNK2ME3I1IkoAjIvpYoAqq25OrecW0k6Zd6hQkc=;
 b=Wore3TFslHCcIi9AQRaCR5ZM1kZaa7unUyZUVzEa8O32nTcfKij9YK0tOaBX3kLDS+LKSQBY+1rpHRxPHLJ9rQewrsau6ykhJa3+IOeErruzzOemgugCGCFDXLG+XBiybcDAluscsmg+Skt7YIOERxQbF/f3yeA+DTzoP1uhO9N3Q+nqTVznEPGvJg5NaGYigyzUkPX24j7Yseg2py0r5ld76ENEAuTn5LszDDspt6qDUDhlF/bTCKiODvDW+bbPESIRSrOAdnii+9VktRSFFvSN/3jvBPx5KRWI3hUww4c/uFemKFBpYMNv4oNp7WG/Pf43bBObPzjEWgY2sVSVfA==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by PSAPR06MB4264.apcprd06.prod.outlook.com (2603:1096:301:82::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 10:40:30 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Fri, 21 Jul 2023
 10:40:30 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "moudy.ho@mediatek.com"
	<moudy.ho@mediatek.com>, "ping-hsun.wu@mediatek.com"
	<ping-hsun.wu@mediatek.com>, "daoyuan.huang@mediatek.com"
	<daoyuan.huang@mediatek.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"sunke32@huawei.com" <sunke32@huawei.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Lu Hongfei <luhongfei@vivo.com>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: Re: [PATCH v3] media: platform: mtk-mdp3: Fix resource leak in
 mdp_get_subsys_id() and mdp_comp_config()
Thread-Topic: Re: [PATCH v3] media: platform: mtk-mdp3: Fix resource leak in
 mdp_get_subsys_id() and mdp_comp_config()
Thread-Index: Adm7vsZosiAisxtORqS5IFUM6fHKcQ==
Date: Fri, 21 Jul 2023 10:40:29 +0000
Message-ID: <TYZPR06MB6697634350E7A5A8BC2F66AACE3FA@TYZPR06MB6697.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|PSAPR06MB4264:EE_
x-ms-office365-filtering-correlation-id: c67f27b0-8301-41a2-86a9-08db89d6e749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42S/DsLYziCaTkh8uFpPzZp8q2pXYqD92dsJL1smF34EA58szN7G0g5Q3/wNVYonGhpbmze7ZnTMEmkUDBhBJUKO8T9InmYbtE9q9CMFlMFebxsEH7COzFpb/M7Asd2D/Y0TCUAfX8qpIya8/z9YQJ6d9YW0cgas4SwpXrHQUxh7tnvTnwv8J073JJ/x4GffPIomUARXogURI9UDvpa9bibHn1TwOEVu7R7E+T/53U5ZP5Iq9ZC2mpUm62nBSiemqfDFcXENZSpELzkISnpz0L54ehPypS+WAih3UFpB6iloglKTrffT7SdrjR9uj0d31AB0/VmXpSNpvMBjN4mebXGa5fJINdOCzW+HQ8uQliBcMijtEOK5LRQjJh9J93ynhZJC+SwkqBj0T9P4banr7niGCFIPRhMRSf4OHqrMMsLaYmXWiQEh32xYBJ5WiJcawfyU5l6/Ig34uFclN2Cs12LW66x7bL+53q61nthJLtSo+2HR6MvKnE3lsKBZtDC+yMZUJCE/bZYjVQZ+VBzrv0hJ+tCwltBbkX2uqn7WREs90lNLvSBh/Bjpb5DN//geykLvbkX4JmuSVpzoGaWie+84+RGdMNtC/3TgAcPXF/DN8V+AJDdakzQqZSEBjkqD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(451199021)(38070700005)(83380400001)(2906002)(4744005)(122000001)(38100700002)(921005)(55016003)(66446008)(71200400001)(76116006)(66556008)(316002)(66946007)(478600001)(64756008)(53546011)(107886003)(41300700001)(4326008)(6506007)(26005)(186003)(66476007)(33656002)(966005)(9686003)(110136005)(5660300002)(8936002)(8676002)(86362001)(7696005)(7416002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Y3BvWVU5aWN4eEUyL3UxcTVtQUxJQjUva3NPVm0waEJiT2toYXdubjZhRmFv?=
 =?gb2312?B?czR1eGNCZmZWM3pBZWRIdXJIQzlWM0l4eXVjRCttczRveGt1ZkFlSnlhNzhD?=
 =?gb2312?B?SGttcHZhbjZFMXRQR0V4Y200aW1oNXN1Si9uZzFaWVFOdkxFOGtHaUFDL3dQ?=
 =?gb2312?B?NlRZcFcyZTdIM2VFekVjQXpjY3daTFJtU2dGT0IzUDF6YTJhOGJXaGdVcnYv?=
 =?gb2312?B?ZHNvR0grWlZOVHQ5RHAyS0dOVm1idmFrc3VnUE9PdGVXOFBwK0hVZmowNndt?=
 =?gb2312?B?VkdzSHVPTlZESElNWmxSUGF6dzh6RXpFTHpHWmN6OGFCV0FTK2lKWlNLd000?=
 =?gb2312?B?L2Rwcm9WVC9Sd05kREp6M0lGTEpWZUljZlB0ZzZnTDMxakxydzZ6Smltd1pT?=
 =?gb2312?B?cFh4SEhpK2N6QVYyaXRSd3Z2TU45YTFmd2VhcCtmR2paWGdHMjM3SmpNVW5P?=
 =?gb2312?B?d2svSUxzNStxMGhTdU5jNkNoZzU0bVM5UCtoU3QrZWJScXA2S2d6RnFDOW5T?=
 =?gb2312?B?TVJScEdPN2tCc0dNQ1FNZWxITVBzUGhZeGhwaHU3bE9nUm1XZ0JMd3dlWUJl?=
 =?gb2312?B?NnRUNlVZUTd2UEZ4NzJHSkV2L0lpSlh3WjFIa2dtTzJYYjFUZHU0ZGhiUnZS?=
 =?gb2312?B?TDhOWjBwbnA3QzUxVStrbUF3Y1hWaEI3YVdKWm44RWpzWk5neS9BckFub2Uz?=
 =?gb2312?B?eXBNRWFMbUY0MkljdkwrajZ0M3g2bXRBMm9HVXlOcGRVbllSemkwTFh2ZzBN?=
 =?gb2312?B?MHdnWHJldGIyc2pYNnRySHBmZ2VtcW9GQWVWaXMzUi9KMVRRU29aVUdBVGUv?=
 =?gb2312?B?N2JtNlArOXdxOWFiQmpVakNmNkNka09OdXNtenZxWkQvbjkrQVd1c0NpTVA5?=
 =?gb2312?B?dGEzQXlqRnhPOUI0QlBCMk51dkNzcWJzSkE2aitGU3lyYTVqVlAyU0FaaU5H?=
 =?gb2312?B?Slh3OXcxc2JtaVpscmo2aC94TVRTRHM5TU13cXN4cG1xL1pyZ2Yvd01USEE1?=
 =?gb2312?B?SFlyUDl0Nmh6TEtqNFNid3IyVVg5c01hUzEzYm56Z2JtdXU0emttTFQ1anNm?=
 =?gb2312?B?MURvZjVxQTZqMlpiY3B6YU8wUDk2UmZtaU1KblJpcTU2M1lia0FidDl6b3pr?=
 =?gb2312?B?TDA1eFhRUElwYXhDVmdsSUlmdGRJb0NWekN3Vk9EcG1lcytuUFJaUlpHYlFz?=
 =?gb2312?B?NnpkcHQ5a2pIYWdhMUtDNzdML3hVTXdoR3lzc1RWZ0k4NURESDlmUU1LOGZP?=
 =?gb2312?B?RVdwQWd3bXp2WG55OVhVNFdDVWRCQUxlWmh3TVlsaXVxdU5JYXdueUJsOXM5?=
 =?gb2312?B?WDFjTmUzY0NPUG9oWW1waWtjMW1qU0lqbFB3akFyMWRXV3lCRisvRVNFU04z?=
 =?gb2312?B?KzlDR3pUWUdLS1VPZDJYcmRoOFNTNW1IeGV4QjVrRHVkWTJDZG5VSkI3TDNh?=
 =?gb2312?B?M0V2UG54L0t4NWRFdTlQajZqT3J2MDYxbmFUd2NzZ1Y5TjdJWVQrU282Rkww?=
 =?gb2312?B?UC9QT1A5YjdpSjhzaHM5R1NOUHhRWGtFb1FsWDZmQlQwaWxjKzRlM29mcDdk?=
 =?gb2312?B?Sy9LZnJmVXo3VjR5aFZ2VTlZekJabG1OS3l2SUxrcnNsS1Zvd3lZWUJYOW5M?=
 =?gb2312?B?QVgySkhjZU1UYk1zaFd5ZUh1aS9VRnQ1Rk1BT0RaaGFzMXB6ZHZINkJWUHRK?=
 =?gb2312?B?NEtBdkRaZHV3SDNkM0FKUFVvUUprQ0ZpSXBteHhTZ1dOUHBWd05iVlA5SEh3?=
 =?gb2312?B?Q25FYWpndXR5REtvVGNaZVAxYkQ3SFFTRGpURmc1NGdMR2ZvZnE1RnFzRjQ1?=
 =?gb2312?B?Slc0dkdna2ZZL2J0eXpmMTUwZ1VDSDVFSGxxSk1Fa08rOVcwdUE0VnRvU1V2?=
 =?gb2312?B?WStQUk5HeVhGRzF3Zmk1d0llWGVaUERrbm5sQms1YlJxbVVMWHZFSFdyVnBP?=
 =?gb2312?B?NDg4L1JVSFNSN0ZEOVVnMUllRnhuWjBYQXY0U1M0NXR2Q1l3NnV2MTFndDZo?=
 =?gb2312?B?Qlpha3pMOC9NSUNPdE5PejRtWnI2bml5dGhpZms1ckJSZ3I2L1AybGw3ejd2?=
 =?gb2312?B?TE5LeGxvK3FzaFZmTkVUUGNrOGNxdUVHY2RDb3pTZVNzTlkwK2QvWmxFUHl4?=
 =?gb2312?Q?y6sc=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67f27b0-8301-41a2-86a9-08db89d6e749
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 10:40:29.8833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: js/8Sib/7JbvgXApyHHWmHrW3eNg6npXTQNiXcui73Y9VyXHxO44HcVrcp+yUptlN/cTCXDkFTaCdRFSHDwT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4264
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_034045_898597_FB5F7B60 
X-CRM114-Status: GOOD (  11.34  )
X-Mailman-Approved-At: Fri, 18 Aug 2023 09:00:26 -0700
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

T24gMjAyMy83LzIxIDE3OjQxLCBIYW5zIFZlcmt1aWwgV3JvdGU6DQo+IEhpIEx1IEhvbmdmZWks
DQo+DQo+IE9uIDEzLzA2LzIwMjMgMDU6MjcsIEx1IEhvbmdmZWkgd3JvdGU6DQo+PiBBZGQgYSBw
dXRfZGV2aWNlKCkgY2FsbCBmb3IgdGhlIHJlbGVhc2Ugb2YgdGhlIG9iamVjdA0KPj4gd2hpY2gg
d2FzIGRldGVybWluZWQgYnkgYSBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkgY2FsbA0KPj4gaW4g
bWRwX2dldF9zdWJzeXNfaWQoKS4NCj4+DQo+PiBBZGQgb2Zfbm9kZV9wdXQoKSBjYWxsIGZvciB0
aGUgcmVsZWFzZSBvZiB0aGUgb2JqZWN0DQo+PiB3aGljaCB3YXMgZGV0ZXJtaW5lZCBieSBhIGZv
cl9lYWNoX2NoaWxkX29mX25vZGUoKSBjYWxsDQo+PiBpbiBtZHBfY29tcF9jb25maWcoKS4NCj4N
Cj4gQWZ0ZXIgbWVyZ2luZyB0aGlzIHBhdGNoIGZyb20geW91IGludG8gb3VyIG1lZGlhX3N0YWdl
IHRyZWU6DQo+DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgt
bWVkaWEvcGF0Y2gvMjAyMzA1MzAxMDE3MjQuMzE0MTItMS1sdWhvbmdmZWlAdml2by5jb20vDQo+
DQo+IHRoaXMgdjMgbm8gbG9uZ2VyIGFwcGxpZXMuIFNvIEkgd2lsbCBuZWVkIGEgdjQsIEknbSBh
ZnJhaWQuLi4NCj4NCj4gUmVnYXJkcywNCj4NCj4gCUhhbnMNCg0KSGkgSGFucywNCg0KSWYgeW91
IGhhdmUgbWVyZ2VkIHRoaXMgcGF0Y2g6ICBodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhL3BhdGNoLzIwMjMwNTMwMTAxNzI0LjMxNDEyLTEtbHVob25nZmVp
QHZpdm8uY29tLw0KDQpJIHRoaW5rIGl0IG1heSBub3QgYmUgbmVjZXNzYXJ5IHRvIG1lcmdlIGlu
dG8gdjMgYmVjYXVzZSB0aGV5IGJvdGggc29sdmUgdGhlIHNhbWUgcHJvYmxlbSwgd2hpY2ggY2Fu
IHNpbXBsaWZ5IG91ciB3b3JrLg0KDQpXaGF0IGRvIHlvdSB0aGluaz8NCg0KTUJSLA0KDQpIb25n
ZmVpDQoNCj4NCg0K

