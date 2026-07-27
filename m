Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354ACC54F4D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfLACjj/JtfamMOkw6Mhzssh5fvxLzMAEBMiHp1DPTo=; b=n92jX9P/verFN6t2cjOauypgHR
	8cq4XLSitDZ+sMIW/ptWGnCbOLWZrvY9d5/TqvSmMABJVDS/5Pj13vmzKW4qTBg0okucfcf0hzVuc
	U6QSSU/4PKGo/lVs9pH0OE9ADQhRlWuaVHs4Hx4L5Bh35DX5K5qoR5S1C7E3tthDzsCBxjw5Qp0W5
	WU8RGtElKWp11Pa2sukpS/lC67nbiNyTYRxysZFiKBliok5Ju2sA4jcDRWsQSdaN94oiegpLEmwj2
	VleO9sxQ2xviFJpy5syqqlkF1ZIWwQ+UupHKZEBTsR1QGX9+LID7KaKjDQp7sWDe5YQ2fvVdV+79y
	oYPkXv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBc-00000003KAb-0VT1;
	Mon, 27 Jul 2026 16:28:16 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBa-00000003K6x-19U5
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:15 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495501e57beso9762265e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169692; x=1785774492; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfLACjj/JtfamMOkw6Mhzssh5fvxLzMAEBMiHp1DPTo=;
        b=L0nwMCSFn9osLj6BAswd5SHTO9+Tk4z3nuil3NTy4gzLHpc/GfRz/RLOxEpuVSnyc8
         mNxdk8wfC/A/kucxLcCDnvCB+KquAQbXf4Ra2n/JF8OuPW+j1DBe/VrDZDM/Is9yKp37
         NVY22xPrfA+nC4/qAqAuoGuNOrIiA7RRyU0vpGiJ0Wso7D1z68j0ap+1OOaSP6hhmERL
         Njc2z2gJXsZTV7JZSo0iHry4WVsBJT/zS9KU48AoL8EDS1S7QCDWltmvNdQIhYb801Du
         S4Wk+4jxF0D8KRF41AmNA0RTtA6+Tccw/nygF997mzulURdtuqCm2T6ly9DFOo4+hNuV
         kP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169692; x=1785774492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfLACjj/JtfamMOkw6Mhzssh5fvxLzMAEBMiHp1DPTo=;
        b=LbxkBHed6KeoF3Fmjql1FKb99j1BOaNo7kj/Jv8l3uIhq6FWX2136A/f+hd3Z5xBvM
         DcFCBW0seNnToDMtbzxwRBdq0iKhCFc0ovJJAQk/zWJF2Wr5V2tGI0pYFrjDvnnap3UY
         rVx59c05Y4lViluBZIfA6wh5VFdg5IZnFY723mhGmSJ0A1aqJ8v5A/4ACCZT9kvsJQRr
         KA1IIuN2WKzhY6C2UREzGnAxuOTeOyvUIR9O4YjaVXvXO+KvCDaruL+xB1Y3fHj/ZhDS
         dYzyzUGBbPQDiLhJlOIbKIgLAahyDIcxgXHd7IT87Jxwj4fgW+WE8w3AW9Yu3X0uGWGc
         Zu5g==
X-Forwarded-Encrypted: i=1; AHgh+RpoRqYHHh2mOIG+YKjy+s6zpoDj6TNJNjTB8hr0szkmvDNm09UK9GEW25P26ohG9h2bdf1rdZTk/bJXBVLF0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VuRT4YEJ0ExjM4sq3Hcmy7ic/JRIwiBypaP4hUyvAtmLK971
	DY8smJro5mKd06fm/8Tz1m96XWTg/TNqw3IZrhd60M9iVhk1TrDZpwho
