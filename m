Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5167BC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:20:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087FC20771
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 10:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6CIhiIy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjbbsi1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087FC20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQDUKxonls/3s2Ft++RLaxm2VyIa/b48Vyw6rmLbEtY=; b=M6CIhiIyOOYnAZqCwaHFBzWIT
	KRo0QzDSI0GHrjf+/bOSXx/yWc7QZOfh/sh/TEFxpFxo5TgXJ+yV3bRwfL+IAzwoRlOXJdd5XIw4O
	+MAYlGOQTyMm6ZwxZhPYI0qrHY+lhssn9BRC5nsqG9tU1jOsxDJrBQjvcE7dYA8m0GENXEF1bCEXh
	W6YCJ1u4bvzOIdgWKZxGAoIEplZs711KYBk9OhGkWEfTCdAgEOjWSZK0bDrwE7eDWSKJh3hkxF+Ai
	GYL+0TGPRy+qGtSh5OZk45YOesvdLoe2BRzP2aEetohy9V1fdHttFPmPgb92teRpzE6w6/baIT6MT
	KWrCPZwuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHlb5-0005pf-HP; Mon, 14 Sep 2020 10:20:31 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHlb2-0005og-Mi
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 10:20:29 +0000
Received: by mail-ed1-x542.google.com with SMTP id b12so16968557edz.11
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 03:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RoEDgYihJB01PzODFzv542pnHyd2X+jx2GeNGs8P7lM=;
 b=Cjbbsi1oaU+n4Sw3Yn6dcLNg/l1FbrB3FTZTu0iKHy7rzjjM+/0r10+OCfugIUo7ut
 lB1iq5C51oGl6OQXI+BblM0EN/71Cl2RmETQIlZdO6EblNqB28jY74qYWCxWBrT3tWA1
 8I3dJKkX6fjz5AKlY8WeDDuSNUWREPrCqkqgRH51KfkvA8L4yzy92rwEqdQUNo4Tmc8H
 5vY4LfiakvXqUp2z/gPpMiXv6h6CKbiNGJBcd3uTMLtDFn4GkWtQcKz2qB+bjdu1k8B4
 xyJ6Aiqm42wFZNdIXsRmXLHCbCWat2aCGI7RJ5ka+frSkn+k2Mzv8+6WD09ujdRpduZ/
 ZjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RoEDgYihJB01PzODFzv542pnHyd2X+jx2GeNGs8P7lM=;
 b=Ln/8kr40T5iHtrqrlnq1Z+hWnN2rvi9gei3am2brYj4WWdzDcjY2fFY7fR1GTki1IG
 Ov5S8GM+7uShrxFW+9XMO0zsSDtSVfTw0Tg+LF821QwrWSP641x0XlENuIob7RV8J1Ts
 8vHgf4wv2E7K5KEsEXUw1own0kRubyer+eBOuC+f7OTSOPvwnW0ppn/Y/g+1e5nV80QZ
 KE5f4tbDoPQg+wnnzuPlp3+cXvsmSSsUIa/U8ZxSIZH2rkyKU354wKkC1mNHIqjky6y4
 Am7wdYjiZ4BLWqwsL2/IHfMN9btIwcG1/X16h9HamBHJ6d1N9Yo7SrKc3guvckT+5igT
 QDTg==
X-Gm-Message-State: AOAM5323eucvvPxXqISzSuOp7hacDzOMaBAuyt/c2kXrs7EG49Ewhpir
 oZEe9NzNvI3xK7kMHUqwYuK97bAI9eRVHGjd
X-Google-Smtp-Source: ABdhPJxkCsOJ3JKr74kFh0H+el/JjP4ICfMvMDw8NI5RaCiYgalOH6Eo1PpTETvsUheo14HIp3yeHg==
X-Received: by 2002:aa7:c2d6:: with SMTP id m22mr16222884edp.311.1600078827259; 
 Mon, 14 Sep 2020 03:20:27 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id b6sm8993603eds.46.2020.09.14.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 03:20:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 12:20:24 +0200 (CEST)
X-X-Sender: lukas@felia
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
Message-ID: <alpine.DEB.2.21.2009141208200.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_062028_761532_6EA8BB95 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Mon, 14 Sep 2020, Matthias Brugger wrote:

> 
> 
> On 14/09/2020 07:31, Lukas Bulwahn wrote:
> > Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> > support") does not mention that linux-mediatek@lists.infradead.org is
> > moderated for non-subscribers, but the other eight entries for
> > linux-mediatek@lists.infradead.org do.
> > 
> > Adjust this entry to be consistent with all others.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Maybe rephrase the commit message to something like:
> "Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe
> host controller entry, as the list actually is moderated."
> 
> Anyway:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> > ---
> > applies cleanly on v5.9-rc5 and next-20200911
> > 
> > Ryder, please ack.
> > 
> > Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> > 
> > This patch submission will also show me if linux-mediatek is moderated or
> > not. I have not subscribed to linux-mediatek and if it shows up quickly in
> > the archive, the list is probably not moderated; and if it takes longer, it
> > is moderated, and hence, validating the patch.
> 
> I can affirm the list is moderated :)
>

Hmm, do we mean the same "moderation" here?

I believe a mailing list with the remark "moderated for non-subscribers" 
means that a mail from an address that has not subscribed to the mailing 
list is put on hold and needs to be manually permitted to be seen on the 
mailing list.

Matthias, is that also your understanding of "moderated for 
non-subscribers" for your Reviewed-by tag?

I am not subscribed to linux-mediatek. When I sent an email to the list, 
it showed up really seconds later in the lore.kernel.org of the 
linux-mediatek public-inbox repository. So, either it was delivered 
quickly as it is not moderated or my check with lore.kernel.org is wrong, 
e.g., mails show up in the lore.kernel.org archive, even they were not
yet permitted on the actual list.


Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
