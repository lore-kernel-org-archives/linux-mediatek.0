Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0IU0JTIxZWkobbrAhqx54EIMQIEQglOBLnjEVBi+Lc=; b=qU7asHKURD4pUiKXHdBy6NM5ps
	RytfwyRzkk8R6up7W60YskjH1JL/dojfHh9rSlamt5AwbscZK3OnohK7mgPWGLdLYR3556OuBNZI6
	hV3qdsYEBvtc7lYlQRBYGVGMZx81JzXDCeNaLnjAW9Vhw83IjzzvYnCRifgIrvWO77OOrKAk6c4WW
	uWJ5Ur3Mcdc0ejP6BXKZgGjlG5MlDFUepJpI7ikjCMeSd1uqzLHmgV9URFDugEytsDmbFRWEBZxHv
	sGMJvnd5lbK8gbdxQyxxFM50IQGR6ukwdrs04fNw57MYvrVOLeIEnvHI0A2Jy/DjlRHe1lFWE4eKL
	VukxcSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdcl-00DdTm-QT; Thu, 17 Nov 2022 12:04:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdcj-00DdSY-NR
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 12:04:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A4846151B;
	Thu, 17 Nov 2022 12:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264ACC433D6;
	Thu, 17 Nov 2022 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668686644;
	bh=Ikq5sCPgb4XtQZfCV6zAGcn1drm+mhwPZncFZ+Fvdq0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Hzff2FbWP9+TtMFKGifeHDPfgg8phvXlbUzSDvaQk3IYN15hXa9B0bGvs7GkyAles
	 4GrVeAHN/A3lXWWp++zXsRT5qn7YI9eQp7KgAlRsoW4dmMPakpfWMJEAdjPPpHssew
	 hgmpqCCWwdFx6YCf4uvlYLzivW9ROOEQhnYRIOYPAkcwjrpCrQiall3Xjla2WiSBm4
	 QkRGtQD0QjpIoaP0Wm+/Y18UinKKXzzp57wbl9D873vlxrXHwR+W1/yIdbZmtxwVhm
	 oazlWYgQRk7oKWkWJ3jMcBpXS8Fm0uRXzNxOe9rVjGlLyhR0/sB1g3aNLHRPBq2Cew
	 wDruEFaNJdB0Q==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/4] wifi: mt76: mt7915: enable coredump support
References: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667929344.git.ryder.lee@mediatek.com>
	<b26b285a001be954967ec77a1772a8b51faee21a.1667929344.git.ryder.lee@mediatek.com>
Date: Thu, 17 Nov 2022 14:04:00 +0200
In-Reply-To: <b26b285a001be954967ec77a1772a8b51faee21a.1667929344.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Wed, 9 Nov 2022 03:02:10 +0800")
Message-ID: <87mt8prdn3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_040405_844337_7FB63B50 
X-CRM114-Status: UNSURE (   8.17  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> Host triggered and catastrophic event triggered firmware core dumping
> for basic firmware issues triage, including state reporting, task/irq
> info, function calltrace and MCU memory dump.

If you add module parameters please always document them in the commit log.

> +static bool coredump_memdump;
> +module_param(coredump_memdump, bool, 0644);

Please also add documentation here so that it's visible with modinfo
command.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

