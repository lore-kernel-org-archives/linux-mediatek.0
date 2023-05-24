Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BEDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDwTTTq9Z5T3KmFjLjOHbVttd0VmR7yaP3a+vTS/I6g=; b=F4OtdsgP2qIg3lpWkcutfwI2TK
	rSM/LhfnpHG2XoP/UExDNJvaLetPK343ehlh8xDwFRsNg5/yNb9r9GQa0wX+4+vIj92+REtkGd7/e
	c3JNcyvwNqOnr4w6gmJ5cTgbZkcUnly8LnPjnyTBJaRbMPA7OxlBiQs0LNqKz+2hScTJl4h1v8F0R
	x2O92SMK0+s7mkgtQpExkVeEoxcIUTn1BaACLMXUSgKMC2n6S8wfr2tR9Xl4BXGX9Vm3UdX98odKW
	lBuU9y5uLgu8KDyjNAq2234RIEMK14yIbsf0BwWok36YpIOCLLQHj/ARsqV17sqLg5njIHRy1aRrD
	uC2i36qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1npM-00DSjo-2H;
	Wed, 24 May 2023 12:42:52 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1npJ-00DShi-0x;
	Wed, 24 May 2023 12:42:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q1npD-0000Ql-0u;
	Wed, 24 May 2023 12:42:43 +0000
Date: Wed, 24 May 2023 13:42:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jia-wei Chang =?utf-8?B?KOW8teS9s+WBiSk=?= <Jia-wei.Chang@mediatek.com>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vincent@systemli.org" <vincent@systemli.org>,
	"hsinyi@google.com" <hsinyi@google.com>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Rex-BC Chen =?utf-8?B?KOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	"error27@gmail.com" <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] cpufreq: mediatek: Raise proc and sram max
 voltage for MT7622/7623
Message-ID: <ZG4GNpxdbZ4TNq3K@makrotopia.org>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
 <20230324101130.14053-5-jia-wei.chang@mediatek.com>
 <ZGuuVPCqgpUO6p0Q@makrotopia.org>
 <a1793745-eae3-cae5-49fc-2e75fe0847f0@collabora.com>
 <ZGz55oEEAhlWZajK@makrotopia.org>
 <3054e2d9-7f77-a22a-293d-382f19494079@collabora.com>
 <4e5a8202f7446481def19e5926d1bfd6e6568dd7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e5a8202f7446481def19e5926d1bfd6e6568dd7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_054249_481954_8E6CDF13 
X-CRM114-Status: GOOD (  55.20  )
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

