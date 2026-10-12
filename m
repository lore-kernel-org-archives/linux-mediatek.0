Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401DDCA9EC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=; b=Y84jYITKazPFAu4a2My19W/fWE
	ROKvM0816qChnqZwMZGdRyVrkgVicZpJ1WI3bRzT5zM9c3vcFaOrZ7sXde+Fnew6STJwM7EH5biFF
	Fu9F2vSztZn/plPGNlfEZpdFXCoNW+/Q9jVnBHVliqjzdYFDgkdk6tn9FiKitiAjPej/5zwPFsViw
	sEPB6hJifY93YP1fp+4BprmaEp9auKDT/t/c5r3ons7sNJ2V8YaHPpC9AV0UmpJKD5dqMWLuH0kTs
	GHopnTDBsAhJfGJv2DPBChSZGym8VRKijR9flEcMVtyyKZVV2XLg5sH3p+A6tBtF5bNHAINOde5fV
	AnWNnqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHS1-0000000Ajld-0RFh;
	Mon, 12 Oct 2026 14:56:29 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHRy-0000000Ajl7-1COu
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 14:56:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2907318a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2026 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816984; cv=none;
        d=google.com; s=arc-20260327;
        b=aRXPurtZdFjlNugSmZgsQA8g0S4zsqvCnJ6uXImHnFvXF21lArUCiEG3DCejWy5/SH
         U7zacer3b7ytjocBil8jK/n192XWcCbWKbohOUkq0hr11Cshg+5moXQ+nOA8zgsYjChQ
         hL8fHO4fVeqZgChPYNngm8YzCHc/V99WgWhtTQbgQwG/0EkxxNv8P0F1UnHVnx4XuORG
         ClpjIsQclgObgDQCN2UChTTWgpO1DhZ6UZaQECOwo18L2TgzKe11ws+c2dwIKc4ldK6D
         B5VBZr/XOw4QjMjMcPhmpqizfPmoCQ98UJvOwYh1CsrzPPsdYMzkvJwwVNNuI5Jy5pKN
         CCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        fh=/acI75oUyf3hxOWF84TIewT++qCuL8SD3mTY18fsTZU=;
        b=gcAuMtFRJ+v21tgTKuZowjzersc2Z2QqrPJz5nV6Z6nUpYB+0ODsv4MyqpnxbZXLJA
         hB61TAijVnd0jZytEUIS+i5s7Y3FNZnJrkf7SsZlTR9GluUmaz+E7xMTRIKxaq6oQTwl
         TMHjOeP9vmDHFTnWMz/rmOCMG2w4TIOXVDEOaYwOOTe0c+KH005ClI/AvkgJHtVtHQOw
         VeXiT4Ech7XO6n3Wot8TwjQ0eySf1zlaTKQXRR1GKpCimFaFiF4UD6H2z6WsMob9Qqc0
         8EMmcHTcYHfGBpm3gyx4+WmPoDJRdO/IKwEyFEw41NVrd2yBdZgcETFBfr/J/QhBsF8g
         eiZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791816984; x=1792421784; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        b=cQ8tI8bHS707eiJAjHBCcXy+1sWLGo1Fk0Q90t0ENcAkgRKDy2kd2vGD97+qn5GCAD
         kVL6axqoohDFyHxA9ZMBRqLaMKheP4ZUdIpm6g5taZW2tj1LsXnhJ640gP7pQILqBGY4
         pEs1FfCD8/TxQ0s1loyVelqkPOLQvQKmu3Pt5SRDni7v5YYfamTtfaA0Wc4Nm8hFIEAa
         VLDsLyTOC750G53gl3PjZeZde0gFqsIBhW90LD/K1I3TxkIOANgve/87xnSSL5MMb1tc
         phPpfvetwkesTlVhtwssiywxEq2wvegEpfFJ38EcbRWxc8Yl5M8DFEVyBRXQ94o42SfD
         JFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816984; x=1792421784;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        b=ejf9OwEEf7jIxHXcXnsV632QaYDG5+qCWYsjLH+EcnbcqT6vKKp0vfvSXoxafgU3XE
         m+dTnaIHKvev56WQ9G+9bNf+qU6piW+KPsXwx6Ttuw2YeXxbH0NYU6ceDzDSZIvgkpaW
         Cp3ZiCFyNzT9b2NOXY+NDJm5ADf1KL4dvdcuGjAtU5hCUSblpjc0pdH1ipUP90rF2QcO
         KIAojmidtk5EBqkZ+saBb5FAK31q+V5xSlV4bBH+pzIvN9REI/VN63qZlH6xQIFxdAJJ
         UFDoeLH2mNGTkmPgjos2u9mvm7IjY0to9s1rSlqv0MdKS1FNR3wXIn9JD/gkkTY7QK2H
         +dRw==
