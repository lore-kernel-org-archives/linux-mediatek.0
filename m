Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9086C33C9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 02:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B1D24679
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 02:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdYLuMy+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ePJgFl1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B1D24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90zEzEdznc0Y0H3ghPMncWxgGqvrulzDVwnyZxpz2kk=; b=qdYLuMy+y8tyjs
	JXjM8AiJ5WhrX25aQ4/48W+JnvTI9aDt0Zt0NPm5Z+KHxzFdFsGQTc0aBoiGrAeh9T+d+yUPeteH+
	EmOB8A4hU/jvHkbYghExgE0xWxY239C1A2uRDM2kI44cHphNXhTbC256LFBypxiCzldfQ5Zb7sMcV
	6cLJKEVYmUyGDQulRqGCkIOMDMz7iQeJNRqmfqTsvVM4VnFZE3y1LT1vvCK5BKO+UyIfnBFvLakoX
	667Zb45/mUjpG3BNZnl2XpgpChhOi/js1t60dteVBuOnhYr1McJj2bzmlo1oSy2akbi3jFsr10bwa
	BtLNenHv2+FFiGEqDPVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irYPD-00045j-AG; Wed, 15 Jan 2020 02:27:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irYP9-00045H-V3; Wed, 15 Jan 2020 02:27:37 +0000
X-UUID: fe80f3403572480289d653f60677eb9b-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t7G0F5wFKNpxOWWP1HfUu2lE6k+aZLiE8/TaEH0DhZY=; 
 b=ePJgFl1O0gI1j7JP5yfOQJZvZQSsKi2O++HGnh7M/Fzuh2fihu/AVLhw+0qDXabJASuzXnqkThlCGLWMt8Eniih2xPsotjYvoq1O/E19ebOi6R8IiTWPaUWmZvpQm0FVcSuTEBKN90ja61Of7MYuKkqV34WUT8USgv5Rexy4VcM=;
X-UUID: fe80f3403572480289d653f60677eb9b-20200114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1600501926; Tue, 14 Jan 2020 18:27:29 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 18:28:15 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 15 Jan 2020 10:26:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 10:26:37 +0800
Message-ID: <1579055239.21256.41.camel@mhfsdcap03>
Subject: Re: [RESEND PATCH v5 01/11] dt-bindings: phy-mtk-tphy: add two
 optional properties for u2phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Date: Wed, 15 Jan 2020 10:27:19 +0800
In-Reply-To: <970b7cce-40ed-9ab7-5e04-9e3d609eadf7@ti.com>
References: <1578448326-27455-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200110111006.GB2220@a0393678ub> <1578990166.21256.35.camel@mhfsdcap03>
 <970b7cce-40ed-9ab7-5e04-9e3d609eadf7@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D6F4E3B3560C67F3EC8745B1AA703FF32EBECC3C2932946A4CB08C403FC63D962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_182736_011370_58F1B353 
X-CRM114-Status: GOOD (  21.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@a0393678ub>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Kishon,

On Tue, 2020-01-14 at 14:01 +0530, Kishon Vijay Abraham I wrote:
> Hi Chunfeng,
> 
> On 14/01/20 1:52 PM, Chunfeng Yun wrote:
> > Hi Kishon,
> > 
> > On Fri, 2020-01-10 at 16:40 +0530, Kishon Vijay Abraham I wrote:
> >> Hi,
> >>
> >> On Wed, Jan 08, 2020 at 09:51:56AM +0800, Chunfeng Yun wrote:
> >>> Add two optional properties, one for tuning J-K voltage by INTR,
> >>> another for disconnect threshold, both of them are related with
> >>> connect detection
> >>>
> >>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >>> Acked-by: Rob Herring <robh@kernel.org>
> >>
> >> Patch does not apply. I get the following errors
> >> error: patch failed: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt:52
> >> error: Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt: patch does not apply
> >> error: Did you hand edit your patch?
> >>
> >> Can you send them again in the right format?
> > I download this patch from https://patchwork.kernel.org/patch/11322505/
> > and fetch kernel5.5-rc5, then
> 
> Please try applying to
> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git next

Sorry, still not reproduce it on your next branch, logs as following:

[linux-phy]$git am --reject
RESEND-v5-01-11-dt-bindings-phy-mtk-tphy-add-two-optional-properties-for-u2phy.patch
Applying: dt-bindings: phy-mtk-tphy: add two optional properties for
u2phy
Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
Applied patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
cleanly.

[linux-phy]$git log --oneline -6
e93d3cf70eee (HEAD -> next) dt-bindings: phy-mtk-tphy: add two optional
properties for u2phy
28a263814638 (origin/next) dt-bindings: phy: Add PHY_TYPE_DP definition
56b337ef505d phy: ti: j721e-wiz: Fix return value check in wiz_probe()
b66d1ac82918 dt-bindings: usb: Convert Allwinner A80 USB PHY controller
to a schema
b109c13a533b phy: intel-lgm-emmc: Fix warning by adding missing
MODULE_LICENSE
c9f9eba06629 phy: ti: j721e-wiz: Manage typec-gpio-dir

> > 
> > git am --reject
> > RESEND-v5-01-11-dt-bindings-phy-mtk-tphy-add-two-optional-properties-for-u2phy.patch
> > Applying: dt-bindings: phy-mtk-tphy: add two optional properties for
> > u2phy
> > Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
> > Applied patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > cleanly.
> > 
> > don't reproduce the error you encountered, can you tell me the steps you
> > apply the patch, thanks
> 
> git am chunfeng.yun.patch --reject
> Applying: dt-bindings: phy-mtk-tphy: add two optional properties for u2phy
> Checking patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt...
> error: while searching for:
> - mediatek,eye-vrt	: u32, the selection of VRT reference voltage?
> - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage?
> - mediatek,bc12	: bool, enable BC12 of u2phy if support it?
> ?
> Example:?
> ?
BTW, ? is line break?

When I open the patch by vim, and set invlist, line break is $.

> 
> error: patch failed:
> Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt:52
> Applying patch Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> with 1 reject...
> Rejected hunk #1.
> Patch failed at 0001 dt-bindings: phy-mtk-tphy: add two optional
> properties for u2phy
> Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Thanks
> Kishon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
