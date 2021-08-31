Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755FBC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 00:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B65960FF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 00:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B65960FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilS33ieUHdQTqa+nLEeAxXaaEsMWiAWlqFwUeOeWaq8=; b=rlhlulSnHfdOVg
	7wORop5ysH81kPrkD/qL91Er5lAQA+vKEgpXl089sZTujZQk6YPQuOop2glbdNyyvTyjOnugS36Zj
	i19XcY+9JaP4mUmaGu4mZrzb6YgElHNL/J/hpqFdw4YbXNlvutsbPWUjS2N1fH+okyhjtuVs3OUTu
	iD8mCQsnMXWXndt5QS3XkaDfHBz/0JV0Q+kGxbUl3jntdeOinXSvyKqwYZk6rosxWu59cRpNp6i2m
	wArf3PYNFCA71svNWyK1XEN/27A6DBMUchnBuhI/Ynf3d9HHn1NBav9PQ0/fotjUISfGMn1gEyabP
	vBv70aYXkKtY25ghwaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKriv-000tX9-Lp; Tue, 31 Aug 2021 00:33:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKriq-000tVg-UQ
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 00:33:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so1168608pjq.1
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Aug 2021 17:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
 b=AzDcWKGtdHyMnoIEjzFPFQjRSRfN6cZcyUfqyg+1RFft/sQblgaz4y7UB0acXhUsAk
 aYq77Xwd7EMjSfEApWR3a558fJLQOEbjXYD1SI5rTv8NJMwK07Xba20kndQ9K5z7nQNv
 VqF6GPhvubvT3lLK/TsJYcG7uj5cuYcL5eVI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TjFdVibCziMMV625QJ8En+pQePJGwxqOLzHHo+cR/2g=;
 b=KmS3YScF1IX90zvW1vs3I9V5BEpPaYKsJolqpK4290IzUcdCQoYLSblJr/Dff96o+m
 acGcOYua+uDQSRwQOvNRgGS2TVDbSKvoRdGdAg1ly7ZDnmMDJ8H23KiYKlTuX4Bqqrak
 b1VzB+1SzHo9P3mbxoI4Bxaj+7CjXogYjiPMUyYxDiWjglilpxatsuYTUV+5DS8m5Ehf
 W5Ucce/qrBJjjh9peRsH/AfKCEzpP5mG9pesIemTTgy15xaB1LQWVsoYYyHc/g9w6xEu
 zo0B7WX9WERYo6koVx4sdLhhlZaYGoprjXKK4f6GGnZTRqWFDqr4mIazsfnj0zF5/ZOT
 gFag==
X-Gm-Message-State: AOAM533Xia+gh9az/ESS71iqEl7kNJeaZpGZ+jeqfxGmkLDRXguKFL9h
 /DfZN5OEXdxTgCYEy455Y/ezjw==
X-Google-Smtp-Source: ABdhPJxdbxW4ryHv5bhuf8dsnrqkWswjsDidSV0lyn6xogTwXPWUAw0uITGdywWoWH5lbvCpqEzDjw==
X-Received: by 2002:a17:90a:bc47:: with SMTP id
 t7mr2025742pjv.19.1630370030908; 
 Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:69ed:b45b:ceb5:e18b])
 by smtp.gmail.com with ESMTPSA id q12sm15915318pfj.153.2021.08.30.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 17:33:50 -0700 (PDT)
Date: Tue, 31 Aug 2021 09:33:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Chengyang Fan <cy.fan@huawei.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, kgdb-bugreport@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>, Cengiz Can <cengiz@kernel.wtf>,
 Jiri Slaby <jirislaby@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Wang Qing <wangqing@vivo.com>, Andrij Abyzov <aabyzov@slb.com>,
 Johan Hovold <johan@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>,
 Claire Chang <tientzu@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH printk v1 00/10] printk: introduce atomic consoles and
 sync mode
Message-ID: <YS144PMiCJnmoKE4@google.com>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <YQwHwT2wYM1dJfVk@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQwHwT2wYM1dJfVk@alley>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_173353_013902_9EFA05A9 
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

On (21/08/05 17:47), Petr Mladek wrote:
[..]
> 3. After introducing console kthread(s):
> 
> 	int printk(...)
> 	{
> 		vprintk_store();
> 		wake_consoles_via_irqwork();
> 	}
> 
> 	+ in panic:
> 
> 	    + with atomic console like after this patchset?
> 	    + without atomic consoles?
> 
> 	+ during early boot?

I guess I'd also add netconsole to the list.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
