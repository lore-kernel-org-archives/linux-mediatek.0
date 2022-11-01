Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32659FA3741
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 02:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KCgIwWUZ75jibR1AKvPtfdWSg3rKsb1q8fqTXUP4jk=; b=QYmOEtJPkGQR/UpHb3CSoknLoj
	1ReeCgwCTRwPMiDJO7rUQZkQQ0H//6uOVqgoucfCg6A8Etg4uAkxLz7peyOW/+n2bz5tD3UzYZvR7
	B+/uPzeQCYpZgZiel13vpjYLAB50qJ0ymrEkZs+6fYlD8HppL0WOqtegFltrEZTQGr60y2mNKqBGU
	8BakTpy1LeyOXCdDfxtsrr6JAoOOoJGgit1nZzdkTTNU82Vf5aeVq0QtD7kMnWgZZ98mW9Vgjw8yK
	ZRvN18q0i4JsQ/e0cYTJvMh0e32T0FXrwhsXzn3oKSh0tqCd/2tNLAKu/nIbnVqcL4wnLZW5IvUX3
	+qrzpWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ophDW-000sY2-Vl; Tue, 01 Nov 2022 02:41:30 +0000
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com ([40.107.243.127] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ophDI-000sON-6k; Tue, 01 Nov 2022 02:41:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzhYPocPhiXA4kw/41Hv4WASenXFNw1pKxuoaPOZYt+Ivtow/4DlIx/fZ4ccf+WuH3peKEtDjdOKMooR+MdcXq+TTH39dCadlg2vSH5oeko2GQvmDX9G54eyg/12ti3o5AyoPOFQmr9zn69eBsssq/2KvFCXYB5K0sQNN1tFpuO1pFGAbU5DT4kYNIsfoaH8jZj8dsuE32R8j9RYWcapbHVESe5adDXcjWkaaAvwgS4NWG3Bl6xgRjv+VJl3SPWL6XxmnmJ8qVZnNnXWuWL2o3VL/WZtC9JvX/q6Vr+wZDLiiIXlVy4voG01lE3gEApsDt4iXsRfUv0wujwZcFRFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KCgIwWUZ75jibR1AKvPtfdWSg3rKsb1q8fqTXUP4jk=;
 b=AnX63wLCEjh+6s5AAaKn6OoHMdktthdxLUeZmas7xUNkCIu0C6zCttn4C0LjxYottvRw+wi8il6XGZNJ+CZb0HrzyJ+JpHi6Do1xiBmlzkz1wSqDRLWxEr2/jjb7+2uDVCvLWaKdQvebqpnXMARFC34QHLj9vsAMhDGD4l+rvVyo4Scf2fYYnY943ZcqAEkN2E7RVX/Sx4WrgkDSTZRjAe3gBecDDI6l3RWjsy0lbMKF0NHqYlNQxBchT4kqYbCDjpbhPtOx0XtED2xplceQ69LUWoycQEIrPnKmL4gTWDZU3o36mLemsHPzoLbI4V3WStS7fQB0Xw+7zAoAe1lQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KCgIwWUZ75jibR1AKvPtfdWSg3rKsb1q8fqTXUP4jk=;
 b=p6eBEg/EvsBo2875ZzrLau/oSXujXAZzwJSLX2p+XpiYYcNEaDT9mIFpHLeedJy60Ws827UDQg/LeYIL17f8uWkNpu/FkjnKerQgI9P+4MILTpaph5a/Huk8+uQxOzGIR5kCw2Zt3YIN4j7U7LQfyrOfwAvM7RcXC79NbUC+9Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CH0PR10MB4857.namprd10.prod.outlook.com
 (2603:10b6:610:c2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 02:41:11 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36%4]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 02:41:11 +0000
Date: Mon, 31 Oct 2022 19:41:06 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 net-next 1/7] dt-bindings: mfd: ocelot: remove
 spi-max-frequency from required properties
Message-ID: <Y2CHQhPRHBp0riut@COLIN-DESKTOP1.localdomain>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-2-colin.foster@in-advantage.com>
 <Y1/rbgXwUZZXY3JK@google.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1/rbgXwUZZXY3JK@google.com>
