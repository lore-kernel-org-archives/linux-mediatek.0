Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC994D2D8FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na1vcvFToKAlP+gcDTXu43Yb7D0Mcd0xqiMaFIxU/qI=; b=b2uOgx0OoH5ieHyHe3J7arHTqQ
	+L7/fwtPQZ7R5IOMyB2ndqOtPK154Phe4bFi3fXRSione5La1itjPd/ppY9UrmWBRmndRxZ3RnesT
	Hqj8PKjSx73KbHx7A7KzYo3kctrRgI5FWpwpY6GwA1nyfyz+c+Nt35L/f3q0YXVYkgLiFvqasvYli
	veVv1zPjMKH+DJesp8FcgJQDwzijYSyHuIpT0NSn5o0ACyKxBFEf8UDgx3oN/eWeifQf9z4hb/FI8
	9pvsjswbYvYi+6i+h2/6xuO1opvIZkUS2foPAsWfoHgpo01ds8yb/jOcAelddir6p2mdW/SEjVFMX
	fc/ZXZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgtp-0000000E7rp-3PrJ;
	Tue, 27 Jan 2026 11:06:21 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgtf-0000000E7oz-2YJJ
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 11:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Na1vcvFToKAlP+gcDTXu43Yb7D0Mcd0xqiMaFIxU/qI=; b=PleGCWe3qI/8WoePBKkbGLb+tz
	SbvHCRLSH3TQaEXlW/J1Kd7OC1FaIR9Wxwe5x2tZq0B/V9Y2PwIJEioIPXJisyZ+peEabpsUcvOOx
	Zd/1GnOv3CMgk1qkIUjoZs6G1Cq32K8qjVBZGslxD4FwRxkKMtw547xYO8aDMNCn3zec=;
Received: from p54a43f8f.dip0.t-ipconnect.de ([84.164.63.143] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1vkgtc-00BXsD-0B;
	Tue, 27 Jan 2026 12:06:08 +0100
Message-ID: <8d1b7d91-5191-4292-b49b-3d96dc76232e@nbd.name>
Date: Tue, 27 Jan 2026 12:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] wifi: mt76: mt7925: fix ROC deadlocks and race
 conditions
To: Zac <zac@zacbowling.com>, sean.wang@kernel.org
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux@frame.work, lorenzo@kernel.org, ryder.lee@mediatek.com,
 sean.wang@mediatek.com, zbowling@gmail.com
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
 <20260120201043.38225-13-zac@zacbowling.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20260120201043.38225-13-zac@zacbowling.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030613_358830_51A06477 
X-CRM114-Status: GOOD (  14.46  )
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

On 20.01.26 21:10, Zac wrote:
> From: Zac Bowling <zac@zacbowling.com>
> 
> Fix multiple interrelated issues in the remain-on-channel (ROC) handling
> that cause deadlocks, race conditions, and resource leaks.
> 
> Problems fixed:
> 
> 1. Deadlock in sta removal ROC abort path:
>     When a station is removed while a ROC operation is in progress, the
>     driver would call mt7925_roc_abort_sync() which waits for ROC completion.
>     However, the ROC work itself needs to acquire mt792x_mutex which is
>     already held during station removal, causing a deadlock.
> 
>     Fix: Use async ROC abort (mt76_connac_mcu_abort_roc) when called from
>     paths that already hold the mutex, and add MT76_STATE_ROC_ABORT flag
>     to coordinate between the abort and the ROC timer.
> 
> 2. ROC timer race during suspend:
>     The ROC timer could fire after the device started suspending but before
>     the ROC was properly aborted, causing undefined behavior.
> 
>     Fix: Delete ROC timer synchronously before suspend and check device
>     state before processing ROC timeout.
> 
> 3. ROC rate limiting for MLO auth failures:
>     Rapid ROC requests during MLO authentication can overwhelm the firmware,
>     causing authentication timeouts. The MT7925 firmware has limited ROC
>     handling capacity.
> 
>     Fix: Add rate limiting infrastructure with configurable minimum interval
>     between ROC requests. Track last ROC completion time and defer new
>     requests if they arrive too quickly.
> 
> 4. WCID leak in ROC cleanup:
>     When ROC operations are aborted, the associated WCID resources were
>     not being properly released, causing resource exhaustion over time.
> 
>     Fix: Ensure WCID cleanup happens in all ROC termination paths.
> 
> 5. Async ROC abort race condition:
>     The async ROC abort could race with normal ROC completion, causing
>     double-free or use-after-free of ROC resources.
> 
>     Fix: Use MT76_STATE_ROC_ABORT flag and proper synchronization to
>     prevent races between async abort and normal completion paths.
> 
> These fixes work together to provide robust ROC handling that doesn't
> deadlock, properly releases resources, and handles edge cases during
> suspend and MLO operations.
> 
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
> Signed-off-by: Zac Bowling <zac@zacbowling.com>

The rate limiting code seems a bit suspicious to me.
What does "limited ROC handling capacity" mean? Outstanding ROC 
requests? Does it need time to settle after a completed ROC?
This needs to be clarified and likely replaced with a more targeted fix.

- Felix

