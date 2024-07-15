Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF1FC3DA4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=415wrRTitLWxP9fLYBiNFhpeTuL+LCKkhB/1YonXHQg=; b=ryKFEzKUWgnCi7UNdD9WjIzm2L
	1hk8+nCZtVuP5rH+iPtY6noeldLH9iqIS6BfwYTk3XH7qD1+N8lAuOBVqZQiiXSZCnRgDTriNMlhw
	3KUWeGW/yJuFjTR3hvrSFLKE9N5iD1sYviw5MmjgvxW407AeXilDQvxuDlDp8jzme8vqzpkpqUT40
	RqWK/aJFVlkOoonf8z6mIrcVH6zIAbttfz2izzAEgzgtZWO+xFthZNkI6ED+WF2BTccc7BFG8icu+
	rx3UdSi4Z5GXiOv3J5IbPsQGYlH1ttdiPtS8/KJ6aod/uBPr4OLRC9Dd3eat1iWKHhhWJ3rVNooLC
	3k2r90gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTMAD-00000007HM2-2pSk;
	Mon, 15 Jul 2024 13:54:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTM9u-00000007HI6-11wH;
	Mon, 15 Jul 2024 13:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47CA1CE0E74;
	Mon, 15 Jul 2024 13:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED29C32782;
	Mon, 15 Jul 2024 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721051667;
	bh=415wrRTitLWxP9fLYBiNFhpeTuL+LCKkhB/1YonXHQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r9RH77PG2p1/wSJaMTEWJhlDxwKmBYSbuDXgbQsLvua3sdDZwD1yHCKFQUaAd7TSh
	 I2ynLR1MFi4+8FgSMFnygtSyfGhGJOSD3r0NV8R5oS8LqTLkDvzkav1ofu7nlDxFhA
	 3h/WFWMQmt0GCKdHOWyPSP+GNt0jByu98u2dhI4Vb5CPjUYMmwUBLoRI3wc5eNUsCJ
	 9iONTOZMsZJJOq1TO2q50xvYPEZdyWmi5qkZWIpSebqjKTLS28NlVxrDe9Yh5b3G43
	 7uCyiF+XNo/eU+ZgVp5i8SuOVxUrZ+zGZEybo2jBd82aY1/74e9X+SLFW3E/IAPs/y
	 KXmNX9Js5v9GA==
Date: Mon, 15 Jul 2024 06:54:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: kvalo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, guanwentao@uniontech.com,
 sergio.it.consultant@gmail.com, nbd@nbd.name, lorenzo@kernel.org,
 shayne.chen@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, chui-hao.chiu@mediatek.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [RESEND. PATCH] drivers/mediatek: Fix some mt7601u vendor could
 not connect
Message-ID: <20240715065426.73ba0869@kernel.org>
In-Reply-To: <A9442D62405552CE+20240715094714.1553336-1-wangyuli@uniontech.com>
References: <A9442D62405552CE+20240715094714.1553336-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_065430_490511_B51FE787 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, 15 Jul 2024 17:47:14 +0800 WangYuli wrote:
> Some mt7601 devices cannot establish a connection properly.
> This patch fixes the issue.
> We do not know why, but it just works.

Any chance we can gate this on the version of EEPROM or chip or
something else? It'd be good to avoid regressions on older devices.
Or possibly - could we issue the MCU command as a test and disable
the calibration if it fails?

