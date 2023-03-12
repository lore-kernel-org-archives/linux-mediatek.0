Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F7DC74A44
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 01:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AidcYSaVrCuskIGA6JrA0EYqJFsmpJmQ5xrXW/feI/U=; b=cDCn9wKxakHT4sfMS4XjnTUT4T
	6Mz15EKjPGHZWLY75VeDPUWCjyVF5+VITKjJSSZ9vQ9e6JrLT1KdLVOVspztroB9yABv+M3vn+UDA
	yo08drdjWz9dNGsy1fPnCw1jZm8ldj1JEqOIpsGWZj8uNUuNuxORuBPZp9+QCRpXdwaIFxqgH3FYh
	KWelqnia5PTiNnCED9hrOmH80CPCLwF3ifuI5risw66gqJA+J8rkON+smVK/xtHMGz/QOCgqgAv6o
	Zjc1Z4wxky5mtVosrMo1O+InCVDkxnEekycbAU12/8tw3RWEqR4RqJwaeaBwBMe74Mxv+uDI/CUgH
	ymn8BC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbASv-001dTy-96; Sun, 12 Mar 2023 01:25:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbASr-001dTd-Ki
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 01:25:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id n2so11393942lfb.12
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 17:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678584328;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AidcYSaVrCuskIGA6JrA0EYqJFsmpJmQ5xrXW/feI/U=;
        b=Hxdr7BtIzLwpc9zXJWX/oocigX/LqgPdPS2mwMc4P213IzTxKolha5iQDB6igGiNCO
         LvpqGm8wOuu1hqm6J2jtbujoQ33a1E7+UHsDsUtv5+9ZT9Zuj2RUxdYXeGgW+nDEfNyp
         fweT5MS8TVt6ypIbAFsbNRAbct2eO1ZY+H8GA0G8p0x+2IKAv3/iH7WTLfkpzeVSTFh8
         QIRNFzKwxxQv5hRza21byPSVlcLcXrkfTiVuhXJ3HYaNKan9RF3ORC155ihyY2KVfnDX
         AhX3DtBwNxBUbngRZxobtUjBu8NBA4qlulyxpSmTVh2YWsIlIUSgywIjHVhr6eJZeXqv
         yXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678584328;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AidcYSaVrCuskIGA6JrA0EYqJFsmpJmQ5xrXW/feI/U=;
        b=zuHhasAnI1fOEEliCQ/xx9bl0dGqQehSQU+OiTG2r1nb7GTuFE+BAm2Qah8qkSsTj5
         civjqQNV6Pz8xtBwoeR3LbarIH/x9A8JOvcNnIGMkq9xrqhBR3T4MTvnj/Vo2pAdYtBW
         e1gF89ssDM1FvmfDTUvbwHrp4AXZPVBSF9JEFer34VQJz20pjZ7ok4uaFA24LkMwJf2p
         2vzEQsrEt/nIIyG5IdLpKg/yFt470q23XqtMHLQ1Z/QfRj+e7T8NFs/LNvPN9oXMIczs
         nYJHMBFyPnFeqzkCxI1O7F/l4QsBBfPyqSVQxStBQHmtdh0o7bRgg95j0t3xVl5fqisF
         NIMA==
X-Gm-Message-State: AO0yUKV5TQWMLc26JOZaPUnMtfKE6iAyEK30LlGhT9mL4+D7rPji2UQd
	tPhaWqwd4+/o9UEo179zaN8Hhtavy7Mi9Q==
X-Google-Smtp-Source: AK7set8rnb5A4/7RmQFksHmWwU/P/Vdov1/tjlXwoi0w0RKwS2DNpvlHspIBZK43nDcO8INxXsFbXA==
X-Received: by 2002:a19:740f:0:b0:4cb:1189:285c with SMTP id v15-20020a19740f000000b004cb1189285cmr9676304lfe.10.1678584328458;
        Sat, 11 Mar 2023 17:25:28 -0800 (PST)
Received: from uejikov.net (tunnel9154-pt.tunnel.tserv5.lon1.ipv6.he.net. [2001:470:1f08:24b::2])
        by smtp.gmail.com with ESMTPSA id m1-20020ac24241000000b004d1dbacdc93sm463490lfl.299.2023.03.11.17.25.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 17:25:27 -0800 (PST)
Date: Sun, 12 Mar 2023 08:25:25 +0700
From: Eugene Konev <uejikov@gmail.com>
To: linux-mediatek@lists.infradead.org
Subject: [BUG] mt7986 doesn't allow to re-enable ethsys clock gates after
 they have been disabled
Message-ID: <ZA0qBQJRt4ZZpV2J@uejikov.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_172533_723750_AEF3E6A9 
X-CRM114-Status: UNSURE (   3.98  )
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

When ethsys clocks (eth_fe_en, eth_gp1_en, eth_gp2_en, eth_wocpu1_en and
eth_wocpu0_en) are disabled calling clk_enable on them doesn't enable them
again (appropriate bits in the register stay 0).
This prevents using mtk_eth as module, because kernel disables all unclaimed
clocks with clk_disable_unused.


