Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB1CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EkFb2rmMItvPU09Xj3/yToO50k6JsJJgTdjvGqh2xU=; b=ee8m0j6wWO7wK3r9WVhz+IYqMy
	rW2aF/QCXMw4qZcf+vDrF3E4CcOD8OG9SQ3HwdAacOwaWTTzLKsJy5zfVnrSceJZ/eVA53wZs4z//
	gB6hGs2JyYK7aZGvxfy/G5yYTcnfaWupTwPQl481HrdVt+DwplYiSDISO3btbKykS+f9/lLcRs1Tx
	dEa2m8eEkwgs2U7nwbxwbj8R/dub52SkpLrbYOmEAgLDFbk863UF03WLVQBn0D1UzMaipelP+3ofq
	3ceuZCslwEx1qxCrMHrImDbvE/Hs/ntvt4Ifvj1FR9PgmZm1PghXFsaAJU+AXe61pH3crlsKuS2vn
	2gYhB7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlzI-0000000GsQh-1fVw;
	Mon, 05 Oct 2026 16:56:28 +0000
Received: from out-61.mta1.migadu.com ([2001:41d0:203:375::3d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlzF-0000000GsQ8-3hg0
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 16:56:27 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3EkFb2rmMItvPU09Xj3/yToO50k6JsJJgTdjvGqh2xU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791219383; v=1; x=1791824183;
 b=ZFtR6SbgZg/nDmQYTZB1BLD6EZ73Gcdq+qgslN2/aFjmFWiP2kUWvAWjBnrN4xzoctwe6/HR
 PW/CZRZ87PYKTN0h+W88tJZP/BkM4f2kKPhUIqlJBkTJMU/6obFdKSqoBg3IQfLi3+72ehDvuc9
 CQL27ZboyJVgLG38hVlzGUfY/M7Biuvv39VuNELw450q0GV42lA2m1tDu3KGpmWPGwMAhcL/ReZ
 HyxzQamxpKI8sTw6BjynNNLWg33ypN7oO99t6frGuNBgi9jA0a6rzXIXXVpPSyv944IeV7y/8hP
 IXPKSTBTp/wgixfKxJKbPUdrpoSAuBUy0xtcMBd1+czSg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 60ac52aa7a996f8e;
	Mon, 05 Oct 2026 16:56:23 +0000
X-Mizu-Trace-ID: 60ac52aa7a996f8e
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Quentin Herique <quentinherique07@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [BUG] mt7925e/MT7927: panic in mt76_dma_add_buf when hw_scan runs after a failed WFSYS reset
Date: Mon,  5 Oct 2026 09:56:20 -0700
Message-ID: <20261005165620.218829-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAK8JKts+x7ioj2omw+hrQrKtRDbZ3yCYXavVpfjodOG6ro7t9w@mail.gmail.com>
References: <CAK8JKts+x7ioj2omw+hrQrKtRDbZ3yCYXavVpfjodOG6ro7t9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_095626_390786_E924E3E0 
X-CRM114-Status: UNSURE (   5.89  )
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

On Sun, 04 Oct 2026 12:52:54 +0200, Quentin Herique wrote:
> Workaround in place: blacklist mt7925e. I can test patches on this
> machine.

This should be fixed from 7.2.6 by f544bcba4721 (mainline
915672c5ae32). Its DMA index check is in the shared mt76 code, so it
covers the 7925 driver too. The drv_pmctrl patch you mention is in
Felix's fixes pull request.

Devin

