Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C1DC44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=; b=Zll/HAcBrsryvRtuD1Id6nf0wh
	VMHLRjSXSnZGwbKNsEsb0HrVtN5DiefLwMhIUdP8FAFxRSzy547ozCDyYS6iAl4gMEgW7rUCPKhEZ
	KQqULidz+Y8q47X/S6eogmNoHdm/WtsbngsB8C5kX8GlDMBX2WCT9T6HCPAQue382N3N+7vO57FaS
	kYTqUHoce4aVnyXHj1gVjO/I+nGF1YxRwi8T0u2CsY+R5+jqbA9tczd9dKIycOdDIvGRAeRuGCIpY
	ROr4Wr5gIxk54XsiESA5Kc+x6TrqF3bIhqP08+SR2iOXKKw83tkQdMafP1EzEA1muxYJ6nW3D9fbF
	7t3xXRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkEB-00000001RFq-0eOe;
	Thu, 09 Jul 2026 08:35:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkE7-00000001RE4-1Eu1
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 08:35:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1924864a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783586122; x=1784190922; darn=lists.infradead.org;
        h=mime-version:content-type:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=;
        b=CJa14V1snqpxs0x+e5/fegMPyoB5dY/RfuyxBrv6RYx7b001mfDT1vIF1ecYSY8HOj
         IQqnCE1zswkf1B3UpEvPhhFHW3joA5SfHngmWcOadlYyxinsG80TBqyo4WBSO71HrXFG
         qpAIuzudy7K+eS05IlI5OTRUORboyVv4eoI8qlzDfo4z34hwXS2ViaO57oU0o0OlY8bG
         pW+f2mpmlJJnil6gCT9IBewNSi5zfPNQ7PA8xv1UEg7AmfkbBUORFNIfASEIq7R+6QMs
         +d6x1f/1g5lYPK22jV6/0hdtfgNJM4m08fdHCXrpBkby7eJx7dgP0v4gA7sPsVOwvLBz
         tZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586122; x=1784190922;
        h=mime-version:content-type:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=;
        b=mpGT46FeIzHIvsDNQnop6k+xrJhR5lniS2eNfQf1+h6wRRhyyIbq2xZ4cc0kJrtAYw
         izBQ/HlP7+KMMr/wdwJF9MURoNWtpY/okK1CVhpMsV8eKg00QqRHW47TSgqZRVMpsZip
         oMj1Zf1vApwnagv4a6Cn4kDqnKArswZTtgSD25csFXUMUuwsi4AzRrz2b1NjgO2e6VJ4
         +yTktXqKg6nhXNQXJaj8r3HLhBQOBzeMfFD9I1CyjWzWogQVP8ZBZ6PdN/C4ZEjvkCOk
         3NdtN1J9EGPuVVi/Sv+K7FJ+UKJy7LE3QFkFwwi0aNFX+d9yAnW7pSQa44RvQmzPnMyR
         m+3g==
X-Forwarded-Encrypted: i=1; AHgh+RoUyA501moKbOM5GU7PiWZZPin/y+3lj3k5HX8jw3BEd8oCEFDVVyhK0dGq+kQlLR5MBOxm7uR1bh8TqcvDwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj9BSWZxMUrb1LWHpDvZYRi0frG0smUjbCCaVsmHDfahmRvNUn
	0AEe1RFfRK8wdyZeqox8ny2i+SMEpD3NUwLPGsz1xLm0UzOTLrmdrTj+
X-Gm-Gg: AfdE7cm1I0CKx+HVgJaim8sTxtvNSswwSmsJBOm3CVF5LPHaoUKQ0X5Os4u5Mu0+Cj+
	gOYoLkH/2mIUgQBxCgOazlIw8OSDaQtlFyWVoc/1jhlHO+R/qsCcDN44iyChY3HYlOoFykztJd4
	w/r/4aLZN4k0xcvfCrHcrMNOueZSc+AKq5Dc7ag9EqhJ7NPSUGg+NA23XC63oZ1jzY8xMV5hFX8
	FsnEUaJt+XSNbOYzY5qzoABAkYgwZAlpleFXxVA9cnVglCW1eNrUHB4kWJPEJxjQRAWYLyGoqnh
	s0hYVBm4xkMlAHXROz0b0YmY2VcsidYOKNR9t+I2QOOGA2NKKkU9JfaP0DHW8j1jXbwC8j+s7hI
	51B/dWPmrJP11cRV7xQWIm+oIg/+2NVc8OMOVMpJnZOwxt/SdxY5zr5/ynF4eLeDv3R6ALgPjl4
	e+btBNig==
X-Received: by 2002:a17:90b:4a4f:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-389415edb6fmr6386335a91.10.1783586122340;
        Thu, 09 Jul 2026 01:35:22 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm811721a91.8.2026.07.09.01.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:35:22 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] ipv6: initialize ipcm6_cookie before parsing control messages
Date: Thu, 9 Jul 2026 16:32:30 +0800
Message-ID: <178358611790.128118.11036367713019213946@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013523_336891_CC7FF3AC 
X-CRM114-Status: UNSURE (   8.73  )
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

ip6_datagram_send_ctl() parses both SOL_IPV6 and SOL_SOCKET control
messages. For SOL_SOCKET messages it passes ipc6->sockc to
__sock_cmsg_send(), which updates fields such as tsflags with
read-modify-write operations.

The IPV6_2292PKTOPTIONS and flowlabel option paths only set ipc6.opt
before calling ip6_datagram_send_ctl(). If a SOL_SOCKET control message
such as SO_TIMESTAMPING_* or SCM_TS_OPT_ID is present, this can read
uninitialized sockc state.

Initialize the ipcm6_cookie with ipcm6_init_sk(), as the normal IPv6
sendmsg paths do, before overriding ->opt with the temporary option
buffer.

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 net/ipv6/ip6_flowlabel.c | 1 +
 net/ipv6/ipv6_sockglue.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index 1ab5ad0dcf24..5cbfb82710f4 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -405,6 +405,7 @@ fl_create(struct net *net, struct sock *sk, struct in6_flowlabel_req *freq,
 		msg.msg_control = (void *)(fl->opt+1);
 		memset(&flowi6, 0, sizeof(flowi6));
 
+		ipcm6_init_sk(&ipc6, sk);
 		ipc6.opt = fl->opt;
 		err = ip6_datagram_send_ctl(net, sk, &msg, &flowi6, &ipc6);
 		if (err)
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index b4c977434c2e..0dcd2c224014 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -839,6 +839,7 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		msg.msg_controllen = optlen;
 		msg.msg_control_is_user = false;
 		msg.msg_control = (void *)(opt+1);
+		ipcm6_init_sk(&ipc6, sk);
 		ipc6.opt = opt;
 
 		retv = ip6_datagram_send_ctl(net, sk, &msg, &fl6, &ipc6);
-- 
2.51.0



