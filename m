Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2DCA9EBB
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz+mubEJi9OTuwRjam7n0ruAb9lpR9EULifx4BafNbY=; b=OHw+goyu+YCOWUvb47NPl3L8oP
	KcBwXF67sUmrMZyGteVDVN5PSP48Jms6/tlIMUweW+O+ka9lQMtAkM4U7W7AAFm+0BUzRYIdvELwK
	g+ULSCy7fFOjod4QyKHhXI3buwdx/thIWUDps63GVwWSYVjog1/bX0Z200BRRkKjna3bCufCKhbgJ
	hFwju/QtP2WsC/9qD1Tl8Srzn4vHCPgDdbfveKyE4fms9S4O/pA1r32cbhuXTEoaxBn2wGce6LKqX
	f1dBjwnEI9nN7FyK0M//wFBMFybVSCwF24PU6CeayA5D7zULccrhf/8e2VHqJFO5hGieDtOtDFKG4
	kdrMh/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIhD-00000007GWn-26nB;
	Fri, 09 Oct 2026 22:04:07 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIhA-00000007GVT-3jxQ
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 22:04:06 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35829219da8so114394eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791583444; x=1792188244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz+mubEJi9OTuwRjam7n0ruAb9lpR9EULifx4BafNbY=;
        b=C00FDh77teFFiGwwPUVehD0sWQ9rA44yiIQoNG/sZMp3MmMpTmo13MKw6sAm3yo07Z
         R0HffQ9qVPXFH1tKRPq0vJU1NdY0WHQMbcuZrEksyf9Df6gseT9bFUTr5eejlaZ78aOA
         5CP3tpYoP873wsbovKliKOPG7NlicyLLpkdVO8Z0klVUEuD2cRjF2a3jnX9/x5V7RFrn
         WXUUOaZ8GL8Ksu2qJNDugvgbL557vI5lBh1/+umvTipkHIoNalfIsKfoiLEsIUGoqR9J
         uwW8BRbnBu/4b1I9PilG+O/v2YN+xgPQWKQHjOjkv9CmiTW8/4Rx+kMfOMzOin8t++Nb
         I4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791583444; x=1792188244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oz+mubEJi9OTuwRjam7n0ruAb9lpR9EULifx4BafNbY=;
        b=iEZry92Uzsi1PxmGTaWhmu/hIWlPuYZo6JGbsPDkf1FtDspMmxRv7w3c4JmzqKjtAb
         R8yYPdCUnjUb9EMI1qBEBtsh2N9uul9l0yBdAeauna9PqAD8sTTYOKz6H6TKrBsSOy+1
         0jAOG5yLEGI+Z3z+I0y8Tt5MLunHWBr2wuH2gsBfuMUiNTM5muRIaPUogQjbSCP2UO4I
         UwfbFK1HS0gvU0b7TSIoBgqANfd/jsQMJ8yrx0Zqbe8B643BKUONeIYRsqL2lzfbjwe6
         4smmpx1puLcZNFesnV2gApfOrXyHIK0IOwC/+7CSjGff5yIFz6CFJkY1T9AQ5bPLlEsI
         us+w==
X-Forwarded-Encrypted: i=1; AKwUvBxd8Hf1r/t3tToC4Ja6B1nzxJpxSyep2SJrgn3QofEqH63/J4hUX6pyaJ6vQys+K0/fAu+Stjf3NPjFYCvOBQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJQUWUqeVMshYAC7uAqjV4VN+G1I31npjEb5NW9WluIcQp1PVRv
	M8rbwkGUOnoAVNj0G/jU+jry8S6cOdsCo6r6N5pEzt7nPnuJX4GYh/HkgM8CXV64
X-Gm-Gg: AYBFou3cz1bu5pzvGiDGN0MtLNnKxEVwGUdKBfvLt1SHm/KhjIxQIxLC5SADokm1e3a
	g5jevFjbYedeI5SHtW+j+dKAjInMYrRBgwXUo/PSqB114a17T9J1SapT9xdLBwOLDSayvXr5rZn
	BfTgo8+XWAwsE0N5gCJ15ziBM/RzSDBhiQ5rUvYMlOxR3bDF+/NRLHYJc9oCf6qpYpor3Zgv8FK
	X3n4siLjSyZaRHebHifroqtB2QspcRpoy+ZkQ7tMctYN4AIVwKVbb2La1aLzBHdxN1V0XvQZ/AA
	lYa4K3ST5DGfbCagz7IL9s3BbVmQGr6hURA/fQyQP9vtRYKI9Am6rDwm3KcIcya2y0wyeAe2Pri
	oOe1ak6QhHFnsbVSJc4+zLV3Uaw+K4B0vzkClz9+xQz1giaYbOrtJ4z8Ef6gagS2gkZ3rHru46x
	OvCmk1H7laAscYjGTX1Olxa258mXzAJE2i2i5jFxkwNBFkJegjydztUeaxj3mLrjPPynulgkRKs
	n7yx6qabhMpitGAb4Rjx4loDqxmCFo0sH87sayvAhk=
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr962923eec.2.1791583443330;
        Fri, 09 Oct 2026 15:04:03 -0700 (PDT)
