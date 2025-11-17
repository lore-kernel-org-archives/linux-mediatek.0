Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09967CE8D6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh/mZxgfPWyZv1h64VZtu0CEK7LJoASuTswkvfN4PYk=; b=m8Cbwgur6Phiy8CQPsf558Kaao
	VfwfkAb3mTjL7J9Yob1BzrNoGjw8be7MqKyK4ZyCPRwau+kFULxMQfGnSpYdqXgnandtQuAWc29Hx
	m7KnmnTrBHRR7BezTPZbisTVDuYmqVPWGIjoo5BlWNvfEnURbHHjf7pAeu+Vy3Fj3GwvlV49JM+ha
	Esyj4Fc2WXTssoh4a97ThclosImnPAp/kf6QX82zirlFxJsckydCJjQz4EIzqrRypWsv9xem0aivw
	loaFNGuv7W7iLpNq10Z63EI7JmjYxswM7x8w1vuAGegXIOTw7jwHXPK9jR80UBh9tBoksP9FDYxBv
	rMKWTCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Px-0000000GgFb-3H0M;
	Mon, 17 Nov 2025 18:57:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Pv-0000000GgFC-0SaX
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 18:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F13140136;
	Mon, 17 Nov 2025 18:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5727DC2BCB0;
	Mon, 17 Nov 2025 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763405851;
	bh=wCVlNbvIcWAvCxR/dOfQhDqObPNEbFnAAdyTsqKCmtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cy2msxp5qZnKbc6Hhs7/ADxabra5pCs6yhUE7Jbj7WzJ7SbkM1AZ7I+xCsmaJi7RW
	 qKbEOFZ89lLDB4WVkzG2hs4dK/EyV9KjPqelTjw7U3UaW0cfq3qtNFg9mKEXfjWszb
	 mbhLo9UqyqJiFXZQEBQV/W3VuOkjXPgTrI6srM1+7/ypNYwwYln44Xv4v+13jx0OzP
	 bGId5EPtVh2YtqMk5n54jCFdXfqsrscorS7hXbtZwTA35Zmd31Jkq7Uc+OEb/nplSH
	 8Ck3SdOc44/s5wLeuyH26XxZI2VumTk//HArdxHuX/SAeVptCpb9Y0cBzAd8wRjF9b
	 sd5HOK1e75hrA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org
Cc: rafael.j.wysocki@intel.com, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 =?utf-8?B?5aOr6aGPIOmCsQ==?= <artis.chiu@mediatek.com>,
 =?utf-8?B?6Z2W5pm6IOmrmA==?= <Johnny-cc.Kao@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v1] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
Date: Mon, 17 Nov 2025 19:57:24 +0100
Message-ID: <5940388.DvuYhMxLoT@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <CAJZ5v0jjQgoa8eRyQ-MVQW=FeOEVQP6YTsY7o49LV2wnO=xEDw@mail.gmail.com>
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAJZ5v0jjQgoa8eRyQ-MVQW=FeOEVQP6YTsY7o49LV2wnO=xEDw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_105735_212168_B25025B9 
X-CRM114-Status: GOOD (  25.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday, November 17, 2025 5:59:05 PM CET Rafael J. Wysocki wrote:
> Hi,
>=20
> On Mon, Nov 17, 2025 at 10:31=E2=80=AFAM Rose Wu <ya-jou.wu@mediatek.com>=
 wrote:
> >
> > Hi Rafael and All,
> >
> > I am reporting a regression introduced by the commit
> > 443046d1ad66607f324c604b9fbdf11266fa8aad (PM: sleep: Make suspend of
> > devices more asynchronous), which can lead to a kernel panic (data
> > abort) if a late suspend aborts.
> > The commit modifies list handling during suspend. When a device suspend
> > aborts at the "late" stage, `dpm_suspended_list` is spliced into
> > `dpm_late_early_list`.
> > This creates an imbalance. Devices on this list that had not yet
> > executed `pm_runtime_disable()` in `device_suspend_late()` are now
> > incorrectly subjected to `pm_runtime_enable()` during the subsequent
> > `device_resume_early()` sequence.
>=20
> Ah, obviously.
>=20
> Does the attached patch (that should apply on top of 6.18-rc6) help?
>=20
> If this patch doesn't apply to your kernel, making an analogous change
> to it should be straightforward enough.

That patch was incomplete because it was missing a complementary change
in device_suspend_late() to ensure that power.is_suspended will be set
for all devices with disabled runtime PM.

Please try the one below instead.

Thanks!

=2D--
=46rom: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Runtime PM should only be enabled in device_resume_early() if it has
been disabled for the given device by device_suspend_late().  Otherwise,
it may cause runtime PM callbacks to run prematurely in some cases
or cause runtime PM to be enabled for devices without runtime PM
support.  That leads to further functional issues.

Make two changes to address this problem.

=46irst, reorder device_suspend_late() to only disable runtime PM for a
device if the power.is_late_suspended flag is going to be set for it.
In all of the other cases, disabling runtime PM for the device is not
in fact necessary.

Second, make device_resume_early() only enable runtime PM for the
devices with the power.is_late_suspended flag set.

=46ixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronou=
s")
Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7eda=
affc33.camel@mediatek.com/
Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
=2D--
 drivers/base/power/main.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

=2D-- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -941,11 +941,11 @@ Run:
=20
 Skip:
 	dev->power.is_late_suspended =3D false;
+	pm_runtime_enable(dev);
=20
 Out:
 	TRACE_RESUME(error);
=20
=2D	pm_runtime_enable(dev);
 	complete_all(&dev->power.completion);
=20
 	if (error) {
@@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
 	TRACE_DEVICE(dev);
 	TRACE_SUSPEND(0);
=20
=2D	/*
=2D	 * Disable runtime PM for the device without checking if there is a
=2D	 * pending resume request for it.
=2D	 */
=2D	__pm_runtime_disable(dev, false);
=2D
 	dpm_wait_for_subordinate(dev, async);
=20
 	if (READ_ONCE(async_error))
@@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
 	if (dev->power.syscore || dev->power.direct_complete)
 		goto Complete;
=20
+	/*
+	 * Disable runtime PM for the device without checking if there is a
+	 * pending resume request for it.
+	 */
+	__pm_runtime_disable(dev, false);
+
 	if (dev->pm_domain) {
 		info =3D "late power domain ";
 		callback =3D pm_late_early_op(&dev->pm_domain->ops, state);





