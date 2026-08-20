Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEDCC5DF85
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wzv3uP0w/VGEKyAdxgzQ+j7UoRyZuBIJ3kqw0ykhhiw=; b=OIzZQ3hWVTP3lXmp1u2geSBpYg
	skJxY3Hl6z3YVPxLDG61+sIGaTdUaXp/w7/8eyu2MtmUctP1H95nq5ndae9FJ9q48Gkph/RVjkxUS
	MrS4Oykma1XfSBLiBDdLSd08lFgif9Z4JrH+Q07bzjS+hg6JYOe+hWIGKqEDuI6B2y6LijRe5oJY7
	ADEhuiMybw9Q7v6sXFm/CbP9Jk5z/GCC6ioksuDkMTcZh+dQmRlxazBHTQ7FB/cveZlFfXLFi40y3
	H+E+jkNW3CQOac0gQMCU7mLQME5GPEvpDXSJPHnsD/Kk7SPZOuAMdERWyfGJj9T6h14gjr/IJJIkx
	06YO64Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5D5-0000000Br3m-0a28;
	Thu, 20 Aug 2026 16:01:43 +0000
Received: from mail-ej2-x0a.google.com ([2a00:1450:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5D3-0000000Br3D-167x
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 16:01:42 +0000
Received: by mail-ej2-x0a.google.com with SMTP id a640c23a62f3a-c2193fc3dabso119780866b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787241699; x=1787846499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wzv3uP0w/VGEKyAdxgzQ+j7UoRyZuBIJ3kqw0ykhhiw=;
        b=r/guF/2qgLeyrTn2xA+8aRFUBnOnH2xdailLgIxuTSEi/8XBjYVsyZFNin/xXqA3S/
         ApKyXT/XwQhzwqsJ++luoMRdHW/w8fl08wlkMlEJJd6/u15ADAoqdfa38zO3qCvRypZ5
         I11+qIZfEC0UtjSDuXVu+XD47lvfD/fya5oaMCw1NY+3q8a7jOO48KYIDj2B2iyHm8nG
         Ko12kSbTHTaGFfYHuJDtzj7WkmMay7uvBXNIQefqjAx7vddhHcU1MJRfhGhe2iWEGvFZ
         bipVMaMCgSNhYrTM/HcGT6eRIcU0QLzhwfT/QzX/jxMKf7rzVQWa1bRXKC0GlPN4rOec
         pATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787241699; x=1787846499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wzv3uP0w/VGEKyAdxgzQ+j7UoRyZuBIJ3kqw0ykhhiw=;
        b=P1PAW1sq6OhgiKn/kcXtHI65jiHDcPpEInrln+q6D83F87XmCVmIPB43pCb+YKjB7o
         CgHF9P3UUsBBo9BrAhLvhEXDTMtjRYedA2ywtGbx2FrFAHPz49QmSY+1rDX+gfN5/R3r
         b0V5WbaFpiHtuvHQ84FchwpcDJm+6NMrpuXkWq8iS5cbmycAHMdFB3TdZGxwJrfNpXi7
         4JLXBghVWWutNmh2lq2M2YdwKFJf7CouBjS9Vmcvb1yYB8QxVqy9Beu+WMBR8qVyfmek
         GI/uBaVXr81aMQRMsxpFMVxXbBPKvRAGX62KpVw9AYZ/g6PPuPv+/c+oth05ilIg0z2m
         3p+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrn+V0DyWrYtDrAQqJuJcy2BhzmC5YBOoh8UbpWGtyE6caExv8RJW/FQCu3ZOg5MRQolVy+NNh8vzirD7Tmww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2MiW09sDYRMusf7iMFVbGnbTSFVdRycOntE/Hrlm+lItSFDqH
	F8j2mbwlVt6N7XKgD6gSzlLEcNvyXuQG81wgEgqdvAkZ7hifwRG5owlQ/FprwsK/hOXueg==
X-Gm-Gg: AR+sD12XDPysDC0EEc9OfTiMtM1kCrbEOpVSljnqEhV1FVCweUzsh0yMshWV67us+bY
	Y6bo/BMSyYY4V47vwScznujGQCfnYctabLSbYVbDl5wNt5eDLev0Oq6qUyd/UyurKSvzi+0CHaJ
	7n/d0smYatLX54d9w8aT58me8UQVb4+3zrc20h2yvBIxaI+KetBYpwHvDGpzCwE9BsnANS3wCwM
	Xpu+qSJA5g10zUJfOz9jhOm8W9jkivJkyn0p0n8lnDd/XiRQv0YvX7ruZgNNa0zEVOaqHphNGAB
	VlG+cgosqJluRnup1E78sIN24ww7Lnd25y1O4a+g9HcTL/BO5nLVUBtJl2EMh20/rwChOEoOsSU
	KmkFYY1CsbdhE7UJ8QeCcHajPY6RrG75eyMw9eOgWIoE3O0tu+pBjZb6eAv/XioNiTOLdn1W71S
	MyCAtCiB3EU9RS8PuuPRJOnFamIG4g5oqyeiQvbxQpsLVHkrq2KRj1ckUpfaADKcmFz25Ba8Vv5
	X3Eq0VO5givzvk/va3Cv+fO9mw2f5pA6f/CJHFzwQz5Y38=
X-Received: by 2002:a17:907:c03:b0:c19:fb6e:5fec with SMTP id a640c23a62f3a-c242e25525dmr1171279666b.18.1787241698523;
        Thu, 20 Aug 2026 09:01:38 -0700 (PDT)
Received: from fedora.fritz.box (dynamic-adsl-84-220-246-20.clienti.tiscali.it. [84.220.246.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441c78sm13634405f8f.2.2026.08.20.09.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:01:37 -0700 (PDT)
Date: Thu, 20 Aug 2026 18:01:26 +0200
From: moosager <moosager90@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: check drv_pmctrl return in
 the PCIe reset path
Message-ID: <aocbq-_gRsXgFV94@fedora.fritz.box>
References: <20260809012309.43657-1-lucid_duck@justthetip.ca>
 <an23_8DALILoGLP6@fedora.fritz.box>
 <20260819171454.21329-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819171454.21329-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_090141_318669_72CEB383 
X-CRM114-Status: GOOD (  14.55  )
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

I've tested your commands with a vanilla kernel (no patches applied): the 
results differ based on whether the bug is triggered by my orignal script to 
reproduce the issue, or the issue happens naturally.

For reference, this is what i mean by "my original script":
#!/bin/sh
echo 0x7c060010 > /sys/kernel/debug/ieee80211/phy0/mt76/regidx
while true; do echo 0xffffffff > /sys/kernel/debug/ieee80211/phy0/mt76/regval ; done
(to be inturrupted with Ctrl-C after 2-3 seconds)

So, when the issue happens on its own, your script (accessing register 
0x54000120) outputs 0xffffffff, and even me attempting to write 0xa5a5a5a5 in a 
loop won't change anything.

Instead, when the issue is triggered by my original script, your script outputs 
0xffff0002; again, I cannot manage to manually write a different value to the 
register. In addition, with my original script I sometimes get messages in 
dmesg saying:
> mt7921e: MCU is not ready for firmware download

So it would seem that my script does not reproduce the issue identically: 
however, whether the trigger is artificial or not, the issue pops back up 
naturally on subsequent reboots almost immediately.

> Yours reads 0xffffffff where mine reads 0x4

0x4 is the correct value for it to read, and it should correspond to 
PCIE_LPCR_HOST_OWN_SYNC. When I was testing the bug with some dev_info(), 0x4 
was the value read all the time up until the issue happened and it started 
reading 0xffffffff.

> Comes back 0xa5a5a5a5 and it's alive and latched like mine. Comes back
> 0xffffffff and it's off the bus, which is a different bug.

We may be looking at two different issues after all, both mitigated by an error 
check that was missing anyway. I'm still inclined to say that it is not a 
hardware issue, since nothing similar happens on Windows.

> If you're up for it, reply with this line and it'll get picked up:

Tested-by: moosager <moosager90@gmail.com>

