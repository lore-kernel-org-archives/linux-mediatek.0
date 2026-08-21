Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D3C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 20:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=; b=Ob3bn/ONsR0RwyNjv96Cui7zEy
	dm1ZYZU0sxltvD7ghiSpFy1EgCxd0JhEWlOEMEeShfQw+AVzPuUoASFASZo9obC4N9bIj2X6Nz42F
	dmRf9O/CHmRi3e40J4YCXfk8t+5uThjt9UWBnK8j/dhAkUbE4l3RgyfdplA/uvCUht4tNOMZL//dm
	GHdRZQzTPFAkO+2fUtq0LqdUkWA3venqrsxcXxM5EbU6lW2u6Yd+JvItV9r4siy0b1npCPALxpbzz
	CF6ghsX9T8hXqWZWPs6Kc4+CH6obnl9HfdNseZCIsQLCH8wVB26SvUMnJMdiMJK3OE/uc7waCFHTJ
	UZT6Q5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVnY-0000000E2eN-3VMC;
	Fri, 21 Aug 2026 20:25:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVnV-0000000E2dh-2BLn
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 20:25:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1041284b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787343904; x=1787948704; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=;
        b=DudXl9EjLLs4ZWPb9jNYd81Bmwjw33AvmE1tH+BCgK9qmj2zgsSMwElJlXXQEE6O1O
         a3+ZbawnDRnz6SY6gjo62zqVdQB9x2N3wvIPell/DCqdYFRQrmnVxZL8MRb2cuI++BQm
         t9meqrdqtmiVI1Jer580KNUkt/OoG75hKQz2894ay76zkBj0P+InmjbNKJlbZWFDQhlU
         eAqnySVWnvw6F+YwPd5UwYdBX5SKLKauy2uZLsTWErQhFQaL7Q2g6964mRXV/iVPSexN
         Sx7d1eRTmg7Uz1xk0oyTPeiJ+SniN6i/W2PhJEKR0NrNKIEWWJT0/Wg6uCidcoYUkC/w
         mP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787343904; x=1787948704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=;
        b=Ba4LvGLgYLKuEtW7K7PUyVdASVpLM39LTkkeWcygh/LoZBrNe5rMYNfEeSzvY5absu
         KU8yLnjIGHzHPfeGBg7PvQHwmpwF26wz10Ag6tUXz8vcxqJsgyVogJPfqBWj7dCVbqm8
         H6UYzWnMKnDtHsMQdjvFk9eyc7TxOIFidFLSeKWNNK/N7+wjcCVlcolAiseypFH1h4Jn
         G4sL+XjRasfEV7SlVysQLE1cohiLO+TOZY6uLX3zz4Or1lZ1nQXgRd4LWnbt1Cnsc3wX
         c8gA+/daGArw2Je1CcLzNLoGuVw6+ExOygzpS+p5pPrsRVHJnsY51XYmky5GEqPIlEWC
         M8GA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0hnSaekH5oIC5dE2463XXA1vBzdaaT3rmATOT5NNiyVY3NIKCr5k0957OtlLYtJWGad/OAz5+e3TZw522Tg==@lists.infradead.org
X-Gm-Message-State: AFuF++k6FS/nxjI08S1G6pqQSK7S8KTFDsxuP6/EHJWt1h4wJD5XAe1l
	nR4W/xf+lxeFpnQdNbYNaPQy6V3v6fDGTuunt7iIqXwZ7FbeCHZChsaI
X-Gm-Gg: AR+sD12MXEtv90RDhOVV8M2bHs4I/2J0Kjui9vQpcGulwZMWKXIwXtzrSPOXIrY/dQs
	ajMMSIxEQ6UDat3lsdQA6fPCjDjmaRpFqwJBRI66WAx9yc2dRyacgFu4x067VMqwIrQni2nTfRL
	zrN0yRn67kXjsapKOVEhAhys++VkQWnQOidC0L1W7aKAq/2y5qjo10CVEG0etZQJ22OCkb7/2+t
	YgCYSJmjDQ9M4dZb1kaAt5pg1oNpP0dzi8QBs417kcW3BJYzyjcCLpT6tVCyQGqHSPKd+u6FVaV
	M/q1vua0hu+hHecjTClaKdW+7iU5Wq7GYpjSCPbMLwj4vMT4lu1WJPD8Q+WTrwFqp/q+8+xFfRF
	a8cfY7orX217Qs+hgDhg2CtIOeL33GdnsY6XnRZDHCfs52VypZmFx2dQ0eupDBmJsgg78XQwuj5
	MaSo/EihRr66YQyhwZnnkYDKcJOTgnEQ04oXm452ldTVopHtaBTI3MJyN46n1i6qSOxO9Ws7lWi
	a8glfh93ykA
X-Received: by 2002:a05:6a20:938c:b0:3c3:9c4e:de3a with SMTP id adf61e73a8af0-3cd2febd396mr15299852637.6.1787343903678;
        Fri, 21 Aug 2026 13:25:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3cde4sm33854320eec.4.2026.08.21.13.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:25:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:24:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4] watchdog: sbsa_gwdt: add early_enable module parameter
Message-ID: <9cd5d894-6a70-4d23-a477-71568c032562@roeck-us.net>
References: <20260817023838.6459-1-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817023838.6459-1-ot_zexin.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_132505_557016_F3DE3A2E 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, Aug 17, 2026 at 10:37:49AM +0800, Zexin Wang wrote:
> On SBSA platforms using standard UEFI firmware (such as EDK II), the
> watchdog timer is often enabled during early boot stages but explicitly
> disabled by the firmware before handing over control to the OS (e.g.,
> during ExitBootServices). This is done to prevent unintended resets
> while the OS is loading, assuming the OS watchdog driver will take over.
> 
> However, this leaves a protection gap. If the system hangs between the
> firmware handover and the userspace watchdog daemon startup, the hardware
> watchdog will not fire to recover the system. For safety-critical systems
> that require continuous hardware watchdog protection from the earliest
> possible moment, this gap is problematic.
> 
> Add an 'early_enable' module parameter to allow the kernel driver to
> re-enable the watchdog immediately during probe if it was left disabled
> by the firmware. By setting the WDOG_HW_RUNNING status bit, the watchdog
> core is instructed that the hardware is active. As a result, the core's
> pre-userspace handler (controlled by 'handle_boot_enabled') will
> automatically issue periodic keepalives until userspace opens the device.
> 
> This bridges the protection gap seamlessly without requiring firmware
> modifications and without risking unintended resets during kernel boot.
> 
> The parameter defaults to false to preserve the traditional behavior.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>

Applied.

Thanks,
Guenter

