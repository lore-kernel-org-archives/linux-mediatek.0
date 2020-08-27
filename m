Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC344C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCBC206F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sh2ELZeH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4CqqHi8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCBC206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DheReRE0I3R0UWjV5s+CA/N2I0qVMVB7+cvBkIkdpnw=; b=Sh2ELZeHw2gKc/zHGJtEyWw5P
	XoHrbw2CEH4WcE0i/t963IFjV2+bbJoe3qYHtoQxgeXkAMKpcAndNaX4BbTRATuZ495iksGAnQHfi
	ot+gNNRK+Bij8mzgyURmtXuvCN6K2WT80JpYZ8CCEMWML0ex7sge9TMCKJsQVg36mQheQKZD17kOa
	4YZvjLcAO4IYl0SymhF0QYrlq/7idjMvdzDvU2qwlUmD42Zs1/p8pn7Iwd5OWXehgzTKT4GY/aQ2I
	Kn31lYKMSzZj4szyfABZH+Z0XMUuUQxd9FVxJD3KV+tpyaYkWTj+6Ne2Tx2iycZvUn0ZpA37T5Htp
	nXgPo+Whg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDdu-0005NV-EB; Thu, 27 Aug 2020 08:52:22 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDdp-0005Lc-T3
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 08:52:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id r13so2103949ljm.0
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yYacB22eYqjS0h2EHD7vpnW368MZpgmYVMb0jVEC+0k=;
 b=I4CqqHi8i6aZUgWVs79dQH94/DTsPWfoTtqiUAGLfoUuyChmrVFlCJt2xtstW36Y4j
 srvtiSanJALvFkGgcExhOsRLJbdHal2iROBeZUh3KvND7j42b6+Few3BMJlywvKTA7dk
 ybPUE3SK0t+TFNUTx8lqxIfifMsnc/xuZHJ1ZNs5saEACMpfE+DV06RyD4dc+tMEIecr
 I2BAxZtGiqRHJEg+8eBXUoM9SUQUsRKQoo5M6Pmfww7FbPgNKKtKPjTn0PNhRle64LMB
 waN3UegYTBknmsNPNhbhnfmpgGvCbM23phLffVIVJpeM8L3Z2wTYNWoWZ4Xe4xSgWSpT
 bZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYacB22eYqjS0h2EHD7vpnW368MZpgmYVMb0jVEC+0k=;
 b=mSm7H6T38bx0JJStmzp7qy2lp5iokYamoTfsuLnWR/cRVKDnfE1m9crAR7FqJy4gcx
 BAAUMriWH8nf1bW2TG27SeLkGhEuQ3MxwWdBcKc4QfD7/zXg5rXfwnWsrf2uCLdxxWgs
 ab7YpbpxAtAuKCANNF1O2BPEHUa/FjeibNB29qeT1Ln5TTv9ZPdNbt5G7DekuvkFYQtO
 I6KnrG03mr1grJFKFmzJXi54qZ2pKkltm42poaca0IELVQvMcs4OE7Z9/Pa7UmC405zF
 6fn7j/bPniGnr8N9U1upABry8WAZM7VBaPge7x7Iue0v4s/IK5AvbRiLD1TqC4sj1aTu
 qbsw==
X-Gm-Message-State: AOAM533PdyYDegYs8CRCLoiJ6O3vli02JJzlK6ZCLwmG3fBinojJ2my0
 8tHw6CBEBBVWYF0dNK0WctTR4VHy0cFaeRKFGI/JGg==
X-Google-Smtp-Source: ABdhPJzMK/QQzozGDxzhZ1ptVcFeOA7pCMf7o4BoinmpKAwFETGR2jOwjTUEQE5hG43D4uonIeuqoQ+98b/Uh0VfqsM=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr9913723ljg.100.1598518336643; 
 Thu, 27 Aug 2020 01:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Aug 2020 10:52:05 +0200
Message-ID: <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045217_996815_C9C7406B 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream@mediatek.com, Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 hui.liu@mediatek.com, seiya.wang@mediatek.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 sin_jieyang@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 huang eddie <eddie.huang@mediatek.com>, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 2:18 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 3 patches:
> 1.add pinctrl file on mt8192.
> 2.add pinctrl binding document on mt8192.
> 3.add pinctrl driver on MT8192.

Patches applied for v5.10!
Thanks!
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
