Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153F4606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZF8NXN/g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=C67inh28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nFXX5mNRFkmb5k9RBpmMdByunIg+0A7DAISfvNo8x9s=; b=ZF8NXN/gwbcQuYm6BXPEEfVNnt
	1+Z3Xec2pTwWgfGdJyP8hBAGZp2Cz8XJ+3TfOtSpA2PziBOQ4LG2UWukf83EWHMQOmZv5toYO2Abr
	ELckNNg4sN5TS7iPW5olvRSXOlg65E9xzhvQ1nuUqh9adIUJc4AzMEGVM0pQ+f3j6t97aLyrjAJJE
	JqzzO/KwGp5zwp/xqes4WRNS/lXFsDeuwbXulqAnf8X52vJSxQGMZuoqFoUAu2Y3cLRai1/JMoEB7
	Kj6liQEN0uPsG/JyYw3wNHkWh1XewkLTckmpIaBPA5ke/4KvTM3Bn9iIkTOOnilXjc4PEA3sMvfFo
	N/EZdbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFj6-00000000fwG-2Iam;
	Sat, 28 Nov 2026 10:32:16 +0000
Received: from www226.your-server.de ([188.40.28.6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFj1-00000000fuK-3WbN
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 10:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References;
	bh=nFXX5mNRFkmb5k9RBpmMdByunIg+0A7DAISfvNo8x9s=; b=C67inh288EuOyjlHLTbd16tnrw
	LEfNVKocz91cWEjL58x8OGcBRclAyvMt7rE5ABo2qCfTAbOpFKD3sBfynLqTao1gtU5yFr6PZjP4E
	Z6pKCl/bwRUlHzZTAiz0gF+P2CXGQGvp2/2tKme7HrOc9RMk0EQ+mTf1Vu+r1AIbcWjFM8HVJ/qqj
	4sk8MjYybt4PITHredoloTmGkZLz8JPAwKY9Mz/IqByoFKdWB1kjiW68EAsxkKLEYLw8m1IsQkmrv
	MZjYa16HBID07uMkyCE54VjpcxyWfanyxsJ5KPcA2lmjo5i9RBT1C/YTAtzZfVU1da0uYiWfR0xZp
	nMYRlleg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFip-0006Ak-1g;
	Sat, 28 Nov 2026 11:31:59 +0100
Received: from [192.168.0.32] (helo=mail.your-server.de)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFip-0006Tr-0A;
	Sat, 28 Nov 2026 11:31:59 +0100
Date: Sat, 28 Nov 2026 11:31:58 +0100
Message-ID: <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
From: martin@rfdeck.de
To: Aaron Beckendorf <albecken@mtu.edu>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Devin <lucid_duck@justthetip.ca>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: connac: honour injected HT/VHT rate and
 bandwidth
In-Reply-To: <20261104142737.186484-1-albecken@mtu.edu>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_023212_174858_D740875A 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Aaron Beckendorf <albecken@mtu.edu> wrote:

Hi Aaron,

I tried v2 on an MT7921AU (Ubuntu kernel 7.0.0-43, firmware 20240219;
the hunk applies to the 7.0 file after moving the context, only
mt76-connac-lib rebuilt), injecting on 5 GHz channel 36 at 80 MHz,
with three rtw88 sniffers:

- broadcast data frames go out with the injected rate: HT MCS7, VHT
   MCS7/8/9 at 80 MHz, VHT MCS9 at 40 MHz and VHT MCS7/9 NSS2 at 80 MHz
   were received as requested, one copy each
- short GI is not taken over: VHT MCS9 with the radiotap SGI flag
   arrives with long GI (the patch doesn't set the GI bit)

> Legacy injection and the normal (non-fixed-rate) data path are
> unchanged.

That path keeps injected unicast data frames off the air on 5 GHz,
with and without the patch: no frame at any of the sniffers, at any
requested rate, also at 6 Mbit/s, while broadcast frames on the same
channel go out. With kprobes: mt76_connac2_mac_write_txwi_80211() sets
MT_TXD2_FIX_RATE only for non-data and multicast frames, so a unicast
data frame never reaches mt76_connac2_mac_tx_rate_val() and takes the
rate from the global wcid's WTBL entry, CCK 1 Mbit/s. On 2.4 GHz such
frames go out at 1 Mbit/s with retries whatever the radiotap header
asks for; on 5 GHz there is no CCK and the firmware drops them without
a status.

Maybe set the fixed rate for all injected frames
(IEEE80211_TX_CTL_INJECTED), not only for mgmt and multicast, and take
the GI from IEEE80211_TX_RC_SHORT_GI?

For the broadcast HT/VHT rate and bandwidth part, on MT7921AU, USB,
5 GHz:

Tested-by: Martin <martin@rfdeck.de>

Thanks,
Martin