On Wed, May 24, 2023 at 08:43:31AM +0000, Jia-wei Chang (張佳偉) wrote:
> On Wed, 2023-05-24 at 09:28 +0200, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Il 23/05/23 19:37, Daniel Golle ha scritto:
> > > On Tue, May 23, 2023 at 04:56:47PM +0200, AngeloGioacchino Del
> > > Regno wrote:
> > > > Il 22/05/23 20:03, Daniel Golle ha scritto:
> > > > > Hi Jia-Wei,
> > > > > Hi AngeloGioacchino,
> > > > > 
> > > > > On Fri, Mar 24, 2023 at 06:11:30PM +0800, jia-wei.chang wrote:
> > > > > > From: AngeloGioacchino Del Regno <
> > > > > > angelogioacchino.delregno@collabora.com>
> > > > > > 
> > > > > > During the addition of SRAM voltage tracking for CCI scaling,
> > > > > > this
> > > > > > driver got some voltage limits set for the vtrack algorithm:
> > > > > > these
> > > > > > were moved to platform data first, then enforced in a later
> > > > > > commit
> > > > > > 6a17b3876bc8 ("cpufreq: mediatek: Refine
> > > > > > mtk_cpufreq_voltage_tracking()")
> > > > > > using these as max values for the regulator_set_voltage()
> > > > > > calls.
> > > > > > 
> > > > > > In this case, the vsram/vproc constraints for MT7622 and
> > > > > > MT7623
> > > > > > were supposed to be the same as MT2701 (and a number of other
> > > > > > SoCs),
> > > > > > but that turned out to be a mistake because the
> > > > > > aforementioned two
> > > > > > SoCs' maximum voltage for both VPROC and VPROC_SRAM is 1.36V.
> > > > > > 
> > > > > > Fix that by adding new platform data for MT7622/7623
> > > > > > declaring the
> > > > > > right {proc,sram}_max_volt parameter.
> > > > > > 
> > > > > > Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits
> > > > > > to platform data")
> > > > > > Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine
> > > > > > mtk_cpufreq_voltage_tracking()")
> > > > > > Signed-off-by: AngeloGioacchino Del Regno <
> > > > > > angelogioacchino.delregno@collabora.com>
> > > > > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > > > ---
> > > > > >    drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
> > > > > >    1 file changed, 11 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > > > > > b/drivers/cpufreq/mediatek-cpufreq.c
> > > > > > index 764e4fbdd536..9a39a7ccfae9 100644
> > > > > > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > > > > > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > > > > > @@ -693,6 +693,15 @@ static const struct
> > > > > > mtk_cpufreq_platform_data mt2701_platform_data = {
> > > > > >            .ccifreq_supported = false,
> > > > > >    };
> > > > > > +static const struct mtk_cpufreq_platform_data
> > > > > > mt7622_platform_data = {
> > > > > > +  .min_volt_shift = 100000,
> > > > > > +  .max_volt_shift = 200000,
> > > > > > +  .proc_max_volt = 1360000,
> > > > > > +  .sram_min_volt = 0,
> > > > > > +  .sram_max_volt = 1360000,
> > > > > 
> > > > > This change breaks cpufreq (with ondemand scheduler) on my BPi
> > > > > R64
> > > > > board (having MT7622AV SoC with MT6380N PMIC).
> > > > > ...
> > > > > [    2.540091] cpufreq: __target_index: Failed to change cpu
> > > > > frequency: -22
> > > > > [    2.556985] cpu cpu0: cpu0: failed to scale up voltage!
> > > > > ...
> > > > > (repeating a lot, every time the highest operating point is
> > > > > selected
> > > > > by the cpufreq governor)
> > > > > 
> > > > > The reason is that the MT6380N doesn't support 1360000uV on the
> > > > > supply
> > > > > outputs used for SRAM and processor.
> > > > > 
> > > > > As for some reason cpufreq-mediatek tries to rise the SRAM
> > > > > supply
> > > > > voltage to the maximum for a short moment (probably a side-
> > > > > effect of
> > > > > the voltage tracking algorithm), this fails because the PMIC
> > > > > only
> > > > > supports up to 1350000uV. As the highest operating point is
> > > > > anyway
> > > > > using only 1310000uV the simple fix is setting 1350000uV as the
> > > > > maximum
> > > > > instead for both proc_max_volt and sram_max_volt.
> > > > > 
> > > > > A similar situation applies also for BPi R2 (MT7623NI with
> > > > > MT6323L
> > > > > PMIC), here the maximum supported voltage of the PMIC which
> > > > > also only
> > > > > supports up to 1350000uV, and the SoC having its highest
> > > > > operating
> > > > > voltage defined at 1300000uV.
> > > > > 
> > > > > If all agree with the simple fix I will post a patch for that.
> > > > > 
> > > > > However, to me it feels fishy to begin with that the tracking
> > > > > algorithm
> > > > > tries to rise the voltage above the highest operating point
> > > > > defined in
> > > > > device tree, see here:
> > > > > 
> > > > > 6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei
> > > > > Chang              2022-05-05 19:52:20 +0800 100)    new_vsram
> > > > > = clamp(new_vproc + soc_data->min_volt_shift,
> > > > > 6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei
> > > > > Chang              2022-05-05 19:52:20 +0800
> > > > > 101)                      soc_data->sram_min_volt, soc_data-
> > > > > >sram_max_volt);
> > > > > 
> > > > > However, I did not investigate in depth the purpose of this
> > > > > initial rise and can impossibly test my modifications to the
> > > > > tracking algorithm on all supported SoCs.
> > > > > 
> > > > 
> > > > Thanks for actually reporting that, I don't think that there's
> > > > any
> > > > valid reason why the algorithm should set a voltage higher than
> > > > the
> > > > maximum votage specified in the fastest OPP.
> > > > 
> > > > Anyway - the logic for the platform data of this driver is to
> > > > declare
> > > > the maximum voltage that SoC model X supports, regardless of the
> > > > actual
> > > > board-specific OPPs, so that part is right; to solve this issue,
> > > > I guess
> > > > that the only way is for this driver to parse the OPPs during
> > > > .probe()
> > > > and then always use in the algorithm
> > > > 
> > > >      vproc_max = max(proc_max_volt, opp_vproc_max);
> > > >      vsram_max = max(sram_max_volt, vsram_vreg_max);
> 
> Hi Daniel, Angelo Sir,
> 
> Thanks for the issue report and suggestions.
> 
> Is it possible to modify the value of proc_max_volt and sram_max_volt
> to 1310000 in mt7622_platform_data as the highest voltage declared in
> mt7622.dtsi and then give it a try?
> 
> Sorry, I need someone help to check this on mt7622 since I don't have
> mt7622 platform..

Unfortunately also setting proc_max_volt and sram_max_volt to 1310000
doesn't work:
[    1.983325] cpu cpu0: cpu0: failed to scale up voltage!
[    1.988621] cpufreq: __target_index: Failed to change cpu frequency: -22
::repeating infinitely::

This is because in mt6380-regulator.c you can see
static const unsigned int ldo_volt_table1[] = {
        1400000, 1350000, 1300000, 1250000, 1200000, 1150000, 1100000, 1050000,
};

So 1310000 is not among the supported voltages but mediatek-cpufreq.c
will repeatedly call
regulator_set_voltage(sram_reg, 1310000, 1310000);
which will fail for obvious reasons.

Using 1350000 for proc_max_volt and sram_max_volt like I have suggested
as a simple work-around does work because 1350000 is among the supported
voltages of the MT6380 regulator.

On MT7623 the whole problem is anyway non-existent because there is no
separate sram-supply, hence the tracking algorithm isn't used at all.

> 
> Thanks.
> 
> > > 
> > > You probably meant to write
> > > vproc_max = min(proc_max_volt, opp_vproc_max);
> > > vsram_max = min(sram_max_volt, vsram_vreg_max);
> > > 
> > > right?
> > > 
> > 
> > Apparently, some of my braincells was apparently taking a break. :-)
> > 
> > Yes, I was meaning min(), not max() :-)
> > 
> > Cheers!
> > 
> > > > 
> > > > Jia-Wei, can you please handle this?
> > > > 
> > > > Thanks,
> > > > Angelo
> > > > 
> > 
> > 
> > 

