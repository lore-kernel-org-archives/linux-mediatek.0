Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A1BC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425182245D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 06:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2+d90FZK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tz8mgTT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425182245D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/stI3m5g37bkXJ8pCQFp+2Eg8B+lcvhrmJoSxPU9F8=; b=2+d90FZKcGgSxFtj2Gqksbffwk
	AOZOon522jBE2s+3MUwX1U0t9kl/gdG/38OSCuZwreNxUq/TK9xS/FshYHC9Sw8fb3lIHJpfW+t2J
	aCr6kUt4xp8xj6ZOi9NJjUgkGKb1Fh01eR3dx9iHhFcOFtw7KHwtnfFu9YHzB0bQS7qq8ob3aVwih
	i4bg2GbQedw6Idol6VVbcfpysyoh0cwFFftYsgQdcwCRH+FM7Nq8oFivuROwsmAdHvj+C/IvVbTNn
	3rO1OKFEApsZdWRVs36sAXQgWUQz+nvGQQxVRmTJQjmmqxWnKyi5zyCgDGsOpCtMTFdVftGPeba3X
	iGora7og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVTvh-00062d-7Z; Thu, 22 Oct 2020 06:18:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVTvc-000614-DN; Thu, 22 Oct 2020 06:18:26 +0000
X-UUID: b21ca84258ca4946b91f1e800c0ad722-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zCW5jEV9lFVr+2pw4W/WWhiqBQ7hV3YbIjRN0M12464=; 
 b=tz8mgTT2xaOef2TCkdlgslRJjgXXak8bhAvN+0PcdkTf6oQNxRmcoomxzi5aUhU6yPfpus9r4PeyG3DTvuOMk0V1tHQ7cjf1ZmBgQajtuq9d7UW0ByhzwNqLl5Ax6o7gdiGm/VZVuoGsX7a1itc3txOz0ZkKmomnpcXu4OEgDk8=;
X-UUID: b21ca84258ca4946b91f1e800c0ad722-20201021
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 922865141; Wed, 21 Oct 2020 22:18:16 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 23:18:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 14:18:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 14:18:10 +0800
From: Claude Yen <claude.yen@mediatek.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, 
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] PM / s2idle: Export s2idle_set_ops  
Date: Thu, 22 Oct 2020 14:17:47 +0800
Message-ID: <20201022061748.13730-1-claude.yen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E94CE7364EFCCBE6657F048F02BCCFE98C5E747ADF33706E7CBF3B1A53E304E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_021824_599350_D03167D4 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 claude.yen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series based on 5.9-rc1

As suspend_set_ops is exported in commit a5e4fd8783a2
("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
exporting s2idle_set_ops to make kernel module setup s2idle ops too.

In this way, kernel module can hook platform suspend functions
regardless of Suspend-to-Ram(S2R) or Suspend-to-Idle(S2I)

*** BLURB HERE ***

Claude Yen (1):
  PM / s2idle: Export s2idle_set_ops

 kernel/power/suspend.c | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
