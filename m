Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Trsw2uEECseitoJNadGOupsUEsR/D4//Os7GJItlXTk=; b=ApX7/xrAcCgLUq6w7sckP9jA0X
	wFc+xYm57Z2CdTa0D5zqmk0E81eHtOe/jQCTeHk7jWA1M2ARdIqLap4Vv2c8o4buX63nIJPb8/eSg
	nARHJNq277f/ga3bbQOfDSX/84bYLIay4lzqvk9A0OWiEoP4KcpJVIU8eHvEVSKhhQ+Jx+N0C43LX
	Y+mNuzTRJctwVgznmBXfXDxzgwDLmtp/bRjw07+WlSyTvT3AFVYlKUWucQPlZKDE0quhjGWhTmsau
	vbVEOBXysbX8e8a6rHEIbfWuTFXMqw2r3DovgCWlNjTO2VM4r/J/mjUH29/tjTSOr2tiPijJbkkMG
	Lqq8k0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Gpa-0082qo-UA; Fri, 14 Jan 2022 07:17:03 +0000
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com
 ([40.107.244.40] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8GpH-0082kv-QE; Fri, 14 Jan 2022 07:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp4Dc/mzMZbYOLnvrNS6lcYeu/ojPqn/jji5HNQsYkHmTJhpQkYZzx02qOyKqZ6t4kjIPwSee1QTZ3CEM6fnFwJayPRX9L6VtZIqYTZ4peKAD2Duck7sMB2DOElTqOvTWnlNTyNwoIlw79urXcZ666QycwxlrJ5rgNbvAAxeCf7LhboblIAdhlzq2X6r6U0Kn2BdRwsGCKF+rK5gxT1g8edgY9ksrcWpuLQKdYUiyP8eT7zSRpgE9wErJQRMC4vjbnnqisScxEUntbMz3nTf/hXpzeubMcJlbsBGDJnR91GHL6Nl5ctdnBnMjm1qM+7ILy3yZhFX6yLaZsqeFnX1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4YGYzpqhydG50UG1r0lJhuJ/hvrWmb6ePIQFPRI8Do=;
 b=mkgibP7U+wHpOeSoknKhMMPgNVEYjUWnJxV5ish6/JTnHQKbCCQqzpB7okRvvz7UFXxMhz3MXvcf5drKarB+HhlQhmzfJUg6de9sxzH681SuZrZBZWWSOvXWzGW/FQQNdhrLOgecl2GYX0xnZLM15MB8EOLF5MMw+kpFBGL9M+kEHWreV5lIGV9j/fiqxPcfaqGTAQpiZPKaV93vKEB7DbE8cmzk+CS218Eozijen83VRsevKna2D1BrxadV2hZYs8nzzUVUMdWyhIjwGttcRPo6E5Qam4HMGYyHZSMSSVLTHSd958skgFS+ztoUCKmpdA7FYuhPWhmlRqfyhOmsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4YGYzpqhydG50UG1r0lJhuJ/hvrWmb6ePIQFPRI8Do=;
 b=oCm8e8wIsNhQeClCnouj2QrZOAb1FZ6lbOL+UGZtn9LyqZKmB/5LGffnwKrelTmRlI56DepLHz+Zf6npA3tmZ6U7eOopLAO0v8TulaGLJBPsn/DZVek7uu2ZOOgiJuWoc8+l8YomGq0BTHcZ3HhD2oz+ladTFqHa4dPpZBw7vkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by BN6PR1201MB0210.namprd12.prod.outlook.com
 (2603:10b6:405:59::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 07:16:41 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Fri, 14 Jan 2022
 07:16:40 +0000
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: John Stultz <john.stultz@linaro.org>
Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "labbott@redhat.com" <labbott@redhat.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
Date: Fri, 14 Jan 2022 08:16:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::39) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 523cd04d-5346-49f8-7d54-08d9d72dcf9a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0210:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0210240F26477824A724CD3983549@BN6PR1201MB0210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8bpkGMVZfLgbmZAVdz2ZF7t8c4nmVEBlmPdwzoiIclJaC9gfgKwQZuVQvoxupboHBUCcBrKcZhe1ZThWBebHdLfvPvoVlehXOyxKK8ZgZNed7rkj0on1rPL4o3t1Lgxh2+/LIdDnaJ49+mRIzyXt1FfR1DqMG97AK/aofvfcG+qyWh4zKZxbsCjAPKnVGPRZp4QKw5LKy8fwFjzx1R2pjOfmwHvGyB3+9kxlUOqYeVznGxBK1bKF9NHy+KlKr3ei6ZHOgqTt0B9uuCEh28wFNfEmFtXeNH+BcPyXAt6C1OMDXIjybZK3G3wrhWZ5uqnEAtiPZ1Z+H6KypqH9RSjmRCux1nk4ENmGzbqdoOOBtBNlb1FBqiT5JcKr8bG/y2/8KxUpko76wIwPK6MCcmWKEFeXdmbr1E/io6iRU/hF9Vv5lHiY171znb+NOd2LqKS5ZunmIMJtByGoIyZgQmfjv9OAlzCUhJFdApl8PtjQDzlSFL4OBb+p4zTFPdLNSsDT9PjLn3JLEKo23QtgmHP4LqgLThJkGx/HhsfJic5UIJ5XyPVWPJrJYPEkp8+1QlOpccEFAgjUxiNBeMxkvnu9En8iFHeSzMe9XrTi9pWhVXS8r6+xijfLX0uk+usJS5DylQ/8Q/fSVwO0Ghz7BS0J40de/lwmeOf+Xwr8Mup2fBSSV12wjE6sK/j81GtAlEVa1tvdTQITu/wjcJrNl5VzOe97zhRYIEsJD9AUQqBMzEP8Ghy63KL2BqhrEUuudiV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(26005)(66476007)(8676002)(5660300002)(54906003)(8936002)(2906002)(66946007)(6916009)(186003)(83380400001)(4326008)(36756003)(2616005)(6512007)(31696002)(7416002)(508600001)(316002)(6486002)(31686004)(86362001)(38100700002)(53546011)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNnVUwva1Y2MmdzeUdNRXowa3dTYWVoR0kyM0ZKQy80eEJIbXFhR3hUeTQ3?=
 =?utf-8?B?ckRzKzdFMUZCZ3BZNEJWQ0V2WUYyblFabTc3a3JZNTJVSXBPRkgzQU5mNHJX?=
 =?utf-8?B?NEl5azg0MmpuampjVWZTZmVGd01iNUVxeUxkdm5DRFdUa1RBVjBZMmRLMS94?=
 =?utf-8?B?ZlJMY0hQTTk3YzNsbityU3pXajZMV2RDY2hKSFY0aVB6UEhGQ1FIZ1lFeW42?=
 =?utf-8?B?aklZcTVzemNGbEpqamhtbUhqT05hMm5NSTBXdGFzb2tsMzNUTVNRMEhTMmVq?=
 =?utf-8?B?OUU2QWp2RlVycGFzOWUyNEhPZ2RJZGJhZE9FYVF5QkcwTWpxZzAyeVQ1Uk85?=
 =?utf-8?B?MDNNNFRSa3lvU3QvbjVnWnpJNHBVZUFBazFQMHpwN2kwTzQvOTdEQjZrZWtU?=
 =?utf-8?B?ZUcrdWplZ3lTalNVMkVrSHFpN2hqdEpnSDVYU3JhVWYyRXJDQzdYempTQjBu?=
 =?utf-8?B?U0V2TFZyMjlQVEpEM3A1WUx5VkpnOE50ekREcHRlenVuS0ExWE00cHlTK2p1?=
 =?utf-8?B?QS8yWnltSWRibnBrM1JaMG1PSzNtaUFUYVQrcVorMnM4ZmIvNC9GSTl3VlJh?=
 =?utf-8?B?eHR0MzYzcGxPeUowOTlubEdTdVZnM3ZOUVJya3ZkeGd3ZlNOUmNIaWJyVUhs?=
 =?utf-8?B?Ky9tU2NZZEd2ZlFqOGJCSXZhZkt1aExYN0RLdnhDMUZ0bHhQRDNSRnREczVs?=
 =?utf-8?B?YU0xbFFsQUp1c2tOck9vV3M2WWVCbE85YkhGRUhSTjdRUnJXanR2RW1DazRS?=
 =?utf-8?B?QkhpdlFlclNZSzBqMndkNm5NWHdjMUJLN3NOZTY0dTBSY0RsN2RhM2lzM1lS?=
 =?utf-8?B?bTQ1VU9lYWxKODdqS01mdDZzNWwrUlRJcERaWjlDcmEwckcvZERla0lMRnhP?=
 =?utf-8?B?K0J0VjNMeHVEUjA1RFFqSmgxQ1JzSmp1MDBVczNMb25CbzE3WVdjT1EwS0V0?=
 =?utf-8?B?QVlEQURXRE5aUndzQ3VjV0dhMm40NGpKOFFJeFZwNTNFTU45YzU0WEcyZmRX?=
 =?utf-8?B?MEZ0SjlpaW11dEVPMjZGK3pYT0R0cmh2RU5hZTBJemwwckQwUXd2ZGU2NE1p?=
 =?utf-8?B?VzdMZlNhS0wvYjhLWVJqSHhqYjNPMi9wSkt5Ui91R1NmT3hJYU80bTFIbHFK?=
 =?utf-8?B?MzMwdzNYNXRKTUJKdCtMRkNjMjQ5NDBrMVpxZmc3K1JveWxzTlpkZi9XMUFW?=
 =?utf-8?B?UXlFVmdweldEeGFUeTlYNkZhWllVNkxiZ3drQ2tPVkE2c2ZFZFVrZmtZMGZL?=
 =?utf-8?B?Mm5wNU5iVjhxVlFmSUdQNkpSZ3VWMnJuVnlTNUJxeEJQOFRBeWg4dzlBOGJQ?=
 =?utf-8?B?MUg0bGI5VEY1VkZCUWlkL2tpVEs3ZDBVcmtKZWtObllNaGJyU296Y3Z3VmI1?=
 =?utf-8?B?Q08vcXQvUFBwNzAveEJTcUhGWGNkRWEwNE9LT1g5YXVEZ0FzRDdrblpVUWNS?=
 =?utf-8?B?dXFOOXhRNDFYVkpFSnpwODFiTytBb05jK3VxRmpqYm5lUVVBcm5CVXNJUHJZ?=
 =?utf-8?B?Rk1BZ1NPRVB5UW5uK1Rtck4zLzVPTTJZQmhWbHdhblZzZjVwaFpjYS9USVVQ?=
 =?utf-8?B?UHViVVl2RnVSQzlFSzd6c2pLakxzNWp3dnFCUlFPdlViUFpkeGxpNDFJdmdR?=
 =?utf-8?B?OC80bmhtNGhUbTNKYy9ZZnlhRGxhVWh0KzZBUFBpaTJVOVh3Rk5ZNG9LZ3Iz?=
 =?utf-8?B?OUp3em1wN2w5Mmh6VENyVWJadUgrUTJRanVLZDBzYWpDeGVvYWRwcHZIL1Zx?=
 =?utf-8?B?bDcxVGlrZmxmRG1wSGNMSlVJaUdWbGtCaXB5RzNaQS8veDlkQUVSQVJWL2xK?=
 =?utf-8?B?NjVUOWpiWnR2R0gyNmM1NHVWRWQ5eHN6WmZaeTZ4ZTJiblY4bmY2OG1pVHov?=
 =?utf-8?B?M1BOWmc0ZnNCeC9RVG5VSEtvMU5RdjRvajNtbC8rQy9oRHlPU2ZDc1ZMZG8r?=
 =?utf-8?B?aXlRNjBhZ1l2L1NhTjQ2cDFTYkU1UUlJY0g5ZG9JUXFrKzJCbnpCVWU2SEgx?=
 =?utf-8?B?WGxWcndncm5hUDRwR1dZcnM5U3U4LytnVFlwVVRsTzJ2YWFkWU1aUkZnM01H?=
 =?utf-8?B?dU05eHZyR1NFUk9icU1NRXBsSEN6aU1wbnNMZnRyQkRDV3RuZHd2VTl3MWZi?=
 =?utf-8?Q?BoLI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523cd04d-5346-49f8-7d54-08d9d72dcf9a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:16:40.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPy5XcfbxMexvhvTV6UrXBjMOLo17XYewv0gQDBGswg7pUNAEydXCY+xMyebvhiM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_231644_046381_E1D4F0F2 
X-CRM114-Status: GOOD (  19.56  )
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

QW0gMTQuMDEuMjIgdW0gMDA6MjYgc2NocmllYiBKb2huIFN0dWx0ejoKPiBPbiBUaHUsIEphbiAx
MywgMjAyMiBhdCA1OjA1IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4gQW0gMTMuMDEuMjIgdW0gMTQ6MDAgc2NocmllYiBSdWhsLCBNaWNo
YWVsIEo6Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
Cj4+Pj4gUnVobCwgTWljaGFlbCBKCj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+
Pj4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YKPj4+Pj4gZ3VhbmdtaW5nLmNhb0BtZWRpYXRlay5jb20KPj4+Pj4g
KyAgIC8qCj4+Pj4+ICsgICAgKiBJbnZhbGlkIHNpemUgY2hlY2suIFRoZSAibGVuIiBzaG91bGQg
YmUgbGVzcyB0aGFuIHRvdGFscmFtLgo+Pj4+PiArICAgICoKPj4+Pj4gKyAgICAqIFdpdGhvdXQg
dGhpcyBjaGVjaywgb25jZSB0aGUgaW52YWxpZCBzaXplIGFsbG9jYXRpb24gcnVucyBvbiBhIHBy
b2Nlc3MKPj4+Pj4gdGhhdAo+Pj4+PiArICAgICogY2FuJ3QgYmUga2lsbGVkIGJ5IE9PTSBmbG93
KHN1Y2ggYXMgImdyYWxsb2MiIG9uIEFuZHJvaWQgZGV2aWNlcyksIGl0Cj4+Pj4+IHdpbGwKPj4+
Pj4gKyAgICAqIGNhdXNlIGEga2VybmVsIGV4Y2VwdGlvbiwgYW5kIHRvIG1ha2UgbWF0dGVycyB3
b3JzZSwgd2UgY2FuJ3QgZmluZAo+Pj4+PiB3aG8gYXJlIHVzaW5nCj4+Pj4+ICsgICAgKiBzbyBt
YW55IG1lbW9yeSB3aXRoICJkbWFfYnVmX2RlYnVnX3Nob3ciIHNpbmNlIHRoZSByZWxldmFudAo+
Pj4+PiBkbWEtYnVmIGhhc24ndCBleHBvcnRlZC4KPj4+Pj4gKyAgICAqLwo+Pj4+PiArICAgaWYg
KGxlbiA+PiBQQUdFX1NISUZUID4gdG90YWxyYW1fcGFnZXMoKSkKPj4+PiBJZiB5b3VyICJoZWFw
IiBpcyBmcm9tIGNtYSwgaXMgdGhpcyBzdGlsbCBhIHZhbGlkIGNoZWNrPwo+Pj4gQW5kIHRoaW5r
aW5nIGEgYml0IGZ1cnRoZXIsIGlmIEkgY3JlYXRlIGEgaGVhcCBmcm9tIHNvbWV0aGluZyBlbHNl
IChzYXkgZGV2aWNlIG1lbW9yeSksCj4+PiB5b3Ugd2lsbCBuZWVkIHRvIGJlIGFibGUgdG8gZmln
dXJlIG91dCB0aGUgbWF4aW11bSBhbGxvd2FibGUgY2hlY2sgZm9yIHRoZSBzcGVjaWZpYwo+Pj4g
aGVhcC4KPj4+Cj4+PiBNYXliZSB0aGUgaGVhcCBuZWVkcyBhIGNhbGxiYWNrIGZvciBtYXggc2l6
ZT8KPj4gV2VsbCB3ZSBjdXJyZW50bHkgbWFpbnRhaW4gYSBzZXBhcmF0ZSBhbGxvY2F0b3IgYW5k
IGRvbid0IHVzZSBkbWEtaGVhcCwKPj4gYnV0IHllcyB3ZSBoYXZlIHN5c3RlbXMgd2l0aCAxNkdp
QiBkZXZpY2UgYW5kIG9ubHkgOEdpQiBzeXN0ZW0gbWVtb3J5IHNvCj4+IHRoYXQgY2hlY2sgaGVy
ZSBpcyBjZXJ0YWlubHkgbm90IGNvcnJlY3QuCj4gR29vZCBwb2ludC4KPgo+PiBJbiBnZW5lcmFs
IEkgd291bGQgcmF0aGVyIGxldCB0aGUgc3lzdGVtIHJ1biBpbnRvIC1FTk9NRU0gb3IgLUVJTlZB
TAo+PiBmcm9tIHRoZSBhbGxvY2F0b3IgaW5zdGVhZC4KPiBQcm9iYWJseSB0aGUgc2ltcGxlciBz
b2x1dGlvbiBpcyB0byBwdXNoIHRoZSBhbGxvY2F0aW9uIGNoZWNrIHRvIHRoZQo+IGhlYXAgZHJp
dmVyLCByYXRoZXIgdGhhbiBkb2luZyBpdCBhdCB0aGUgdG9wIGxldmVsIGhlcmUuCj4KPiBGb3Ig
Q01BIG9yIG90aGVyIGNvbnRpZ3VvdXMgaGVhcHMsIGxldHRpbmcgdGhlIGFsbG9jYXRvciBmYWls
IGlzIGZhc3QKPiBlbm91Z2guIEZvciBub25jb250aWd1b3VzIGJ1ZmZlcnMsIGxpa2UgdGhlIHN5
c3RlbSBoZWFwLCB0aGUKPiBhbGxvY2F0aW9uIGNhbiBidXJuIGEgbG90IG9mIHRpbWUgYW5kIGNv
bnN1bWUgYSBsb3Qgb2YgbWVtb3J5IChjYXVzaW5nCj4gb3RoZXIgdHJvdWJsZSkgYmVmb3JlIGEg
bGFyZ2UgYWxsb2NhdGlvbiBtaWdodCBuYXR1cmFsbHkgZmFpbC4KClllYWgsIGxldHRpbmcgYSBh
bGxvY19wYWdlKCkgbG9vcCBydW4gZm9yIGEgd2hpbGUgaXMgdXN1YWxseSBub3QgbmljZSBhdCAK
YWxsIDopCgpZb3UgY2FuIHN0aWxsIGRvIGEgc2FuaXR5IGNoZWNrIGhlcmUsIGUuZy4gdGhlIHNp
emUgc2hvdWxkIG5ldmVyIGhhdmUgCnRoZSBtb3N0IHNpZ25pZmljYW50IGJpdCBzZXQgZm9yIGV4
YW1wbGUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gdGhhbmtzCj4gLWpvaG4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
