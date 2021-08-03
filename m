Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DF8C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2FA60EC0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC2FA60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S57jylGwCJ5BiiQrzSQmvZ19xnqKnU2ySGzfkOrGkVM=; b=mmFYMF8c9Ie1om
	C6e34EALTIb6XQcu41fnTvUvMzGxwaxuOSVVuj71zmskYNgtO5yjWwCKB5oVd2nbyx1azG5TsEo2j
	kZOCTyeUm5aCj0/2iXOmc7lXqbZ0xcjDaXCsCrKshkuEx7czFVe2PtgEEyB8ZAsCNOyaBtpIGmaNq
	Dup2cBHibK8wrfADPSjEHIIUZO8GU07j/39KWyx/JSCMm7xKipEsZp+QnKJpA4NU9BGd9ALqA7kSt
	/x7zsRcTBeNRsO6H3DE8e7VomYVaP8rKs9gp6Rl0nfnhkKlSfkHp0DQ+RKMblBrfd1+nqcQtrrKr7
	+1E84NZQTKbB+aH4LTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxbJ-003fPa-Et; Tue, 03 Aug 2021 16:49:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxb6-003fOn-PQ; Tue, 03 Aug 2021 16:48:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id oz16so37300585ejc.7;
 Tue, 03 Aug 2021 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q30axrIyLL4BtFH1Mw+B/tDX/rCRSYfrJS59KMTeQ8s=;
 b=P7ct2B3v9t670PAGVpPO8Vk2qSv93bkzFCcLJaKXej/CeItell69wsIeju8Or8U/tT
 5//UKVTPUZh1byle4XyGqUKjco57sU6QWNLEAJC/zv5UB5Q00yutrwJmC8Nw3BimXKcU
 gTWOcct1UB10v6AXN3G+y+zbA52vdVBQYMOzrA7sFlW9H0E4PnZm77awNvVe+Ffd8lu2
 UvH+Y9GcWzEVMowdhktusQGuZ0PYArCpv2fhAF5h8N722/55Hteuiu3llXvJq52lkvWN
 NrUB9UAnYH2T2xxqV9ZBfQtDJuc8aORfkcv57aPQlEGkFHFFlIxhZ6d8V53xmpkSSj66
 ZrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q30axrIyLL4BtFH1Mw+B/tDX/rCRSYfrJS59KMTeQ8s=;
 b=gFEgKUGCGzRVtpjDBVpaQqWZOZY1ZbGmPmMUoMhm/LYPWLtpo4QFaqwXU1UP8CNSMT
 9qZLpR6vQzjnz4Z5Ri120GiOkpGM9PqOcttsmlVcouyTCG+BywdxXWXCqeHGJS+g+a1Z
 KW6vADQ3j4Ph+P4I9LWcz+TPArbrD10yC685ZBfpsvGPwwBzDZff0rnaZGf9Eni6Jsz0
 TyTEylSmDra74tWiOnkrcfbsThzdjTS5dbt5+lLJvXAkaCy4+BA7LamBZXFnJ7mP8Slv
 EBtHwuEsiTyWTMC+z70ofrtZWrGIjfz3zFDqp/3nEnOdJUwmk1BN204GeeQCc+VvPp2K
 w/Cw==
X-Gm-Message-State: AOAM533qbfe4QjIPvjePE3+YABdFNSI2rifBshV4/1j5w6nW6tbTka/p
 QfFNVvMhIvC55YguR8W1yMQ=
X-Google-Smtp-Source: ABdhPJx6UDh2RjFJRugCCFz3BvCoMW8PtfK9zUqGIuey6Y56nN6TTzWv83y+3gtmWv0ZDkl5sQ5KPw==
X-Received: by 2002:a17:906:2990:: with SMTP id
 x16mr21246522eje.554.1628009334973; 
 Tue, 03 Aug 2021 09:48:54 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id c14sm6448976ejb.78.2021.08.03.09.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:48:54 -0700 (PDT)
Date: Tue, 3 Aug 2021 19:48:53 +0300
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
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next v2 2/4] net: dsa: mt7530: use independent VLAN
 learning on VLAN-unaware bridges
