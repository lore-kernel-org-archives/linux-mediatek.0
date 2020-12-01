Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5337C63777
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 01:25:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CFF2151B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 01:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PSn0y95M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hc+nXjhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CFF2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0JTToxTkwd+NNX1/9Kbq/rDpej+I7quKkioTrPrwxws=; b=PSn0y95MJ6EiV2bqU1Zoe4GAk
	RhuB0LDAkbBfG33RlLUW0E1N4bt+8GwB2Zo+din+di967si2hQCXfM3FqextJAm48Fpk0DeKMV48o
	9P5IFng5errSb1SfL+dYDe5MMsE0HkwafTrIkc+Cx2J1dKtCD+PDr6E5c4ma5uTlJKB4pA/dEI3uO
	V9GhqCB66Soobj7+U5AFHYY6YZ0p+wZ7szb8GCppxUNqxR8k5KWbK5OgWVz9GTAUHK9+Pvl7QV1qv
	+FYFtxyuYuRvNMQ4vyv0S8FpUfOzH7THG4Z1feK+oCPaurFOVuDOn1izovGoClEcmKQtvtCTriAeX
	DH/wGN8zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjuQ6-0002Cj-U7; Tue, 01 Dec 2020 01:25:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjuQ3-0002Bn-Ba; Tue, 01 Dec 2020 01:25:29 +0000
X-UUID: 620851c607494def8f40af1094115044-20201130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dbxNIM8CErxAeo/a9YoyJIRJuuVLAhQZpaS/VcjSjUc=; 
 b=Hc+nXjhFEM1a7B7H3282T5tkZNAQ8UBp7KHs8dWCcyCGQ0NEtp9Zaqm7uVfhVNr+SMD5Wxsrf1xjkBUvlffn39v+dSPm2s9G+Y5bqdconTSSnEgTrg4QV2CqW2oV1VNtjEMQ0zHM8VGmNDrir+qAcSaIGHt+pUnifjgMMjXeHU0=;
X-UUID: 620851c607494def8f40af1094115044-20201130
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1828352037; Mon, 30 Nov 2020 17:25:10 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 17:25:17 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 09:25:04 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Dec 2020 09:25:04 +0800
Message-ID: <1606785904.23925.25.camel@mtkswgap22>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC
 voltage values
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Date: Tue, 1 Dec 2020 09:25:04 +0800
In-Reply-To: <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
 <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D631169A3AC1F84EF887163B29696C3026DCFA0229609712F197E4528B1A2F122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_202527_616793_D22F36E8 
X-CRM114-Status: GOOD (  36.43  )
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
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com, nguyenb@codeaurora.org,
 alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-30 at 15:54 -0800, Asutosh Das (asd) wrote:
> On 11/30/2020 3:14 PM, Bjorn Andersson wrote:
> > On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:
> > 
> >> On 11/30/2020 1:16 AM, Stanley Chu wrote:
> >>> UFS specficication allows different VCC configurations for UFS devices,
> >>> for example,
> >>> 	(1). 2.70V - 3.60V (By default)
> >>> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
> >>>                             device tree)
> >>> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> >>>
> >>> With the introduction of UFS 3.x products, an issue is happening that
> >>> UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
> >>> regulator on UFU 3.x products with VCC configuration (3) used.
> >>>
> >>> To solve this issue, we simply remove pre-defined initial VCC voltage
> >>> values in UFS driver with below reasons,
> >>>
> >>> 1. UFS specifications do not define how to detect the VCC configuration
> >>>      supported by attached device.
> >>>
> >>> 2. Device tree already supports standard regulator properties.
> >>>
> >>> Therefore VCC voltage shall be defined correctly in device tree, and
> >>> shall not be changed by UFS driver. What UFS driver needs to do is simply
> >>> enabling or disabling the VCC regulator only.
> >>>
> >>> This is a RFC conceptional patch. Please help review this and feel
> >>> free to feedback any ideas. Once this concept is accepted, and then
> >>> I would post a more completed patch series to fix this issue.
> >>>
> >>> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> >>> ---
> >>>    drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
> >>>    1 file changed, 1 insertion(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> >>> index a6f76399b3ae..3965be03c136 100644
> >>> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> >>> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> >>> @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
> >>>    		vreg->max_uA = 0;
> >>>    	}
> >>> -	if (!strcmp(name, "vcc")) {
> >>> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> >>> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> >>> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> >>> -		} else {
> >>> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> >>> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> >>> -		}
> >>> -	} else if (!strcmp(name, "vccq")) {
> >>> +	if (!strcmp(name, "vccq")) {
> >>>    		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> >>>    		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> >>>    	} else if (!strcmp(name, "vccq2")) {
> >>>
> >>
> >> Hi Stanley
> >>
> >> Thanks for the patch. Bao (nguyenb) was also working towards something
> >> similar.
> >> Would it be possible for you to take into account the scenario in which the
> >> same platform supports both 2.x and 3.x UFS devices?
> >>
> >> These've different voltage requirements, 2.4v-3.6v.
> >> I'm not sure if standard dts regulator properties can support this.
> >>
> > 
> > What is the actual voltage requirement for these devices and how does
> > the software know what voltage to pick in this range?
> > 
> > Regards,
> > Bjorn
> > 
> >> -asd
> >>
> >>
> >> -- 
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> Linux Foundation Collaborative Project
> 
> For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), the 
> voltage requirements (Vcc) are 2.4v-3.6v. The software initializes the 
> ufs device at 2.95v & reads the version and if the device is 3.x, it may 
> do the following:
> - Set the device power mode to SLEEP
> - Disable the Vcc
> - Enable the Vcc and set it to 2.5v
> - Set the device power mode to ACTIVE
> 
> All of the above may be done at HS-G1 & moved to max supported gear 
> based on the device version, perhaps?

Hi Asutosh,

Thanks for sharing this idea.

1. I did not see above flow defined in UFS specifications, please
correct me if I was wrong.

2. For above flow, the concern is that I am not sure if all devices
supporting VCC (2.4v - 2.7v) can accept higher voltage, say 2.95v, for
version detection.

3. For version detection, another concern is that I am not sure if all
3.x devices support VCC (2.4v - 2.7v) only, or in other words, I am not
sure if all 2.x devices support VCC (2.7v - 3.6v) only. The above rule
will break any devices not obeying this "conventions".

For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v),

It would be good for UFS drivers detecting the correct voltage if the
protocol is well-defined in specifications. Until that day, any
"non-standard" way may be better implemented in vendor's ops?

If the vop concept works on your platform, we could still keep struct
ufs_vreg and allow vendors to configure proper min_uV and max_uV to make
regulator_set_voltage() works during VCC toggling flow. Without specific
vendor configurations, min_uV and max_uV would be NULL by default and
UFS core driver will only enable/disasble VCC regulator only without
adjusting its voltage.

Maybe one possible another idea is to decide the correct voltage and
configure regulator properly before kernel?

Thanks,
Stanley Chu

> 
> Am open to other ideas though.
> 
> -asd
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
