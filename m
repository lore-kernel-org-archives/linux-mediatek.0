Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B6CE7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gj8VFVjPSZEkv+oUvBeuosT9Pxl2p7BzaNCPNYLTVfQ=; b=1R1tZMk/9cWZlyTtDHBGMD6Qk8
	V4EIkyyMMBUj4uk2ESqTMe4p8GSD9fE9gjNWQog/7mIUBRBgKR1i17/CM98+2MEIJRGYmuQhufz5y
	FvdX8FnC286/UaM3IDhWrDCm3KOHAFIR97AHYBq2a89Csh3KnvMUivOeXYH2CqI1p4ejnM3R8wpdY
	ciS+/wyfcMVZ/FCeFi79Hq+Pm9/pK5g11Qr0qnq/Z8K1UfEGHAbsAHjM4byLi4PtlGTDrZNqelNkN
	OUnhbTbOAgAYePNHCxt7TGtOLn+xp7i+JfcOD5HhMcv5iZoCoif36xZDFJPsVnLHCMFq3RCW8Aak/
	pe465KbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBTi-0000000G3Tm-3GDc;
	Thu, 05 Dec 2024 13:01:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBSY-0000000G38l-3SOz
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 12:59:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so1316902a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733403597; x=1734008397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gj8VFVjPSZEkv+oUvBeuosT9Pxl2p7BzaNCPNYLTVfQ=;
        b=hw/Bc/yKyjHKgeF/TsAtRWueN9ysg62AeKLvz8sUzykSc3VarCyLucpXoeGiTL1rLW
         gHdr4jtBiV+8/XYnKzHuoIWBYPIAWrkSqfMT4biaPpErn6G6XzpUTtguBrX6V58JE/jb
         dJDfiIq9vI1p7GNQwZL/Viajhd2quJYkHHvQbX6NOI3x8id2fdV/yf0i3kcLzYLinK3B
         jjNPOJHLhW+VY3HlmbN4sghTF59F46nO6X4/mPedvRc38k7utiBLrkW75xmBWAmADVeb
         qahbxmUsri7DGUwWS8iKeYL3q3VKRJZLMgwJd11OLrEcua4zaeRuJdTXt49Z4V4XU4kj
         r2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403597; x=1734008397;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gj8VFVjPSZEkv+oUvBeuosT9Pxl2p7BzaNCPNYLTVfQ=;
        b=l3HZtjpjVil5Ghzcik5KgOCO21QjknnqpTB6smQ43jS0H0qvQAEmad5eX2Q86diKOC
         SGJ7x8EqtinbUzo3nZUaxe6+3BRSocGZalkpeyZxP25KvtKpRMPrZqd0DJL6IALML4F7
         ZX4Bz2wOI7YtNj9bgzbMO+nvXJsM/g4IRqbbuDznBSfcWxiX3oZDF96LcMr5xbgFSPyQ
         vU6ddmApakl03lJ8Lf2koLfStxq9cQY4KiFeQ+A6XrkfRSKiHAJcL2hMwIQXCgCuZABj
         veBRZPhkT+KV/ypcvv63J0vCk2qqRvevSTaORc1pYtk7Thd+eUpQDhjApNGWXwWLAAuU
         FmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW57CZGgheUKhp4ZGKD2U3FxocH/BAR6C3cUUSxR1GKmmZY9ioGR7M7fhwqCKyw4URRQKJc/2ZzB+MvDBRjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Bku9awpTWlDh6Yd8cK2BoiAfCmwTZQGd2zLG0VPe/gQ/PepO
	ZPifyBx++0RbjaGquPDs3rS1hE/EvsIyWbEJe67O9YztGLtHUE+f
X-Gm-Gg: ASbGncs0jQR8oUnJ7vn6TFzc6sCytTtlDThUX3LiurCranzgbD6nsHZBTWxDWKnYxVZ
	zI98uTcV1vsF6YgAXo+3IztF8yr7bZz4RGk/pSrkgysjn5Fh5iBZW/syrWpSAdkPaJOsu4m0oik
	LvNGH9s4Lhh6ivhYzlLW63/0ac/FS+NLiXe+sNhoIVADj+6A7Y3FGdKNbxnZ6rIbX2k4ynfOMbT
	ntV6GWXhSJ6J/kZu86SIao5bgG5jP3VagI1WjRKQk3di9yJByhiqhF5uc6OXXMXIjWIp4dHWWJY
	piy3fb5Ds/kJfn62YY8Mz3utFhGZAhy/lw==
X-Google-Smtp-Source: AGHT+IEF+6FFvVmIuxk1MISOcv5BF4xk0eVILKN9vM5sXj6JFuPJooKQkMvDCoXx5Oq1Cpz44ra8Kw==
X-Received: by 2002:a17:906:9a95:b0:aa6:c55:739a with SMTP id a640c23a62f3a-aa60c5574a7mr571964266b.50.1733403596420;
        Thu, 05 Dec 2024 04:59:56 -0800 (PST)
Received: from [155.185.125.95] (wifi-125-dhcprange-125-95.wifi.unimo.it. [155.185.125.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dc95sm88774466b.38.2024.12.05.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 04:59:56 -0800 (PST)
Message-ID: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Date: Thu, 5 Dec 2024 13:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergio Callegari <sergio.callegari@gmail.com>
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
To: jglotzer@gmail.com
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, steve.lee@mediatek.com, tiwai@suse.de
References: <20241127231432.8112-1-jglotzer@gmail.com>
Content-Language: it, en-US-large
In-Reply-To: <20241127231432.8112-1-jglotzer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045958_864052_9652804B 
X-CRM114-Status: UNSURE (   8.18  )
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

John Glotzer <jglotzer@gmail.com> wrote

> In following the related email threads it seems that this particular email thread has
> not had any activity since 10/21/2024. Now the focus seems to be on firmware download which
> in my admittedly non-expert opinion seems to be not clearly related.

Since then, it has become apparent that

- The issue affects many laptops that fail to resume from hibernation 
with recent kernels. It is not just about wifi/bt mt7922 combos attached 
via USB, but also and most important those attached via PCIe, e.g.

MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter

- The new firmware (241106...) does not seem to solve the issue on all 
the affected systems.

- it is relatively easy to script actions to kill BT before 
sleep/hibernation and unkill it after resume, but they are suboptimal. 
Users will typically set them up after multiple failures to resume, 
which often means after data loss.

Would it be possible to (at least temporarily) revert the changes 
occurred from 6.10 to 6.11 that triggered this problem?

Sergio


