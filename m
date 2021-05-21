Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422ADC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:19:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF4F613EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF4F613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzLQZxRDA+4+2/7tAzvAMnH4lAnm7gTkFQx0NAnbxdY=; b=l/0R19pRKaxlSHubMT4Z64gkgh
	/ZE8piDOOti8qIJ6FiHpffw3+aOwAq+Pvy6aYFzaiTWwZlJwiawnIUMUmE34gO7StnuQ7DN2D6sue
	Op/aLWaJPvNil4k8cB2MOkyP96KLABPm22evi+KoKza9NxVi+Ga2GMk+1AZ/PWi1PWelxedIUU2iJ
	KLBsSUeMc6dLp7c1HmuR1ZQxMCp1gkkG/XtgaITBBRTKfROsXcazzVeepsc84QA92RKPx4mBHx5Ui
	8os8OBP1fuUlQK/gbSf1EEIBApbfO1zL7OUScmasW6cSI1jJsFBqMtoL+8YDvdsoJdu4r+0E3Fdyz
	AF+Pg+pA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk53Y-005Tat-Nm; Fri, 21 May 2021 13:19:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk53W-005TaV-SY; Fri, 21 May 2021 13:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=krBc2RlBUKIIx1K+ckzeGswy4vLHS+XiiBkI7EdDorM=; b=gK/bAVOJ7K3I4bwWt5PtsS6L3f
 Izx7tlIzBlLHd4/qbdgD1Y/aT/iO5MKfBg02afT+cqUDPW63YPAdL9Z0Rhhcj9rnJOM5Y6JXb8Bdi
 ogk+GqPoBxhjkyN+4o1WG29RiCqS2MrdpIoM94fLdta/VlAWV3sNgoDeJuyXO64EHiqoaPA9saOZU
 VBouXeVE3K1zYNgtfJpJHkUcQPtyqeARzWEozKm5LKdLmNsnxfWsZBWoqthRZSdvhkFrokDGnstpi
 CwsRMhk9vUI8EboIpCDcgc5ku0Tcp99g675iLA3aII6UcjFrYepWpxyUz90KJr9Jff2XGnYLQVYil
 mrZU8e2Q==;
