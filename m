Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD3606EE86
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SNv+0lYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Date:From:References:In-Reply-To:Subject:Cc:To:
	Reply-To:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JHU6NDJj1SFEvpbgMNiyc6IDhtPtVD+Yd+hE11LpQ8U=; b=SNv+0lYJQ3tb/Q
	Bdvv9I3lFfbNkEzvAE0+5bc5NlIgYcwcIaXaMKb/Puuy8uTneEW7Sa2/gEiomGY1VLVQhTsEPvDYd
	mSr+CJZCwK51vu7ThkWxos2ygiFV+og3vE3ugx/N2pdGNwjGl4phmu34sLuDooCa6VBFgQsXVWXUR
	EphMtTGWjArIDq+Z6VnsDrDdPDNEp3q7+9ysRysNjNcAk+EUJMh59Y5xZB3Q7FjmIH8YvKFrh4bxk
	P/sG1mgrNTuNVDYMs1Q8dWpI+bS+O5TR17/+MzSSaXaqkrdyDX9cJ4EQNokwRbDLqU/My2yku1WAV
	sqHkciDLoJs9uVlTPfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhDZ-0000000Eo5V-2HNb;
	Sat, 07 Nov 2026 14:16:29 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhDV-0000000Eo4q-2no6
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 14:16:28 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAnvrOuMu9qM6GFAA--.6298S2;
	Sat, 07 Nov 2026 22:16:15 +0800 (CST)
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: nbd@nbd.name
Cc: lorenzo@kernel.org
Cc: eason.lai@mediatek.com
Cc: angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] wifi: mt76: Fix skb reference leak on USB/SDIO
 tx_queue_skb error paths
In-Reply-To: <20260917154813.5823-1-lucid_duck@justthetip.ca>
References: <20260917122058.2150817-1-vulab@iscas.ac.cn>
 <20260917154813.5823-1-lucid_duck@justthetip.ca>
From: Wentao Liang <vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 14:16:24 +0000
Message-ID: <179406098498.2377448.15079427927957536712@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnvrOuMu9qM6GFAA--.6298S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyDCF1rCw1Dtw13uw1kGrg_yoW8JFykpa
	97Kw4aqr4kGw4Iy3W8Wr4xAFyakr4rCFWYvF98Cryqkr15Xw429r4Ygw4UZa18u39ag3y7
	tw4Fqrn8Ja1DtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkF7I0Ew4C26cxK6c8Ij28I
	cwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU5HT5JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMEA2rvA8EwcQACsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_061626_103350_DCEA348D 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Devin,

Sorry for the long delay in replying, and for the time you spent on a
patch that had been generated against an older baseline.

Thank you for the detailed review and for pointing me at Eason's series.
You were right that the USB half was already handled upstream. After
rebasing on v7.4-rc1, I also found that the original patch had been
generated against an older baseline:

- the USB half is already fixed by 82856da2d3b6 ("wifi: mt76: fix memory
  leak in USB TX path"), so I have dropped it;
- the SDIO tx_prepare_skb() error path is already fixed by 808f2767d421
  ("wifi: mt76: mt792x: Fix memory leak in SDIO TX path"), which is why
  that hunk no longer applies to mainline.

What is left is the queue full path in mt76s_tx_queue_skb(). That check
runs before tx_prepare_skb(), so no pktid has been added to wcid->pktid
and there is no status table entry that could be left pointing at the
freed skb. I am sending a v2 that completes the skb through
ieee80211_tx_status_ext(), the same way Eason's USB patch handles its
queue full path.

For transparency: we found the candidate with static analysis tooling,
and used DeepSeek and GPT 6.1 sol to assist with the audit and the fix.

Thanks again for your patience and for the clear explanation of the tx
status table.

Best regards,
Wentao


