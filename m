Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F79C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 06:23:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D8A2177B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 06:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OF+N7HvZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="tiw6O4XW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D8A2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7YIAHohEZigx+jnSDpWuwcqXtlOHr58SPYS33BdnQAM=; b=OF+N7HvZx+ONrgFl9SO/xpZ/2
	6hPWINdwRB4mIZZuIpASsz8qRoB8OOeKHfBrxdq/UagKe88Nlwr5O14T/9BIoedAmjVfgHOH58PEw
	ylgsuJLQ+ZnS6CKpjIv2Q+LW+Q3HpAEvyYBIjYuRPd2t0yn6HVsVuzp/4WX4qJYcXf6pQnCxGZume
	PvB3tRu3s63P2UNbmISRPKiLSPTvKjwhnn3Ei3kgdRd4jWEm0klBwMH+MUrkCEQpFgqwflkDYWyL6
	ABo1DIpELHXeV/FpKeI5Oi8CaruUIMKySF5dQuisw88h+JdeLBpBKsKg1rBY+shcx7u6qN2PUMZOg
	dBcyH2sAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3vmv-00014W-5d; Fri, 07 Aug 2020 06:23:33 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3vmr-00013C-SO
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 06:23:31 +0000
Received: by mail-pf1-x443.google.com with SMTP id s26so468329pfm.4
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjYnZO75jW+/NGMWgfsZKGwoEpWRxfcQO49H3CEjGVo=;
 b=tiw6O4XWq6TLskF079PRNCB3yu6v54OlBOgQNGuZ5nyrw6dK8b52GuWCH2diP9RaNK
 QfjP+alu9EsDItQfbi3g8/yH4LN4C0ZtUTlwX0OKDw5v/Z4oth/8HMyVBfhtjaeKFkjM
 F1QCiL+IHiqg4jJ1xADzTqteLK62kx8j9FYoHk3sOjuLLcCwGKDjEmQw4kzejV1iou0B
 H3qhv3iLWMoyRWUaYk9aA0W9xQnr5JJl6ulIn8pEoF1irPSsXi8CKE5UXAkRgmx40LqA
 P7FFdXQazZv1sDUfwnqVmFXIfQ0ANa3JXGF54HlODMIh7ZVAeZAKLMB6WbDaEyau/7U+
 +bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjYnZO75jW+/NGMWgfsZKGwoEpWRxfcQO49H3CEjGVo=;
 b=EqQsiSy930XPFqer5UcTOBWiRmBTKFHVv7LmEPetzeLD1up4FUWScefEkou3RYuZ4O
 MhCgjd7OYydGM6h40l5zmGyVxB9MIyFcreA2ei92nKdUw3rcsPafqgiS2qrAVPY0b42D
 cbZyww5DG6QAnv/rb/XESUyLKTYD0Xhk8N1iBC9uRcb5CZgytr4ObBFmtQUQvMUs2uFj
 oXFAhqpKAzHQNCRDdo0claSjZpi/mx7n620Rzfp9rptKfZKiBag1wvcCDqWXDO7a5Dhv
 YYhs2iE2SEH9TVPy40iYq3A8qPA3bpdse84JCxbx7IoBjh+H2Q5ycq4LV1vAO5OqaeIG
 /dYw==
X-Gm-Message-State: AOAM532TdTgnpzPJ6h55epQRNktJTKM0pvBMoqn9g240HI3IMwWj89yi
 miOAfbeW8E/SMCiOkD6pBXV/3UrvHZj5lZFpepi8Sg==
X-Google-Smtp-Source: ABdhPJwQIjDDxXvPIYI66seCVsO7fJloix907UN+BOcP9hYrcizvL0kHTde7padIRCE53hB/GTd7qWRLpnkcrZOrxkc=
X-Received: by 2002:a65:6381:: with SMTP id h1mr10771109pgv.0.1596781407242;
 Thu, 06 Aug 2020 23:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
 <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan>
 <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
 <20200807055842.GP61202@yoga>
