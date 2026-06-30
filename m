Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609D4C43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 21:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=; b=LOtXUCiSmurBnXEcPSMSvunmqa
	5dhhXkZxdfEtkfbib7esbY/ygrozC1JmDaiUpqlsAWKgH5E1RAoFgxpJUz3ZDrtOr9KjNO4FwO4R8
	dVNXshXUUrUxfk3CRjSzBWpfMsBPtlduNJwN/iugwMuXIFsLWSRMYVNQiN4FrBLsjH5u95k0q17a+
	yUgOo3WMYgbPWOII3U4PKP3bNyNQ2dOAPUSSgXhrmQZJ8SXSEiy1HBvHW59eCXMwt9gErXcID+VKo
	YQcfugg26nSHPBUicbHeQrwqzugrvQf3ptH65BZrC+MqT5JeI1ebRlfMkmrofLIkNxQAK6SsBSpkY
	17g2tu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefcD-00000000DNt-3aGb;
	Tue, 30 Jun 2026 21:03:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefcA-00000000DMd-2P6W
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 21:03:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3500962e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 14:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853408; cv=none;
        d=google.com; s=arc-20260327;
        b=X4XRrNnxQpNiWpSU6CpHxMdaL4M7OUwMopu/ZnWG+bO3VHIzSCGM5yvNIpsXoXdTxh
         JMeAW94gCjUzpP+XGFFZ+dOdpu+ujKAlPgW2aA2BLArSyaGl2zrhW8Pee51oX346mbSy
         zVuFqPzj48mw/SknsQi/JVpf/cEdqzezWu8hwpctTy40yE0S7GCmEvkedoTcaARa9fLZ
         j33As6bi8H4JLXNES/US2YKrjynUrwAyXb60aIr8xJpr1cBro5FcFELXSjtCJdbOQXxz
         oqZ4KgJx7VRoLcZDIoyMUXcEDX3cwHawCdT0PmguEmNU4F6tVTafqA5LdGDqg/jUS61L
         +lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        fh=2vMyJcwN7Vy0PLs2fvyGcqHvmHyeCtQ4GKW2RyYpkn4=;
        b=mBnoqqDbCjALvtALaBC6tUdJ9R7NZoCOlZkkji74+LPTsI14HSlwTLFPWfQVM545+f
         +ZO0w+wBdIg3FWnpLTnEtVIKO7w0UlM8lZQizRgHZtW64/tLkkcwzrhBYOtiYIY5v83K
         toPHgc236NrXZZW31ONcSH8cH/V0G9hIFfBLpQjfjBYfN7hZnNbphmWqB6WByIz2y3se
         CR99GHwBxq94G8xZrIiIVLRC7bAI+J28eZ9ntQWMs34vHBNgzzTQ7hKvWlBd8GawCQmo
         GkGVw0MIy2Vn0/OWrZ1+K4+ECcwgCroumTIwHFOfdgxfAyxFxyYzVbyHRZp2qsTnSP5+
         tzoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853408; x=1783458208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=sNvxy3mlrxmGLBcEnW13bOdxYrZ/FNKoETClAf5cfB4JANT8s/9UmQ2Y9KgQsmVDF8
         lsVMT7xcLwtqwyVvOV2udAGGTtkLiJfkPtuQPfYpbaRNxFQoG0mX6XRPCv6hjXdH9+c3
         pjlfHTNACB35v0nS5aOcqZOBYtG1/xbaUqSmCIHF3t4ybW0/EaHZmsV3MyHB76SZs9+z
         4Zwhbuz931pB/xsp6U4JtRFMwcv2iA9xzpM8L/QzLgALQSMtxfIa1w64I0f/TClJn/wm
         vL6UnIrIpVC+g/TkeNFIALGZeX+Kkj7mo0LuAqdYW1f8X0zFQLaqlE3HJvS7Y9cvhN0S
         rPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853408; x=1783458208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=P7oVJDvKG+kpWReXNKxUXCS4GgOMZTgdDah2KDIgDsRB+9oIGB7SSjbWL0N4T7FQ0X
         lGF3VOdM6EvXc8daLS5/ifyoo+h5wPe7Aj6v6aRUtYYc9euYLuIitHbsuoohrD33mscn
         tBwnu3zqGPQEMdSec+rz2xbMmbzpK7p4lxbzDkV0F7OVclhHh5xHYgmzzJiWwrhDlnbr
         vFrHw4Af2nRqFaGGN1WOlFzzZGyI3S2WcJqDSDSoQhSfM7t6WL3lUJZCplwCXLwHdYgv
         yUw4Jsc/95i/MXwx3OHoi4HE0SWTzJyf7PCA48QVAR5PIhWrYZbMR6f2LqzdK7Ifw8Vh
         fYuA==
