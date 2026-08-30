Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5100C61DE2
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+j1AD6ZP4+NwsaE6HRfrB5G8mDdyvb/fqBpbDqu3VZE=; b=O/fod87OtEmSbbWpZQpaTbKjRK
	CrhMLTASp3wzHEXouCe2/0kkzAkpDgJlxOfFsppvcFgwqVryFneFh5OVunrepbRuCEKFECCnNgG/g
	wer3UDZj1bZorkRcAgEWcmTkXdp3hiRbqAyI7F5CDKIYLzZmwHUJI6Py0DcMH88xFpjHlJieIp3L2
	OjCLJ7W/1yZD75/z78dB0OxaipafuNVDwmQ+nAGfkjCwRKqnNC7XUNaYJQuG33mYURV6bnr1IY3LB
	aEZokClnMc+nJq9LEReCC/b+N0WzkWaSc+JkGGYtV9mmsxqNam/1L3GaoIx3pF+ohYMHvafD+WCAS
	d6tnj2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQm-00000007Z60-3heI;
	Sun, 30 Aug 2026 07:58:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQk-00000007Z3a-0Er2
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 07:58:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso32190985e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2026 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076696; x=1788681496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+j1AD6ZP4+NwsaE6HRfrB5G8mDdyvb/fqBpbDqu3VZE=;
        b=HanlcURrcDhwhPtRszfmcts2/Ua/DxHGBNO7Spwv0JnWH/+j8k9XwXkOJwWvyteHmy
         MIbZIcxv89Na/dtlNYoxEedEAACA9jLE4/ATo/Ut88Q7DgMnWeMYMMSuEVqAbgjPgiPi
         mA73lXZJ2gXl/p/nnDRJtlAciuHqkt4CbrLcWnncQJysAlsK63Dz7OCHRdpQLG0tJDtd
         U70ND0/sMazStB1N/4GpNQ+bRW/wKtq/ver5+yw1LyQesUjFLuj3ShPj1d9A0xBtVFti
         jvutcfAd/MExgbAGQCjK8312t3dTu9WCiaNz9O/UlCq9UEL68yquFM0kYnfrrCNDVgCv
         d6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076696; x=1788681496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+j1AD6ZP4+NwsaE6HRfrB5G8mDdyvb/fqBpbDqu3VZE=;
        b=O6/FMcXm/7+P9EPfkVvwenupqMGJPyX2g18DMvjN/TeYZohq8I29vekkny5E0LR0lu
         iJp+zgeP2zu6CK+uBnNeaL1KReqcqbSwuZhqEm9rI5rblcA487QDi6zzIwIJpsZ4nKFK
         HsqQoyFNKora5+vetzmX8DRVj0DTf4AwFfys/q5t9+7ojOG/7v/GSNFckngbzMlH3NHz
         yI8Qog5NhihQkb4GCL2dAla6fPGdcgXPCyC7Yp2C/aTS79yiFa8oAD0YC2i/2jCdFeSQ
         b2zEdKu9qGdFGCvdu+BQLP2sZOCiiViPQn4o3LxEFfOs1GElROKM/gkT71ur49mfGu9R
         Qv8g==
X-Forwarded-Encrypted: i=1; AHgh+RrnhSDdLPNTeN1XiE+OqzGr7MgcUeXv8RWDcnkL6oKDORQJO5bCtJ23WHRdMcQ0gwx9OFVSRYm2Tl1Cftng1w==@lists.infradead.org
X-Gm-Message-State: AFuF++nDQHv45ryIzWt/Jd33fNbT7b/ZXLOhmGoqaIfo4PrjYNUHO757
	fSCgTA/FTQxpHdZUtuMMrMpEz3kzaZXlvkTGQ3IwWEyFizxPMRHIZP8=
X-Gm-Gg: AR+sD13Iz0xZ9M9C9+Y3rFbcE4Yi9uSM/yh9Tj0VAIAf/1OurdHHYm5AVG+3abibTcJ
	a5TEyGizPHsOcRVM/GTa7idro4OzoxluruK7awv7XWzszC/GQwYHw6zLqxzWHiSDODlH3u+pikN
	3NpPdx9IboGwqKJfdsIB8pnanckvgJQxI9v35JUmTWB5xHnuWlpQLeyYhi6B3nodL3jeYJ7UhlT
	FkSmWoaSzONg8yY2xj8q3kwZQNgVcOkVUcDUUTBcwm/Z0RigaSiUvwaOQmipcjYnJoMZfXXr0vF
	HiIjoV6ZWM4iNCZ4/Gkp9wgCg1cJOxxG+kuFAOAx8702eqs5qkPxoTxaHesjrCvPzpleKS4LiNQ
	rv/vcyWBVw+Rf/qaX8i3jWbcq9sKxqGf0m69USB2qug5XUhlHivjJQ9eLpWf80rgT3kCPIqRptf
	yRmN9EMN3BEVz0NIpD4nkaCXGSJEq+Koc9+m0FCz6SJmoKgByASaU=
X-Received: by 2002:a05:600c:8b35:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-49b91c3b71dmr267281245e9.11.1788076696142;
        Sun, 30 Aug 2026 00:58:16 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:58:15 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net-next 4/4] net: airoha: grow RX ring 4 to 128 descriptors
Date: Sun, 30 Aug 2026 10:57:17 +0100
Message-ID: <20260830095717.37218-5-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005818_121211_7EC9A8D3 
X-CRM114-Status: GOOD (  10.28  )
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

Ring 4 is the shared "force to CPU" ring for a wide set of protocols
(BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/IPv6CP/PAP, ISAKMP, DHCPv6,
SIP, LLDP, ...) and currently falls into the 16-descriptor default in
RX_DSCP_NUM(), same as most other non-hashed rings. The hw completion
race recovered by airoha_qdma_rx_check_stall()/rx_recover_work() in
the previous commits appears strongly correlated with a ring going
from idle to receiving its first frame(s) - exactly the access pattern
this shared ring sees under protocol negotiation bursts. Give it the
same 128-descriptor allowance already used for rings 2/11/15, matching
the other rings that see bursty, non-hashed traffic, to reduce how
often that condition is hit in the first place.

Ring 4 and the VIP classification that forces these protocols onto it
are shared driver-wide, with no DT/hardware property distinguishing
one chip variant's ring 4 from another's, so this isn't scoped to
AN7583 specifically even though that's where the race was found and
reproduced. 24h+ stress runs forcing repeated PPPoE/DHCP renegotiation
on an AN7581 board, both with and without the two preceding fixes,
completed 570+ forced reconnect cycles each with no regressions from
the larger ring.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d6591a779743..cd75c16d8d0c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,6 +41,7 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
 	 (_n) ==  0 ? 1024 : 16)
-- 
2.55.0