Received: from mail-mw2nam12on2070.outbound.protection.outlook.com
 ([40.107.244.70] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk53S-00H8ED-PH; Fri, 21 May 2021 13:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A11MCrAh6AEN/GFvX3yd49fDoLWqw8WjAkmpnj+U9pSa0e3t9JwH0x4w33HUquTwsGepzT1tBT1sT61RRhoyoOVsI8R4lbVYYV7AMqQHJl7xQ2tqGEJwpTwpnW35N2zWBQnwHmQ8Glx0ZMLUobVVbOAfhVQi6VY776W/0o4IJ1LWBcUaWSDoWn5fZjTZyaYx2a2A2K3Ow457GM3HfRKx4P3iLmYdw0SuAMo4yLExAW7Mj5r8Plok2T6bnBoPDoQNnK2svZCAUrtoh1ajpI/0cI63y/ktV48CmKpbsjsYKyVV5L5YfGiEbGMYn0bH47eZwpkJGQIPrQfnIu42e1kLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krBc2RlBUKIIx1K+ckzeGswy4vLHS+XiiBkI7EdDorM=;
 b=DtY1bHLzRCdIs3adNktXKRgWKz4HwgG+tOqBEolp1o49GFyDarGjHpvyXs33S2i/aZgaCgM2UrF7HbIge7dWu4BHqLa9I0T2GfuVaIou2mWrBe1gBthIiZK4KQx3J7GdpTjyNrL3zDHZnKnqSmL3+0Hznra7nJFdNrVDkJkmH5dpeYNGAUCuS7TJBRMe55lT1R/9BWMBl6sXRRDCTpSDQuRM8wD5K117SoYojBM5m1PvJWS0/BN3jb7OcOsQYF0t2UPhcbpvjVyMKQmrn6wOSU3VfrgBrlcoAMD8Nn+c97gxBoUZWPF7tJogIlZsvBfr+ysbnBRy9BzUNOv5qmk62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krBc2RlBUKIIx1K+ckzeGswy4vLHS+XiiBkI7EdDorM=;
 b=RpfxwL2z3scLWJvtHNrnHMZ66xM8APo6AipzHgvLyaTD426jUR4bytTdDHfyCf57i0uF62uD/JW1iuS408BqbJmPnMb0Tl2jCc8C/xyYic4GL3yMdl4kyJQoHJaD4jXWP+FWUV1cVAXeDrecV3KKu9OjT3wqQ0elqRKlYUHmSlwwy++C8m5Z9p65F7FIKYGLfxdHc8gG3L4Vkr6y9iFl/dOwr6eu/dbovN52Mo1HJLs8JOwQipHCj+9djVm9eolVetmK+hqgXG8Fkw+Yf2WRSQOQTsf76BGGu8UWcrOtdIRDaS0IkmamBkZa24R5GFrngCLwlb2Gu48UBw+DOCJdkg==
Received: from BN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:ee::31)
 by DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 13:19:01 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::ac) by BN0PR04CA0026.outlook.office365.com
 (2603:10b6:408:ee::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 13:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 21 May 2021 13:19:00 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 13:19:00 +0000
Date: Fri, 21 May 2021 15:20:23 +0200
From: Thierry Reding <treding@nvidia.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS
 supply optional"
Message-ID: <YKezl0nlWFQhLyf/@orome.fritz.box>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d545a81b-5827-46a5-bbed-08d91c5aff8f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4370:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4370025E165D648DDC7A80EACF299@DM6PR12MB4370.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+gcJ3lctOIJ9MdI0H+voWnRTHM5sj9Ca+4ooNYQx0tfVXINN3WelIrYMy5IDRuVOp1kBcBEbCQ0C6/V//IBzKKcfp8Yjc8/Ri2TzuwIHvZPnasVGEwJ15JTPUFeWxVPjPN7Nczy1Q8LakKGqwx73xdI8/44kUVCNkDtnHX7YkBHqx7BrAhK1c36RjCSmZ6Yd8ynLGqOBfwA+ODp1mzy2Kcy+WPOMPZm1Vjx/W04oSJ5GprLX3uel4PJ0k4UEnXEFpy+TtFaJR8+XO4bD3GbAIeC+petVki4a+GJLJxeXN0LczocTcIrLxljNbNFNaNoTHXko1ktW/ERbKHxA5FFHS8oOeO/qNzY02goufr/0NzSttX/o8L7O2R/ucm/BD/XZrWxo6P4gRf11gghE3uPeb7TyPk41B6Y9KZ0re1LIjUwSZGekDdFBHrafFGNj7whALIsVCulyPsHCgPJfXm6JooUWo5mKZB5dC1sceQV+laID6D/GVQarvo54b0rbuAR6fTiKVfP69c7urkhn7v3kPgQAxK5Pevpl720lP72LqqDHDt4blUbbCKtkR0SlgsFSuSn3gemhms80Ihj6spieabx0OvOjCekTAtj4XhssBMZRxAIea8XoGKTLS4og0xootJnwP6Pu9x45YRs3t+NU1QOQ+QyqgzWOtjghXrmYiC1XMvukL1owhO5sWrTxqXU
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(16526019)(8676002)(356005)(6666004)(2906002)(70206006)(70586007)(478600001)(26005)(426003)(5660300002)(186003)(8936002)(86362001)(336012)(7636003)(47076005)(6916009)(9686003)(7416002)(36906005)(36860700001)(21480400003)(82310400003)(316002)(4326008)(44144004)(83380400001)(54906003)(82740400003)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:19:00.8001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d545a81b-5827-46a5-bbed-08d91c5aff8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_061906_857442_C4835766 
X-CRM114-Status: GOOD (  34.46  )
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
Content-Type: multipart/mixed; boundary="===============4153846277352932109=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4153846277352932109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kQXU9/aA1QNb88Xm"
Content-Disposition: inline

--kQXU9/aA1QNb88Xm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 02:39:46PM +0800, Chunfeng Yun wrote:
> Vbus is already an optional supply, if the vbus-supply is not
> provided in DTS, will use a dummy regulator,

That statement is not entirely correct. The dummy regulator is
substituted only if the supply is in fact not optional. The idea behind
that is to allow DTS files that don't specify all required regulators to
get away with it, based on the assumption that the supply is one of
those always-on supplies that are often not described in DTS.

> the warning log is as below:
> "supply vbus not found, using dummy regulator"

And the reason why we get that warning is to point out that the DTS has
a bug and that it should be fixed (by adding a proper regulator to take
the place of the dummy).

> This reverts commit 4ddf1ac79e5f082451cd549283d2eb7559ab6ca9.

But if you read the description of that commit, the purpose of that
patch was in fact to make the supply completely optional in the case
where we already have the VBUS supply specified for the USB port that
the connector is parented to.

So in that case the DTS doesn't have the bug because the VBUS supply is
already specified for the USB port and therefore it doesn't have to be
specified in the USB connector again. In fact, specifying it twice can
lead to a situation where the USB port may not be able to switch the
VBUS supply on or off because the setting might conflict with that of
the USB connector.

So unless there's a real reason why this is needed, I don't think this
should be applied.

Thierry

> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: remove unused variable "need_vbus"
> ---
>  drivers/usb/common/usb-conn-gpio.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-=
conn-gpio.c
> index dfbbc4f51ed6..65d89140cd19 100644
> --- a/drivers/usb/common/usb-conn-gpio.c
> +++ b/drivers/usb/common/usb-conn-gpio.c
> @@ -91,14 +91,14 @@ static void usb_conn_detect_cable(struct work_struct =
*work)
>  		return;
>  	}
> =20
> -	if (info->last_role =3D=3D USB_ROLE_HOST && info->vbus)
> +	if (info->last_role =3D=3D USB_ROLE_HOST)
>  		regulator_disable(info->vbus);
> =20
>  	ret =3D usb_role_switch_set_role(info->role_sw, role);
>  	if (ret)
>  		dev_err(info->dev, "failed to set role: %d\n", ret);
> =20
> -	if (role =3D=3D USB_ROLE_HOST && info->vbus) {
> +	if (role =3D=3D USB_ROLE_HOST) {
>  		ret =3D regulator_enable(info->vbus);
>  		if (ret)
>  			dev_err(info->dev, "enable vbus regulator failed\n");
> @@ -106,9 +106,8 @@ static void usb_conn_detect_cable(struct work_struct =
*work)
> =20
>  	info->last_role =3D role;
> =20
> -	if (info->vbus)
> -		dev_dbg(info->dev, "vbus regulator is %s\n",
> -			regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
> +	dev_dbg(info->dev, "vbus regulator is %s\n",
> +		regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
> =20
>  	power_supply_changed(info->charger);
>  }
> @@ -175,7 +174,6 @@ static int usb_conn_probe(struct platform_device *pde=
v)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct usb_conn_info *info;
> -	bool need_vbus =3D true;
>  	int ret =3D 0;
> =20
>  	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> @@ -205,23 +203,7 @@ static int usb_conn_probe(struct platform_device *pd=
ev)
> =20
>  	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
> =20
> -	/*
> -	 * If the USB connector is a child of a USB port and that port already =
provides the VBUS
> -	 * supply, there's no need for the USB connector to provide it again.
> -	 */
> -	if (dev->parent && dev->parent->of_node) {
> -		if (of_find_property(dev->parent->of_node, "vbus-supply", NULL))
> -			need_vbus =3D false;
> -	}
> -
> -	if (!need_vbus) {
> -		info->vbus =3D devm_regulator_get_optional(dev, "vbus");
> -		if (PTR_ERR(info->vbus) =3D=3D -ENODEV)
> -			info->vbus =3D NULL;
> -	} else {
> -		info->vbus =3D devm_regulator_get(dev, "vbus");
> -	}
> -
> +	info->vbus =3D devm_regulator_get(dev, "vbus");
>  	if (IS_ERR(info->vbus)) {
>  		ret =3D PTR_ERR(info->vbus);
>  		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
> @@ -288,7 +270,7 @@ static int usb_conn_remove(struct platform_device *pd=
ev)
> =20
>  	cancel_delayed_work_sync(&info->dw_det);
> =20
> -	if (info->last_role =3D=3D USB_ROLE_HOST && info->vbus)
> +	if (info->last_role =3D=3D USB_ROLE_HOST)
>  		regulator_disable(info->vbus);
> =20
>  	usb_role_switch_put(info->role_sw);
> --=20
> 2.18.0
>=20

--kQXU9/aA1QNb88Xm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCns5UACgkQ3SOs138+
s6Fq/xAAv63EPKwniK/lIdbUsG5t8rk8ZYgR1AtNxsz0TAPCycoc29luOzcWm2q6
mKhBG1LFeRZp9KQxLvdqreMs4bieRZzuMIJQ7UPvb4yBz2KKPnkQTmxh1JCRUX3t
RieuG15mTmC8RHME3nU6GSXsGHWavKkvzeIIWXSJbO+/EZbbG3XhUPPQ451wPkcL
DXRfCzVKOcur4e0Y2dxmL8P9qlMOqz+hGiBU4GYGIau4lJ5uoarR05LSe+kxTQum
5Kd+w6c8/74YS6R5xan1O/HB314fQs+6/ZeghceMVbo4rdlcKlMVNlQee5oRFwAH
EA038vdd3qmaFCoxgJn/KMntSBrrpYwL3nkeE/3CAp4yIq/DsgJmQ/t1oX9bA6Im
yMHnReLkzPCaW5UqLmE8de6EZk2lAvnsRTO26q7VCZMkDLco6kjYbXN9zJVXWHLg
J3gaFXAXd5j+auni7BLKfekZ5shX83RNZmYXBk5Getsw6qrNEcJ52kCNYDVCT2RM
A9utCz41kwzeImRSbbSUmNcPy9oo3gonEorh3uW3BWr0f84Iy0HWesWiDm1v3O91
l+wGC2yDLNSWzUByJinqXAB3zpaEOCdS3W29AY+Fz79CRPs2lRlpy1UPxyY1FOhq
sTgIAeeGWrD63eRbJIs2UMFu//Sx0IXTCLbSpad3fz8Co/k694w=
=A/ZV
-----END PGP SIGNATURE-----

--kQXU9/aA1QNb88Xm--


--===============4153846277352932109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4153846277352932109==--

