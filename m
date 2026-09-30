Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CF4CA5FC7
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/oaydNeB7KKez2Jzp2jljrx95qkFNgazQFseegu3Nw=; b=TXvahm4x5qAvGI/8DmU4Pxkm0Q
	dFdVohu5Gz9ug6BnE/cHcxIKsWTbfBjM+7mAl9iDJg7fy5qanPhcFxty3zvjF3ocsIq+k3O0tEFiA
	aNnTkGwEmuPY3VpMxCqPZ5Bt4EaXR2FM9qg+TIAjAedUtw+0flfxWGby3SNDiIrUiy7+dG4INcKcc
	Z34O8hZ6AgU3uL9xtVk2qaQSBhBJnotyriU0QVeKoROZ1DgKPUZEde2KhYoPYipo26bW43hTBX6bP
	AVClC2MBMIbJE/MpJakj22tQM809yM/nlyuko7oyDbp+Wkr8MG+PUtAQbvVOjjIXGLKlO+nLlAN3U
	IkD0SSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxUx-00000006jul-1gbh;
	Wed, 30 Sep 2026 16:49:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxUu-00000006jta-3aZr
	for linux-mediatek@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=m/oaydNeB7KKez2Jzp2jljrx95qkFNgazQFseegu3Nw=; b=G7XbZ9886q2yXMrk82xv0djEyR
	13VFhDemsTWYmTaplAUCwxJPbi6AXeldrws8qhDshN+grodYkUbUcycRRe/kop4kLC+fusks5fg0L
	8p/kejKqFr76PraLqrMG8r5ANKb2WzjbISsmp4rxPM2Xdvvar5QgAQA0ll9PuMLBrD2VAmgHZEQzE
	9GvtyiH0Rj1mpSPQK1pMcrYlrRidJ44V9piv9vmFcGidWok7XVW4r0Yb8/vfzblNW/dacvXUADbZm
	PJ9/vcIap4uBGxoOwnXYvwAF36dw+ekxvZenGoI0wCBMwwrpVEL2W7Q3nhpFfbp5mSY9n0T19KTRc
	uH8flGMA==;
