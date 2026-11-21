Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A62606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JDv8rXXe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g4nwBI0l;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTIu6fDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=; b=JDv8rXXeWQIkmX
	pD7Je1F7I2JRXXGBllrWKWE5F5rD+ckMJWEe9pySLg+m5UonKAibjnK8Qv5Q5dDeduQo+koOKImM9
	hrXc7yltq/4no36tXetMuUli4YoFTMp0XoQUDpDOxEsIem9oKjKo1BF7c6L4ZE+hp/LHVEqL8xCyk
	Yi710wO9PVWaosfI5FoFihEfmNzfTbCzemGfVW1FSyVUxztbMLE/Xv6EzRobGO9MiPFxa4aCwgdL0
	qSrH/v4qj/v7TBRjOio06VfFnCnZXub8m+5cDz+DLYecfkR66T0olB36ldN4hP69OoN6DGKtzzZtW
	JC1KusrN78WufEvXPzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrvx-00000000GGT-30w5;
	Sat, 21 Nov 2026 20:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrvv-00000000GFx-1Pis
	for linux-mediatek@bombadil.infradead.org;
	Sat, 21 Nov 2026 20:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=; b=g4nwBI0lPWGCi0oTxDlr3dOKIg
	FkDvw04i3eckxclgegMTO0S0i7NGmqpCy5F/fdSnyrd0NO1uvAoIbDMM9L1wNwpfgmNNaeahTYWQ5
	B+FVR5XOjo2VWFzuwcyNx9ro4A4TUnuSz6M9TDHxZ0w6YvzcV7alWsQ1YZqZPuxOaj9HuAIBdMeDs
	SfDmQuHQu6u1wRIaNYSGBkdWgr1NsQgunhpE4RJ3JqpyHBn5qVuhk6if7CLcJfgHnFMYBAVRibd5q
	2YB0hYqcGP9K0ZSWY/apkzrSBVfTNkh8anFTakclgtnEyKUFL/kamU17m5m4Ya19BlEW41UrnvYZI
	LX167qpw==;
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrtr-00000001o6z-1sSk
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Nov 2026 20:43:38 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-7cc91ddf447so740713137.2
        for <linux-mediatek@lists.infradead.org>; Sat, 21 Nov 2026 12:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795293686; cv=none;
        d=google.com; s=arc-20260327;
        b=KdORY6aRLmUVlxKDcKYHOrwZatT39HcXq0MMGU/R6mspSNJ+vhmMEjjOLghxyUim5z
         L6dsi3gLN5EYgU8Bhmh6BJ2JGFx9gCUi5Fb2a9QDBoyonoKcTOjbCiTzCtm7oHl8U0hy
         O8l21CAl5h6vHBfY8eHRL143mLLqb1uRRH7iE2xU3QVnc/+BHSLYYIb32SSmWxYDFonP
         eGMaRdWAXZ8x+KhEDSXsfWgrPEunhCeyLPPr2ax/K5vpASTnlLnCJ81eUzxZFlkbj2Cp
         BTwqhe7/pq1lcmP9mUwHeNqck91yDEnVFYfUBIFwE0OdXnGS+YRQOWTXPjtrh3seqOXA
         WPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        fh=Pqaxl5GUTodd3unOr8KMmp5KDx53ccM2kBINY2GsqUQ=;
        b=PMSAS1JPZl73yUHygzVLg3nQbkFvUDJ8h6PvOHflYZxkU9a1nYH49aei94FrmBMYVj
         I73rWuboMfNWk30tYtTcgtTgW2T899WGewILA88koRY8eLHYEFyTDN9wrBDoSF+JZpPr
         5GW1+MAoo96PCabFokBDwwJStnziQdfZvfnTN8g/hUldcEmKi1OdpaiRG9NpcvKMvwiR
         q6x9ynq9NhwBQQKlnkm+2aOh6kgJmrHk4QIEi5zl79mQY8Lf4BtV0QJsGoamB7zzo8PQ
         vhk9hP/W+BECu8GDUq36i2ekXvLDEsV1CS2CGZpV1f64aaLIBl+DJWOxSONMDTihaaLy
         fn/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795293686; x=1795898486; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=vTIu6fDdd2u73luwD0nhgGCStA/Yff9UYk8V3Awvah9AIzIk3P4zJPei1aNEjNnOPq
         8HTm/YQqDl/lejOTKVEWtn8yTr9Oo5h/e4ymwquWVHgPW2A6YmKCk/qMrR4f+htQmws7
         PvAzWq6dAvljvzI+QoAtXWSmqzGYcgDHl0e6U9XjnJP2Q6V9p2UINvcWnOiVjZpxyFl8
         pOWPswGj7d5fAWBWjqcBqsCb5KQo4JQloBhRhI4U8NEvmZWhTbgoRyKt+NN5GKwRzNKq
         xR41WQJMuKpskQg5e5V8kTAfmfEM8j8iyGvzLQD9+VipmIhGs9gqH80lZrJqxocrZdjU
         waEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795293686; x=1795898486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=NBHKrtHeJ0BPKF1IqsMSmls0vxBpE77gQRbUM5H3srDo7mtC5u+IcDvteiPolDMlzY
         IwUETIfrj2Zn8t9lolJ4TFCKGLeAurlwicN92cBboWfW+mtGn/FemQ8JQqdVDdHifWhG
         62BXe+lUEeq3+Ut2hZkb1I5cBeB5YzAXxSasMm+P00FaXDfBpdPvzDUb3Ha6nYY4KqzC
         ZqByLpxcvaXqIem/lOLpbVYDSUbMuieZtS29aEaRwCLKZcX9HVSZzXH7hoJtYblJgJQA
         XQy4ea1LmyvYUseqvPXPTSOkdqJ9Gs3QeBctYL9choRhIMb3SR06yvosesBCKr+kDqKY
         LPgw==
