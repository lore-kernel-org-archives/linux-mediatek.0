Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7153DC79F89
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=; b=4T7zWEbiUye1mtU+RgNXlmPC2r
	GwDkzXfV0i3NonpKYgS//EL6rDI/JAulHXWiH/T+SCe4fDjypJyk6JZl/fFv36Zst/Kri6OA/1mtU
	YMzz9oeukimwtkSggwppa53G4G9cY+pLzBAyIPWAFrDi/ozOUSZv4o5XRfR3f8mt/zAOCvdedEwIE
	Fc09gZQGVqbOEPMKbHaQOvL5IGvcWDrR1IcPRYldCH/h49BY0iGcy6F9G5ezj4w0YyyktmMDg35rg
	lL4F8PNveBG7NsfTgNK2Bu/t1braXGnwq6Z8Tbrmmj58hrfzj2eOqFXyDzGskrYvhpX5aFQlxtfwB
	5VWYBTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wxp-00000002ksJ-3fh7;
	Fri, 04 Sep 2026 16:40:30 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wxl-00000002kqH-3mCk
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 16:40:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-90e7d9c747eso16189366d6.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540023; x=1789144823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=lFQzTKY2HzpwXrfP1OuqT3/XLyz8QxJa6+j18jZYAQEdsvnMlmrPZTNkCqkQLpx+H/
         ORpbLd2AFtsC/G93iAe3gyAD6Yas2NzkZRRCMxHAqk20CENAOEDat7wNyjWfGDh85dI1
         oIseyHnDdJIGAd3CfJliPa2Ju7SJkvKQtUfxeY9E54t/aKOrP6nmniKrkPuL4JQ7aydX
         1DSKFXZJ4FB74qhY02OVpF5t6Es76H3+jwplnnkt28w5peTV2kTCu31kY8NgkuTfiiNb
         xD52kKhqbQOlHiM41ZZqB0azvHbXr6u22noT6LPqzlj68joSofcrmXYZfIPqKvbce7Rh
         GnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540023; x=1789144823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=qXz9O616buz7yXpjKAe11cxloyOgV2nvfx5CEwra5xK7YlZM2sdcI02c7S1MGzTYEg
         xnd9Sn/eYL84RoWOfuUu4GU4GeW607AIrkdwkSVuU4Bm24a1xPIKF/+zTIIYnfjMz1sj
         3/SEgpAKHXfmw7RCSuTSg1OnJphQvrvZB5hnk6fX8sb14SuOtJXTTc9siO1XH1ukmqVz
         ScRpnJcaBmGr4rXjtxAAuIX1VW26I2SLtGCUokCBaaditqXoS4VDIduJL3l94MH5mNnR
         1uvXhEldCmF1cZa6OGVqZ9gVdXfPl2qip6g3YHShGPfd7Ew9sIRvw6+zOIrHMhMIyCPh
         8ZWw==
X-Forwarded-Encrypted: i=1; AKwUvBxrNd9YYaCuu+68Fc9iR6bABAVz84WhIomUk6waUOxgCwIm08M4QTQ2hZC/dSXA2nY6MOo8rQMkbyjpq04MnQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lI/4rl7PmDodk37r7wIvVY4fr29GZfhCxZf15w/HMBtX+L5sk2
	/sNxmR2wuJrakLLB5zJa5rgHqZRFlAzAAW/dJgcZnMQNNlIld8HelhVeleuKRNeucg==
X-Gm-Gg: AYBFou2LPUcT/kM8RnhdUF/QKSoZFVEGsr+DHAssdu6lpBWfd/cgnLXvyGzpaVqy0kz
	wnAv90ITl1EJ8KFplp+4MMCfJo4hhm9/WU7ykD+GkrZdnP4O+J+UPr+GLNaPvoCIZboDFDU+HXe
	hVA0BSkMpxOw7vzLUzsHpOrsB6IjOrR1JDUJ/AleboVkRUgh6zMlDiuGUDuwIGzgZjAfck0TlP+
	WWW6keM6hDJqLNfKmzF3mu+0rEnSI5aBkOEMEca2OWDw5BPPDv24ta48S2AqB+2JZyRnrNGAZmv
	pvjZXAPJDF3a13qLHv5VoUW/ksZ/cz/Y2tx0DcYgLewTHB9psZciOsFd83dUK5Kz9u2KxwRujvw
	mj1T9EHtSqL2h+UwiQdibdlP3hKeiKe7S865l6yTc9AcEWx0cdN1IuNGIqR4OTNBm+0FVLC9afe
	xIafm0F4vn1O1hxl2u+IIbhvswBwZ13ehkNFziz0GFY3j74+baXJ8pQID+DGzelQ==
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr706361285a.16.1788540023360;
        Fri, 04 Sep 2026 09:40:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm246420885a.14.2026.09.04.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:40:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:40:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <6bc3c29d-aa38-4e59-a4f5-2c480ef9c748@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094026_198706_9B55C481 
X-CRM114-Status: GOOD (  19.00  )
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

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

> diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
> new file mode 100644
> index 000000000000..00f7500af336
> --- /dev/null
> +++ b/drivers/usb/core/port.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * usb hub driver head file
> + *
> + * Copyright (C) 1999 Linus Torvalds
> + * Copyright (C) 1999 Johannes Erdfelt
> + * Copyright (C) 1999 Gregory P. Smith
> + * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
> + * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)

These copyright notices are entirely inappropriate for this file.  As 
far as I know, none of these people wrote any of the code you moved 
here.

Alan Stern

