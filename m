Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 16:01:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4EB60F6C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 16:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B4EB60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1P9fnB0i4kQAXNWCyXF57cMd37NXlkhkJ5V2V3n/Aw=; b=Hq8KNyKntg1nbx
	DuFbRhlsPO4ZVFckjIfuAeQBC53GAtV3+jQXAuIV85XRzX03c4pKPdRanTdaq3UC7qr7/vnJi0BBr
	AisFEpcuyUEryUu2Az0Jlw5Ual2MTvXUNi1Ls3Cz48QfOPyBzdBUEzJUnpDiR2SaLfeMmYRsYv1ed
	p5uKUPbZ8RyEBgnunze2p5MrwIbeyaXQMDuohMcaFcEQq10530/73hSQdpOGX/qggyMZd3QTtUexb
	l9gIKTGvfYM2etH6sbao6dFUypS8LPwCar2TpXLkZ0R+DlUAtNYnfA9GT97jaSCMk7mFOyN43lQsN
	mDIytK3ZCL3A36UbGGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZEmE-005nI3-MU; Sat, 09 Oct 2021 16:00:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZEmB-005nHB-Gv
 for linux-mediatek@lists.infradead.org; Sat, 09 Oct 2021 16:00:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E861A60ED4;
 Sat,  9 Oct 2021 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633795243;
 bh=EpMQF1oty+jMI5ME7I60WgZY3kW/WrLj0/FPXYfXUms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKXUM6wg7DNJnQNwYqABSkrHhgIAUAuhV8nkDbjy4pXUblz794YWMNokZSt0Bczv4
 ROLQmyQgEmdKdv5f6ZVDCmX9cNpYGmKMz7O84nzrk0JnJV6OfZvBIm9r1KfI8gJOIn
 Gh08WLwqU/eYQ0WJDrPRk0DoSneYq2Hk0ZXQw2Px2PhcuXwsVkNYAJTaxPvI+boh3F
 SCOeyBY+slLHBscUBw9w4aZFwKIx+K+FIVh/jCX0QYu5uteU4lA8Za88C9p4schY+P
 s+S1rKChphR7MnKoRGgFFiUpP93O7AAq4ZU8aElMrXrnEe8l8KL54tjui74Exm7KGn
 Frp4gi/9BvaXA==
Received: by pali.im (Postfix)
 id 75ACE310; Sat,  9 Oct 2021 18:00:40 +0200 (CEST)
Date: Sat, 9 Oct 2021 18:00:40 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: sean.wang@mediatek.com
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Mark-YW.Chen@mediatek.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/10] Bluetooth: btmtksdio: add MT7921s Bluetooth
 support
Message-ID: <20211009160040.y4geidvrsffuuayw@pali>
References: <cover.1633728573.git.objelf@gmail.com>
 <cae32b7d93a13273c7610ce7c2b82129847ee587.1633728573.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cae32b7d93a13273c7610ce7c2b82129847ee587.1633728573.git.objelf@gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_090043_602150_FD18A79F 
X-CRM114-Status: UNSURE (   4.55  )
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

Hello!

On Saturday 09 October 2021 06:10:17 sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> add MT7921s Bluetooth support
...
> +	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7961),
> +	 .driver_data = (kernel_ulong_t)&mt7961_data },

You have there probably a typo (MT7921 vs MT7961).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
