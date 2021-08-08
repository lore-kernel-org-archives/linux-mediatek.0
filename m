Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7B0C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 17:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACEC60C3E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 17:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ACEC60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZMvDJh1noZat+xePlqMSMt3i7J/TBcc/hw/jbZRaHE=; b=pHikQmnnrwkc77
	Rhmt5t5CGGjXX3kpefUc7uVnKwfiMXh5RPANmoUpsrzPOFwz6PiMKp6MHUklSOVHJmPVKrysJyvgA
	Y51QfRYszKSkEwMppaDlQdMFyoG/hctI6WbgBxUUOKqlOOmASc1egNcxNpfAdxmPFov2+1tobzkzj
	vVd2x71mzsANEvnijjBHgaNDTtSZGW6Y7Mpj/lFkmvxKh0DSMkoHPg5WADVzYzU9Jx2H2S7cQKnZF
	+PoGQJFsNRQCCXKY4HxmCSFK1d9w6vX218FjBVZrS2RXFAz5yMfUOxImjM3VZDHGelp2me9JW6ACH
	NxiEdXztcMJUJnDf97iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCmAL-00G7KI-AX; Sun, 08 Aug 2021 17:00:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCmA7-00G7I3-MI; Sun, 08 Aug 2021 17:00:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso26072093pjf.4; 
 Sun, 08 Aug 2021 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=+2IKb4s8fLaRZamykzK5nK7Y6dvXALlvgfnoRe+HK/Y=;
 b=V7i3FJXi/sN/dE+EzN/zCtN1Ty5SXScTHTYaqSD8NMxo9IGHF4rxb2kjRpQu1WpJjm
 jdNqqrLLQOgojgaMnANSNHJ4S/MVy8H6I8CatnefIBLVU3GPvalJTkZiBxH1aDNNKhIR
 huMpeQiXkxsmqHa9bqg0qi28cT3Nvy8T3NEqt8JwmV5djH6Wkx01iDgfWe1PJunrCbcr
 frwhGcqaJLnb/sTuyxgx4muiXlfSbX76J+Bk20eZ8GkU56qzA/FtSHQiTy91p1RYXkXh
 w2r1zogUW3f3m0K610hXcLajdvE9UAKrmeVLfMkQ6VR47uEALFHU1HVhet67KLZq/7eL
 24Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=+2IKb4s8fLaRZamykzK5nK7Y6dvXALlvgfnoRe+HK/Y=;
 b=VY/ceohuksPS6bo+hnSKdhY30N3X5+BveQUkRgKXOJGlf1hfK9qy+kwSJZDbaCCL+d
 9inZKDCoHm2k1ofT8vE5bFCVnFCv0ezvXApVeCwg3I6Y3/9Jvke8lsWpea+CBcK66bIf
 cfPDP0MODQD3jXgAwxLKmMYX2MWZ/3p2UP0NjAoFJuRGwpngk/+iK5rOfammC1hzm1/c
 7cQelAh2f3uk9XxO9E/GccINebtS5OM4N2k4sCSXgYwS3tYl2wir5njH0IQzYiQZ2Ips
 jpJ9SVs9lKubPIZePX3brNzf44Ifva0VPc5zFmqAZw4F4cuvjC47PKzkurlTOclI3ipX
 jCpQ==
X-Gm-Message-State: AOAM530hCRxXFSSnUJTbiyKmIub8gxO8B5YxnSBENmtPwtpsaHC8WnuF
 CTiuKb1ODHE7BF3jocWJEzE=
X-Google-Smtp-Source: ABdhPJzI6b4wFZ9s//pHD6eCbcos1ptHiqYy/HRV5zh3u+BW1GPVZvtWLyGfb1QM/JFtvRYk9ArgIg==
X-Received: by 2002:a63:3e05:: with SMTP id l5mr31867pga.403.1628442033404;
 Sun, 08 Aug 2021 10:00:33 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id q5sm15251889pjo.7.2021.08.08.10.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:00:32 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Date: Mon,  9 Aug 2021 01:00:24 +0800
Message-Id: <20210808170024.228363-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716152213.4213-1-ericwouds@gmail.com>
References: <20210716152213.4213-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_100035_798094_431EAF20 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, Jul 16, 2021 at 05:22:11PM +0200, ericwouds@gmail.com wrote:
> From: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>
> 
> According to reference guides mt7530 (mt7620) and mt7531:
> 
> NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to 
> read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0] 
> will be used to read/write the address table.
> 
> Since the function only fills in CVID and no FID, we need to set the
> IVL bit. The existing code does not set it.
> 
> This is a fix for the issue I dropped here earlier:
> 
> http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
> 
> With this patch, it is now possible to delete the 'self' fdb entry
> manually. However, wifi roaming still has the same issue, the entry
> does not get deleted automatically. Wifi roaming also needs a fix
> somewhere else to function correctly in combination with vlan.

Sorry to bump this up, but I think I identified the issue:

Consider a VLAN-aware bridge br0, with two ports set to different PVIDs:

> bridge vlan
> port         vlan-id
> swp0         1 PVID Egress Untagged
> swp1         2 PVID Egress Untagged

When the bridge core sends a packet to swp1, the packet will be sent to
the CPU port of the switch as untagged because swp1 is set as "Egress
Untagged". However if the switch uses independent VLAN learning, the CPU
port PVID will be used to update the FDB. As we don't change its PVID
(not reasonable to change it anyway), hardware learning may not update
the correct FDB.

A possible solution is always send packets as tagged when serving a
VLAN-aware bridge.

mv88e6xxx has been using hardware learning on CPU port since commit
d82f8ab0d874 ("net: dsa: tag_dsa: offload the bridge forwarding process"),
does it have the same issue?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
