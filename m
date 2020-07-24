Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262EC433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 10:25:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EEAC206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 10:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EnjZJFww";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T4Vc6ETY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EEAC206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uAp3Bupe0d3X4CV4pKAZaKJDOAwndksEqVeZovDOeXo=; b=EnjZJFwwlzsy1OuIvcDt6UdTG
	DcIgZLzqfk0wb0Uzo9OYX9wHV4YLCGlFyhG6v7N9+SNe974E6IyBaURTsJSgtdECwtigSotuYo05l
	7K0jLSvEkDrEFmts4jbMtLmTYP76gg0LGjXcjU+PhCQCs2v6m8JPH9M0Cb8MFkqIb9AyVwx3OB5ep
	bmZ8Rj5ZPUkcTfx3m1AqDYLMfxhYz0QrS9D7LSC+1c4+pIM71T5Lm/Hj/Vv/xTcrV+GgTZ3GBf0nD
	NY+KRpu8R86xEh/vQfcPQjD/Apzzj/jwLvj1JW4jWqdLjav2zF3vfn1tK/gHf9ECJHAf2mxPKfpVj
	Nadifu2lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyusv-0004I9-0i; Fri, 24 Jul 2020 10:25:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyuss-0004Gn-HQ; Fri, 24 Jul 2020 10:24:59 +0000
X-UUID: 37f2fbbed1444ab58557fbc44221d74b-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QxNgObDGJzQxDLrTGZIVOSiVP4T6qaCHpTNaWSH+6v0=; 
 b=T4Vc6ETYgYl2HSKtiO14Zo86gMkawoJLP9w6Grp+FKu5Wyn3/T5N80+BOzjV7vw4E7mg3VuEKD4jXUCcaIe+5Tm2525Q0yh6NPNDBcNjXiuZQ7ALGY5TlQKC8Yx5mLi6B2MNTmz5UVGaBHM7J3p6VIRMpkRLzuHT/RNut3/sbsQ=;
X-UUID: 37f2fbbed1444ab58557fbc44221d74b-20200724
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1981341024; Fri, 24 Jul 2020 02:24:45 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 03:24:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 18:24:47 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 18:24:49 +0800
Message-ID: <1595586289.14121.5.camel@mtkswgap22>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 24 Jul 2020 18:24:49 +0800
In-Reply-To: <CAJZ5v0g_14D-tyWFEZ9eOJC=GmzR-31iAAPff=Ch8KjFyK2wfw@mail.gmail.com>
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22> <1595233294.8055.0.camel@mtkswgap22>
 <20200723190724.GA1339461@google.com>
 <CAJZ5v0g_14D-tyWFEZ9eOJC=GmzR-31iAAPff=Ch8KjFyK2wfw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 525C25BBD1A36A92A548897BC52B0D2A9C1552ADE0B6EEB53F27D34A63DF52742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_062458_742431_F3E7D55D 
X-CRM114-Status: GOOD (  33.45  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC..." <linux-mediatek@lists.infradead.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-24 at 11:57 +0200, Rafael J. Wysocki wrote:
> On Thu, Jul 23, 2020 at 9:07 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > On Mon, Jul 20, 2020 at 04:21:34PM +0800, Neal Liu wrote:
> > > Gentle ping on this patch.
> > >
> > >
> > > On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> > > > On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > > > > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
> > > > > >
> > > > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > > > changes to the original control flow graph of a compiled binary,
> > > > > > making it significantly harder to perform such attacks.
> > > > > >
> > > > > > init_state_node() assign same function callback to different
> > > > > > function pointer declarations.
> > > > > >
> > > > > > static int init_state_node(struct cpuidle_state *idle_state,
> > > > > >                            const struct of_device_id *matches,
> > > > > >                            struct device_node *state_node) { ...
> > > > > >         idle_state->enter = match_id->data; ...
> > > > > >         idle_state->enter_s2idle = match_id->data; }
> > > > > >
> > > > > > Function declarations:
> > > > > >
> > > > > > struct cpuidle_state { ...
> > > > > >         int (*enter) (struct cpuidle_device *dev,
> > > > > >                       struct cpuidle_driver *drv,
> > > > > >                       int index);
> > > > > >
> > > > > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > > > > >                               struct cpuidle_driver *drv,
> > > > > >                               int index); };
> > > > > >
> > > > > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > > > > failed since they use same callee.
> > > > >
> > > > > Can you please explain this in a bit more detail?
> > > > >
> > > > > As it stands, I don't understand the problem statement enough to apply
> > > > > the patch.
> > > > >
> > > >
> > > > Okay, Let's me try to explain more details.
> > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > changes to the original control flow graph of a compiled binary, making
> > > > it significantly harder to perform such attacks.
> > > >
> > > > There are multiple control flow instructions that could be manipulated
> > > > by the attacker and subvert control flow. The target instructions that
> > > > use data to determine the actual destination.
> > > > - indirect jump
> > > > - indirect call
> > > > - return
> > > >
> > > > In this case, function prototype between caller and callee are mismatch.
> > > > Caller: (type A)funcA
> > > > Callee: (type A)funcB
> > > > Callee: (type C)funcC
> > > >
> > > > funcA calls funcB -> no problem
> > > > funcA calls funcC -> CFI check failed
> > > >
> > > > That's why we try to align function prototype.
> > > > Please feel free to feedback if you have any questions.
> >
> > I think you should include a better explanation in the commit message.
> > Perhaps something like this?
> >
> >   init_state_node assigns the same callback function to both enter and
> >   enter_s2idle despite mismatching function types, which trips indirect
> >   call checking with Control-Flow Integrity (CFI).
> >
> > > > > > Align function prototype of enter() since it needs return value for
> > > > > > some use cases. The return value of enter_s2idle() is no
> > > > > > need currently.
> > > > >
> > > > > So last time I requested you to document why ->enter_s2idle needs to
> > > > > return an int in the code, which has not been done.  Please do that.
> >
> > Rafael, are you happy with the commit message documenting the reason,
> > or would you prefer to also add a comment before enter_s2idle?
> 
> As I said before, it would be good to have a comment in the code as
> well or people will be wondering why it is necessary to return
> anything from that callback, because its return value is never used.
> 
> Thanks!

Is it okay to add these comments before enter_s2idle?

/*
 * Align function type since init_state_node assigns the same callback
 * function to both enter and enter_s2idle despite mismatching function
 * types, which trips indirect call checking with Control-Flow Integrity
 * (CFI).
 */
int (*enter_s2idle)(struct cpuidle_device *dev,
		    struct cpuidle_driver *drv,
		    int index);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
