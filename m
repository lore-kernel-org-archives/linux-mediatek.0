Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF423C44529
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o39wuaCrLqxFExrN5GxONTRjd88b+OhZ+T2Cm0ji7BA=; b=DvFCzddFqzIM3FXv954ZtO6rK4
	QUAJxepqIEVL6rnSqctNe/VywIf1nXFyg7THty0C4lw7Fz1p7gVh/jYYJQvE7GERYXQPn41BahxZn
	Ke2osK7TsEB66ksQ9ZZ+XzuYafmVN9hMqiNbSS3ThTwaK1M8/WzurKeFrOSeLb0NV5EJP2J4gLYCU
	V0en8TTOkpPbi0uo5L+LS1mtVrwbt8mwJ5B/tXt364/auTN1eHj6iAf0gS/I0czMeE0bWyEtLghjF
	x2lRG4abWWM7jxrv1KqcPaAkTN6+wkOIdaWjG0ZYK6fYA56zfgog2XDf3uO2UuUs3mJoOz9idXo3i
	M1Zy7qDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls8I-00000007a1t-1qQO;
	Mon, 20 Jul 2026 17:50:26 +0000
Received: from mail-westus2azon11010052.outbound.protection.outlook.com ([52.101.46.52] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls8E-00000007a0x-0fkf;
	Mon, 20 Jul 2026 17:50:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ4o9L2DV7cQV3Bxf9lj/wBaanczPU9uZfx7QrusVc+Ptz5xWI2q/StW43vYFkSWzHxHN37eRC5xt1mmfiMBCHKXbZh5v8fvNt4FlE5h5A7XOMJZa8FTr2p9DvLgoXBmntONruMvRg1jNUpuC9Rdi46lYaA3WI7fRbm7H5Anurj1tS86/ce+JdVize7R45gGIRknrBSFDPAiNP3uWs01WWN5fduCATwB4lo4pYaT/+J0mL32jSlBJteLFSPkKgq8LEyMLpamfE1DhIiozTJjQtes4yerZvAbPk9333A/6GR+XwsbIq1nOYWNctHU0gMqtEg0AQmwe6jK4TDNcL/Slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o39wuaCrLqxFExrN5GxONTRjd88b+OhZ+T2Cm0ji7BA=;
 b=sYCya6L1AD4Kc5c/CajOLgRx2LdFzSmn9aJrHrKI1FbpQeMGLEoxb8WWjidVFFXsKj5QyhbyQ27Di4owzDJYsrA5/Vb5p2gR5soR/9WsnVCDU03r8+lYvtaGnyQFMLm/AmDe6jaSjClx+JjVbCCA53lq4BYxoSQWetaUsI7LXs0+nfBZGEJXRiBJJLJv37b7zn0mu78DQJhxSKTADvgYA7yWk8owT3LReuDZJpqbtIqLUHnt4mcdAQZ4CpzJRiLjf6ydXwgJi3XZsYNOHvk6NsHiW0TV4NGQdq0EzZ3PhxOZzuKjnWXITHIdCIOo8baFIk2NikF/pxWZHpD4v/2seQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o39wuaCrLqxFExrN5GxONTRjd88b+OhZ+T2Cm0ji7BA=;
 b=w3mbZiwhxmccFxnBd8d0V9LArpfonHuzprHlfSzTTI6z4bXpgOI+WF4nefowotzVLOp1DOlZoChjsfep4nbxI/OOYo6zfS4+GQ7FRetjgYs0tRsZ/R9tlKtaSf74dQp6CVdui5aYL8FDoY1inL8+WwheKgFP0eBpp1F2fpj9Crk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:50:04 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:50:03 +0000
Message-ID: <37bafd27-7adc-4e15-bbf6-7afdbb0b8f22@amd.com>
Date: Mon, 20 Jul 2026 23:19:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] drm/xlnx/zynqmp_dpsub: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>, Jingoo Han
 <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michal Simek <michal.simek@amd.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-doc@vger.kernel.org
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-2-5020b630668a@gmail.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-2-5020b630668a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: faa4ed02-1be4-4d62-1cb7-08dee6875401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|921020|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: pmmbjoQR4MBCH0s5XGIXXUKTsAFm1jsHQ87haKRvxsgt1K+EnbVBQLdRf+SwI96/Y7fvpFGZlYF/30dBzWOz3/4iM/1zsCmquJUOJ1YJrM0jLMfuV3CjnfHp3OUYY1slMRaOkoDoaI2vV/hgs+ikXNwaaAZ/KFJWb7+7LrRRJ2hwhJNIpNO4tvaNztfzlUIFC750CFmyVWYDTrFrexEF5P7SqS8zUQS1Q696iPA9s/LNzpc38gq57MkCTW9HrBptmQBgkWxMxa34kvyfRmAYXWoLAnTnnkx4K/j3y8gn1Tx5fgEF/D8zdkV0kkbZRP0pMQ9YQbwpYYqi223s1i/iCRLISlFJ/ARPv9yykS+PJDLy5Dz8ZM8rZn8gP05lJoEFdRwpfRQJArI0D5GZ29gzH28vrTK6FL8BIAlVK58vgjxsX027rBO345wpUPwjW2GP7XfpLtZomtoSJnbBB4B3xtfLxYfk8a6Q2VkwAZRzy8tgkmrHZ4hvwmo7YClmOsSjjbyw7wbWHmcopQXD/DrJGI0Ta2y7Y2htmk7j9/j3qinOrQKbgKCXZ3TPpBtoZzhg8WMZbwMeJhJ7qNwyxLH/oC/5AsbS7ft551HghIdBtEZlltW28UH61tcnRLafmxMgzr8DfCvpjovyo3nFYQ1CCk8RkOov3Nz34wh5J0XZ7TSCVebWLs1DpVOHWXRJxDQBXhAdbiLzSUbBSuDMMVhGtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(921020)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXZYMDBxdDBNSGk0RUZiS3BBenpMRVRGeUVsdDZNcWhEOEVQVHgxNU45VnpO?=
 =?utf-8?B?Ujl2NFNqS0xPMDZsbjFtYWhQZngrZEVNSEJMdCtlWHJzR0c1L2RUcUpwUHow?=
 =?utf-8?B?RkwxQ3F2akphSWdNeGtkNzRBbFBKTnp6UE5sdUlBeUdKb0NqQ0xsbm5xMEJV?=
 =?utf-8?B?MS9TTTV4SG0vejI2RmNMK0N0V0xoUEJDYTNmcnBmZzZjSmMwaXJpUUxmdElL?=
 =?utf-8?B?NmtYTjdTbDBndnFmdzNTbWdudlEvMG52WWhYOWRBQ3NQREMwNEcybTU0Tm03?=
 =?utf-8?B?M3UxZ3JIR0t0UGhIeGpIMVI5QlkvWkszZ00zWHFxS0pwUmpndnBodkcwbWF2?=
 =?utf-8?B?S0dGclR2eEJMN2lPcGFDTnIvbXFMMlB3SnVJbzh3NnFVSjBsZVF6ZVZZT1hk?=
 =?utf-8?B?NjNYd08xcERHbjVDbGRjSjVuU1QzS0YzU2pxN1lNcEFHMTcveSt2d2JTNGdv?=
 =?utf-8?B?cmpGanZGNTlFRXMwSC9UTEcwZ2ttWUVmQkZiRi9ybGNQVTNSeXBpK1pScXlR?=
 =?utf-8?B?SFJReVVFTW00cHpNeGU0WFVJQ2NYNlpKV3EyT29YR0MvaFFGV1Y0bWpwbHhv?=
 =?utf-8?B?UmFFOGViZGtkL3Q5SjhlSzFiYW5BNHkvd2R1NjNPR1dabmZxU3l4SEZiNDVt?=
 =?utf-8?B?QnZacVFLMEJRVG9HNXJsYmNxVHZnTkluS2ZhVlk5U0JabmRNNXFha0YyaGpP?=
 =?utf-8?B?Umo1Zmk2K092SSs4RktuY3krY0Q4b1I0dlRjQjN2TElkVS9yWVBRMzkrUGRa?=
 =?utf-8?B?M2RuRnJjS1NzTGZDMWFUb2F4a3RZRTBNenhrajlwcllqY2RodDMzQW1pZ0lh?=
 =?utf-8?B?MDBSVFVNU0lyUnJ2UWpqTkRsT3BqRkJBZzhta3NkcHFreUZBaS8vZ1R0eDVY?=
 =?utf-8?B?NjJ3ckE0Z3BDY2RrOTdqcTdvSDRrZlRSK1dXekFnZXJDOWU4em1NZmR4dUIy?=
 =?utf-8?B?UGxFYzEyUjFpT2dJU3RZV0pSZDZpUDN1SmVtOGFQUFhxL0d5aGhxN1gxZDl2?=
 =?utf-8?B?eGhNZ0FYaTFQTGRIbFB1K2pycHhMVTF3c2dJQldLMTBpalZXM0xhRXpSbi80?=
 =?utf-8?B?d25qU01US1RiajZtZnQ3bkdBTndHcjRlVmd3Tm92T3lob2FPRlNaWmJ0TVRK?=
 =?utf-8?B?bWJEUGhQNGIzbDRZdjhOL3BzT05SdGUrdXVYZ2x1d2VVdzhTUDlaSDJ4REdM?=
 =?utf-8?B?OUtiZXZjeGhHY1l3NmpjLzJJL1dmNmFkL3ZXSWc2NkNVazZ2TjhnR1VDUmNO?=
 =?utf-8?B?L21KM1pURG9vcGhpTWRwWUt1MC9mVDFTMHdmZkpOR21nR1k5ZkVYd25KOVpu?=
 =?utf-8?B?dGJaYnozQ1hDZDRrcS9xdTJ3ZlkwRm1sMUdncDI2UzByS0MwMyt0TjJMTnNI?=
 =?utf-8?B?Q05tSzhyTDJiVDQ4ZjRZeTRiQmp5L3Brd1BBOVJRbU0rRlBpWVdPaFl6OE1F?=
 =?utf-8?B?L3ZXQnRySWNnc2o1V0djTnV5OHpPdG1yWDkvYzJrYWRTc0hyTC81Zi9sYmRN?=
 =?utf-8?B?OWw3ZjZVUHRHeGRvbGdPMGF2QTNldVJjd3MzR3lPTk02WldybnhKaFN5QytV?=
 =?utf-8?B?NTRSMlBqTXpabmZVTG9OekdoNUVLUmR1eVo4eG51VStxam1mY1BiVWxMSW9w?=
 =?utf-8?B?ay8xenhQM1Q3bzhDV3laQUdvRmdvZzRXNmNTVW1lZjlKZXY4MG9XM3pQRU1M?=
 =?utf-8?B?M1JnQ2JwajYwRldSOE52Vy9JaHpmN0RHbGNjdnhGalI4djIvTitFdVZLcm1y?=
 =?utf-8?B?WHpvNlI1d3hSZHJINmI0cE1Ca3FudXh3MnR4RWMxWnFuMDVUOXhxMGd6Zk9j?=
 =?utf-8?B?VVJ6RzUySHcwZCtadW1lWTNQZ2svMklrbTBZb004UzhQVDA1SFZWajlWdTkw?=
 =?utf-8?B?YzZLNHhOSDVVL3R1SGNnSVZRcTZTeWQrMSs0WEdNSVUvRGRnTnQ0MUNvOGlZ?=
 =?utf-8?B?c1p0VDhSMml2QTFhMVN2NDRLbDRQeHVLM3hwQjN3SU1CZGhRa2tPblBlNlI1?=
 =?utf-8?B?T3lFd3J1VjZpYWpudFNKeSs3cnN4SzZ0amswYjVsRzMxb1lpWm9PSlRJVUlw?=
 =?utf-8?B?MUp0Z3RzNjN1YkVYZVJPeENnS1FpUjBRR0Z3T2VJMjhOR1FzaFdDVlBjaGhQ?=
 =?utf-8?B?WDhmV2Ira2FxK2NWR1MwRUtoaWRPTWpZdmh2VU5WMm9odmJXWE9zdnRFM1Bh?=
 =?utf-8?B?R2h2MFU0WUNqYTJNOHA4dTBaTEFDcHlsWWc1RXFZU1BrWmtiYURYb3NHWC8r?=
 =?utf-8?B?dUptaTJ1SlBkVVpkYThpdVVsSUFMbUxPRzFkczM3YXhFdC8zc0ZaMXhIS0Fy?=
 =?utf-8?B?Tmt1ZzVrdWFvbkZibW9oQVdsRHFocDlaRExzL00vOGs4TE1jUGZqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4ed02-1be4-4d62-1cb7-08dee6875401
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:50:03.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmEWwMXOfUaEzA7+4Onrv7NOl6vyngB6R4tmpEHMKSOHEv+IOnvdtKrMzMu6CRpd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_105022_344064_F6648CF9 
X-CRM114-Status: GOOD (  18.28  )
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

On 7/20/2026 9:10 PM, Diogo Silva wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
> 
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
> Also check the return value from drm_encoder_init() to avoid silent
> failures.
> 
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index d5f922450565..ac9197e026af 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -29,8 +29,8 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_mode_config.h>
>   #include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>   #include <drm/drm_vblank.h>
>   
>   #include <linux/clk.h>
> @@ -417,6 +417,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
>   	.minor				= 0,
>   };
>   
> +static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
>   {
>   	struct drm_encoder *encoder = &dpsub->drm->encoder;
> @@ -436,7 +440,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
>   
>   	/* Create the encoder and attach the bridge. */
>   	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
> -	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
> +	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
> +			       &zynqmp_dpsub_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret) {
> +		drm_err(&dpsub->drm->dev, "failed to initialize encoder\n");
> +		return ret;
> +	}
>   
>   	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 


