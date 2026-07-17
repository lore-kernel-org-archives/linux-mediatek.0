Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436CAC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VlbLFjMrzmDXpu8ToEIqn/yuI50jhB/xC+OsMYiXBH8=; b=OnShD0lkaKas9xxaQY0hQqyfx2
	OkbC1GBz0iwkYHfbSMW3bBhwez7UDM5BuzzLV5J9utCB9zVwt0jOD90K9SVJ+Pdcljhrkp8cXNN0g
	gKsz6cYa3IsQ0qnufMe8cPiGiHc2t4pLCRd28hiFSXCoP5XjfqZDHZTlCNqTJr7lXriroUZhE03JV
	wALRGOs7uOCtjcYR8EQDEykVSOrIOt7Z9jnG8dlviP5fS4jquCi1nwA0OV6zIIxBpoQQGmBnNXGnB
	85TiX4iVHg89HnavocyRXW/2PuibsN1A9fClS5tOFlv5aTnc9WoTosbrxc7mLgC4Lig1fMzSajiVU
	tOm8U5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk9s-00000002Z3E-3z6H;
	Fri, 17 Jul 2026 15:07:24 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk9q-00000002Z2g-2bzO
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:07:23 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-81e69a2db34so28460487b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784300841; cv=none;
        d=google.com; s=arc-20260327;
        b=f4B2pA6XyzoO27pOfuTjEqrpxreHGCNFW4M0Sw8QTTg+ZU4HDU8BOiiuHYmxwzLqrY
         f50ApA4tyJDr2fB0eqYLWzhS5hja2YEKWjR7SAIuDZcTB5s4R6n8mbRS1Ko+XpBtqgnI
         B7zGYaxUpTyJio2qU8wabssJ25aGrdT0w4xJui+ykshvuJIineop4ugyI/0Zxx/sSozk
         MUjs6Inx1xGT/RtMOrEcyIR01dUZd+UtMCguuHK1C+oeBwtxUBf6oCdrxEF+1wx05EQe
         0gWwTQmprc3voFvFFd8X4OQwsQmzp+31Glu2zOZhLE/MfnpSbafZwT6aMu3VwFrQQTDC
         qgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=VlbLFjMrzmDXpu8ToEIqn/yuI50jhB/xC+OsMYiXBH8=;
        fh=S7ZA6pTGLswuYf5TcUlM0cqU+JZ7xeieL5ww0VwyxSg=;
        b=G3NITCSUP/fesdT8hkZIaWozK8JzlBsmHulQvuzCUCtVeWDnRwg1G/KH59rVO7No7C
         v4SgUmdORuOcfubF2ZrYB1UYj0tOqA5LD45iXLnZU2+a3CSdKyh199JbyGwGQegHadMF
         aVZkAtTrcPlcxIKQ5cb1JSGr0mBP7VzOzGPDPePHVhTuxAFjIRCDsN5yyqSP+SS1PNMY
         ZnixYGzkg757ULY8BmsLnObSMYqHmGEleboSh6lLPJgmoHJ1qa4qfk3Ygs6Ml0IkHo2x
         EgV5GRrFgeeEHmx38Kx4qNQglp9E6JamZBWW40K/DRK5dah63n0aoa2kNmIOI6sie3S8
         WyIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300841; x=1784905641; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlbLFjMrzmDXpu8ToEIqn/yuI50jhB/xC+OsMYiXBH8=;
        b=NRONywuKNcwSJM/jeJGeKWsrGYmInjm6xYZQVlobGgwXaapLvT+iVIF5ladiCFstIB
         4L93gsGzu5lLHa1NDEAx92YuRl/ZE/yyzEMYGHDAAheKXOonDM7Ly+LunH/F3VKtNML+
         C/xeX/HoJqefAkQqk/j0p11nnUzI7HlCm7hzGT2DXTxFOcGik4/M0fkEvWwQ68jf3Rxr
         gslWpABreizutC2NBmH53oji9CIZv63s9Mft/jnQceYNvEssY2xIw/rgMPJn8JmV1yu/
         RhmN5NUDThjBpz9CwbN4Eihk22juMUZNA6hNmUTRsRasg9VHLXRBvoL5L3/sh48K+BjO
         ZONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300841; x=1784905641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VlbLFjMrzmDXpu8ToEIqn/yuI50jhB/xC+OsMYiXBH8=;
        b=fR8g5iVerukoQurkVg28xU6MRsl1Orv59Fjr6as43GpzEk+x6DdRp2EP0v6muhem4S
         d6aBwC/ziB6FZ4SPZgW0bABNgE2axm9AeMijZE0Wtgn1Sld3TDp+SJG7WcQ1OLyke9dl
         D/w7XHdW9nGZkfnyts+88fCH6DTHp4iLxWtjE+FcU244hpXs3jU4koOtZM1AtacFPczV
         72Kk+XmP0VJSr2DEhpoC5LXsg3EYVSGfEdSUzL9pJoU/JpBXgckw1gHDwRiMtStlOwqB
         /vsJQKwJbVvnovoKe0tLg31rsWhjhmYgPEfSo8YyhciA8lDXwZt9hE8fOWmmmgq8rWN7
         5Eww==
