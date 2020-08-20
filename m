Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0830CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:08:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E492080C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pU3fcEOi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Lapb6oYH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E492080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VzBvmLonENiHc+36gFbARUVzuspR46/7fkjbUjAap6g=; b=pU3fcEOi27oeRQSLrKxVwDkSr
	F9vqXSEnEiDp+QMFa0phzRh6VMItRCmS34RD+1aUDpE4BfjHXJ4Rsp8ICjWNduodMc2xV5ejNUvE/
	zj7dOkk5/MiJh9CTpc2YLglcbHg7Lzs2McN9Olpy8t/xt1iSKNJnJmk6WtpK5iKjewecb/V6AIby0
	BmhQxynVZd1Yc09wbYuJd+XVbUUdUpl5J9uNF79rNEWdB99DaFT71Le5UbvTTkZ32ybp0/Kaj8YSb
	jTWHyzi5ZfUrqSZERF7iiPZr9wG58TZp2CVZogVVhVANDnxlnx0A0WCpZlRskCoGYvgE2i5go9nV9
	9dfaG0utw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8fcl-000611-Hd; Thu, 20 Aug 2020 08:08:39 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8fci-0005u5-C0
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 08:08:37 +0000
Received: by mail-pl1-x642.google.com with SMTP id z23so527462plo.8
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyQuqwn4RZF56iSes2DwNieBx5SpVLzHQWszhjrntHk=;
 b=Lapb6oYHVPL5HNLwcPNs8MoFKbXLSYE2HQX+VtwSg4ZyjFXq7XlQltoIe56HYn9XBU
 LgwdfPt8FCiCKiRbg3IIeQgysyw919rVQUDSW3IajjJ4Bcb4v2VdKddnHiiHjmJkfgte
 vGNQRL95MAlkFXlYw11QN+/MX2YrmkdaJNPn3RX9kQKH1etDLseHML/CHfTp/SCPCwGw
 iDhSewBo6cWlO1VA8xkTEW5sYfnlr5ET52plBb+3U82O3jAIEDhQL3CziQeoxCA+45m8
 w/f5FVvfNttV9zaQbMZb3OubH8Q7zAW8LJ0J3oNih7c0jn0yUjeNIij+iKML5/wJG/Bc
 j1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyQuqwn4RZF56iSes2DwNieBx5SpVLzHQWszhjrntHk=;
 b=Cv4TNo63RLkXEvdVtGnCLxzSeWZrPP1vMl2Q9vM02Zz+QWP+T62jMmUvqaYDAh02/R
 0C0I2Y6JlI8Q7KnVz12JmM48CSuHSEhS8zARiR9MMGBOMezSOsYitYEgzZYFvIBMQ+sI
 jZGzdISAHJ2h/xetoHikIVxeaccTgymR0+u1a0qDpWlKnj1OErJYP0lHmU7ynk0uXhZ6
 PUhlQK51khpLa/lL5reZKtTJpKACQg0WFGaavx0ltKPZWuHvXe9VpVXXB/Gmxpfj9MEH
 C84WAHIIsLUhmItQhZoYqIX+x7/yJIpRlDm507yJkKCJTdpN/RR7fcQcAocacuqfF6BH
 UO5A==
X-Gm-Message-State: AOAM533R0gctHX13KYXZ+smP07Ax1o+2buukz8U8UgdBEvnuujRPqgT7
 4aoQokW2tHCRrJaVchePD4BbPyYooq9pkXNwyE9ebQ==
X-Google-Smtp-Source: ABdhPJz0kFzwDoyHPV/MtXyJ7awqCWpml+jMHDpurrzZKfWF2c7tPKWf1HaPIVFCZtqGF9x1K04HyBAeG+49r9IiS7I=
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr1645144pjb.51.1597910914013; 
 Thu, 20 Aug 2020 01:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
In-Reply-To: <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 20 Aug 2020 01:07:58 -0700
Message-ID: <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_040836_506705_BF27B670 
X-CRM114-Status: GOOD (  20.27  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Hanks Chen <hanks.chen@mediatek.com>,
 Frank Wunderlich <wichtig@fw-web.de>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 12:56 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-19 19:51, Saravana Kannan wrote:
> > On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de>
> > wrote:
> >>
> >> hi,
> >>
> >> does the fix you've linked to my revert [1] not work in your case?
> >>
> >> [1] https://patchwork.kernel.org/patch/11718481/
> >
> > Thanks for pointing it out Frank. Also, might want to avoid top
> > posting in the future.
> >
> > Enric, Can you please try that other fix and see if that solves your
> > issue?
>
> I think Enric was clear that the driver does probe correctly
> (meaning that he has the fix in his tree). It is everything else
> that breaks, because none of the drivers on the platform are
> equipped to defer their own probing.
>
> I think we need to change this works right now, meaning that we can't
> blindly change the behaviour of *built-in* drivers. I'll see if I can
> come up with something quickly, but I'll otherwise take Enric patch.

Sounds fair Marc.

Btw, Enric, out of curiosity, can you try adding "fw_devlink=on" to
your kernel command line to see if it helps? It basically ensures
proper probe ordering without depending on the drivers. There are some
corner cases where it still can't work properly (too much to explain
for a late night email), but if the platforms don't have those corner
cases it'll work perfectly.

I'm fine with the revert if Marc isn't able to find a quick fix to the
drivers, but this might also fix your problem right away.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
