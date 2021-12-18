Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1DDC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Se16KCvLPOJatMd3s03W/LZHWiKPAvwx6RjKkZtoOqw=; b=vaL9Wvur5g/8yNU2BpHfI+rlSX
	qmTRX0f5r/ghccEO3mZbXDgN0yM0LD+sq02gxlovzD5wA9lUV9LdZfpAbBuqeuxEbqiaZP/3W8U4p
	vTouVAMf6FgVDpa/WkltqKwMft63WVwsfij4VUeL9vtwrXTVyVnJFcfW6vl7xZHwLTAtrKZa2Xyex
	C8Q5QCtKV1Xqqa6QswKXYMuqZ4sB9l4Ct+RR3X/RBb03tWAacpDVFBfkIvpBehonp5zqJTrH2QwFS
	lWqhJ2IDZgizeLHD8IjaTvM1DEqKg7cuq4l+miXzOa5tusAuuG3hRLBMH4dr/0l7Nt7VjZEz8q445
	PZEsjqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVJ2-00DHr6-0R; Sat, 18 Dec 2021 08:43:04 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVIy-00DHpe-4i
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 08:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1639816975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWbyvyuWp73a+2+GZcRo1hAcL/cDPzR7VHswF6xH8Bs=;
 b=QFj8qNx5IIm9ImYV+bxTkLNBTZCgzQmsMTECcP+tgsjKf+lHpyOUZjANzW8ULpGthVqOjX
 jRIgtXVJ0edeSvSOVX+sEJf9XDsJhyUeWKEt1Hlk8E5lUV+c4lOCAPj50Ngd5oHcdikOEY
 ye06yGox7R9K1GU8q7PYL+5b6zXK8Fo=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-ct3btCGTOhaW3ZpcQ3gINg-1; Sat, 18 Dec 2021 09:42:54 +0100
X-MC-Unique: ct3btCGTOhaW3ZpcQ3gINg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkk5D7iXyVJMmhFZaJAfPyb2PD/wWs4sE2D7So30s5+9GiKn70xQRbhBQ9E+DrNwX5GmQVy08ITAesvD5dVaBeZJPYumj+xiK2ELvLCJ5MbTgCeaZzpC94cKeddzEBbeXxwloRlTx4QXSOHrFm1WjOIPuMbH0KZDFljRo524JzY3XZv1sX0Oqx1FCht1ck29M2ZpdKlbTg8kmNuBSdw4VUZSbbdxk+q5F0RJ1wmsQ/5Ej9jr8vO5iSIe1LNM/C9d1c089H5tM+UDqNJ95XmpBnVBqUkZsxg62qr5EgDGp1FPVew+x6O+hC1eZ0A8n6Qqk9NKRp9nQsQnPHLr1d+aLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWbyvyuWp73a+2+GZcRo1hAcL/cDPzR7VHswF6xH8Bs=;
 b=FXI5HKbUzYstSCqdPxXBqia1sXy1a00iJSdOY7N95sZpJYI+mCUHmimDzNiRlvoulEZPDcT0h+RYRlXGvOm42ZjaX09U0PV/VldGCJmjIPadfJEDyg8nFgmdPCXXsMZEO1xomAocwxrMFyF8oPDEeEYphJk1ojcVy8c2MQKTjp57mvXOcjLbbKsnHeRD/2I8yzxxW+/xe9Z/Kh44k31eZhwGD8yOAdAlCymEUKd7SuXxaAGJ6Ew5Rit/v5WZBv6gFpWDWzEFSyqeEdPN+WEvzEThX90sSxVkmckz0/cXpGeIoI9L5nDMFmv+SuURGiddSjvnTdDiAvUnnCsXqt3aZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Sat, 18 Dec
 2021 08:42:52 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::20b0:37b8:c5a:b186]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::20b0:37b8:c5a:b186%6]) with mapi id 15.20.4801.017; Sat, 18 Dec 2021
 08:42:51 +0000
