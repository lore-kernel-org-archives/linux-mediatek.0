Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A41F4369D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLBJQur6L6abrgINbvpQqXST9x1YXfxN6XkkI5ZCGzQ=; b=N3OZZcYGRz6I7byORpmJC5emeA
	8ZpHWhFiM8FvjuZomJca9W/uPDtgO0pzpc1TpWFGy3X/7ip38eO9bvo//OxgJEEgfQRFSkLiFSPTr
	u/YW5WwZvjfBFIyUcxb6EuTzyr7Z2yM+xymx+lSs/rlSzxG4ru6GE4grzTlG9JBPIzpGN1okQL44/
	/Y8wNsEYcs8endpfGsgLmFPca03tyTmjbkCYsC6jvkMTAr9dWZcErqEwQ9+W1iGBxNophJA7Qwe3t
	4/6+JSkgP2isb1ZIQ2Vkoxg9kKGJNL1OmxKIwZwJK5AM5eid5ckLYPoZLb4xO6ugr6PNL5moqYGLC
	Yl4B5YBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyp-000000044K4-14KZ;
	Fri, 17 Apr 2026 13:11:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyl-000000044Iu-3JwP
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 13:11:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d77f60944so499497f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 06:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776431486; x=1777036286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLBJQur6L6abrgINbvpQqXST9x1YXfxN6XkkI5ZCGzQ=;
        b=KpmCqDu18xt9n/rw8TgE4n9+DLYb2YSWBgKVNfTOOwhEBKHSnUYUflGeiwr0Zo7yuA
         zDWhBsJv+1JFWPtteLB0KbupZ6MxDXuE0ofSL+XZSYn1P5obaFSHzZEy1MdF7cqYUKrT
         hUaO748IE/TKeSXJ7E3qr2YNB2O+sI/UfHtowwBgB2NgW34eVPK0Mnv3skL7ToM3M/Pk
         rNToznsz0fYHaevjVapsbLVEjEqZWLNy1o+l8rhmyC2X+9holoo9d/ZdECOK/76Soe5u
         dpW9WD/m2psymGy73+7LviOCYrTfn+GRFsJwTD6s02wlVYZnjMy0OYTYU2FJN045eR0C
         CMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431486; x=1777036286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLBJQur6L6abrgINbvpQqXST9x1YXfxN6XkkI5ZCGzQ=;
        b=j7SCS3zSCR6qzZ053rDx2TkfIdVTzxGX9XYzlgm8e9OBRCPKoMkKBCsQtPME/frjzE
         vlRXzmGbr3EzaY/4OIPSiB3lKpqlcusLWKSqBGMaBonydgYtv52kIKkE61l6lshfmcPh
         9MlOAS38QV+ObDTBM+qjWXzcmtMqDvk3tr65qIShl8X6gjC4M5EHOO8Bz8PhHW5xBVOW
         zl2//D32G2ePuIdu7z9b1BijcpX5CHzfaL2TJQtsmRpGeiDQxeBeqdzqqhfiJ1zGnOh2
         DS0VmkFe6ht33b8r6z0xvF4zws7Y3UuNNU4emkqvtxGU0aVWMw8Fm7Jx4MOWsQFL41CH
         Ofyw==
X-Forwarded-Encrypted: i=1; AFNElJ8LMA7Xovd0fGAdmfQO3NG+ww7Wa+YT0ySKHIOTRtRvuaQwisc9VrVC0++gilYRi3Pkcwofh0lNKhuV/y/wlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU7tmJVDBwcgxXInjrw7iBqC0nU1m/unx8dnDkIQDlrO8BtQpk
	ovtooy2opU2wW4r4Lf28CPryoOkOyWP+Q7lR1zZqYSqnBNcVHtAGx2EwUsUxSbjOZQ0=
