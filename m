Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B092C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESihhZXHgjYB80dWWplneqS4KGXNGcFhBegteD9wT08=; b=vJwGQRlKsHZjop
	zTC7H/q1v/AW+6h+caBOPh+j/KEZTH1NY739vzrs/KHa6xAknIy0EJ4rofA0619fLQB8Fk5jbMDui
	Jd8hg+U7MKbs+/alC15xpAmm2n+w4wrej1zMUfJoEt0n1EBLDZPYeYC/WOJ3CvaW8HS6oWvm/oz1a
	DrxIksvZHGMB85gu4/nHlT6ZzexOFi2Ul6OHJ14nTCdH1nAKpj3m/iVMeIA25d+RJdWV5lIXA2L36
	s9SZDsbhqSDW/TCeQ9yCrr3gLTBmiTPY8JpY7ujuYIH2+X7ZuFi08ZO5Jsg/HkCw0RIrEZJwo7mkz
	MQkpC2fnK08D+8u4NW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFtk-00EGU3-PK; Tue, 12 Apr 2022 12:45:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFkn-00EBt4-0o; Tue, 12 Apr 2022 12:36:20 +0000
X-UUID: 2185002e6b5949e689e79c72fbae40e7-20220412
X-UUID: 2185002e6b5949e689e79c72fbae40e7-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1817930528; Tue, 12 Apr 2022 05:36:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 05:26:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:26:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 20:26:06 +0800
Message-ID: <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Apr 2022 20:26:06 +0800
In-Reply-To: <7hwnfv4hfr.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
 <7hwnfv4hfr.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_053617_166008_154F6F8B 
X-CRM114-Status: GOOD (  44.03  )
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

On Mon, 2022-04-11 at 11:13 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> > On Fri, 2022-04-08 at 13:54 -0700, Kevin Hilman wrote:
> > > Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> > > 
> > > > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > 
> > > > In some MediaTek SoCs, like MT8183, CPU and CCI share the same
> > > > power
> > > > supplies. Cpufreq needs to check if CCI devfreq exists and wait
> > > > until
> > > > CCI devfreq ready before scaling frequency.
> > > > 
> > > > - Add is_ccifreq_ready() to link CCI device to CPI, and CPU
> > > > will
> > > > start
> > > >   DVFS when CCI is ready.
> > > > - Add platform data for MT8183.
> > > > 
> > > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > 
> > > The checks here are not enough, and will lead to unexpected
> > > behavior.
> > > IIUC, before doing DVFS, you're checking:
> > > 
> > > 1) if the "cci" DT node is present and
> > > 2) if the driver for that device is bound
> > > 
> > > If both those conditions are not met, you don't actually fail,
> > > you
> > > just
> > > silently do nothing in ->set_target().  As Angelo pointed out
> > > also,
> > > this
> > > is not a good idea, and will be rather confusing to users.
> > > 
> > > The same thing would happen if the cci DT node was present, but
> > > the
> > > CCI
> > > devfreq driver was disabled.  Silent failure would also be quite
> > > unexpected behavior.  Similarily, if the cci DT node is not
> > > present
> > > at
> > > all (like it is in current upstream DT), this CPUfreq driver will
> > > silently do nothing.  Not good.
> > > 
> > > So, this patch needs to handle several scenarios:
> > > 
> > > 1) CCI DT node not present
> > > 
> > > In this case, the driver should still operate normally.  With no
> > > CCI
> > > node, or driver there's no conflict.
> > > 
> > > 2) CCI DT present/enabled but not yet bound
> > > 
> > > In this case, you could return -EAGAIN as suggested by Angelo, or
> > > maybe
> > > better, it should do a deferred probe.
> > > 
> > > 3) CCI DT present, but driver disabled
> > > 
> > > This case is similar to (1), this driver should continue to work.
> > > 
> > > Kevin
> > 
> > Hello Kevin and Angelo,
> > 
> > In my review, if we do not get the link or the link status is not
> > correct between cci and cpufreq in target_index, I think it will
> > never
> > established again for this link.
> > Because it's not checked in probe stage.
> > 
> > So I think we just need to deal with the issue without cci device,
> > and
> > don't expect the link between cci and cpufreq will be connected
> > again.
> > 
> > If I am wrong, please correct me.
> 
> I don't fully understand your questions, but I think what your
> getting
> at suggest that you might need to use deferred probe to handle the
> case
> where the ordering of CCI and cpufreq probing is not predictable.
> 
> Kevin

Hello Kevin and Angelo,

I can summary what I got now:

1. Why we need cci for cpufreq in MT8183 and MT8186:
   a. CCI is a mediatek hw module.
   b. For mediatek SoCs before MT8183, like MT8173, the CCI hw
      is not introduced.
   c. The frequency for cci and cpufreq are determined could
      be configed at bootloader stage, so the frequency when
      entering kernel is unknown.
   d. Cpu little core and cci are using the same regulator.
   e. If we do not control CCI and just adjust the voltage in
      cpufreq driver.
      When we adjust the voltage smaller because we need to reduce
      the frequency, the CCI could run in high frequency which is
      set in bootloader.
      This will cause some problem, the cci could crash.

      Use MT8186 for a example, the bootloader set cci freq as
      1.385GHz and cpufreq as 2GHz.
      If entering kernel and we only adjust the cpufreq voltage, if
      the cpufreq is under 1.618GHz, the cci will be out of spec.
      You can refer to the chrome project bootloader "Coreboot" patch:
      
https://review.coreboot.org/c/coreboot/+/59569/2/src/mainboard/google/corsola/romstage.c

   f. If cpufreq driver wait cci ready, regulator framework will take
      the highest voltage requests from cci and cpufreq as output
      so that it prevents from high freqeuncy low voltage crash.
   d. Therefore, I think it's not a good idea to bypass cci device if
      the ccifreq_supported is true in MT8183 and MT8186.

2. Check the device link status is DL_DEV_DRIVER_BOUND is used for
   promising the cci is probed done.

3. About the cpufreq_driver->target_index
   a. When I trace the common drivers, I found if the return value is
      not zero, it will be BUG_ON.
      ref:
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1471
   b. I also try to move is_ccifreq_ready() to other place, like
      cpufreq_driver->init and cpufreq probe function.
      There will be new issue. Do you have any suggetion that we can
      retern value of DEFER_PROBE?

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
