Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E7C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149A260F6D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 149A260F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmlWN3SyFeCDhpBcJdH3yeneYJTpZ4cVILVmIyVJJng=; b=UnR6ehxjIuCCwy
	gYhABwHClP9nh0BOfECXU2jckPTAAtrZSRYmRgkT6EFlzQ2Fq/KrrTQQeikMw/OjS+V2P9V8pUuBS
	iIIohBviE6k+/e4pwzJDcbFHRfiAskIbhX/tzpx3J8VGe6JGGkn71xSmMnJGc5Sh/vpSjMrvIg7jD
	T034kd99/jStts1JEmxPv6mJ2XazXETLJG1FrUNbUnb7XueUFBoMekkp1r7sDjvV2qnnWy/6b1/aB
	6jYtW4BKaWBWDrYUK6JJWsfhJE8oHhEBeU+l7q4fQe4HhF9rqkgcwCbp07tn3pSTZhGD0SCXseEIM
	3P2ej4hyd4VJscf53lMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAXfQ-00GJ82-To; Mon, 02 Aug 2021 13:07:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAXfD-00GJ5d-Hj; Mon, 02 Aug 2021 13:07:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id v20so10351355eda.1;
 Mon, 02 Aug 2021 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+SZbqu2OmCriIcHluisGz9iJ+oJzkAqrwEFMwLWTqRc=;
 b=E48DER1OVUNlNN3AbK4cr/kyuJ+wfrZG9rqkLywltAeZxLroU/5TeEUkLEu96fsr1m
 oVGOmUS/SyZ18O20SPsgHEmuAxgyiHgAZuHEYbYwLNvSkjctNp7iqBk5VYhOxw7iDMtc
 OLh3jYO6kwmAd3gKoOVx1ORY5YPWE/23AtjHWFn1H+7dW6vntL2CIy2osXyKZW5f8QUF
 uc/gD3kx+rS0jAWqGRYV6EGlM/es/kB19OSorwE9E2JtyXs1OKV4U332y2EnsU2ryq1v
 I2fe512h1Sf6SVpXZ+T042Ae7py3SHuCdN9CBpj5KDWnOHjMuarnQy1O0EbtC4knR07P
 BVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+SZbqu2OmCriIcHluisGz9iJ+oJzkAqrwEFMwLWTqRc=;
 b=VTPkuMgkv3/lKTHMcOs2Pk5C4zRVJOa+bCHdfo+srpS5fopW6t6RxJzrEERmu+UtsZ
 I8MD0Ai5Gv1XtsK2Axnq+wTcPp8m3KqKNso5DAWFO0TsXU+twRSRTvHmxBDtSPvntslL
 XRxRcsyXG8y04Vo2ujXAi10F7CYzy79bkH/IJPFSFqxFtEtV6I1Q6WUIFLTgtlgSh0fe
 UlcVZb0Qi7lyeo+xRGrNgZZwZTsTOebxzoaQL/L+hONmhoBRBhTS3mxsf9IeJEI9olmh
 wOVXDWTzhUTTAcsiltJaOReMg3spgXJGNSDbzxrUmcbvIIUIP19gHlv1/tDU+9KcpE6X
 114w==
X-Gm-Message-State: AOAM532yCBVGy7lu+6LuY+D8eRwdP6VOEttuMX5FgQFzKc1qmDOggAK+
 gw/js1SGodtz9F1rgtUmm1M=
X-Google-Smtp-Source: ABdhPJwDkLl+kIN1bl2f4Yw908yzO51fxWKV8HGdwOTC8AgxomlATrgugCeUjm/XBi03A5mFYLG+eA==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr19096988edq.170.1627909645224; 
 Mon, 02 Aug 2021 06:07:25 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id o3sm5969539edt.61.2021.08.02.06.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:07:24 -0700 (PDT)
Date: Mon, 2 Aug 2021 16:07:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 1/4] net: dsa: mt7530: enable assisted learning
 on CPU port
Message-ID: <20210802130723.6tieexl5zcxu44xr@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731191023.1329446-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_060727_629870_42EE88F3 
X-CRM114-Status: GOOD (  16.95  )
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

On Sun, Aug 01, 2021 at 03:10:19AM +0800, DENG Qingfang wrote:
> Consider the following bridge configuration, where bond0 is not
> offloaded:
> 
>          +-- br0 --+
>         / /   |     \
>        / /    |      \
>       /  |    |     bond0
>      /   |    |     /   \
>    swp0 swp1 swp2 swp3 swp4
>      .        .       .
>      .        .       .
>      A        B       C
> 
> Address learning is enabled on offloaded ports (swp0~2) and the CPU
> port, so when client A sends a packet to C, the following will happen:
> 
> 1. The switch learns that client A can be reached at swp0.
> 2. The switch probably already knows that client C can be reached at the
>    CPU port, so it forwards the packet to the CPU.
> 3. The bridge core knows client C can be reached at bond0, so it
>    forwards the packet back to the switch.
> 4. The switch learns that client A can be reached at the CPU port.
> 5. The switch forwards the packet to either swp3 or swp4, according to
>    the packet's tag.
> 
> That makes client A's MAC address flap between swp0 and the CPU port. If
> client B sends a packet to A, it is possible that the packet is
> forwarded to the CPU. With offload_fwd_mark = 1, the bridge core won't
> forward it back to the switch, resulting in packet loss.
> 
> As we have the assisted_learning_on_cpu_port in DSA core now, enable
> that and disable hardware learning on the CPU port.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <oltean@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
