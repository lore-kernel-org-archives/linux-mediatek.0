Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAhYjFDL0wWSxNYoZ1yOPnSsW/pFzrVL3tdYuEc130M=; b=RuZBCc5faCjA4C
	dLzpen73AH4xqc86F8rIlVQqnw6g+iuXGN9JlGxIKOKDudEbdbPMWgphk/mBmCmJzpkDxtf0069x3
	tNI+jtjIl7jHYKnb509rsy2ku6HpNBT0hMyYbec59FWTgoQHxWd3+gYdIdOOvAw+UWFOkPBZQFlff
	Q+eXdS8AHD7z35VgIDkkwWZobMA3KS5mPsicz9i75+x7L8hP7MnM/TIhOJMJ/rxMg77dadpmWyP2g
	gj/e3a3f3eJ3PSrZtlS/GLPHkRSqOpsCjUQmFYuJUBJ2dKOp9dl3halwydzwiZlh6pkcoUFTDlT7+
	K2igaj93+UPzyAqwKUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgr9-005lTr-4s; Thu, 03 Mar 2022 08:30:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgr5-005lSy-Hs; Thu, 03 Mar 2022 08:30:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id s11so4119993pfu.13;
 Thu, 03 Mar 2022 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
 b=R05ZV01Yp+GvJafCjJwp2DdNQL1X7N4+v2qDpWCUjxekJqjhV8nKttt+lgDdDv8VHZ
 pTpad4a62LLA8SjB/yHHEpNTxY0U28zfBa611uCN9ihzVETreTphlyPy+ETyTE4AgOSy
 RSp6pqcLA1mQfW+JjTEEtr3nMT+EN3gAPPB7pPpCIhAgeloFO+Vkph8Zctn11Qajj/U0
 QUVjSv6dTXzOO7akWefQCdrhFJznQKo01Wl+2crhxprXX9zSh/gHLWP/Xe3lMKAcW1nu
 BI3FrzUOW0QskfQ+hVH91vnr00ExY+gCD8VtMWG6RhFXS05x/6dGZMaR1NPNguf29zlo
 qAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
 b=ztIJFl1cYNgQuWL0b+c5GH9IvvdoeDbwcz7r15d9GpVOt4chv4DbNiaS/ZYiJG+pNh
 a85Q7SDecVYDE4QH3c8dz+6tHQ6RhP6k+M0VteLbPqN1etyY2fwL/BVAwskJtHBxR/e1
 90jk+U22fmUg9QnwiWJ7VmOgl3pOPKSwBk77MD8d5H+ZaSRuVpbjQy+WtpxoXZtuXWnk
 anlKY3ybEbqRmhu+OLq0lM4dkBZOvAX3G3+dgN0BgoJ7tKSJU7K1esAq0Rdb402sZX6o
 vm5W7GgPmOYoFroC9fJ9ai7OS1IDPoTxbaSMk2g6POAVl4TkXQZHImrVsQ5rAC/fUDTU
 wYZQ==
X-Gm-Message-State: AOAM532QqN+b/pfMeWjad403Vrd3rl0cUSBTVEpND34H41lEF8kMjq2B
 Nh2juSoTYbsCebhNVYKg5es=
X-Google-Smtp-Source: ABdhPJxl3tqNmXwEb6Rf4RyrJiQAiYb1f64m7AmzgvvLqhkGp3dQvJbj8a24YWybBg5gGNAc3KtcpA==
X-Received: by 2002:a63:8bca:0:b0:370:2717:3756 with SMTP id
 j193-20020a638bca000000b0037027173756mr29011952pge.604.1646296234811; 
 Thu, 03 Mar 2022 00:30:34 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm7342532pju.44.2022.03.03.00.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 00:30:34 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jakobkoschel@gmail.com
Cc: David.Laight@ACULAB.COM, akpm@linux-foundation.org,
 alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de,
 bcm-kernel-feedback-list@broadcom.com, bjohannesmeyer@gmail.com,
 c.giuffrida@vu.nl, christian.koenig@amd.com, christophe.jaillet@wanadoo.fr,
 dan.carpenter@oracle.com, dmaengine@vger.kernel.org,
 drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org,
 gustavo@embeddedor.com, h.j.bos@vu.nl, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, jgg@ziepe.ca, keescook@chromium.org,
 kgdb-bugreport@lists.sourceforge.net, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-block@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux@rasmusvillemoes.dk,
 linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, rppt@kernel.org,
 samba-technical@lists.samba.org, tglx@linutronix.de,
 tipc-discussion@lists.sourceforge.net, torvalds@linux-foundation.org,
 v9fs-developer@lists.sourceforge.net, xiam0nd.tong@gmail.com
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 16:30:07 +0800
Message-Id: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
References: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_003035_617206_6F97993D 
X-CRM114-Status: GOOD (  15.54  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> I think this would make sense, it would mean you only assign the containing
> element on valid elements.
>
> I was thinking something along the lines of:
>
> #define list_for_each_entry(pos, head, member)					\
>	for (struct list_head *list = head->next, typeof(pos) pos;	\
>	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
>	     list = list->next)
>
> Although the initialization block of the for loop is not valid C, I'm
> not sure there is any way to declare two variables of a different type
> in the initialization part of the loop.

It can be done using a *nested loop*, like this:

#define list_for_each_entry(pos, head, member)					\
	for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
	  for (typeof(pos) pos;	\
	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
	     list = list->next)

>
> I believe all this does is get rid of the &pos->member == (head) check
> to terminate the list.

Indeed, although the original way is harmless.

> It alone will not fix any of the other issues that using the iterator
> variable after the loop currently has.

Yes, but I stick with the list_for_each_entry_inside(pos, type, head, member)
way to make the iterator invisiable outside the loop (before and after the loop).
It is maintainable longer-term than "type(pos) pos" one and perfect.
see my explain:
https://lore.kernel.org/lkml/20220302093106.8402-1-xiam0nd.tong@gmail.com/
and list_for_each_entry_inside(pos, type, head, member) patch here:
https://lore.kernel.org/lkml/20220301075839.4156-3-xiam0nd.tong@gmail.com/

--
Xiaomeng Tong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