X-Forwarded-Encrypted: i=1; AKwUvByO+/FNo8/A7Poz53yeflh4gAKpfxOPQL057Q9Ett1GHwE+68MqT4l/jXsJ7Idb5PJsT7U30S+b6rwAgXmYDg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLv1p6rvoJpAF2CHQoPKxqgtLXR/oyyh1P6ljspoa5SN9LurWIf
	nKDRC/TwE8cbOYWBpmu8bHWcgbjNQ0wyBwcZmKlbTIT6+glizarK7iEM1la7az5qm+jRHD1lMVF
	B5YynTKrcyPx97c+crKUMsxMag68R1UM=
X-Gm-Gg: AYBFou3jvlQUQqEMsU/y3qkLcBtibS/T/BmHlq25Z2Q6EPVD9HE6gEZI0l7F9n2hia8
	KGe9dFmZJI43Pb+uuGjXUN7s25W3WiE5FAktOGYeMn2mC9zdfVyOZMuWcY2Pm4KE19+4VUVSaOk
	bxJAx8fUu45vNj2SCQRuE9603+q1JHi0UWOIEAfzRh0nvqhgKZPtNdsYDX/FoV5x+FDyf7T9xPx
	+Zn4n7r7WkwDaYn/XuRgg4zDHCOkmSLNCrfbwlSqFxvZvhiWUjEuyZDAhrA+HOsB+703YUfyP+g
	R2zUMLkV9Oc8NRHaNM5YXWRtFmyRnX/8hdU3F6CK9eBP2HQldsh4xVeYQnQ57SlttJfVLh4DuHd
	aCX9y7z1cGQS1
X-Received: by 2002:a05:6402:354b:b0:6ae:550e:5a04 with SMTP id
 4fb4d7f45d1cf-6b17c267f12mr7897936a12.30.1791816983901; Mon, 12 Oct 2026
 07:56:23 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC00LvQvtCy0YHQutC40Lk=?= <shidlovskiyilya@gmail.com>
Date: Mon, 12 Oct 2026 17:56:12 +0300
X-Gm-Features: AclHuK_V_Gr_BzvbzmCXZnPpQdlQCrW27JXkLvyBO5_v8U3WJkVXi-60BRN7WX4
Message-ID: <CAGjg407dj0uZ0rCrL4G=PDkQv4-QC_og9Eeg7ewWzxqBvU4b2w@mail.gmail.com>
Subject: [REGRESSION] 7.3: mt7925e hangs on hibernation restore; fix
 c182bfe944eb only queued for 7.4
To: nbd@nbd.name, johannes@sipsolutions.net
Cc: lorenzo@kernel.org, ck.chang@mediatek.com, eason.lai@mediatek.com, 
	emery.hsin@mediatek.com, sean.wang@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_075626_342162_77C7D056 
X-CRM114-Status: UNSURE (   7.41  )
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

Hi Felix, Johannes,

commit c4edf9e3e0e5 ("wifi: mt76: mt7925: replace shared rx irq masks
with per-chip definitions"), merged for v7.3-rc1, breaks resume from
hibernation on MT7925 (PCIe). After the image is restored, the chip
reset path ends up on the MCU_WA NAPI, which is never set up on
MT7925, and the machine hangs hard (no console output, only a power-off
helps). Bert Karwatzki reported the same problem in August.

The fix is already applied:

c182bfe944eb ("wifi: mt76: mt7925: fix reset panic caused by the WM2
rx irq mask")

but only in wireless-next. As things stand, v7.3 will be released with
this regression and the fix will only arrive with 7.4-rc1. It is a small
fix for a regression introduced in this cycle and already carries a
Fixes: tag. Could it go to Linus through the wireless tree for v7.3? If
that is too late, please make sure it is picked up for 7.3.y stable.

Hardware:
Gigabyte Z890M AORUS ELITE WIFI7 ICE, BIOS F21
MT7925 [14c3:7925], subsystem [105b:e112], ASIC revision 79250000
Ubuntu 26.10 kernel 7.3.0-9-generic (based on v7.3-rc6)

Without the fix, every hibernation restore hangs. I narrowed it down by
unbinding groups of drivers before hibernating: only mt7925e triggers
it, and the 7.0 kernel is fine on the same machine. With c182bfe944eb
applied on top of 7.3.0-9 (built as an out-of-tree module), hibernation
and resume work again, including resume after booting another OS in
between.

Tested-by: Ilya Shidlovskiy <shidlovskiyilya@gmail.com>

#regzbot introduced: c4edf9e3e0e5
#regzbot fix: c182bfe944eb

Thanks,
Ilya

