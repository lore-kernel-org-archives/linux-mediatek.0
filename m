Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j52whGXiiMpaKTYv2EGxGA+SqJKiikr1n8EE34+gtHk=; b=P4i73S8FIKhUOf
	0OsMKGJKRsrlLve1bpkQQCQaNQNOeX0UN6ewlsB4fcPQFahAOPIz0ScW6j8FAxeTQI4EYX20vMWUM
	tegRkYbzIZzpnh7V+57PzCyjwQ8D94LhFYB3TEgRPbY0FW8+n8AEBxfei2iKgXI8c/MZPdfAkltVI
	tfEC538jfSfKzigxzzJbrDPygzeKh8P7fLqJ4c98YeBGLm/HCLjSL2Or3YT6yGF1/Rf79qLmA85Fo
	kPofikpNCRtyRDPeNtMwLc8buW1nh5iQZoIeexve9rq+R7W/dm+Oh/mZIz3GWwqkjAK41VHgMWWHq
	iPedcl1zNF1O2FkOeCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nebEp-000laY-Aj; Wed, 13 Apr 2022 11:32:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nebEd-000lYi-TT; Wed, 13 Apr 2022 11:32:33 +0000
X-UUID: 8c82429924a04d6bb9b6be6fb3483726-20220413
X-UUID: 8c82429924a04d6bb9b6be6fb3483726-20220413
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 82927422; Wed, 13 Apr 2022 04:32:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 04:32:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Apr 2022 19:32:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 19:32:22 +0800
Message-ID: <98957e61b040b6c5b6a6b39e6eb661e07e510277.camel@mediatek.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 13 Apr 2022 19:32:22 +0800
In-Reply-To: <7h5yne3zlx.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
 <7hwnfv4hfr.fsf@baylibre.com>
 <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
 <7h5yne3zlx.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_043232_016586_BEA68798 
X-CRM114-Status: GOOD (  47.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-04-12 at 11:50 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> [...]
> 
> > I can summary what I got now:
> > 
> > 1. Why we need cci for cpufreq in MT8183 and MT8186:
> >    a. CCI is a mediatek hw module.
> >    b. For mediatek SoCs before MT8183, like MT8173, the CCI hw
> >       is not introduced.
> >    c. The frequency for cci and cpufreq are determined could
> >       be configed at bootloader stage, so the frequency when
> >       entering kernel is unknown.
> >    d. Cpu little core and cci are using the same regulator.
> >    e. If we do not control CCI and just adjust the voltage in
> >       cpufreq driver.
> >       When we adjust the voltage smaller because we need to reduce
> >       the frequency, the CCI could run in high frequency which is
> >       set in bootloader.
> >       This will cause some problem, the cci could crash.
> > 
> >       Use MT8186 for a example, the bootloader set cci freq as
> >       1.385GHz and cpufreq as 2GHz.
> >       If entering kernel and we only adjust the cpufreq voltage, if
> >       the cpufreq is under 1.618GHz, the cci will be out of spec.
> > 
> >    f. If cpufreq driver wait cci ready, regulator framework will
> > take
> >       the highest voltage requests from cci and cpufreq as output
> >       so that it prevents from high freqeuncy low voltage crash.
> > 
> >    d. Therefore, I think it's not a good idea to bypass cci device
> > if
> >       the ccifreq_supported is true in MT8183 and MT8186.
> 
> I do not propose to bypass CCI device.  What both Angelo and I are
> saying is just that you need a better way to handle the cases when
> CCI
> is not (yet) enabled.  The current way in the propsed patch is not
> good
> enough.
> 
> I fully understand the potential problems with high frequency & low
> voltage when using a shared regulator.  But, I think the problem
> we're
> trying to solve here is specific to the initial boot of the platform,
> while we are waiting for the CCI driver to be loaded.
> 
> The root of the problem is that the CCI bus has constraints on the
> voltage regulator that are not defined anywhere until the CCI driver
> is
> loaded.  So to fix that, you need to either:
> 
> 1) not allow any voltage changes
> 2) register the CCI device constraints
> 
> In the current patch, you attempt to do (1).  There's nothing wrong
> with
> the idea, we just pointed out problems in your implementation,
> especially the fact that it does nothing, but it "succeeds" so the
> CPUfreq framework will think the OPPs are different from what they
> actually are.
> 
> Just an idea, but another option could be (2).  While waiting for the
> CCI device to be ready, the CPUfreq driver could check the current
> CCI
> freq/voltage and set min/max constraints on the regulator that
> prevent
> CCI from breaking.  These constraints would stay in place until the
> CCI
> driver is ready.  Once the real CCI driver is ready/registerd these
> contraints would be removed.
> 
> Another version of this same idea would be to check the CCI
> freq/voltage
> and then limit the OPPs available to CPUfreq to only the ones that
> would
> not break CCI.  Then, when CCI is ready/registered, you remove the
> limits.
> 
> > 2. Check the device link status is DL_DEV_DRIVER_BOUND is used for
> >    promising the cci is probed done.
> > 
> > 3. About the cpufreq_driver->target_index
> >    a. When I trace the common drivers, I found if the return value
> > is
> >       not zero, it will be BUG_ON.
> >       ref:
> > 
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c*L1471__;Iw!!CTRNKA9wMg0ARbw!wgawOs1JSuJihgxA1nxhbd2Ekoys_bPCAlIH9YJhe2N9ckG6O1mDB-7zqSf6x2MhCfXo$
> >  
> 
> Right, you should not try to do deferred probe in the ->set_target()
> callback.  Deferred probe is meant for init/probe time.
> 
> >    b. I also try to move is_ccifreq_ready() to other place, like
> >       cpufreq_driver->init and cpufreq probe function.
> >       There will be new issue. Do you have any suggetion that we
> > can
> >       retern value of DEFER_PROBE?
> 
> The only appropriate place is in the probe function.
> 
> Kevin

Hello Kevin,

From the Chanwoo's devfreq passive govonor series, it's impossible to
let cci devreq probed done before cpufreq because the passive govonor
will search for cpufreq node and use it.

Ref: function: cpufreq_passive_register_notifier()

https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing&id=b670978ddc43eb0c60735c3af6e4a370603ab673

After I discuss with Angelo and Jia-wei, we think we are keeping the
function in target_index and if the cci is not ready we will use the
voltage which is set by bootloader to prevent high freqeuncy low
voltage crash. And then we can keep seting the target frequency.

We assume the setting of bootloader is correct and we can do this.

For the SoCs that including ci hardware (8183 and 8186), we think it's
not ok if we don't probe cci correctly.
If we failed to get cci node, I think we sould return -ENODEV and the
probe of cpufreq failed.

What do you think the solution?

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
