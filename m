Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEB1CA9EC5
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=; b=tUAK8d8tOy8311ItwRAegzxpAF
	EpKwXnZ57dDVCrTAXO68Z/aZ+xYSpPQVJMBLogcLteQlXXkbL71/Vojmazyb/adESoStOgk33j6GW
	l1wYB2SBXt+D7T37+ICthSaHGyO1nVSuLPCycCFnzH4zhgr9rmC8gT4xRL1NFOHwPkMkc5fE3+zpr
	ZULUXC3nwzC5ywwADB0H6bxIoOl0lsqQC9D/nmNMm/s6qhJP8wa5VeMEpbij+vfVoQZMXd/wpT4vI
	s7aqW5fimBfKRqSD5MWxGFOd9i0VRqRlorg5Bgq/N2SWxmmRshj01uabhfZ1tZW/97j+JG3biDiRB
	xeZUcCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhAA-00000008ZLw-1m0q;
	Sun, 11 Oct 2026 00:11:38 +0000
Received: from mail-qk2-x05.google.com ([2607:f8b0:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhA4-00000008ZKd-3aKP
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:11:37 +0000
Received: by mail-qk2-x05.google.com with SMTP id d75a77b69052e-5337b59ef7fso6350111cf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677491; x=1792282291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=FPeVnrFBYsOUHKsYrvsxPSZf+E8BFXmfJicqrV8hC+uqCYzayEaYoVIjDsCTWd6/nO
         X6gt/w7OXbrsiAWBZ729hEe3jXM/cnyQmrGgYQ33UsWdS76SzMDhYpl2/k4dvpYncURQ
         kmpJGhxeCRQikss20tQs/5y+6Fs/ZrIl0Weg+ofRXlcxokS/gnPNsvBYaikYtwzMgnms
         pGoS6aEnQ5MpqMcPIIOjwkPuzMf8EXvsJQBEMnFMHr4KrZtxDiQBIB2L9qTSj71fBDF+
         152VePqxk0mAwN3X69lxa69MqdNrdQlyEvhU6G3/xrss09iTiN1fBgUGKBNn33HB0WSS
         9u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677491; x=1792282291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=pq7eMbXn2/gx5I02/dTVcem1byCRisK8mBJhHVoe6LXFkp6pwFL9nw2GVgPDsmNnvs
         3Q+gqIAd1SW/k7PiFqOwudN3vA4+jndpMt2CoSYjgC0m3EXo3Kb44RaBWi9s+tkMGKrA
         xFlXlPSe0i8OFtVOjPRp2RlE352yhcgZ0DJjJqnmlRN/imd6hBGlWOtYrnojBXuBeqSA
         a+PBmMbqLlk4+XjsHhPGQcLbtcEXPXeCx2g9UojvKp4e+E2ELGAFrNLnLc5hmUrAswKN
         OASs7pFM3SVs3X6XJFoiddApKMdYoCZ+xATc5ECLIrXKl46Y24EZGlCadq3HOeFbqWdr
         zQSQ==
X-Forwarded-Encrypted: i=1; AKwUvByMdsJ1cW0OoprDXYgqqpEe8PxqsGhufCxQ9frNji3jWFZD6oxwPOLqiQ57QqXfobTZmby3XqwbNT1aQlqdiw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLyXOP+b5Z9XHEBoCUMBtQcxJYzevNCUIy7LGzjTBQQrXhzKP8b
	CF1pXyIEkvDhdk+dVnXRsSFFQkMNxnQAx9iFAxjr8wNsFsVgR0BwWZp0
X-Gm-Gg: AYBFou3XOnmE+gnut3XDMwyqk4EvmZvVnjH7mjW6LXcuPMM0wp1VQDsw1iuhO6wDY5i
	S1o7kUAQsGGop8xXWWPcaKTv0HmBMNgPFP/Onsu8p3+BkuXmmELvS9mAV/gTQeIx00to0CRRQAz
	EIWFq6rVH7WLiYKVESPFHgKB0WABBeVHV8oCJOaXFTYGcYGJPRBro0k4qtZ81EXcaP/sHEC+7a4
	21s8aJ+PiuDjbRWAaWh4pLg2Nz2EWsCmxD5UZ54Fga7VfoYptdUWk+qcWl77gWonnLxc/tcgzM9
	jybUe0UPY5TYITBjnjIrBlugtTP99RrtnKHPOzXnkMYwvXaUOfVSsEwQXq924fWFXuLQ8tvWm9u
	Z/DgLXd8YZ4gXC6rbA59T6JTz1vrXPNCn5dOvCYbcLOoBBwDBZAUcvZgOvfrT4bsoxF/Od4pYfH
	vmT8f95uaa8HgP+wyf889hh/jRtE9Lg1JoyPVUHk7RX+Fj1Ay6HPWCHmLfrs9ISyEXu1ohNo1fB
	dfcZw==
X-Received: by 2002:ac8:5a4e:0:b0:535:341c:e2c with SMTP id d75a77b69052e-5359fb8f878mr101828041cf.39.1791677491408;
        Sat, 10 Oct 2026 17:11:31 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6aesm57217596d6.2.2026.10.10.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:11:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: "irving . ch . lin" <irving-ch.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <mbrugger@suse.com>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Qiqi Wang <qiqi.wang@mediatek.com>,
	sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add power domain driver for MT8189 SoC
Date: Sat, 10 Oct 2026 20:11:23 -0400
Message-ID: <20261011001123.1092269-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
References: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_171135_767905_73A1F538 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Irving,

Some findings from running this driver on an MT8189 Chromebook (Lenovo
IdeaPad Slim 3 Chromebook, board "quigon"), mostly around system
suspend (s2idle through the SPM), on next-20261008.

1. MFG1's EMI GALS sleep-protect step, BUS_PROT_WR_IGN(SMI,
   MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1, ...), targets the EMI config
   block (emicfg_ao_mem at 0x10270000; SET/CLR/RDY at 0x84/0x88/0x8c),
   so on MT8189 the "SMI" regmap has to be that block. Without a
   mediatek,smi phandle in the DT, the step went to the wrong regmap and
   wrote INFRACFG_AO+0x84/0x88 instead, which was one of the causes of
   SErrors after resume here. Giving the MFG1 node
   mediatek,smi = <&emicfg_ao_mem> (a syscon node for 0x10270000) fixed
   it. It may help to document this for MT8189, and possibly to fail
   instead of falling back when a domain uses an SMI step and no SMI
   regmap was found. (access-controllers would be the modern way, but on
   this board fw_devlink then delayed boot by about 10 s waiting for a
   supplier the syscon never gets.)

2. DISP: at runtime it never powers off here (MMSYS, the mutex and the
   DVOs have no runtime PM), but in system suspend genpd tries to, and
   the power-off is rejected part way (genpd debugfs idle_states shows
   "Rejected"). That leaves the display's memory path blocked: after
   resume OVL stalls (no vblanks, larb0 stuck busy) or the display
   faults with an SError shortly after the video unmutes. Marking DISP
   MTK_SCPD_ALWAYS_ON works around it. DISP has a single bus-protect
   step (MMSYS_STA_0) while VDE0 and VEN0 have two (MMSYS_STA_0 and
   STA_1); I don't know whether DISP needs a second one, but something
   in its power-off sequence doesn't complete in this state.

3. PCIe: to keep the Wi-Fi (MT7922) up across s2idle, as ChromeOS does,
   PCIE needs MTK_SCPD_ACTIVE_WAKEUP and both PCIE and PCIE_PHY stay on
   (we use MTK_SCPD_ALWAYS_ON for both).

With these (plus a cpu-s2idle idle state in the DT and a few driver
changes elsewhere), suspend works: repeated suspend/resume cycles pass
(20/20, then 10/10 twice), with RTC, lid and keyboard wake and well
under 0.1 W asleep. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/patches/mainline-mt8189-suspend.patch).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37

