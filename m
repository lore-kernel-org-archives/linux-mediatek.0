Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A9CD342C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCC8GOu54St8j+Ozo7USIk9bX7v2C2wsdBWB7ailnQ4=; b=NC3nCPNPH2uKc2GKky/2S66ZzI
	NlhCKv8Q6rYymFd8XOnh3m+3l4v2e70VQJBmBjPWNRQCAmYox1/CsINMlGTIUOdtOYpJ98RiW8/9F
	c7Ya4EdLM3Jd6gAUTOOrllWDW922IHFR4aVBBwXLZnWhHLIjONwafeFspyf1w+0LulT5YaCwRDnwQ
	0YHpELC/OO8fJEgysTR2FjQ3Wrmay55DCBVZM1Ln1o4KS5bqjigWbQylGw8OXFIBCfNR6QcKW3WRt
	i7tWjySaTx7O4r9tdPTgEGUIBioaCPotgQPiSrT2XEAMV7Et762EOCeQXEV5so8G8oYNmqqt0HSoC
	SW+dYktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmLZ-00000002KkM-47vj;
	Thu, 07 May 2026 00:12:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmLY-00000002Kjs-2sHP
	for linux-mediatek@lists.infradead.org;
	Thu, 07 May 2026 00:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4551243FD7
	for <linux-mediatek@lists.infradead.org>; Thu,  7 May 2026 00:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADACC2BCFB
	for <linux-mediatek@lists.infradead.org>; Thu,  7 May 2026 00:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778112727;
	bh=FOpyYKheWwJmIOIbHMKquUusBebEhfl7BHn/laWcsTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kh1M4CP314OLm21kfDLx1OlAe0qdQDNBCp8Zq8694h/rgHmh6/WlvkA174Q3f/AtL
	 pRu/VKlT8ukxd7u9SNPMS5xyyNXop0ef34dgDeS4MFgeur7Ip2vuOOQSkuSur1dcPp
	 eFx030zFN02TPkZFQFM3aW93Z+xji4E+mcUx3s5O+g3lbpyIzN850MPGHircwhz7oY
	 7LpRcAn21kRPKTq1NaKPza2zIDUSCZAqmsh1Fu0EBLwCvRWJm/djRxCkCCDV5gwe0c
	 nNBKs5sZXzJeuZUuxhQgR2tqZyrXqsTAuI8rz3KEJzaVc7Dhsbn1Pe3BeoTEFpWsAB
	 xkf6M5KEUhyIg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39397d63804so2437581fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2026 17:12:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+6pWVBBh8MnsD297rM14NWOVl0puDPLWaqOJollKfJlHKgNi9lWQEfFc3J5q1GgdS1/jZ9rr0QAEOt804o5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPg7HM/BF1gs7KnkZMp8i8JgU/Rv0p/3RAPafqLDS5s4IUkCwe
	G+O23X58ItXc9MqMtU5u5q503JO1sMCMHLjzQSHbycsfbmbhO385GKEYtQ+fV5RN4FAF8i0f7SZ
	189iYa6MquEyIaW6QVECz6BomEeoirp4=
X-Received: by 2002:a05:651c:1111:b0:38e:9667:f21a with SMTP id
 38308e7fff4ca-393c41edd4dmr17403801fa.20.1778112725343; Wed, 06 May 2026
 17:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=rq5ww@mail.gmail.com>
 <20260506200918.D68321EA006C@mailuser.phl.internal>
In-Reply-To: <20260506200918.D68321EA006C@mailuser.phl.internal>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 6 May 2026 19:11:53 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
X-Gm-Features: AVHnY4KXPcpTEpQ4tty-oGElcVOTUbGBRAHXJs0Kth9qJxvAzGjOVsum6tHQbTo
Message-ID: <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7925: iw set txpower fixed accepted
 but ignored
To: Javier Tia <floss@jetm.me>
Cc: Bradley Pizzimenti <brad.pizzimenti@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_171208_767891_D6F62523 
X-CRM114-Status: GOOD (  23.74  )
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

Hi,

The TX power reporting issue has already been investigated by Lucid
from the Linux WiFi USB community, and there is a proposed solution.
I think we can continue checking whether there are any remaining
issues on top of that work. Please refer to the patches here:
https://lists.infradead.org/pipermail/linux-mediatek/2026-April/105726.html
Thanks everyone for reporting and raising these concerns.

On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > `iw dev <iface> set txpower fixed N` returns success on mt7925 for
> > any N tested, but the reported txpower never changes from a stuck
> > value of 3.00 dBm.
>
> Hi Bradley,
>
> The 3 dBm display bug is a known issue we have seen when using mt7927
> and a tested fix has been working well so far. The root cause is that
> mt7925_mcu_set_rate_txpower() programs the per-band SKU tables into
> firmware but never assigns phy->txpower_cur. mt76_get_txpower() then
> computes:
>
>   DIV_ROUND_UP(0 + 6, 2) =3D 3
>
> regardless of the actual power level. The RF output is unaffected;
> it is a display-only bug.
>
> The fix reads the effective TX power back from the rate power limits
> after programming the SKU tables and writes it to phy->txpower_cur,
> following the same pattern used by mt7996:
>
>   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt7927-wifi-14=
-fix-reported-txpower-always-showing-3-db.patch
>
> This is part of a series we are targeting for wireless-next; not
> yet upstream.
>
> > What seems potentially distinct here is that the user-issued
> > `iw set txpower fixed N` itself is silently no-op'd, separate
> > from the reported-value question.
>
> Agreed those are two separate issues. Our patch addresses the
> display-only side: after applying it, iw will report the value the
> firmware is actually using based on the SKU tables, rather than
> always 3 dBm. Whether `set txpower fixed N` propagates to firmware
> to change actual output power is orthogonal and not addressed here.
>
> If you can test the patch on your MT7925 and confirm the displayed
> value reflects the correct power after association, a Tested-by
> would be appreciated.
>
> Best,
> Javier
>