X-ClientProxiedBy: BYAPR08CA0066.namprd08.prod.outlook.com
 (2603:10b6:a03:117::43) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|CH0PR10MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: b315786a-0753-46f3-6319-08dabbb289bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qpHAxECP3PBNtDYuoZ1pwinFAQ903W1vREvcLvy0TYYQqNJzC3Xg1JNMCUBgkPJWIdySZrnJ9fSC7mDZzOPh6fMhqyJYkOhjIy9y/VwCwHa1aLJyCgYA5lZgX9qcQP2Yw8sd3Hog9e+am0cqQIbpk+2jMMQz/vEsC773taxOthWW+VaFjFDya5SvH/ewcULSNWth7+J1bvwSKWBr+C7uMgNCgmVq/VkgsTf4kkq+ecHnw59WBPcjzzqCIOMxZEM2SJvpNWWyDoOLUuSexf5y0UQl/hu8L7LTJIEUeGL2g4VXfHiSxDgML7MH8NqpWx3+MMtvkAt4pTU+UwGHEmGmGgTUQJ5JlKgNxE4AP6Q/PlYZa8b9xWWRfL0AWVVzuIwx/qLRMKueDU0v2ToazvHnRuCbZlvCNNBNUro63Ua2wvWhySg7r9o7GN27q698LvaeMznYor6DkSOycQT1VZIBPOq3ySyqv1hnlUV2ATIhjjHwa57eSTnwzLztTv5XYNeKuTm93PY5CnmbkC1bv7IhAWIwAx8Jg32pJAtSpMWqtnpJAVjuD/HaYgjyqyV1pmIsgVsgd9lcQPgjWRBNN7VHp5QBM2CV/8OapKtK6TLTZrTrsTJ+dkCH0X8vSNK2paU9tFyjuDDmJ4GHnOOG2lao+aaNg7tBBBNFhj4CPVebbPqMtuezEyupk7Xg5IU0FKH/FryZ7yKjlQ5/DezQEffe5Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(346002)(39840400004)(366004)(451199015)(6666004)(9686003)(26005)(6512007)(6506007)(7416002)(316002)(38100700002)(8936002)(41300700001)(4326008)(8676002)(478600001)(86362001)(83380400001)(186003)(6486002)(4744005)(5660300002)(2906002)(66556008)(66476007)(44832011)(6916009)(54906003)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MUE5TXM3d2VqZjhyMG1RalBVTFl3VGw0S2ZSdVRlQTl3Q1J4SUh2YURXcHVy?=
 =?utf-8?B?L3hkbit2U0xHaFl6VXliWWRXbEkyTGx4TVFkZjNnQlVBS2tQQUI2VGpOQ01Y?=
 =?utf-8?B?OTRCak9XeEFYVVJhZ0FvWkUxYVlLRmJmTkYrUzZTemJoWGw0TU1XNEc3cUQ2?=
 =?utf-8?B?L2VvZkw3T3JPdDRRdGtFRzAwK3ptZWswc1dJRHl1aHJtT2xSMDd1TVpQc1Ax?=
 =?utf-8?B?YStpdFZ6Z0xBNGt6MHpHQjA5RGlBbGEvUEJWQ1VObG5pcm9QSHBsN0lqVWVk?=
 =?utf-8?B?NHA0amZtd0tabkNFNEp0bkZNTFAvdzNLMitsVUluTnZmZG53b3dDTkV1ZGwz?=
 =?utf-8?B?VG5jcXdHWlZTRDBNcEl1TTFlN2pNYVpYSmRZVlpZZGVFUW9jSHVzbjRMN2Fq?=
 =?utf-8?B?M1VXMExhUEdTSVZKaDJwZExSQ1k0RUx1M3BMTWR3YnBIb25hNTViUDRsczlj?=
 =?utf-8?B?Y3ZyaU1WZFhNd0R4cGRWRXhENFc1djYrODZtdUl3cHpHaVdlNW1VODZPYkYy?=
 =?utf-8?B?UHZJN3UxUWhXc3hRQ01BQnRkWXJ1NElMdmxrR3dDNzFnMTRsclFHdThSamNh?=
 =?utf-8?B?Q0FZVnc0V2VuY0pKVTJnYVZoWE5jWks4N0RmWWtQUFpYZDlHUjJpUVhyQVdZ?=
 =?utf-8?B?bjBHUFYxZWRYZFZRdzdlU2RwbmxNYTNQWXFMVmxURzFnakEwZ3dCVUVGK0Rk?=
 =?utf-8?B?cmN4MXRmQ1BCUEJpQzl5WHZqQkt2YkVYQ0sxOUoxU0p2djZPcS9HRXVUNmMy?=
 =?utf-8?B?dkNhODlNdVZPQzV6RTBiaFB4K2RrT2M5UlVtQlMxWFdtS0ZlZllhZ3Jzd00x?=
 =?utf-8?B?azlSdjlKbmlkRHFBcUtmQ3A5QytwWkxhakhGdVBCc2hVTGxldHRhZ1RlOWVU?=
 =?utf-8?B?ODJtSHd3ZXdQdmVXUDgvODBTQ1lkUHhoRHIrOFVkTnB2cmVJT0pNNWdJVmZQ?=
 =?utf-8?B?b1hXRXdOQzh5ditOMllSRkFmRlZQMndsNkp4TUdZVTdRdmUyYk96M05XQkN0?=
 =?utf-8?B?S3hlY0RGSUY2YW1EaTgwanFSRk10TXFpSzFhZHU2Tm9hWDdpU0xoQllydE5M?=
 =?utf-8?B?WGNKRGFPNER6OEYzejRQT1dWRG1jeWZJcE9sSTRnSWY2dXd4cTM1QUFWcERS?=
 =?utf-8?B?dzBud3NCVUVhL213eTBtNThtYXZ0WEhQTzBRM0UrNE5mbnZBeHVRZTM3SkNh?=
 =?utf-8?B?cEFpcUNLaU14cXQ0cTRXVms4QUVQc0lMK0ltb3NCaFNTbFlPVGJGeEJiQWE5?=
 =?utf-8?B?bFVNMTJaS2pXcDV2d3MxL3NDQUxmQm1NaHpIL2xrWllIUi9nNXdRcnMyblBs?=
 =?utf-8?B?bkg3RGp3RU9HeTdzUkRvTlJPZVpQSXlZdXJyUDRvNEQrbUVzZmVVcW5Yb0Iw?=
 =?utf-8?B?c3ZuK0VybmIrbWw3eHl2V0NMeTRsa3NXVDgxU0FKQ3ErZU90eTZZT3dsaFRj?=
 =?utf-8?B?cFRaQTJ0dTRzOHFwMmNrTDNEOVZUVjBNaEhmOXZ2ZGpaTTZzM2MxNlZaMFl2?=
 =?utf-8?B?blRCTTdTdEVteDdmU1VPOUV6VlVMWFVPY0ErK29heFR2dTNjaGV6bkk2bGh1?=
 =?utf-8?B?dFpnYWdrU3Vud2pEMUx6RGZvZURBYkJJbjJaYU1hVVVKdjY4NGtqZWJqZ1N1?=
 =?utf-8?B?TnJYNk5GZmYwWHd0WmlsZkVMd1VOVTI2UThGZkVUZysrL2s4bW9RN09pd1pL?=
 =?utf-8?B?NGtsT3F5OTZvY0tWcWsycnhqaEI1WG1rWEtsd1VWZVBob0I1UnVYVUx5eEdS?=
 =?utf-8?B?Tk02WVVTbm9iTUhiaTJwSHUrNUt2cUxMWVFTSDZSM2RaakZWMG9JeTdxNWdO?=
 =?utf-8?B?WDk2dEdjMVdiYTlXalZTc1hNQXlHWUVETlJ5YVRrQS96c21SeFFYVGgrbFFN?=
 =?utf-8?B?ZENiellsMGFhTEQ3cHdFY3VJTDJGb24wNHEwV3BNNmZ6aHlrMFV2TGRqRGh0?=
 =?utf-8?B?dFdmT1RUMEJ1amc3Q253Y29RUisweDFLWURQdGlTR0VTQW16L3k2TkxWTXBt?=
 =?utf-8?B?ZmkvS1EySTNOeitWV3dRVkdQVmhacklCWFhsWjlwWkdGa3RuL3NldGR6WjZ6?=
 =?utf-8?B?M3QyaGtzaENleDVHdDM4ZWdCdlBPRTV2OEFrc1FlQTNUWFhQSzgyTlRJUEpW?=
 =?utf-8?B?L216QUhXR1d6aDFVTW5PZXErS3FlbjZHQlpFYnNUTmZNazJYWkRsWDl4NlUz?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b315786a-0753-46f3-6319-08dabbb289bb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 02:41:11.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iCZyCkLEFp7ng0taGfCRn7un0TOjXO6EOImxOLLvC6joXXggZ8uvkm1+PbqDA3QxlSFTy/t+iNd3NreLlSSW9u/Iseg2yfnAbtcnMa5pCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_194116_270416_C1E1712E 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, Oct 31, 2022 at 03:36:14PM +0000, Lee Jones wrote:
> On Mon, 24 Oct 2022, Colin Foster wrote:
> 
> > The property spi-max-frequency was initially documented as a required
> > property. It is not actually required, and will break bindings validation
> > if other control mediums (e.g. PCIe) are used.
> > 
> > Remove this property from the required arguments.
> > 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Applied, thanks.

Thanks Lee

> 
> -- 
> Lee Jones [李琼斯]

