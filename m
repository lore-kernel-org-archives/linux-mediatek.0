Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1509C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 12:11:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416C5206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 12:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVrzFSdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416C5206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t5psw0DYiPDPzw5T403/FI3R1zWy1LD5HmbHzTw5Lic=; b=JVrzFSdvY73KyljEpLErOEDBMv
	jGFZkFA0Kyim+i3Ath0qRIrfazuMhFtHGD+jGdWH/n4m7qJ+F01vAtwpD8VxzLIZThhIGNYUojOWv
	6zUa0F3G871ivPL/9U0FJtU4993x4kE4Sd31iFdKSdKDrXmHjMBG/q5WUEgAtiuALO7A5KYUPD00S
	NX+pV2G/IDl7Mzg3z7uFk+kMPjmkjSctnDYqABwF4iw0Wo41mTLYUbeNI6EHG7GyMznFnS7vX56Tx
	B4AYoU9rNzzkhFrN8sHs8RL877ttyH0jTbxtGn44Vh63Nn1FCNlGYFqfvOhDQqHYYaZWJai/BOSsE
	7q8bvciw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPloH-0000Jf-K5; Tue, 06 Oct 2020 12:11:13 +0000
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPloE-0000HW-8o
 for linux-mediatek@lists.infradead.org; Tue, 06 Oct 2020 12:11:11 +0000
Received: by mail-io1-f77.google.com with SMTP id t187so6970474iof.22
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2020 05:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=EhCOsm/XwK9KhdukuQOyPPhHwiTYn0fSo6dMXBzIANg=;
 b=N2dSt2uOXjeM9B22NTBjZxxU7JfpMIByKQ1eiwp0vbCynjjCvzTz/b/7zUxtrn4XwM
 zU51l+dmHXUScThDd2fUH6U8RuLrXxrv6kDSfWs0Sh+zz2C7EaPggJy7p0yTnyr9sj+q
 meP84UUUdDgVvnxyFy7Tdq5nCRzLpm0RfNYDKPhQh9pI2amEIu0Vjtm4A+ZE4/Ik9kfb
 us00P5RZeEpKoOqFYgKgNH6h/+E7pTI8dgnlEuemv1Aob8N85vkw5yhisYQApBkupI8q
 uA3mM9NYsijfQ3drwUvPS8hs4djzrOvEL5kgHIQ/8JXZXRqd8XIqFKuoenzXkYIhtj4G
 OawQ==
X-Gm-Message-State: AOAM5331nA8nSENwNrL2CB3TPaJAEEE5dh2FIz3QGrHKOpcYy/vEu0c3
 LR696AGlbMSTxwx4tLtqydIM8QVe0tE1WjcBH4UxyKGKBtxX
X-Google-Smtp-Source: ABdhPJw+2KHWj8oxMC2Me2es2RQkss+2IPVOYHE5N1uYrNZ/tX99ER7MjGnPIDOC6uyhLER6SZk8Yb5UPmwHtKfBCzr0BFKu+SWq
MIME-Version: 1.0
X-Received: by 2002:a92:9fcc:: with SMTP id z73mr3339261ilk.234.1601986266354; 
 Tue, 06 Oct 2020 05:11:06 -0700 (PDT)
Date: Tue, 06 Oct 2020 05:11:06 -0700
In-Reply-To: <0000000000005f92b905b0fc1a5d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000575a2e05b0ff7e79@google.com>
Subject: Re: WARNING in ieee80211_check_rate_mask
From: syzbot <syzbot+be0e03ca215b06199629@syzkaller.appspotmail.com>
To: blogic@openwrt.org, clang-built-linux@googlegroups.com, 
 coreteam@netfilter.org, davem@davemloft.net, johannes@sipsolutions.net, 
 kaber@trash.net, kadlec@blackhole.kfki.hu, kuba@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 matthias.bgg@gmail.com, natechancellor@gmail.com, nbd@openwrt.org, 
 ndesaulniers@google.com, nelson.chang@mediatek.com, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_081110_396062_C712B693 
X-CRM114-Status: UNSURE (   4.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

syzbot has bisected this issue to:

commit 983e1a6c95abf8058d26149a928578b720c77bce
Author: Nelson Chang <nelson.chang@mediatek.com>
Date:   Thu Oct 6 11:44:02 2016 +0000

    net: ethernet: mediatek: get hw lro capability by the chip id instead of by the dtsi

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1639e0d0500000
start commit:   c2568c8c Merge branch 'net-Constify-struct-genl_small_ops'
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1539e0d0500000
console output: https://syzkaller.appspot.com/x/log.txt?x=1139e0d0500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1e6c5266df853ae
dashboard link: https://syzkaller.appspot.com/bug?extid=be0e03ca215b06199629
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1790e83b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111a5bc7900000

Reported-by: syzbot+be0e03ca215b06199629@syzkaller.appspotmail.com
Fixes: 983e1a6c95ab ("net: ethernet: mediatek: get hw lro capability by the chip id instead of by the dtsi")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
