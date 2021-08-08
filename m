Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC56C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:52:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A98860E53
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A98860E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC1Y2UYbnuSr9exsh3EScFjTXf2HlpJwqlGoIYFghCo=; b=4yHNaOgGRlcoo5
	x/XVabXjscXw61HR/tqbDJpPiiFQpU3TUh21V/v0fnRZp0svwS3VnAdhmKGMrkSJu2dyrAJmT2JQJ
	sCsrOtAdKSWCDNMS0KrAya20IL+q/FzXHq7YlVxU71Q5HKUPziQjVsuOt1wUxQuCSzYVcPeiSEo0+
	OaVWHToucHFf1DGIR6Yxo3LHUFSgKFT2iIfW2/ahgpxTCUN8JUkKsv140YZW+ZKwF9AIhyC4O5bU8
	hBkQ7sDcssDpPSEd7YOtzYwS4V9/R8NFXOXneVxypez9efHBUaUZVVztXKrFw+iVaZx+vJvf29fhF
	X7G9G59zFD1C1Th24jmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsaZ-00Gjjk-C4; Sun, 08 Aug 2021 23:52:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsaL-00Gjf9-2n; Sun, 08 Aug 2021 23:52:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id k9so4652446edr.10;
 Sun, 08 Aug 2021 16:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g+mMde5qqc4uqYbMYLo0oM6z7/xWv3oSIgHXhyEzI18=;
 b=HG3IPM1H6BKAhnp9qibICBx63Uwux2bThByqPA/ojs6WFDEThJtqm+A82+7yz1knMT
 n1Bh794jpjjyeqMlOQnMCLfj30tuJ/stefGVB0HV/aUH6h7cDeX6rMxvINcrzQbuPtsC
 VQmmlya7O7WdPHTSyxJfCrGVsqXA4dDSLohHO3GMItkSVYCnf9mRP/vtUgLTWovcRdJR
 wvT+Zx2QM8Do9ZqGZ8HTR3KtOqiORh4WN666q1ADedsufn0R3RFd1G6PqbilDRgBFtR4
 PLoOvUxOzGFGziNHgfvwn0A6gpeCtoyc3MFQsD1lF+xk6W137aSByQWIGlCRXNKRUfqa
 BwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g+mMde5qqc4uqYbMYLo0oM6z7/xWv3oSIgHXhyEzI18=;
 b=q7rk6VSP9tURex4aGK7OyQgXVlBWoJ7JydHSLdlcG5mZKnAA5tHzAxTUZvVOBwK3O1
 GzJsohBWLYCAQbAo7VW9+s+YbMu4zB4mhiQZOoBrFP4V/y5Et3BfN/UvLYMfc6Yftsnd
 YAhPn58ra7gWjy+JIjWSA2vocg72rTVxOBocFFlmesthkutbJuLps5n4ZkfmWPgOjaS8
 SLgvTacXYEL2k/OCArJ7XvMiSGt0VFO/glmik6MNTWScOZLfcsXGP/Ucp33x3y0j6bAP
 u1rvqahC+sGtYPOZyvteqpxrrHpd3p3jZ1jq+N17BHSCH8b/tViiMEzgzT3jUlt0AxS2
 Dn+A==
X-Gm-Message-State: AOAM5332Gq3fuOHxBffVfwYeCG+Ss5Ceh1R530IuDKhHaFB0NhY8sFu3
 KweWJ3JQZ4q2ENyJV5aPfbU=
X-Google-Smtp-Source: ABdhPJylExpK6vSu0VFC4Y40mLv8hd5y8/R6uN6ZHtpGeCgyB23L+D+b0vxQY52+4Tz75Gunuig9xg==
X-Received: by 2002:a05:6402:31a4:: with SMTP id
 dj4mr26352070edb.350.1628466722891; 
 Sun, 08 Aug 2021 16:52:02 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id v12sm1572958ejq.36.2021.08.08.16.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 16:52:02 -0700 (PDT)