Message-ID: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
Date: Sat, 18 Dec 2021 09:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
From: Matthias Brugger <mbrugger@suse.com>
Subject: [GIT PULL] arm64: dts: updates for v5.17
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d7e240-404c-41b8-6b68-08d9c2026022
X-MS-TrafficTypeDiagnostic: AM6PR04MB5736:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB5736173CC84D5DD2AB33CFA7BA799@AM6PR04MB5736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJ7ZLoCyineIjRo/QC0qxr78AnOtYXgKXrmJff4+GUM8kOhIGD9Nn5SDIS/xvVdh95cRDQIH6fdtxpjAhdF8XavUGcWc4Dhkiz+LQNYDRvG/KyBRDzE2mYEPIiPmAFNY3c+nQOWr0jGmjIglrLkfsh/6O1YpJyBbN4k7HZCbq/pqP2mlP+MokxUBUDJItfpQjV/i1erKqF/LkKiu9v8Z3iCeK7580YJbfEIMaIpbhRTEBAjvrI8NJXn+WrKC4d7jf8utjmBpJw7mhHncdhvrOMPggHJ1n3TOIKhweaXft3TY0dB8ArS+jGYIawnh2w0WY3VFNfpOt8fGdolI3F9Sqyxc2tLOJWcFrl38/T1YMFBntDKaMRmff83pydI7sgCOM1cAk2svepRs4a/HepEt9qAmQkEkHG58H+gpxgDEeBY9aBkS7qQMWFzmrbeVJ7FqtzThR9QPX6gM4IFYN7x/CtZifdbIytwBF1paUOZbl4cP8VfoH0zmPzVUtMbm8HNiJymqzpHF0KndGKq1lpsyxEwYO30eAx2tgF6HdMVEqehVsbDwmRVPZ7uhF39ovF6//EMhwm3ayApzsp/CR1zYx4Akxvjp2hFVX2/HsKht3vw9yDNMJmNOoSdPQV369LAWMUDtLSulfuBFRCGgET93m6/EsGFOIg8VAtEw5XZtJOt2mM0ZQ38lsvOLAB3jzwg9YEUstzvjfe9CbSYy7GW100+CtdnvZ04FFEDCOT7aki/ylY9+JcBuf/LvW03pllKIOThu0XmaBaL4DU3j3oBX5mjDZ9e12Tl89rZbQ38S5NyKRQVoX3XdOUD3yug+9QJj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(36756003)(2616005)(7416002)(26005)(966005)(8676002)(186003)(316002)(508600001)(8936002)(4001150100001)(110136005)(2906002)(31686004)(15650500001)(54906003)(38100700002)(6512007)(4326008)(31696002)(86362001)(83380400001)(66556008)(6666004)(66476007)(6486002)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJ0RHF6Vk8wMlRRYW8vTjlmSkpFU3BUVFhFMS8ySDlPTzdrQkU1L1ljZVNE?=
 =?utf-8?B?SmtHMTcrYUNueWxYWE90eWxrY2FqdDdFZ1lSaXc3dnhLdUpsMno2YWVJSEl5?=
 =?utf-8?B?WDBQeFFzaGJ6SXlPdXRGUVRQNHpFNVJaVndLbXRiYUlGNFZaZ1BLTUlaVWpT?=
 =?utf-8?B?eEcxMk5za3BpVXJ1NFlRS0tPTFBVb04vNmNtckZ4dzhDZFJMRUlBQjkycGNo?=
 =?utf-8?B?WVVMNFl2S256V2VlSVdJM0VmVlRYSk1sbWpiOVExd3IvY0JWd2pldkZDbVFG?=
 =?utf-8?B?NzFHVk1iWWlmWHJLNzMxRCtjVnRHSXpWNUZLajhSZ2x0b3N6T3U2OFR1VkI5?=
 =?utf-8?B?ZlBteWRqdkx2N2tCendMODkvaVNwaHRURTIxRFNkWUNBTkRKbGM4NkY3Ukl6?=
 =?utf-8?B?YWcxZUtPVFhkTGQ3S2FPWVZRemx2NHY0T013cGVEbitpcXp0N2tYS29qS200?=
 =?utf-8?B?d20xcDBkQmgrYkdSZ0tISEdjeFFSUzlqMnFnYW9JbjZNT3piVjJKQll0ODhq?=
 =?utf-8?B?V0l1YzYrU3ZKQm1Ha1REVnM2M2pYZ1B4WmpZWVBNVmRXVllYejlZbk1QTE9Q?=
 =?utf-8?B?MUJXMkJOMDhQZEFiU0c4RVdlNWZ3Q1k3N3ZwNk9iMkxjQ2huTk52REx1M0gy?=
 =?utf-8?B?M0lmRXR5YWEyakxnMzViWEdab2xMS21NZW9WN3JXcjdCTXc0NU13YU5IdDRD?=
 =?utf-8?B?QUtFKzkvWTlUUGo3bVkwcjFtUzEyQitmLzFnMGE4R0Z1RFYzYWM3RWNvbjN4?=
 =?utf-8?B?QnhIU3RHc2VvdWNYQklyK2VaR1JuQm1HK1E3TnVwb09BKzdYbmlqd1pBdmNG?=
 =?utf-8?B?anJvYVdPY2pDbGtrUUd5eDdaa0VIYTY1TEpnQTBsajQzdnpsZXlpL3UrRHY2?=
 =?utf-8?B?VlFrRXZLNTVXeWoyTmtEM3REMURYSk1zSFZGY0xuVHJvbEN5a2ZNZzZPQnhS?=
 =?utf-8?B?U1BkakxSMFRSNTB3bGpHWURya0hDZTJqdW1iYWFySktKcnVqNDBHK2NNSXB2?=
 =?utf-8?B?dnJ0VmJNY2VsNTJNUE9SaGZHTWtkUjFtTXA5RWFBcUlxUER6K1dGMTNGcGgz?=
 =?utf-8?B?ZzhLWGNoUkxJNjFKbzlaR2JpbVk1dVVCRGoydGJwZnU4NC9KeDJWZ1B6ejBo?=
 =?utf-8?B?Ukw1bVovc0l5aHRjQWFHdnlhcVlaWmFyMERuZElTTGUzbXVlSTFXdHB5c1RF?=
 =?utf-8?B?Yi90Tjh5VE1TTzBFWFNNUGlVYlNmdThHYVcrTlJrdzBnV0MyQWYrZmo0RmFY?=
 =?utf-8?B?SkJ3dDdJSHJUREdxWWxNRnY3SUxFVVpWQ1hpSHBlM29rcW12YlVpQXJ1RWdE?=
 =?utf-8?B?dzQ2czRNbGVNd2lCN0VyRWJxc0RQdFB4c0JOT0dzSWV4cmkvRHBoS0NIeDB3?=
 =?utf-8?B?MjhhdzQzV0VhdDBPN21mc0I2NUFMVmk3RC9TTE9pZGVRWWxwRHhKcHFYdVVO?=
 =?utf-8?B?SVNUOUFXVDNtYkxaVDZ6VXU1U3ZWUHMwc0VXdHZ6T3cwUCtoTStyQnBZQ2FI?=
 =?utf-8?B?V2oreXM5N2kzcUI3UE1nSWRvSnk5MVB6bkdpdnZlU3ZsUkJsZXVubzNQUU9z?=
 =?utf-8?B?MzVoSm1TazJYTnJscEgvWE5SZzdTOHJjcExHYm1vMU0xYjlnV3ZKT1E2bjJC?=
 =?utf-8?B?Q2JaQzlsSzVta3g4MVFxWHJTbUZ3bkxDVnoxQkV2dXA4SEdOWXYybDRjOGk5?=
 =?utf-8?B?NEJ4eSt6MEhzbFUwRFhYb3FGSXY2UEpyeDVZdGw2VUFCS0ZyTUJGcXlMeFZJ?=
 =?utf-8?B?QU13Z1hKM08xZzVBSUE4eDdOS2NiYm5xcVRmYS9vd0NCcmNuYW1QeVFrYlRI?=
 =?utf-8?B?QjJXZkZaM0pWWGo3MWtFb0hGWVJZUm8vTXFnbGdnRHdWSmxtbklyczNBb252?=
 =?utf-8?B?a2l0WnFTOEw3eG9QWjFJM0Rkb0RCOUxDVkdSRlkwMUpjUmYvdmZaSmQ4Qk9I?=
 =?utf-8?B?RnZ4blFqRythbmlPWWpjSjhhdkoyQlJkTDFkREIzT3FaUy9HQkI0S01BMTYy?=
 =?utf-8?B?UkNTMXBDK2cxYkh1cS9zMjNhcVpVL3MrdmNWZFZQMTZLN0s2UFQyRUJGd2Vo?=
 =?utf-8?B?TnREMmdZbmZZalY0QmJpK2VaMnUvRUptVW12Q01LKzgrMXA0dWRENkhjeHk1?=
 =?utf-8?B?ZDl1VlArRTlMTFkraUxVaW8zbFo2STBLYWFBZk9uNE54cW1MRTNDMThsRlBE?=
 =?utf-8?Q?yVSRtxH3XbD+BGFYjjSZIfA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d7e240-404c-41b8-6b68-08d9c2026022
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 08:42:51.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBvVz3y0ctlzq4uKZWUF7yeYJAZLYiZmJJLWdT41kFnjEbWWhnWxYDaNES6FAfuTgrGkRuVyAquBwfh86Ln94g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_004300_391312_C43D58E4 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please take a look on the below patches for aarch64 based MediaTek boards.
In this round we add support for the mt8183 based Acer Crhomebook 314, as well 
as we add support to several SKUs for mt8183 based Chromebooks.
Apart from that we add basic support to the mt7986 in both variants (mt7986a, 
mt7986b). The difference between the both SoCs are the pin-controller capabilities.