Received: from DESKTOP-1E7V4GR.lan ([190.177.131.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm8279558eec.28.2026.10.09.15.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:04:02 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: benjamin.larsson@genexis.eu
Cc: Landen.Chao@mediatek.com,
	andrew@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	arinc.unal@arinc9.com,
	chester.a.unal@arinc9.com,
	cjd@cjdns.fr,
	conor+dt@kernel.org,
	daniel@makrotopia.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	dqfext@gmail.com,
	edumazet@google.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux@armlinux.org.uk,
	matthias.bgg@gmail.com,
	naseefkm@gmail.com,
	netdev@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@mediatek.com
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: mediatek: support EN751221 switch
Date: Fri,  9 Oct 2026 19:03:48 -0300
Message-ID: <20261009220348.4531-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4310cd4d-d9e5-4bc4-bdee-7f6f6b3a2409@genexis.eu>
References: <4310cd4d-d9e5-4bc4-bdee-7f6f6b3a2409@genexis.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_150404_939242_2CBC019A 
X-CRM114-Status: GOOD (  14.60  )
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

On Sun, 20 Sep 2026 12:33:21 +0200, Benjamin Larsson wrote:
> Thus I suggest that dts property also is added and that the calibration
> is performed if that property is not present.
>
> The original SDK and production units seem to have a fixed setting and
> user testing also indicate that a fixed value results in a working
> trgmii link.

Some of that user testing may be mine (fixed RX taps on an XR500v in
Matheus Sampaio Queiroga's airoha tree, airoha/kernel PR #54 on his
Gitea, https://sirherobrine23.com.br/airoha/kernel/pulls/54 - viewing
it needs a login there), so here are the numbers behind it. One unit:
TP-Link Archer XR500v v1 (EN7526G, on-die switch plus MCM), running
that tree's driver on Linux 6.18, not v2.

That driver uses the same PLL frequency (362.5 MHz) and TX drive values
as v2, but the rest of the sequence differs. v2 sets the MCM TX delay
to 0 (it reads 8 here), writes RCK_RTT and 0x7a14 on the on-die side
and disables SSC on the MCM; that driver does none of that and instead
writes the full vendor MTRAP word (0x01017e8f, between TOP_SIG_CTRL 0
and 1) on both switches, where v2 only changes individual MTRAP bits,
and the vendor CKGCR value (0x30f0 = 0x1e02) on the MCM, which v2 does
not touch. So the taps may shift with v2.

With the 0x55 pattern, sweeping RD_TAP from 1, all five lanes pass up
to tap 37-45 for SoC->MCM and up to tap 16-18 for MCM->SoC (one boot).
The eye with real traffic is much narrower. With all lanes on the same
tap, iperf3 through the cascade and the RX CRC counter of the receiving
port (same result on two boots):

  SoC->MCM (MCM port 6):    clean up to tap 24, nearly dead at 28
                            (1-6 Mbit/s with CRC errors), dead from 32
  MCM->SoC (on-die port 5): clean up to tap 10, CRC errors at 12,
                            unusable from 14 to 64, and a second
                            narrow eye around 72

Tap 1, the lowest I tried, was clean in both directions, so the lower
edge of the eye never showed up. The midpoints of the 0x55 windows
(19-23 and 8-9 here) are only 1-5 and 1-2 taps below the last clean
tap measured.

That driver uses RX tap 4 in both directions (for SoC->MCM the 0x55
sweep still runs, as a check). With it, 12 boots (8 warm reboots and 4
power cycles of about 30 s) had 0 CRC errors on both cascade ports
after 6 s of iperf3 each way, 29k-101k frames per direction. One value
(4) works for both directions here, although the margin to the last
clean tap differs (about 20 taps vs 6).

Separately: an out-of-tree U-Boot port for this board (since fixed)
left the on-die switch's PHY auto-polling on (AP_EN in PPSC, 0x7018).
With it on, 8 of 240 TFTP boots trained no SoC->MCM lane until the
switch was re-probed, and a stress test found repeated tap writes
landing in the MCM's 0x7a04 (4 of 4 boots, 0 of 4 with AP_EN off).
Clearing AP_EN before registering the MDIO bus gave 120 of 120 boots
with all lanes trained. In v2 the on-die switch is set up (and reset)
before the MCM, which should clear it, but I have not tested that; it
may matter if v3 touches the MCM earlier.

Per-boot logs on request. Happy to test whichever approach v3 takes.

Thanks,
Cristian