X-Forwarded-Encrypted: i=1; AL+hErH19CvUCFHW4A/1GViTBadPBUamChrVqM4dh38HFTKFnGhV0EEskEyGu1EzN12r1k+/O4fTyNCKWfSuZ9NpiA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9DloHvhmzMTx/MsS+VWRB9Vt5XXKmUkBVgmkfnT3WoIDAVqqiq
	1qtnP1kxqlSbQsZGPHQJBJjHWjkQZKneSgTFgL3AHjgiDdPxck903m+eSopOtQicdaxE+pYwvOT
	hbaMJQ3rY9M42Vqt+xpD1xw+itf1BiyM=
X-Gm-Gg: AZFdTZfwyeiqCKkCDujiJKqlqrBmqvEXh8dlgVdF2IhYz0auDOnUE1iFlBbY1ZRsyYQ
	jZBCEtgaqTj6/CLwqhogChRElnEs3EY/fHuJ0rk4cTIn0FfRy3Dg8mUIcpo6swpi9quXb5gXhLD
	Ox29Mbay7ZkFGQ4hNC/EP/dcNoSw9qdXNHXZSY/SeyUw9tMeQtYmuiP2qlE5QzaAk4nH4l+5f23
	CZKxXttWsC9vj1gYcH30lil11b14YX11MZVyzXjBSsN8UMT2T2pHMngCrBU2s8YbP9HBNwSHe5+
	VZZ2d/ExM381SB7Y5KY4+WF5S6/yF7dd6/qPAjHdLw+WMsDnwQb4InnUgKkgwsa5htfb7dD9ypz
	MjKo0hdd12mIMjIa5FDe+ewQdUKTPK5VnYnW3Tnrw3fBW3+AIXPzIpDdE2QSlEhSjozA/pscrkb
	0ajEz71mYRDVCpcI+/Xjif/P58HV6A3IX0iwUrEvZz1mOJFhfWlkm1VrlK2fHFs7wUFOcaNEyUs
	KgmQ4nP0dUUl84Nl5Mff6pk1WNr+A==
X-Received: by 2002:a05:6102:2ad1:b0:7c4:a0e4:1a79 with SMTP id
 ada2fe7eead31-7d7395c2401mr2651293137.19.1795293685637; Sat, 21 Nov 2026
 12:41:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <87v75tc7i5.fsf@bootlin.com>
In-Reply-To: <87v75tc7i5.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 13:41:14 -0700
X-Gm-Features: Aa3M54oFXYK5vYkufMa20MNvSVURFxi72uRFVRNsrbS-Gdn6Fv1aeUhFqCfOY8s
Message-ID: <CADvTj4opS_oL0AZjL=eBArgpbqtyH-MQxxSC1KdTxDm88OXpKw@mail.gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yuqiang Sun <izaiahsun@gmail.com>, 
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Bernhard Frauendienst <kernel@nospam.obeliks.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org, 
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>, 
	Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jason Roberts <jason.e.roberts@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Mason Yang <masonccyang@mxic.com.tw>, 
	Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, Lucas Stach <dev@lynxeye.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-mips@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Liang Yang <liang.yang@amlogic.com>, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_204146_086980_A76981BE 
