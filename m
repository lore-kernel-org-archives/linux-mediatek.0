Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484E8C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 12:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACF1206F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 12:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZ2zfDyI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjjF3QGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ACF1206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2zXkQqN/2mDJrwFZ+pCNc2Kk0allsnMVz3lieLbUxE=; b=FZ2zfDyIM9It9C
	qIjRdyWwfX7Ni9e7yK23AWF2iDeLSkkd9z1RFpqvpnms4OKWPIPnJrv0/Npb+LZItwiI9XPYVETb7
	IWxSJkPIYj6wxynTXRtzPw1GTn50gEos53Qh74SUcLO/fs58e8vMOdFVmjj3zkQq1qLnRTrOgBCZk
	DN+JMYOh6aYOfLsem3KnVXYIJ7bvewGVTIBZd88ARYg7nqZymY43ogi9NFlccm+9dTvLr/ZsvSnyk
	ut5NP+q3JLX/JPcSyb25f1h8YU0lPN4MckEHKFKLNpriTdo6m0G07kVKM5iysBwcz2Amtu+GarWGb
	yzGs/A8PVJgdOPTqibFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY7E9-0006fi-6t; Mon, 11 May 2020 12:08:09 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7E1-0006Vb-9j
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 12:08:02 +0000
Received: by mail-ot1-x344.google.com with SMTP id 72so7335342otu.1
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=re50DF1Ln8r/SxBNgJA8/mMByt252ccww4yVo/OtRBE=;
 b=TjjF3QGq8GGb3yvxh2TsOm9R//KQdvTcHcWocnTc5BHzPlktYFsAjKwnTf25BwVX9O
 8+747k/1VHimYwVwq8fzTUtxouBvsbbOs8l6BJzFpJSZSBvI/joycP/+cKN3Ock8rzrg
 sOMpOa/ViYOIZFbgaCFqfb2XzyxHn0nMnULTCnNiOsbNkQZEZ0Zr1Dw1UU5pY1bXsThX
 tu9TPJyFNM/KxOnQBnWNlwdhLjqf8ejtOjy5Ovz6rPa6TidfVZNopRZGhl6JDm89ODy2
 FTVHmS85GKMRXkKcViWYrZCor1AKAit6hm5wj/2a5NCT0ops7Ne4wayjjMPBY5r+urp/
 5RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=re50DF1Ln8r/SxBNgJA8/mMByt252ccww4yVo/OtRBE=;
 b=j8mvOClVT0VN7+ltv8qdeYffIr4GGXLrk5SqGl8W1owyIPtFo5eJPekY+rzAakXsJ5
 NXoF9ZS2qbbPihPE1MP4S5EnJ0Hag8Fni0vOYL4bv+yhQvTrytl+sYx/x5V2mj++rPB4
 tfEIyJaKnXMxTFXz4I1oSAxpnblKpo+1+f2QfyKNioHdjwxvuGU00l4Km6rdbJzX4b+g
 b2LvRN9mzZku9NddwrCvsLmIHuiYBLopk8vVwn1KtAjX+HEgLAdTUwLR50UHqrY6C7xs
 O+eiyHOha/nTt09rlQjok2ynY/9FLpVHadT2PWWUFHIYJPtJ1EoJUjvE9Sz39CvsIlni
 PLAg==
X-Gm-Message-State: AGi0PuaaFT6jW6ju8JOEsIMpXE2nvgHYUpfjxfJSH02zeYY/QxZ3rVpV
 iSYOqwe72qr1JWo+1LLwMsUSw3pp62ornETEj50=
X-Google-Smtp-Source: APiQypJSQLRCHa48T1CmDhXjBOc7FejVPamQan1fa6beITQSeRFA5AsHIiJ/qno7F88plkuso8LUoREK+hetKx2fWvo=
X-Received: by 2002:a9d:66a:: with SMTP id 97mr11655721otn.181.1589198879861; 
 Mon, 11 May 2020 05:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200425120207.5400-1-dqfext@gmail.com>
 <CA+h21hpeJK8mHduKoWn5rbmz=BEz_6HQdz3Xf63NsXpZxsky0A@mail.gmail.com>
In-Reply-To: <CA+h21hpeJK8mHduKoWn5rbmz=BEz_6HQdz3Xf63NsXpZxsky0A@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 11 May 2020 20:07:48 +0800
Message-ID: <CAJsYDVJL-uGvfFpfvF9yC394PJZNdBJj=z_hctywn8DAT7ohmw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: fix roaming from DSA user
 ports
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_050801_380368_FD65B461 
X-CRM114-Status: GOOD (  19.04  )
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
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Paul Fertser <fercerpav@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stijn Segers <foss@volatilesystems.org>, Szabolcs Hubai <szab.hu@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, riddlariddla@hotmail.com,
 Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On Mon, May 4, 2020 at 6:23 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> I think enabling learning on the CPU port would fix the problem
> sometimes, but not always. (actually nothing can solve it always, see
> below)
> The switch learns the new route only if it receives any packets from
> the CPU port, with a SA equal to the station you're trying to reach.
> But what if the station is not sending any traffic at the moment,
> because it is simply waiting for connections to it first (just an
> example)?
> Unless there is any traffic already coming from the destination
> station too, your patch won't work.

This is just the limitation of connecting two bridges together.

> I am currently facing a similar situation with the ocelot/felix
> switches, but in that case, enabling SA learning on the CPU port is
> not possible.
> The way I dealt with it is by forcing a flush of the FDB entries on
> the port, in the following scenarios:
> - link goes down
> - port leaves its bridge
> So traffic towards a destination that has migrated away will
> temporarily be flooded again (towards the CPU port as well).

In previous discussion in thread:
"net: bridge: fix client roaming from DSA user port"
It's currently established that linux treats a DSA switch with
forwarding offload capability as its own bridge.

If the switch can't learn from cpu port, you either need
to propose a change of this already established behaviour
so that software bridge can sync its fdb with hardware
(making sw bridge and hardware switch behave as
one bridge instead of two) or write extra code to help
managing hardware fdb. (so that the switch matches
current behaviour.)

> There is still one case which isn't treated using this approach: when
> the station migrates away from a switch port that is not directly
> connected to this one. So no "link down" events would get generated in
> that case. We would still have to wait until the address expires in
> that case. I don't think that particular situation can be solved.
> My point is: if we agree that this is a larger problem, then DSA
> should have a .port_fdb_flush method and schedule a workqueue whenever
> necessary. Yes, it is a costly operation, but it will still probably
> take a lot less than the 300 seconds that the bridge configures for
> address ageing.

I think flushing fdb on port topology changes doesn't solve the
problem targeted by this patch.
Anyway, this mt7530 patch is proposed because current
mt7530 driver failed to match the established behaviour for
DSA/switchdev. I think it's better to start a new thread if
you'd like to propose these fundamental behaviour changes,
because this patch is already a result of previously proposed
behaviour changes being rejected.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