X-Gm-Gg: AR+sD10eVZDumF9+59mI+dc74vZuS/HA9OIUL8pO/yw3GTtayZfl8rTF65s4HWoUW73
	XiI/mYerADSbyNLB+tMMWq7AjVNvOLRzhkgir/j2D/GrnsbUMF+yMThPd0OB82E/4k4/XD3qegR
	DFBEtAhvxm5nnKOzjzKVJNws487O4/jMmLDxax/xnCBccbA/sGpvC9bmmg12Urwlgj9SiE0tC3S
	Kj+Q9wFKlOR/Hir8g62Me0r5h4qR2E1vpOlKOvaQLt1oEHzxL00eaNI4vP2QJLOr28ymyaOQ9pB
	IqaQGtrEaGTKzWIfHWF690dGukiY9nM9cDcMvaxtiD9AklSsk/t9tAd1COJ+HH9jmu+U111Tr0q
	t237CjMQsXazIrH/wnmeY96b1/2aHo26U7o8BUuft1vV3CthfErVeXbt9ZLGLCV3E9+/RS9T3n3
	ofosdFL5qgnKxjr2MZwLJg/xh4DpNsxFggsuX1BkA6eTSSBjDpJLweQMPni40Sn80i2jtTyH0=
X-Received: by 2002:a05:600c:530c:b0:495:62bc:a022 with SMTP id 5b1f17b1804b1-496b56f99a7mr126331645e9.13.1785169691677;
        Mon, 27 Jul 2026 09:28:11 -0700 (PDT)
Received: from fedora.fritz.box (dynamic-adsl-84-220-246-20.clienti.tiscali.it. [84.220.246.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44b84edsm5878205e9.5.2026.07.27.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:28:10 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:27:53 +0200
From: moosager <moosager90@gmail.com>
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: mt7921e: repeated driver own failures cause hanging
Message-ID: <amd7c3Xk6NhBQr9x@fedora.fritz.box>
References: <4870974.vXUDI8C0e8@fedora.fritz.box>
 <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092814_331932_7DD273AB 
X-CRM114-Status: GOOD (  16.90  )
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

Hello,

On Sat, Jan 3, 2026 at 8:10 AM Sean Wang <sean.wang@kernel.org> wrote:
> Hi moosager90,
>
> Could you please share more details on how this issue can be
> reproduced?

I have found a (somewhat hacky) way to reliably reproduce the issue.
Just run this script for 3-5 seconds:

#!/bin/sh
echo 0x7c060010 > /sys/kernel/debug/ieee80211/phy0/mt76/regidx
while true; do echo 0xffffffff > /sys/kernel/debug/ieee80211/phy0/mt76/regval ; done

Running this script results in the same "driver own failed" messages and system 
slowdowns observed when the issue naturally occurs.

I have investigated the bug a little and found how it manifests in the driver 
code:

During normal usage, the function __mt792xe_mcu_drv_pmctrl writes to a register 
like this:
mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);

and it expects to find 0x00000004 (which is PCIE_LPCR_HOST_OWN_SYNC). Instead, 
when the issue happens, it finds 0xffffffff, which does not change even after 
the driver attempts to write to it.

In essence, the above script recreates those conditions by writing 0xffffffff 
to the MT_CONN_ON_LPCTL register (at address 0x7c060010).

In addition, the failure of __mt792xe_mcu_drv_pmctrl returns -5 as an error 
code; this is not checked by the caller, mt7921e_mac_reset, which calls 
mt792xe_mcu_drv_pmctrl without checking its return value.

This issue still happens and is still reproducible on my build of the vanilla 
7.2.0-rc4 kernel, as it has been for every past kernel version.
This is my best attempt at investigating it, but i believe it is ultimately 
down to the firmware rather than the driver.

> Also, please confirm which firmware version you are using.

Here is the firmware version reported in dmesg:

[   15.848101] mt7921e 0000:62:00.0: enabling device (0000 -> 0002)
[   15.849369] mt7921e 0000:62:00.0: disabling ASPM  L1
[   15.865381] mt7921e 0000:62:00.0: ASIC revision: 79220010
[   15.958433] mt7921e 0000:62:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260605203307a
[   16.352504] mt7921e 0000:62:00.0: WM Firmware Version: ____000000, Build Time: 20260605203411

> As a debugging step, could you also try disabling PCIe ASPM and check
> whether the issue still occurs?

The issue happens whether ASPM is on or off.