Received: from mail-qv2-x0c.google.com ([2607:f8b0:4864:33::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBxUs-000000046Ay-0ssY
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 16:49:35 +0000
Received: by mail-qv2-x0c.google.com with SMTP id 6a1803df08f44-917a8bbbbf7so846236d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 09:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786971; cv=none;
        d=google.com; s=arc-20260327;
        b=GXpLnao2/WueFFel4C7bHuoghDz/lOic37Qi2KRecItOpDCGZIaXLOMfz1oLa1336d
         0HoFUrw+/pRRBa0fG99LMx4doTXEEjagKYsHgHx17RuvrudBH3DW5QwdTrlCwSnwc+/m
         yqu8PkGFSLGjtjADMMp8myEskAf72tah33X5ebwLFMTg+Wxfcszr2A6ZRiP8huo6FBEG
         UTD7ppOvxaPb9kB6XKMCDenT0Tdu22miNeOaYqgf/oevtmEjbWuSL1CXxF3C/9prgsew
         xlQiiTRU8S5HxxCL6DCXGZALFGwqUyLhhOLs8mT331Nmzg3sinTA9V8MoKK0Yq7jefbV
         yaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=m/oaydNeB7KKez2Jzp2jljrx95qkFNgazQFseegu3Nw=;
        fh=4+4suC85h9Wu6LAQSL7brzHaD5yDIRvQO2/4a7NEc1Q=;
        b=G1T2CA9tRChhaz2kc5ipNt6Xdp/mlxMmiuKHpfi3AThI6rRvfYoXx31qr1rD9huMde
         3KiX+q16nvVnCw5mrpx/qxLr/3DiZ4jhuxlkdUtYqk5sR0sR8ZZ/zqxa2EdkjSWBrCAQ
         UONot+kPJJ0Vi4iIn8/EOP326dVvKx+GBaUyYk5s+VEGJAfC+k5SRARzNZzatCPShiW9
         URqeke5ZpwbrrXgZrr7Ce3rLBXeU7C0dmlDbVPObSBsRzVo4R/EbLDGrhRK+o17H+Ato
         SPihktqzPcc3KDp46japYrXzFOZF2NAIPcdNlkz4iCvX4NCVwZ3q6WQ6BYal/hXSpygD
         MjcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790786971; x=1791391771; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/oaydNeB7KKez2Jzp2jljrx95qkFNgazQFseegu3Nw=;
        b=Gfz2792Z4KfTTQ30gJpc4NyKkbVms1Bdky0MO7ma9pk165i2jAVmylKwlsyyEqdLKZ
         /I4Ahi/sGqLfxTVD3Erh+hNP+DNfz+ie+OH9gEp8oOiAyDkbQ719cAA2/zrQUC5eN40G
         zGh3BD7ndkSd62ijzYa+/TRLut2s1ib23BuvhNp4nozdLckWXKJhSonU27oL5rFf6uLb
         sVmP5b3NkzIpCOgVgwUs7Qqt2nONvxybNRC4Djhimt6bkMSifxcJxhc4cHDE/CU8MoI1
         Kt75amPyGhQ8WSKPNcHyJ/9VA5/rIrvF7ljtc/RHe6/aJ8AcqMJFNBJD1wpqynvZUu3W
         igjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786971; x=1791391771;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/oaydNeB7KKez2Jzp2jljrx95qkFNgazQFseegu3Nw=;
        b=tbUe9LAFgmEmGpI5vnvJQNnO0PckRAWSeY05rCs1hDyQuYoC2b82EwPRcxkaKsODFr
         SYc8yLwAyXCwMHwEv6iCTqvUu9kcvhuykd+Ja2ypCn6wQCTNLEr0mXICTXNhTJIiB62s
         W12wz0zF0f9ZaE4olVhziUIs58jPU+yqiO9bPjAduFNNDzY82fuvPecu/oM72f/u1o6r
         prrtp0k5mx5Xg4mPhCfPHp28rKqs6ShSU0HkwKAhyB2+DZJ1OR7Vkp+iWFsttSJkFWC3
         84BGSXvT1VwxJB5+zsniWxB2WDjjq/0uhDZL1Nm6Kh9nPmMP7rmIZqi1rzbrFWt/hmpr
         f3bA==
X-Forwarded-Encrypted: i=1; AKwUvBzVPIuqdDAJQH9bJODMst2urDzVSSbdMUgpV/vexRPdb2RzWdWGLSGF0sXPgLmZdosrvS+0zSDWUjg0D9ZYvg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLIGH/cDZuMtApwgrcc5xZubp7B+Q9zpB6KgCuTjhY9fpN5lLoA
	AiDV4HY/mGhyU4q+s4OcdTE82H9kzSqG4R8A1OJcxrqelvfjehoSGCCWBMQ5yXJD9VB0LZg55/v
	EDQe7YVlbeA02DvLqCodwncy/hzEspt0=
X-Gm-Gg: AYBFou3K5OjvtxoUQFMCFDafl/kJHr1A+8m/HZQZUaoSimB+fljzkxZD2LKkfv/3bhp
	M35gd6e6YnKHkdhKWDGjaNxcqYmnOOBZbTJrM8poAfFZjSN2OLm1DAxplMDZ8XTTVMYuKhkCUou
	tOhSMpeEpAEEBg8n0Wwwhku540sSk0JQ0kfKVmCf60p9QuPBgVqDgClJobTSeQ73EbZG/PVI+jA
	vOkk/tp5yVEVQFRRRKBKk7ffQcZ3jPttIISSTIHHpP+zVkFe8N4MiE/Am4kt5g1zpBCprQ4dP71
	CNGSkEF7rIrc9H2O2sS35ZJGVV2LZ6DB0MzRI8rbl+4Y2lYL0sa+SILqqZYlY2giKMXL3xxLAJi
	fhCEuAMuRxaTomWlIfGV/jQDxvtH0tDbU0PuuaLYgODv5
X-Received: by 2002:a05:6214:54c5:b0:90c:a989:a68a with SMTP id
 6a1803df08f44-917aa2f093bmr3499616d6.11.1790786971288; Wed, 30 Sep 2026
 09:49:31 -0700 (PDT)
MIME-Version: 1.0
From: Claudio Gratton <cla20gra@gmail.com>
Date: Wed, 30 Sep 2026 18:49:19 +0200
X-Gm-Features: AclHuK8KG73Rdozl3C21tUCJ3Qj_vy52lU6tUV5dAYIHAggwiXb0lvze3F5m_BU
Message-ID: <CAGohoTay793z6HftCY-1m+DP0yCJ1eeB+q4p5-z7+bOnrOWOCQ@mail.gmail.com>
Subject: mt7925e: endpoint keeps a stale zero-latency LTR after s2idle resume,
 blocks package C6/C10 (Panther Lake laptop)
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_174934_338942_8310436A 
X-CRM114-Status: GOOD (  15.98  )
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

Hi,

I may have found a resume issue with the MT7925 PCIe Wi-Fi card
(mt7925e) on a Panther Lake laptop. I am not sure whether the driver,
the firmware or the platform is at fault, so I'm asking here first.
Everything below is marked either "measured" or "guess".

Hardware / software
- HP OmniBook 7 14-hg0xxx, Core Ultra X7 358H (Panther Lake), Wi-Fi/BT
MT7925, mt7925e at 0000:2c:00.0, root port 0000:00:1c.0
- Reproduced on Arch linux 7.2.3.arch1-3 and on linux-omarchy 7.2.5-3
(Arch config plus patches). Not tested on a vanilla mainline kernel.

Symptom (measured)
- Fresh boot: the PMC LTR table (/sys/kernel/debug/pmc_core/ltr_show)
shows SOUTHPORT_B = 0x0 and the package reaches PC10 at idle.
- After the first s2idle resume in a boot, SOUTHPORT_B reads
0x80008000 (valid, zero latency) and stays there. The package then
stays in PC2 (PC6/PC10 residency 0%) although everything else is idle.
- Idle power on battery is roughly 0.5 W higher while it is stuck
(about 3.1-3.6 W vs 2.0-3.1 W, screen on). I also changed other things
in the same period (a Bluetooth autosuspend workaround), so treat the
0.5 W as approximate. With "echo 1 > ltr_ignore" the package reaches
PC10 again.

Why I think it is this Wi-Fi card (measured)
- Unloading mt7925e changes SOUTHPORT_B to a constant 0x88418841.
- Toggling the Wi-Fi radio (rfkill), NVMe I/O bursts and an empty USB4
port do not change it.

State across the resume (measured, one suspend cycle, "systemctl suspend")
- Before suspend: SOUTHPORT_B = 0x0.
- Immediately after resume, before any userspace hook: SOUTHPORT_B = 0x80008000.
- Endpoint 2c:00.0 stays in D0; DevCtl2 = 0x0409 (LTR Mechanism Enable
set) and the LTR capability max snoop/no-snoop latency 0x100f/0x100f
are identical before and after.
- Root port 00:1c.0: DevCtl2 = 0x0400 and LnkCtl = 0x0c43, unchanged.
- No kernel messages from mt7925e or PCI during the resume.

Workaround that fixes it (measured)
- About 6 s after resume, clear and re-set DevCtl2 bit 10 (LTR
Mechanism Enable) on the endpoint, 0.3 s apart:
setpci -s 2c:00.0 CAP_EXP+0x28.w=<old & ~0x0400>; sleep 0.3; setpci -s
2c:00.0 CAP_EXP+0x28.w=<old>
The endpoint then sends a fresh LTR message, SOUTHPORT_B returns to
0x0 and PC10 residency comes back (about 28% of samples in my run,
idle 1.99 W with the screen on).
- I run it from a systemd-sleep hook as a stop-gap. It has fixed the
state after every resume I have tried, including a repeat this
afternoon.

What I do not know (guess)
- My guess is that the chip or its firmware re-sends a "0 latency" LTR
message at resume and never sends the update. I cannot rule out that
the driver or the platform leaves something unprogrammed; the
unchanged config space only shows that it is not a PCI-level
difference I can see.
- I have not checked whether other MT7925/MT7922 platforms, or
Intel/AMD systems, show the same.

Questions
1. Has anyone seen the same behaviour, and is it known on the firmware side?
2. If it is a driver issue, would re-triggering the LTR message at
resume (as above) be acceptable in mt7925e, or is there a cleaner way?

I can provide full logs, run patches or test firmware versions.

Thanks,
Claudio Gratton