X-Forwarded-Encrypted: i=1; AHgh+RpDRZENBoe7fIAAvuX4eI0Ca3LHfpX6qUA7VBhCFSUDEGKWegy90EdgorURFlSQAqYfe8imwEYrzB9VQicbKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI2BVg65mlO0vA6AZt5ntUB0jS/3Dl+gkvkmfsAbATBzZNtXWW
	EZn/ioUp22W57ghCOjjNzwYjb6LUYBhonx60iXL3FT2VrvFbknS/VhUdtl/On6bOHszu+jw2xUn
	KLczkfUMBom3lqVGGd0O6X5uxrt6t3/c=
X-Gm-Gg: AfdE7clYk4q5JAhLmtAFRYciAgI2rpxcQRSgBkq+gek1ZGP+e8YxB6I10u6PAMpXzDF
	bOx/frh1ZiR9EB/CF3poCHO1QwVxVIrUzD8ldgfaBHR6MqatQ5YCfaQyRIuP7W39DsyFd0vEF3I
	5N625iHlMEpiEP3IW5kO1hSxM60498B6Zx0myrwpY3Qc1d+5RLw/qRhqzyFbbklHXziEgE8kFr+
	ejCVMTff0HWFhRpl+WkKUJSB2/vBsvoun04AGZScBo4HTpyCCsr4SQPBZCc9lw=
X-Received: by 2002:a05:690e:484e:b0:668:2343:f9a9 with SMTP id
 956f58d0204a3-6683bda79f9mr625965d50.93.1784300841058; Fri, 17 Jul 2026
 08:07:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Micha=C5=82_Wi=C5=9Bniewski?= <wisniam86@gmail.com>
Date: Fri, 17 Jul 2026 17:07:09 +0200
X-Gm-Features: AUfX_mzKtUXcRdD_-KWVL1IZ8Cly2QJri0IN_TFmoPdTiMdfWRdDS6lr-7E6FYQ
Message-ID: <CABcniwq7R7=gvCdCrV+1mtJhKhhee5ovN9RqNCO9ySoaBcoiCQ@mail.gmail.com>
Subject: [BUG] mt7925e: MT7927 stuck in D3 after VFIO guest reboot
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, shayne.chen@mediatek.com, 
	deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080722_677976_EE2E2C70 
X-CRM114-Status: UNSURE (   4.30  )
X-CRM114-Notice: Please train this message.
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

Hello,
I have a MediaTek MT7927 passed through with VFIO to a Kali Linux VM.
The card works normally after starting the VM, but running systemctl
reboot inside Kali causes the VM to hang and the physical MT7927 to
stop responding.

After the failure:
PCI configuration space reads as all ff;
lspci reports Unknown header type 7f;
FLR and secondary bus reset do not recover the card;
QEMU remains in D state even after SIGKILL;
only fully disconnecting AC power from the host restores the card.

The main host messages are:
kvm: vfio: Unable to power on device, stuck in D3
pcieport 0000:00:1c.0: retraining failed
vfio-pci 0000:02:00.0: not ready 65535ms after FLR; giving up
pcieport 0000:00:1c.0: Data Link Layer Link Active not set in 100 msec

Hardware:
MediaTek MT7927
PCI ID: 14c3:7927
subsystem ID: 105b:e104

Guest:
Kali Linux 2026.2
driver: mt7925e
linux-next tag: next-20260716
commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
uname -r: 7.2.0-rc3-next-20260716-mt7927-test

Host:
Proxmox VE 9.2.4
kernel: 7.0.14-5-pve
QEMU: 11.0.2
driver: vfio-pci

Regards,
Micha=C5=82 Wi=C5=9Bniewski

