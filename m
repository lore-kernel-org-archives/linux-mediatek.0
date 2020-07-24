Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28A2C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 09:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA8C20737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 09:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G4LZd1k2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA8C20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gkxrGqnWEqWOg8JZM70NaJjk3jVc5KrUH5jlovcRoXU=; b=G4LZd1k2RT5ZS7G8eyS2LsUWm
	bMFBR8hytkSRcCr5YCnmmXIsac7gC9Wcua+Io428wUWCMZsWjsC7ibRIjgNWsoUF5Ju4/ceGqX7id
	hAUKN00/ZCNWpmpGXDVN/nnoE5VSE73/4GdTY94QK88U/jiyIOuqDZW6dTLf60degIssH/O84jkx7
	NIvkFcy2dlkbrvk7KL/2Rodg+CreHrHyAEVtLctEp4n39peTi8DF5lnBSEhpsX6a1N1ggIoprGRfQ
	SqqmQqUoEdJBxTm4sHaNFQ/1nANWGGS9b1ghQOOWINUVT/cPeWPOTpBpJbAHSAqsN+F3bo46qM3nq
	aeOhoL5fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyuSh-0005cq-OI; Fri, 24 Jul 2020 09:57:55 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyuSc-0005bk-Qm; Fri, 24 Jul 2020 09:57:51 +0000
Received: by mail-oi1-f193.google.com with SMTP id j11so7527318oiw.12;
 Fri, 24 Jul 2020 02:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfdi8y7XT/GLwjnF+qwRBjmFZVJUF6UVVDZU9wm5TaQ=;
 b=XJzDxBI56ZQb45xXpSVbFxhLn5WzcgUKO1TG1JD1KlByc+rUxjxW/o7z+R8hX4bG0Y
 H5VuTizKqz+zdwDS2WPRIzaT+spe5L2wq4b71XItWu7vNAx7bga9AEI/6NzVwbSoXleV
 uTpM2VaCE0RbstgdFRxuz0P+RhpblB7pqb7mAP3xBezUREvws57TKbPhC2c3hHyjeaGo
 9Ya6zT7vIY9M2n81VNiyOOsQLgcvb26XUYoEvMhzfhcduoY36dUKh6mf4p+0o2gTV6MR
 d+uNXOyypCIUjDCeHe5thHDgf7Q3zYoaT+ra+7lL7zSi51JzrcrnI31ewTF1apzE8XcU
 zoAw==
X-Gm-Message-State: AOAM531+bwLT9VFwrgtC4tEP26CTXxGOzvw2/GPrZhxoQ9PaEs/xsjYh
 Hrfyt3JsuY3qsKxMdhThakNDCH/NaRZo+OQpgrA=
X-Google-Smtp-Source: ABdhPJwmw50/j/jb4uqGVrXM5kRvrFzs5LGQOnnkqUtcmCKjUVWpuSyy9Ti+bMSPaa4DokJrmiScLfe79eQwwUT3sQc=
X-Received: by 2002:a05:6808:34e:: with SMTP id
 j14mr7576095oie.110.1595584668419; 
 Fri, 24 Jul 2020 02:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22> <1595233294.8055.0.camel@mtkswgap22>
 <20200723190724.GA1339461@google.com>
In-Reply-To: <20200723190724.GA1339461@google.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 24 Jul 2020 11:57:37 +0200
Message-ID: <CAJZ5v0g_14D-tyWFEZ9eOJC=GmzR-31iAAPff=Ch8KjFyK2wfw@mail.gmail.com>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
To: Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_055750_895034_8FEC5BDF 
X-CRM114-Status: GOOD (  29.33  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 9:07 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Mon, Jul 20, 2020 at 04:21:34PM +0800, Neal Liu wrote:
> > Gentle ping on this patch.
> >
> >
> > On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> > > On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > > > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
> > > > >
> > > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > > changes to the original control flow graph of a compiled binary,
> > > > > making it significantly harder to perform such attacks.
> > > > >
> > > > > init_state_node() assign same function callback to different
> > > > > function pointer declarations.
> > > > >
> > > > > static int init_state_node(struct cpuidle_state *idle_state,
> > > > >                            const struct of_device_id *matches,
> > > > >                            struct device_node *state_node) { ...
> > > > >         idle_state->enter = match_id->data; ...
> > > > >         idle_state->enter_s2idle = match_id->data; }
> > > > >
> > > > > Function declarations:
> > > > >
> > > > > struct cpuidle_state { ...
> > > > >         int (*enter) (struct cpuidle_device *dev,
> > > > >                       struct cpuidle_driver *drv,
> > > > >                       int index);
> > > > >
> > > > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > > > >                               struct cpuidle_driver *drv,
> > > > >                               int index); };
> > > > >
> > > > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > > > failed since they use same callee.
> > > >
> > > > Can you please explain this in a bit more detail?
> > > >
> > > > As it stands, I don't understand the problem statement enough to apply
> > > > the patch.
> > > >
> > >
> > > Okay, Let's me try to explain more details.
> > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > changes to the original control flow graph of a compiled binary, making
> > > it significantly harder to perform such attacks.
> > >
> > > There are multiple control flow instructions that could be manipulated
> > > by the attacker and subvert control flow. The target instructions that
> > > use data to determine the actual destination.
> > > - indirect jump
> > > - indirect call
> > > - return
> > >
> > > In this case, function prototype between caller and callee are mismatch.
> > > Caller: (type A)funcA
> > > Callee: (type A)funcB
> > > Callee: (type C)funcC
> > >
> > > funcA calls funcB -> no problem
> > > funcA calls funcC -> CFI check failed
> > >
> > > That's why we try to align function prototype.
> > > Please feel free to feedback if you have any questions.
>
> I think you should include a better explanation in the commit message.
> Perhaps something like this?
>
>   init_state_node assigns the same callback function to both enter and
>   enter_s2idle despite mismatching function types, which trips indirect
>   call checking with Control-Flow Integrity (CFI).
>
> > > > > Align function prototype of enter() since it needs return value for
> > > > > some use cases. The return value of enter_s2idle() is no
> > > > > need currently.
> > > >
> > > > So last time I requested you to document why ->enter_s2idle needs to
> > > > return an int in the code, which has not been done.  Please do that.
>
> Rafael, are you happy with the commit message documenting the reason,
> or would you prefer to also add a comment before enter_s2idle?

As I said before, it would be good to have a comment in the code as
well or people will be wondering why it is necessary to return
anything from that callback, because its return value is never used.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
