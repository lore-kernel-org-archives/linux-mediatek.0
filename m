Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7270BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RClx070h99DzubzrCtCUGUH10FgnJL7Fm7DTxyhIAJc=; b=b19tHa3ShVddYz
	0wXXo45AbsWzRj2Cd+A9efQKSYzfaf52Nq8fsKew7pacZ7wTtoNzKuFqb6u4l0ORlk14qsUE2+2Oc
	w8u2tHz0If91A9NXceAVCrbNGJyh4cOTb47VJoYqPTJGvCdJAESx+zmsxq0WGTkrpwVL68G7eeR5I
	R3qptcmg0P/vDHXwMzd5EVegKNYinbbCenpeb3CAJUec9kMJYB+1oYR9mZLEYrrT3zuCE5a2+dpJJ
	JW5pp4molSCJfrleqgpYyzrH8JVxSEIB9eckN95MpIWuzHhKx1aUJZK3ryZFsR590wfy4foHS+Z7y
	alLNF/n1b0uXY/Oy6ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrSu-00EOw9-80; Wed, 23 Feb 2022 13:13:56 +0000
Received: from ocn-ckd-mts-110c38.ocn.ad.jp ([211.16.13.103])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrNb-00EMfU-O5; Wed, 23 Feb 2022 13:08:31 +0000
Received: from mf-smf-ucb024c1.ocn.ad.jp (mf-smf-ucb024c1.ocn.ad.jp
 [153.153.66.160])
 by ocn-ckd-mts-110c38.ocn.ad.jp (Postfix) with ESMTP id CCA6948001178;
 Wed, 23 Feb 2022 22:08:18 +0900 (JST)
Received: from ocn-vc-mts-101c1.ocn.ad.jp ([153.153.66.78])
 by mf-smf-ucb024c1.ocn.ad.jp with ESMTP
 id MrNSnNQaD1lq8MrNSnzjm2; Wed, 23 Feb 2022 22:08:18 +0900
Received: from ocn-sdpx-mts-102c1.ocn.ad.jp ([211.16.10.135])
 by ocn-vc-mts-101c1.ocn.ad.jp with ESMTP
 id MrNRnB1upEZsNMrNRnWDuC; Wed, 23 Feb 2022 22:08:18 +0900
Received: from localhost (p1601136-ipoe.ipoe.ocn.ne.jp [114.172.254.135])
 by ocn-sdpx-mts-102c1.ocn.ad.jp (Postfix) with ESMTPA;
 Wed, 23 Feb 2022 22:08:17 +0900 (JST)
Date: Wed, 23 Feb 2022 22:08:13 +0900 (JST)
Message-Id: <20220223.220813.1094415484971230882.anemo@mba.ocn.ne.jp>
To: tsbogend@alpha.franken.de
Cc: hauke@hauke-m.de, zajec5@gmail.com, macro@orcam.me.uk,
 paul@crapouillou.net, jiaxun.yang@flygoat.com, chenhuacai@kernel.org,
 matthias.bgg@gmail.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove TX39XX support
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20220222090435.62571-1-tsbogend@alpha.franken.de>
References: <20220222090435.62571-1-tsbogend@alpha.franken.de>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_050828_001494_1E714EB0 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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

On Tue, 22 Feb 2022 10:04:28 +0100, Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> No (active) developer owns this hardware, so let's remove Linux support.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Good cleanup job!

Acked-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

---
Atsushi Nemoto

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
