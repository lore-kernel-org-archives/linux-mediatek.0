Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7D9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:35:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF8D64FAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF8D64FAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q5rpGX+zdq3I4GMK6+/AiC8cgSyBTc6QI9B8EdZ2jus=; b=WUfwlrmkUQ9J9WHf9j8S1xvPZ
	HbxoUiAtNLLfqsQ/z/S74Eo0/iT6r/WywEeP6qIkC8T90RHZl0eWASYpVrLBsQyNihLMp7kSSjfsp
	iFAn8KKLlp/bWN4THZuKlwW29yAOnpYvcCqW0xTew2gp4VSKgWft0Y+Xh9YtP+0hf3SUfpYwEEV/j
	yi6xd0SzD8LPD2n8AGYky4xT+HgnxbSc9bAOFXfxs/gHQ2fkT2VYS1weXw8EDKxpmn6NTiOLNSQJK
	5a2d5HvzlIb18R+i1qvZkC7mMG7tQHHxMeeJ+loNObuLTppO7Bo+/4xLhlGuq7ijyviYixgrkbUeU
	lcrVTcTLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKC6O-008J28-26; Thu, 11 Mar 2021 03:35:08 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKC6D-008J0t-Bu; Thu, 11 Mar 2021 03:34:59 +0000
Received: by mail-io1-xd29.google.com with SMTP id a7so20363867iok.12;
 Wed, 10 Mar 2021 19:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3VYOKPLK02wgZWHswLew0WYlzNBXfD24og6vidOw2M=;
 b=fiqFsmN51ODtfC6BXdCcCJY3bzDL/GDBMkcujMQ7rsJseC3Hi44Pevit56gdgUCmxO
 rucShBW3uEy8BZbQvEEMiPrKiz7egAguc2jr0UX4FX3e+kiAkR1v035L3oO80NxDFAYG
 dIgKFgGlOuYEl65nYClh7uPi1DyNzGsdkpfzep/zUZEmLeAzX3oKHGQfPexPbp6Mnfo6
 MIySTlJWiGx0megFNySpxfDECEt58y0tY+AbG7A0ue837CqxI075mO8dkqp51Fwphgq7
 RTjXq/exaY/0YSe6dTq1jmOTA5dw335Qo+Woj2yg8zeQiNQwC/2w/P7GO2DLEaYVTKmc
 0yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3VYOKPLK02wgZWHswLew0WYlzNBXfD24og6vidOw2M=;
 b=QKajIu2AfyFf9fZ0I0KOAS8nDZ0GY2hCa8j8Z/kzuoh2IfZePMvdAvWQrmJOrure+Z
 K+6P7sOQWc4mPeAIuZ25HFXa2yrZMAJH8+t+ARDuk3LGwuwxHXbB53nw5dyjWYX9re2q
 GicqrGcg3cw49rm+zXSXb64GI2ugQL7KbdH+7hQCwSX4KdTbJNU3MlvKYCm8xSNWSx85
 NJ1CJOGSozgqR8YACnaq5ZwqnkYhQgEbXQZ3gMDZyGXOZ+1NtRVwRVzLhMdhkTTZQKj/
 6kXRehOlt/Ynbfl36U7538wMObCPfdtEOldwPxxUGDiPK3T0CN1Rufgx9CXEYUlFebFh
 0eJg==
X-Gm-Message-State: AOAM533egGZuV//NsTUUefOhGX29kDpmpKTE6/myEpcdQPdXHb0xPGDZ
 2nhq3GvfPtOrJoQezOEJn+JQ4aM4MtKJjlUYatQ=
X-Google-Smtp-Source: ABdhPJxGDvfOGhh8O/le4UU6rChPhKFoz7CbvicMWCgnlHqdRMsOjAwOQYA3caLKxpVMyVEnpObGLVshcCNy4h1wIwI=
X-Received: by 2002:a02:817:: with SMTP id 23mr1641989jac.23.1615433694363;
 Wed, 10 Mar 2021 19:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
 <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
 <20210310231026.lhxakeldngkr7prm@skbuf>
 <CALCv0x0FKVKpVtKsxkq5BwzrSP2SnuYUaK38RHjd_zgoBCpdeA@mail.gmail.com>
 <169c64ac-c200-fa5d-6563-3be5263d0b99@gmail.com>
In-Reply-To: <169c64ac-c200-fa5d-6563-3be5263d0b99@gmail.com>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Wed, 10 Mar 2021 19:34:43 -0800
Message-ID: <CALCv0x2HZJXrE7nXu9a+bf1hX5dpUGh1ehqsE_1SyYHFghpiDQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_033457_580592_D1CCC602 
X-CRM114-Status: GOOD (  27.50  )
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

Hi Florian,

On Wed, Mar 10, 2021 at 7:20 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 3/10/2021 7:17 PM, Ilya Lipnitskiy wrote:
> > Hi Vladimir,
> >
> > On Wed, Mar 10, 2021 at 3:10 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> >>
> >> Hello Ilya,
> >>
> >> On Wed, Mar 10, 2021 at 01:14:20PM -0800, Ilya Lipnitskiy wrote:
> >>> 3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
> >>> actually resets the switch on platforms such as mt7621 (where bit 2 is
> >>> the reset line for the switch). That exposed an issue where the switch
> >>> would not function properly in TRGMII mode after a reset.
> >>>
> >>> Reconfigure core clock in TRGMII mode to fix the issue.
> >>>
> >>> Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
> >>> Previously, only the core clock was disabled, but not TRGMII Tx clock.
> >>>
> >>> Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.
> >>>
> >>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> >>> ---
> >>
> >> For the networking subsystem there are two git trees, "net" for bugfixes
> >> and "net-next" for new features, and we specify the target tree using
> >> git send-email --subject-prefix="PATCH net-next".
> >>
> >> I assume you would like the v5.12 kernel to actually be functional on
> >> the Ubiquiti ER-X switch, so I would recommend keeping this patch
> >> minimal and splitting it out from the current series, and targeting it
> >> towards the "net" tree, which will eventually get merged into one of the
> >> v5.12 rc's and then into the final version. The other patches won't go
> >> into v5.12 but into v5.13, hence the "next" name.
> > I thought I figured it out - now I'm confused. Can you explain why
> > https://patchwork.kernel.org/project/netdevbpf/patch/20210311012108.7190-1-ilya.lipnitskiy@gmail.com/
> > is marked as supeseded?
>
> That looks like a mistake on the maintainer side, I do not believe that
> patch should be Superseded since you just submitted it.
Thanks for taking a look. I thought maybe I did something wrong with
submitting the same patch to net and net-next, but the net-next series
(https://patchwork.kernel.org/project/netdevbpf/patch/20210311020954.842341-1-ilya.lipnitskiy@gmail.com/)
depends on it, so the way I did it made the most sense for me. Let me
know if I did something wrong.
> --
> Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