Date: Mon, 9 Aug 2021 02:52:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Message-ID: <20210808235201.wvw6mjzyvcpumxgk@skbuf>
References: <20210716152213.4213-1-ericwouds@gmail.com>
 <20210808170024.228363-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808170024.228363-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_165205_186262_5598226C 
X-CRM114-Status: GOOD (  34.72  )
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

On Mon, Aug 09, 2021 at 01:00:24AM +0800, DENG Qingfang wrote:
> On Fri, Jul 16, 2021 at 05:22:11PM +0200, ericwouds@gmail.com wrote:
> > From: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>
> >
> > According to reference guides mt7530 (mt7620) and mt7531:
> >
> > NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
> > read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0]
> > will be used to read/write the address table.
> >
> > Since the function only fills in CVID and no FID, we need to set the
> > IVL bit. The existing code does not set it.
> >
> > This is a fix for the issue I dropped here earlier:
> >
> > http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
> >
> > With this patch, it is now possible to delete the 'self' fdb entry
> > manually. However, wifi roaming still has the same issue, the entry
> > does not get deleted automatically. Wifi roaming also needs a fix
> > somewhere else to function correctly in combination with vlan.
>
> Sorry to bump this up, but I think I identified the issue:
>
> Consider a VLAN-aware bridge br0, with two ports set to different PVIDs:
>
> > bridge vlan
> > port         vlan-id
> > swp0         1 PVID Egress Untagged
> > swp1         2 PVID Egress Untagged
>
> When the bridge core sends a packet to swp1, the packet will be sent to
> the CPU port of the switch as untagged because swp1 is set as "Egress
> Untagged". However if the switch uses independent VLAN learning, the CPU
> port PVID will be used to update the FDB.

Sadly the Banana Pi MT7531 reference manual I have does not appear to
cover the DSA tagging header, so I am not actually clear what
MTK_HDR_XMIT_SA_DIS does when not set. Does it default to the CPU port's
value from the PSC register?

If it does, then I expect that your patch 0b69c54c74bc ("net: dsa:
mt7530: enable assisted learning on CPU port") fixes the issue Eric was
seeing, which in turn was caused by your other patch 5e5502e012b8 ("net:
dsa: mt7530: fix roaming from DSA user ports").

> As we don't change its PVID
> (not reasonable to change it anyway), hardware learning may not update
> the correct FDB.
>
> A possible solution is always send packets as tagged when serving a
> VLAN-aware bridge.

So as usual, VLANs put the "hard" in "hardware learning on the CPU port".
I would say "a possible solution is to not attempt to learn from
CPU-injected frames unless they are sent using the tx_fwd_offload
framework"....

>
> mv88e6xxx has been using hardware learning on CPU port since commit
> d82f8ab0d874 ("net: dsa: tag_dsa: offload the bridge forwarding process"),
> does it have the same issue?

...which ensures that bridge data plane packets are always sent to the
CPU port as VLAN-tagged:

br_handle_vlan:

	/* If the skb will be sent using forwarding offload, the assumption is
	 * that the switchdev will inject the packet into hardware together
	 * with the bridge VLAN, so that it can be forwarded according to that
	 * VLAN. The switchdev should deal with popping the VLAN header in
	 * hardware on each egress port as appropriate. So only strip the VLAN
	 * header if forwarding offload is not being used.
	 */
	if (v->flags & BRIDGE_VLAN_INFO_UNTAGGED &&
	    !br_switchdev_frame_uses_tx_fwd_offload(skb))
		__vlan_hwaccel_clear_tag(skb);

Seriously, I expect that a packet injected through the CPU port will,
under normal circumstances, not default not look up the FDB, not update
the FDB, etc etc.

As long as you let the frame analyzer look in depth at the packet you do
need to ensure that it has a valid VLAN ID. Otherwise it is an actual
forwarding correctness issue and not just a "learn in wrong VLAN" issue:

https://patchwork.kernel.org/project/netdevbpf/patch/20210426170411.1789186-6-tobias@waldekranz.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
