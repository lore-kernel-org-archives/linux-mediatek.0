Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZNElbYqy2DjUnirWIQaz3S/3yCOxq6/oFBDISUHXNY=; b=3Y3Kjg3ySDqM5qhLyW2nXz7ndl
	fkLCBbmU0XVnxBvWNnAfesrndbsrZlgXI9Zsu5HIJm29k4lva0+KwY96tcTh3M1SM8dbgGurAR+o+
	gy9Qfs00ySwGNQR9oYoLeW8qnuma+UYhEDJQvDlBDqQpyNV8rLo6pfKzhf7r9BF3uBE9T62EbuiuK
	8SNrY5koJ822eoTsUefrq+5UFtmhBXzqGeiMxk2DV+nd+wuudUP2jD1teTQ1tMHguiuMO/afjNRgR
	zvulfBqbljN8GF6jH97b6BJA+cWXQ7oOPefoWMcU2d6XZiWbv2sJTSCTltsL2mhQWGUGpXtAPgoYN
	VPMH/f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noM6H-000nzV-94; Tue, 10 May 2022 09:24:13 +0000
Received: from mail-tyzapc01on2071e.outbound.protection.outlook.com
 ([2a01:111:f403:704b::71e]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noM64-000nuL-2o; Tue, 10 May 2022 09:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R55eKXJ2Oxm8bkYzHSh6zFQXI0yvxMI6SweBJif/zHJMHgbMz4Jj0BAL3Pg6d8TV0DtbittSI4fPNtoevw0G3F7ohL6JvEFUnx9cFudBLIXRVYb8NzbY9gJi1M+nweDnmpJQK7tdGkfNGPOO5hNveriOVbZNKtqyxefJ9WkSN6b4GHjPb/m8oYWdl+c52I1KhS6PLtvJNWXg/Lpy4QN6l45Xf95kI/+3rqZrJuepW4B+5dDAWarBNdv9KpAV+7D8YHk7jndlNyOX4iDPTiMKr2pKT/jgsGdAh6pGBqII1UhhuWGDgTDYEGCseYT1dlW+E+UWE1VIox6py/mV8LLRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MqR63Kt5dc27AalzTJyg8f9+861YYLsAHD7qfSHlpA=;
 b=N/5uo06rY0XMjSkJfJoH9JTh8G108DXGTEZXD7yx4y25DS6BYyi66hfyKtDhaZo8qmmpoiFVxy8YbIY9NcUErFjxcEIh/yua/J1Uy8RLwZwyu17WEhyEOQdK/VCK+gQEXrBQ4mx9wkIxueIWpudb63TQqtWmLOAZLBEhjjxzxZqkNnubC2fx5WDqtB93KIo7zowzRxOVt6hDmGvMkNte2KgI2tNL1uwOSd4lNGSIMrzVfz+nUod5nmTlcZgPvLcEURojSDaOI7ytCxI6WKZOu2j8LSxOXT3u0yxsd3Gw4hlxwSSbG2gvfA4VEOJARNfTpIEoLToTIsjvxNhamS8qpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MqR63Kt5dc27AalzTJyg8f9+861YYLsAHD7qfSHlpA=;
 b=mBgm3xPX9hPfidk7mGMeeud04sZ/wCnBJZwX81ZiPaXrFu1ZFMOaSNPdNifPsNukdW5YIYn7o3QIwpa389iR/o7BlyY1j8UNnIYCdy2hxf6kt6MS37AiCtuEPj/EcCbCBlx+n1P3NVvfl72+cXGp5mZq8GmUkBx8PoKLO9FMW/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 HK0PR06MB2100.apcprd06.prod.outlook.com (2603:1096:203:49::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Tue, 10 May 2022 09:23:53 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5227.022; Tue, 10 May 2022
 09:23:53 +0000
Message-ID: <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
Date: Tue, 10 May 2022 17:23:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220510090531.12438-1-wanjiabing@vivo.com>
 <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
From: Jiabing Wan <wanjiabing@vivo.com>
Organization: vivo
In-Reply-To: <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
X-ClientProxiedBy: HK2PR04CA0070.apcprd04.prod.outlook.com
 (2603:1096:202:15::14) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab7d3aa-afc2-4978-97c5-08da3266ccdb
X-MS-TrafficTypeDiagnostic: HK0PR06MB2100:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2100EA9704EE6078753857DCABC99@HK0PR06MB2100.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EH83arwOFG3WFH6KWwLaUKFGiOLZBeRWy7Tjx/ZF/fhzbUpJmF4fEhQkEV5NUoiLQ5N7LEx1644V7Uhiv+Wh0z3z4ukHLaK6EnarA439RwBkEQjtoYr9gbfXUKj8k9mF/KoC3NG+Y2Z1yqYh7diBnKA1uy3gwab80PFfnlCn+wu7VXADBQfwkoZtszyc4x7NlCNEToDz9JVEqOEshm7ZlDU8xy5LpSMvGIdE6dG3Ot13j9cMwIRKAQZKY+cZjFOvKzxpJPtCA5lI2v6AGX8ZUPpDfSAqkO0q/UbAoe0CJEIOf8hSU8G3Lt0hdhuTalrr5F5vnhKT7Ub9Qj/10rzaT8DW2kIjbuAEjzeNlVDe9e9z8Smi8cblI87Hva8zQ/PUOkyG941dHyzMGFsPldCsBJ01VltKjYPDTuX86jkw5GhyAMnul4jHL9/eujQWVNt4B3GT0wMm3ednPS6bjO3pf9tFUpSvZRVD6rFCJwFadbcbiZh9EkCjFNGIsuwtx0WCJ8p0ShhZccn50+SFQNFbnhJDlsgLXwPZTqiRvGqvCxsoqUq1v46qqkEUrUmrYbFc7q6EjIK0tyIrmN8a3x/mDK+H8+rC02fZex/7SCTM6STzzerN9fuE6YWHGee2QSJE0sL+PYfov01eoq77ZxDHpF7HIRvSDiuzFZ4tE1yJYBdkHp8e7jCKpOUkX36Vyh0/jCvFJc606D8JJXsI9M2bd3GdepJ7UwtgB+p7yQGlcjLy/+oLFMYwotcauAQwUbHjQYEDlRFY7CSu03ykVP7rFDUSxqnjMrBPMCoG36mo0bnH2iafXFy80/V0070d1X45lThHCCddKvB3uJyjIveF+EtjG68U0CJrnley9p93nAyi2xCSviG/ajEdZBIe7elX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(86362001)(38100700002)(38350700002)(26005)(6512007)(49246003)(83380400001)(31696002)(186003)(2616005)(316002)(8936002)(66946007)(31686004)(66556008)(66476007)(8676002)(4326008)(4744005)(36756003)(6506007)(6666004)(5660300002)(7416002)(2906002)(508600001)(54906003)(6486002)(966005)(52116002)(36916002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVMdHl0QVJqMitWVHFlandjelJNdndpYUZlV3hORlJ5eDVUaHB0MGdiL0pO?=
 =?utf-8?B?cWF2WU5nN0hTNUVvMVZPTkFOQ2tSUkhodDB6d2pUUWZtYUhyaU9ndDNIUlg4?=
 =?utf-8?B?RU9MRE5BUmpxVGZrWlVHeTdBSzhOb0FWMm9TRllKVlR3SlBzcVVrdkplZ3RR?=
 =?utf-8?B?MlFVSDVVQ2ZjbUFmWnJWY1pEQTNYQ0ZhVzBUQk9SaldXbGx0dk9GUUdEQ252?=
 =?utf-8?B?N05sZWo5N1VHU2tZTDNjdWVnVS9qNTJMUElBTzVxN0VIdnQ3VERpNTRZVHdt?=
 =?utf-8?B?aVdqZnkzTWVwQjhFSC9PNjR5cStuMVAwSnhMa1ZTbjFacFIxblJ1YjdKb1NI?=
 =?utf-8?B?Qy80Yy9mcHV0aHkrdWFWMGNSWUpZRytkMW8xREJZSEU3YTIrM0dwblh3K1pV?=
 =?utf-8?B?dXU3cW9rY3Q5bEptcUlnaGkyU2JETFIzVEVXVUQra1BGeC9OYzJELzlaRGE4?=
 =?utf-8?B?ZEZNSmY4cUxiTm82anlEVDZBSUhOV3FtUnlSRWtvY0dpa2lWVy9GdUV4ak11?=
 =?utf-8?B?aHRzd281alE0eEg3U1JGM0lHSVdpSDUxei95dlJZS211eGdLK1Y5SHNxZjUy?=
 =?utf-8?B?cGRLY2FTMlM2aDdqdEp0VW85dkxZbjhUUlREdmg4cGhPUnNNdFRtb2VOQjkz?=
 =?utf-8?B?clIwNzVhMk02dGhrNUhBWElmcTFTNW11ZHRrY0dodmNmbndjRzcxQkhleUZH?=
 =?utf-8?B?MU91akZoS0lDcCtIaHQ2VkF1NHZsaytCblFUaWhoR0lSRXl3UmxoYnFseHJW?=
 =?utf-8?B?Tk9hbGxQaVdBRGtKU2VrN1UxSkRmWW9CWXpEVnJCTUVsUWhab0Rud2VjZUl4?=
 =?utf-8?B?aHJ4RTg5LzBYVGR6cVQzcnhxay9ZSzArK29pN01pdmljN0JpdTNQU2gvdVpt?=
 =?utf-8?B?UDRXK3p2WDdjLzB1N0VxaURWaXJQV3QwdmtCdThWeExMVEp1SDRxYnNZOXo5?=
 =?utf-8?B?UUIwNGJFVlFncTRvbEdRajcxQXQxMFhCb21aM0Mxa3o4V01KUTBZa0htTmN0?=
 =?utf-8?B?YUZ1WHBweHQ3YU5JRWprQzh1YytyYUZjdFE4Qlc4Nk83Q1MvVnptZjRoREtC?=
 =?utf-8?B?UVdFOEJTVHk2bjNyYlpLUHYzVldwTmJWbnhOalkzMzltYXBrdEtmVmdDd2ZV?=
 =?utf-8?B?Z20rTFBhd3o2aVpDVTM4MEQ1aU5mTEp1VC8yQ2JaakszMmFDY3ZYVXRWM0FN?=
 =?utf-8?B?MFoySDhmWEdteitsdXFRSVQzM0x1R2l1YkMzUVMzd0NLZGR4RmQ3YzU0QmZx?=
 =?utf-8?B?YkRGYmpuRVZWUlZCdnlNd01Zd00zcmROOE1FaUswSFN4b1hVQU5CT05HenVt?=
 =?utf-8?B?RDh3V1JNaUxzZzJ3aDFjV294cVdvbitMb0FyM1d2RHJTZ0hZaXdEYTdybE9C?=
 =?utf-8?B?ZlJ2RTY5eDlZcmg3MnBNRDBQOWJFRC9vMU51bFY4Y20wdElkZ2hDTE1Ob01n?=
 =?utf-8?B?Y2JzeDZqbi81bzdBZU8rY240cTd0aDFpRC9Ra3ZXODNDdFpseVJsRzhXN085?=
 =?utf-8?B?OW42dkRZVmQyaHUvaGtDMHF4aU0zaFA1ZFh3ZTJyWW9lbkVJaFBlYTh1UjQ1?=
 =?utf-8?B?N25Jc3lXck1VbnVNQ25DRU1sbC92dmlGVG9UUU9va2Y1RzZ1ZVZlK0dnaGpB?=
 =?utf-8?B?aXZMaGM2aFFGeG5KaXZkYzJHbHRWOWx3V3RCS0lmc2NqT2hUOTM3SzVxck1F?=
 =?utf-8?B?dWtLc3Z1RjE5MVIyZ0VNUlZlK25aRVZzTzlLbDd0Nm5JV3phbzRWa3EyWjJI?=
 =?utf-8?B?YUlQd0FTY1N3R2JxWnhtZk5GZDYzMXR1bURHNXpwZVVkNUJmajN5cTJyVG5o?=
 =?utf-8?B?VXZrSE91RXVGdWxZbEZWdU54NjBKZmxUZXJqU3RFTzNjdDNEeGJRaFZOZm1y?=
 =?utf-8?B?M3BLYU1teXFPS3hxNkJpUnJxeXJPMFhPK0k3N0N5cHN4Q0VwT215amdwN25i?=
 =?utf-8?B?emoyYmI2Q0hoMTFnUnVHL1dQVlBnb1ZqclpKOERQSm1xdWJTM0hPSjNpQys2?=
 =?utf-8?B?QVg1MXdVdDNkc1JIZkZMTnhKeEFNTzk4N1daL3hkbzJub0NzamsramFCT3hN?=
 =?utf-8?B?WXYrR1pXYkF6MkJvZmhsRnFtK2JyRGhxejg2ZTRFQVhsanpBNGxNYjk0aUxS?=
 =?utf-8?B?Y1FDOHlKaWV6R3M3U0xpOGptZklLZ1NsNnZtalR2Zk43bEhvRDRRWHZwZ0RG?=
 =?utf-8?B?aTQ5UHo4NnRkc09xekREM1Q2bG45eXc3UE05cGp0TXFSc0RSYUhCcVRvSXFm?=
 =?utf-8?B?SXR2QjE5cXh5WVl1TzJHUXdUemxldWdaeHlEejUyU1JiU3c0U2ZUQnJGcWFN?=
 =?utf-8?B?UEhCVzlFd1ZsQkpJQVhHV3Y4TlRJYTNqVGFER0l0OWFLeEVkYS80QT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab7d3aa-afc2-4978-97c5-08da3266ccdb
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:23:53.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIuFCIq6pVpVraukljgem6xQhZMKw7h7E1YD/foZXAmw6UQ2wHQBRr7m3Q8NQ8Wd4JVLhwWqqsnoJxVbsYKIVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_022400_164665_015F6FB3 
X-CRM114-Status: UNSURE (   8.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIyLzUvMTAgMTc6MTIsIFZpcmVzaCBLdW1hciB3cm90ZToKPiBPbiAxMC0wNS0yMiwg
MTc6MDUsIFdhbiBKaWFiaW5nIHdyb3RlOgo+PiBGaXggZm9sbG93aW5nIGNvY2NpY2hlayBlcnJv
cjoKPj4gLi9kcml2ZXJzL2NwdWZyZXEvbWVkaWF0ZWstY3B1ZnJlcS5jOjE5OToyLTg6IHByZWNl
ZGluZyBsb2NrIG9uIGxpbmUKPj4gLi9kcml2ZXJzL2NwdWZyZXEvbWVkaWF0ZWstY3B1ZnJlcS5j
OjIwODoyLTg6IHByZWNlZGluZyBsb2NrIG9uIGxpbmUKPj4KPj4gbXV0ZXhfbG9jayBpcyBhY3F1
aXJlZCBidXQgbm90IHJlbGVhc2VkIGJlZm9yZSByZXR1cm4uCj4+IFVzZSAnZ290byBvdXQnIHRv
IGhlbHAgcmVsZWFzaW5nIHRoZSBtdXRleF9sb2NrLgo+Pgo+PiBGaXhlczogYzIxMDA2M2I0MGFj
ICgiY3B1ZnJlcTogbWVkaWF0ZWs6IEFkZCBvcHAgbm90aWZpY2F0aW9uIHN1cHBvcnQiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBXYW4gSmlhYmluZyA8d2FuamlhYmluZ0B2aXZvLmNvbT4KPiBZb3Ugc2hv
dWxkIGhhdmUgYWRkZWQgdGhlIHJldmlldyB0YWcgeW91IHJlY2VpdmVkLgo+Cj4gQXBwbGllZC4g
VGhhbmtzLgoKT2gsIHllcy7CoCBJIHdvdWxkIGFkZCB0aGUgIlJldmlld2VkLWJ5OiIgdGFnIG9u
bHkgaWYgc29tZW9uZSBzZW5kcwp0aGlzIHRhZyB0byBtZS4KCkxpa2U6ClswXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvWW5rdk01aXVTdUFPcUJnK0BsdW5uLmNoLwpbMV0gCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDUxMDAxNTUyMS4yNTQyMDk2LTEtd2FuamlhYmluZ0B2
aXZvLmNvbS8KCklmIG5vdCBleHBsaWNpdGx5IHN0YXRlZCwgSSBhbSBhZnJhaWQgdG8gYWRkIHNv
bWUgd3JvbmcgIlJldmlld2VkLWJ5OiIKdGFncyB3aGljaCBtaWdodCBib3RoZXIgbWFpbnRhaW5l
cnMuCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcHJpY2VsZXNzIGFkdmljZSEKCldhbiBKaWFiaW5n
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
