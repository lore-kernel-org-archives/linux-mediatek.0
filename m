Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1779C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 02:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgoAdKAAqIt/bOp1vdStwotwaZ291awSH8H+XCRQPfc=; b=HX8n9lwsPRYMnK
	fNxsDDF2UK0AZW1N/8xeTDJfdmdhbFnl72seH9gSbVQjWniO6TZmSQ2Wlfz5cPUYR7r6/OiUuMd16
	auNs1wLTv7oPltBEBbPNvVZ6y/F6UWC48/TumHIHLk5mu/Iyci3GmpPveyoDOGNXzvs5+qV7jmJbQ
	UCSadEAG1qD7EEVzPH9ttPQx7Z/XrKCxYikQGhUsTiMb6nuU8Je76ot+xNjVCCS2WHUMjlm0GJ/EL
	IP217xiRFnseX2FVszt6awpkfQ1+s1cVcqYcJtKgXFivDlFF5//BOBnET8faKhtZMtvDL2ZsvXZRv
	E6A5UxkXlIBEa+EWt4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncepd-00EiZT-9H; Fri, 08 Apr 2022 02:58:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncepa-00EiY5-Ck; Fri, 08 Apr 2022 02:58:40 +0000
X-UUID: fa58944454b64bde9ca5cbae9c92354e-20220407
X-UUID: fa58944454b64bde9ca5cbae9c92354e-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1085596563; Thu, 07 Apr 2022 19:58:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 19:53:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 10:53:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 10:53:11 +0800
Message-ID: <79b785cada5bdf65673a272255ba22bdb4b55df9.camel@mediatek.com>
Subject: Re: [PATCH 2/3] devfreq: mediatek: add mt8183 cci devfreq driver
From: Johnson Wang <johnson.wang@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Hsin-Yi Wang <hsinyi@google.com>, "Tim
 Chang" <jia-wei.chang@mediatek.com>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jia-Wei Chang
 <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Fri, 8 Apr 2022 10:53:11 +0800
In-Reply-To: <7h7d808sti.fsf@baylibre.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-3-jia-wei.chang@mediatek.com>
 <CACb=7PUSAF6ui2a7iMYrrXo=v0OaXhCfiF=dPzq4cfUXM3JbDg@mail.gmail.com>
 <7h7d808sti.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_195838_464372_50BA5200 
X-CRM114-Status: GOOD (  25.68  )
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

On Thu, 2022-04-07 at 14:52 -0700, Kevin Hilman wrote:
> Hsin-Yi Wang <hsinyi@google.com> writes:
> 
> > On Mon, Mar 7, 2022 at 8:32 PM Tim Chang <
> > jia-wei.chang@mediatek.com> wrote:
> > > 
> > > This adds a devfreq driver for the Cache Coherent Interconnect
> > > (CCI) of
> > > the Mediatek MT8183.
> > > 
> > > On mt8183 the cci is supplied by the same regulator as the little
> > > cores.
> > > The driver is notified when the regulator voltage changes (driven
> > > by
> > > cpufreq) and adjusts the cci frequency to the maximum possible
> > > value.
> > > 
> > > Add need_voltage_tracking variable to platforma data. if true, it
> > > indicates soc is required to realize the voltage tracking between
> > > voltage of sram and voltage of cci by software approach.
> > > otherwise, the
> > > voltage tracking is realized by hardware appraoch.
> > > 
> > > Add the notifier to cci so that it could react after svs driver
> > > changes
> > > opp table of cci.
> > > 
> > > Signed-off-by: Jia-Wei Chang <
> > > jia-wei.chang@mediatek.corp-partner.google.com>
> 
> [...]
> 
> > > +
> > > +       passive_data = devm_kzalloc(cci_dev, sizeof(struct
> > > devfreq_passive_data), GFP_KERNEL);
> > > +       if (!passive_data) {
> > > +               ret = -ENOMEM;
> > > +               goto out_remove_opp_table;
> > > +       }
> > > +
> > > +       passive_data->parent_type = CPUFREQ_PARENT_DEV;
> > 
> > It's better to add a note below commit message to state that this
> > series depends on
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing__;!!CTRNKA9wMg0ARbw!3dQn_JiiD_cRiN-TmoNWXX7mD2cmF4M5elG4WabiS392Mg9S8wlsagK1o-n9beULMei4AAj9zsoPBElt9R4-UnAd1g$
> >  
> 
> Not only is this series dependent the previous series from Chanwoo,
> in
> also fails to compile if CONFIG_DEVFREQ_GOV_PASSIVE is not enabled,
> because CPUFREQ_PARENT_DEV defined inside of an #ifdef.
> 
> Please compile test this with and without CONFIG_DEVFREQ_GOV_PASSIVE
> enabled.
> 
> Kevin

Hi Kevin,

Thank you for review.
I will fix it in next verison.

BRs,
Johnson Wang



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
