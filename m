Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D5BC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62568611AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62568611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw5KGSP0dHKTMXF01dm6ZpUQUQ9SUfm24GO2kC8gTrY=; b=FlZwFg9C1wqaOOOdkBIUuH9M0Y
	aqeJnUngMWcfPZSSgqG18/0g0wLMqKLQTRm1gD02RVoT3XMB5bxGB6zUaHRUSMhjPgsuslS6AsiCv
	WuJ5FYXD0k9/RMYaoRlwB34STjm9rR1s59AF3ZeW+jV9OwqwUlblDtHJr399zNgq54sPQS232Oz37
	zY46oEbLwFH/0L8h0VdHbST79OLRzzwtvpXrFUPa/Qrc7LWiH9qhhT+dDBWYBLBpZtKGP8TDdpbFD
	uX4M9VkPsDg6BOQiYT52dN5Y1lvRUpYE3s1R2t8jz4FEhIxCzNFAFFTFWTvxhCuiFWHuPoVKzpU8R
	MPebwJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3aXf-00Clql-EO; Wed, 14 Jul 2021 08:46:55 +0000
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com
 ([40.107.94.89] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aXc-00Cloh-4l; Wed, 14 Jul 2021 08:46:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaekSL4yyyRNqQu78zDbYm3HxrC4U9Msp3IkYd/xtmDgqPELVI+BBB2nwWxEgNyJkNPdYSdgpuW/P3rggMq4rDm5CFyaM6dxZrLIHNygUoKNc3tcHDUYx5hnryctI2LL3Rg9NghXp/ZZl0fuiaJvv1I7EW04XN5OsMjjDPy5CsGnzCQfaHAbTDsgp777ls7tD5c4KpuyVCaE6/eVoQ9UAGdLJEoeBINXgHvvPpP6QjbPOgpKZ07bAEVP4aAbNMyeQVXbExWXk/0n7CPTDWUKD/817YdQEm5ha2zQPE/mi3bLuAlz0/fvj1Bg3Jk16QAPJMonoYpmDlYn9jK8vpL4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGaM9Atj+U2kWqKjofzTjdslb6UICiEQviNglUjAAw=;
 b=Z5T94k99n5SIuXOoG70z2yBDwlGmytSNcdKtOuGiAzn++OtcjR2ya4vVWUl8eZR+hRdlYZhkOb6kWpC/WYZsdxmfxUPoo0WAcy3sy1uwAG/SMpTXwdpNZNjWqcOWGxB/JVjlGM3erIhObBXO6YW5vDSuXS63C7VAAOduH9kzYO+NGKMqfTAxLTtYqMbIUD3ZFZjmTSv3p5WNBKU6/m26yqqxzrs9YMv7i07ExwwJL18XLqEeOAhvnRyY5okdJgeTbu14h1L05b22HcT2LMZizVXG2wsuOG6ksw63xmXMXlHW1zLSZHtUxKQBokDUDbHOzCMWjNx6mfN7uNJGpDMl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGaM9Atj+U2kWqKjofzTjdslb6UICiEQviNglUjAAw=;
 b=x3yy05lZx4XjXRCm3L4Gd/SkNBN03EvmrgoIy9W2R/6MeXtKVUy6dMsdz1Y+lTpTVNbQK12d3x2hgfrnLKnMn6PMU9rbOT4Q+S17Oez6RSGy5n7SP1gZmQowE3sU+k2HhNP44m0B+02DWd4Uf4jBaK0tnwogpes7g4Gk8/p2or8=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 08:46:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 08:46:46 +0000
Subject: Re: [PATCH] dma-buf: add kernel count for dma_buf
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: wsd_upstream@mediatek.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210714071144.62126-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bfb2001-b7d7-28b0-7fdf-ae9dbb7395b5@amd.com>
Date: Wed, 14 Jul 2021 10:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714071144.62126-1-guangming.cao@mediatek.com>
Content-Language: en-US
X-ClientProxiedBy: PR3P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 08:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c57bd610-d363-40d2-0a97-08d946a3e974
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696BAD93F21D37DE2A1CCD483139@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztFNX2YWcBBaeE9IJx0M7Q5i1YgwsqsvV6DwJcF2K6wjGEAgQ7tqVXlnt8Kyr6pMUgAplfGDG/SICE313wjsyZnvAh4OYcVe39yM2lEwgIA1DVTSERCGyLaIG0rTgVu1tvCXuLOaaA1P0qfH8qZtEWYHKJM+nPwZnINoV8mSDE965Gl4EFcoayN2Gt6uAkieqKSlNK5+x+bs+GSSbFmpeLaYbErcgfts4Gxt4Y6ftmEJUpOO51YtUhQbpR7ulk2pSlwDSz9DuUolXUvwXIpi4Sbg2RUAVceRJXAoKHbTfeBVZpsFQdwce1lqDSS1/7YOy8xQx9Wmi3jJST+5eWdS0ehoDHavz6uqKI7O+VUFnrfE1d4vU8tIFre+OZbX22gdeqbNEafwwHibVMxkXjt3yZkoy4VoXfqxUL7KQNh6ezWgKl4XywWtuszEZVWpd754VNHeDpAisq6Eca6WCjrMHL0q3AgPghLXbsiH22IfgpGEqOmmZph+QafSM2I0EhcxAsk/zHbkoU+yyJmanE7nEcx8B7Rc4sygRI+XBlRI82dF9JPOnzccpL4G7MHnpyPt72OnrOrtMGmzDmLCBzGyrqgSOD59q8KJ6D+KQTW+0aef0HKS66Lmcqow6gq85Ct320EQpKpDE5Bn2/ClYYnCQkApUf7Kr+wMyDvw2kccuobqcJSviGY4ipoMfODucaxoz0c+gSRFedKXOVjDzvipKJ/fZlOCYNyIgwT9A80a4Ts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(31696002)(2616005)(316002)(6916009)(8936002)(6486002)(4326008)(5660300002)(38100700002)(478600001)(8676002)(86362001)(83380400001)(36756003)(2906002)(6666004)(66946007)(186003)(66556008)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFk2U0pEOVIwdzVVSjU2azE1OXVFY2ROckNJd0VnbzVUV1FtMnVrZTdoOGVq?=
 =?utf-8?B?Z0d4WU81SjVLaVRjYzhZMDloeElkV2JsVHI4MGJQRmpHV2tyN3NXQ2Irbmdx?=
 =?utf-8?B?WnE1MGFTUE5wTjVVS0l6VmxkZGgrUGhkWnJOY0x3ZWJIYnFaMytNcS9tYVFI?=
 =?utf-8?B?MDgyQkVlRVBjTkRnK3RPcG1pM25pVUtsT3E1OUg5MlVkU3hJa1RpaU15RVVS?=
 =?utf-8?B?VnNxRzFsR3kyMTdxUHo4ZWVmSGtXL3E3N3ZZRFhxc1IxR1l6aDN3MDcrdHlE?=
 =?utf-8?B?VndZN1htODM1bjRHVHBibnRCTThwblcremdDTW1pR3VBZGp0S1hCQ29Mcldt?=
 =?utf-8?B?VmNXbEYwK0pQdEFBQWovY2tqZXYyRkYrbEFkTTNpOWlSdGJxcjNHNUx3OWJl?=
 =?utf-8?B?dFEzTWpYampnbTlwT2RKTEUzRzJXdE9lcjJ2T082TTZNS0tKOHNSeWVHdVYz?=
 =?utf-8?B?R0ZGUUREOHlVbit0SGNubkIzT3NPNDNEUlAwVnV1QnRKRXY1NWM1MENWR2Nm?=
 =?utf-8?B?Z0xvOThBWjhlZnRnOHAycUFNYWVjYkVkWE1UeXVJSWFlRXM2elJEeWhldXR0?=
 =?utf-8?B?ZEJEa0MzczY3cVJQbzM0TGpYLyttY0g0YmRWclUwZ2VrTnJCbVhBVDdJVytL?=
 =?utf-8?B?bDRtdlVZQ1Z0MGhnUzdxRFpRSnFmL0FNZzI5WVM3UzZpWk1MSVVUaVBOOWxo?=
 =?utf-8?B?cjFvUG0yU2pOejZ3a1RBSTlwRFNZcXpCMkRmdmVxY2tlV3R0dyswYXNDUTVm?=
 =?utf-8?B?dmV6YjRYTEU4OUdlQUpJUkhocUk1YlFwSkF2d3RHamhYaDRxR1lsT0d6VjVY?=
 =?utf-8?B?N3U2RFRMcm5zZVV1OEV2Nnh0YnpsNlcrS0h6OXZaY3VBanM1VmRlMGxXRkox?=
 =?utf-8?B?QnhqblJ2dStYRGdOQVpZd3RSam02UzNsTWgxT3ovQVk4ODNpMG9yL3Q1bmsy?=
 =?utf-8?B?ZHlCc0FOZE8zNFZRMmlkazQ1SXB0bkxTdzlkVU9ZazU5MG54TEtMZDNCczJU?=
 =?utf-8?B?bzJTNmx6YVZhR0ZKOXlVMWcxaEVrb0VWekd6NmJodVZtcE9TRFV1K3dMNnhi?=
 =?utf-8?B?TU1XdldWZU5XbU9UblZRQzQzMXJZdkZQaFFHS0pZOTg1em5lOTA0NUp1RlZK?=
 =?utf-8?B?ZmIwYTl6aHFTWXBoUVRZRGk1QTF2QTVlMDMzSjYrMjd4bWNBaklkbG5Pc29x?=
 =?utf-8?B?RlozV25TODBrUldPQ1NTeGxXUGh2R3k5Z1QrcGRqVExXcWltRTFyRFRobjdo?=
 =?utf-8?B?ZHJBWktpejdFckNpWGt1OCt3QnRBa3lLYnpwUjBKbVlpemNQVXE3elphR0VK?=
 =?utf-8?B?aHAwcXFObm5mVmFyQ0pGTFVEaDlwNzlJOFdmck9aM2RseDErQ2ZMdG5qbjRk?=
 =?utf-8?B?ZEt0cDJoK0dCTjlXS1V3SFlVMFljZE1sRzkwTTFTRkljMlBiMDVNcXVyK1Q1?=
 =?utf-8?B?N0VvMXlnVGxEaWQ2SC8wQnd6NXVpdlR3Q1hVWEhxUjc0Szdta3UrUmFQcks3?=
 =?utf-8?B?MHUvSFdScUFxSEp3ZTlMZkFweVN3OVdXYzZ1RGxLZ08vaWN6dkR1a0w4Ui9u?=
 =?utf-8?B?MytqQnJOZjc2ZHZycEhYUmJLMFFkVHg4VTlEYUJhYys4bDhxMDc5cDg0WEJq?=
 =?utf-8?B?VUhMNzQ4cWdGd2NaTTVidzd4dHFIWXFWODBtSGtielhoUFZiWEthTjBLb1Vw?=
 =?utf-8?B?TWNHRU1RaFVDcEVPOElsSXlEYTEva0VzTmNoL3F5QXVlNVpZZWFGQzc1aGdO?=
 =?utf-8?B?S05QdWNnMUxFSEpLeFJUTjhOUkNJbXgvU3pGZEhrejhzTGx1cXVMM2FsSzR1?=
 =?utf-8?B?Q3lnWms4UWRpTEkwczZtV2xRRlZYeXRzVmhSdHN2N0drNmtMYnNWUktQcnNU?=
 =?utf-8?Q?54XGwNq5ARAAO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57bd610-d363-40d2-0a97-08d946a3e974
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 08:46:46.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNtm9OjJZN3i1zY+fDG5R7ySAGtvck1kaTe0UNDzMAN1eYLwupTszlv4g0+XWiB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_014652_400337_1E41E643 
X-CRM114-Status: GOOD (  35.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW0gMTQuMDcuMjEgdW0gMDk6MTEgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToK
PiBGcm9tOiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPgo+IEFk
ZCBhIHJlZmNvdW50IGZvciBrZXJuZWwgdG8gcHJldmVudCBVQUYoVXNlIEFmdGVyIEZyZWUpIGlz
c3VlLgoKV2VsbCBOQUsgb24gc28gbWFueSBsZXZlbHMuCgo+Cj4gV2UgY2FuIGFzc3VtZSBhIGNh
c2UgbGlrZSBiZWxvdzoKPiAgICAgIDEuIGtlcm5lbCBzcGFjZSBhbGxvYyBkbWFfYnVmKGZpbGUg
Y291bnQgPSAxKQo+ICAgICAgMi4ga2VybmVsIHVzZSBkbWFfYnVmIHRvIGdldCBmZChmaWxlIGNv
dW50ID0gMSkKPiAgICAgIDMuIHVzZXJzcGFjZSB1c2UgZmQgdG8gZG8gbWFwcGluZyAoZmlsZSBj
b3VudCA9IDIpCgpDcmVhdGluZyBhbiB1c2Vyc3BhY2UgbWFwcGluZyBpbmNyZWFzZXMgdGhlIHJl
ZmVyZW5jZSBjb3VudCBmb3IgdGhlIAp1bmRlcmx5aW5nIGZpbGUgb2JqZWN0LgoKU2VlIHRoZSBp
bXBsZW1lbnRhdGlvbiBvZiBtbWFwX3JlZ2lvbigpOgouLi4KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB2bWEtPnZtX2ZpbGUgPSBnZXRfZmlsZShmaWxlKTsKIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlcnJvciA9IGNhbGxfbW1hcChmaWxlLCB2bWEpOwouLi4KCldoYXQg
Y2FuIGhhcHBlbiBpcyB0aGUgdGhlIHVuZGVybHlpbmcgZXhwb3J0ZXIgcmVkaXJlY3RzIHRoZSBt
bWFwIHRvIGEgCmRpZmZlcmVudCBmaWxlLCBlLmcuIFRUTSBvciBHRU0gZHJpdmVycyBkbyB0aGF0
IGFsbCB0aGUgdGltZS4KCkJ1dCB0aGlzIGlzIGZpbmUgc2luY2UgdGhlbiB0aGUgVkEgbWFwcGlu
ZyBpcyBpbmRlcGVuZGVudCBvZiB0aGUgRE1BLWJ1Zi4KCj4gICAgICA0LiBrZXJuZWwgY2FsbCBk
bWFfYnVmX3B1dCAoZmlsZSBjb3VudCA9IDEpCj4gICAgICA1LiB1c2VycHNhY2UgY2xvc2UgYnVm
ZmVyIGZkKGZpbGUgY291bnQgPSAwKQo+ICAgICAgNi4gYXQgdGhpcyB0aW1lLCBidWZmZXIgaXMg
cmVsZWFzZWQsIGJ1dCB2YSBpcyB2YWxpZCEhCj4gICAgICAgICBTbyB3ZSBzdGlsbCBjYW4gcmVh
ZC93cml0ZSBidWZmZXIgdmlhIG1tYXAgdmEsCj4gICAgICAgICBpdCBtYXliZSBjYXVzZSBtZW1v
cnkgbGVhaywgb3Iga2VybmVsIGV4Y2VwdGlvbi4KPiAgICAgICAgIEFuZCBhbHNvLCBpZiB3ZSB1
c2UgImxzIC1sbCIgdG8gd2F0Y2ggY29ycmVzcG9uZGluZyBwcm9jZXNzCj4gICAgICAgICAgICAg
ZmQgbGluayBpbmZvLCBpdCBhbHNvIHdpbGwgY2F1c2Uga2VybmVsIGV4Y2VwdGlvbi4KPgo+IEFu
b3RoZXIgY2FzZToKPiAgICAgICBVc2luZyBkbWFfYnVmX2ZkIHRvIGdlbmVyYXRlIG1vcmUgdGhh
biAxIGZkLCBiZWNhdXNlCj4gICAgICAgZG1hX2J1Zl9mZCB3aWxsIG5vdCBpbmNyZWFzZSBmaWxl
IGNvdW50LCB0aHVzLCB3aGVuIGNsb3NlCj4gICAgICAgdGhlIHNlY29uZCBmZCwgaXQgbWF5YmUg
b2NjdXJzIGVycm9yLgoKRWFjaCBvcGVuZWQgZmQgd2lsbCBpbmNyZWFzZSB0aGUgcmVmZXJlbmNl
IGNvdW50IHNvIHRoaXMgaXMgY2VydGFpbmx5IApub3QgY29ycmVjdCB3aGF0IHlvdSBkZXNjcmli
ZSBoZXJlLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFNvbHV0aW9uOgo+ICAgICAgQWRkIGEg
a2VybmVsIGNvdW50IGZvciBkbWFfYnVmLCBhbmQgbWFrZSBzdXJlIHRoZSBmaWxlIGNvdW50Cj4g
ICAgICAgICAgb2YgZG1hX2J1Zi5maWxlIGhvbGQgYnkga2VybmVsIGlzIDEuCj4KPiBOb3Rlczog
Rm9yIHRoaXMgc29sdXRpb24sIGtyZWYgY291bGRuJ3Qgd29yayBiZWNhdXNlIGtlcm5lbCByZWYK
PiAgICAgICAgIG1heWJlIGFkZGVkIGZyb20gMCwgYnV0IGtyZWYgZG9uJ3QgYWxsb3cgaXQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAyMyArKysrKysrKysrKysr
KysrKysrLS0tLQo+ICAgaW5jbHVkZS9saW51eC9kbWEtYnVmLmggICB8ICA2ICsrKystLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jCj4gaW5kZXggNTExZmUwZDIxN2EwLi4wNGVlOTJhYWM4YjkgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMKPiBAQCAtNjIsNiArNjIsNyBAQCBzdGF0aWMgdm9pZCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0
IGRlbnRyeSAqZGVudHJ5KQo+ICAgCWlmICh1bmxpa2VseSghZG1hYnVmKSkKPiAgIAkJcmV0dXJu
Owo+ICAgCj4gKwlXQVJOX09OKGF0b21pYzY0X3JlYWQoJmRtYWJ1Zi0+a2VybmVsX3JlZikpOwo+
ICAgCUJVR19PTihkbWFidWYtPnZtYXBwaW5nX2NvdW50ZXIpOwo+ICAgCj4gICAJLyoKPiBAQCAt
NTU1LDYgKzU1Niw3IEBAIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmX2V4cG9ydChjb25zdCBzdHJ1
Y3QgZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhwX2luZm8pCj4gICAJCWdvdG8gZXJyX21vZHVsZTsK
PiAgIAl9Cj4gICAKPiArCWF0b21pYzY0X3NldCgmZG1hYnVmLT5rZXJuZWxfcmVmLCAxKTsKPiAg
IAlkbWFidWYtPnByaXYgPSBleHBfaW5mby0+cHJpdjsKPiAgIAlkbWFidWYtPm9wcyA9IGV4cF9p
bmZvLT5vcHM7Cj4gICAJZG1hYnVmLT5zaXplID0gZXhwX2luZm8tPnNpemU7Cj4gQEAgLTYxNyw2
ICs2MTksOSBAQCBpbnQgZG1hX2J1Zl9mZChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBpbnQgZmxh
Z3MpCj4gICAKPiAgIAlmZF9pbnN0YWxsKGZkLCBkbWFidWYtPmZpbGUpOwo+ICAgCj4gKwkvKiBB
ZGQgZmlsZSBjbnQgZm9yIGVhY2ggbmV3IGZkICovCj4gKwlnZXRfZmlsZShkbWFidWYtPmZpbGUp
Owo+ICsKPiAgIAlyZXR1cm4gZmQ7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVm
X2ZkKTsKPiBAQCAtNjI2LDEyICs2MzEsMTMgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl9m
ZCk7Cj4gICAgKiBAZmQ6CVtpbl0JZmQgYXNzb2NpYXRlZCB3aXRoIHRoZSBzdHJ1Y3QgZG1hX2J1
ZiB0byBiZSByZXR1cm5lZAo+ICAgICoKPiAgICAqIE9uIHN1Y2Nlc3MsIHJldHVybnMgdGhlIHN0
cnVjdCBkbWFfYnVmIGFzc29jaWF0ZWQgd2l0aCBhbiBmZDsgdXNlcwo+IC0gKiBmaWxlJ3MgcmVm
Y291bnRpbmcgZG9uZSBieSBmZ2V0IHRvIGluY3JlYXNlIHJlZmNvdW50LiByZXR1cm5zIEVSUl9Q
VFIKPiAtICogb3RoZXJ3aXNlLgo+ICsgKiBkbWFidWYncyByZWYgcmVmY291bnRpbmcgZG9uZSBi
eSBrcmVmX2dldCB0byBpbmNyZWFzZSByZWZjb3VudC4KPiArICogUmV0dXJucyBFUlJfUFRSIG90
aGVyd2lzZS4KPiAgICAqLwo+ICAgc3RydWN0IGRtYV9idWYgKmRtYV9idWZfZ2V0KGludCBmZCkK
PiAgIHsKPiAgIAlzdHJ1Y3QgZmlsZSAqZmlsZTsKPiArCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7
Cj4gICAKPiAgIAlmaWxlID0gZmdldChmZCk7Cj4gICAKPiBAQCAtNjQzLDcgKzY0OSwxMiBAQCBz
dHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9nZXQoaW50IGZkKQo+ICAgCQlyZXR1cm4gRVJSX1BUUigt
RUlOVkFMKTsKPiAgIAl9Cj4gICAKPiAtCXJldHVybiBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gKwlk
bWFidWYgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gKwkvKiByZXBsYWNlIGZpbGUgY291bnQgaW5j
cmVhc2UgYXMgcmVmIGluY3JlYXNlIGZvciBrZXJuZWwgdXNlciAqLwo+ICsJZ2V0X2RtYV9idWYo
ZG1hYnVmKTsKPiArCWZwdXQoZmlsZSk7Cj4gKwo+ICsJcmV0dXJuIGRtYWJ1ZjsKPiAgIH0KPiAg
IEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfZ2V0KTsKPiAgIAo+IEBAIC02NjIsNyArNjczLDEx
IEBAIHZvaWQgZG1hX2J1Zl9wdXQoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKPiAgIAlpZiAoV0FS
Tl9PTighZG1hYnVmIHx8ICFkbWFidWYtPmZpbGUpKQo+ICAgCQlyZXR1cm47Cj4gICAKPiAtCWZw
dXQoZG1hYnVmLT5maWxlKTsKPiArCWlmIChXQVJOX09OKCFhdG9taWM2NF9yZWFkKCZkbWFidWYt
Pmtlcm5lbF9yZWYpKSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJaWYgKCFhdG9taWM2NF9kZWNfcmV0
dXJuKCZkbWFidWYtPmtlcm5lbF9yZWYpKQo+ICsJCWZwdXQoZG1hYnVmLT5maWxlKTsKPiAgIH0K
PiAgIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfcHV0KTsKPiAgIAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4gaW5kZXgg
ZWZkYzU2YjlkOTVmLi5iYzc5MGNiMDI4ZWIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9k
bWEtYnVmLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+IEBAIC0zMDgsNiArMzA4
LDcgQEAgc3RydWN0IGRtYV9idWZfb3BzIHsKPiAgIHN0cnVjdCBkbWFfYnVmIHsKPiAgIAlzaXpl
X3Qgc2l6ZTsKPiAgIAlzdHJ1Y3QgZmlsZSAqZmlsZTsKPiArCWF0b21pYzY0X3Qga2VybmVsX3Jl
ZjsKPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGF0dGFjaG1lbnRzOwo+ICAgCWNvbnN0IHN0cnVjdCBk
bWFfYnVmX29wcyAqb3BzOwo+ICAgCXN0cnVjdCBtdXRleCBsb2NrOwo+IEBAIC00MzYsNyArNDM3
LDcgQEAgc3RydWN0IGRtYV9idWZfZXhwb3J0X2luZm8gewo+ICAgCQkJCQkgLm93bmVyID0gVEhJ
U19NT0RVTEUgfQo+ICAgCj4gICAvKioKPiAtICogZ2V0X2RtYV9idWYgLSBjb252ZW5pZW5jZSB3
cmFwcGVyIGZvciBnZXRfZmlsZS4KPiArICogZ2V0X2RtYV9idWYgLSBpbmNyZWFzZSBhIGtlcm5l
bCByZWYgb2YgZG1hLWJ1Zgo+ICAgICogQGRtYWJ1ZjoJW2luXQlwb2ludGVyIHRvIGRtYV9idWYK
PiAgICAqCj4gICAgKiBJbmNyZW1lbnRzIHRoZSByZWZlcmVuY2UgY291bnQgb24gdGhlIGRtYS1i
dWYsIG5lZWRlZCBpbiBjYXNlIG9mIGRyaXZlcnMKPiBAQCAtNDQ2LDcgKzQ0Nyw4IEBAIHN0cnVj
dCBkbWFfYnVmX2V4cG9ydF9pbmZvIHsKPiAgICAqLwo+ICAgc3RhdGljIGlubGluZSB2b2lkIGdl
dF9kbWFfYnVmKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCj4gICB7Cj4gLQlnZXRfZmlsZShkbWFi
dWYtPmZpbGUpOwo+ICsJaWYgKGF0b21pYzY0X2luY19yZXR1cm4oJmRtYWJ1Zi0+a2VybmVsX3Jl
ZikgPT0gMSkKPiArCQlnZXRfZmlsZShkbWFidWYtPmZpbGUpOwo+ICAgfQo+ICAgCj4gICAvKioK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
