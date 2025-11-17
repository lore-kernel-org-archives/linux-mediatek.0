Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8772CEACEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93mX6LyrU7FKGKCqSID9rnxmcqCKQzIrwXS58F3/iKk=; b=QTka1pYy355Xw5NB9r5rRIQa97
	JtNdOU3cT03HhrptkOtpspjJBOzN9hX3VY1Lzsk3s8YmumoyLjNp8MW/hhwi2Zgr9ajPNldWqP+p1
	A90W9hcSuSvFHoQlYRsyMDfABroMIi05fP8R2uXvSAPusHJbnDWQLrG8WX18+JagJEj7D7D/E+fAd
	oX+bzPL+LWNjqlbvJJmI2LtQCi7ssl69IERdMpApH+pVMdgcrvOeApftnNDLIhS2lFXSuHu4Fw3cY
	pr2gK+KhP+bxSewE5VpiVQ71JMu7mD6d19RcXgxqwuH8QkwfeO5WsznPtqg9uEjbdGUHPM50T+CO4
	iQnMW7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ZW-0000000GRWN-1oIU;
	Mon, 17 Nov 2025 16:59:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ZU-0000000GRWG-2iKI
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 16:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4048601EA
	for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 16:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554FAC116B1
	for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398759;
	bh=93mX6LyrU7FKGKCqSID9rnxmcqCKQzIrwXS58F3/iKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uG9k1vQUIYIj8NkEmso89WrQBdqbgKNiCh5SeIJYlPX4hhznnX8Pzq3m3D4Aw4OYQ
	 CbFCtg1BcMPItsU/ZtaGXHoVhjPi0Oh7Kjvkc+XagoDRsA6gYd9khvcFssAXRCTnM5
	 CkrlGG63LU+JZz80F/d9mDSTRL/Lt/6/Uf4bEFR7HZZK8UVQpU0yxVu9sxE7S43JRU
	 YIrNob892VlQXT3N4+a7gc+ytC6Y/m0HaGKbS34AxsfVOmH1lDL5hp5hs2Y43SF4Zc
	 HgVac/MNBXU5ysA5stdJUj55M6+n2MDz5MQKqjsVzJsnXUpDm6RrpBEkro6gUIHPaJ
	 BqukkF6h1SsHA==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c704bf2d9eso2072592a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 08:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUsO6mipW654tHf6i32ydU2czBywfXNh8F+4yMDy2cpJ19EuRiBEtv2C4ANA1xxNLZCIatfM4oO5WxhwuW8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5+O1Cz4/Ess416qUKwIlmUiRigCHibLkhz4NyWaIZ6+1QVhqZ
	7m+NfKPydgginuZovVwIfmcOah0FH+cENaRaC8/0V4x111FTn+maNz+jz5yCF2SNN9aS9sIZz+r
	7OhdWOdlUGWRqIgiewsAp+0lSUzRsdAE=
X-Google-Smtp-Source: AGHT+IFL1ZDv2aBeByiSLgu1dLbV/+NXA+IU5Odv2Kcv77dZO2WOhf8PlVCYvXe9ErsFtBmVhEY8IKFtMBzG6acJspc=
X-Received: by 2002:a05:6808:8911:20b0:450:ba5b:a471 with SMTP id
 5614622812f47-450ba5baa89mr2571306b6e.47.1763398758551; Mon, 17 Nov 2025
 08:59:18 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
In-Reply-To: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Nov 2025 17:59:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jjQgoa8eRyQ-MVQW=FeOEVQP6YTsY7o49LV2wnO=xEDw@mail.gmail.com>
X-Gm-Features: AWmQ_bm0qe2w4NDBvcR9JB5pAEyOB0erZKyK2rHvLR2DAk7RlbIToMk8KF_iISk
Message-ID: <CAJZ5v0jjQgoa8eRyQ-MVQW=FeOEVQP6YTsY7o49LV2wnO=xEDw@mail.gmail.com>
Subject: Re: [REGRESSION] PM / sleep: Unbalanced suspend/resume on late abort
 causes data abort
To: Rose Wu <ya-jou.wu@mediatek.com>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org, 
	regressions@lists.linux.dev, saravanak@google.com, len.brown@intel.com, 
	pavel@kernel.org, linux-kernel@vger.kernel.org, 
	wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?5aOr6aGPIOmCsQ==?= <artis.chiu@mediatek.com>, 
	=?UTF-8?B?6Z2W5pm6IOmrmA==?= <Johnny-cc.Kao@mediatek.com>
Content-Type: multipart/mixed; boundary="00000000000099f13d0643cd4473"
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

--00000000000099f13d0643cd4473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 17, 2025 at 10:31=E2=80=AFAM Rose Wu <ya-jou.wu@mediatek.com> w=
rote:
>
> Hi Rafael and All,
>
> I am reporting a regression introduced by the commit
> 443046d1ad66607f324c604b9fbdf11266fa8aad (PM: sleep: Make suspend of
> devices more asynchronous), which can lead to a kernel panic (data
> abort) if a late suspend aborts.
> The commit modifies list handling during suspend. When a device suspend
> aborts at the "late" stage, `dpm_suspended_list` is spliced into
> `dpm_late_early_list`.
> This creates an imbalance. Devices on this list that had not yet
> executed `pm_runtime_disable()` in `device_suspend_late()` are now
> incorrectly subjected to `pm_runtime_enable()` during the subsequent
> `device_resume_early()` sequence.

Ah, obviously.

Does the attached patch (that should apply on top of 6.18-rc6) help?

If this patch doesn't apply to your kernel, making an analogous change
to it should be straightforward enough.

--00000000000099f13d0643cd4473
Content-Type: text/x-patch; charset="US-ASCII"; name="pm-sleep-fix-early-resume.patch"
Content-Disposition: attachment; filename="pm-sleep-fix-early-resume.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mi3dy7800>
X-Attachment-Id: f_mi3dy7800

LS0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIvbWFpbi5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgotLS0gYS9kcml2ZXJzL2Jhc2UvcG93ZXIv
bWFpbi5jCisrKyBiL2RyaXZlcnMvYmFzZS9wb3dlci9tYWluLmMKQEAgLTk0MSwxMSArOTQxLDEx
IEBAIFJ1bjoKIAogU2tpcDoKIAlkZXYtPnBvd2VyLmlzX2xhdGVfc3VzcGVuZGVkID0gZmFsc2U7
CisJcG1fcnVudGltZV9lbmFibGUoZGV2KTsKIAogT3V0OgogCVRSQUNFX1JFU1VNRShlcnJvcik7
CiAKLQlwbV9ydW50aW1lX2VuYWJsZShkZXYpOwogCWNvbXBsZXRlX2FsbCgmZGV2LT5wb3dlci5j
b21wbGV0aW9uKTsKIAogCWlmIChlcnJvcikgewo=
--00000000000099f13d0643cd4473--

