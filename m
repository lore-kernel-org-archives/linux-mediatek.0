Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC44C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ee7JxvtXkW18Ot9J9SBxTEyRyE/BC9uVcsKPF1fMLiQ=; b=gZPcF1gjFx7tin9ztaGDVK8ZpP
	xxeVlR8cOO6/AdHl3sX6TF3HnR74D7f3wXMLHmFlfbcf/jsd6vDhHoVIYdwdmxvO4aDUpEALp6T7R
	ta0kVSm31uA8CtAyJHYAvMtRPx74Ngor+RFdkjhnggt0ny6u7JQg3xMsTDSKkC2VmzBMg0CL+HIBx
	ICnoEOO4GaCkUw7cTY7ZDVQoCHX6kF90qrKS500HAMmA5nisdDAEDDu/LEB/IMGxsal6cqEWuCiXU
	95UNrEA+II8gJ54hM1X2ojLjAj0YAJpDWexosOn+c3Miw2SiRFN2fnmtNj0E39RSXws02xbCw7W6T
	pJKlLcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmwr-00GCEa-1P; Wed, 08 Feb 2023 16:05:29 +0000
Received: from mail-bn8nam12on2062f.outbound.protection.outlook.com ([2a01:111:f400:fe5b::62f] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmwf-00GCAu-9w; Wed, 08 Feb 2023 16:05:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+zsKli8gIIhv9EZepNkKBF+jDrKQiPZhoxw8e9K/6nXT3ky2BT4t/FJQOV72AxGzAwcGNhM4fqvZPRS8KqxRc6QuFxZGiipy41ubXCjo7k0e0kgRhPOyDf06rMzRrdApQXyhsbvIAQonq6g4WJABJpG7SCY1r0GPlmSQBV2ycR3jvDky2PUBRPPfxs/9i8v44ViYwEj2yF9wSe2Y6vmbzW3ZxQIEkQQVgnr9NDNSwj4lca8GTMYqyTD99X3w4rFAW/wOtsW++g6VLxvADQiS7ojchQTWH34McQByRZT0h2flNW0zBP+2xljJXT1yzYXxDLVzbJezerynbIgqS6qCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL8ooqB3FGsWwxnszSNFMg3wodsGaUMHcg3sQe4IaLI=;
 b=UCUZa4vk8b27zk2Ms1hWK7xuUCvuQ7w/Bd4mEsEQYMd6x7b69oxW6B0cqArtlHSbiqM8gFrvDZiBhruJIpY54Ggc7Qnit6yqvwZ8BY2DlsIinEB8CBRN7XtFL50nbxYpyTxWNYbzHdi6J7+EnJSvBamPbd3sLI/6cS1GlofM5vnnqyXyIXVSGhIMe0A5Var4Z/onmXTo1ZejOixi5wL3woMkhbR8eui2n+3/c+k1m33Dr6MilimFqGBKvLMrEaHnT7bEYT1lftM6NfMUGiEA3h1+9Wug3mgY8B7gJpmd0OD5ak0sDFH6ggY3mYyuMoW5177Jzs8ur6U3O6Ebx70OAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL8ooqB3FGsWwxnszSNFMg3wodsGaUMHcg3sQe4IaLI=;
 b=biJKnB4RQrrxPJ9O1eyvg8GITVlYXtw2YnDRwraooqK4IJ51y9urStIICvGRSa9FwU2AtGzvoFi7xpksrBonpUXfyjzhZwozOtg6MAZgWMV6ynZpCicBGKrCtHqsFVxgj/l10H8nm5bVokV2PUjS3PqUrMtFCDP3GM3snZZz+hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3876.namprd12.prod.outlook.com (2603:10b6:a03:1a7::26)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 16:05:12 +0000
Received: from BY5PR12MB3876.namprd12.prod.outlook.com
 ([fe80::4ac9:c4f8:b0f:a863]) by BY5PR12MB3876.namprd12.prod.outlook.com
 ([fe80::4ac9:c4f8:b0f:a863%7]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 16:05:12 +0000
Date: Wed, 8 Feb 2023 16:04:57 +0000
From: Wyes Karny <wyes.karny@amd.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	iresh Kumar <viresh.kumar@linaro.org>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Message-ID: <20230208160457.ouh2kg36s4kqpahe@beas>
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::22) To BY5PR12MB3876.namprd12.prod.outlook.com
 (2603:10b6:a03:1a7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3876:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b138900-e5ec-40b4-0796-08db09ee41f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o9p/HFmH4NCjM+13sCOuHtPCOcP7ouS4/VeLSbj394MwcVrg5J+/UKNwEgMMjgHTCOLMIjaG9PVizeDQ7WaakFmuB9V2k3ZiFlPAUlTM8eIaQiEKJZ4h1gISW7b/Diqi0vm5aX4h1TUkBLVwYRMqxuDCTY4m4fQ1hM//n8iyQCUIjVmfoPU+5kNm2zjuQbTp5GA4vA24MlDb0UXmMmho9e/joLYxUgqs6/wjZzsdZAoial89q1LfpqVVbTd55gIQYLzkOMzbuI4vy+fv5zcNcIojtPVOz9LG6r8yJ2f2WF+/lQlMBlismX7SsnFJclve6QiIP08JKgFSpn9QzOuVOAoWw39yVmiuoDAmDQCodgvBUmv8EUv0r67ueuph9qMRw/DbZDKb/OdoYYDi0B6WtseZJQeday43wpi+2NFchVvMr2K8FTtqxQ4q6Uvw3nB1bMtnJeM82/stGTgtTtFRiNPcDwLzuQ6majB+/CUgILvCrL7C21kRkfDAQKmwPZHCmXXUvD1Gf0JiNbu+t9xJncHo+NSHFZRXzNjTbc3O7Qx/YqgjWhpHtDnrtvW/cDh91GdijVpQMLFavc45JnKmDHYQmXCL6Y8SfhrAADFLNjrMtgiRvcUILVJa6kT7tznZilY1DyJWPiVJ29igEIqcmCcOrbmwK/Pu5YJSohmgZbM217x8vDGf/T4Ilp8I+f4+
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199018)(5660300002)(7416002)(44832011)(2906002)(66574015)(83380400001)(38100700002)(8676002)(33716001)(4326008)(66946007)(54906003)(6916009)(66476007)(8936002)(6666004)(66556008)(41300700001)(6512007)(1076003)(186003)(6506007)(9686003)(26005)(316002)(966005)(86362001)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?yIKY2yBmGnTJtQr7cZm9HS2oQIB6j2/aVuOyPbkkF3/p9bY5Kj6ETMFulz?=
 =?iso-8859-1?Q?SAHESfKJhIvcuhbAn3Tcgvj952w9RhrVB4XRpxLf9rfNTq/H8Z2pLyepiT?=
 =?iso-8859-1?Q?FPcxWaIRU2U1aXQOHCKW9oW/oY7KYtJf4Rau64dHFayBPcyboa92Wcu0S5?=
 =?iso-8859-1?Q?QQLSBybHclc29k+UdWe/hTJ9CYPeZhBedOaamhuuexSLOd1zWEyAAksMkV?=
 =?iso-8859-1?Q?Gz/jhYIWj2XkrtE6Ajy5ZT3jTA0TYpYDvPM4RluRaHZtu01PlG/9vTks27?=
 =?iso-8859-1?Q?EYFvXx7RgaowqboXhqB7EhuB0w2apcrs4GnBG6SFo+dLx7yhEQciNv6Orv?=
 =?iso-8859-1?Q?fmc7sQMzHoC3YlyFB1FghNznfR2L9jXlQHoolsgn1W6f3A9KTaFWEq6MmA?=
 =?iso-8859-1?Q?Kfo1C6kkRTQJKv14bKtOB4r+oBJdKPDhvxdOdnLSIFk9x1RmF4d+M1H0qh?=
 =?iso-8859-1?Q?5VCW0i8/Giq+HbUuvzWKQ1PjcRKpJ7B0fMINmXV7RkHBIgjFA/It8Lfup2?=
 =?iso-8859-1?Q?e4RafZzipXllUTiq2trh8hIfLTwV4fEadAh77E8nD46TU6utMCtipzirHh?=
 =?iso-8859-1?Q?9IMjf7Yt8SIAL9AmyoXgEgGx6qKYwFTWtPzAdrZuAojdN3xDjxKXRjXv4K?=
 =?iso-8859-1?Q?6T8Zi8p6Ih9tb516kiyA4iKvg0Rb6+Nsyr/1zVJIXwlvW7cYRPQA+Q+jgO?=
 =?iso-8859-1?Q?dubvHsiC9k9XDn276MRdRuCzXeIWDdxrdjjNZQIVIWX59nEC1+iQqHntR/?=
 =?iso-8859-1?Q?FGOwfX8dbWAQdXHFprgYZjpEtUClUN79yai5huACW2azi4looTnl71fP3r?=
 =?iso-8859-1?Q?EKQNWqa2yWjklYVvdmerBLvY5lMrRitdKdXu9Pxfp/n6ieS9OqMSQAKWgl?=
 =?iso-8859-1?Q?vo2NSgyM4jqUC6e+Cwz/Uhra5AQNwGfuXuMY6jMwj/F2JFv01G73YWwem7?=
 =?iso-8859-1?Q?Xzy54eIfIvtuuzV9XiBfEjE98ul6uaXk9MCJESK/HfuDqBGQ4HG0nLbRxt?=
 =?iso-8859-1?Q?IYKizyz+FFG0gvleeJZWDJl3J1TxU1LO2+UlpdnREclUcBK18vSpvQqB8q?=
 =?iso-8859-1?Q?wOL1rVGKjR7V8rvoD9TocgXBiBdop0oiKQR1RwZTt502hXGVHRuQkbHu0u?=
 =?iso-8859-1?Q?kBXLkXRmr0CVEw+sELf5vp/c3yMuipH7PLnstlav1ww6K4f130onMDtchx?=
 =?iso-8859-1?Q?xoacFZOcZKpgbafJdERjudNJHcqA/Av9PfxKd0JS7wuiU3l1+Grhnh0sEC?=
 =?iso-8859-1?Q?7Ob8WRqOaxvsAcTi4Jzvpd2MO6mmdmiRqIEI1eskiIy1Bvej2IXCaPJ2Mn?=
 =?iso-8859-1?Q?jeLwhfOznA+ZSPOsQJiBN55elVPWTP5yYStzE15R6P/cGn3cCeP+Q0GcA/?=
 =?iso-8859-1?Q?pQZbwcUcJ0vmqb8iiMmHRekr9Z6iUDCyXwDA29deveCYo9gSWe7pjwT7vH?=
 =?iso-8859-1?Q?Jo5CJ13sqKARTwGoEZdY1PtNWorSEMomo7OpaHEN8N9gFKgFbdI1OkHiOp?=
 =?iso-8859-1?Q?HJrUFeczncxLx/jYoc6XRb66VSoUvIkV0BnoeJztc4HCRxvcAXLKpvh+bq?=
 =?iso-8859-1?Q?zI2IbcU1pfUuy6gxh0CPREWWsitvgly8qgQdOviBFHa6bZCNcb4lkJ7qYH?=
 =?iso-8859-1?Q?97Yvw8wizjao03fYuUVUukAqa3K6uCyI8K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b138900-e5ec-40b4-0796-08db09ee41f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 16:05:11.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6A+h36ieD7es75BXW3tXSeJz8J6xoTwvnpEKBNHQ8D+hWahR488QVc1Vny5q+vK7rHnX/03g9NTEvtzYo5SKJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_080517_397132_F2C12B55 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Uwe Kleine-König,

On 07 Feb 20:59, Uwe Kleine-König wrote:
> All but a few drivers ignore the return value of
> cpufreq_unregister_driver(). Those few that don't only call it after
> cpufreq_register_driver() succeeded, in which case the call doesn't
> fail.
> 
> Make the function return no value and add a WARN_ON for the case that
> the function is called in an invalid situation (i.e. without a previous
> successful call to cpufreq_register_driver()).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
>  drivers/cpufreq/cpufreq.c             | 8 +++-----
>  drivers/cpufreq/davinci-cpufreq.c     | 4 +++-
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 4 +++-
>  drivers/cpufreq/omap-cpufreq.c        | 4 +++-
>  drivers/cpufreq/qcom-cpufreq-hw.c     | 4 +++-
>  include/linux/cpufreq.h               | 2 +-
>  7 files changed, 17 insertions(+), 14 deletions(-)

> base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a

You may have to rebase it on top of this [1].
Recently this patch series was picked up by Rafael.
You have to add the below hunk in your patch.

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 168a28bed6ee..70debd5a9f40 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -831,7 +831,7 @@ static void amd_pstate_driver_cleanup(void)

 static int amd_pstate_update_status(const char *buf, size_t size)
 {
-       int ret;
+       int ret = 0;
        int mode_idx;

        if (size > 7 || size < 6)
@@ -844,7 +844,7 @@ static int amd_pstate_update_status(const char *buf,
size_t size)
                        return -EINVAL;
                if (cppc_state == AMD_PSTATE_ACTIVE)
                        return -EBUSY;
-               ret = cpufreq_unregister_driver(current_pstate_driver);
+               cpufreq_unregister_driver(current_pstate_driver);
                amd_pstate_driver_cleanup();
                break;
        case AMD_PSTATE_PASSIVE:


Otherwise the patch looks good to me.

[1]: https://lore.kernel.org/linux-pm/20230131090016.3970625-1-perry.yuan@amd.com/#t

Thanks,
Wyes
> -- 
> 2.39.0
> 

