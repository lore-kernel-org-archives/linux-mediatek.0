Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C85C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czr7mZs1gjdxoQqITe/Lr5IgBBtK/wmIhpIIzIlcmB0=; b=iTZX9vWCfztSmaWqQUAMRUZXr3
	HCUrvIp0OHGpuhh9UAA4KhO+oTbPlSoYKd3CF+mnOdneTR2lAkU3cdngvm6aIIMWCqZOksca05UXB
	krSQo+JVPQfW9mMjlHQBqXJcNLGtz9WUgnPFCY45Ifb6Sj9ksdLhiU+W3kAfoYoXvf/PFFRfF4PM/
	ORe+/tavrYID1HFDen6V82cKL3gTEUykjfanRG59vogzUW9et7iHn0yW4M64/WGplXb+TQhyF23Yw
	jdZZIxVprxiPmxBHAa/BFmaEQIz8MsmxO2ns4tqe41A4ctuwwbcYtRGx7ocfjChwFCDzWI8igJ4ez
	bUQxoUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6RR-004LB7-N9; Wed, 19 Jan 2022 08:35:41 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6R3-004L2r-Sz; Wed, 19 Jan 2022 08:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642581317; x=1674117317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n9mTxxVJr0wK4vdrXZwU3G6pKvfMz4BCFAIBtBf5DOw=;
 b=QFt/OV7gocMYTZMcpHgg3uZ+K8x8vGwsp+AXGFHSpsdAfCFFXXhPkDYj
 5kGWD+tqRnJJEWIghd7dZcYl/NkVEZfWzbBIgJH/ttLdlHPQtBRSlZ3Ze
 jtXNYNhrrrRDA9YhZwJ8mfE+v+3ypIkKPGqnZbikI94pJi6SZCllmnwQQ
 /7DMQ+3cPMZe372/pa+fJ5BweITyB/z9fRcJBjeLGmjC5ESWYwmqI68uX
 rrjO9mGO/sdXu7yS4kRTYfq4OUvnq+cK40aR21YSP+N88c+poztDqWX4j
 +0OUVQzdLDg/g7X6ZbxHW+70KX4LH4V5T8i0MdA95OkVpi/Yqco7OLJ8r w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="242578963"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="242578963"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 00:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="518090768"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2022 00:35:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 00:35:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 00:35:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 00:35:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9OO4LEvYx+MiP8tPDDPK5NgjOwK7zcGLLslBFOX8kkoEc02LWkN5BQjTTafLym3AhQ+1vKX1xvLH4DNY9PviStmMJNuNX//2rNmmg7ikKX4/mLkFXMhuEpEtLW135+QkKJdEWrNeJDBiResmRxKBelUuNCFJraIGUJHroAU7ghx7PISheRNweW7ZvlkBMm7/Q5w0cYKtgtBSnwIPlDjIcGBDR700uUXNGf1/1pIimpkADrDMw6MnwF1p/+y07mgbCg4xYe2jeOTTBf8R1RSQCEJX7410Nl7ZkOxK8lz5Kc+K5PjwWzg80XvcXR7RdqkKhlZZu84mtYNGtSocKKAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6wc99T2KiTv2FZdpyKI9DFEZJnpIdu1ln7sSE7BO14=;
 b=MM4L3Ps8mvdzNwgCzi+fvpA86vhHDkgK3NmtbV6K67j2HP/3280r9tmGq1Jzt5xRMQlEoXPS3gZ/dcRkOFBFAS+Bp07yy4fiPYnC/IfJzRbuig7LNbSICGuuTu4hgp8AtNYc/nFQ20KGw8OPUHJMmhzInORpzfrZzvMOWVm6NGztitYcEBiBqV+wtAp7hSQMnfhQ6d4VS9Dc0cz90bLqrz0ib0TB84TSSqc4uiquSgLikdBa3Qen+mTdxeyRnDkjG7IJaVP8GNa/dPvqibebGCy3FNPjiAMxpxYIutwLdxIvk9dgusU2ECEqF0ZYZN+YUpzamWLxCEPYhZA8D6EvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Wed, 19 Jan 2022 08:35:08 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 08:35:07 +0000
Message-ID: <4abe1f96-aafd-71bc-5f5e-bfcc4320c8c4@intel.com>
Date: Wed, 19 Jan 2022 09:35:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [v10,2/3] drm/mediatek: implement the DSI HS packets aligned
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220119022543.26093-1-rex-bc.chen@mediatek.com>
 <20220119022543.26093-3-rex-bc.chen@mediatek.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220119022543.26093-3-rex-bc.chen@mediatek.com>
