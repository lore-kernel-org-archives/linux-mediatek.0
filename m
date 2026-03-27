Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003BA10A62D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnYQyy4CIDZ+UDVBQhtZGfTVFPQdwxplb2xmifQE3/g=; b=YUzFjz1Iyy7YFg6qpbXtNXVQwK
	J4/QFQC+AXMx43kI4I5AT/L+yM+t+x/ujIANOC7hyfzw7E4vxVecnEIYdb251qKHryCxgzfOu1Y7h
	levbBrj6SF73v/CWCQBj8OlzanobByaH+bWXs5HUl7EpNxGXOk1//1Mhs00m7DWZDf+/yhbGOlNpQ
	+qydqicigIxnTs7jiPC6nn69mlgjfnWGnji0uC/74cgZIP2o6y6LcO4zWD1KFpATzW+3iGwEyVnw1
	Bo418De9JXK2bQT+js+XJRapDp9ONNXpMiBBfOPAj6R+O6e7nMewybBZhQqvllT18HEteTOeMy2bg
	uq1YFXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wjl-00000006XU4-2QGG;
	Fri, 27 Mar 2026 02:15:49 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wji-00000006XTD-0FUm
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Mar 2026 02:15:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1774577741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FnYQyy4CIDZ+UDVBQhtZGfTVFPQdwxplb2xmifQE3/g=;
	b=bOXSPqDth8FGuuXnKq5tSaxICd3jwuC3C2geHyQtNrDzSmma3dMyd2jIDaA8gyT31dcvZ1
	AcXDR1D/D+EwNt/S1boyJYxrQpKBBQRBLtmAZP0Maeg+ILJQbpT+yPvSbteMfmvLzQw+AZ
	fS77tDcNctUG5fOlxfBYA05U37Qo2nr3+5w7lzQQwjxO8oqCWUBcqB6LvZtGEdsuRnSbrp
	EH6yl3j1C2mNPxxRef7QvEZwzIkRR6oY9Uz5eoWOGJ1eXf+MSFXR7c3kc1jvMgffeuqTze
	a46fpgFF8HH/VYFNM+PfBRccjWHZAM9C9u/YtU3WqQV+kzbDXWUFJz91wBbN9w==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: sean.wang@kernel.org
Cc: nbd@nbd.name,
	lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	satadru@gmail.com
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
Date: Thu, 26 Mar 2026 19:15:34 -0700
Message-ID: <20260327021534.448552-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260325043318.13298-1-sean.wang@kernel.org>
References: <20260325043318.13298-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_191547_350172_B86FC73F 
X-CRM114-Status: UNSURE (   3.32  )
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

Adding Tested-by from Satadru Pramanik, who tested the full 3-patch
series on MT7925U with kernel 7.0-rc5 (US regdomain):

Before patch (5 GHz ch 36, 80 MHz):  txpower 3.00 dBm
After patch  (5 GHz ch 36, 80 MHz):  txpower 23.00 dBm

Tested-by: Satadru Pramanik <satadru@gmail.com>

