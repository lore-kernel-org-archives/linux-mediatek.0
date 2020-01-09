Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCB3C33C9E
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 01:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33171206ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 01:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GWqPWmdS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DZ0pvIUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33171206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lA3XLeVkSjlFNebd+Qc0Yo4BXZurxAw/4G8o7/rLxDE=; b=GWqPWmdSPrL1qI
	RSnFEzhH0Qz7k4OrSMZiwaoNZRchQrJOSfdKvOg/jDrHFLbcCfx5qu5i04yqQUGLKQRLRr40VNpiG
	KAyhwojSOH9N7jpbfNq5A2/wYYu/DNHT+pNujeR/p2XcMIl3Zwr/ZOZsBWjrLrrn7ItJF5fxFdxzL
	uF+ZrgIwAy/q2By4sZ0eCqzPOmzaY71pzpZmmCJkLs9Fxmp830ky4FgBzuy/fudUAOGt/KS2g0db/
	2g0HsMRi7fjd4Zt7mN/P0mO+nD7FheDnRWob7YHsxKnVZD5Ogp/YFX0FkMuteAHqij3Wq4ksPCfII
	wlLxUn8A3Ni1JCL0VjRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipN1G-0002vh-Ks; Thu, 09 Jan 2020 01:53:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipN1B-0002uy-Ff
 for linux-mediatek@lists.infradead.org; Thu, 09 Jan 2020 01:53:53 +0000
X-UUID: 41c443fbceeb4d0a9d390e1893e30ad8-20200108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TH+HcJiqfSB2BmOUbCTWX/Pd6ZjIbrp6bOMlJpJC85c=; 
 b=DZ0pvIUW90P1LVF0gY3NsHYY1IlTqNcHfKmjG+EqrBugw6vuujnhHjcmzIkwUTNdCpvd2XsEySWf1KbBrV87Cezfxm8MwfDV35xVGgHEaMUCdpLH8lqRZyGRrczAkDY3ElXqKahXvQWVWNj2dqBWsyl6xde0BEJTYSshVybu9qo=;
X-UUID: 41c443fbceeb4d0a9d390e1893e30ad8-20200108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1440945102; Wed, 08 Jan 2020 17:53:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 17:54:20 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 09:53:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 09:52:06 +0800
Message-ID: <1578534821.23751.2.camel@mtksdaap41>
Subject: Re: Process identical patches in different tree
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 9 Jan 2020 09:53:41 +0800
In-Reply-To: <b360ec7f-2cf5-d18f-2ef9-90b044c98f3d@gmail.com>
References: <1578365790.28495.13.camel@mtksdaap41>
 <e7c8313f-13cd-67b7-ad48-9f1d341bfcb6@gmail.com>
 <b360ec7f-2cf5-d18f-2ef9-90b044c98f3d@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_175349_531746_AC81D8AF 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, linux-mediatek@lists.infradead.org,
 Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Wed, 2020-01-08 at 13:05 +0100, Matthias Brugger wrote:
> On 08/01/2020 12:14, Matthias Brugger wrote:
> > Hi CK,
> > 
> > On 07/01/2020 03:56, CK Hu wrote:
> >> Hi, Dave, Daniel, Matthias:
> >>
> >> In mediatek-drm-next-5.6 [1], I've cherry-pick 3 patches from
> >> v5.5-next/soc [2] because some drm patches depend on these cmdq patches.
> >> So these cmdq patches exist in both tree now. I want to know how to
> >> process this case. I think we could choose one of below way:
> >>
> >> 1. Because these cmdq patches are identical in both tree, so each tree
> >> could do its own upstream and the there would be nothing happen when
> >> merge.
> >> 2. Let soc upstream first, and mediatek drm rebase on the latest
> >> mainline then upstream.
> >>
> >> Which one do you prefer?
> >>
> > 
> > What we would need is a stable branch with this commits that get merged by both
> > trees. If I understand correctly that otherwise the SHA of the commits would be
> > different and that would provoke merge conflicts.
> > 
> > We should not rely on one tree being merged before the other. AFAIK there is no
> > hard merge order between trees.
> > 
> 
> I prepared a branch with the patches I think are relevant for you. Please
> confirm that this is correct, merge the tree in yours and I'll do the same for
> v5.5-next/soc
> 
> <paste>
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v5.5-next-cmdq-stable
> 
> for you to fetch changes up to d412f18c9bc791d8951e903de9a68817e3098a6a:
> 
>   soc: mediatek: cmdq: add cmdq_dev_get_client_reg function (2020-01-08 12:59:57
> +0100)
> 
> ----------------------------------------------------------------
> cmdq patches needed by drm driver to use cmdq interface
> 
> ----------------------------------------------------------------
> Bibby Hsieh (4):
>       soc: mediatek: cmdq: remove OR opertaion from err return
>       soc: mediatek: cmdq: define the instruction struct
>       soc: mediatek: cmdq: add polling function
>       soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
> 
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 147
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  11 ++++++
>  include/linux/soc/mediatek/mtk-cmdq.h    |  53 +++++++++++++++++++++++++
>  3 files changed, 185 insertions(+), 26 deletions(-)
> 
> </paste>
> 

I've done in [1], is it what you expect?

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> Regards,
> Matthias
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
