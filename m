Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871A1C4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CE2610FB
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59CE2610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICOuZVh1hnSy6Lxkm0bf5v94y2GB4+oGiegMrk2kz/c=; b=g1taHPcZWgxVfe
	828G+KrU7mFPuC+8VRwSvkUJ7h2WjBIND1uVXiEF3pupSiJaUlYrLCb4qMSFIkgDQUEgJubXQ+bZC
	cQOgQ5CefXFE2Yox/7SX78HQeNcmyWpcYnn/Dunp6cfkysaufZL8uB8XbERBL8xYg0BLbfjNj/9Jw
	4VN5Q4abiwhrAGBJQ+DMzFERooh1gOwIzurrz68qwk+H89ceEz7Vu5TGkVRi9BVygN03gOPRM9Al8
	Jav+3b4H94gdXCisLhnmMMUcLjhF8ol44pBfwX2gv1QUktKFNGigZy3Y4Wt2sCbuNMaTf0TO6tvoV
	kutAqnShH66/iGRig4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAaBl-00H2z3-Hl; Mon, 02 Aug 2021 15:49:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAaBM-00H2lV-QE; Mon, 02 Aug 2021 15:48:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso577048pjo.1; 
 Mon, 02 Aug 2021 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=iFEvhb+pWS2fHWjo0SPK+/xVkX5ExnAVIzPe3nLKKpI=;
 b=gkFlepEtWgxNsrASRfaQY1uh8Mj1erqxFQyyuDQKRDZoyjFfTKzszqOVZfchtHwSxB
 EayR11JSZNgAg968gT6S5f08lqOqp40AozL+gcIs7p5U/u2OvSV997QvGXceRBSUSyq0
 8/6BeEz2l8ggw7ohQ7L9Aqemvo6H9iS/AjnavSo+8Sgpyfrw4pMw/juAPvShadnZ2p8G
 XdZMWRPfIFvuGlHWcniw9F9dTzaQXIVkbANdvzc8rBVJgzP+WjOZSWpCFVWshcxHwMRc
 FJBkEMGTYBwjm7Q7JKTBiVdV+ncrbrvMr3zySwWg7xAfLcyzwHYcG1lj6KnPs2mk69GR
 ANgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=iFEvhb+pWS2fHWjo0SPK+/xVkX5ExnAVIzPe3nLKKpI=;
 b=BPdWpA/gwYzJssnYOUX49pSG0uBB6/G8y8q02DHUzZaSIQGNdaQ/dhBwxtkPdNGcxc
 Vat6DjtFbS8b6VnMnX7We5hrBAV2tmJsyO+vz69bxe8KEjZLhqFFDld1GflWrPV7EALW
 OVh/+A2J9kWObvCPUIvM8LAU6vbc/8yg6LNa92cW0DQqUMUetOIy+KA7kp9XRHf/s+F+
 ESMXRbkDwQRjeffi02pkpG9dTazr0dDm9x2Xpruy/yJYoAkcXJV3hQ1dT1xIWUVPC9GK
 BElJN8yde4MnrZNBoRpxkBtJpsyejENdjupxCQodwj/QrmAOLgnVSDwMsRuODLF21ThD
 pTyw==
X-Gm-Message-State: AOAM531eNQJDGUe6p5l9yVR3W60Uuo2KCa06kMm52TAnBmfEX6tGLUqW
 W9/w+aSx47GSd7YoyLxSuak=
X-Google-Smtp-Source: ABdhPJzqXW1OAkAAZZra+6fqNo9oVwsleYwCd0ZWR5t9Yaba1OfMRtzMKyaaxDMQLw96sEu64UB2ZQ==
X-Received: by 2002:a62:8fd4:0:b029:3af:3fa7:c993 with SMTP id
 n203-20020a628fd40000b02903af3fa7c993mr16580168pfd.77.1627919327667; 
 Mon, 02 Aug 2021 08:48:47 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id v13sm11244135pja.44.2021.08.02.08.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:48:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 4/4] Revert "mt7530 mt7530_fdb_write only set
 ivl bit vid larger than 1"
Date: Mon,  2 Aug 2021 23:48:38 +0800
Message-Id: <20210802154838.1817958-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802134409.dro5zjp5ymocpglf@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-5-dqfext@gmail.com>
 <20210802134409.dro5zjp5ymocpglf@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_084848_918599_7A62C318 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, Aug 02, 2021 at 04:44:09PM +0300, Vladimir Oltean wrote:
> Would you mind explaining what made VID 1 special in Eric's patch in the
> first place?

The default value of all ports' PVID is 1, which is copied into the FDB
entry, even if the ports are VLAN unaware. So running `bridge fdb show`
will show entries like `dev sw0p0 vlan 1 self` even on a VLAN-unaware
bridge.

Eric probably thought VID 1 is the FDB of all VLAN-unaware bridges, but
that is not true. And his patch probably cause a new issue that FDB is
inaccessible in a VLAN-**aware** bridge with PVID 1.

This series sets PVID to 0 on VLAN-unaware ports, so `bridge fdb show`
will no longer print `vlan 1` on VLAN-unaware bridges, and we don't
need special case in port_fdb_{add,del} for assisted learning.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