In-Reply-To: <20200807055842.GP61202@yoga>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 6 Aug 2020 23:22:50 -0700
Message-ID: <CAGETcx8DNDQZ_ikjJD9pybt9-jMeb399am1k3xHOjuTFn1imTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_022329_974289_58E53FF3 
X-CRM114-Status: GOOD (  54.11  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>, CC Hwang <cc.hwang@mediatek.com>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Andy Gross <agross@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 06 Aug 19:48 PDT 2020, John Stultz wrote:
>
> > On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:
> > > > On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > > > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > > >>> <sigh>
> > > > > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > > > > >>> patch series out, as I had success with a much older version of
> > > > > > > >>> Saravana's macro magic.
> > > > > > > >>>
> > > > > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > > > > >>> building the driver in.
> > > > > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > > > > >> at the code delta.
> > > > > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > > > > to get debug output on the C630.
> > > > > > > >
> > > > > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > > > > allow me to boot again.
> > > > > > > >
> > > > > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > > > > a module or built-in.
> > > > > >
> > > > > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > > > > more grace time to load.
> > > > >
> > > > > With the risk of me reading more into this than what you're saying,
> > > > > please don't upstream anything that depend this parameter to be
> > > > > increased.
> > > > >
> > > > > Compiling any of these drivers as module should not require the user to
> > > > > pass additional kernel command line parameters in order to get their
> > > > > device to boot.
> > > >
> > > > So, ideally I agree, and Saravana's fw_devlink work should allow us to
> > > > avoid it. But the reality is that it is already required (at least in
> > > > configurations heavily using modules) to give more time for modules
> > > > loaded to resolve missing dependencies after init begins (due to
> > > > changes in the driver core to fail loading after init so that optional
> > > > dt links aren't eternally looked for). This was seen when trying to
> > > > enable the qualcom clk drivers to modules.
> > > >
> > >
> > > So to clarify what you're saying, any system that boots successfully
> > > with the default options is a sign of pure luck - regardless of being
> > > builtin or modules.
> > >
> > >
> > > And there you have my exact argument against the deferred timeout magic
> > > going on in the driver core. But as you know people insist that it's
> > > more important to be able to boot some defunct system from NFS than a
> > > properly configured one reliably.
> >
> > I'd agree, but the NFS case was in use before, and when the original
> > deferred timeout/optional link handling stuff landed no one complained
> > they were broken by it (at least at the point where it landed).
>
> I did object when this was proposed and I've objected for the last two
> years, because we keep adding more and more subsystems to follow this
> broken behavior.
>
> > Only later when we started enabling more lower-level core drivers as
> > modules did the shortened dependency resolution time start to bite
> > folks.  My attempt to set the default to be 30 seconds helped there,
> > but caused trouble and delays for the NFS case, and "don't break
> > existing users" seemed to rule, so I set the default timeout back to
> > 0.
> >
>
> I can't argue with that and I'm at loss on how to turn this around.
>
> > > > It doesn't seem necessary in this case, but I suggested it here as
> > > > I've got it enabled by default in my AOSP builds so that the
> > > > module-heavy configs for GKI boot properly (even if Saravana's
> > > > fw_devlink work is disabled).
> > > >
> > >
> > > With all due respect, that's your downstream kernel, the upstream kernel
> > > should not rely on luck, out-of-tree patches or kernel parameters.
> >
> > I agree that would be preferred. But kernel parameters are often there
> > for these sorts of cases where we can't always do the right thing.
> > As for out-of-tree patches, broken things don't get fixed until
> > out-of-tree patches are developed and upstreamed, and I know Saravana
> > is doing exactly that, and I hope his fw_devlink work helps fix it so
> > the module loading is not just a matter of luck.
> >
>
> I don't agree with this, upstream should be functional in its default
> configuration. Out-of-tree patches might be necessary to enable features
> or get the most out of the hardware, but what we have upstream should
> work.  And no, this is not always the case, but we should at least aim
> for this.
>
> > Also I think Thierry's comments in the other thread today are also
> > good ideas for ways to better handle the optional dt link handling
> > (rather than using a timeout).
> >
>
> I'll take a look at that, but to repeat what I've said many times
> before, for Qualcomm platforms there's pretty much no such thing as
> optional links.

Nicolas had suggested earlier that we could have a way to enable
fw_devlink=on in DT under the "chosen" node. I liked that idea, but
wasn't sure how easy it would be to convince DT maintainers to allow
it. If that happens, we could just set that and not have to worry
about these timeouts for QC platforms.

Not sure how easy it is to update DT in a DB 845c though. But for
cases where DT can't be updated, we'd still have the crappy timeout to
plaster over the issue.

Something like this or whatever sensible name that suggests that the
dependencies in DT are reliable enough to use for probe ordering,
deferred probe, etc. Then once that's there, we can turn on
fw_devlink=on and that'd completely skip this timeout code path (and
has a bunch of other benefits).

chosen {
        linux,reliable-dt-dependencies;
}

Just some food for thought.

Also, Thierry's idea would work, but it'll need changes to multiple
drivers. Also, I don't think it'll work for drivers that'll need to
ignore vs not ignore dependencies based on what board they are used
in. It's still better than the blind timeout though.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
