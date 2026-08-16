Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE66C5DF6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Aug 2026 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg9qAqprJ1qT8ZCEcxsSaRPXUDpRR/0AcgE/OG5kf+U=; b=LW69DTEK0edeyozJ0Jb4e7eo+G
	KPMyupNiS76PCsBZ3zg9T9N/qGk4PBcKrGgzoe5N4pfP2C6hwBfQIYAOtsTQ7acJFmWX6GIAXh3QW
	1WpBEgBfAjw8dx821j5icZchJBvA8ylMJ97K+XPnn1E1VymmVElygFA3ueTIheZkP51H4Ot6XUQrC
	lJuk0EHUD2ebIoDUZGWQHmRvQvWAhjG9cRcmcLiVJBYugJOiVAS1F7MNANmwFj7YLC3WUSeL8A0JD
	AkXsujCFLUi8BHbDluN7vY1x+J8XbrSuFLw6HRb+TFduUuYbf2vzvpdreACMT0TGumV5nyE0cnFT6
	JNtyRUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvapq-00000004nBJ-1qCF;
	Sun, 16 Aug 2026 13:23:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvapn-00000004nAi-3zmt
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Aug 2026 13:23:33 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39db07589caso18832311fa.2
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Aug 2026 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886609; x=1787491409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg9qAqprJ1qT8ZCEcxsSaRPXUDpRR/0AcgE/OG5kf+U=;
        b=BzqeoRwbWgaTx7B++MNRXUhB3Kk75nP7Tct+59PC+eVuZNGTsECxtcUpAA9VGjP031
         WNwQsZJ2UJG7l2ebpkJQbblYkYJLkPHc3HPIISftYwYok3b9Bvg9NpWWoiWNAcuyRrFd
         kyK1PAUYr9iGFbF3HXwKy5kzVtWonMsOM0NUpH9qgSbYGVbetUWXid4IpXGW/Ic6rsZs
         lTE859M4UjrxSD0UnkuYUidJSSccCVKwHJ2Eznkb8xGHnM+EzjyYwFIDYv7OuFNwLuu6
         is5uzSjOjqxWhzQdpySLVIVGwO4kgZf48CwUq9/0cqQxDpZ1dWxG3OQ5YJQBx1bmFYm1
         rhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886609; x=1787491409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vg9qAqprJ1qT8ZCEcxsSaRPXUDpRR/0AcgE/OG5kf+U=;
        b=DcrVkkk0mgePXFVpCXQ7bZFxDSPvTBerk5DuWFx/bPn7NyMwu6Od2LoXzOWlkEcBDj
         wZXVHn81uGW/LH01A8O76j9ST+ArD3qIe9ICdexfgsObiwpA/bJEyfG/omzAwfva3yNv
         KmNhlhjerNT2o93DCeXMBc6+BuICqyLUDYb3jYn0wKZ5bYWkcWmqmtze+ykuDN2CfaYJ
         eKxBrDa/LBvKY3FCrRYv58WrGckORv/YuK1NUfMtSvec5LXkn9qwreKvQCk1Z5CMAOs3
         oFdSTtxjDlH5oR967vBYyOuYYC8qw6aQ4FyFLCpF/q40Ineas1NmNrQ30WhRMszeNWX7
         HVnw==
X-Forwarded-Encrypted: i=1; AHgh+RqqF9hsjjdAU7Rejo6DtfyechivwwdczX5se7B4Zi+sDXKwOjUu5ZnHE/4vJtp2R6A9cax+nM3/CkqWspipLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW9pSNuRXZi1MWrnN3F/H1+VAXCcyuEYhci5AARTx10zeZFUYf
	kBWElO8GngqXZBA/4JJ4XY9ZJtpCqfgo7VqOMrnJUayJVq01SRy5YmUH
