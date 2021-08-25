Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CDFC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 03:56:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ECB260EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 03:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4ECB260EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJyYd0Kc2GmChsF10kHcC0iv69OTjMmTKPUE6pkWl1g=; b=zqEgF+o37tHUOu
	+Bznb1FOuN8G9ft33FyhlNO5/c7QCBYgZIymqeuaWKjMJZ6OsY4gEqHSm8WacFrr9GKF170DVNB1b
	w5JutlMkRKsOt5mm1e078TC0En9gNGRhljvVkLNoQpR92UQZ8+Da8eM5afzYludwHhaCFH7L9xvYE
	tu8YGELTkw0JGVZhLjGQNEU26P9I8/Co2jaEjAQgL+8wlqRyx3ci3hah9LJVxPbcHUpGCLGzEWEi+
	Y9franJbs2ow3L+gyJEOcjG5BkpyITEVhuckFUiDjlVX3vSyk1jy2pl4NAuuSV+CZFI0/v05n0qFW
	+P6ziZy2tOZYEceDoOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIk1J-005Pco-O6; Wed, 25 Aug 2021 03:56:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIk16-005PbS-DM; Wed, 25 Aug 2021 03:55:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e15so13525338plh.8;
 Tue, 24 Aug 2021 20:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=rIAtfGj5qvVENV9WWVZMFVGBJuT4wuu3+yhzjBnrODs=;
 b=FFLev3F07ILuAs83PdrenjINmyoPq0n77COtk2VIQDbIdEIeXPxZuh6I0B7OU+4Tt1
 /E2LjvMMHnXZrAtRJc68INgHwY+om8QEUIereki+erzJLc59mmv0+1E4hb+pliTjsmta
 ndeTK1oMki5pOWNxKSvJzaJsxln2TScgQ5SamfpiNJoXpv3KMxIBerlRqClBYSqdCooB
 U8lLIVYl7tisFR0hGB6gNqVn0ZCbM4B+L/PJxhQg/O5q8o6fwNJUUyiw2WLrhxzP8wc0
 2Cpx0nIq0CB10pBWCp0R5uPg16kAk9b44mmjvPweTdxHy3yQnIEoIZKrKj6BApCD6lhS
 O8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=rIAtfGj5qvVENV9WWVZMFVGBJuT4wuu3+yhzjBnrODs=;
 b=AMB1to/7hxC1+2jkuIZgnJyooOvNPtcc+a2Go9KKTu4ZrcsOaOdaadvjoBT+ErATa0
 xyytVTlKw93tmUbVz2TIeE9LKjci4XylGrUBtT2wffRmlB4V32aedYtXiMcRLiFv2iwr
 jsZi92YMUqV3VmCfKy1rTMk9ksqskrHDtoDd0jgOUQW2qUDF3oZKEu03UZ6OkxXS4N2s
 7B71xMjCcP11QWFcVAirzxMnek97piaF67mWt2JNltCuGtckJqc08ZSQ1jIhkjbKoK8p
 k0aMhzaRVB0DK/MgQt0lmZOCpymlnFp4A5lGTCmPqf6spWQJjZnX22VRt4WOVR7JVhZF
 0laA==
X-Gm-Message-State: AOAM531rHyo2wHqVYB64LD/fUy1Bo6fCfTwNDL+E5heeyFN0h0QzWv3T
 ePaZjFKuNycCHEd3bzCRusk=
X-Google-Smtp-Source: ABdhPJzGY1gLl625kG0Emo3PW5/KunYn2jQ8ZmvIFLtams9OGpbD31KTB44Cic0fv4r3bexeCiy9bA==
X-Received: by 2002:a17:90b:4a82:: with SMTP id
 lp2mr8271118pjb.103.1629863755885; 
 Tue, 24 Aug 2021 20:55:55 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id a4sm21298248pfk.0.2021.08.24.20.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:55:55 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Date: Wed, 25 Aug 2021 11:55:45 +0800
Message-Id: <20210825035545.1836274-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824173714.cgpt2addxyjzlbyy@skbuf>
References: <20210824165253.1691315-1-dqfext@gmail.com>
 <20210824165742.xvkb3ke7boryfoj4@skbuf>
 <20210824173237.1691654-1-dqfext@gmail.com>
 <20210824173714.cgpt2addxyjzlbyy@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_205556_510172_15E3DFCD 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue, Aug 24, 2021 at 08:37:14PM +0300, Vladimir Oltean wrote:
> On Wed, Aug 25, 2021 at 01:32:37AM +0800, DENG Qingfang wrote:
> > Okay. So the Fixes tag should be 6087175b7991, which initially adds the
> > software fallback support for mt7530.
> 
> Ok. Did the old code not need VLAN 0 for VLAN-unaware ports, or are you
> saying that since the VLAN table lookup was bypassed completely in the
> old code, 'no VLAN 0' was an inconsequential error?
> 
> I think it's the latter. Just wanted to make sure. So that means, either
> this Fixes: tag or the other, the patch still belongs to net-next. From
> my side you shouldn't need to resend.

You're right. The old code does not use VLAN table lookup for VLAN-unaware
ports, and the current code set VLAN-unaware ports to fallback mode so
missing VLAN 0 will only make them fallback to SVL.

> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
