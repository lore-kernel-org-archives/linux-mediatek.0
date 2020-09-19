Return-Path: <SRS0=9Csx=C4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387E4C43464
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 08:08:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1BC21481
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 08:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbVdILZZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VX/DJVty";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="l1DtmCX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1BC21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G1MmlD6hFabHdkaI8m8Fe0cyHQtYdTY59y41cEudXQg=; b=HbVdILZZ24CnhqillKT/4bZnr
	omlPVqMEaP4H8cIcuQDDaPtrjPo+cuVisHk6p93z6TSsoqt/ZTBCJeb6TK8UBamf585DjxoecHprb
	UTgGChujN3xTYm7Gpeyu7861IFehet5Zt9p0YJtrsmw/B3WzZPYN81qHTOP49ukQxI3AbutxBEJPM
	2UYLOWsZK5q7wBnlmHTyM/O8SAznHvZnq29AMWyGBvNXd5zs6FQmOJbXz84pQcSdrAOikM9v8o8LG
	5eGdiG9OdSygn0RrfnTTUKPjduwmN3/9l1tDQ6IwFddTEnDzjbxzrd99VkvUjl/cutKaUec5XZHbp
	hG2H/xVDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJXvF-0006bc-O1; Sat, 19 Sep 2020 08:08:41 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJXvD-0006a5-KR; Sat, 19 Sep 2020 08:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600502919; x=1632038919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I8S5z1Zetw+N3Tc8/AwAT7ZZeb2Ps14oN1mCy0TiWL8=;
 b=VX/DJVtyE6i7Ffpykz55jne2GhO+kM3gPUc3C49QjA4ZU4vjLIQPANsN
 dQ0t/sCjQJ3jW+6PvRTNRaQ+yVuHAt0mxzf66QjhLfK2t6MXT2/zVZk2f
 QrlHHEHVfXeROIi5sMJIOFa+fdJgIv0TE3KwQApJ2HpFFCdDAe44dN+60
 7GVnOVvLBj5/KMUb06IRJk23SWxi1ei5vf9VjW+/9V2Bp3/vFoWAobpb/
 9M+nfhQcPwoXOAU/q07VGp9Tdy1Tvv0lWHge540kJVL6aERrr2QVgSPlB
 bseJGor1Ccuje9sm2SMSnZQzr+lE/Vvc6w3YwyQUjTPwvARJl5uBpIUzO g==;
IronPort-SDR: WosWP4HwsKEtLkN4pgQd8LdAhXJPOdFQ6UUcdxrvIQLpyvUwu4n4hI8KZOMOEaP49uhdDZuSc/
 lYLHDyTrs2vRuCOmE02uSOWdXQ70vjW1WGpfWD/8Yf2UP0K4x5DLc1fb6CZdmx8LH5Cxtjmv/y
 xK+sybw5/OOh5Og4wdE7wMXrCy/+NKUTVmDJgSpnvW4DHFJtDrSjS8tRfWMpAZ8EwV9zEI3nJq
 Nz6NUzABOyPitOWyou7jio6o4vf7xEwWbRb/1CV4OkoeMLnUsUIhvffF77k3ygNpGQ01ygs9vK
 sYs=
X-IronPort-AV: E=Sophos;i="5.77,278,1596470400"; d="scan'208";a="257469877"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 16:08:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CF0LeR4zSFF9yWWcy/gPP+3YgyexmVTSNnPeShQHkiLu8XvAgwwWLpVWW1zUw/KyexR8jlOGc/127lTjYV36VaOqPD10FOKAtjsJIRo62N/APjA1E+q5H4joKN8L4spcSb2RrE30ZpjHaEWOOu9fK1mOPQQuL51aAPgtGDwhTEWnQKNn83k7auiwfme5FaapP5GxD1+h2qx2ODMkbFl/IIldAoWbmJDNgCA1IES4ERPbIecV+4dyW0PwP2WiGKFvPK0Wbfh2Z9/jR598W9GZ0b+Y3SqsDgodunABCfTJagwwU8Ux2UltdQLA+OmOFwwgwedo0uNDnLTPUCWqJHJSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MijMlWdcTW+B7zU+EFwuOg/5bj67LRHSn8GupvrdDdw=;
 b=HIp5qNoFb11dgWiK/15LtV8rYtRwS9hlKcE4PEYwgYBoiiDuOtT+UxOGqME9KAyPC4Rr+t6uMyjdy5106IanYugqmdpwaV5KSlJqU+CVfSoR7r+rTyDONytViHH0nFbMaiqNO9D1ZbB4j1EGsOjtjvxw6dmYtavrqjlGwr6CptnkvAYp0pemQR7O60ie7OUvhhDQluUJII9C9nJZaWCmLiTFBfGf0v8buHqvI+uQk5dtqZNwR08kNV48rBcfwKMwI+0HA60pGUKAeeMpaSPSKmpRmfg7kplkomULJBfOq409/HmvfBjuPGkVXtu7vDWW9dj8OXQ+H4wfcZrgsvQQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MijMlWdcTW+B7zU+EFwuOg/5bj67LRHSn8GupvrdDdw=;
 b=l1DtmCX+8TvL5lmcXAeT9ymmqCD0kH8A3JsL1CYmavxqm353vl0hKupS+p+pBsefEN5Tt2sOOGp3wgUXpDyok3CrKbwGA/1Nitm9AV1D8/KysEtcIowBRVW4gfUPL08mWZsbvz29lW9rsD056dA3D2+/YdmQ+ctRnznbdWHJdZY=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BY5PR04MB6613.namprd04.prod.outlook.com (2603:10b6:a03:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Sat, 19 Sep
 2020 08:08:34 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3391.011; Sat, 19 Sep 2020
 08:08:34 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH 3/4] scsi: ufs-mediatek: Fix flag of unipro low-power mode
