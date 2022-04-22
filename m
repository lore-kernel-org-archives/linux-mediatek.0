Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58583C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnwEorpq+Vg8OPyvowVXJDxlUCJc5c7JPlZrJeeKaKA=; b=xhP9y+PmnoXLy6
	k7SRYB4iI9FOBsTL0W1tfo5Rc+kaZ7yb3WJSo2FsXqgCqMoivSdnzvhJhcn8Jfiuk5afO+YEHoudj
	RL5nJ0/CQ3uqvlyAb9f06VqQ1iHPpijoDNrRbZuU6WMWXMqMsT9tFNBbSC7M6PT8/fsq2tKjlxfaN
	mD+z9vpoHnzaaxDcKUadWJHL9BBtJsRobqtLCoS2MFbDpR7olq6paEAU0odsO4u9lkphpx8lR6Ux7
	2hFlgpDgzDmv+n2iRT1AT1iX50mw11v5GSF8RUDOXdOblXCPbqDeTovUTmYTGtJh4adPVun1EtkRa
	QgGkT05j5cGci6qxXukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhj8Z-00FjH6-Ks; Fri, 22 Apr 2022 02:35:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhj8C-00Fj9n-Pc; Fri, 22 Apr 2022 02:34:51 +0000
X-UUID: c779ac726cea48eca73c2b51739fcf74-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:21fbbb21-71ee-4e96-a97b-7da5c370c321, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:db9db5ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c779ac726cea48eca73c2b51739fcf74-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1215970048; Thu, 21 Apr 2022 19:34:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:24:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 10:24:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 10:24:39 +0800
Message-ID: <d67d5f4f2ec96ade2398e7c0897dbb16bf5fb145.camel@mediatek.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 "Stephen Boyd" <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Date: Fri, 22 Apr 2022 10:24:39 +0800
In-Reply-To: <7hsfq6ql4v.fsf@baylibre.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
 <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
 <7hsfq6ql4v.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_193448_869298_EE850BAC 
X-CRM114-Status: GOOD (  33.36  )
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

Hi Kevin,

On Thu, 2022-04-21 at 12:41 -0700, Kevin Hilman wrote:
> Hi Roger,
> 
> Roger Lu <roger.lu@mediatek.com> writes:
> 
> > On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:
> 
> [...]
> 
> > > That being said, it would be really nice to see an integration tree
> > > where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
> > > 
> > > For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
> > > board, it fails to probe[1] because there is no CCI node in the upstream
> > > mt8183.dtsi.
> > > 
> > > I'm assuming this series is also not very useful without the CPUfreq
> > > series from Rex, so being able to test this, CCI and CPUfreq together on
> > > MT8183 on a mainline kernel would be very helpful.
> > > 
> > > Kevin
> > > 
> > > [1]
> > > [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
> > > [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe
> > > fail
> > 
> > Just share. I've tested this series on below two platforms and it works as
> > expected.
> > - mt8183-Krane (kernel-v5.10)
> > - mt8192-Hayato (kernel-v5.4)
> 
> Unfortunately testing on v5.4 and v5.10 with lots of other additional
> out-of-tree patches does not give much confidence that this series works
> with upstream, especially when I've given a few reasons why it will not
> work uptream.
> 
> The examples I gave above for CCI and CPUs/cluster disable are good
> examples, but another one I forgot to mention is the dependency on Mali.
> The SVS driver will never probe because it also depens on a "mali" node,
> which doesn't exist upstream either (but panfrost does, and acutually
> loads/probes fine on v5.17/v5.18) so this should be fixed to work with
> upstream panfrost.
> 
> IMO, in order for this to be merged upstream, it should at least have
> some basic validation with upstream, and so far I have not even been
> able to make it successfuly probe.  To do that, you will need to either
> provide a list of the dependencies for testing this with mainline
> (e.g. CCI series, CPUfreq series, any DT changes), or even better, an
> integration tree based on recent mainline (e.g. v5.17 stable, or
> v5.18-rc) which shows all the patches (in addition to this series) used
> to validate this on mainline.

No problem. We'll find a machine that can be run correctly with recent mainline
(e.g. v5.17 stable, or v5.18-rc) and add patches (CCI series + CPUfreq series +
any DT changes) to test this SVS series. Thanks very much.

> 
> Thanks,
> 
> Kevin
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
