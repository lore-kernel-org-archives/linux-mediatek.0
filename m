Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE806C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 20:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B9B60527
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 20:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9B9B60527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yf8vaD4qYMR47L/hZ8uH+uYE7ekfNH+nnF58PCRLWA8=; b=yyV/97GhRH+vLp
	ATFfZaGdHqwKuL12HgWRQC8bLvANrqG9TiZn00yVegSXpUIjxKp+p7h85jKuApRLooAFqAaEBAGNa
	aAPtjhZQFG4XQZD7yFag3T5o09ddPCgHPOELAhbNR90UpWmubHuXfO4lEqiMvg+SE6g1Fb3kJWrqE
	ui5vp8FoRoar2Y4669Jh565PU+0Y+8ddmEGYPo8dtE07hpoQ6sn82x4vW0jvQipP+MTpIVD5GrV2j
	Q2h9plBPOCHclBGexcXp+tjM6MyyFDIsOqSWJ0hEvJmew27KU36wL+R6J2kUGmt0Gp5TgXoqZ+gHd
	hL+KUHOW8tQakzglGx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbTYu-008gme-5q; Fri, 15 Oct 2021 20:12:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbTYf-008git-C9; Fri, 15 Oct 2021 20:12:04 +0000
X-UUID: 1763ff2cb8d94701a127d50c3d21f39f-20211015
X-UUID: 1763ff2cb8d94701a127d50c3d21f39f-20211015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434272241; Fri, 15 Oct 2021 13:11:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 13:11:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Oct 2021 04:11:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Oct 2021 04:11:56 +0800
From: <miles.chen@mediatek.com>
To: <bvanassche@acm.org>
CC: <jejb@linux.ibm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <martink@posteo.de>, <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <stanley.chu@mediatek.com>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
Date: Sat, 16 Oct 2021 04:11:55 +0800
Message-ID: <20211015201155.12212-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fe7bacf4-aa9a-6742-8382-a7c9b31236a7@acm.org>
References: <fe7bacf4-aa9a-6742-8382-a7c9b31236a7@acm.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_131201_452490_178B6B24 
X-CRM114-Status: GOOD (  11.40  )
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

From: Miles Chen <miles.chen@mediatek.com>

> Fixing this crash by adding a check inside sd_resume_runtime() seems wrong to me. sd_probe() namely calls dev_set_drvdata(dev, sdkp) before
> sd_probe() has finished so even with the above patch applied sd_resume() can be called before sd_probe() has finished.
> 
> With which kernel version has this crash been encountered? The
> scsi_autopm_get_device() / scsi_autopm_put_device() pair added by commit
> 6fe8c1dbefd6 ("scsi: balance out autopm get/put calls in scsi_sysfs_add_sdev()"; kernel v3.18) should be sufficient to prevent the reported crash.
> 
> Thanks,

Thanks for your comment.

I hit this in v5.15-rc1 merge, I can still reproduce this with v5.15-rc5.
I found two ways to avoid the crash:
1) revert commit ed4246d37f3b ("scsi: sd: REQUEST SENSE for
BLIST_IGN_MEDIA_CHANGE devices in runtime_resume()") works for me.
2) adding the NULL point check in this patch.

From the backtrace, dev_set_drvdata() is called after sd_resume_runtime()
is called. 

sd_probe()
{
 scsi_autopm_get_device()
   pm_runtime_get_sync()
     __pm_runtime_resume()
       rpm_resume()
        ...
	 sd_resume_runtime() // crash here

  dev_set_drvdata(dev, sdkp); // sdkp is set later
}

[    4.861395][  T151]  sd_resume_runtime+0x20/0x14c
[    4.862025][  T151]  scsi_runtime_resume+0x84/0xe4
[    4.862667][  T151]  __rpm_callback+0x1f4/0x8cc
[    4.863275][  T151]  rpm_resume+0x7e8/0xaa4
[    4.863836][  T151]  __pm_runtime_resume+0xa0/0x110
[    4.864489][  T151]  sd_probe+0x30/0x428
[    4.865016][  T151]  really_probe+0x14c/0x500


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
