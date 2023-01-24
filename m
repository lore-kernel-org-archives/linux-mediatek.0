Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0845BC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EeY3mydnmkjq4oq4mpT6nBCvReQwvjW/TRWTsrG5dww=; b=doGkBKjUrd/nrGx0m4PqlGH82p
	2EOibpdxLIv0AOywmnQyXIj8g45B6zd3OnMt8szDAx3j8W9AE0fTu5plrZwzRy7ZVZS0LytWTxwW7
	6sY+/popaKSIggA7azzIB7SrEYiJJdYK84K6a4bwzF0VvWrTMjFddUTad9ix4SxC29WGtB7ss4iy7
	t93xrR0oBrpwYoafs2Lgdt5bEvBfGjsTqCmcHR3Bklzn05Eq/kZisPBNKk7dRKK8muEd450NeFuMb
	UnQ0GW+bf2JNjPcttk6ODrUICOCmUNrglR6EMCB+lpCYr7uJfAuuSlEVoL5bxm+8xjnWXjG5eFBfK
	J8DJJDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKL6Z-004UHx-Qw; Tue, 24 Jan 2023 15:20:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKL6W-004UH8-Ra
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 15:20:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso11200283wms.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeY3mydnmkjq4oq4mpT6nBCvReQwvjW/TRWTsrG5dww=;
        b=MiCGsTV1CJdTC7jL90S+sxYGtakI2pErlJNhp0d1W0tvmca1PH9Bu/qn20NtUTQCp/
         jqLZVl/ivQIp5AipalvjZ4FQLAl4qRhLcG6LcEblZQwi1Z2ld6WzKasbwiQ7Qikkm444
         7DU22+hZw0M8wjix+kt4tL2Ww+zZ+ogZVDQy0E6oFNu0U4oG/lIYLFafJm4iZPSdZvAY
         cWks9qf80d44kbpokQLA9alpTMu63LvvJaiVzBG2tsRmvYbd9V6m4Lmp3KLaNWTlBR+C
         rpa43xZzNXZDJlOemU/ArGstRFAjDIsTe5rTVW10FOfCXffVyRNLcJiSWpbN2KyN4tc/
         aT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeY3mydnmkjq4oq4mpT6nBCvReQwvjW/TRWTsrG5dww=;
        b=JxiDHUi2QqNeycUo2EuhrakCrgexUl8yYxWGZmYgdtFGANJTIvYpP4IkI+bj19Krk5
         TKe87y8UVapZpiUQju9EriQqh3cfO9jyeGm36e5oiGkngAOmfORWFs6HmVrxFE/z32+k
         QOPcTemcQUcwGb0FZmhtg0JGI/tkwmJd6wA4Bl72y/cVkvO3iTXiBeQE59jkGIoRJz49
         hfTrCgdnMkbr327iNgGx91b7IZSUGJROPxdMwubYrUmXgEnXK+/BSCc5BnsTraTCKHR2
         vHtrgPuTA0Wp1yLlqhX762EjJVVYBvejJmqiEvlJ64LAWZt3kHU67LBDzTTctxrnQOAE
         LzzQ==
X-Gm-Message-State: AFqh2ko5VuvArLztxcxk9aLc1aEt0QYqQz2YNDGQO5CQrCbD5Z9eHnvW
	VfrMX2x7IIxaTL5lwk9NY/2I40/xQfZJew==
X-Google-Smtp-Source: AMrXdXs/Y+wF+PZi2fvuaDGs1pENA54miR0u8XAmepmBDASjm/po6H3gd1fntTxSFbrPU4qVorSFlA==
X-Received: by 2002:a05:600c:1609:b0:3db:12a:5e65 with SMTP id m9-20020a05600c160900b003db012a5e65mr27772128wmn.4.1674573653065;
        Tue, 24 Jan 2023 07:20:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003db01178b62sm15608983wmp.40.2023.01.24.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:20:52 -0800 (PST)
Date: Tue, 24 Jan 2023 18:20:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bin Liu <b-liu@ti.com>, Min Guo <min.guo@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yonglong Wu <yonglong.wu@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: don't unregister something that wasn't
 registered
Message-ID: <Y8/3TqpqiSr0RxFH@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_072056_908913_E139C644 
X-CRM114-Status: GOOD (  11.34  )
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

This function only calls mtk_otg_switch_init() when the ->port_mode
is MUSB_OTG so the clean up code should only call mtk_otg_switch_exit()
for that mode.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Please review carefully.

 drivers/usb/musb/mediatek.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index cad991380b0c..27b9bd258340 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -294,7 +294,8 @@ static int mtk_musb_init(struct musb *musb)
 err_phy_power_on:
 	phy_exit(glue->phy);
 err_phy_init:
-	mtk_otg_switch_exit(glue);
+	if (musb->port_mode == MUSB_OTG)
+		mtk_otg_switch_exit(glue);
 	return ret;
 }
 
-- 
2.35.1


