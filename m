Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B96C3276C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 00:20:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B5A21D56
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 00:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/wy6ne5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Be1Z4lKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B5A21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhWD+pFewVkzzUNWV0JulKEWd06EZwf0zUabGeoVezQ=; b=k/wy6ne5NjpPph
	zC4n9zjg01XafUid0w5eXOM1knTPlR7NVhJi66NmTM/OqETMcF2fR2pW8qJ/OXaFfQrtuxGvESrMb
	+L9MA6XPlKUEvRYW1xG5idSF6SK4wtEaPhp2UDAodLWIcr8IxyLTstY3oA59NEj83bjh7iARdOiuE
	V4Bb6rTWMmT7RLIZ4zfTPcLguHGZleyllMfCN8VZ5mJOAvaFjXnWK8zo2EfoSqFM/u7usVj5bHRoE
	5oxb+8S/QEi0b/1XEp8LnUFO05gLQUYZEV/DhwN3SSUIhvsELgVcUfQtQt4qRwsbvwYB7D2WfEy2d
	EjuvCjSP6Jn0lVZCD6Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inAhO-0007Yu-Qt; Fri, 03 Jan 2020 00:20:18 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inAhI-0007Sz-CX; Fri, 03 Jan 2020 00:20:13 +0000
Received: by mail-ed1-x542.google.com with SMTP id i16so40457254edr.5;
 Thu, 02 Jan 2020 16:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FV5X7fA+rrUeDnXZ5UiKMokLx1xAJtoG3k2CK746+60=;
 b=Be1Z4lKrrI8RtYjq/BzQfrsrCUA2UJPv3VAYzJae/rKQQP4Mi+149d9Yfc4ozDEFnb
 Zk8lQf019qLG1AXIqKFCL0h84IaKBpxEFDMdoLOB+KtZC8hcNg27wvwd6H4boJJUuVwJ
 p06otaRRzArTVUjHQB80gpgk9NqfS8sn9WrJAqlGRZfRnzhgjHXsl7WH3TgmsjC/loS1
 WRQE2gex7s4Z0hTVMOgYJMHsXVl8HfZzqMX1Q2JPYaM7L2pP6Y2M6SBICtxchYmXn7v0
 NkvIFR+5N8zDAC+NT1XtLku0AXonKX+rgIRYheh7gNXyQhAamyBQvq1W0yyYgo68zdd6
 nSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FV5X7fA+rrUeDnXZ5UiKMokLx1xAJtoG3k2CK746+60=;
 b=AdnlzNj2my0IBh4I5WIHDjJ/37vpAAD/+DIPeOSsZLtL443PzSJeazZ6opjMiFqd1D
 YaOFJNCCQ/2CgrN7Fyp+pgjwSv/1qNvke5Qe2lTUdL3rsoeZ0iTfOWmhUgvHQuTag39g
 VC7pQvmvz3GedCCsqiRaNFVWRkUvIqaPP3+kZ3PzBJ1ALDhRrKTQaPwWotWinNka3qxO
 28uChBPMUU1JS8UgRTBzUAAJkbmyQpvzsiWOhFJNxQUp667NZEpjnxKnO8+IB/CaR7x0
 s+yufcicaMe7jw0Rhx5ICfZ3NFn9PZLgqiAvc3idHm+MEZIrPldUns87CHNQN3boR7Xu
 uywA==
X-Gm-Message-State: APjAAAWHFyK2KnLUm7PPTHXkanDevWutxsgxVU6L59rfCCytzrFr2+tq
 D/57mIsXHzfvdyEfdTgFf2W/jBIPXSmsoQzcdOg=
X-Google-Smtp-Source: APXvYqyneY6vp7MndZY2IHVlAnYW2Ny5AcY4pl2xKrupts1lB1ozOUhHi1uWOz20Rt6s9+dkTrmWhTv4viThJydhKuA=
X-Received: by 2002:aa7:d34d:: with SMTP id m13mr89428224edr.140.1578010809821; 
 Thu, 02 Jan 2020 16:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20200102233657.12933-1-f.fainelli@gmail.com>
In-Reply-To: <20200102233657.12933-1-f.fainelli@gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 3 Jan 2020 02:19:58 +0200
Message-ID: <CA+h21hrLO2Nfryu74Joj-T3-ithgoSFOQZsw4Z5QWOnhttvGiA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: Remove indirect function call for flow
 dissection
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_162012_454209_1AAE5864 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexander Lobakin <alobakin@dlink.ru>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, Matteo Croce <mcroce@redhat.com>,
 Petar Penkov <ppenkov@google.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Paul Blakey <paulb@mellanox.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Florian,

On Fri, 3 Jan 2020 at 01:39, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> We only need "static" information to be given for DSA flow dissection,
> so replace the expensive call to .flow_dissect() with an integer giving
> us the offset into the packet array of bytes that we must de-reference

packet array? packed array?

> to obtain the protocol number. The overhead was alreayd available from

already

> the dsa_device_ops structure so use that directly.
>
> The presence of a flow_dissect callback used to indicate that the DSA
> tagger supported returning that information,we now encode this with a
> proto_off value of DSA_PROTO_OFF_UNPSEC if the tagger does not support

UNSPEC

> providing that information yet.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Unfortunately I don't really understand the DSA implementations of flow_dissect.
Is proto_off supposed to mean "the __be16 pointer difference A - B
between A. the position of the real EtherType and B. the current
skb->data (aka ETH_HLEN bytes into the frame, aka 2 bytes after the
normal EtherType was supposed to be)"?
Otherwise said, the offset in bytes between the real EtherType
position and skb->data is 2 * (proto_off + 1).
Furthermore, the offset in bytes is exactly equal to the tagger
overhead in bytes, unless it's a tag that doesn't push the EtherType
to the right, such as the trailer tag.

If the above is indeed correct, can you just skip DSA_PROTO_OFF_UNSPEC
and add proper proto_off values "in blind" for all taggers? I think
it's rather safe to assume that they all push the EtherType to the
right with the exception of the trailer tag, which will have an offset
of -1 in terms of __be16 pointers, by the way (so your -1 encoding of
DSA_PROTO_OFF_UNSPEC won't work for it anyway).

Also, documenting the unit of measurement for proto_off would really
go a long way.

What is a good test that the flow_dissector does what it's supposed to
do with DSA?

Regards,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
