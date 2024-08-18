Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5F1C52D7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xOn7k/gf92spm8LI+iLgdIYChmze6niofBQwCBXRuGE=; b=CSqQk/F1mzNkZk
	3gfqf3z5dSKhqAAF30EBKCEMNl+NYknkcgwej3tyRwoidKanAy5f8dV/LIlYXoY5CnDuZAsAjvY0u
	WSsFg3DsEFBzuhJ2glEmBOO7bZ9gINhIu1yJyrmIUOf1jA6z/OwgkrEyEuLEFMrifAO7IcZ3UZBaR
	o5ICZ7nH8oDy+2Zdt023qj8tKtb5ZeBOXSsfWXrAvrTDniJNxx44ercsZT/eY/bTXVC5c5DVQlqRh
	FjU8l6MaU+6XI6cw2RVT/mXbUJk2UwuH5VDO4svVd1C9QrmEOyzDBookXS0ygl4c2vLqZB1IbRqfk
	VcM3ChHWhGVadfyjj8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sflRP-0000000H77F-3Yyt;
	Sun, 18 Aug 2024 19:19:51 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sflQd-0000000H6uI-42qx
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 19:19:05 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39d10b6da2dso36223485ab.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 12:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724008742; x=1724613542;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOn7k/gf92spm8LI+iLgdIYChmze6niofBQwCBXRuGE=;
        b=C7h9l54taOjOddIIdpSFR+LSwL4DBaKONviCpRGRZjY//E4QkBIYEWjBlEQAhTZo+A
         VuEMf+WzdESzK0lNhVXbl6t+XaMxBc6mYK9fgevwgunqTAEtQUFhKMPeirSWMhno5MP3
         BOa7yVoGHsRbi5zzYsnho6ltlv51vmEVZCJYkn2zt1tXEAK+bBBD3osRalZ6DzkzaFvI
         eF46ERE6rh0cASpZgDSUs9cipRF3jWsUsU6Y44MK49VyA/hI5K/iGyP5ks/UCDEu9Gno
         DCw2TR0RLvHbgnWxEkM+asVInlYKAPRDHjmGRVISGn/kUOi3LBZs0Jwb9F2H+pwUI1GS
         TUqw==
X-Forwarded-Encrypted: i=1; AJvYcCVPN0b1+ivkExj/9ERt0/SvmAbZRVjSevr6vcRSLn7H4NdbDj5JIj+2NreDT5ZPUw7fqiezyio74G4cKByPGhraQzqfCk085MsEvkqRbE5Ii7Xb
X-Gm-Message-State: AOJu0Yz+V9FH6Cl3OFnol6ICieOfg/K7BjQ1aOH0AQOOuIgZuKe+2Ls7
	Qmiik/APB9cbkOx8uR4tDd1xx7w1lgDpdqgwB1p3wCcW4LlKOHvPTGNWE/q1KpmCasN/kJdsNqh
	wWh/EcNZakAmdENtUhoy8a4zWTPkkFGFdYqHeKEW6BQAJU0zyLwGrigY=
X-Google-Smtp-Source: AGHT+IEet1fM8+b3ovFLzqGlZdbvkZDwMB2WRcSgR9DQgyJRsVgqllfm0eD++outR/I0JQiH4ZYqp+gTlF5cvJ7CXE5gZrbqTXyY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170e:b0:39a:eb4d:23c5 with SMTP id
 e9e14a558f8ab-39d26c36cfamr8712765ab.0.1724008742349; Sun, 18 Aug 2024
 12:19:02 -0700 (PDT)
Date: Sun, 18 Aug 2024 12:19:02 -0700
In-Reply-To: <000000000000612f290618eee3e5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ad7bab061ffa109d@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in cfg80211_bss_color_notify
From: syzbot <syzbot+d073f255508305ccb3fd@syzkaller.appspotmail.com>
To: angelogioacchino.delregno@collabora.com, davem@davemloft.net, 
	edumazet@google.com, johannes.berg@intel.com, johannes@sipsolutions.net, 
	kuba@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, matthias.bgg@gmail.com, 
	michael-cy.lee@mediatek.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_121904_025086_81A0B809 
X-CRM114-Status: UNSURE (   3.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

syzbot suspects this issue was fixed by commit:

commit 4044b23781104801f70c4a4ec3ca090730a161c5
Author: Michael-CY Lee <michael-cy.lee@mediatek.com>
Date:   Fri Jul 5 07:43:46 2024 +0000

    wifi: mac80211: do not check BSS color collision in certain cases

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=130f62dd980000
start commit:   f6f25eebe05f Merge branch 'wangxun-fixes'
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=bddb81daac38d475
dashboard link: https://syzkaller.appspot.com/bug?extid=d073f255508305ccb3fd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f9ec92980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1595fa84980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: wifi: mac80211: do not check BSS color collision in certain cases

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

