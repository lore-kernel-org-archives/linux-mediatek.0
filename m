Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D15C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D797520787
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grL+ADu2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LK6H2vBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D797520787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBZB485cjs1n7fu6JXhw/WWcNwUO7f5rkMuNHfn+sdk=; b=grL+ADu2cEfOxX
	wJ2BM4WhmY9Q6JLSt6bS1ElkYX1MNkCeyryedGom0aHVjOnAHXeLs6vsd6i1zkaVwjqhHWq0rPIGK
	5p1UxrFVQdCJdW0vwLdxBtRLZDEmQcnvQ/lLZQtV/jsE6GCDF7AxQg6kdXRXizmKrM/XCa29y6RCi
	FHwWSF0QrbLZ1H/cZliu8rCdrbSqHVgMAho7/etMKu7DRbCHvYk1S5OVZdXtaY+wK1wr5GAPu/48Q
	YfncQntf+qeeNtKMGPwAfMzbc5+aHd2QL+mMzrUfXZ215TKxB3YVvzRd+fESwln7JUHGp9wJuX/IE
	lT6zl8aIRd/TzJfet1KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMrBf-0003cx-Fa; Fri, 10 Apr 2020 10:47:03 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMrBa-0003cY-FH
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 10:46:59 +0000
Received: by mail-ed1-x541.google.com with SMTP id e5so1978109edq.5
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2020 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5flDUCc5onn9My7LelOLYfg2sqbcsix70bfOQElCCY=;
 b=LK6H2vBs6EQoG8NxAHZXSN3WdX62sel9kYe6pWy8NYbKrN1wiwHV9n+fjzvFa2EVZC
 dKbcgiPgKifg/BOlyN/6G7Jqsdn3vCsorcbrjgyyYnyCVD0hDygDReY7BLMzhxWNQheV
 uYgpVnPxlUt38uU7itLT9TjuZLrJLfru6aJW2+r7mmfUexxsfFJAWDoKYF8agmqq1McO
 867t+FCK+ReI5oR8HEA0VwC3dfkdIXdq++toJj3LOWKeqx08BLwj/6yk1/0uJ3vaKR6s
 t4+i06Mp1jQj9bQurc4I2/9jPBsYw4iOBeLw7mrzjZH24jOAaXYaH//Oo7Wu+vrHGVMr
 B/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5flDUCc5onn9My7LelOLYfg2sqbcsix70bfOQElCCY=;
 b=F5seAwNOTJhXgR+/lrhgt9NWz8NJwk7YYz76brsr+1PQoeHGj44Xc1yMSziiWsw3LB
 t+B4jHEtA4P+sYp5V6WMLKNQfUQh2q9T2jh3HxYrpuYJUcKki9E45rKMmbprYUQrNgi0
 wM8Jit6wgPspgFvQti8dkdyN2QD+BR09fZ/HpR7b/hdoAZ8QlInHu7mIJBw2gj2+9kKn
 c4ZZiDdMwbAreMq4mMmOSQWEryQ/1KmEQkG74O169O69XyilA1JgYUlPFV7pQkCcmlpb
 NRPmbKKWil92tZLt3fzWUZnomE0Gi1caPQcnYveRBIWHu1K/KiE+RVOdg39rT+9DwicX
 T6jA==
X-Gm-Message-State: AGi0PuYw6tzjCqIrD+8DNOEB+drSiFGRaL8OogOTsWLGtDfTN4rrDoDC
 UELjsNXuqUeCbGB2Y7YpdjyemqXOiD3iRo7c2CI=
X-Google-Smtp-Source: APiQypLWDup2ZAK1S2IcOH0WTMLGSA4ZLAFWbXTDZbsNxTCSZqYmA8hnd16Tb6LpFY9BEm/k8vKrPTA2QvI3BAsREUA=
X-Received: by 2002:a50:9ea1:: with SMTP id a30mr4246217edf.318.1586515616603; 
 Fri, 10 Apr 2020 03:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200409155409.12043-1-dqfext@gmail.com>
 <20200409.102035.13094168508101122.davem@davemloft.net>
 <CALW65jbrg1doaRBPdGQkQ-PG6dnh_L4va7RxcMxyKKMqasN7bQ@mail.gmail.com>
 <c7da2de5-5e25-6284-0b35-fd2dbceb9c4f@gmail.com>
 <CALW65jZAdFFNfGioAFWPwYN+F4baL0Z-+FX_pAte97uxNK3T6g@mail.gmail.com>
In-Reply-To: <CALW65jZAdFFNfGioAFWPwYN+F4baL0Z-+FX_pAte97uxNK3T6g@mail.gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 10 Apr 2020 13:46:45 +0300
Message-ID: <CA+h21hp8LueSfh+Z8f0-Y7dTPB50d+3E3K9n6R5MwNzA3Dh1Lw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: enable jumbo frame
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_034658_545378_5FF8B5B9 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Qingfang,

On Fri, 10 Apr 2020 at 05:51, DENG Qingfang <dqfext@gmail.com> wrote:
>
> On Fri, Apr 10, 2020 at 10:27 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> >
> >
> > On 4/9/2020 7:19 PM, DENG Qingfang wrote:
> > > So, since nothing else uses the mt7530_set_jumbo function, should I
> > > remove the function and just add a single rmw to mt7530_setup?
> >
> > (please do not top-post on netdev)
> >
> > There is a proper way to support the MTU configuration for DSA switch
> > drivers which is:
> >
> >         /*
> >          * MTU change functionality. Switches can also adjust their MRU
> > through
> >          * this method. By MTU, one understands the SDU (L2 payload) length.
> >          * If the switch needs to account for the DSA tag on the CPU
> > port, this
> >          * method needs to to do so privately.
> >          */
> >         int     (*port_change_mtu)(struct dsa_switch *ds, int port,
> >                                    int new_mtu);
> >         int     (*port_max_mtu)(struct dsa_switch *ds, int port);
>
> MT7530 does not support configuring jumbo frame per-port
> The register affects globally
>
> >
> > --
> > Florian

This is a bit more tricky, but I think you can still deal with it
using the port_change_mtu functionality. Basically it is only a
problem when the other ports are standalone - otherwise the
dsa_bridge_mtu_normalization function should kick in.
So if you implement port_change_mtu, you should do something along the lines of:

for (i = 0; i < MT7530_NUM_PORTS; i++) {
    struct net_device *slave;

    if (!dsa_is_user_port(ds, i))
        continue;

    slave = ds->ports[i].slave;

    slave->mtu = new_mtu;
}

to update the MTU known by the stack for all net devices.

Hope this helps,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