Message-ID: <20210803164853.gxw4zfxmmgs2kgry@skbuf>
References: <20210803160405.3025624-1-dqfext@gmail.com>
 <20210803160405.3025624-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803160405.3025624-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_094856_872439_607400C1 
X-CRM114-Status: GOOD (  33.67  )
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

On Wed, Aug 04, 2021 at 12:04:02AM +0800, DENG Qingfang wrote:
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
> Ideally, when the switch receives a packet from swp3 or swp4, it should
> forward the packet to the CPU, according to the port matrix and unknown
> unicast flood settings.
> 
> But packet loss will happen if the destination address is at one of the
> offloaded ports (swp0~2). For example, when client C sends a packet to
> A, the FDB lookup will indicate that it should be forwarded to swp0, but
> the port matrix of swp3 and swp4 is configured to only allow the CPU to
> be its destination, so it is dropped.
> 
> However, this issue does not happen if the bridge is VLAN-aware. That is
> because VLAN-aware bridges use independent VLAN learning, i.e. use VID
> for FDB lookup, on offloaded ports. As swp3 and swp4 are not offloaded,
> shared VLAN learning with default filter ID of 0 is used instead. So the
> lookup for A with filter ID 0 never hits and the packet can be forwarded
> to the CPU.
> 
> In the current code, only two combinations were used to toggle user
> ports' VLAN awareness: one is PCR.PORT_VLAN set to port matrix mode with
> PVC.VLAN_ATTR set to transparent port, the other is PCR.PORT_VLAN set to
> security mode with PVC.VLAN_ATTR set to user port.
> 
> It turns out that only PVC.VLAN_ATTR contributes to VLAN awareness, and
> port matrix mode just skips the VLAN table lookup. The reference manual
> is somehow misleading when describing PORT_VLAN modes. It states that
> PORT_MEM (VLAN port member) is used for destination if the VLAN table
> lookup hits, but actually **PORT_MEM & PORT_MATRIX** (bitwise AND of
> VLAN port member and port matrix) is used instead, which means we can
> have two or more separate VLAN-aware bridges with the same PVID and
> traffic won't leak between them.
> 
> Therefore, to solve this, enable independent VLAN learning with PVID 0
> on VLAN-unaware bridges, by setting their PCR.PORT_VLAN to fallback
> mode, while leaving standalone ports in port matrix mode. The CPU port
> is always set to fallback mode to serve those bridges.
> 
> During testing, it is found that FDB lookup with filter ID of 0 will
> also hit entries with VID 0 even with independent VLAN learning. To
> avoid that, install all VLANs with filter ID of 1.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> v1 -> v2: use FID enum instead of hardcoding.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

> @@ -1629,11 +1651,12 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
>  	/* PVID is being restored to the default whenever the PVID port
>  	 * is being removed from the VLAN.
>  	 */
> -	if (pvid == vlan->vid)
> -		pvid = G0_PORT_VID_DEF;
> +	if (priv->ports[port].pvid == vlan->vid) {
> +		priv->ports[port].pvid = G0_PORT_VID_DEF;
> +		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
> +			   G0_PORT_VID_DEF);
> +	}

After this patch set gets merged, can you also please take a look at the
following:

Documentation/networking/switchdev.rst says:

When the bridge has VLAN filtering enabled and a PVID is not configured on the
ingress port, untagged and 802.1p tagged packets must be dropped. When the bridge
has VLAN filtering enabled and a PVID exists on the ingress port, untagged and
priority-tagged packets must be accepted and forwarded according to the
bridge's port membership of the PVID VLAN. When the bridge has VLAN filtering
disabled, the presence/lack of a PVID should not influence the packet
forwarding decision.

I'm not sure if this happens or not with mt7530, since the driver
attempts to change the pvid back to 0. You are not changing this
behavior in this series, so no reason to deal with it as part of it.

>  
> -	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK, pvid);
> -	priv->ports[port].pvid = pvid;
>  
>  	mutex_unlock(&priv->reg_mutex);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
