Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AA2C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YppLa6NW9CdhhqUkgoK3LDZlRm27xvXIHLQI5tpHurg=; b=xVGge192IcUabPqy/LPZiYBvO3
	zA46EYT79Orifts9Vu0JIPl8XE0eKGikciQb0X6bCZZTlKAmD9EzOyuTA2jgj/Qmg6dGkUs6Usnai
	TetOlNs6ePkHUSRcMrMCyQ11Jl0oF9IPkiyubR8VVHYA3O5sUJ7wSJqNYIhrbEkDqqv4d6aZyS7UX
	yauq88YduRXNgZaBaYLDm9o4z3m5wjHjbc+fpKoCgBfh1qdnot2n+N6ZdHCmjHoK9+ohHmDg+cSs8
	1znP5TJ9rI/PAYUEtc8Ups4ljsR0+DN3ltlGniX7JPNVwfvtU3gl0Vdh0cl8sVXGXex+UXSq8KdXH
	nkAQRR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNG1-00000008PNI-1AJV;
	Fri, 07 Aug 2026 16:17:17 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNFy-00000008PMj-0gQR
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 16:17:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyWP1sPwlfpLhz3+AWb0YRQY8vISMJeKZZrnIHqU1LCw67v2/dqvj2jcMlAS20ZQiNmudCEnK38VJ+qoHfQyIS054Vz2D/MZM2tOgNvqCHdKcUWaW4zBLmPUHUTWIAL3cKUaf4vMxAmGR1lAY45xMfkijGhu9p852OUl2meAGiMFacyWFU0CtsTv1276IwH4uqbEGw3zFNI27iGjwOWyyDWJCS2HzgRTRDdIMdKl5dWPf4GaPlc/771rPwnfK6CI05izFTzuYeMgrbPQ7Emk5EBVPoGtBthV5EJVv5/5NDWtNK2s+C+V8QVxJij6SHEbq+qsI75uatH8/PVT46WVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YppLa6NW9CdhhqUkgoK3LDZlRm27xvXIHLQI5tpHurg=;
 b=SqKKqiLIGFoz8SUco15lca1SDkiCxMCVzpHTlGjSOAOzXQqCkNogl3LihUIgXfXjEQ/xlFUD8ni6PIHYJSYCwJ9CmeWmut8B0bQZyg9wLADIMa8s3WpOiU8R8l33l62hyLINEeU8FjHec/EbWm4hqJQmbQXCATcolQSWfI/Wivy/HsbuHyy517YfV9IQlh5eqxoJYmi0XTOePAX1r8aj7My/5FynOMCERani0Fd1R8Tq8r8syq89Gs478ZT+hmDuZDV24iObqaFbUol1dmmz4W7IisaB9GiLwoRcfyTsby5NW1KzZCojdyOMaPDCOWSV78otL6A6cAwcQFVycNzO/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YppLa6NW9CdhhqUkgoK3LDZlRm27xvXIHLQI5tpHurg=;
 b=LP234k18mLnIbW9C4HPCRKhIX00XsqW/lJiDbwv8HMcrEn42T/AXQfyhmOAYYeAOVPpygH0HmXrNpeQg33y7OIUkY71fj1Jl7aKVw8JlefVjk6n+Iur/a2XXsHocym7Hxr0nRGtTpJxbhLqVWb7J7tc8k35Sp7yjgjywBh5gG1b0XIWNCBrWgAqqe+Jzzs+tSsyY8viRGa1WATw6rSt9ad/iVBN5kBJ3b7G1w+a5ErOLhXuJAQGKtfKkQF2/v22q5PyRlaMqcdQldNrpdf5O4fwYRP53keY1TxnhbodipORVIDTixivzEqVO4b03Rk0hdcXLYSUrODlPVP/2zg9/Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by DBBPR08MB10746.eurprd08.prod.outlook.com (2603:10a6:10:52b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 16:17:06 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 16:17:06 +0000
Message-ID: <5f5c5789-02b3-4fc2-88ea-23a20c72c28b@genexis.eu>
Date: Fri, 7 Aug 2026 18:17:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Linus Walleij <linusw@kernel.org>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVZP280CA0092.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::13) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|DBBPR08MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: b64d0fac-370a-4037-e90e-08def49f52c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: +KmISY9RwF3zcAOjfYFbaW7nIU+HQHSf+5hTfvuFHRivUxFfXat2nm9Vc0aig/hQYwETI+Dt32LCg/31ZxVCTKWnm1NyNdNgP2e9APP51tv6tZW7XuSCIxWpPOpMhGJGXTmH3o+lZXT0dVcL7wkILu9RUryPbQrw8NYHZzAXZOG/4irDBc3mP81hEbFnGXtz1D2gMQM55JOw/Qx9h/WOWZaDDWWqhK1X32E4SfSAjxDP9bGkVc3KUPvgwlbz+Nn4uFEaGwIKYjUMUzUwc/lXa+X2Ag44BcepscvOwgc0IK+lGTSbDYlYIYTaqGLh3yyIUYG/ir8q+9kOXBiWw2+IpcYtO9uBoBY3D9sKvKsE/Qn5RPGbHqwrJLZDZGEgZj9pu9frHb2RiTkeLsBiI88C+g0FRJSIQ4vrcS3xNTxMN8JMuzkEHcnlgyLYtVe9XcwBwEOdazH5sR3HtUVKV9EhnpclBCeGZ+vNprTblET2ANEoJLER3mA0A+UaGL7vO/TMg2JvrWcVc8dO0hjb5vGR0Frl+6Fm+alw8T7Lgg12GYDUMIzdA+uv3vUmfxI4Dr0Pqj77rBlPPkQKb1X/vMkQLfA6D/y43lGMpjnDJZNG4FYUgFbc/UQ1z0iE+qTF7hyPpE0v6Y7Z0BQbimt5nZ/QPA2VjjIFda00P2mbMT1orBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2paK1BQaWJtYlVwQ1RKc01oVUN6dzlqNVlZOWJHM3BDRC9tUHgyb01JdTdX?=
 =?utf-8?B?MXJaOUlpR1B1ZDJyUU01ZGZBcjdSeWtrTmR2djR1ejMzbW1XN0ZFdjd2NktK?=
 =?utf-8?B?S0FJWm1NbHZ5S1V5R1kvRitpV29NSXR1YnEzREVkTSt6c2JrdTNWTnRjaC9h?=
 =?utf-8?B?ZWZuVlRyVWVNMVdvOWczL2xPdVBBSjBOVXNhaHFycjg1dTdkdEoybUJkMDdW?=
 =?utf-8?B?T2NrQXlpZ1Zwa01JWFRJWkhvNTZCNlJzZWRpRE9pRFZZcjJFSnl6WlJVNmo5?=
 =?utf-8?B?Z2VGWVdaZ01YR20xQWlKaGM1L1UvVWhudm1hbWhSczU3MkpOV3l6VWFZLzh0?=
 =?utf-8?B?VXNsUDhraGI4Zm54SWVjZGVqUjBzM2orY05RaGR6V2d4c21CZmJ3NnZ4U0JE?=
 =?utf-8?B?eXFSRjVockpXYWdNU0FIRXNTblJ5TCsvT3puV3JTUm1WMlRMRXlNM25rWXhp?=
 =?utf-8?B?ckRlOEVjT3NyYUNVTzhHazM0RVg3a2swMzZ4eUswRTdyUmtra0NUbXI3M3dm?=
 =?utf-8?B?bUFGV1FiYmh0RnMybnpSZE1NODV4RWR4UGp1enk4K2FNRGR2SytHRGZsZjBv?=
 =?utf-8?B?cWQ1d3A0aXN2UWdmWW0ySGxLQnlkeklJcStjYThMT0VoQmhvQVRUYmFyaGU4?=
 =?utf-8?B?RWdVYzZtNGJvK2pmcy8wSUFhV1c1Z2l0MFE2eHpkRTNjdkhudTl0QmtuL1FY?=
 =?utf-8?B?dVo0clNmRzM0SEx3a1ZwYStPcVN3Z3pTMEVJZmVRZ3lLNkF5aE16Nkt5QjRQ?=
 =?utf-8?B?aEhzSzN3QjY4QmZLUDVNcXE1MVp0QWlUVW1yTDN2QTdwUFArVTUza0tsWENQ?=
 =?utf-8?B?TjBEckVpQ3N1eTRmYnBaNHpTTThvNm1XSUZOU2txYjVHcEQ4dEF0ajA1N211?=
 =?utf-8?B?bEdCd1VPNEZKVnI1MFBkS0o5VTgydElGK3lndEsrM00zMmdZc3VDYzQ0RFlZ?=
 =?utf-8?B?c1RHZUFPbFYwM1MxWGg3L3pvdVR0V1dXQ3Btdjk5UEZFZkdQbnVVZHlXU3cx?=
 =?utf-8?B?azBUM1FYeTJnK2NuZWhrVE9TVkdsdmN3Nkg5MDJlQXk1UDBpNmRGY3JWMHBR?=
 =?utf-8?B?Ukwya2VuckdFemFPd0Q0alFKajZicXg3WWV5THB5YWJFdzBhQkMwakl2MU5L?=
 =?utf-8?B?WVh0VS9OczJoSW05bWZDZi8vZkR4b2Y5aHNSbEhBMlJVOXluWG9jZlNocDNx?=
 =?utf-8?B?THhjUTNwNGlvUldxbzRBczV1TTdKM3hKVDdsejlSY3BOemFkUXFwU1FSYnhQ?=
 =?utf-8?B?b3BIVTVGTlhPVGVVc2RjdHNaVmVDdUVJMGJzUmVHRWN1Vms4Zng0bElpNzBU?=
 =?utf-8?B?M3hkK0dxMTVBYkZUaFh6ekhtSzMwa2RyOHB2eW00cHBoS05kR2NuZ1pHd1hJ?=
 =?utf-8?B?L2tCQllLVjhZMzZUMjNNbFEwWkZIdG41R3J2VXZuUysrNjJ4SVovcGtSRDZm?=
 =?utf-8?B?eVlLdlBPbnJzUUlXcWhneXIzZ3Nkdm5EWnI5b1NuWjVtbnRuT09lV0xkNTQv?=
 =?utf-8?B?UDJpeW91TW84WFNjbk5SSXNPbmFLR1NzRFZmUEN6Y0VEZmdhTGUzK1g4Z24v?=
 =?utf-8?B?eURlUkRkZnArRzVQOEtXL0hQSTl2bGd3Q3pxSzJFUW9vSE1zanM5RHAyS0dE?=
 =?utf-8?B?NVRHa2NVZWhQR0lxblNpbDB0Z1QyR0NXMG1yd3VvcnpKbnhpVFN5V3NTbm1I?=
 =?utf-8?B?dkhKalErS0NORFdUZnRXUE5nN0llZ0FTSWdDVUdxRndPc2pCemVvRDd3c3dO?=
 =?utf-8?B?YzNrWkhsWDFQZE4zRW1oUzJESXFod2FZVWNJeVpLeXlzL1B1eElvZU9URStM?=
 =?utf-8?B?UjRiT2k4SHVRRFVJR0thUys5Ny9YVjZNdW9WMVRnZDg1RWd2ZXVyaWhRSGp5?=
 =?utf-8?B?clhIOXhZVXRJU0VHbzMrUWVMRUNOSE94N3lhelhnWWxwQTlFcjZHSnFPTzNK?=
 =?utf-8?B?djRJblRxYWZMdGNZKzZMbHRPOFIrZUNTei9xOW5EV0FuZEVYcS9DU2ZmdjZH?=
 =?utf-8?B?dzZQZWJybDlVWU5FNnpqR0d1cHoxSThwaDEyZUdIdXBxR3NNMDFRY0xlMmVQ?=
 =?utf-8?B?MWVHVGNER3dMNzVEQ2hvcHR6aXNpWjd1N2lmY0hOT2lvaFdiOUQvQXNycUd3?=
 =?utf-8?B?b3EvS1NYL0t5VGxiMnV2RGx6UFVaWThWbWYyWFo1MC90bXVpWnNmQUUxdkU1?=
 =?utf-8?B?a1dhQVk4THE1Y2ZROCs0MmZIakN6S3VMazFIbWhXQXlSRVJzc2hjbEtSYllk?=
 =?utf-8?B?bnhzL3lpdjVvTWlaMTBCazBDbzJJUkQwa3JrZ1N2ejRnSUJqUjVDY2tMdTYw?=
 =?utf-8?B?NE1KTkhDbWdqZWlUMy82eHdUMytDVy8zb2JUN3pNQ1pqOVIxS2tHT21rMkpY?=
 =?utf-8?Q?KX8URJqIeEgVTJh4=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b64d0fac-370a-4037-e90e-08def49f52c9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:17:06.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJufjAynVo+lVVKZudEY+koBbABlZLbpBfbAb17NptwT4pFeqwVOwJqGxAF+sDpAwXxwtoAOhoSgl7IbRt8fluEguU4gfBljNNJVdyWea5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091714_210239_BD8BD17B 
X-CRM114-Status: GOOD (  12.66  )
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

On 07/08/2026 18:07, Linus Walleij wrote:
> Hi Mikhail,
> 
> On Fri, Aug 7, 2026 at 12:06 AM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
> 
>> This patchset
>>   * fixes more airoha pinctrl issues
>>   * split combined driver on common code and several SoC specific drivers
>>   * improves an7583 pinctrl support
>>   * adds support of en7523 SoC
>>   * adds support of an7563 SoC
>>
>> The driver split changes are based on Matheus Sampaio Queiroga work.
> 
> This patch set began with 11 patches and is now 37 patches.
> 
> Is this becayse Sashiko is touting you to just fix more and more issues?
> 
> I think at some point we have to draw a line and say "let's fix the rest
> later".
> 
> On the other hand I appreciate your efforts...
> 
> Yours,
> Linus Walleij


Hi, 2 of them are my doing but I agree we can fix any other issues 
later. We are sort of waiting for this to land so we can start preparing 
support for the Econet SoCs that use a similar structure.

MvH
Benjamin Larsson

