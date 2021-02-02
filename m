Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C381C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6FC64E40
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6FC64E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2MBkQXrtKcRqV+nM5MoDqtrNCu4nnM1skGAC+ku90bA=; b=hn5AQVerAlxnKhyxsmflLdVvY
	0cfyfQ46yWNIZa8TV08GGFR8ByPBDqDlzrE4m2RnKy/IEsyslCE9hMikltzz+5mJhh9PNGkg6y1Ay
	m1KWBxXqZ6I6eb16cyuzTzE31LRm53D1s2E3jxo20lRLapA5FBkU5HSiXYVbxZ4jwigIs01ZR7jMO
	NV6Lu92q3xxiqOvLHxgaF8C+A29QZeWLD41tICyAm0w9rLNWM8F9weU18HiIIJeu71adpJFN/5boD
	V5WO9NuXwS6EQCyHj05goxZ7yX9rf9c3fLCXx/VtRHxi0zyWTlaFBoa5AjmQN1uWZNpu4mTI0aw35
	HHwPH9FTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCQ-0003DP-Dp; Tue, 02 Feb 2021 17:10:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCG-00038c-2K; Tue, 02 Feb 2021 17:10:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F1864F90;
 Tue,  2 Feb 2021 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285835;
 bh=lB/MY/hwqaGFkU+ADnUf+L9HD2CW5JsTy/vaikCTH7E=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kSdJZOokFLSjHNkGgMVfmTdaziDOY7jQIqaQkDOM+cqthvhjZOXyUgltj+o8Rivtn
 HXT3rvU+1Ca3lWlj/KrdWzXtgfmj2akLpeHMmTtTm6wehsQjJTyHmtRXlavdK3OBIB
 XY55fTf4ezJzrjHwCcTdiv3tiytKEDYm/l4HnfuP5EJ5F1S8AfBxL3y8e9W/cyUux4
 SbiTIt2nf3kgMk73d4XgipN3KJE5JEr//atYVw7Y0M6XrBfUyAVldQ16hCs7vy8nn0
 LBR5Ak9EH9f+z+gZKYZxBDgl3VsjTWpu82fev7xFslCiDcv/wBmBmREAhepELatLz0
 Lz7NriaQWctSg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 18:10:12 +0100
Message-Id: <161228552305.1852435.3470546880273148615.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
References: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121036_231487_1EBA94D8 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Argus Lin <argus.lin@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Frank Wunderlich <frank-w@public-files.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Neal Liu <neal.liu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 11:12:26 +0100, Matthias Brugger wrote:
> Please find below the updates for the MediaTek dts64.
> Lots of work is done in the MT8183 SoC which can be found in some newer
> Chromebooks, especially around grafics support. Not so much is happening on the
> shiny new MT8192, as we still lack some core drivers, which provide a lots of
> dependencies.
> 
> Apart from that we support two new devices for the MT6779 from the mobile chip
> line. One is a SoC specific device called DEVAPC. It provides a kind of bus
> firewall which will pass information on potentially malicious bus accesses from
> TF-A to the SoC. It had been a long journey for the driver and I'm happy that it
> is now supported by the device.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 542b9f11e5643d165d43e45675993e040cf32e5f

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
