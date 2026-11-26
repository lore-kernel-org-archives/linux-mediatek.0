Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E9606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KN9NajxH;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=klb3IJ5R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hy9l76kJSdlGPxuskTIu/Sf3zHIbanodiZ2WuGUccuQ=; b=KN9NajxHNXXlGJ
	375g8ZU2r641FyzbA7818ClW4Il+cnIDWXWgHeAkfpnMyJmMAzDOnrnH8FtcBw7B7oZ8kdVksYz2T
	6CUenjTe3Si5yWXU0dn3uRI3AfJZq6Mmz83MhTQzK+gk31YRQu8MiSeWwGBGcIPWCdODXhR/4anPg
	G1JkXPm6fAHigpEu2Y7wqulsLl7AcWJOWOSGLaHE7LaoaTVO65bEbK8igkgrp49Gnm9coDf44C8ay
	WcsInOvrBLAuw0Q8l52+rlNpLe/dsoGItCkD0qC3C09vs++WweeihrkgL2V0ZJFujKx18Cmndjegj
	2jP0iFDj8j2xSLGW6caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfaJ-0000000EP8j-0BeP;
	Thu, 26 Nov 2026 19:56:47 +0000
Received: from out-199.mta1.migadu.com ([95.215.58.199] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfaF-0000000EP6u-2hnF
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 19:56:45 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hy9l76kJSdlGPxuskTIu/Sf3zHIbanodiZ2WuGUccuQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795723000; v=1; x=1796327800;
 b=klb3IJ5Rf2HTMMeUaxauBqfXsZyuMR6Dz00SWAhO+oGUkpEt1wXeyKEkQu/rln+wlmhXfrjf
 kWuOtLSMihY5Zl8gp/Z5FyM/WaiJXJxX0XLKAeJdnO/iKIezzQtRChxomnAjpnJF2UkTplsTAYA
 J0qaU3WFUpX16hVNKVYA2MtDxfMm6q0cReMuoS21TJwmuMoiIYUiJN/WO3z91XIHwM6FFBViKn/
 id244JelvvPTE/57oU9+q0+4yJ3EFsvJ5wXwQV+1yNt2sB10oIvqO4H9aDsrpsItYe4EeeHdAAP
 12tn5rxYboYkyAO+Ahsb+hs395C57L45WK8nnWKQRnm4w==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f9e9ceb29dc6adb0;
	Thu, 26 Nov 2026 19:56:39 +0000
X-Mizu-Trace-ID: f9e9ceb29dc6adb0
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7925: fix MT7927 receive loss after a channel switch
Date: Thu, 26 Nov 2026 12:56:28 -0700
Message-ID: <20261126195628.18471-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261013023810.256061-1-lucid_duck@justthetip.ca>
References: <20261013023810.256061-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_115644_143758_362696AB 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 12 Oct 2026 19:38:10 -0700, Devin Wittmayer wrote:
> When the access point announces a channel switch, an MT7927 stays
> connected but stops receiving until it reconnects.

Gentle ping. This still applies cleanly to wireless and to mt76-fixes.
Is there anything you'd like changed?

Devin