X-Gm-Gg: AeBDieuIBrnh81CxWTGN+1X/l1XXUyEhsTxPduUg+81JI7ASXezaunSp7K7IY1btluC
	eLNiXZQCfoBMgRDrOvTT0SuYz5zzHKMrr8QijnJwWFfaeurq4shc3TpX/OzfEIaM//evqAxJdsA
	mJpeUcUedcUDfgolQPyAfLD1TeUH0VHfol7Dw0xDaP3Nd41DBdM7ToAtOMi8w6LcoyquWN4zi8H
	ZrQEf1cPGYWb8pbX+AI1UjQoHM8m1eI094Qkg7KK5w0z3JiQeA5XQcvIspK2uEZtxoqHQ/HNRYw
	3ERLMHiWrIBGfhncgRZY39x9JULBVclxAc49xX0Sg0T2dtdkvS86IKov8jSiuWeYvc1hmCIQyws
	QK/eX+zbDf4i0W65D/P+NSmr+gsRlPoa4K1NohYEImzFj5fRJsweFVI1W30CTx5rv9wllhHMuvL
	XufrsK/FNcBQjCs9wShWRpkcBgqfgPOclEn7QNjZT164DQ1bfqHK0EJKohiuHuXGWBpiQskCsJi
	DM/DROuMo2smTbcUrarIKSH
X-Received: by 2002:a05:6000:420a:b0:43e:a69b:d813 with SMTP id ffacd0b85a97d-43fe3e0d459mr4571980f8f.25.1776431485775;
        Fri, 17 Apr 2026 06:11:25 -0700 (PDT)
Received: from localhost (p200300f65f20eb08db61cfc60d8aa232.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:db61:cfc6:d8a:a232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e4daf2sm4238766f8f.33.2026.04.17.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:11:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-mmc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in sdio_driver_id
Date: Fri, 17 Apr 2026 15:10:47 +0200
Message-ID: <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Klkglyq/jaqn07LVoY+DygFKlFSeY4mf3uyDS+66nUI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4jFZkxQbj+KYt4Q9fEkJxuokeQF4k0Z8QVO3Q 7wAQaupW5KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeIxWQAKCRCPgPtYfRL+ TtZtB/0YGCqVt5rVpLrWqCD44F5LfNFUgv/+TGPxayzQfsH7zoCBqE9UgsVpBkFZprUwAzLBPWG MPbj74nUaxJfky/T/6x/bsJ20CXFl14Aky5oeSqWXwpx/STsvR1t7BH1meFZ1chEsexFTdIwswa 8F2lrrBsAe+eGHk4UdYwOcEBLke8MRKu7X9WInf8735NDYlo6VkX6TwaQTxpOcTlNIDfwZlA6ON nlrxK4GTkQYXCmaFZYylJBpOTDYLdH8GJZthPQhYPW5w9D8jVeVUIanYYaSikHt0R/zyWaylAij O7+GqKklrjT08jMFR3/4DzejRKFhjlyBUA+HrbH74dCapvBS
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_061127_853889_410BCEB4 
X-CRM114-Status: GOOD (  16.13  )
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

On all current Linux architectures sizeof(long) == sizeof(void *) and
this is used a lot through the kernel. For example it enables the usual
practice to store pointers in sdio_driver_id's .driver_data member.

This works fine, but involves casting and thus isn't type-safe.
Additionally with the CHERI architecture extension there are machines
with sizeof(void *) > sizeof(long) for with the traditional approach of
storing a pointer in .driver_data doesn't work.

By replacing the plain unsigned long .driver_data by an anonymous union,
most of the casting can be dropped and it yields a working solution for
CHERI.

All users of struct sdio_driver_id are initialized in a way that is
compatible with the new definition, so no adaptions are needed there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mod_devicetable.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b1725fe9707..0eb5d196f5b5 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -414,7 +414,10 @@ struct sdio_device_id {
 	__u8	class;			/* Standard interface or SDIO_ANY_ID */
 	__u16	vendor;			/* Vendor or SDIO_ANY_ID */
 	__u16	device;			/* Device ID or SDIO_ANY_ID */
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	union {				/* Data private to the driver */
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };
 
 /* SSB core, see drivers/ssb/ */
-- 
2.47.3


