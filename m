Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD047C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 22:25:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCF120848
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 22:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SfiwT7s9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCF120848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8Q6z5q1w+oTw/iJLewomX9oZSwHTLspdCjoNM482Pw=; b=SfiwT7s9RL1wc5
	uMHHb3T9no9TAHba5S388vjx3QgzLvF6m13K9FxQAKxLQqpGCDGQje2tXWOFCUBhxkWXJjKui6gsq
	B/SMReLVyLHosn+od9cNkEvEQ19Cn4I76HTnAyj0zlKxfc8BjWTpCh0L8atQ5jb+dDCbuG7LhMs6q
	r+f4bD8DhXJmxs5cfc1b+POTR37pZiMbMj4Q52CyqxZges1xxMsgeHeFfBgC0I8+vuEPfaSJyvxBA
	BLYdEP39IGexHDqC0ipg6IjNYXpbAl02hqDyXU4dSkjdsdLh+tyEhGcnNcxF0KnODYvD0rYZBqfKn
	r2VCIuGCgVQDG3jdo4Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioEL8-0004D1-NM; Sun, 05 Jan 2020 22:25:42 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioEL0-00045j-V5; Sun, 05 Jan 2020 22:25:36 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BE89C1573FC06;
 Sun,  5 Jan 2020 14:25:31 -0800 (PST)
Date: Sun, 05 Jan 2020 14:25:31 -0800 (PST)
Message-Id: <20200105.142531.1912385676087452153.davem@davemloft.net>
To: f.fainelli@gmail.com
Subject: Re: [PATCH net-next] net: dsa: Remove indirect function call for
 flow dissection
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200102233657.12933-1-f.fainelli@gmail.com>
References: <20200102233657.12933-1-f.fainelli@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 05 Jan 2020 14:25:32 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_142535_001212_E0D8D684 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: andrew@lunn.ch, songliubraving@fb.com, vladimir.oltean@nxp.com,
 alobakin@dlink.ru, komachi.yoshiki@gmail.com, paulb@mellanox.com,
 edumazet@google.com, sdf@google.com, mcroce@redhat.com, ppenkov@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, vivien.didelot@gmail.com,
 woojung.huh@microchip.com, hauke@hauke-m.de, sean.wang@mediatek.com,
 claudiu.manoil@nxp.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu,  2 Jan 2020 15:36:53 -0800

> We only need "static" information to be given for DSA flow dissection,
> so replace the expensive call to .flow_dissect() with an integer giving
> us the offset into the packet array of bytes that we must de-reference
> to obtain the protocol number. The overhead was alreayd available from
> the dsa_device_ops structure so use that directly.
> 
> The presence of a flow_dissect callback used to indicate that the DSA
> tagger supported returning that information,we now encode this with a
> proto_off value of DSA_PROTO_OFF_UNPSEC if the tagger does not support
> providing that information yet.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes since RFC:
> 
> - use a constant instead of the "magic" -1
> - update all tag drivers and build test correctly

At the very least the typos need to be fixed, so marking this changes
requested in patchwork just FYI...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
