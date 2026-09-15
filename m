Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B525C88E73
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=; b=4fgjv1O3JuQc0Ve8EHygc1d+4T
	EdkAEy8XqjbPlj5t/oYo4qia4O9A4oorC8EW8LMWxXD7jy1d7P+4LSFeSlaqmGV9OjN+tmhiDwio8
	LxyknAFLVpgvQ+xeRMA2tZ1Lq/OplO7/Ey0fE8nJ6im//nsiYgVUP+vcM7A5EFcdg07mGukf7EciY
	ff+nP+LOGVDpY6psEurHqcWy3BV5n5u55HAF9ZOgpmtfSXBQuQCtZMRt0lvLSFFirzTwPmWcOJvYT
	wuKcVZLxKiUwhDWv0RdwEu0/sTE9Q86MWFQqJVAAnrv0Q2ifC25irnWnTG3XzwtvXBWgsGg9iLes8
	bvkdpRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005ioE-2B0N;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P48-00000005ij6-39jF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=; b=VVEI/iMmE/kzcXWeTfG6Yybd7i
	hIFt5i+i+KjT+rd368XeIP6/Bd2/uSNwAXxzeeRVCRfaUMs4kuGw9IUno8u1IHAFUgfbNcUdvJHvt
	mWVxoK9GqI9alQFtfW1jzlK1sT6lIBC6aQckFVOVyLgEhVJHZP8WbTpiNcS2LVGzWfd7QkGYr+htO
	o5A/04c3ztHOJOlVfxP36f5LjKy6LOHn+gVEPACZm6ykNQ7vnYgk1NB9N5XTGAnhCT9WQRNU2isCK
	A/IV5Y1WyKN4qmxdT0Ow77KfcVdZ166u7kvzAPalxBq5WNzcvEhEIstYuDklbcnkEzdQBjfX4WjxB
	CpdgF2HA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P44-00000006TDt-3Md7
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:02:58 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa65080so7054366b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462975; x=1790067775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=VgjJbtid77mNy6RbJe500yzJkj8KlBJTociDeuQFhIiSbp4MnBqGVuDctOzutL/D1D
         gsRnDH3O3YziEIMC+kwfHCg5W8HWzWvaa4d9jWjjmuzHXndEXWQ+CsosF0HvCUT3Px0T
         AFt0kfz3/3b5octlRQu5Ygt0fjWaAm7FcXdz/B15AZ+ZL8iyjW/DUJeOpGPoRWjBN7YO
         77IEQc0KwqLK4k5rGPjtyzUBtwRERQU9tdJTDvmRzv95spU/Puk/DL8wmmcbqqqZ+z5E
         2qKEcjPEZesZlwHTMq2s6hlezgJ/rdpmWHOHJBgoce/62HUiJ8XczjlucjyennS/0JdS
         oRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462975; x=1790067775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=n2kaOSH6gBwon7EjHTqd8UkH0VtcXOagahy6/CB9HObbt11Fh/i8V5rIEuH+CHkzMp
         OX/sHcyw4hfwREj0+xmH50xDymY0CDRXFFH8yZxk3chE+cPEDzjSRD8sZBCLGttshj1k
         +JHY8Pen3GZVLarkB2BzXsHtmoDtT3bjh1CdZqo083FWGQ8vqLfDE0nqzpUybA34brCU
         BFh7Ef8ClOrAx+PjuyRjMLwwsOHky+5NUtkfV0o/GGz4xIbgCDarOUaIns6TTO+UQNkv
         84wusOJUTRI/se7uuJggZhZmozKGdW7dLS7sGNfs+1kRwwFvbQ5PyZYGiSTolVfI7kD7
         l8Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzcFrWMBl8tY1Z9j2RZOTEt9UL0TUuzdJbEi3wJTo62hqh49RSJe5+ewKi11WpIeWc0NBePJNce7eZ3Fy0kJQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n9TQHdDNUC2lpWShyzSOQwv6eNP/mRh82k0TYHBVSltaZzt6jd
	hb27anTvFoRz9VGODObM6t8sb58FTypquQBPqVJZlGEuiqWVfB+tSHgw
X-Gm-Gg: AYBFou3w4IbqJCDSeBlBBVcOLkzreaPyvbyun9+lxskg969/h3LTrl/Uj9xhlzZ+151
	3DZaUzsNAuaHmjCbgVkU697YLM7kC2u0ekLfUwx0qdZAr859Xb4omc60oSzIlgBwBvc3CNS8ZRN
	Gtv0pjlGMdieMlGqeQv/SY+KZVozUFVPbrWcSfLv1iWQOMeMTQEim4d1FcLcdHqWkHI1sfcf5Uj
	feZQPSyqnIcXgiLE7J2Gz/+W/39DblLn11Gs19BRjdvyWRUTTqlCoqDhgZLRCEj1QmDtmPW988Q
	7NERlb+7E5U1cCmHBZfoPOc3v1/UNSG7Dew3biGIcnSdPrrZwsWImH+HVkwWYKtKeAy7iMmc63a
	rOKlujChLovqsD4zCTnK9lLiB7p9WX/2O8GrY56oT6cPZxIDfVSqZ6p116Jgwx96LJR7k0FQMz9
	hglyNoGuZlktaF/W7xACx4ZSIX5F2fBSFxQ1iyVQmU8WdagDDa80sYVL+rzwvxuvnvrgLllvcIW
	NW0XFQ+NJKCl2Emmli7gm2VhnnuFVscE5QrsQ669h7vsvScyM+D9BaYOVcD7Mt6R56bghwpUe4W
	FMw8xnEVy55Q62BVl4raRd5itCgqB8e2Ln+LaivlRw6zaUiartaiCLOYXZo13PZRNMN1ve/u5hz
	WKJtpH7HakrTT33gSWDdVOH8aBJomqk7O8/FXpW4t5iMM3P/bsAVr7VEmVF2U9LvzkAT/XZhKGR
	+4FZ9vv7LQObTZAQUOgjjXp9qS5CBGFXHBNW2x6ODAr4uFrLaDwKLEMBlpKg+qXpSIA+z0+9Q3E
	8K13FDuEoQ=
X-Received: by 2002:a17:907:948c:b0:c29:49fd:c98 with SMTP id a640c23a62f3a-c29d7926fbfmr13664366b.32.1789462974448;
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
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
Subject: [PATCH 1/6] usb: core: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:18 +0000
Message-ID: <20260915090223.1346-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100257_202054_99C2CF2E 
X-CRM114-Status: UNSURE (   8.56  )
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

The fail label in usb_new_device() disables pm_runtime on failure, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..dec6d5c49759 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
 fail:
 	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
 	pm_runtime_disable(&udev->dev);
+	pm_runtime_dont_use_autosuspend(&udev->dev);
 	pm_runtime_set_suspended(&udev->dev);
 	return err;
 }
-- 
2.47.3


