Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE56ECD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=; b=IYFlh04QE1nWla
	2Dn2amvvNdo55QUAKVqfUroZGzKiKsG3pq0uo4Y4sRoQn2OMgtw6VkwZVmZ5sIOZv073ZZzYy0xaL
	NebMj7CADLJqVvsloFQVv5uTkQ+gBVA2SF99xVRPcPVnWaKKZjbFG2Uucswk5aLUOxh81SO2/0qv0
	auVDdEWvkkdptdWal1BHsY29EahNkU3IWAZ1TUZfsZmJV1OY/mkwOw9DiYLjZ2NG8N848a6TJ8CI1
	w45s++hdz32Y8/gqTSPAgfXGe85657kTa+VsTb+aSSyFwnUuD9fEGbJTn6F26cqaxiDa7/q9xB5e7
	5UvBObDNXz2F+iuMrAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qI-0000000AqDu-2syb;
	Fri, 26 Jun 2026 08:23:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q4-0000000Aq5n-3ccC
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c6c101aeafso3970525ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462184; x=1783066984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=Jmo2pUjwi88qMHUJ5qKuc0bavBncCld9kljDlWMz7eskrjNVnDs9vJbq2v82fThtfS
         6LxqErBQs+MHyknagyjrGS3+084+7pKEgyZ+cjX6HAI8Q6sSX2UxxyVp6xXZCgG6XUQB
         KITLIwBPxrSnusjMxpv5gNShIgGhmmEa5XZWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462184; x=1783066984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=dR4td1CI7fXW28KMr792RwGzM4scor36l7KbBWpD08Xdr72MPddUOkp3mc4uV95hiz
         vgzpv3UCd27YFl7Q7Xq2xdpX105Zw8rUxiI5p1ELP+NoG95fGTzHK5eznoRx7f9JI4I6
         QAE/GxC0BTX2yQ4NTKcpKu5ACTepAjspQLuOSXi+Br7RDvXAjOGTn+umwHJ6J2ZWRQ4e
         2UGx2wminhoiyFxkS8GtbxTtJ/lx5+mRzpq6YrhSrqjyI23xkxFIm0/e7l9uvRP1mfIW
         4FPC/zf6vS8KyCfwGjuczbMAhY4aklAja7E+/5xVkfP4bDYjxZeFIBFoWmPnqEc4iEl0
         uYOA==
X-Forwarded-Encrypted: i=1; AHgh+RqzB2sPxiUQeyGN3vVm9q8Dikjr2Svyc/QMZOthb/AG2v2wSDj3amGeOyRxPWb0JR+BLcmpZMm2s2PjSPWCrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVbWRt+xu1Mp5p9HYe0jqZ3yqOjC81COzd8p1XePuEnJ2FqZnX
	nWizBAA3zltEnP1lFB38NtDrF1poyfKpFT86N2Gb75+IrSJsSKw4SudmxfhVdr0aeQ==
X-Gm-Gg: AfdE7ckzgea6bfJyko2eCZrysgUZohmT4osZQQoe5i6fizmQl0XBKeFWgyc++cz2kaU
	zystlVoZvpH8+Ya3jk5dNaBLE6eVZCk7n8u5dhioYoxVOpS7vAUQgAV6mlYIIOLZYt6iugr1EFk
	F8n0X61qrFUu5nRcgRvOkyzXTwuUq9ZpbbGGItiC1cZw09goMkt+2d5CQgpfXVTtY3iDoBmue96
	y2Y2ptzaxrHWhOPQrjKrddnQnXcpWxHZtgAbmzzIcF0ELN/Tr/METDxMP/g8S7qimstlhN83DBg
	8qm3H98+Wps9Em7+Q+sn9uCBOcahZqKCxjghNBQeM6t7PBGf8iWfz/2HCmZSd7f92cFOxWR+qfy
	WUs3koptHoH9VNInneQ/x7i+ccwHHWgXLll6qlOUJmIuQKgg2gHofFa5GzNak4W3r3S3cjMexk3
	YV/VdCXaKS+gYy05C6TF4MvRYC26Ru4t3funR8bPU1zbDXyu3YF402V2Q70jR9VyWMhkXl5ww=
X-Received: by 2002:a17:902:d2c8:b0:2c7:e823:6834 with SMTP id d9443c01a7336-2c7fc657e3dmr59806355ad.8.1782462184290;
        Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:03 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/2] usb: mtu3: condition PHY wakeup for host mode and runtime suspend
Date: Fri, 26 Jun 2026 16:21:52 +0800
Message-ID: <20260626082218.2750459-3-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012304_965402_32515374 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Host bus activity during gadget mode system suspend can trigger
unexpected system wakeups via interrupts because PHY wakeup is enabled
unconditionally.

Improve the suspend flow by conditioning PHY wakeup setup on
device_may_wakeup() and restricting it to host mode or runtime suspend
to ensure proper wakeup handling in gadget mode.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..b4f4c776adb9 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -544,7 +544,8 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
-	ssusb_wakeup_set(ssusb, true);
+	if (device_may_wakeup(dev) && (ssusb->is_host || PMSG_IS_AUTO(msg)))
+		ssusb_wakeup_set(ssusb, true);
 	return 0;
 
 sleep_err:
-- 
2.55.0.rc0.799.gd6f94ed593-goog