Hope you are fine with this pull request.

Regards,
Matthias

---

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.16-next-dts64

for you to fetch changes up to f40c0f800f15e9e3566cb39a9eee2855c634eb5f:

   arm64: dts: mediatek: add pinctrl support for mt7986b (2021-12-15 21:06:35 +0100)

----------------------------------------------------------------
mt8183:
- add Acer Chromebook 314
- evb: add node to read thermisor from AUXIN0
- add several sku's for Lenovo IdeaPad Flex 3 Chromebook and ASUS Chromebook 
Detachable CM3
- update sensor mapping of the board temperature sensor
- add some coresight nodes for CPU debugging
- USB Type C connector description to all Chromebooks

mt8192, mt8516:
- smaller i2c related fixes

mt8173:
- enable backlight enable pin to all Chromebooks

mt7986[a,b]:
- add basic support

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
       arm64: dts: mediatek: mt8173: Add gce-client-reg to display od/ufo
       arm64: dts: mediatek: mt8173-elm: Move pwm pinctrl to pwm0 node
       arm64: dts: mediatek: mt8173-elm: Add backlight enable pin config

Ben Tseng (1):
       arm64: dts: mt8183-kukui: Update Tboard sensor mapping table

Fabien Parent (3):
       arm64: dts: mediatek: mt8192: fix i2c node names
       arm64: dts: mediatek: mt8516: remove 2 invalid i2c clocks
       arm64: dts: mediatek: mt8183-evb: Add node for thermistor

