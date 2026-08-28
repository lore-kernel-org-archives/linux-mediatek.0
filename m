Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5CFC61DCB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yImK2RT+MG+Lfu43PlYGxRfyb0mAO/U6ZqrL//pyZaQ=; b=uhwN1Wxr65UaeSy7TcXXjUAigq
	yj4fdXj8aGAxwqb1EeEm1SRIpNDHI4QlXIXidbWY3+PlesQcg7tZ7ZO+rF2vLS3QNqm9KK+FkmSaU
	5bQCnl1C3+4Ne2Eh57B0M8dJSejht8SXsJ/oCDUvcbdUh6Teg+EfFSWeWqHg5YOcpg9hE28zNAO0X
	Qp5hGSj8dZRXf6vrY+Aad3rdvMeGYyJwUNhs6qzcOIQ7oCOmY5rhDMoxIWKrTYVm9eAEfl7l/v012
	dObml70ZQ2j/NPyGAzS6BAQemxUc2JxppTHXzphyrK7qhL4jan9k9hFtGWb6xHWvdHi1CkPxWyyhn
	i2WBOdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00EC-00000006FmE-2aJs;
	Fri, 28 Aug 2026 17:18:56 +0000
Received: from out-62.mta1.migadu.com ([2001:41d0:203:375::3e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00E9-00000006FlP-49NP
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 17:18:55 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JSBFu5mtYAAxSf1z/Sc5HZpi1iqCxqQNp9ErZEemACM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787937531; v=1; x=1788542331;
 b=KKmmhBM68x9yX1z07xOBrJk7YoG6eEoRl07hBiBVXSeVTOslr21mNeBO77Bb3mX2w8hPjKFU
 l+/BSQVLmz7cjNYc18NAh8frF8MJ9NdQV5aFtF73nBJLMO9fWB/yMFhekKafa58Ly+eYv0ZGUN2
 E89bI+wbgj2SRuJQl3w8VIK3fF/eRkw2iHtvAL2s5wfIjbwB2zmzYabW8RR/t3OST6k1Jb5bjLe
 cX/MrtsVfAlZNzDm3avsJuE0zYhtir/1gflBr5iF5t/mWQ5/AqdnI7xkGafptVMvSwUpmBJSBK2
 r/w12R1CgzvYRQO8aDWMQijZl+DsjCkDccGydAOW5wA+w==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3182c772a689ec26;
	Fri, 28 Aug 2026 17:18:41 +0000
X-Mizu-Trace-ID: 3182c772a689ec26
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during probe
Date: Fri, 28 Aug 2026 10:18:38 -0700
Message-ID: <20260828171838.22038-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apGWXuPOSqZJ_ShO@parmesan.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca> <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu> <20260828011737.22809-1-lucid_duck@justthetip.ca> <apGWXuPOSqZJ_ShO@parmesan.int.kasm.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_101854_373655_F7206861 
X-CRM114-Status: GOOD (  16.81  )
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

On 2026-08-28 15:27:10 +0000, Klara Modin wrote:
> Wouldn't the Intel 11th generation have come with the Intel AX201 or
> AX210 originally?

It would, and thanks for the correction. This board's firmware carries
Intel's wireless power methods and none of MediaTek's four. I put an
MT7927 in it recently and the MediaTek ones did not appear, so they do
not come with the card.

> I don't think so (if this is the MTGS table above?), but I don't really
> know how to parse the table contents.

That is the right table, and nothing in it is padded. Yours is fine.

> so the transmit power limits actually look like they are too high for
> some bands, especially 5735-5835, but maybe it will limit to the AP
> transmit power and be fine? However, according to `iw list` the channels
> in 5735-5835 do not have the "no IR" flag, so in AP mode the card could
> potentially transmit ~8 times the allowed power (I would rather not test
> this)?

Every line reads the same because the driver writes the same number into
all of them:

	/* not used by fw */
	rule->power_rule.max_antenna_gain = DBI_TO_MBI(6);
	rule->power_rule.max_eirp = DBM_TO_MBM(22);

It is a placeholder rather than anything the card sent up, which is why
the same twenty-two turns up under every country code and not only
yours. So it is not evidence of what the radio will do in that band, in
either direction. The card has a power table of its own, separate from
this one, and debugfs shows it as txpower_sku.

> The 5710-5735 range is also not covered, which results in 5 GHz channel
> 144 being disabled (visible in `iw list`).

That hole is in what the card replied with. The driver copies the ranges
across untouched, so 144 goes with it.

Devin