X-ClientProxiedBy: DB7PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:10:52::48) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f6a35c6-3de4-4ab9-8f59-08d9db2698f9
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB29207134AE994E3DE9823406EB599@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbL82ZZZa5ZUIorc2xQNWAz/NI0UXFFnJ8CEmHg9KSmIXTFtcDKupyOR4XK8jP4gnGE4ut5rHmAEjXodhyc/5iuFI5CCYp3vat2tp0872KTOB1K2yoZKNkpGCWSM1J8Q2+fzUEAbTlGSXPP2JmNMbYXzFZ5rch4VBY1YNY/oi+BQo4mco041XxNtjiPyzWPIseGsetiQGDZSKo/TFo5YDyyLmujnZkmKlZwUbKGL3KzeF6XAEsMeK2m5qwtmANizOl8QaVvOlC2Llb+oj0hK6TkZOZYyExbcVlDbV1Ord9aV/7TXtYUwCuT8cc2IwZNd1vrD387+VA6OEjdebCn615n0cWNgErXxqjl0EONYA+Ohpn8Y0bR3zxqrvsXtVNkM3CP5Y68AM9CegVFzCMhZeSmG68hJbsy/OYUUSx3xFDKgOH6ujeWW6L2zheI3tShA48Pm9glqvLwuoa0IVPy6Ie3hSfjUcCzUkykA1y5o3A0ozcAD+xeijJSWcGIDmvWe7TyXa7Q1fsl8MPvWzX+czixhfMtQ4Ome4oj5/ZAt4x5V87kXP0/NwGWMB48y4UMj4KOmoV22tPnuWFGIcRt6iD2KlihUAcpzi0/RTpVzSUcmyeBI6jgFd2geORgoUfY8/2sJMad1IZi9dAyY3odHG390AmEN80rGQP9c8Wc9Bqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(8676002)(6512007)(36756003)(66946007)(66476007)(31686004)(86362001)(8936002)(31696002)(66556008)(316002)(38100700002)(82960400001)(6486002)(7416002)(6666004)(44832011)(508600001)(36916002)(2906002)(186003)(6506007)(5660300002)(53546011)(26005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HHqoZbtsCRrUu/0rHjHZehQr9PtOicioEXalwqFAD263iSAbBt1xjg9QCj0hRGxynTO1SLz20HBuDhzVy3dUchKJgLdhkcUxUcGktGN5vfWs7NbyAqrF6YHtSO6TkJpmAi22KvIZCYCK65x4zmkvg/cmhrzf8CZocWsLOqCFjay+iosyieNuI8GmmXgq2qvfh6T/1ksO1N/vepGJEy/J5SwRxeJ7f8l7dtBaYIXNlbpmnbl0f5nEbRznFk7GPesHXZIrqApeZZf6qC/wyV0HVBd1ejQk9Q8I4bVpqkDs3JAkfw/FY8ms8VR++6/xvgE5N2urBzk3f47Bm35nGSrRL7D4sQo2hvfwNGgDHUpdD4POkoK4T4iGNcmn+mVemzVQ9BBCBlxseMdBF/TMo3jgCXdTou13FM544vIXDb7YqmQZgGPkYmkIMHrKh865OVla
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6a35c6-3de4-4ab9-8f59-08d9db2698f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:35:07.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvwiVC2vddvY9+GNB6ONhgzRirCneThoml8PH6RypbpmBECFPDJyOpIiMvfwJwcNIKQJnkBnj2GKIaNr9YZa5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_003518_021679_751B932A 
X-CRM114-Status: GOOD (  23.13  )
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


On 19.01.2022 03:25, Rex-BC Chen wrote:
> Some DSI RX devices (for example, anx7625) require last alignment of
> packets on all lanes after each row of data is sent.
> Otherwise, there will be some issues of shift or scroll for screen.
>
> Take horizontal_sync_active_byte for a example,
> we roundup the HSA packet data to lane number, and the subtraction of 2
> is the packet data value added by the roundup operation, making the
> long packets are integer multiples of lane number.
> This value (2) varies with the lane number, and that is the reason we
> do this operation when the lane number is 4.
>
> In the previous operation of function "mtk_dsi_config_vdo_timing",
> the length of HSA and HFP data packets has been adjusted to an
> integration multiple of lane number.
> Since the number of RGB data packets cannot be guaranteed to be an
> integer multiple of lane number, we modify the data packet length of
> HBP so that the number of HBP + RGB is equal to the lane number.
> So after sending a line of data (HSA + HBP + RGB + HFP), the data
> lanes are aligned.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..e91b3fff4342 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -500,6 +500,18 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
>   	}
>   
> +	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
> +	    (dsi->lanes == 4)) {
> +		horizontal_sync_active_byte =
> +			roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
> +		horizontal_frontporch_byte =
> +			roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
> +		horizontal_backporch_byte =
> +			roundup(horizontal_backporch_byte, dsi->lanes) - 2;
> +		horizontal_backporch_byte -=
> +			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
> +	}
> +
>   	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