Hsin-Yi Wang (7):
       arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
       arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board
       arm64: dts: mt8183: Add more fennel SKUs
       arm64: dts: mt8183: Add kakadu sku22
       dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-cozmo
       dt-bindings: arm64: dts: mediatek: Add more SKUs for mt8183 fennel board
       dt-bindings: arm64: dts: mediatek: Add sku22 for mt8183 kakadu board

Prashant Malani (1):
       arm64: dts: mt8183: kukui: Add Type C node

Sam Shih (4):
       dt-bindings: arm64: dts: mediatek: Add mt7986 series
       arm64: dts: mediatek: add basic mt7986 support
       arm64: dts: mediatek: add pinctrl support for mt7986a
       arm64: dts: mediatek: add pinctrl support for mt7986b

Seiya Wang (1):
       arm64: dts: mt8183: support coresight-cpu-debug for mt8183

Tinghan Shen (1):
       arm64: dts: mt8183: change rpmsg property name

  .../devicetree/bindings/arm/mediatek.yaml          |  20 +++
  arch/arm64/boot/dts/mediatek/Makefile              |   6 +
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       |  57 +++++++
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          | 169 +++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |  29 ++++
  arch/arm64/boot/dts/mediatek/mt7986b.dtsi          |  12 ++
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  10 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   2 +
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   8 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts    |  36 +++++
  .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |   1 +
  .../mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts  |   1 +
  .../mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts  |  33 ++++
  .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |   1 -
  .../mt8183-kukui-jacuzzi-fennel14-sku2.dts         |  17 +++
  .../dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts |   1 +
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   1 -
  .../dts/mediatek/mt8183-kukui-kakadu-sku22.dts     |  19 +++
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 124 ++++++++-------
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  64 ++++++++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  20 +--
  arch/arm64/boot/dts/mediatek/mt8516.dtsi           |  27 +---
  22 files changed, 569 insertions(+), 89 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
