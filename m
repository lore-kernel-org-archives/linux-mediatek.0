Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59526C5B572
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy5aeHD8d+Jx1qMGwwl5D/7Bi3rGEWzbwGp1Tk7bSPw=; b=h1W9XCZEYjDDpKVs0NTUo7dWAT
	q2297DBnMdgDoszxjOhtZF/MHD5h4slIHJ4k+Nyw937pL73JP0DT6ZnQMszp54dzOT/MjFizZaWnr
	h/DNk4nwieQAPQsWeBrxnA2zg+FWxYAqLDtKlBHVzjpqUQCz3ml+bwTrk5VhjaUTfKp4vknTwwQmW
	o0+84j6ghB21t/ZrlTFK80CNE8lcMoj98Qr2lG2Ofj1t3v+nIaOP3AwrYLFsU8gcMCge8oSfl2ahL
	maYPYm+VFcRdd5Y+Awj4Pj57IFK63UVEliLG+5BSDLKHDLsdPRE/ff55c4v/J+6EA3CVw8i9FKrz9
	8C+BL7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww20S-00000006ez6-03UX;
	Mon, 17 Aug 2026 18:24:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww20Q-00000006eyX-2gGR;
	Mon, 17 Aug 2026 18:24:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4351601DE;
	Mon, 17 Aug 2026 18:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC171F000E9;
	Mon, 17 Aug 2026 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786991057;
	bh=vy5aeHD8d+Jx1qMGwwl5D/7Bi3rGEWzbwGp1Tk7bSPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j33J8SpBIEotOP8DhEHOuKEtjOPRTXcET4HUd1Twrbxoy70DMh3OJGmKV0UiW9o+c
	 k7CokEMVkmuueB5Q0+qu5IK0i6uP5PvWwcDGHf50qkDYe1x9BltWLSZfdqdS4A8FfQ
	 FaE8QNl6MpnFogd+K8VaKN1pMU28jwtT42Eax3ht91iyEAq9yfNtcu076eUyKWlxyP
	 TFgopx0VgjUrNMJV4sCmFlXvkdnTGObyHxw6nRhW+O0fLTu1eVkvj+pc9ZTpq4S/Jm
	 TCzuzEJA79IBPBGpwb/EHkytvYnEcscqDeVIysh4wOQpz0WFPV0EOpJ4Tk654icHpQ
	 JBFFkHdQ8khhg==
Date: Mon, 17 Aug 2026 11:24:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org (moderated
 list:AIROHA ETHERNET DRIVER), linux-mediatek@lists.infradead.org (moderated
 list:AIROHA ETHERNET DRIVER), netdev@vger.kernel.org (open list:AIROHA
 ETHERNET DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH net v2] net: airoha: npu: load the firmware without the
 sysfs fallback
Message-ID: <20260817112414.0e82a395@kernel.org>
In-Reply-To: <20260811181717.19339-1-sochnev.v.74@gmail.com>
References: <20260811181717.19339-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 11 Aug 2026 19:16:59 +0100 Vitaliy Sochnev wrote:
> airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
> so that the NPU can be brought up once the rootfs carrying /lib/firmware
> has been mounted. That mapping holds only as long as request_firmware()
> reports -ENOENT.

Okay, but AFAIU this is a hack. AFAIU PROBE_DEFER is not meant to
be used for FW loading. The driver module should live on the same
'partition' as the firmware. Either have them both available in initrd,
or have neither?