Thread-Topic: [PATCH 3/4] scsi: ufs-mediatek: Fix flag of unipro low-power mode
Thread-Index: AQHWhauhHCtH2hn6FEG2JWtNrKtBPqlvq8+A
Date: Sat, 19 Sep 2020 08:08:33 +0000
Message-ID: <BY5PR04MB67058DE7C6B5F63E960280CBFC3C0@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
 <20200908064507.30774-4-stanley.chu@mediatek.com>
In-Reply-To: <20200908064507.30774-4-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de266f29-ea89-4c15-a983-08d85c73344b
x-ms-traffictypediagnostic: BY5PR04MB6613:
x-microsoft-antispam-prvs: <BY5PR04MB661340636AD9FC438695EE59FC3C0@BY5PR04MB6613.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sg7w+VmYtrZkTySQ7DNrVYvMa6Dfv13qHB7M0F+ppR8OVhfQpFM7siCg+GhwVUXcXwSkWyV8VpW5g4aRxzjTAGYjNPbTWcbEBMRS6JDpSPSLOQTutMk4Kj4TdRwVxGLVmCTkbTn6DWKce6iYFg+xtgqMWeFWMcraDSU2S6GtN+27lMtJ/VNAxmJX25gRlEKeojE56YLkaPtaYpBhBl2bnlpCdqIMnLf71g+J+8iloT4n+XqRRo7+4lORNi7yQhT4UTUfOrQXvz/KeGS+o9H1V5DgSZXOkny63MDAjdgSYRLQHyI9/2X88wKr6dWvQbOqeXz22W3iroWzvzZru6Qc+FcQzniUXa46LR+VqlwqJjq4C9rjiUL/6NFLDwPLnbhk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6705.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(83380400001)(33656002)(186003)(7696005)(26005)(478600001)(110136005)(66446008)(86362001)(316002)(8936002)(54906003)(8676002)(2906002)(7416002)(6506007)(66476007)(55016002)(9686003)(52536014)(71200400001)(66556008)(66946007)(76116006)(4326008)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EcNwee0FM/dY1ea7EqyyXOIBh/gm0ksovgraoUGH2vzK3TXwdX8qJ9sGDOqsdACW4dEnlYGN583loWAAb744QtNU/etYYvNOu6uYuwxBVDiECHVb5+LHEcuPFoujkDbG8IxVPTovfgiy+KoZMAcgOkkIDjqIG58nLWhfCJZmeRQD2OwSW3Q6WeYkPNoex3qwPNXAMhzl8PG57N8DpTdp8B3XFYD8kpvWV0r9mdEsmxHjJvAO+BGT7LVYj1t3y11MjOmJc9isd/putDPWjU/sdS2FlEtGhQtfHdrMaiwvUZRqdWicmf8Qhb/6bC3vLuScGmavrGG6c7o8kiqaWYHRuY6F9IlGRa2Ugw/e1AChCP6zgDtn8/2jtaCUUykr4C9+QKzFSU+o0hyk4JZVyA6DO8Y3R1QArKcUNwC+ABoNUAB5B4E3BCV9X2j4Xxpc7LhhEQpUcyFYuZI7hYT3bU4pKlkhulyv8rHeHMrMUWd2SG1bGXJVDTJxhIv3NV8Aou59yeS5VY5r0o9bq90jdn7ARmHHfvJ006rU8pV/hZ14RF9K4dwYrt1a+B1q7JC8Efpa4FnO/CXhK0a0oOIlTV+N64D9CVJh+LIFYGF2YWxh2hwyFYO69tseysyLTmlukzoFeMKWAPuqLhFzMRJ1m/rhLw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de266f29-ea89-4c15-a983-08d85c73344b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2020 08:08:33.9660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fnb3zXPcQJdx0wWzxE6JCD2QOzSAGndYeRmRRJk8Hm1vRYwB0EnyTlpoSOWDuZlcn14QK24iHP/9QRzBWgdnvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_040839_862266_0573342B 
X-CRM114-Status: GOOD (  20.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Forcibly leave UniPro low-power mode if UIC commands is failed.
> This makes hba_enable_delay_us as correct (default) value for
> re-enabling the host.
> 
> At the same time, change type of parameter "lpm" in function
> ufs_mtk_unipro_set_pm() to "bool".
Semantically, better leave it u32 as its eventually assigned to the arg3 of the uic command 

> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 887c03e8bcc0..feba74a72309 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -419,7 +419,7 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba
> *hba,
>         return ret;
>  }
> 
> -static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, u32 lpm)
> +static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
>  {
>         int ret;
>         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> @@ -427,8 +427,14 @@ static int ufs_mtk_unipro_set_pm(struct ufs_hba
> *hba, u32 lpm)
>         ret = ufshcd_dme_set(hba,
>                              UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
>                              lpm);
> -       if (!ret)
> +       if (!ret || !lpm) {
> +               /*
> +                * Forcibly set as non-LPM mode if UIC commands is failed
> +                * to use default hba_enable_delay_us value for re-enabling
> +                * the host.
> +                */
>                 host->unipro_lpm = lpm;
Maybe just host->unipro_lpm = false; instead

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
