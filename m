Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2194606A325
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RuW/tc2Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtMwdRvg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=; b=RuW/tc2Qy7WBEO+RNlOXEcTUPt
	mSrlOaaCpFvUsazrVglpDWjOaXemW2viwDUo3XWijG5fWGAQONSCUutpV7IDQeFlNed+OnZTTxcua
	UttFRHtWoZNNIz7+BWyG+WexsMjYNWwGWnWjuOhHm1DEN0+4Og6EFtFzs5uXtgsUW95BdgDbTexAV
	A1a0ytWHkQiUdwle7D8ETFZxFkLN+li1Pa8hL317gqWV5Y83sfwK5lDapr/2OeXxwyyDMfHeluCfz
	uu0vuMabfoH4q6YG8C162FcXc9X24ZtHufyIAw2wi4BpMMHSFfY5SEh15WIUdelArkAHAuBeVY41D
	N++BI/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIyE-0000000EEBy-2JdB;
	Fri, 20 Nov 2026 07:23:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIy6-0000000EE80-2d6j
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 07:23:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4a32576da88so257275f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 23:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795159413; cv=none;
        d=google.com; s=arc-20260327;
        b=RBc6ue5EuoPV+Zs3SLjXrSbmRZkEZXhPDQBx/BGkA/addg5/3WAgSoK/LbDBC5MXbT
         6/d2Q0e+GEI8jfNC0Qq7cA5nw81usAFYXkBnVYRo9Wltlf4bPjqjMbWsBCdOqGrAu8JW
         WAXLWMvrrkTNTff5qjlm06w8uPk04KmqZ21ucGIwMHYxQPQMoVaAwXxyIjjgOyHOt+mm
         OQTpg3f2O2iDf2ylua0gE5QiPBUI0nFJmdnROocWWQWV7TczgxuuuPgLaDh3LkWIHIYm
         ozgep6L9umYBKiBGsRFL08rHGy3MaaxCSj7JVt0GCyp8e7TOL/6unMhSOoRMSHNiSZ9S
         8WJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        fh=n0FktdTn2/WQWm0sn/uYEkxdmPlHEFwx5R93aF8pvIY=;
        b=YHraouY43lLy0+5nCuDakoLKJwx3rwA0gYb6ApVSqiVf5A/YZrPaO874w2jzUza0a3
         6IZzoilIH6t1Lc5JkSKUExMO5gG0KvFq5l+gyEFxXyyfUmAXhXBOsZm1uEjpqNpinojX
         Lda2KCvlqy2ATQMl6WOIdrIu2t/3wrQ76N3ciEFgQf9QVtAo23Z+WBsY2EmSIgdqfQJI
         Axs0O6y867a5EvdgbZ8zgw0tAfUUurGMvJDv/FMCvme1HxbtvlDztFzkdStAFCutwXso
         Q5dUS0EDunYj+7Keuu22c2HkOkNueD0QzLBilERU/aQnW+pWxq0ZQTySrkgsiXupkaIf
         idaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795159413; x=1795764213; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=EtMwdRvgxfGYdwt2gI60fbTye8q/TyuL/FiVGUW5ET+UEFgBi0v+nqZHM4YiImlqVz
         Q/ID+dcGdSHx+KbXChcpJhZe1yyUOL+KSZcCsLLHJrBkwCKAzeMMx58NHoXLK0afO8yw
         kVYVLUP/Kgl6aBeZcozNk+evxNDuFlFdv8EuEFpkN1beH468g7aLgVDEHxQZ8wY091Xj
         oMeKy3CZfh5ac2oY/KVDEIVFRQOYZZ7bkt95s0Lzt6dYpuMRVWg0kJEdFU0u4j74TTTZ
         Kbri1OXgnIA6EVBYYHxJMSBbFU27QG7fY5gDL/Jzp3J82hRJ14EXl0PgjDbN1R1CmX2r
         j3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795159413; x=1795764213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=vpwHG1bonMY7uMkJQFCBlTTND4rrh8WhbnRKB3MAtuY9WJekrK/3tKkyUDZmNXkPou
         NvRW1m6gTcabpC4lceYvVqTztxeHfbyK1z+2BPi/lyBnu3sitQpSNwdY4Y+q5c7X9BsB
         ZsRePz4Py0i17joG5dONww66/Nei8d+qA2SHLkNrh4UGMrX2rnLCh73AqIGGWFO7HLX5
         VZxH03aLu5nIScdoPdh3Bu8E4F1/XLPch4+E62cQBY68os2x2ZOueb+6tQe43qfU7ynK
         tNcZGTpQCyOWJ22SRjJL64863as3x0OFtogaSWlCmbtKfMLTlQjtxns/aQuGk75Y+tMU
         zeOw==
