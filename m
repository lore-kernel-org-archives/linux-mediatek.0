Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03178C982C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=; b=Kfsn6ZE8ywKb/Gcc2vIQNTKB+f
	tEYYC6KwZWm7IKxfIByBgz25pdQkQygnCPJm1knu+zEZqPfb+X9j3lxcS8NW9jRZ2k9AkT3UJiMw6
	wgHvKsFa/BJAv8SFzhdnAKXmygsoqIrBJ6amSwLCs+2OHEOHPLH0agkOKr9TqlJjMJmX+38gwyvRC
	QlbdY8Y60VP5QDD2+gEv7F7gTuILK4EnLeGn7zAV9u/ThsgfE2cp1fzH27KM22qLWXnfFHsPPyRnv
	yG9WbYBiJZ9hf+kD56cU7r3XPG3whnm1B4NpihYp5RJJxk29ZhtdLN7OffMuDJhs7M0wM/2a1k13L
	tsT4MLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4E-00000005is7-3LWV;
	Tue, 15 Sep 2026 09:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4C-00000005imc-1Fwe
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=; b=VxtVt0bito96j7oxWrW51IqRWU
	s05HvNWuHf944v2DYvSqpMjW1qxEi6Xvy2suK8bk0Jg3OiWr7DPm5r3gvLQE+o7VIdKZikYX2wP3i
	jtAH8eDrFz2awUOSAeneEr/5rDIPmpKJBjwtPahbmZq27nw6C2DRn1o9J09jeqQgAZaZUoNAqtVMm
	qsD7lPWohoxFdbcNvGV4L4O+6Uk6jkOEbnb+ZvT1pBaAv86tYaNx19rpTaQ4ojmc89qwSNIPOh7l8
	QixbCPDs7yAuyNZ+wOqbPcPPo2WCY//cuJzCxZBsZZhKin/JgybjbjtkkwiRfCJkH25jdZb6Z5jzp
	/8B/k/cQ==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P46-00000006TEW-0IsO
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so3886472a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462976; x=1790067776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=bNCkoKpjzA4UUJrBQtvjgiiUi7/Y+giTucWDv7FVdW1pRIbLBZCccIxYmcNxPapiI1
         PngViBUvC2DGSnyQMmGCrmiT5ziLMgT5BgubgnClzc/9/u9KpolvB34XcCeT7CB1k6TQ
         weADmHZ3m6DkMCBtmncg3+yAa+D6rpT/Npqyv9obP0cPqlJVOLo3cNHQY6vgtuGtFwKO
         ENsedxFT3si2YFNhW6BKAAOB23VFMrEfWW5/k98DKueeYczlUIbthQWDH/kTp/Q7Lcw6
         a+6uzIVVxVn0s1JKM4b+TsgbSRUcmwjHJzW5eRAwiKNiupf0WR/YS/alyEzSm+KyQSnS
         l6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462976; x=1790067776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=2uajt8jwAOxZGiGoCQ9+GZixv6mFPmD3o9flsFzbaRFR7LHq+OgGG84UBbWHi9cDWb
         H/C6M3ZeRXgqpKRFjSTLg06BHaWuhT/ovIOEmzZLfSX4uPvn9XAkaeJFz9s/filU4ErN
         gb4PUWJ1TmRup85huBUWK7P5zFFaKRX2ATJdNzql6j2Cjdjnt3jGqxUCllWph7ek/5Af
         T0JiX2EVGPNlrtf9jml9F3hU+1r42xNeumBjOEToeK5gcT0j7xKLyXHawLhZWCIcSi2L
         YiL0Z6v4Bnb9yRvXleUY3EBovi6/XblAo6picO5FPmbj6QXHKW/TcMwC2LdKVmagewx/
         /jUA==
X-Forwarded-Encrypted: i=1; AKwUvByQrjbYfnr0ypE9C7DHE0pR2R+XfeOwt3sa8r6qWL6sfwehqlA+m3c2fm3kv8RLGFZCHKRKbtgvHQYfskTT8A==@lists.infradead.org
X-Gm-Message-State: AFuF++lhD8p9TMmIl9I0+e9ZwxrjfOnlAV/eWeS+oGE+1KTIUdWD8I3S
	jk+1W2lOTtTgjbrljnl5apjWEFvo/MH5KLQqLfSPE1SOQjFjJ6FmpMfN
X-Gm-Gg: AYBFou1eCHBpjg9YdUiwhsLW7NydKptU3Tk6tBT4ZWMomAawYR5BOXc5k5F9Y105sep
	gfxiPhJpdxOwUrBtsvihPxmsciwr4JJzwBhxApaQmxVcYaX8HV0njIVv4uOzT7X9AvzZb5kBzK6
	7jn3YTEJnN9xZoIqLK2hfFcd+ZQssToqIyo1HUcYGyBH+/Kl27MPCKqBkhL0TcIJedwgXxIDbIT
	olCzHo7169ZcFRZenl5oLlek2ntbIX+WK13dKBw4N7GbLSrQjEcpWw7uT5L2tKdkm3ovNP8FsDT
	2eKqG20HrwavxQeduMAg5YT8BkgsDjF+HOy4Jwqr809Dmtwr0GXU0wClbLXwupBqTtl9wNPZ4nP
	WJnOkDqv0VPiCgUtosZdeeI6YXErNY0lkW9aYHQ3wo8JlGEbnhZERZgqibGZ0NYA1gzn+Ictxow
	yjdLNuC0Af3hqajJTf3jlxVGsYg5KwI4h2kIOyHfdpbrjz1m8Ut8fKi55nROf5SlrsaFqBqYHWD
	E3XNJoMKlWcWxWX262X68DDNyDYvxl73FUgAXSlX6BOA7JwzJy6Px4yfoHloTn6PysQvEvR0tjY
	tz42OD73VDiVzrP1HAY9+Hw1mJBkGw4G5H4NfHHcMkwVQHL4W2WmT+oW8E2sUv8EFh+N8r/nbNi
	lwxfTaiGyVJBybiIT0tgBsctyE9tmB6RTjKNo5q24E7flr1IY/AbGepDhWaRn1IHZAAccCq65Mh
	c1rCvYBuQ3OiLSvxJwdr9CJoJnYDI+9nAJ7Iy3tZPdcnA+/vedA2xbMumr20bK7RLAbchDWoDmS
	+Ko07oXuzE=
X-Received: by 2002:a17:907:720d:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c29b87180e1mr401204766b.42.1789462976048;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/6] usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:19 +0000
Message-ID: <20260915090223.1346-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100259_737605_BEFECF7E 
X-CRM114-Status: GOOD (  10.58  )
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

The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..eb483a267bf6 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -700,6 +700,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 disable_pm:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -731,6 +732,7 @@ static void xhci_mtk_remove(struct platform_device *pdev)
 	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 }
-- 
2.47.3


