Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE130CD5BCF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I15Qye72rXnWF52br0qRQsOfcY4+owD8kwcdhmYsCXA=; b=J0Z3BxFSffZy0IAM2H5dsT3N0J
	hd/as9B+Pkl7ep4Ke9nXYw6Sv/LK8LbMymRsOGEo+1w3fm7KNPwb0zdACzEmfPyAmVVbpWcFLSAzf
	kvcWrIK1GRoeLn4iFiWPufm5hKMy82S6Az6U4pL6DycN+n2NdDPN8WtVe5jdV+2u1282rmtlRSom6
	pfqCpbms8bx3zrGB3fGPyskBSgciW1KR8yImwROfGepBWjwryMihUDuro0OT1lowdx8gxZqbBGQZ0
	URYH/QbvQYLYT8sagUWMQAz860BFzKppLUC9KCIKjO6XAtoYmjHbbrTff6pmGoTFLe00RKiuUd53Q
	yuLLU3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkrg-000000017YD-43EL;
	Tue, 26 May 2026 06:02:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkre-000000017X2-04D5
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 06:02:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so45072645e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2026 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779775323; x=1780380123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I15Qye72rXnWF52br0qRQsOfcY4+owD8kwcdhmYsCXA=;
        b=WHLZNc0O9INgem355s3GGvx0LwZ/MPE3asxOyyri7TVDTXpg5vwSDzSogGG0Ltkw5b
         FfxNer1VAHK85EwdyqInCyj/3GuwzaZBO29/t4GP/TZuG2hZnbja9RjJ5DtMqHWBm4LU
         PENwSzWXEZEvEmqIPGjeKrp/IQcFv0e8nwecVRXSni63Eappx/luiJXgDCaEQDCIoLMq
         J+q3VTIkOWwat/3IOC2k+6M0qLi5w50RdZuY2CPJjpauTNK6tNsUYoeapavsf7Oc3o4y
         fXbcB5YZo6k7Fmm7lwBcBazeLg6SwI9wp8/6uqJ9RcyJ1TJWtC55szYrK/0LRY81pvIE
         2YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779775323; x=1780380123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I15Qye72rXnWF52br0qRQsOfcY4+owD8kwcdhmYsCXA=;
        b=mK+iOUabW4ncgpe6Fy3xeR/BknQUzh4S1jUcvVULUyXD86kKlvVRVxYXDbP6OhhwXj
         ki+dQXFVUWdC+7JFWkEdQdK/tPu37WsS2cqkVBm5BMIylK8lF6tTdcCCBwaVwpzPQD6W
         WnJAcerce5+jMcuetDXVfQe8GukoxR0SsMNeLtfqQdKmysiR1jzjpTsl5O78Jxf05idI
         lpFYBTPVztcFN8/Q8up/AFEcFPE5j9IQCCBDqmJNGKzSkN+ikthN+DtQeMMGwWvzwE6q
         bcqmjvl/rRWlYUztjJ3tJ9W9Sr0rxjdTujzjKz7NcZfok4WQGny8074r1eH5W+F4pDbA
         VuZA==
X-Forwarded-Encrypted: i=1; AFNElJ+F0C51ipEPPE6FUw6aD+ZMLdMfkN790Cv8jqeni3GY/ffL4z0TP6xhSO43Y4aUeRJG8uxIEgeyA/q+FJ8u0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkI75JJos/Kg4oAJyYcGN3tHVGt+2qsj01KOLc32OYx//2Um3l
	PTsG/sEpWpOEWCa9ryi00lZBkMQ1abzmbTzY5oklBymmlmzjG38jgeMT
X-Gm-Gg: Acq92OFDLmQnFa3lPFl3vk52Zt89JNLvMmMbmTOv2ND0Yqx8ZgXuzh7VBwWIYAAnY6D
	toIFUxP8dfzH4k+laNbNCWzcbEgE+V+MU6ZhIhf24y5JZO/gzOilT5Phz7jEnVhjYWwtar9ppoT
	qbGmxXYajZmOfv8BF27idBxM2NiS6nB3KzN/2DSXmyWHTekzsMVnctub7OVDwfdQUgQdcHy/L9m
	o4UT+uT4o9aXHazYGT8fiB/mE75aHWQ3B5SgatDJWfEb6KXKDFp4Vf73gp17uX/QgQPPWOhXFDT
	zgRJPBWqiWEXoU8C5RJUlAZmsUQI8nnH6LTGv0qzTxBzKUjsVEiC0GOnSzBm8jSeu9/sUY/GPlU
	RvBED6rFVfGdHToMdWvunLkpDt6+LDlowqxUyVp6Dmj2bTLYG5S4dfpKIou1E/fXJCqNhhk0FSF
	nr1U30VEyCAv9Nhs0jQPNKoVbgR8W5Q9NlB3DmLaD9aOHzwETAfZTRAWWW9fzwVWUyDymnuXfT4
	OU03JY=
X-Received: by 2002:a05:600d:6447:10b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490426c5b1emr200251675e9.20.1779775322583;
        Mon, 25 May 2026 23:02:02 -0700 (PDT)
Received: from localhost.localdomain ([188.27.64.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454b7d57sm295929035e9.15.2026.05.25.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:02:01 -0700 (PDT)
From: Adrian Bente <adibente@gmail.com>
To: pablo@netfilter.org,
	kadlec@netfilter.org,
	fw@strlen.de,
	netfilter-devel@vger.kernel.org
Cc: phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	daniel@makrotopia.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Adrian Bente <adibente@gmail.com>
Subject: [RFC PATCH net] netfilter: flowtable: fix offloaded ct timeout never being extended
Date: Tue, 26 May 2026 09:01:38 +0300
Message-ID: <20260526060138.3924-1-adibente@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_230206_109101_CAEEDDF6 
X-CRM114-Status: GOOD (  10.69  )
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

OpenWrt has recently migrated many platforms to kernel 6.18. On the
MediaTek platform, which supports hardware network offloading, WiFi
connections accelerated via the WED path were observed to drop after
roughly 300 seconds.

After several debugging sessions, assisted by the Claude LLM, the
problem was narrowed down as follows:

nf_flow_table_extend_ct_timeout() extends ct->timeout for offloaded
flows using:

	cmpxchg(&ct->timeout, expires, new_timeout);

'expires' comes from nf_ct_expires(ct) and is a relative value, while
ct->timeout holds an absolute timestamp. The two are never equal, so
the cmpxchg always fails and the timeout is never extended.

This goes unnoticed for most flows, but a long-lived hardware (WED)
offloaded flow on MediaTek MT7986 eventually has ct->timeout decay to
zero, the conntrack entry is reaped and the connection breaks.

Compare against the current ct->timeout value instead.

This patch is sent as RFC: the diagnosis is verified on hardware and
the fix resolves the drop, but review of the chosen approach is
welcome.

Fixes: 03428ca5cee9 ("netfilter: conntrack: rework offload nf_conn timeout extension logic")
Signed-off-by: Adrian Bente <adibente@gmail.com>
---
 net/netfilter/nf_flow_table_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -541,8 +541,10 @@
 		 * after this -- is fine, datapath is authoritative.
 		 */
 		if (new_timeout) {
+			u32 old = READ_ONCE(ct->timeout);
+
 			new_timeout += nfct_time_stamp;
-			cmpxchg(&ct->timeout, expires, new_timeout);
+			cmpxchg(&ct->timeout, old, new_timeout);
 		}
 	}
 

-- 
2.46.0

