Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FF606A325
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1sg6HqTu;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dCWNjcEE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fOct1Oy2zs2ObMlRzcVP+Z//u6uH+3SrxUPuN9hSflg=; b=1sg6HqTuFGoOANHbZCIcZfGv+m
	QFYGir+1KuR6jefamD148An2P252lChTj6hSdnvxIpRzV+6xRujNdgvQg0zywrLlsexQ1ZxFHwu59
	07yJHaRlhk8gLDuCelkETeXtJ5JqYL2Fu85zynVca7tguiJdm2qYL0hlyxXu+kQh796UxhyW5G/Bz
	we+nWDKrWq8tYbLlz9dtKrrwKfbfFm5TmFSFg87PvhzbR16fT1VMnOUS73MBoXdlPlDaJY8h1CvAg
	L/JhwGRXtCjC0Dc1F8BS4oBdjLT/ZvQn8aKKZ7B1MOBrcSdh5WTCElNtbYhnDuKp9ZqrZEC0Gb45M
	5pXhWNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhO-0000000Atiq-03hJ;
	Thu, 19 Nov 2026 05:28:42 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuhK-0000000Atgw-2nra;
	Thu, 19 Nov 2026 05:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fO
	ct1Oy2zs2ObMlRzcVP+Z//u6uH+3SrxUPuN9hSflg=; b=dCWNjcEEo0Eep4yh4M
	1An1BBh9LPhkfTGTd7WaDwrCJciGjQNZyY1d3U3uI1YLWMMjG67Qd429SDffZyeZ
	s0lNW88bvcisFDJA5hegS9v27ILQ+ftpiC/v+6FoUOfYQd44GsVGyZ9tvLCxa9sq
	TMAH6HqhjSujyq+ecvic1EyWM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX3+zviP5qaWbXIA--.59393S2;
	Thu, 19 Nov 2026 13:28:16 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: viresh.kumar@linaro.org,
	rafael@kernel.org
Cc: zhongqiu.han@oss.qualcomm.com,
	hector.yuan@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource leaks
Date: Thu, 19 Nov 2026 13:28:09 +0800
Message-Id: <20261119052811.2877720-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3+zviP5qaWbXIA--.59393S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw18Ar17KF4DWr1kGrWUXFb_yoWDtFb_ua
	yrCryDWr10y3Wvka17KF1DZrZrur4xWFy8JF15JF90yFy7Cwn8WrZaqr13Zr48ua10kr98
	Ww1qyw18Aw1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUjNt7UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hG4J2r+iPFx+gAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_212839_131882_B3C8DAC7 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes two resource cleanup omissions introduced by commit
d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").

Patch 1 releases the resources when the CPUFreq hardware fails to become
enabled.

Following Zhongqiu's suggestion during review, patch 2 handles the
additional failure path where mtk_cpu_create_freq_table() fails after
the registers have been mapped and the memory region requested.
Thanks to Zhongqiu for pointing out this omission and suggesting a
separate fix.

Changes in v2:
- Keep the original hardware enable failure fix unchanged as patch 1.
- Add patch 2 to clean up on frequency table creation failure, using
  the same Fixes tag.

Haoxiang Li (2):
  cpufreq: mediatek-hw: Release resources when hardware enable fails
  cpufreq: mediatek-hw: Clean up on frequency table creation failure

 drivers/cpufreq/mediatek-cpufreq-hw.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.25.1