X-Forwarded-Encrypted: i=1; AHgh+RoYfS+jtqLv958akKmegFvu6LuoQ7MnxYbZk1Ity3JYUZRIP/1XBMCvSilR2EU7RpKKhTKypaKYHnnSPqmT1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjFI8NDeDjbV0oqsgEVo92v+/craNFRfv6XJpgFYDZrSYDnrz0
	aMbOcc7Gr3Slpz/Yyc4enWlLdXGmvLu70IcaycBKnTnATAYpIYg7YHDlmMhapY/rlX8jVPhxF10
	+Ld8sGcsNKKbYEgmzIgx7GhpQ0u7T16E=
X-Gm-Gg: AfdE7cluIWyJ/oLbQWQGRizzoKtKfHobNTEi4f8XKaHHs2B6KxiFA8uXOpnfex11mNh
	0rRWb6LRDlzadNUVc07Xkts3OElfiq/1jJ215/rkfY2svUzZv75DT0DBOmoZmGNwg7AVym3BsEi
	+vf3pHmsu+l5VeRyv4noFtfwdvL2M8Xzz7D0XLJmqCKlx89z9O04g69qoXj2iaWos+hJqVLable
	hcwgxgvM2SceNkUB1OLryGZbnMhDfIY+qDH0OYZj3PonyggClJ5JOfHitPFH26nmPGe9WmGOgJ3
	F09zod6hWLc6AEs0CgTes0ZP189wVjPmA+5B3HBAZLtpOWl9l8TK3KdD6SjguyWoVM1JW1Z8UG8
	YEQ2BFf0s6U/wYuBWEt5eJpn46PU=
X-Received: by 2002:a05:6512:618c:b0:5ae:a9ec:9fc4 with SMTP id
 2adb3069b0e04-5aebdbc70a5mr1360054e87.63.1782853408064; Tue, 30 Jun 2026
 14:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260427051746.954704-1-rosenp@gmail.com> <ajRmlyx_AEGybykL@soda.int.kasm.eu>
 <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
 <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu> <DJCNDEE8JMPL.1DL49X1EUDFCE@gmail.com>
 <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
In-Reply-To: <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 30 Jun 2026 14:03:13 -0700
X-Gm-Features: AVVi8CdKSeWNxVJXoQWTYXgaetJpdvlliSZ-GmhRr-ByVwdKSQxkvdocgc7yH_E
Message-ID: <CAKxU2N9hw6bUNA+rZC_jfZVzi7bMXe96jzLWdL9F3P4=rYnmUQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Tobias Klausmann <klausman@schwarzvogel.de>, Klara Modin <klarasmodin@gmail.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140330_706686_AA24E83D 
X-CRM114-Status: GOOD (  25.64  )
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

On Tue, Jun 30, 2026 at 5:18=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 6/19/26 03:50, Rosen Penev wrote:
> > On Thu Jun 18, 2026 at 4:51 PM PDT, Klara Modin wrote:
> >> On 2026-06-18 16:01:45 -0700, Rosen Penev wrote:
> >>> On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmai=
l.com> wrote:
> >>>> On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> >>>>> Check return value instead of is_valid_ether_addr. The latter is ha=
ndled
> >>>>> by the former.
> >>>>>
> >>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>>>> [...]
> >>>>>>>> Recently I have started to see randomized MAC-addresses on my
> x86 laptop
> >>>> with a MT7922 and the above message printed in the kernel log. I hav=
e
> >>>> CONFIG_OF turned on, but since this is an ACPI system the device is =
not
> >>>> described by any device tree and the earlier of_get_mac_address() li=
kely
> >>>> fails with -ENODEV. Looking at the !CONFIG_OF stub for
> >>>> of_get_mac_address it always returns -ENODEV, meaning this will alwa=
ys
> >>>> randomize the mac in that case too.
> >>
> >>> IIRC, the normal device_get_mac_address supports nvmem now. Does that
> >>> fix your use case?
> >>
> >> I tried this:
> >> [...]
> >> but I still get a random MAC.
> > Then the original patch should be reverted. Unfortunate that it doesn't
> > workq
>
> Happens, no worries, but seems nobody submitted such a revert yet since
> you posted that. Unless I'm missing something -- if so, please do not
> hesitate to tell me!
>
> But if no revert is in the works, could you please submit one, given
> that it was your change that cause the problem?
https://lore.kernel.org/linux-wireless/20260630210215.400379-1-rosenp@gmail=
.com/T/#u
>
> Side note: Tobias (now CCed) ran into the same problem, too:
> https://lore.kernel.org/all/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.lo=
cal/
>
> Makes me wonder if more people are affected by this and if we should try
> to mainline the revert rather sooner than later.
>
> Ciao, Thorsten
>
> >>>>
> >>>> Reverting this patch fixes the issue and the correct MAC address is
> >>>> used. I'm not sure if there is any case where of_get_mac_addres() co=
uld
> >>>> fail in a way that results in a valid MAC address but it seems unlik=
ely
> >>>> to me.
> >>>>
> >>>> Regards,
> >>>> Klara Modin
> >
> >
>