X-CRM114-Status: GOOD (  41.99  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 5:49=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 15/11/2026 at 23:29:15 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > An MTD handle can outlive controller unbind. Its metadata and NAND lock=
s
> > must remain valid, including when a writable file closes and calls sync=
,
> > while further hardware access must be rejected after disconnection.
> >
> > This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
> > ("mtd: use refcount to prevent corruption") added MTD reference countin=
g
> > [0], but retaining an MTD reference does not by itself retain the
> > driver-owned allocation containing the master. The read/unbind discussi=
on
> > also covered raw NAND [1] and draining active operations [2]. Tze Yee N=
g's
> > SPI-NOR series addresses the corresponding SPI-NOR paths [3].
> >
> > Following Greg's review [7], separate class-device data from the MTD
> > backing allocation. Delete the device's interfaces and drain NVMEM and
> > class PM callbacks before releasing backing data. Bare device reference=
s
> > retain an independently allocated device, whose type, PM dispatch and
> > final release are built in even when MTD is modular. NVMEM similarly
> > disconnects and drains provider and layout callbacks before unregister
> > returns; retained consumers keep core-owned metadata and receive -ENODE=
V
> > on subsequent access.
> >
> > Introduce opt-in backing-object ownership for MTD masters. Registered
> > nodes and acquired MTD handles retain the chip, while nested partitions
> > also retain their parent metadata. Unregister first so removal notifier=
s
> > can finish I/O, then disconnect raw NAND and drain admitted operations.
> > Hardware resources can be released without waiting for open files to cl=
ose.
> >
> > Virtual concatenations serialize publication and removal across physica=
l
> > controllers. Disconnect and drain a published concatenation before any
> > component can disappear, then release its component references. An old
> > handle keeps the disconnected virtual device, independently of a later
> > replacement.
> >
> > Run NAND and controller-specific cleanup during disconnection, while
> > the controller driver is still bound. Snapshot the OOB layout in core-o=
wned
> > data before publication so metadata queries remain valid without driver
> > callbacks. The NAND core frees retained chip and controller allocations=
;
> > the final MTD put never calls back into the controller module. Ordinary
> > MTD and NVMEM handles retain the NAND core that implements their
> > operations, rather than the hardware driver.
> >
> > Share allocation ownership across the raw-NAND drivers, including
> > partially published probes. Shared controllers remain allocated until
> > their last retained chip is released. R852 allocates a new chip for eac=
h
> > card, and NDFC allocates controller state per binding.
> >
> > Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
> > ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separ=
ately
> > posted registration, operation-locking and controller probe/teardown fi=
xes
> > identified by the prerequisite metadata. TLA+ models and their assumpti=
ons
> > and coverage limits are available in [5].
>
> While lifetime issues are a real concern in the kernel, please note that
> in general, removing or unbinding the flash controller driver is not a
> practical operation. While highly unlikely, this is possible though. But
> I am not going to sacrifice all the devm_ calls in favor of reinstating
> manual error handling just for that. If there is a way, it must be
> different.

Unbind is unusual for fixed flash, although there was a report of a
Denali read racing with unbind [0]. With removable media, this can
happen during normal use: r852 unregisters the MTD device when the card
is ejected, while the PCI driver stays bound. It should be possible to
handle both cases without giving up managed probe cleanup.

> Also, this kind of contribution can only be done if you *understand*
> what you are doing. Getting the big picture here is not optional.

Consider a writable /dev/mtdX file that's idle when the card is
ejected. There's no I/O to drain from that file, but closing it later
still calls mtd_sync(). That close must not touch the old card or a new
one inserted in its place. Removal needs to wait for I/O already using
the device to finish or be aborted, not for userspace to close the file.

> Maybe the problem is MTD refcounting? Maybe the problem is the devm_
> orderging? I don't know, I haven't looked in depth at all the
> patches. But the current approach is clearly not acceptable.

The issue is what the MTD reference owns. The change in [1] defers MTD
core cleanup until the last reference is dropped. In raw NAND, though,
the mtd_info is embedded in the nand_chip. An MTD reference doesn't
keep the driver's allocation containing that chip alive. Reordering
devres cleanup can't protect a close that happens after detach.

One way to keep the fix in the core would be to give consumers an MTD
object whose storage is separate from the chip. At unregister, the core
could disconnect that object from the driver and drain operations that
already have access to it, much like NVMEM does for provider operations
[2]. The driver could then free its private state. Reads and writes on
the old file would return -ENODEV, and close would drop the reference
without calling the driver. The main change for raw NAND is that it
could no longer recover the chip from the consumer's mtd_info by
assuming one is embedded in the other.

The other way to free the chip at removal is to keep the current layout
and have every consumer drop its MTD pointer at unregister. That could
work for mtdchar, but it would also have to cover in-kernel consumers
such as UBI. Fixing the close path alone wouldn't be enough.

A shared allocation helper or a per-provider reference, as proposed for
SPI NOR [3], would keep the allocation until the last put. That's not a
permanent leak, but an idle file could still pin driver-private memory
indefinitely. Waiting for the last put during removal would instead let
the same file block removal indefinitely.

Would it make sense to pursue the core-owned MTD object, so an open
file can survive removal without keeping any driver-private memory
alive?

[0] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc=
2ZFDqA@mail.gmail.com/
[1] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@int=
el.com/
[2] https://lore.kernel.org/r/20261002101352.1084447-10-srini@kernel.org/
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com/

> Thanks,
> MIqu=C3=A8l

