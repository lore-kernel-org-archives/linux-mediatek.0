Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55B9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rDEdK6+zPLtRocxqT5AbPqxoT+CPWFtkVewPSU6xigM=; b=vW0
	qnDSwmMRGi5yD7iyzAN+2eJ3tCDLaj0jxOZRYi55DKlBqSFzFPU3WjiE+Nttr96uYUyyeJ0LjUAwA
	+apfB2OcHD/BlSNj1mTWDeDbNjIElrZxySDazvEx9Y/OFvEWO2z7a7+hGG1EoROK3AwqxyzvApGoG
	7YN/ASVPnBUJvTpJ4xC8yC7KlkWhTvT03r8XO0K/6SNOOYbb0sYYo9YZ5YxtD9EwUaX/sHQ4B+05r
	rf9P4qV8Jm0zaEWDabqXuefUWvH8bTS4cFEaPQerUgKWV/R46A3fM0NaL3O6rv5KnfjcF4Q8M+VjK
	McP5yKvgCL12W7D2mKYVgW27jswxbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmV0J-00EDje-CH; Thu, 05 May 2022 06:30:23 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmV08-00EDh9-Ti; Thu, 05 May 2022 06:30:14 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7b815ac06so38291867b3.3; 
 Wed, 04 May 2022 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=hPg/kHUDyxMY3LkVNBXDy7g4FaARqDwC2Ys4u38uvGI=;
 b=Nm4Zz5nhKZ3HXeTj7BdPL1xu3o52ow/5uQwZaFOhdAcUzK/zag7Aj8mm1vQli0o6Iz
 Hz7QCpbrWBxWo7rRBSwjU+ykaehOWrLsjSWvwuds/xNLnzNXGJItRFHFduf70lsHimoZ
 khIrK/kIUZYwyRVDqVxtSYPVimSvCKKfA+YLSSn544yh/JR5TdSPCrxcathQbiwK3/hY
 DFbRmkUQGoV78dXRWs7ca+EtE0UW20+ThPogonlP/WVlAORWPAzV7E4DmVeAtxtcKAOj
 BiJ9kCIa4ltjnjRd+80t/lByJTNM68wldIpF9Y+Dcg8VC4TPC+cOsK3E6bz6hzRbwg7l
 2iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hPg/kHUDyxMY3LkVNBXDy7g4FaARqDwC2Ys4u38uvGI=;
 b=EKao0q+7jsDTljvfgSjoc+wvdjlwF9rz+lhtAbZOfgYSO835qbYzMjvD8CEZwqwNu0
 3ewujJdEo1WQKya69mjKM5s44J2q08QHkq5WKT5Ne6b8wVTqiJGYQq+RhuVOdfBqJzXI
 Xh9HUcgaqE7sv5UP+ePY3K52Fia8K1V82+QlWdk1B6LJv8tWuQi/T4bI+RiHrDIdjaCc
 mTY9GBSXlAVIZdv7jjDbeXjCShpAQ5gqIlFnGCCv3rs/5bwkUq2N6quBui3ARcEHALhN
 JP7bgcvLPimzpPV8KombKjjRzuCTK/VrXZoxOzwXLrkmxQaOhRf6SlAfni5D3OQpJ38h
 an+A==
X-Gm-Message-State: AOAM532AmwcXYOikX34wW3bTn8KJHnpOTh+qu6HnH0sw+PbwHLQs+4bS
 4rcRGqQSyZx2OpDLqI/kwqArOGN+KH7TRjS5//8=
X-Google-Smtp-Source: ABdhPJzfiMmMi8049ryLbdTumFiEB2azt22RyodOw27TSrh1paFQRoNHRdA9rucfDC/0WVdKgBLZtWA8bqBV8pDTstE=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr5212506ywh.384.1651732203173; Wed, 04
 May 2022 23:30:03 -0700 (PDT)
MIME-Version: 1.0
From: Gonsolo <gonsolo@gmail.com>
Date: Thu, 5 May 2022 08:29:52 +0200
Message-ID: <CANL0fFQRBZiVcEM0OOxkLqiAKf=rFssGetrwN6vWj5SsxX__mA@mail.gmail.com>
Subject: Suspend/resume error with AWUS036ACM
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_233012_987451_5EA24448 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi all.

After a resume I get the following error:

 +0,000007] UBSAN: invalid-load in
/build/linux-lowlatency-fSdu7c/linux-lowlatency-5.15.0/net/mac80211/status.c:1164:21
[  +0,000004] load of value 255 is not a valid value for type '_Bool'
[  +0,000004] CPU: 22 PID: 387 Comm: kworker/u256:5 Tainted: P
  OE     5.15.0-27-lowlatency #28-Ubuntu
[  +0,000004] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X399 Phantom Gaming 6, BIOS P1.31 01/14/2021
[  +0,000003] Workqueue: phy0 mt76x02_mac_work [mt76x02_lib]
[  +0,000014] Call Trace:
[  +0,000003]  <TASK>
[  +0,000003]  show_stack+0x52/0x58
[  +0,000006]  dump_stack_lvl+0x4a/0x5f
[  +0,000007]  dump_stack+0x10/0x12
[  +0,000003]  ubsan_epilogue+0x9/0x45
[  +0,000002]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
[  +0,000004]  ieee80211_tx_status_ext.cold+0x4e/0x5f [mac80211]
[  +0,000068]  mt76_tx_status_unlock+0x111/0x160 [mt76]
[  +0,000010]  mt76_tx_status_check+0x68/0x90 [mt76]
[  +0,000009]  mt76x02_mac_work+0x14b/0x240 [mt76x02_lib]
[  +0,000008]  process_one_work+0x222/0x3f0
[  +0,000006]  worker_thread+0x50/0x3f0
[  +0,000004]  ? process_one_work+0x3f0/0x3f0
[  +0,000004]  kthread+0x13b/0x160
[  +0,000003]  ? set_kthread_struct+0x50/0x50
[  +0,000004]  ret_from_fork+0x22/0x30
[  +0,000006]  </TASK>
[  +0,000001] ================================================================================

This is a stock Ubuntu Jammy lowlatency kernel (with Nvidia drivers).

I would be happy to provide all the needed information to resolve this.

I also want to note that the device is running quite unstable (lots of
deauthenticating, network lost, etc...).

Regards,
g

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