X-Forwarded-Encrypted: i=1; AL+hErHdGtZvObqB5Qj7yaY12Mu85RQJoNNM865pSeWWa+MUs/VCtxpMUCH3hP+Ccn13OPxX2WtF1TDV7nsKxZLS3Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZvtMSCFjU9crdhvhqeQbFhxLCGlM6411LU0OJe9+NV8eYPdXX
	vPiHgZF9Qc9rsdQyil6LsKDQCC3yWzdA324SGrkmMpGpjDTWjgbxFA8JGFaDGUEQksX/WqwCjZn
	ist8gpvwX46MV3hHRCK/hkTGt5IvZ2JA=
X-Gm-Gg: AZFdTZeOVjOxbGmeq+fVtQ7K6TqRD2KwCn6Vu1ILJjNurnhIwGqTCaT9gj/Y3cLPAWv
	beY67QZ7q6rQ8YAbzBWOkrJpVSNW+m47GdIqV/ZbxN8Xl5Pu9FAVTrZv/BcGCMx7ZPjwPbiAYuy
	g629ibl1HfU85Pv/YIec/3QGSZJ9BJNowl4gskFF+e3dcGS4s90oOSc/RIRStofTg125A52L02e
	Dhh2afvJ23PWw2KuyauqarBbstx0UH8DAW1pdmYPeFFSTV4MQQd1Pbovk/7rJXsKUNk7WMrXf0t
	J5iUlpbQeqZ29qOPZSXfKgxroGBgU2gU0aP1Xg6lduFHAmu4dbve9nI3Cw4JUmvxS7ah2hWQ2h+
	YjMPmoOl/EMxjCCAFR1CyHz+ISlW6OWULW5nP/DGpdHA2UnVg2wy23x1Q7w==
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id
 ffacd0b85a97d-4abb532ea79mr3553673f8f.29.1795159412630; Thu, 19 Nov 2026
 23:23:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119124928.1398520-1-maoyixie.tju@gmail.com> <av8osemFMD6C2EdK@lore-qca>
In-Reply-To: <av8osemFMD6C2EdK@lore-qca>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 20 Nov 2026 15:23:21 +0800
X-Gm-Features: Aa3M54qvLIAoTLXhSwpuxxRmvv68nNUsPxUUak29GDrjI45vtYhuyOcNNPOYrRw
Message-ID: <CAHPEe=FFgzM3L9aiBNczg2AQ4JiG-p+eFKLemjrOMzekuBmHpg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: sdio: check the RX packet length in mt76s_rx_run_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_232335_356678_868BBE51 
X-CRM114-Status: GOOD (  12.97  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Thu, Nov 19, 2026 at 05:49:53PM +0100, Lorenzo Bianconi wrote:
> I do not think this patch is correct since we actually consume just len -
> MT_SKB_HEAD_LEN bytes at most, right? I guess we should add something similar
> to the patch below, what do you think?

Thanks for looking at this.

The fragment is len - MT_SKB_HEAD_LEN bytes, yes. But
mt76s_build_rx_skb() first copies up to MT_SKB_HEAD_LEN bytes from buf
into the skb head, so a frame still needs all len bytes between buf and
end.

> +     if (data_len > len && data_len - len > buf_len)
> +             return NULL;

The caller passes buf_len = round_up(data_len + 4, 4), so this check
never triggers. With it applied, my harness still reports the same
reads past the buffer.

Also, rx_check() runs before mt76s_build_rx_skb(). For a TXS frame,
mt7921_rx_check() and mt7615_rx_check() walk the records up to
rxd + len / 4, which a check in mt76s_build_rx_skb() cannot cover.

So I think we should keep the check before rx_check(), as in this
patch. Frames that fit are not affected, and the loop already ends at
a frame that does not fit.

Thanks,
Maoyi

