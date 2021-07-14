Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423B8C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:13:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB42613BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB42613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PC+OUKDh2up62xTv6w4CGfwqiJM4h+BojDKW/x70XM=; b=wi8n7vlUMpzELL
	Jfzw6oUn45pi6KmWX6iYn3UneOJmHE7SP5D6yzLctDVD15MntEBzAq0UyC6EDjLdIz4r1byKdykP5
	5IQTXRzna0P5JWRuXONDr/Hektv1uxyMCFJFrkS0VG5J+0tr1uZrRNipuc1VSa6SL0GOM+dz1aC91
	fx/ehaem1kqKkQs06Uar10dxsPYSdypA7hkMVzto9loD93AiwYHQxqBcUuKCRfi3QVk9a9GFnFweX
	pXBkQd1wNq9x9DbOsRcwWu+qY9NjrFfAYb/HZPU8ZkwYJhuKlnjl+FGdhuTSHNjDu/FoVrCJEzOyP
	anI78hYIeO14oqZK3WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3o45-00GBDT-Rv; Wed, 14 Jul 2021 23:13:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3krn-00EhI9-Em
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 19:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=X3NTtRZZfavq8tUwtnJa4YEwGxb8+reN+LzCH02gIG4=; 
 t=1626292101; x=1627501701; b=tZfu6qVR8qRaJE+pneuJkbwjwPGAGIwkn+xkHtcTl6TwDrS
 pdXuzxPuU2Gx0wW7h1VcS3Sz6q1KN389gRu7Mvd+3TqlqpUfs9TEe4EdfMy3eH1hHGTBEN6rYmHl9
 MuDCTyWaw5ryya5UtdfBBYwiP38XcKlavMyrJLxOTbo+J4ISsT8XvyKXRO0lfp3iUu8g5aaUk9P09
 0UKjTI2lJcBOlUzJaZkqFFfzUQZxeLhb06jRzrBZQF2Sz3plmIluDK8bXXYsP4spjdXkA3SlHVwll
 VjOQIH+k8wYOcmUxi2Xf3OdojHnQxKvdsW8leK4ubOcHUNL0SnysFrkjF7hk7j9Q==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m3krd-002Jd6-EI; Wed, 14 Jul 2021 21:48:13 +0200
Message-ID: <bf14b6de4229f18ab2dc7fa6a971f77638fc50c0.camel@sipsolutions.net>
Subject: Re: [PATCH] mt76: mt7915: fix endianness warnings in mu radiotap
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 14 Jul 2021 21:48:12 +0200
In-Reply-To: <042666b307b7a424680bd20b6ac3bd3a74e3a1f7.1626291427.git.ryder.lee@mediatek.com>
References: <042666b307b7a424680bd20b6ac3bd3a74e3a1f7.1626291427.git.ryder.lee@mediatek.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_124823_636400_4D7DC24B 
X-CRM114-Status: UNSURE (   6.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> 
> -	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, cpu_to_le32(rxv[3]));
> +	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, le32_to_cpu(rxv[3]));

Instead of

	FIELD_GET(MASK, le32_to_cpu(value))

you should probably consider

	le32_get_bits(value, MASK)

(not really sure why the order of arguments got inverted though ...)

We might even consider doing an spatch to get rid of all the FIELD_GET()
I guess.

johannes


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
