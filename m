Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805B4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:24:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4825E60F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4825E60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ec07rx01alarMZV1jTOu23S2dnvVKaAdCdWY0WbrBeo=; b=gmJAdnvbqj7fGw
	G6liomFVYw6VJcpU4ln3Yn/M7jXnsvvTWEcG2Sw8rW53xzs/qLEySfZlYAUOhbX2239uzJzF6Rl1r
	2Ui943HmkHKRc4lDAAY7SK0hMVz/0L1elZj4KWPAGh8I7BQlO3U7YmKEkjOiqwRM/edJ1rrqMKz5Q
	MpPsi8hdaEfXBB/3xPKo/3rCxSgWVFXGHKuedwfuDd8fh08sN8YLSxGjpx9r3EAWqFfoeEaS3IkcB
	feGmD229AIRmmeLKR4uxtcIXTP4zd+iSlA4EAWiIHUkxqGmFfk6bGEki4pQFevlu7cKDVnh0sLYTx
	2Sz9m+qZ//+ehd2N3/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9VJ9-009U7H-Ro; Fri, 30 Jul 2021 16:24:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9VIv-009U2b-Ap; Fri, 30 Jul 2021 16:24:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id b7so13991863edu.3;
 Fri, 30 Jul 2021 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v5PtflUOMFCz8VFrpVreqK0QkFZ0DCmbVl+BetEIMLA=;
 b=cx88dZsM/gESTquoQdw282H1eLFTucH+6Tjr9ymA9x5y/o/3+r15SBQpKO+zilfmmP
 9dz9Bo2yeYbD+3gsxy8toxmJMuuD7qn43TiQ3r+xOk1IIdSoSByqPaoidcvoXhaeXT1F
 jUpSk7XB6yMSGVvefwl7HyDsRhl3FukxyR9ksZz7NEXyHW4FueOjd+SzGOEXpz/LxO8f
 NqE66HK4Ghkwlai7pVgn1Y+1Z758a1pj5+ee6M31K2Oo61DodXaUFKd4AjUuE3SQGd8I
 OObBXhXHluZbgtRyoek1h6MBnehYhKbnj9GeCAL9iDGHPLC3mkL++4juKnNGn5ORgIpX
 A5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v5PtflUOMFCz8VFrpVreqK0QkFZ0DCmbVl+BetEIMLA=;
 b=WXy1Yo34ICvOWdMxyOGXBKJjhIcve3FcGdlvh7S5AAHshv9bEuLtrohu6hz6dq2N+m
 M9IqM37hFhr59uv5/WUjgalxGALO5Z2M0Pj+c3oxZRmNPvsOxHt7An9+QsK5OhFP1JU0
 inGVj/yosEfWQXoctGXSV81BUAzZk9elsQtZ2psamD9bR5nhPEFZb9VGKWHBErI5pZVW
 BSaF5s+OJcVny4T+5EIq9DtGEl721+ulbJyzA+XMoVGtERRHbsMOJE9yKtRZ4RLA7n2D
 wzJXHe3rZQ2OMjtr0b0dhxTA2C9bgt8VGIAi14b7/je2IbLqVyzM++HKuDTdZHIFG+97
 dmgg==
X-Gm-Message-State: AOAM532sN0m1sL8VhqR0hIB+3pMmFYxw694kQPHO1qXWYsYbbnE0oxni
 ZRSePTeU104LNTHLFb3ef6c=
X-Google-Smtp-Source: ABdhPJweLORroV9hhMblkUOnSMbOxS8yH/JDLiFxs2LDuTbNnKpwpXAHnRkrTXKkthWxAW+5/EAUkw==
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr19553edt.286.1627662245837;
 Fri, 30 Jul 2021 09:24:05 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id gu2sm715595ejb.96.2021.07.30.09.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 09:24:05 -0700 (PDT)
Date: Fri, 30 Jul 2021 19:24:03 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Message-ID: <20210730162403.p2dnwvwwgsxttomg@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728183705.4gea64qlbe64kkpl@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_092409_423383_304F89F9 
X-CRM114-Status: GOOD (  12.36  )
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

On Wed, Jul 28, 2021 at 09:37:05PM +0300, Vladimir Oltean wrote:
> Otherwise this is as correct as can be without implementing TX
> forwarding offload for the bridge (which you've explained why it doesn't
> map 1:1 with what your hw can do). But just because a port is under a bridge
> doesn't mean that the only packets it sends belong to that bridge. Think
> AF_PACKET sockets, PTP etc. The bridge also has a no_linklocal_learn
> option that maybe should be taken into consideration for drivers that
> can do something meaningful about it. Anyway, food for thought.

Considering that you also have the option of setting
ds->assisted_learning_on_cpu_port = true and this will have less false
positives, what are the reasons why you did not choose that approach?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
