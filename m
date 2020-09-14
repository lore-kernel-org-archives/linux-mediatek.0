Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE30C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D856720732
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZOYfoZr3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDQV6/Kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D856720732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvJAmMuZ/yVHcTnZaBpcCVsaRY0UfSZw+IFg2ylrGco=; b=ZOYfoZr35Tq6R105X0HkDYj7c
	mXSKRADlw+b0zjBMF69PSRGuDWt282bH4XMfuMOAFnnGKnj4LUM35Pq3lOZtJDErjIc0JiVEL0VZv
	3F18VbT+GbX3A+yCRFPXWidRvtUxJ75IB5SNypH3WfSUGEL67D+sf8ZSBBCAwy4TZB8KMzXoFl3dD
	sDhQVpkfb2i83Z5YLMvqFzgyTq8dPNcnORvZjNBHaeqC/nHsUFERskcPw5qE51nWy1XjkZjpaQwII
	EYFPINu7xWNHdHjNAMA/wlua2DowJWCRwTd3RWNLg+WuJcxxtRp8o6UTa4HA0UbkhtFO955YZDqTK
	7D5PL9/Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHpvV-0005yS-O1; Mon, 14 Sep 2020 14:57:53 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHpvP-0005vq-1z
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 14:57:47 +0000
Received: by mail-ej1-x644.google.com with SMTP id z22so392601ejl.7
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Xh4tD223j00jU7T+Vd43Uj9fI1q3F/mpuVRkoDMYyKs=;
 b=GDQV6/KlhWsmL1rEsCarprshmGJdUWS/ItNbt1hdUP+hquCmAK2EBAvPbuO9hNUeNT
 gpil2zbDpNeMWDyOHN7FIa4OEnMzRZbHp1Ptt8vq2EfViROkyIwzl2SUGC61D9+GK6m3
 diaXUiJ71sCdORzU/9+cd6XlwnUk2m0PZOpGJY8yj+mUBgjZ5Jts2WfRXM4RA5C82wYY
 bcqN1zeQLBy96ls/tFFFIRV9uVzSQChTedkI8pzrWVLT4Ml+/oUBZ/v5jBVe3ipRE4wi
 SDFFfQUMX266jrgL9ZJjBSPxet5P8LzJxbRoaYhR2n5rphJo4nuI1ugWkmK7HvAImwJf
 VPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Xh4tD223j00jU7T+Vd43Uj9fI1q3F/mpuVRkoDMYyKs=;
 b=CIJ0PUGg1xsH9JsbU0+M5iD+Ba89BCv0xRuelNspV+zu1o0UVeEegv892JYuv8ZizZ
 mWb9QlUgP7/8/mRJLiIyO5xeKj3JJoxGGEumeZQx7FJbT9FwxdBt0ao/OYe+wV7nKx0z
 ChTs9Kps3Z/COR6ayd+C9LX7DGP8mO/2ZgA7ZEIS3CXGA/swzx4hH+lExznuJj2ooeK4
 ZZmjNTuXVuuzpkwGREpqaKjGqMD8yjx+CkQI3KB1eg4AeQvz91agzNlTLkAbynYHNTOe
 cSDS2tcmJnwbRj4pLtKmqBCvLgCT2A7NxEXgYzwc7nART9WDC4fTYt2GRzQQ3qjizYem
 Fy4A==
X-Gm-Message-State: AOAM532jaHmgXcZYISXgZ89JLuVcbL1rYBFSvEZQEPdUjbg20r/EGnhz
 QB0sRsfSmW+aq7cCfh6hQ/c=
X-Google-Smtp-Source: ABdhPJx+0myKK4AhShO6TTXm3+70MJAFc8OcZXHuIWnyTyYe9sX1qwfdEKa81XG8Kuu4WfzQsX5GQA==
X-Received: by 2002:a17:906:46d5:: with SMTP id
 k21mr14873627ejs.247.1600095465580; 
 Mon, 14 Sep 2020 07:57:45 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id d13sm9440145edu.54.2020.09.14.07.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 07:57:44 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 16:57:43 +0200 (CEST)
X-X-Sender: lukas@felia
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
Message-ID: <alpine.DEB.2.21.2009141615020.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1939471326-1600095464=:17999"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_105747_142030_F6B232DD 
X-CRM114-Status: GOOD (  35.62  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>,
 linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1939471326-1600095464=:17999
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 16:01 +0200, Lukas Bulwahn wrote:
> > > > I am not subscribed to linux-mediatek. When I sent an email to the list,
> > > > it showed up really seconds later in the lore.kernel.org of the
> > > > linux-mediatek public-inbox repository. So, either it was delivered
> > > > quickly as it is not moderated or my check with lore.kernel.org is wrong,
> > > > e.g., mails show up in the lore.kernel.org archive, even they were not
> > > > yet permitted on the actual list.
> > > > 
> > > 
> > > I'm the moderator and I get requests to moderate emails. I suppose I added you
> > > to the accepted list because of earlier emails you send.
> > > 
> > 
> > Okay, I see. I did send some clean-up patch in the past, but I completely 
> > forgot that, but my mailbox did not forget. So, now it is clear to me why 
> > that mail showed up so quickly.
> > 
> > Thanks for the explanation.
> 
> AFAICT the linux-mediatek list isn't configured to automatically
> moderate messages from non-subscribers. Its generic_nonmember_action
> setting is 'Accept'. That is the default setting for lists on
> infradead.org and I strongly encourage list maintainers to leave it
> that way.
> 
> Lukas, I don't see your address in the allowlist either.
> 
> There are other reasons why some messages get might trapped for
> moderation — the message size, number of recipients, spam score, etc.
> 
> The mere fact that *some* messages are moderated does not mean that the
> list is "moderated for non-subscribers" in the sense that the
> MAINTAINERS file lists.
>
> > Bjorn, with that confirmation and Reviewed-by from Matthias, could you 
> > please pick this patch?
> 
> I think we should be fixing the ones that *do* say it's moderated for
> non-subscribers, not the one that correctly didn't :)
> 

Well, I am happy to send any PATCH v2. I guess we, you, David, Matthias 
and I, now just need to determine if the list is moderated or not.

I will then adjust MAINTAINERS to the final conclusion.

Lukas
--8323329-1939471326-1600095464=:17999
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--8323329-1939471326-1600095464=:17999--

