Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBF3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 21:16:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C86D64F26
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 21:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C86D64F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bzF1H6XZy5NP8bIlDjy12U2Hv0uLcJOVsTxNmOmIyYQ=; b=TQ2xacxN1UoKiRJYZ9SGey8NM
	VGYbiFljiaFXYaIxQaIVMXw9bCb0VSH5yLKw7CowOeBWXzmoj067UTBruOUKMCQmbFtaMs9Rxy9lN
	6nbYjUUoVQOSWm3c3RXtRcbKy3rhzFgfxtGayXdbqrX8I/JN644lMVV7PqRstzZGPMiIeV8RzVOG7
	Ii35pNqSIfOTldTf92FVvUfQAuxNKdFgDLDQkqKye3tggRBkUNH5sVzm7mHYNzV9pIdtIHRsQ2XiT
	kppAeO5VMw5GHnJkQr/5+lsBUWPF1hrh+8XUenfooHaJWHldD5dxIkgZyroYyj5XZJHOPJapcqY7o
	m/Y35H94g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLuZH-00GuzY-7o; Mon, 15 Mar 2021 21:16:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLuYy-00Guwj-C7; Mon, 15 Mar 2021 21:15:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id dm8so19045612edb.2;
 Mon, 15 Mar 2021 14:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qwnbwanU2MY7jCvFVBwRSp3WXlaw+EiV14zRrhqaSu0=;
 b=Lt+eVhbnXOgmfLt8THwaBgDraGpxApiQbIVUYLqclrwyuCKUwMl3PC4uUCe43Q7780
 fOZ+p0IkmU5Rdb3qF+uru0em7rgkNck6zDK4Tuigl3wFKLElfOTARmrZiMpADAxyx5Gd
 mKSAVjgtlOQ2N9FTAdGxknLLlbbRNkNDtlqbIi23JTermQIYCq7Jz60Xa8yL6txZRJUI
 1zqBb9hnwlOnX+UhD7Bi5OGNF2yxC+avG/DdUOizyrbqAixk+9kOKEO/qGLSfhspDrb1
 AZ0DZULmbOORr12r2AZ9bFq/8L6N22UeIngoLQKgtboWt+YGljxUwjvrzxQnuIdr4F37
 5XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qwnbwanU2MY7jCvFVBwRSp3WXlaw+EiV14zRrhqaSu0=;
 b=pRyL14rWAFxO++neYHa01hMZFy1Rlb0LvjxuLVRmnZumxWOpiY0twlkTFxhomHHkTA
 c3I270JITUF5/ZzKTaZm7F491LKSbAXTJv7XOJT72E5/DBeseaoUmXDAtogTGFPnvnQF
 0b3DEj2dpvzqjjYVE9YjwVftPFIRBJqnpiRvsOtH3rcykSAaUkODHbVYVnUI/2C/pOZy
 I21N8wvEpnIatd5ztiQiTocKhT8eHPtHI6Eg6vRAqk4hFBXDyryGSM7ozf1FX/vXbCge
 bQNHgFtxj8BcP1kAWjjQQAYFOT8QePionsS6n0Azw81APWtMbD0RxSmc5PVm7HFP5rvJ
 Gy1g==
X-Gm-Message-State: AOAM530AlrHRt6/ehX86ipz5fJ2n2R1FTVSSCzXmuFybmQo0BCv7270a
 N62DhP15FGqSG1aFgjkZsjIA3Z/wSoA=
X-Google-Smtp-Source: ABdhPJyxFmzPQdIpHLDHNyRn+rWF8FayJG6KOvHNVBAgNs2PIula+AmyaWzcw2zv5Ouksj3jqtc24g==
X-Received: by 2002:a05:6402:1283:: with SMTP id
 w3mr31971754edv.340.1615842943862; 
 Mon, 15 Mar 2021 14:15:43 -0700 (PDT)
Received: from skbuf ([188.25.219.167])
 by smtp.gmail.com with ESMTPSA id j14sm8800785eds.78.2021.03.15.14.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 14:15:43 -0700 (PDT)
Date: Mon, 15 Mar 2021 23:15:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Message-ID: <20210315211541.pj5mpy2foi3wlhbe@skbuf>
References: <20210315170940.2414854-1-dqfext@gmail.com>
 <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
 <20210315200939.irwyiru6m62g4a7f@skbuf>
 <84bb93da-cc3b-d2a5-dda8-a8fb973c3bae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84bb93da-cc3b-d2a5-dda8-a8fb973c3bae@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_211545_059846_134AD28A 
X-CRM114-Status: GOOD (  23.70  )
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

On Mon, Mar 15, 2021 at 01:44:02PM -0700, Florian Fainelli wrote:
> On 3/15/2021 1:09 PM, Vladimir Oltean wrote:
> > On Mon, Mar 15, 2021 at 01:03:10PM -0700, Florian Fainelli wrote:
> >>
> >>
> >> On 3/15/2021 10:09 AM, DENG Qingfang wrote:
> >>> Support port MDB and bridge flag operations.
> >>>
> >>> As the hardware can manage multicast forwarding itself, offload_fwd_mark
> >>> can be unconditionally set to true.
> >>>
> >>> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> >>> ---
> >>> Changes since RFC:
> >>>   Replaced BR_AUTO_MASK with BR_FLOOD | BR_LEARNING
> >>>
> >>>  drivers/net/dsa/mt7530.c | 124 +++++++++++++++++++++++++++++++++++++--
> >>>  drivers/net/dsa/mt7530.h |   1 +
> >>>  net/dsa/tag_mtk.c        |  14 +----
> >>>  3 files changed, 122 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> >>> index 2342d4528b4c..f765984330c9 100644
> >>> --- a/drivers/net/dsa/mt7530.c
> >>> +++ b/drivers/net/dsa/mt7530.c
> >>> @@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
> >>>  	mt7530_write(priv, MT7530_PVC_P(port),
> >>>  		     PORT_SPEC_TAG);
> >>>  
> >>> -	/* Unknown multicast frame forwarding to the cpu port */
> >>> -	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
> >>> +	/* Disable flooding by default */
> >>> +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
> >>> +		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
> >>
> >> It's not clear to me why this is appropriate especially when the ports
> >> operated in standalone mode, can you expand a bit more on this?
> > 
> > We are in the function called "mt753x_cpu_port_enable" here. It's ok to
> > apply this config for the CPU port.
> 
> Because the user ports will flood unknown traffic and we have mediatek
> tags enabled presumably, so all traffic is copied to the CPU port, OK.

Actually this is just how Qingfang explained it:
https://patchwork.kernel.org/project/netdevbpf/patch/20210224081018.24719-1-dqfext@gmail.com/

I just assume that MT7530/7531 switches don't need to enable flooding on
user ports when the only possible traffic source is the CPU port - the
CPU port can inject traffic into any port regardless of egress flooding
setting. If that's not true, I don't see how traffic in standalone ports
mode would work after this patch.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