X-Gm-Gg: AR+sD10/0KJzRme8aQLietWuWgf/+Qt/BPKd5Tc06GBTdlbvahO/Nhf9+7tgRIQi0f7
	jjQlPiJEE31j1odVieuAWHz57f6ChXCBnv3MRsc27UHCRzaNLesxg/1mX5BZYF4vR602VrqGRur
	oB06iMwqMMVP7KYPdmXtizlWaYPLrwxxwrBCbGkdXbwI2HZd/a5NkBA3/RFbqqZY36Ca98ZwGA+
	AwzyRz6wkQLbv69Sp8g/2KY4LZ1qgqQubqwdC3QatE9Xbzhfi1liUBSxSRltW95EDzkRV+FaDwL
	voH53FGqbEBzf2lF/YoM289dRVRuz6Cp17Aswh8EL4aJkoRJ26pT/k++UoktAVUJttkFww6gamC
	k0k6GnDFBkVz7KNZfJxoFnkJImIGi74S52dIS5UUuSsTMG6hNO9OrSMxHS1u5c173VjlpL4fBY8
	ipB//g+eLSvWfv4q7yvjaKblwb+MvHbCXDXoHr1cL72JY2RnqI9odEdBfrIKgc1ZnOQA+2eShFR
	PeVRdS39cDFlv++dcKpHbkNNad/WzyqwdEOWULi8PaYJ7m+iY0oN7FKb4G2gGtQbVKUba0=
X-Received: by 2002:a05:651c:2113:b0:39c:71c9:e28f with SMTP id 38308e7fff4ca-3a1327dfff1mr17716681fa.25.1786886609125;
        Sun, 16 Aug 2026 06:23:29 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cfd4c8sm18812451fa.34.2026.08.16.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:23:27 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7921: validate CLC firmware records
Date: Sun, 16 Aug 2026 18:23:25 +0500
Message-ID: <20260816132325.23007-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMyXUJmh=WfwC4_KHupNxYR5e2Gy5QhBDL5TSG6XEW-XLa+X4Q@mail.gmail.com>
References: <CAMyXUJmh=WfwC4_KHupNxYR5e2Gy5QhBDL5TSG6XEW-XLa+X4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_062332_012217_E09695B8 
X-CRM114-Status: GOOD (  12.52  )
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

This patch is in linux-next as 9417c5818a01, and on current shipping
firmware it stops mt7921e from probing at all.

An unknown clc->idx is treated as fatal:

	if (clc_len < sizeof(*clc) || clc_len > len - offset ||
	    clc->idx >= ARRAY_SIZE(phy->clc)) {
		ret = -EINVAL;
		goto out;
	}

but linux-firmware 20260810 ships an MT7922 image that legitimately
carries records with idx 3. Dumping the CLC region of
WIFI_RAM_CODE_MT7922_1.bin before and after that firmware update:

  20260622, region len 366448:
    idx=0 ver=1 nr_country=255 type=0 len=179384
    idx=0 ver=1 nr_country=255 type=1 len=187064

  20260810, region len 475488:
    idx=0 ver=1 nr_country=255 type=0 len=179384
    idx=0 ver=1 nr_country=255 type=1 len=187054
    idx=3 ver=1 nr_country=0   type=0 len=54520
    idx=3 ver=1 nr_country=0   type=1 len=54530

So mt7921_load_clc() returns -EINVAL, mt7921_run_firmware() fails, and
the probe retries the firmware ten times before giving up:

  mt7921e 0000:0b:00.0: ASIC revision: 79220010
  mt7921e 0000:0b:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260724143257a
  mt7921e 0000:0b:00.0: WM Firmware Version: ____000000, Build Time: 20260724143402
  [ ... nine more identical pairs ... ]
  mt7921e 0000:0b:00.0: hardware init failed

No interface is created. There is no dev_err on this path, so the only
clue is the retry loop. Loading mt7921_common with disable_clc=1, which
makes mt7921_load_clc() return before any of this, brings the device up
normally and the firmware is loaded once rather than ten times.

The rest of the patch is a real improvement - bounds-checking the region
table and each record length also closes an infinite loop on a
zero-length record. Only the handling of an unknown index needs to
change: an index the driver does not know about is not a malformed
image, it is a newer firmware, and the record should be skipped:

	if (clc_len < sizeof(*clc) || clc_len > len - offset) {
		ret = -EINVAL;
		goto out;
	}

	if (clc->idx >= ARRAY_SIZE(phy->clc))
		continue;

I sent an overlapping patch yesterday, "wifi: mt76: mt7921: fix
array-index-out-of-bounds in mt7921_load_clc()", before I found this one
in linux-next; I will mark mine superseded, since this patch is the
broader fix. Happy to send the one-line change above as a follow-up
patch and test it here, or leave it to you to fold in before this
reaches mainline.

Separately, it would be useful to know what CLC index 3 actually
contains - roughly 109 KB of payload in two hw_encap variants that the
driver currently discards either way.

