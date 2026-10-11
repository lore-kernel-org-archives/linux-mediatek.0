Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD01CA9ECA
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=; b=muCYa5KJlNLGU3lsPoayXaGCDZ
	B5U919EvpnQbB/MV3J3elXJ+imzkUb6Ddkev/iAVlA74pYtwkfeQDvurncpG7Kmd3xEHUrovj8xPv
	PwFp6+X9V6E6kGFY5pngdHWh1bj2M0GkhG9sQE4hEEWT4yyl73CHo5uzoiccMFJY7CFD46ZfjbKtn
	KSR98fuDSi0tVt9RF5YfT/qzdiYTYcx32mAbGawxh4b28lE0/C4nO8i86JLzON4m8rmtptWHtqrPV
	E+JearXFfiqoNwayhWjLixLAXE2gLFW7Fos2j2d36YsOozwwBy/BCw8Mq06vBgdsVDkDvyRZAjYUx
	VtwAYQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFh8q-00000008ZEy-0BJX;
	Sun, 11 Oct 2026 00:10:16 +0000
Received: from mail-qk2-x09.google.com ([2607:f8b0:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFh8n-00000008ZEG-0P4u
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:10:14 +0000
Received: by mail-qk2-x09.google.com with SMTP id af79cd13be357-934956d1044so61860585a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677412; x=1792282212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=Iwbg0b9hbH5V1+jfApsw59osbDkAL/vHa1H4Z8Tx0dTQV7ZiSAtaD6SBpWRG0Phi7C
         oEMvDRg0MwLcMSfstPziqP3aUfWyfFF3dHqTTtQaiUR5ECddmWkjwINsWASDq5SjfkpR
         slGJEV6chOAUNnZSn/V8I9GNZ9gMrc8AYcyDmSv1NwFr09mCqhwTzcmym5jsiOsvQZsz
         3nDBR94ZA4HqBLopmc00qQ+4f8haA73FBtwXZQmgVfRhEZK1MSfFlRK0onya7ZUnxNrl
         LU4aVN687UO6C5GU/mo0qw4qC8i1e/vuKmosqjXhOVkiJQZseXzPQ8nWbxI3QPUSUSGb
         +1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677412; x=1792282212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=G+i0kb7yI2x/dxaM+jgMardiVVVbrqDoSi+KH1ERXAJdpIn3meZlVqE++ZH3d2F8nY
         osXY7jc5oxuONDmY1ayksthEk3a4kjG51R7tRcNWw6h+SrYNf7omdkLLnWDp4kKwYpm5
         li7lj6Pi0wojHAjGwEzwsNY+dgHU6em4hNuEtJyzhbgEoOSYAO4/BYU5IfVy7aJpLcdR
         9U5u/mqBpKYVzyCwh5hpbNPDzBQ/Gtd226hDJtYKws9Er2/hYIXsx2OFCKJX+oDzjcct
         AthWqwvMRSet0sGrp+35Y0xmZeh3Bnwak6HlUrDEhKuIF6BTJsXPO3T+cWb9OW/OM+89
         b9Og==
X-Forwarded-Encrypted: i=1; AKwUvBzCSLBJKj2emF+CITvX5nEvKUq4uJtBSp6naqJ1MP9fOcUoBjF8u/y4DxAtyIZifNL5kfQDBtqGzwB9CT/48g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKD3PyBeRv5S8Q9+Kk5oE+FHuOSnFRNMYAu5q28QxwqbqC62jYO
	LrEpM6ZO/TTv3fFRh7msS2ntVWW81QYnnYu07RXtTTXg8stu0DFJI++O
X-Gm-Gg: AYBFou0B9M79FZqxDWJ0WhAWrZiN12+/PMi0hyV/uska1GibRzmcj8UN0YUcIlpLzNH
	UHzEMnFFxV1cSdyvwkgZ6J7DfgXf3+t6y+xn5jpXWjk9Al5xDSQB0TQnXQX6/dctE4kRKX+aoJg
	PHqMfhgJpwUiDKwX+v/FWxgsQ7DZwwM0e6v2/8xbiPFqv+IfcOMuLXhHHB+rmFUtvw5Av/GP1G4
	a7tqL18PpM7y8opfYt2ZVCl2sB/O2/UO8Plnpa2eDdF//hzCdW5uTSzqOcTG59iJ+MABWhNLv+g
	ScDXkSrxzp6D6c0VOzQCkPFW4y9UGOlEb8gb8Mitw+CuDhs+m5DMnndbhY20XRR5elkQprEk3mA
	v/fbdnyTAwzZGyIByMamRb7h0gviM+4xBsJQ6J/y+6x7p/OxI6YwQyUVff65b107CqUMT5qeJUk
	5TDjOST0a9gjaykAIludbiXc9djb0lLjhAgmIdWm689txs4GFq8A4e20wJTLr2vaVzVkQ=
X-Received: by 2002:a05:620a:4692:b0:93e:95ce:539c with SMTP id af79cd13be357-93ebd0e4018mr1010764985a.2.1791677411682;
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98ff9d8sm523933585a.44.2026.10.10.17.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: add Genio 720-EVK board
Date: Sat, 10 Oct 2026 20:09:22 -0400
Message-ID: <20261011000922.1089313-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_171013_137577_EEA18248 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Louis-Alexis,

A note from using this series' mt8189.dtsi as the base for an MT8189
Chromebook (Lenovo IdeaPad Slim 3 Chromebook, board "quigon" of the
skywalker family) on next-20261008.

The dtsi has only the cpu_off_l/cpu_off_b idle states (PSCI
CPU_SUSPEND 0x00010000). This firmware has no PSCI SYSTEM_SUSPEND, so
suspend is s2idle, and with those states the SoC never really sleeps:
the EC doesn't see the sleep signal and the RTC alarm doesn't wake it.
ChromeOS's mt8189.dtsi adds a system-level state that only s2idle uses
(infinite min-residency); when the last CPU enters it, TF-A and the SPM
put the SoC to sleep:

	cpu_s2idle: cpu-s2idle {
		compatible = "arm,idle-state";
		arm,psci-suspend-param = <0x020180ff>;
		local-timer-stop;
		entry-latency-us = <10000>;
		exit-latency-us = <10000>;
		min-residency-us = <0xffffffff>;
	};

with every CPU listing it after its cpu_off state
(cpu-idle-states = <&cpu_off_l &cpu_s2idle>, <&cpu_off_b &cpu_s2idle>
on the big cores). With that, suspend is real SPM sleep on this board:
the EC sees S0->S3->S0, RTC, lid and keyboard wake work, it passes
repeated suspend/resume cycles (20/20, then 10/10 twice), and a
10-minute sleep used about 20 mWh of battery.

I can only speak for the Chromebook firmware, so I don't know whether
the Genio EVKs' TF-A implements this power level, but it may be worth
adding to the SoC dtsi if it does.

The board files are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/mainline/mt8189-quigon-suspend.dtsi).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37

